Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C8291287
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 16:49:38 +0200 (CEST)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTnWa-0004mU-R2
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 10:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTnVI-0004Kw-Uy
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTnVE-0000NT-FE
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 10:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602946090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNwCPAIx/E3O6S25/eXJCll9qNnRsSRqQ/q0wYJoJGk=;
 b=AIIhlvhjhmUcILWLnQ4px38lzbKX92tKh4iG+U/d15Pz/Dlz7bBg2Q32HseAkXJItA2PQ9
 BQGwqHcjp5SlsG4DFamTdfwUjwu7vI3TCtYdjEDP8L/vvbHHTZfj2umOAfDLWESra8l5KP
 /2ouP2Icu8curbUiyGw/KmkzdnernrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-pbzrLe7jMUy0eSwnRH6nHQ-1; Sat, 17 Oct 2020 10:48:08 -0400
X-MC-Unique: pbzrLe7jMUy0eSwnRH6nHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A47071868400;
 Sat, 17 Oct 2020 14:48:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E3076EF52;
 Sat, 17 Oct 2020 14:48:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] add ninja to dockerfiles, CI configurations and test VMs
Date: Sat, 17 Oct 2020 10:48:04 -0400
Message-Id: <20201017144805.1641371-2-pbonzini@redhat.com>
In-Reply-To: <20201017144805.1641371-1-pbonzini@redhat.com>
References: <20201017144805.1641371-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 05:57:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml                                |  6 +++---
 .travis.yml                                | 13 +++++++++++++
 tests/docker/dockerfiles/centos7.docker    |  1 +
 tests/docker/dockerfiles/centos8.docker    |  1 +
 tests/docker/dockerfiles/debian10.docker   |  1 +
 tests/docker/dockerfiles/fedora.docker     |  1 +
 tests/docker/dockerfiles/travis.docker     |  2 +-
 tests/docker/dockerfiles/ubuntu.docker     |  1 +
 tests/docker/dockerfiles/ubuntu1804.docker |  1 +
 tests/docker/dockerfiles/ubuntu2004.docker |  1 +
 tests/vm/centos                            |  2 +-
 tests/vm/centos.aarch64                    |  2 +-
 tests/vm/fedora                            |  2 +-
 tests/vm/freebsd                           |  1 +
 tests/vm/netbsd                            |  1 +
 tests/vm/openbsd                           |  1 +
 tests/vm/ubuntu.aarch64                    |  2 +-
 tests/vm/ubuntu.i386                       |  2 +-
 18 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 0f46cb5eaf..396888fbd3 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -9,7 +9,7 @@ freebsd_12_task:
   install_script:
     - ASSUME_ALWAYS_YES=yes pkg bootstrap -f ;
     - pkg install -y bash curl cyrus-sasl git glib gmake gnutls gsed
-          nettle perl5 pixman pkgconf png usbredir
+          nettle perl5 pixman pkgconf png usbredir ninja
   script:
     - mkdir build
     - cd build
@@ -21,7 +21,7 @@ macos_task:
   osx_instance:
     image: catalina-base
   install_script:
-    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash
+    - brew install pkg-config python gnu-sed glib pixman make sdl2 bash ninja
   script:
     - mkdir build
     - cd build
@@ -36,7 +36,7 @@ macos_xcode_task:
     # this is an alias for the latest Xcode
     image: catalina-xcode
   install_script:
-    - brew install pkg-config gnu-sed glib pixman make sdl2 bash
+    - brew install pkg-config gnu-sed glib pixman make sdl2 bash ninja
   script:
     - mkdir build
     - cd build
diff --git a/.travis.yml b/.travis.yml
index 1054ec5d29..d7bfbb8bfe 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -49,6 +49,7 @@ addons:
       - libvdeplug-dev
       - libvte-2.91-dev
       - libzstd-dev
+      - ninja-build
       - sparse
       - uuid-dev
       - gcovr
@@ -177,6 +178,7 @@ jobs:
       addons:
         apt:
           packages:
+            - ninja-build
             - python3-sphinx
             - perl
 
@@ -211,6 +213,10 @@ jobs:
     # gprof/gcov are GCC features
     - name: "GCC gprof/gcov"
       dist: bionic
+      addons:
+        apt:
+          packages:
+            - ninja-build
       env:
         - CONFIG="--enable-gprof --enable-gcov --disable-libssh
                   --target-list=${MAIN_SOFTMMU_TARGETS}"
@@ -281,6 +287,7 @@ jobs:
             - liburcu-dev
             - libusb-1.0-0-dev
             - libvte-2.91-dev
+            - ninja-build
             - sparse
             - uuid-dev
       language: generic
@@ -346,6 +353,7 @@ jobs:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          - ninja-build
           # Tests dependencies
           - genisoimage
       env:
@@ -379,6 +387,7 @@ jobs:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          - ninja-build
           # Tests dependencies
           - genisoimage
       env:
@@ -411,6 +420,7 @@ jobs:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          - ninja-build
           # Tests dependencies
           - genisoimage
       env:
@@ -450,6 +460,7 @@ jobs:
           - libzstd-dev
           - nettle-dev
           - xfslibs-dev
+          - ninja-build
           # Tests dependencies
           - genisoimage
       env:
@@ -463,6 +474,7 @@ jobs:
         apt_packages:
           - libgcrypt20-dev
           - libgnutls28-dev
+          - ninja-build
       env:
         - CONFIG="--disable-containers --disable-system"
 
@@ -493,6 +505,7 @@ jobs:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          - ninja-build
       env:
         - TEST_CMD="make check-unit"
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 46277773bf..8b273725ee 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -27,6 +27,7 @@ ENV PACKAGES \
     mesa-libEGL-devel \
     mesa-libgbm-devel \
     nettle-devel \
+    ninja-build \
     perl-Test-Harness \
     pixman-devel \
     python3 \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index e29e9657fb..585dfad9be 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -19,6 +19,7 @@ ENV PACKAGES \
     make \
     mesa-libEGL-devel \
     nettle-devel \
+    ninja-build \
     perl-Test-Harness \
     pixman-devel \
     python36 \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 1e4188ba22..21cc671d71 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -26,6 +26,7 @@ RUN apt update && \
         gettext \
         git \
         libncurses5-dev \
+        ninja-build \
         pkg-config \
         psmisc \
         python3 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 85c975543d..ac79d95418 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -75,6 +75,7 @@ ENV PACKAGES \
     mingw64-SDL2 \
     ncurses-devel \
     nettle-devel \
+    ninja-build \
     nss-devel \
     numactl-devel \
     perl \
diff --git a/tests/docker/dockerfiles/travis.docker b/tests/docker/dockerfiles/travis.docker
index 591282561b..cd1435a7e9 100644
--- a/tests/docker/dockerfiles/travis.docker
+++ b/tests/docker/dockerfiles/travis.docker
@@ -9,7 +9,7 @@ ENV LC_ALL en_US.UTF-8
 RUN sed -i "s/# deb-src/deb-src/" /etc/apt/sources.list
 RUN apt-get update
 RUN apt-get -y build-dep qemu
-RUN apt-get -y install device-tree-compiler python3 python3-yaml dh-autoreconf gdb strace lsof net-tools gcovr
+RUN apt-get -y install device-tree-compiler python3 python3-yaml dh-autoreconf gdb strace lsof net-tools gcovr ninja-build
 # Travis tools require PhantomJS / Neo4j / Maven accessible
 # in their PATH (QEMU build won't access them).
 ENV PATH /usr/local/phantomjs/bin:/usr/local/phantomjs:/usr/local/neo4j-3.2.7/bin:/usr/local/maven-3.5.2/bin:/usr/local/cmake-3.9.2/bin:/usr/local/clang-5.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index b556ed17d2..b5ef7a8198 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -60,6 +60,7 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
+    ninja-build \
     python3-yaml \
     python3-sphinx \
     sparse \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index a6a7617da6..9b0a19ba5e 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -48,6 +48,7 @@ ENV PACKAGES \
     make \
     python3-yaml \
     python3-sphinx \
+    ninja-build \
     sparse \
     xfslibs-dev
 RUN apt-get update && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index f4b9556b9e..17b37cda38 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -47,6 +47,7 @@ ENV PACKAGES flex bison \
     libxen-dev \
     libzstd-dev \
     make \
+    ninja-build \
     python3-numpy \
     python3-opencv \
     python3-pil \
diff --git a/tests/vm/centos b/tests/vm/centos
index 0ad4ecf419..efe3dbbb36 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -42,7 +42,7 @@ class CentosVM(basevm.BaseVM):
         self.wait_ssh()
         self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
         self.ssh_root_check("yum update -y")
-        self.ssh_root_check("yum install -y docker make git python3")
+        self.ssh_root_check("yum install -y docker make ninja-build git python3")
         self.ssh_root_check("systemctl enable docker")
         self.ssh_root("poweroff")
         self.wait()
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index d5232ecdb8..e687b93e52 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -23,7 +23,7 @@ import aarch64vm
 DEFAULT_CONFIG = {
     'cpu'          : "max",
     'machine'      : "virt,gic-version=max",
-    'install_cmds' : "yum install -y make git python3 gcc gcc-c++ flex bison, "\
+    'install_cmds' : "yum install -y make ninja-build git python3 gcc gcc-c++ flex bison, "\
         "yum install -y glib2-devel pixman-devel zlib-devel, "\
         "yum install -y perl-Test-Harness, "\
         "alternatives --set python /usr/bin/python3, "\
diff --git a/tests/vm/fedora b/tests/vm/fedora
index b2b478fdbc..b977efe4a2 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -32,7 +32,7 @@ class FedoraVM(basevm.BaseVM):
     pkgs = [
         # tools
         'git-core',
-        'gcc', 'binutils', 'make',
+        'gcc', 'binutils', 'make', 'ninja-build',
 
         # perl
         'perl-Test-Harness',
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 5f866e09c4..04ee793381 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -34,6 +34,7 @@ class FreeBSDVM(basevm.BaseVM):
         "bzip2",
         "python37",
         "py37-setuptools",
+        "ninja",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index ffb65a89be..447de9747d 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -32,6 +32,7 @@ class NetBSDVM(basevm.BaseVM):
         "xz",
         "python37",
         "py37-setuptools",
+        "ninja-build",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 8356646f21..ad882a76a2 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -31,6 +31,7 @@ class OpenBSDVM(basevm.BaseVM):
         "pkgconf",
         "bzip2", "xz",
         "py3-setuptools",
+        "ninja",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
index 21d454c27f..b291945a7e 100755
--- a/tests/vm/ubuntu.aarch64
+++ b/tests/vm/ubuntu.aarch64
@@ -22,7 +22,7 @@ DEFAULT_CONFIG = {
     'machine'      : "virt,gic-version=3",
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y --arch-only qemu,"\
-                     "apt-get install -y libfdt-dev pkg-config language-pack-en",
+                     "apt-get install -y libfdt-dev pkg-config language-pack-en ninja-build",
     # We increase beyond the default time since during boot
     # it can take some time (many seconds) to log into the VM
     # especially using softmmu.
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 5ce72610a6..47681b6f87 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -18,7 +18,7 @@ import ubuntuvm
 DEFAULT_CONFIG = {
     'install_cmds' : "apt-get update,"\
                      "apt-get build-dep -y qemu,"\
-                     "apt-get install -y libfdt-dev language-pack-en",
+                     "apt-get install -y libfdt-dev language-pack-en ninja-build",
 }
 
 class UbuntuX86VM(ubuntuvm.UbuntuVM):
-- 
2.26.2



