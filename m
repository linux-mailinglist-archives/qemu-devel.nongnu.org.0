Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A950BF57
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:13:27 +0200 (CEST)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxmY-0007fg-Er
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHy-0008J6-4l
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:50 -0400
Received: from rev.ng ([5.9.113.41]:50005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHv-00069w-8w
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U9bBUOlXnGjilZq9tJ0TUSW1iFSl9DvcrUmBmDim4Bg=; b=Of3HsmDwY+5b3hn6SnR4IpJOVF
 GM9kIsOHch/WtdR/s/tYAHqeefc34dNYwTeV9wEjshjb6ILZDFsfLgT6FdhWsek4nDpijA+q/aCT0
 mehf5RVAvEPoov4YzvRbj7bX2oSdeO9JIdCm7TpCw9xdvKAV94EqB4Ft3+C3/oArqvlg=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Date: Fri, 22 Apr 2022 19:40:55 +0200
Message-Id: <20220422174059.4304-9-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
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

This patch points `tests/lcitool/libvirt-ci` to an upstreamed commit of
`libvirt-ci` which includes flex and bison. The `lcitool/refresh` script
was then ran to update the the generated docker/cirrus files.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |  2 +-
 .gitlab-ci.d/windows.yml                      |  2 ++
 tests/docker/dockerfiles/alpine.docker        |  6 ++++--
 tests/docker/dockerfiles/centos8.docker       |  7 ++++---
 tests/docker/dockerfiles/debian-amd64.docker  |  2 ++
 .../dockerfiles/debian-arm64-cross.docker     |  6 ++++--
 tests/docker/dockerfiles/debian-native.docker |  3 +++
 .../dockerfiles/debian-riscv64-cross.docker   |  3 +++
 .../dockerfiles/debian-s390x-cross.docker     |  6 ++++--
 .../dockerfiles/debian-tricore-cross.docker   |  1 +
 tests/docker/dockerfiles/debian10.docker      |  3 +++
 .../dockerfiles/fedora-i386-cross.docker      |  3 +++
 .../dockerfiles/fedora-win32-cross.docker     |  3 +++
 .../dockerfiles/fedora-win64-cross.docker     |  3 +++
 tests/docker/dockerfiles/fedora.docker        |  5 +++--
 tests/docker/dockerfiles/opensuse-leap.docker |  5 +++--
 tests/docker/dockerfiles/ubuntu1804.docker    |  4 +++-
 tests/docker/dockerfiles/ubuntu2004.docker    |  5 +++--
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               | 20 ++++++++++---------
 22 files changed, 66 insertions(+), 29 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index b4842271b2..0cfe18c67c 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc flex gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 546a82dd75..33c8856fd4 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc flex gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index cfe9181fd4..1c7366c810 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1df1630349..b496109b89 100644
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
@@ -67,6 +68,7 @@ msys2-32bit:
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
       diffutils git grep make sed
+      flex bison
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 3f4c0f95cb..ad5785be0f 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -13,6 +13,7 @@ RUN apk update && \
         attr-dev \
         bash \
         bc \
+        bison \
         bzip2 \
         bzip2-dev \
         ca-certificates \
@@ -29,7 +30,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
-        fuse3-dev \
+        flex \
         g++ \
         gcc \
         gcovr \
@@ -50,12 +51,12 @@ RUN apk update && \
         libnfs-dev \
         libpng-dev \
         libseccomp-dev \
-        libselinux-dev \
         libslirp-dev \
         libssh-dev \
         libtasn1-dev \
         liburing-dev \
         libusb-dev \
+        libxml2-dev \
         linux-pam-dev \
         llvm11 \
         lttng-ust-dev \
@@ -64,6 +65,7 @@ RUN apk update && \
         mesa-dev \
         meson \
         multipath-tools \
+        musl-dev \
         ncurses-dev \
         ndctl-dev \
         net-tools \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..b51114d542 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -6,7 +6,7 @@
 
 FROM quay.io/centos/centos:stream8
 
-RUN dnf update -y && \
+RUN dnf distro-sync -y && \
     dnf install 'dnf-command(config-manager)' -y && \
     dnf config-manager --set-enabled -y powertools && \
     dnf install -y centos-release-advanced-virtualization && \
@@ -16,6 +16,7 @@ RUN dnf update -y && \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -30,7 +31,7 @@ RUN dnf update -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
-        fuse3-devel \
+        flex \
         gcc \
         gcc-c++ \
         genisoimage \
@@ -64,13 +65,13 @@ RUN dnf update -y && \
         libpng-devel \
         librbd-devel \
         libseccomp-devel \
-        libselinux-devel \
         libslirp-devel \
         libssh-devel \
         libtasn1-devel \
         libubsan \
         liburing-devel \
         libusbx-devel \
+        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
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
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b60426834c..e42bde8bc3 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,11 +23,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             gcovr \
             genisoimage \
             gettext \
             git \
             hostname \
+            libglib2.0-dev \
             libpcre2-dev \
             libspice-protocol-dev \
             llvm \
@@ -90,7 +93,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libepoxy-dev:arm64 \
             libfdt-dev:arm64 \
             libffi-dev:arm64 \
-            libfuse3-dev:arm64 \
             libgbm-dev:arm64 \
             libgcrypt20-dev:arm64 \
             libglib2.0-dev:arm64 \
@@ -117,7 +119,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:arm64 \
             libsdl2-image-dev:arm64 \
             libseccomp-dev:arm64 \
-            libselinux1-dev:arm64 \
             libslirp-dev:arm64 \
             libsnappy-dev:arm64 \
             libspice-server-dev:arm64 \
@@ -133,6 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev:arm64 \
             libvte-2.91-dev:arm64 \
             libxen-dev:arm64 \
+            libxml2-dev:arm64 \
             libzstd-dev:arm64 \
             nettle-dev:arm64 \
             systemtap-sdt-dev:arm64 \
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
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index ff79a2cc4f..1a304260fe 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,11 +23,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             gcovr \
             genisoimage \
             gettext \
             git \
             hostname \
+            libglib2.0-dev \
             libpcre2-dev \
             libspice-protocol-dev \
             llvm \
@@ -90,7 +93,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libepoxy-dev:s390x \
             libfdt-dev:s390x \
             libffi-dev:s390x \
-            libfuse3-dev:s390x \
             libgbm-dev:s390x \
             libgcrypt20-dev:s390x \
             libglib2.0-dev:s390x \
@@ -117,7 +119,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:s390x \
             libsdl2-image-dev:s390x \
             libseccomp-dev:s390x \
-            libselinux1-dev:s390x \
             libslirp-dev:s390x \
             libsnappy-dev:s390x \
             libssh-gcrypt-dev:s390x \
@@ -131,6 +132,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:s390x \
             libvirglrenderer-dev:s390x \
             libvte-2.91-dev:s390x \
+            libxml2-dev:s390x \
             libzstd-dev:s390x \
             nettle-dev:s390x \
             systemtap-sdt-dev:s390x \
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index b573b9ded2..203e096ea3 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -20,6 +20,7 @@ RUN apt update && \
        bzip2 \
        ca-certificates \
        ccache \
+       flex \
        g++ \
        gcc \
        git \
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
index 0a3ec346e6..ebda006003 100644
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
index 84a8f5524d..c31d5ea544 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:33
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
index d7ed8eb1cf..34ee496bc4 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -3,12 +3,15 @@ FROM registry.fedoraproject.org/fedora:33
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
+    glib2-devel \
     git \
     hostname \
     make \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 2e6a84abfd..66f9b3263b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -23,6 +23,7 @@ exec "$@"' > /usr/bin/nosync && \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -37,7 +38,7 @@ exec "$@"' > /usr/bin/nosync && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
-        fuse3-devel \
+        flex \
         gcc \
         gcc-c++ \
         gcovr \
@@ -72,13 +73,13 @@ exec "$@"' > /usr/bin/nosync && \
         libpng-devel \
         librbd-devel \
         libseccomp-devel \
-        libselinux-devel \
         libslirp-devel \
         libssh-devel \
         libtasn1-devel \
         libubsan \
         liburing-devel \
         libusbx-devel \
+        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 6f5993d602..aab0bbe9e8 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -12,6 +12,7 @@ RUN zypper update -y && \
            alsa-lib-devel \
            bash \
            bc \
+           bison \
            brlapi-devel \
            bzip2 \
            ca-certificates \
@@ -22,7 +23,7 @@ RUN zypper update -y && \
            dbus-1 \
            diffutils \
            findutils \
-           fuse3-devel \
+           flex \
            gcc \
            gcc-c++ \
            gcovr \
@@ -63,7 +64,6 @@ RUN zypper update -y && \
            libpulse-devel \
            librbd-devel \
            libseccomp-devel \
-           libselinux-devel \
            libspice-server-devel \
            libssh-devel \
            libtasn1-devel \
@@ -71,6 +71,7 @@ RUN zypper update -y && \
            libudev-devel \
            liburing-devel \
            libusb-1_0-devel \
+           libxml2-devel \
            libzstd-devel \
            llvm \
            lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index b3f2156580..b413c63129 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdmainutils \
             bzip2 \
             ca-certificates \
@@ -23,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             g++ \
             gcc \
             gcovr \
@@ -74,7 +76,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev \
             libsdl2-image-dev \
             libseccomp-dev \
-            libselinux1-dev \
             libsnappy-dev \
             libspice-protocol-dev \
             libspice-server-dev \
@@ -89,6 +90,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
+            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index a3b38884e3..f3d999b43f 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdmainutils \
             bzip2 \
             ca-certificates \
@@ -23,6 +24,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             g++ \
             gcc \
             gcovr \
@@ -46,7 +48,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libepoxy-dev \
             libfdt-dev \
             libffi-dev \
-            libfuse3-dev \
             libgbm-dev \
             libgcrypt20-dev \
             libglib2.0-dev \
@@ -75,7 +76,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev \
             libsdl2-image-dev \
             libseccomp-dev \
-            libselinux1-dev \
             libslirp-dev \
             libsnappy-dev \
             libspice-protocol-dev \
@@ -91,6 +91,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
+            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index f83b916d5e..43927ff508 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
+Subproject commit 43927ff508e8ecb1ac225dabbc95b37c890db917
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d068a7a8de..1c2b03778c 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -3,6 +3,7 @@ packages:
  - alsa
  - bash
  - bc
+ - bison
  - brlapi
  - bzip2
  - bzip2-libs
@@ -18,23 +19,24 @@ packages:
  - diffutils
  - dtrace
  - findutils
- - fuse3
+ - flex
  - g++
  - gcc
  - gcovr
- - gettext
  - genisoimage
+ - gettext
  - glib2
+ - glib2-native
  - glib2-static
- - glibc-static
  - glusterfs
  - gnutls
  - gtk3
  - hostname
  - libaio
- - libattr
  - libasan
+ - libattr
  - libbpf
+ - libc-static
  - libcacard
  - libcap-ng
  - libcurl
@@ -55,7 +57,6 @@ packages:
  - librbd
  - librdmacm
  - libseccomp
- - libselinux
  - libslirp
  - libssh
  - libtasn1
@@ -64,18 +65,19 @@ packages:
  - liburing
  - libusbx
  - libvdeplug
+ - libxml2
  - libzstd
  - llvm
  - lttng-ust
  - lzo
- - netcat
- - nettle
- - ninja
- - nsis
  - make
  - mesa-libgbm
  - meson
  - ncursesw
+ - netcat
+ - nettle
+ - ninja
+ - nsis
  - pam
  - pcre-static
  - perl
-- 
2.35.1


