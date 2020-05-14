FROM centos:7
RUN yum install wget -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install git -y
RUN  wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN  rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install jenkins -y
RUN yum install net-tools -y
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
ENV USER jenkins
EXPOSE 8080
CMD /etc/alternatives/java -Dcom.sun.akuma.Daemon=daemonized -Djava.awt.headless=true -DJENKINS_HOME=/var/lib/jenkins -jar /usr/lib/jenkins/jenkins.war --logfile=/var/log/jenkins/jenkins.log
