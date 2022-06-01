Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42E53ABA6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:17:46 +0200 (CEST)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwRyb-0006zH-O5
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nwRi5-0003RG-AF
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:00:42 -0400
Received: from rev.ng ([5.9.113.41]:55371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nwRi3-0003TU-KD
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 13:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=svhOeeZMDwhX322pUCZEkzVjfThXyvPpBLrhaeM/gbg=; b=RBMUPVo/Xrp4CPii0uuunmwqdd
 NM82xD7V3ZDko7okYG0AUEmkZEZeMDRVbO5sJUk5lzBOHu0QkG5Vnlv5Hj9tf8QFOI+I7DDVKYM6D
 ldImGn738l0uTimevX4VF+lZabUku0u0Sj4sRKZ8T3FXqY7xEiVXfw7UdPGc8F5OTuyk=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org,
 alex.bennee@linaro.org
Subject: [PATCH v10 12/16] target/hexagon: manually add flex/bison/glib2 to
 remaining containers
Date: Wed,  1 Jun 2022 19:00:09 +0200
Message-Id: <20220601170013.160531-13-anjo@rev.ng>
In-Reply-To: <20220601170013.160531-1-anjo@rev.ng>
References: <20220601170013.160531-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Adds our build-time dependencies to containers which build qemu-hexagon,
but aren't covered by libvirt-ci.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 .gitlab-ci.d/windows.yml                             | 6 ++++--
 tests/docker/dockerfiles/debian-riscv64-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 tests/docker/dockerfiles/debian10.docker             | 3 +++
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 3 +++
 7 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index cf7724b8e5..3777ec982b 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -32,7 +32,8 @@ msys2-64bit:
   extends: .shared_msys2_builder
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
-      diffutils git grep make sed
+      bison diffutils flex
+      git grep make sed
       mingw-w64-x86_64-capstone
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-cyrus-sasl
@@ -66,7 +67,8 @@ msys2-32bit:
   extends: .shared_msys2_builder
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
-      diffutils git grep make sed
+      bison diffutils flex
+      git grep make sed
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 594d97982c..9715791e0b 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -16,13 +16,16 @@ RUN apt update && \

 # Install common build utilities
 RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+    bison \
     bc \
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
index b573b9ded2..63f977066c 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -19,6 +19,7 @@ RUN apt update && \
        bison \
        bzip2 \
        ca-certificates \
+       flex \
        ccache \
        g++ \
        gcc \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..23285e7aa4 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -18,15 +18,18 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bc \
+        bison \
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
index 0a3ec346e6..7eec648d2d 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,9 +1,11 @@
 FROM registry.fedoraproject.org/fedora:34

 ENV PACKAGES \
+    bison \
     bzip2 \
     ccache \
     diffutils \
+    flex \
     findutils \
     gcc \
     git \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a06bd29e8e..aca37aabc4 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
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
index b71624330f..3642766479 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
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
--
2.36.1

