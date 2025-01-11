# Use the official OpenJDK 17 image as the base image
# This ensures compatibility with Java 17 features and a consistent runtime environment.
FROM openjdk:17

# Define a build argument JAR_FILE, which will be passed during the build process
# Default value is `target/*.jar`, indicating the location of the compiled JAR file
# This allows flexibility to specify a different JAR file or pattern if needed.
ARG JAR_FILE=target/*.jar

# Copy the JAR file from the host system into the container's file system
# The `${JAR_FILE}` placeholder is replaced with the actual file path during build.
# The file is renamed to `app.jar` and placed in the root directory of the container.
COPY ${JAR_FILE} app.jar
#verification steps
#➜  ~ docker run -it --entrypoint /bin/bash venkat34/hello-springboot
#bash-4.4# ls -l /
#total 18100
#-rw-r--r--   1 root root 18483286 Nov 19 10:26 app.jar

# Specify the command to run when the container starts
# Here, it runs the `java` command with the `-jar` option to execute the JAR file.
# `/app.jar` is the path to the application inside the container.
ENTRYPOINT ["java", "-jar", "/app.jar"]

