Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8E4786BB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:08:50 +0100 (CET)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9EO-0002Ys-TK
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:08:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97l-0001N8-Qt
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:02:02 -0500
Received: from rev.ng ([5.9.113.41]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1my97d-0002Cn-Rm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 04:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ItGCJnQORKprN/JdZg4yCbZhwP33+P+25Jk5751D7fs=; b=hMiPg+dqLkRUKyOAfD/QRmCM/h
 ANeN5g4BfYenMZXlNnXA9x4GH0RmzTbykvk8DSQkXvmgH6biliKaD21Mnjbzb4xP4uIJ47FRQBjpR
 8LtSTtcuiD1Bdl4K/6TODgKe1bRtLcPCYfcG++z/xVbn4ExVp1Uqz0VUBK7BO8EAZAbA=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng,
 nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v7 08/13] target/hexagon: import flex/bison to docker files
Date: Fri, 17 Dec 2021 10:01:24 +0100
Message-Id: <20211217090129.23242-9-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-1-anjo@rev.ng>
References: <20211217090129.23242-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Paolo Montesel <babush@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 .gitlab-ci.d/windows.yml                             | 2 ++
 tests/docker/dockerfiles/alpine.docker               | 2 ++
 tests/docker/dockerfiles/centos8.docker              | 2 ++
 tests/docker/dockerfiles/debian-amd64.docker         | 2 ++
 tests/docker/dockerfiles/debian-native.docker        | 3 +++
 tests/docker/dockerfiles/debian-riscv64-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-tricore-cross.docker | 2 ++
 tests/docker/dockerfiles/debian10.docker             | 3 +++
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 3 +++
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora.docker               | 2 ++
 tests/docker/dockerfiles/opensuse-leap.docker        | 2 ++
 tests/docker/dockerfiles/ubuntu.docker               | 3 +++
 tests/docker/dockerfiles/ubuntu1804.docker           | 2 ++
 tests/docker/dockerfiles/ubuntu2004.docker           | 2 ++
 16 files changed, 39 insertions(+)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 309f7e7fb8..2abfe4e91a 100644
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
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..45db55ba55 100644
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
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 7f135f8e8c..d93bbe3002 100644
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
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index ed546edcd6..805fd6f981 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -14,9 +14,11 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        bison \
         cscope \
         genisoimage \
         exuberant-ctags \
+        flex \
         global \
         libbz2-dev \
         liblzo2-dev \
diff --git a/tests/docker/dockerfiles/debian-native.docker b/tests/docker/dockerfiles/debian-native.docker
index efd55cb6e0..02ccaf98fd 100644
--- a/tests/docker/dockerfiles/debian-native.docker
+++ b/tests/docker/dockerfiles/debian-native.docker
@@ -26,13 +26,16 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
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
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 594d97982c..f5553afc2e 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -17,12 +17,15 @@ RUN apt update && \
 # Install common build utilities
 RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
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
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index d8df2c6117..9191aafc7f 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,9 +16,11 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..06b8d9d6b0 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -17,16 +17,19 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
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
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 13328e6081..ae009a203f 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,12 +1,15 @@
 FROM registry.fedoraproject.org/fedora:34
 
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
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aad39dd97f..9ae8eda39f 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -2,14 +2,17 @@ FROM registry.fedoraproject.org/fedora:33
 
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
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 9a224a619b..c59a130d00 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -2,13 +2,16 @@ FROM registry.fedoraproject.org/fedora:33
 
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
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index c6fd7e1113..b19ef01bf7 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:33
 
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
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 3bbdb67f4f..b868ca7198 100644
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
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index f0e0180d21..5667ef592c 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -11,9 +11,11 @@
 
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
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 450fd06d0d..ce7d15c03e 100644
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
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 15a026be09..d39d4ea07f 100644
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
-- 
2.33.1


