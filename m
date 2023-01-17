Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65266D9AC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHi5W-0004rA-Uj; Tue, 17 Jan 2023 04:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5R-0004pT-Na
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5P-0005hw-0g
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673947014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BiN+2nWCyXksO6VodvH0/myGf8wzFv623Y9KPr/HmU=;
 b=RMlxTG9fbx93HpLUBqOfrOv3hbXEdXJAvxTotxoxY3hBBRDh4QaEHEVCUsDVc4YaT1AK17
 HCCxhsme8EW5oIE8c0P0dlWmIX9Njmt/6JJ7HwH/xYEJ7p6fU0wL1qYq/TeA4epLJy9Yx6
 Z8OFGcWE1SNuWAxRxpqlVyRiv+Pxx0o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-hr_tTf5fMPKRvv71lJfDzg-1; Tue, 17 Jan 2023 04:16:52 -0500
X-MC-Unique: hr_tTf5fMPKRvv71lJfDzg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so17319521ejc.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BiN+2nWCyXksO6VodvH0/myGf8wzFv623Y9KPr/HmU=;
 b=ltk08sLt7DdLR1ugmMB03uvqU0O7hWfdz8JBxr/2dD+ik5J4xCuqiKyMRvORB2ADAs
 yCF03sNl7R8IMXr5dwyGlpcmJqK3x9yWetgYx/qOmuk983pFsiIkAxBsaf9R6jPDI0ZA
 4qcRldzohti6DB4Xnv4//AMaqBcLpna/6uAt42BtkStTxMpuwFPwDSuMrGZrzyA70HdU
 vG9VznNuirFw/CAAJXccY/lQKO2XW26YiXtJRcL/DxAwa67art1dBWuT9QbHn0dEeS8l
 vwp50MWuMroEByjpC/n5A5ORckxFJl1aLVOvqsLy8owitmkIWmF27eqpnZKcVtAg/6Ig
 1j5w==
X-Gm-Message-State: AFqh2kqZOHrrOF4XtJH+wD3R/vcJXLWbTy7ZOEAOD9mVr/dWdb0QOCmw
 9GUuvN038ckjqTHqtJSOmieU4jF/Iv1orcEM3WNfY9zjSaIvNOz1jzZqVhJFD4zdoj9MCm2Ffx4
 pcuHnsXa1BOr+MULGv41lCH+e5xyM7VkVDpMof1oWGc09PfyTmQnmgoAQZjmQNrhV/BU=
X-Received: by 2002:a17:906:1e42:b0:7c1:458b:a946 with SMTP id
 i2-20020a1709061e4200b007c1458ba946mr1979648ejj.0.1673947011183; 
 Tue, 17 Jan 2023 01:16:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJEvs6KFh7fhpfMKLJ/ZyfdTBoaGcNAmPFZy+u7okqkNSXyjJ3DCNCNd5Tt9uP6BvoR2Q5JQ==
X-Received: by 2002:a17:906:1e42:b0:7c1:458b:a946 with SMTP id
 i2-20020a1709061e4200b007c1458ba946mr1979623ejj.0.1673947010662; 
 Tue, 17 Jan 2023 01:16:50 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056402344400b004822681a671sm12505376edc.37.2023.01.17.01.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:16:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	berrange@redhat.com
Subject: [RFC PATCH 4/4] ci,
 docker: update CentOS and OpenSUSE Python to non-EOL versions
Date: Tue, 17 Jan 2023 10:16:38 +0100
Message-Id: <20230117091638.50523-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117091638.50523-1-pbonzini@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Python 3.6 is at end-of-life.  Update the libvirt-ci module to a
version that supports overrides for targets and package mappings;
this way, QEMU can use the newer versions provided by CentOS 8 (Python
3.8) and OpenSUSE 15.3 (Python 3.9).

One unexpected issue is that sphinx-rtd-theme does not want versions
of docutils starting with 0.18.  For distro-installed packages we can
assume that the packager knew this, but when installing from PyPI the
package version needs to be constrained by hand.  In order to do this,
add the docutils package explicitly to the qemu project file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 scripts/ci/setup/build-environment.yml        |  2 +-
 tests/docker/dockerfiles/alpine.docker        |  1 +
 tests/docker/dockerfiles/centos8.docker       | 23 +++---
 .../dockerfiles/debian-amd64-cross.docker     |  1 +
 tests/docker/dockerfiles/debian-amd64.docker  |  1 +
 .../dockerfiles/debian-arm64-cross.docker     |  1 +
 .../dockerfiles/debian-armel-cross.docker     |  1 +
 .../dockerfiles/debian-armhf-cross.docker     |  1 +
 .../dockerfiles/debian-mips64el-cross.docker  |  1 +
 .../dockerfiles/debian-mipsel-cross.docker    |  1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |  1 +
 .../dockerfiles/debian-s390x-cross.docker     |  1 +
 .../dockerfiles/fedora-win32-cross.docker     |  1 +
 .../dockerfiles/fedora-win64-cross.docker     |  1 +
 tests/docker/dockerfiles/fedora.docker        |  1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 23 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    |  3 +-
 tests/lcitool/mappings.yml                    | 80 +++++++++++++++++++
 tests/lcitool/projects/qemu.yml               |  1 +
 tests/lcitool/targets/centos-stream-8.yml     |  3 +
 tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
 24 files changed, 131 insertions(+), 26 deletions(-)
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index f395e56fc833..4f73f5097050 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -7,6 +7,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-docutils py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index f395e56fc833..4f73f5097050 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -7,6 +7,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-docutils py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index 7fb182f93e16..4ff6919a2140 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -7,6 +7,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils docutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index b04c2b7ceee9..fee11d1d0543 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -157,7 +157,7 @@
           - nmap-ncat
           - perl-Test-Harness
           - pixman-devel
-          - python36
+          - '@python:3.8/python38'
           - rdma-core-devel
           - spice-glib-devel
           - systemtap-sdt-devel
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 10f68f4e1e6d..84ead77a76ee 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -77,6 +77,7 @@ RUN apk update && \
         pixman-dev \
         pkgconf \
         pulseaudio-dev \
+        py3-docutils \
         py3-numpy \
         py3-pillow \
         py3-pip \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 2318a95e9255..adc7fd483b29 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -78,7 +78,6 @@ RUN dnf distro-sync -y && \
         lzo-devel \
         make \
         mesa-libgbm-devel \
-        meson \
         ncurses-devel \
         nettle-devel \
         ninja-build \
@@ -91,13 +90,12 @@ RUN dnf distro-sync -y && \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
-        python3 \
-        python3-PyYAML \
-        python3-numpy \
-        python3-pillow \
-        python3-pip \
-        python3-sphinx \
-        python3-sphinx_rtd_theme \
+        python38 \
+        python38-PyYAML \
+        python38-numpy \
+        python38-pip \
+        python38-setuptools \
+        python38-wheel \
         rdma-core-devel \
         rpm \
         sed \
@@ -126,8 +124,15 @@ RUN dnf distro-sync -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+RUN /usr/bin/pip3.8 install \
+                    'docutils<0.18' \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.8"
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index bfa88dc7285f..a91f5412ab49 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index e09118c83b2f..14daef8bdaee 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -107,6 +107,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b20197d5b710..d89b7ca4e568 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 792e098f273c..c3eee750db93 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index dbb9cf21e99b..d88123880680 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 712cf98388a1..33a1f680b663 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index c746b7ca04aa..e8b1ea928ff7 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 5591062a8bf1..3e7317250d59 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 9c14f3faca40..276f9422f833 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -39,6 +39,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index d691e54d0c15..0938f1901775 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -41,6 +41,7 @@ exec "$@"' > /usr/bin/nosync && \
                perl-base \
                python3 \
                python3-PyYAML \
+               python3-docutils \
                python3-numpy \
                python3-opencv \
                python3-pillow \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 9f5082e02b3b..d36a04d33551 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -41,6 +41,7 @@ exec "$@"' > /usr/bin/nosync && \
                perl-base \
                python3 \
                python3-PyYAML \
+               python3-docutils \
                python3-numpy \
                python3-opencv \
                python3-pillow \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index c8e99a6b8951..752f683cae76 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -100,6 +100,7 @@ exec "$@"' > /usr/bin/nosync && \
                pulseaudio-libs-devel \
                python3 \
                python3-PyYAML \
+               python3-docutils \
                python3-numpy \
                python3-opencv \
                python3-pillow \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index a98209c15803..e51909496d2e 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -86,16 +86,9 @@ RUN zypper update -y && \
            pcre-devel-static \
            perl-base \
            pkgconfig \
-           python3-Pillow \
-           python3-PyYAML \
-           python3-Sphinx \
-           python3-base \
-           python3-numpy \
-           python3-opencv \
-           python3-pip \
-           python3-setuptools \
-           python3-sphinx_rtd_theme \
-           python3-wheel \
+           python39-base \
+           python39-pip \
+           python39-setuptools \
            rdma-core-devel \
            rpm \
            sed \
@@ -127,10 +120,16 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3.9 install \
+                    PyYAML \
+                    'docutils<0.18' \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.9"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 077460916ade..13b5c4a766a1 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -104,6 +104,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       perl-base \
                       pkgconf \
                       python3 \
+                      python3-docutils \
                       python3-numpy \
                       python3-opencv \
                       python3-pillow \
@@ -136,7 +137,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3 install meson==0.63.2
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
new file mode 100644
index 000000000000..4eef6f425896
--- /dev/null
+++ b/tests/lcitool/mappings.yml
@@ -0,0 +1,80 @@
+mappings:
+  flake8:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  meson:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-PyYAML:
+    CentOSStream8: python38-PyYAML
+    OpenSUSELeap153:
+
+  python3-devel:
+    CentOSStream8: python38-devel
+    OpenSUSELeap153: python39-devel
+
+  python3-docutils:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-numpy:
+    CentOSStream8: python38-numpy
+    OpenSUSELeap153:
+
+  python3-opencv:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pip:
+    CentOSStream8: python38-pip
+    OpenSUSELeap153: python39-pip
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-selinux:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-setuptools:
+    CentOSStream8: python38-setuptools
+    OpenSUSELeap153: python39-setuptools
+
+  python3-sphinx:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-sphinx-rtd-theme:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-venv:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-wheel:
+    CentOSStream8: python38-wheel
+    OpenSUSELeap153: python39-pip
+
+pypi_mappings:
+  # Request last version
+  meson:
+    default: meson==0.63.2
+
+  python3-docutils:
+    default: docutils<0.18
+
+  # Drop packages that need devel headers
+  python3-numpy:
+    OpenSUSELeap153:
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index c62dbc00f96b..e45e924639ec 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -89,6 +89,7 @@ packages:
  - pulseaudio
  - python3
  - python3-PyYAML
+ - python3-docutils
  - python3-numpy
  - python3-opencv
  - python3-pillow
diff --git a/tests/lcitool/targets/centos-stream-8.yml b/tests/lcitool/targets/centos-stream-8.yml
new file mode 100644
index 000000000000..6b11160fd1dc
--- /dev/null
+++ b/tests/lcitool/targets/centos-stream-8.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.8
+  python: /usr/bin/python3.8
diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-153.yml
new file mode 100644
index 000000000000..683016e0077a
--- /dev/null
+++ b/tests/lcitool/targets/opensuse-leap-153.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.9
+  python: /usr/bin/python3.9
-- 
2.38.1


