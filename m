Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91AA662E87
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:17:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwgK-0006iE-RE; Mon, 09 Jan 2023 13:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwg6-0006gs-L4
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:15:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pEwg2-0006Ab-Uo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673288118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPA2pCsAcsp4rwCvwWd05d9jbUPSXJ0qAdsMJJ6kFvQ=;
 b=ZX9e+xdmOc90Q9NNOuUtU+xcfHB8LLu/q9Q/LPL8uFOnK/xjDepz9MLg3mLpoCYfk/RaIk
 9cUAAZYErz1rQGXvLNITyB4DUAqTYQdcP8Ifwzao5+EVQEe7qbXC+POpBbK5tHzeyOg4tJ
 yzEZByCNfl9ynz2zD1XIsMZP1gvKFC4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-94VqUDJRMxum8b_nEEkT5g-1; Mon, 09 Jan 2023 13:15:14 -0500
X-MC-Unique: 94VqUDJRMxum8b_nEEkT5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C3B3813F20;
 Mon,  9 Jan 2023 18:15:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E88CC16026;
 Mon,  9 Jan 2023 18:15:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Hildenbrand <david@redhat.com>, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 5/5] Draft: Update lcitool
Date: Mon,  9 Jan 2023 22:14:47 +0400
Message-Id: <20230109181447.235989-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230109181447.235989-1-marcandre.lureau@redhat.com>
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

- Update to fedora-37
- Drop perl

Note: see https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/344 merge
status before merging with proper submodule sha1.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
 scripts/ci/setup/build-environment.yml                | 1 -
 tests/docker/dockerfiles/alpine.docker                | 1 -
 tests/docker/dockerfiles/centos8.docker               | 1 -
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 -
 tests/docker/dockerfiles/debian-amd64.docker          | 1 -
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 -
 tests/docker/dockerfiles/debian-armel-cross.docker    | 1 -
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 -
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 -
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 -
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 -
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 -
 tests/docker/dockerfiles/debian-tricore-cross.docker  | 1 -
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 5 ++---
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 5 ++---
 tests/docker/dockerfiles/fedora.docker                | 5 ++---
 tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
 tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
 tests/lcitool/libvirt-ci                              | 2 +-
 tests/lcitool/projects/qemu.yml                       | 1 -
 tests/lcitool/refresh                                 | 6 +++---
 tests/vm/centos.aarch64                               | 2 +-
 25 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index e3fc3235b9..f32f01a954 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 9f56babd9c..813c051616 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index ef9e14b373..33bb4e1040 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index b04c2b7cee..58438008ee 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -155,7 +155,6 @@
           - nettle-devel
           - ninja-build
           - nmap-ncat
-          - perl-Test-Harness
           - pixman-devel
           - python36
           - rdma-core-devel
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 094f66f4eb..3293c790c9 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -77,7 +77,6 @@ RUN apk update && \
         numactl-dev \
         openssh-client \
         pcre-dev \
-        perl \
         pixman-dev \
         pkgconf \
         pulseaudio-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1f70d41aeb..f13745e6cc 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -91,7 +91,6 @@ RUN dnf distro-sync -y && \
         openssh-clients \
         pam-devel \
         pcre-static \
-        perl \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 5e57309361..d0ace6d0f7 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index bfeab01ee3..0517c4c315 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -108,7 +108,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       nettle-dev \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 98885bd0ee..9ac1c1ba3f 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index d5c08714e4..8be492f4ad 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 471444fcf4..da789e04af 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 15b0224b76..8b7c59c4f9 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index a5d3ca6e2f..f9f1ed5fd2 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index d2954e61f6..e423d88c2d 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index d43ce16317..c1134f4cec 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -40,7 +40,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       ncat \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index b573b9ded2..34b2cea4e3 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -28,7 +28,6 @@ RUN apt update && \
        locales \
        make \
        ninja-build \
-       perl-base \
        pkgconf \
        python3-pip \
        python3-setuptools \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 75383ba185..de811b332b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
@@ -42,7 +42,6 @@ exec "$@"' > /usr/bin/nosync && \
                nmap-ncat \
                openssh-clients \
                pcre-static \
-               perl-base \
                python3 \
                python3-PyYAML \
                python3-numpy \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 98c03dc13b..71681d6f92 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
@@ -42,7 +42,6 @@ exec "$@"' > /usr/bin/nosync && \
                nmap-ncat \
                openssh-clients \
                pcre-static \
-               perl-base \
                python3 \
                python3-PyYAML \
                python3-numpy \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index d200c7fc10..ca3793b04b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-37 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
@@ -98,7 +98,6 @@ exec "$@"' > /usr/bin/nosync && \
                openssh-clients \
                pam-devel \
                pcre-static \
-               perl-base \
                pixman-devel \
                pkgconfig \
                pulseaudio-libs-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4361b01464..680f49e7dc 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -88,7 +88,6 @@ RUN zypper update -y && \
            openssh \
            pam-devel \
            pcre-devel-static \
-           perl-base \
            pkgconfig \
            python3-Pillow \
            python3-PyYAML \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 9417bca2fa..6594bba338 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -105,7 +105,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       nettle-dev \
                       ninja-build \
                       openssh-client \
-                      perl-base \
                       pkgconf \
                       python3 \
                       python3-numpy \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3eb28cf2e..53f124b75d 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
+Subproject commit 53f124b75dc1314e310aa2ed775a9f7761a34ec8
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index c62dbc00f9..c2af92348a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -83,7 +83,6 @@ packages:
  - ncursesw
  - pam
  - pcre-static
- - perl
  - pixman
  - pkg-config
  - pulseaudio
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index fa966e4009..a5ea0efc3b 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -111,7 +111,7 @@ try:
     generate_dockerfile("centos8", "centos-stream-8")
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
-    generate_dockerfile("fedora", "fedora-35")
+    generate_dockerfile("fedora", "fedora-37")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
     generate_dockerfile("ubuntu2004", "ubuntu-2004",
                         trailer="".join(ubuntu2004_tsanhack))
@@ -161,12 +161,12 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win32-cross", "fedora-35",
+    generate_dockerfile("fedora-win32-cross", "fedora-37",
                         cross="mingw32",
                         trailer=cross_build("i686-w64-mingw32-",
                                             "i386-softmmu"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-35",
+    generate_dockerfile("fedora-win64-cross", "fedora-37",
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
                                             "x86_64-softmmu"))
diff --git a/tests/vm/centos.aarch64 b/tests/vm/centos.aarch64
index 2de7ef6992..3f58de1e64 100755
--- a/tests/vm/centos.aarch64
+++ b/tests/vm/centos.aarch64
@@ -28,7 +28,7 @@ DEFAULT_CONFIG = {
         "dnf config-manager --set-enabled powertools, "
         "dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo, "
         "dnf install -y make ninja-build git python38 gcc gcc-c++ flex bison "\
-            "glib2-devel perl pixman-devel zlib-devel docker-ce.aarch64, "
+            "glib2-devel pixman-devel zlib-devel docker-ce.aarch64, "
         "systemctl enable docker, "
     ),
     # We increase beyond the default time since during boot
-- 
2.39.0


