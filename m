Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD2B99A4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Sep 2019 00:26:06 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBRLp-00087H-6D
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 18:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iBR9K-0000JY-Lu
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iBR9J-00070h-8b
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iBR9I-0006x9-Vq
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 18:13:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9233C308123B;
 Fri, 20 Sep 2019 22:13:06 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-38.bos.redhat.com [10.18.17.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F25C15D9C3;
 Fri, 20 Sep 2019 22:13:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] docker: move tests from python2 to python3
Date: Fri, 20 Sep 2019 18:12:51 -0400
Message-Id: <20190920221255.30412-2-jsnow@redhat.com>
In-Reply-To: <20190920221255.30412-1-jsnow@redhat.com>
References: <20190920221255.30412-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 20 Sep 2019 22:13:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of the push to drop python2 support, replace any explicit python2
dependencies with python3 versions.

For centos, python2 still exists as an implicit dependency, but by adding
python3 we will be able to build even if the configure script begins to
require python 3.5+.

Tested with centos7, fedora, ubuntu, ubuntu1804, and debian 9 (amd64).
Tested under a custom configure script that requires Python 3.5+.

the travis dockerfile is also moved to using python3, which was tested
by running `make docker-test-build@travis`, which I hope is sufficient.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20190920200049.27216-1-jsnow@redhat.com
---
 tests/docker/dockerfiles/centos7.docker             | 2 +-
 tests/docker/dockerfiles/debian-ports.docker        | 2 +-
 tests/docker/dockerfiles/debian-sid.docker          | 2 +-
 tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
 tests/docker/dockerfiles/debian10.docker            | 2 +-
 tests/docker/dockerfiles/debian8.docker             | 3 +--
 tests/docker/dockerfiles/debian9.docker             | 2 +-
 tests/docker/dockerfiles/travis.docker              | 2 +-
 tests/docker/dockerfiles/ubuntu.docker              | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker          | 2 +-
 10 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/docke=
rfiles/centos7.docker
index e0b9d7dbe9..953637065c 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -25,6 +25,7 @@ ENV PACKAGES \
     nettle-devel \
     perl-Test-Harness \
     pixman-devel \
+    python3 \
     SDL-devel \
     spice-glib-devel \
     spice-server-devel \
@@ -34,4 +35,3 @@ ENV PACKAGES \
     zlib-devel
 RUN yum install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-
diff --git a/tests/docker/dockerfiles/debian-ports.docker b/tests/docker/=
dockerfiles/debian-ports.docker
index 61bc3f2993..f1ea8d3bd1 100644
--- a/tests/docker/dockerfiles/debian-ports.docker
+++ b/tests/docker/dockerfiles/debian-ports.docker
@@ -31,6 +31,6 @@ RUN apt-get update && \
         git \
         pkg-config \
         psmisc \
-        python \
+        python3 \
         texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)
diff --git a/tests/docker/dockerfiles/debian-sid.docker b/tests/docker/do=
ckerfiles/debian-sid.docker
index 2a1bcc33b2..dcb8e83715 100644
--- a/tests/docker/dockerfiles/debian-sid.docker
+++ b/tests/docker/dockerfiles/debian-sid.docker
@@ -31,5 +31,5 @@ RUN apt update && \
         git \
         pkg-config \
         psmisc \
-        python \
+        python3 \
         texinfo || { echo "Failed to build - see debian-sid.docker notes=
"; exit 1; }
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/=
docker/dockerfiles/debian-xtensa-cross.docker
index b9c2e2e531..e6f93f65ee 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -18,7 +18,7 @@ RUN apt-get update && \
         flex \
         gettext \
         git \
-        python-minimal
+        python3-minimal
=20
 ENV CPU_LIST csp dc232b dc233c
 ENV TOOLCHAIN_RELEASE 2018.02
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
index 30a78813f2..dad498b52e 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -26,7 +26,7 @@ RUN apt update && \
         git \
         pkg-config \
         psmisc \
-        python \
+        python3 \
         python3-sphinx \
         texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)
diff --git a/tests/docker/dockerfiles/debian8.docker b/tests/docker/docke=
rfiles/debian8.docker
index 1212a85c35..be67023826 100644
--- a/tests/docker/dockerfiles/debian8.docker
+++ b/tests/docker/dockerfiles/debian8.docker
@@ -30,5 +30,4 @@ RUN apt update && \
         git \
         gnupg \
         pkg-config \
-        python-minimal
-
+        python3-minimal
diff --git a/tests/docker/dockerfiles/debian9.docker b/tests/docker/docke=
rfiles/debian9.docker
index b36f1d4ed8..8cbd742bb5 100644
--- a/tests/docker/dockerfiles/debian9.docker
+++ b/tests/docker/dockerfiles/debian9.docker
@@ -26,7 +26,7 @@ RUN apt update && \
         git \
         pkg-config \
         psmisc \
-        python \
+        python3 \
         python3-sphinx \
         texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut =
-d\  -f2)
diff --git a/tests/docker/dockerfiles/travis.docker b/tests/docker/docker=
files/travis.docker
index e72dc85ca7..ea14da29d9 100644
--- a/tests/docker/dockerfiles/travis.docker
+++ b/tests/docker/dockerfiles/travis.docker
@@ -5,7 +5,7 @@ ENV LC_ALL en_US.UTF-8
 RUN sed -i "s/# deb-src/deb-src/" /etc/apt/sources.list
 RUN apt-get update
 RUN apt-get -y build-dep qemu
-RUN apt-get -y install device-tree-compiler python2.7 python-yaml dh-aut=
oreconf gdb strace lsof net-tools gcovr
+RUN apt-get -y install device-tree-compiler python3 python3-yaml dh-auto=
reconf gdb strace lsof net-tools gcovr
 # Travis tools require PhantomJS / Neo4j / Maven accessible
 # in their PATH (QEMU build won't access them).
 ENV PATH /usr/local/phantomjs/bin:/usr/local/phantomjs:/usr/local/neo4j-=
3.2.7/bin:/usr/local/maven-3.5.2/bin:/usr/local/cmake-3.9.2/bin:/usr/loca=
l/clang-5.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/docker=
files/ubuntu.docker
index a4f601395c..f486492224 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -60,7 +60,7 @@ ENV PACKAGES flex bison \
     libvte-2.91-dev \
     libxen-dev \
     make \
-    python-yaml \
+    python3-yaml \
     python3-sphinx \
     sparse \
     texinfo \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/do=
ckerfiles/ubuntu1804.docker
index 883f9bcf31..3cc4f492c4 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -47,7 +47,7 @@ ENV PACKAGES flex bison \
     libvte-2.91-dev \
     libxen-dev \
     make \
-    python-yaml \
+    python3-yaml \
     python3-sphinx \
     sparse \
     texinfo \
--=20
2.21.0


