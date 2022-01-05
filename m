Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EE4857D2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 18:59:27 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5AZK-0004SR-F0
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 12:59:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n5AXa-0003lN-LP
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:57:38 -0500
Received: from rev.ng ([5.9.113.41]:46331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1n5AXX-0007MO-Uk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xgHa4LB7ALx+CH/kcPWpZxfzJlkjmY37+wikvrzMnbk=; b=uE9IU92l3KxO0WiRvL5eimC0/y
 tjzdV8VcrIHZ2h0qSfBJMNdeWS/uPKGsiweHfo+vUOVaA0k/mzUmq5PbSOTAwZWCDw0knyGZwpNAc
 87ZVWiFBbb35EHgtF6vZOP+upOQf0uQQ/XGBMfkrpM1RimrNgQtBSSZjsrpij+owY/dY=;
Date: Wed, 5 Jan 2022 18:57:20 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: tsimpson@quicinc.com, Anton Johansson via <qemu-devel@nongnu.org>, Brian
 Cain <bcain@quicinc.com>
Subject: CI for qemu-hexagon
Message-ID: <20220105185720.0d4fc159@orange>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/AlCx7/Xy2X4zdVm0RGca5Hy"
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

--MP_/AlCx7/Xy2X4zdVm0RGca5Hy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Alex, I hope you enjoyed the holidays!

We're trying to upstream idef-parser (the automatic generator of the
Hexagon frontend). This introduces new dependencies, specifically flex
and bison.

Attached you can find our patch for that.

However the CI fails:

    https://gitlab.com/carl.cudig/qemu/-/jobs/1939950230

AFAIU the Hexagon docker image is "special" since it's the only one
that needs the cross-compiler to be built from source and, therefore,
it's a process that needs to be triggered manually.
Is this correct?

If so, what should we do? Make a pull request despite the failure and
then it will be taken care of, or should I make a separate (preliminary)
pull request just for that patch?

-- 
Alessandro Di Federico
rev.ng

--MP_/AlCx7/Xy2X4zdVm0RGca5Hy
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=import-flex-bison.patch

commit 14e90d55b368b4a56fde668b66311bab6e1a4518
Author: Paolo Montesel <babush@rev.ng>
Date:   Thu Dec 9 13:23:06 2021 +0100

    target/hexagon: import flex/bison to docker files
   =20
    Signed-off-by: Alessandro Di Federico <ale@rev.ng>
    Signed-off-by: Paolo Montesel <babush@rev.ng>
    Signed-off-by: Anton Johansson <anjo@rev.ng>

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 309f7e7fb86..2abfe4e91aa 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -33,6 +33,7 @@ msys2-64bit:
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
       diffutils git grep make sed
+      flex bison
       mingw-w64-x86_64-capstone
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-cyrus-sasl
@@ -68,6 +69,7 @@ msys2-32bit:
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
       diffutils git grep make sed
+      flex bison
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfi=
les/alpine.docker
index 7e6997e3015..45db55ba55a 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -9,9 +9,11 @@ ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
 	binutils \
+	bison \
 	ccache \
 	coreutils \
 	curl-dev \
+	flex \
 	g++ \
 	gcc \
 	git \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerf=
iles/centos8.docker
index 7f135f8e8c0..d93bbe30026 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     SDL2-devel \
     alsa-lib-devel \
     bc \
+    bison \
     brlapi-devel \
     bzip2 \
     bzip2-devel \
@@ -19,6 +20,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     genisoimage \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/do=
ckerfiles/debian-amd64.docker
index ed546edcd65..805fd6f981d 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -14,9 +14,11 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/d=
ockerfiles/debian-native.docker
index efd55cb6e0e..02ccaf98fd1 100644
--- a/tests/docker/dockerfiles/debian-native.docker
+++ b/tests/docker/dockerfiles/debian-native.docker
@@ -26,13 +26,16 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
+        libglib2.0-dev \
         libfdt-dev \
         librdmacm-dev \
         libsasl2-dev \
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/d=
ocker/dockerfiles/debian-riscv64-cross.docker
index 594d97982c1..f5553afc2e1 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -17,12 +17,15 @@ RUN apt update && \
 # Install common build utilities
 RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
     bc \
+    bison \
     build-essential \
     ca-certificates \
     debian-ports-archive-keyring \
     dpkg-dev \
+    flex \
     gettext \
     git \
+    libglib2.0-dev \
     ninja-build \
     pkg-config \
     python3
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/d=
ocker/dockerfiles/debian-tricore-cross.docker
index d8df2c61170..9191aafc7f3 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,9 +16,11 @@ MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/docker=
files/debian10.docker
index b414af1b9f7..06b8d9d6b0f 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -17,16 +17,19 @@ RUN apt update && \
     DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         bc \
         build-essential \
         ca-certificates \
         ccache \
         clang \
         dbus \
+        flex \
         gdb-multiarch \
         gettext \
         git \
         libffi-dev \
+        libglib2.0-dev \
         libncurses5-dev \
         ninja-build \
         pkg-config \
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/dock=
er/dockerfiles/fedora-i386-cross.docker
index 13328e6081f..ae009a203f5 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,12 +1,15 @@
 FROM registry.fedoraproject.org/fedora:34
=20
 ENV PACKAGES \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     git \
+    glib2-devel \
     libffi-devel.i686 \
     libselinux-devel.i686 \
     libtasn1-devel.i686 \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/doc=
ker/dockerfiles/fedora-win32-cross.docker
index aad39dd97ff..9ae8eda39f7 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -2,14 +2,17 @@ FROM registry.fedoraproject.org/fedora:33
=20
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bc \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
+    glib2-devel \
     hostname \
     make \
     meson \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/doc=
ker/dockerfiles/fedora-win64-cross.docker
index 9a224a619bd..c59a130d001 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -2,13 +2,16 @@ FROM registry.fedoraproject.org/fedora:33
=20
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     bc \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
+    glib2-devel \
     git \
     hostname \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfi=
les/fedora.docker
index c6fd7e1113d..b19ef01bf7d 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:33
=20
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    bison \
     SDL2-devel \
     SDL2_image-devel \
     alsa-lib-devel \
@@ -20,6 +21,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/d=
ockerfiles/opensuse-leap.docker
index 3bbdb67f4fa..b868ca71982 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     Mesa-devel \
     alsa-lib-devel \
     bc \
+    bison \
     brlapi-devel \
     bzip2 \
     ca-certificates \
@@ -15,6 +16,7 @@ ENV PACKAGES \
     dbus-1 \
     diffutils \
     findutils \
+    flex \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfi=
les/ubuntu.docker
index f0e0180d215..5667ef592cf 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -11,9 +11,11 @@
=20
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bison \
     ccache \
     clang \
     dbus \
+    flex \
     gcc \
     gettext \
     git \
@@ -30,6 +32,7 @@ ENV PACKAGES \
     libfdt-dev \
     libffi-dev \
     libgbm-dev \
+    libglib2.0-dev \
     libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dock=
erfiles/ubuntu1804.docker
index 450fd06d0d5..ce7d15c03e2 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,6 +1,7 @@
 FROM docker.io/library/ubuntu:18.04
 ENV PACKAGES \
     bc \
+    bison \
     bsdmainutils \
     bzip2 \
     ca-certificates \
@@ -11,6 +12,7 @@ ENV PACKAGES \
     diffutils \
     exuberant-ctags \
     findutils \
+    flex \
     g++ \
     gcc \
     gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dock=
erfiles/ubuntu2004.docker
index 15a026be091..d39d4ea07f2 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,5 +1,6 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bison \
     bc \
     bsdmainutils \
     bzip2 \
@@ -11,6 +12,7 @@ ENV PACKAGES \
     diffutils \
     exuberant-ctags \
     findutils \
+    flex \
     g++ \
     gcc \
     gcovr \

--MP_/AlCx7/Xy2X4zdVm0RGca5Hy--

