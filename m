Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1DE583C2F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 12:38:39 +0200 (CEST)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0uc-0003r6-3z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 06:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH0mM-0006Sc-J6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:30:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH0mI-0004wN-5F
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 06:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659004201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=27BBwgaTqesQXu/pdmOQGJU1nPCMh/TPqRejsJXRNyk=;
 b=L0ZbWcLlQChRQo+Bxw5c3+4rKQ0UdEfEbEFcTn9Y4s8v2OU8e781rBc3WIcv6PIUd+Seny
 xMDd3ZOlJJEhexaKKhCYRrFmcP7QVZKXIwI2j4yjUJsct03P/3uWkdUqoflN3CE5KtEDKR
 WPpgTRpZThgM8vmD+JWQ8tqQnRwLV7o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-movQmuJhMkCghrdEAikjXA-1; Thu, 28 Jul 2022 06:29:59 -0400
X-MC-Unique: movQmuJhMkCghrdEAikjXA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs16-20020a1709073e9000b0072b73a28465so493827ejc.17
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 03:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27BBwgaTqesQXu/pdmOQGJU1nPCMh/TPqRejsJXRNyk=;
 b=eAybXed7o05o8ZYWOSsnmUfkhg699DLB9LFm0uHndoGKltsyfla6zjn9gwZ1VcfgqU
 +/7T2hqKR4vk3qVwVF+BAOm1u0U11V7Gq8AbF5Dpe6xNVwT35KvZQwirlY71eFHbPZbQ
 2ISZWzR7eRBLtnAiRGPWG9ps7v0gnSiFObkmgsPaObIZ8xBa42vugDxXpHq1xSvBs6Il
 FG/jiFKO+E1Lvzcyd0jjhaakqAy8vfjKmB3lMbI+mylanzy2h0KEZBRN3wvbh39YWzGO
 uGqhNr5dQneemhzoHMXFZnn26g2VPMkKXNUzv9Hsu/FjHdHRoUtX9kYZwcbG/VkWCmUo
 Tagg==
X-Gm-Message-State: AJIora+TGXdcD2SgDTLH2LHAltUaC2Otb1mhWTtzme+1pP6L2/wduxhH
 BxZrgCw2MdWqbT2mYwKTyyN6UY6RqzXKHBuzMbyswowKuWwW50dqBMrwXpAZRBKUXSikdhUD5PO
 hlQ29E6Oq9qLlBN0IMri5ZnAl5ZiZzUMfCihaG4pYIJ6jT65VN/RkgcxRtlEO816NyN8=
X-Received: by 2002:a05:6402:358a:b0:43b:ce8f:df00 with SMTP id
 y10-20020a056402358a00b0043bce8fdf00mr27180043edc.219.1659004197295; 
 Thu, 28 Jul 2022 03:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA5r0pmE6lj6iyA621RIV39a6I0ZbBqNPO3pUdLITRiDfZgEQJU3G+u/8k5+HoCSQ9yekuaw==
X-Received: by 2002:a05:6402:358a:b0:43b:ce8f:df00 with SMTP id
 y10-20020a056402358a00b0043bce8fdf00mr27180007edc.219.1659004196569; 
 Thu, 28 Jul 2022 03:29:56 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 j20-20020aa7c414000000b0043a85d7d15esm452050edq.12.2022.07.28.03.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 03:29:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com
Subject: [PATCH] tests/docker: regenerate container Dockerfiles
Date: Thu, 28 Jul 2022 12:29:55 +0200
Message-Id: <20220728102955.240048-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Copy over the most recent qemu.yml from lcitool, with updated
dependencies, and use it to regenerate the Dockerfiles.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  3 +--
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  3 +--
 .gitlab-ci.d/cirrus/macos-11.vars             |  6 ++---
 tests/docker/dockerfiles/alpine.docker        | 10 +++++---
 tests/docker/dockerfiles/centos8.docker       | 12 +++++----
 tests/docker/dockerfiles/debian-amd64.docker  |  8 ++++--
 .../dockerfiles/debian-arm64-cross.docker     |  9 +++++--
 .../dockerfiles/debian-armel-cross.docker     |  9 +++++--
 .../dockerfiles/debian-armhf-cross.docker     |  9 +++++--
 .../dockerfiles/debian-mips64el-cross.docker  |  9 +++++--
 .../dockerfiles/debian-mipsel-cross.docker    |  9 +++++--
 .../dockerfiles/debian-ppc64el-cross.docker   |  9 +++++--
 .../dockerfiles/debian-s390x-cross.docker     |  9 +++++--
 tests/docker/dockerfiles/fedora.docker        |  9 ++++---
 tests/docker/dockerfiles/opensuse-leap.docker | 13 ++++++----
 tests/docker/dockerfiles/ubuntu2004.docker    |  8 ++++--
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               | 25 +++++++++++--------
 tests/lcitool/refresh                         |  4 +--
 19 files changed, 112 insertions(+), 54 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index f59263731f..438c77136b 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -1,5 +1,4 @@
 # THIS FILE WAS AUTO-GENERATED
-# ... and then edited to fix py39, pending proper lcitool update.
 #
 #  $ lcitool variables freebsd-12 qemu
 #
@@ -12,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 40fc961398..5c11f90f4a 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -1,5 +1,4 @@
 # THIS FILE WAS AUTO-GENERATED
-# ... and then edited to fix py39, pending proper lcitool update.
 #
 #  $ lcitool variables freebsd-13 qemu
 #
@@ -12,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-virtualenv py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index cfe9181fd4..342493fc74 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -5,12 +5,12 @@
 # https://gitlab.com/libvirt/libvirt-ci
 
 CCACHE='/usr/local/bin/ccache'
-CPAN_PKGS=''
+CPAN_PKGS='Test::Harness'
 CROSS_PKGS=''
 MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
-PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PKGS='bash bc bison bzip2 capstone ccache cmocka cpanminus ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 3f4c0f95cb..7f36f87555 100644
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
@@ -21,6 +22,7 @@ RUN apk update && \
         cdrkit \
         ceph-dev \
         clang \
+        cmocka-dev \
         ctags \
         curl-dev \
         cyrus-sasl-dev \
@@ -29,7 +31,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
-        fuse3-dev \
+        flex \
         g++ \
         gcc \
         gcovr \
@@ -39,6 +41,7 @@ RUN apk update && \
         glib-static \
         gnutls-dev \
         gtk+3.0-dev \
+        json-c-dev \
         libaio-dev \
         libbpf-dev \
         libcap-ng-dev \
@@ -50,12 +53,12 @@ RUN apk update && \
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
@@ -64,6 +67,7 @@ RUN apk update && \
         mesa-dev \
         meson \
         multipath-tools \
+        musl-dev \
         ncurses-dev \
         ndctl-dev \
         net-tools \
@@ -73,6 +77,7 @@ RUN apk update && \
         openssh-client \
         pcre-dev \
         perl \
+        perl-test-harness \
         pixman-dev \
         pkgconf \
         pulseaudio-dev \
@@ -81,7 +86,6 @@ RUN apk update && \
         py3-pip \
         py3-sphinx \
         py3-sphinx_rtd_theme \
-        py3-virtualenv \
         py3-yaml \
         python3 \
         rpm2cpio \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 10618bfa83..fc200f2d1e 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -6,16 +6,18 @@
 
 FROM quay.io/centos/centos:stream8
 
-RUN dnf update -y && \
+RUN dnf distro-sync -y && \
     dnf install 'dnf-command(config-manager)' -y && \
     dnf config-manager --set-enabled -y powertools && \
     dnf install -y centos-release-advanced-virtualization && \
     dnf install -y epel-release && \
+    dnf install -y epel-next-release && \
     dnf install -y \
         SDL2-devel \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -30,7 +32,7 @@ RUN dnf update -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
-        fuse3-devel \
+        flex \
         gcc \
         gcc-c++ \
         genisoimage \
@@ -45,6 +47,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
@@ -60,19 +63,18 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
-        json-c-devel \
         libnfs-devel \
         libpmem-devel \
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
@@ -89,6 +91,7 @@ RUN dnf update -y && \
         pam-devel \
         pcre-static \
         perl \
+        perl-Test-Harness \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
@@ -99,7 +102,6 @@ RUN dnf update -y && \
         python3-pip \
         python3-sphinx \
         python3-sphinx_rtd_theme \
-        python3-virtualenv \
         rdma-core-devel \
         rpm \
         sed \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 503e282802..0b7f979787 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
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
@@ -41,13 +43,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev \
             libcap-ng-dev \
             libcapstone-dev \
+            libcmocka-dev \
             libcurl4-gnutls-dev \
             libdaxctl-dev \
             libdrm-dev \
             libepoxy-dev \
             libfdt-dev \
             libffi-dev \
-            libfuse3-dev \
             libgbm-dev \
             libgcrypt20-dev \
             libglib2.0-dev \
@@ -59,6 +61,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg62-turbo-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
@@ -76,7 +79,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev \
             libsdl2-image-dev \
             libseccomp-dev \
-            libselinux1-dev \
             libslirp-dev \
             libsnappy-dev \
             libspice-protocol-dev \
@@ -84,6 +86,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libssh-gcrypt-dev \
             libsystemd-dev \
             libtasn1-6-dev \
+            libtest-harness-perl \
             libubsan1 \
             libudev-dev \
             liburing-dev \
@@ -93,6 +96,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
+            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b60426834c..71f99e5c23 100644
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
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -84,13 +88,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:arm64 \
             libcap-ng-dev:arm64 \
             libcapstone-dev:arm64 \
+            libcmocka-dev:arm64 \
             libcurl4-gnutls-dev:arm64 \
             libdaxctl-dev:arm64 \
             libdrm-dev:arm64 \
             libepoxy-dev:arm64 \
             libfdt-dev:arm64 \
             libffi-dev:arm64 \
-            libfuse3-dev:arm64 \
             libgbm-dev:arm64 \
             libgcrypt20-dev:arm64 \
             libglib2.0-dev:arm64 \
@@ -102,6 +106,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:arm64 \
             libjemalloc-dev:arm64 \
             libjpeg62-turbo-dev:arm64 \
+            libjson-c-dev:arm64 \
             liblttng-ust-dev:arm64 \
             liblzo2-dev:arm64 \
             libncursesw5-dev:arm64 \
@@ -117,7 +122,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:arm64 \
             libsdl2-image-dev:arm64 \
             libseccomp-dev:arm64 \
-            libselinux1-dev:arm64 \
             libslirp-dev:arm64 \
             libsnappy-dev:arm64 \
             libspice-server-dev:arm64 \
@@ -133,6 +137,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev:arm64 \
             libvte-2.91-dev:arm64 \
             libxen-dev:arm64 \
+            libxml2-dev:arm64 \
             libzstd-dev:arm64 \
             nettle-dev:arm64 \
             systemtap-sdt-dev:arm64 \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index a6153e5a83..7651b5abd7 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             diffutils \
             exuberant-ctags \
             findutils \
+            flex \
             gcovr \
             genisoimage \
             gettext \
             git \
   libcmocka-dev:armel \
             libcurl4-gnutls-dev:armel \
             libdaxctl-dev:armel \
             libdrm-dev:armel \
             libepoxy-dev:armel \
             libfdt-dev:armel \
             libffi-dev:armel \
-            libfuse3-dev:armel \
             libgbm-dev:armel \
             libgcrypt20-dev:armel \
             libglib2.0-dev:armel \
@@ -102,6 +106,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:armel \
             libjemalloc-dev:armel \
             libjpeg62-turbo-dev:armel \
+            libjson-c-dev:armel \
             liblttng-ust-dev:armel \
             liblzo2-dev:armel \
             libncursesw5-dev:armel \
@@ -117,7 +122,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:armel \
             libsdl2-image-dev:armel \
             libseccomp-dev:armel \
-            libselinux1-dev:armel \
             libslirp-dev:armel \
             libsnappy-dev:armel \
             libspice-server-dev:armel \
@@ -132,6 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:armel \
             libvirglrenderer-dev:armel \
             libvte-2.91-dev:armel \
+            libxml2-dev:armel \
             libzstd-dev:armel \
             nettle-dev:armel \
             systemtap-sdt-dev:armel \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index a2ebce96f8..6371184d5b 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -84,13 +88,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:armhf \
             libcap-ng-dev:armhf \
             libcapstone-dev:armhf \
+            libcmocka-dev:armhf \
             libcurl4-gnutls-dev:armhf \
             libdaxctl-dev:armhf \
             libdrm-dev:armhf \
             libepoxy-dev:armhf \
             libfdt-dev:armhf \
             libffi-dev:armhf \
-            libfuse3-dev:armhf \
             libgbm-dev:armhf \
             libgcrypt20-dev:armhf \
             libglib2.0-dev:armhf \
@@ -102,6 +106,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:armhf \
             libjemalloc-dev:armhf \
             libjpeg62-turbo-dev:armhf \
+            libjson-c-dev:armhf \
             liblttng-ust-dev:armhf \
             liblzo2-dev:armhf \
             libncursesw5-dev:armhf \
@@ -117,7 +122,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:armhf \
             libsdl2-image-dev:armhf \
             libseccomp-dev:armhf \
-            libselinux1-dev:armhf \
             libslirp-dev:armhf \
             libsnappy-dev:armhf \
             libspice-server-dev:armhf \
@@ -133,6 +137,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev:armhf \
             libvte-2.91-dev:armhf \
             libxen-dev:armhf \
+            libxml2-dev:armhf \
             libzstd-dev:armhf \
             nettle-dev:armhf \
             systemtap-sdt-dev:armhf \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index b02dcb7fd9..01b6aab767 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -83,13 +87,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:mips64el \
             libcap-ng-dev:mips64el \
             libcapstone-dev:mips64el \
+            libcmocka-dev:mips64el \
             libcurl4-gnutls-dev:mips64el \
             libdaxctl-dev:mips64el \
             libdrm-dev:mips64el \
             libepoxy-dev:mips64el \
             libfdt-dev:mips64el \
             libffi-dev:mips64el \
-            libfuse3-dev:mips64el \
             libgbm-dev:mips64el \
             libgcrypt20-dev:mips64el \
             libglib2.0-dev:mips64el \
@@ -101,6 +105,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:mips64el \
             libjemalloc-dev:mips64el \
             libjpeg62-turbo-dev:mips64el \
+            libjson-c-dev:mips64el \
             liblttng-ust-dev:mips64el \
             liblzo2-dev:mips64el \
             libncursesw5-dev:mips64el \
@@ -116,7 +121,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:mips64el \
             libsdl2-image-dev:mips64el \
             libseccomp-dev:mips64el \
-            libselinux1-dev:mips64el \
             libslirp-dev:mips64el \
             libsnappy-dev:mips64el \
             libspice-server-dev:mips64el \
@@ -130,6 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:mips64el \
             libvirglrenderer-dev:mips64el \
             libvte-2.91-dev:mips64el \
+            libxml2-dev:mips64el \
             libzstd-dev:mips64el \
             nettle-dev:mips64el \
             systemtap-sdt-dev:mips64el \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index b6d99ae324..669ae38e7c 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -83,13 +87,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:mipsel \
             libcap-ng-dev:mipsel \
             libcapstone-dev:mipsel \
+            libcmocka-dev:mipsel \
             libcurl4-gnutls-dev:mipsel \
             libdaxctl-dev:mipsel \
             libdrm-dev:mipsel \
             libepoxy-dev:mipsel \
             libfdt-dev:mipsel \
             libffi-dev:mipsel \
-            libfuse3-dev:mipsel \
             libgbm-dev:mipsel \
             libgcrypt20-dev:mipsel \
             libglib2.0-dev:mipsel \
@@ -101,6 +105,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:mipsel \
             libjemalloc-dev:mipsel \
             libjpeg62-turbo-dev:mipsel \
+            libjson-c-dev:mipsel \
             liblttng-ust-dev:mipsel \
             liblzo2-dev:mipsel \
             libncursesw5-dev:mipsel \
@@ -116,7 +121,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:mipsel \
             libsdl2-image-dev:mipsel \
             libseccomp-dev:mipsel \
-            libselinux1-dev:mipsel \
             libslirp-dev:mipsel \
             libsnappy-dev:mipsel \
             libspice-server-dev:mipsel \
@@ -130,6 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:mipsel \
             libvirglrenderer-dev:mipsel \
             libvte-2.91-dev:mipsel \
+            libxml2-dev:mipsel \
             libzstd-dev:mipsel \
             nettle-dev:mipsel \
             systemtap-sdt-dev:mipsel \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index bcf04bc90b..f89c05a3ae 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -13,6 +13,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get install --no-install-recommends -y \
             bash \
             bc \
+            bison \
             bsdextrautils \
             bzip2 \
             ca-certificates \
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -84,13 +88,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:ppc64el \
             libcap-ng-dev:ppc64el \
             libcapstone-dev:ppc64el \
+            libcmocka-dev:ppc64el \
             libcurl4-gnutls-dev:ppc64el \
             libdaxctl-dev:ppc64el \
             libdrm-dev:ppc64el \
             libepoxy-dev:ppc64el \
             libfdt-dev:ppc64el \
             libffi-dev:ppc64el \
-            libfuse3-dev:ppc64el \
             libgbm-dev:ppc64el \
             libgcrypt20-dev:ppc64el \
             libglib2.0-dev:ppc64el \
@@ -102,6 +106,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:ppc64el \
             libjemalloc-dev:ppc64el \
             libjpeg62-turbo-dev:ppc64el \
+            libjson-c-dev:ppc64el \
             liblttng-ust-dev:ppc64el \
             liblzo2-dev:ppc64el \
             libncursesw5-dev:ppc64el \
@@ -117,7 +122,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:ppc64el \
             libsdl2-image-dev:ppc64el \
             libseccomp-dev:ppc64el \
-            libselinux1-dev:ppc64el \
             libslirp-dev:ppc64el \
             libsnappy-dev:ppc64el \
             libspice-server-dev:ppc64el \
@@ -132,6 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:ppc64el \
             libvirglrenderer-dev:ppc64el \
             libvte-2.91-dev:ppc64el \
+            libxml2-dev:ppc64el \
             libzstd-dev:ppc64el \
             nettle-dev:ppc64el \
             systemtap-sdt-dev:ppc64el \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index ff79a2cc4f..c76d36e3c3 100644
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
@@ -22,13 +23,16 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
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
+            libtest-harness-perl \
             llvm \
             locales \
             make \
@@ -84,13 +88,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:s390x \
             libcap-ng-dev:s390x \
             libcapstone-dev:s390x \
+            libcmocka-dev:s390x \
             libcurl4-gnutls-dev:s390x \
             libdaxctl-dev:s390x \
             libdrm-dev:s390x \
             libepoxy-dev:s390x \
             libfdt-dev:s390x \
             libffi-dev:s390x \
-            libfuse3-dev:s390x \
             libgbm-dev:s390x \
             libgcrypt20-dev:s390x \
             libglib2.0-dev:s390x \
@@ -102,6 +106,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:s390x \
             libjemalloc-dev:s390x \
             libjpeg62-turbo-dev:s390x \
+            libjson-c-dev:s390x \
             liblttng-ust-dev:s390x \
             liblzo2-dev:s390x \
             libncursesw5-dev:s390x \
@@ -117,7 +122,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev:s390x \
             libsdl2-image-dev:s390x \
             libseccomp-dev:s390x \
-            libselinux1-dev:s390x \
             libslirp-dev:s390x \
             libsnappy-dev:s390x \
             libssh-gcrypt-dev:s390x \
@@ -131,6 +135,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev:s390x \
             libvirglrenderer-dev:s390x \
             libvte-2.91-dev:s390x \
+            libxml2-dev:s390x \
             libzstd-dev:s390x \
             nettle-dev:s390x \
             systemtap-sdt-dev:s390x \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 2e6a84abfd..9414ebecbb 100644
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
@@ -53,12 +54,14 @@ exec "$@"' > /usr/bin/nosync && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
         libbpf-devel \
         libcacard-devel \
         libcap-ng-devel \
+        libcmocka-devel \
         libcurl-devel \
         libdrm-devel \
         libepoxy-devel \
@@ -72,13 +75,13 @@ exec "$@"' > /usr/bin/nosync && \
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
@@ -94,6 +97,7 @@ exec "$@"' > /usr/bin/nosync && \
         openssh-clients \
         pam-devel \
         pcre-static \
+        perl-Test-Harness \
         perl-base \
         pixman-devel \
         pkgconfig \
@@ -106,7 +110,6 @@ exec "$@"' > /usr/bin/nosync && \
         python3-pip \
         python3-sphinx \
         p --layers all opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.opensuse.org/opensuse/leap:15.2
+FROM registry.opensuse.org/opensuse/leap:15.3
 
 RUN zypper update -y && \
     zypper install -y \
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
@@ -44,6 +45,7 @@ RUN zypper update -y && \
            libbz2-devel \
            libcacard-devel \
            libcap-ng-devel \
+           libcmocka-devel \
            libcurl-devel \
            libdrm-devel \
            libepoxy-devel \
@@ -53,6 +55,7 @@ RUN zypper update -y && \
            libgnutls-devel \
            libiscsi-devel \
            libjpeg8-devel \
+           libjson-c-devel \
            libndctl-devel \
            libnettle-devel \
            libnfs-devel \
@@ -63,7 +66,6 @@ RUN zypper update -y && \
            libpulse-devel \
            librbd-devel \
            libseccomp-devel \
-           libselinux-devel \
            libspice-server-devel \
            libssh-devel \
            libtasn1-devel \
@@ -71,6 +73,7 @@ RUN zypper update -y && \
            libudev-devel \
            liburing-devel \
            libusb-1_0-devel \
+           libxml2-devel \
            libzstd-devel \
            llvm \
            lttng-ust-devel \
@@ -83,6 +86,7 @@ RUN zypper update -y && \
            openssh \
            pam-devel \
            pcre-devel-static \
+           perl-Test-Harness \
            perl-base \
            pkgconfig \
            python3-Pillow \
@@ -94,7 +98,6 @@ RUN zypper update -y && \
            python3-pip \
            python3-setuptools \
            python3-sphinx_rtd_theme \
-           python3-virtualenv \
            python3-wheel \
            rdma-core-devel \
            rpm \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index a3b38884e3..0a66a7d231 100644
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
@@ -40,13 +42,13 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev \
             libcap-ng-dev \
             libcapstone-dev \
+            libcmocka-dev \
             libcurl4-gnutls-dev \
             libdaxctl-dev \
             libdrm-dev \
             libepoxy-dev \
             libfdt-dev \
             libffi-dev \
-            libfuse3-dev \
             libgbm-dev \
             libgcrypt20-dev \
             libglib2.0-dev \
@@ -58,6 +60,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
@@ -75,7 +78,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libsdl2-dev \
             libsdl2-image-dev \
             libseccomp-dev \
-            libselinux1-dev \
             libslirp-dev \
             libsnappy-dev \
             libspice-protocol-dev \
@@ -83,6 +85,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libssh-dev \
             libsystemd-dev \
             libtasn1-6-dev \
+            libtest-harness-perl \
             libubsan1 \
             libudev-dev \
             libusb-1.0-0-dev \
@@ -91,6 +94,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
+            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index f83b916d5e..cc9d55ecda 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
+Subproject commit cc9d55ecdafa19b49a52cd797155465ee041cb22
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d068a7a8de..425459c548 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -3,12 +3,14 @@ packages:
  - alsa
  - bash
  - bc
+ - bison
  - brlapi
  - bzip2
  - bzip2-libs
  - capstone
  - ccache
  - clang
+ - cmocka
  - column
  - ctags
  - cyrus-sasl
@@ -18,23 +20,25 @@ packages:
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
+ - json-c
  - libaio
- - libattr
  - libasan
+ - libattr
  - libbpf
+ - libc-static
  - libcacard
  - libcap-ng
  - libcurl
@@ -55,7 +59,6 @@ packages:
  - librbd
  - librdmacm
  - libseccomp
- - libselinux
  - libslirp
  - libssh
  - libtasn1
@@ -64,21 +67,23 @@ packages:
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
+ - perl-Test-Harness
  - pixman
  - pkg-config
  - pulseaudio
@@ -90,7 +95,7 @@ packages:
  - python3-pip
  - python3-sphinx
  - python3-sphinx-rtd-theme
- - python3-virtualenv
+ - python3-venv
  - rpm2cpio
  - sdl2
  - sdl2-image
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 5e260f8cd6..2a59150322 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -25,7 +25,7 @@ self_dir = Path(__file__).parent
 src_dir = self_dir.parent.parent
 dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
 
-lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
+lcitool_path = Path(self_dir, "libvirt-ci", "bin", "lcitool")
 
 lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
 
@@ -112,7 +112,7 @@ try:
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-35")
-    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
     generate_dockerfile("ubuntu2004", "ubuntu-2004",
                         trailer="".join(ubuntu2004_tsanhack))
 
-- 
2.36.1


