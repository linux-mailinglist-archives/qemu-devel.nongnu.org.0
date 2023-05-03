Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E576F5A80
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:57:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDty-0006h9-BO; Wed, 03 May 2023 10:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDtw-0006gV-Er
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1puDtu-0003KO-5l
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ga5qfW4cOT/Ickp9lNvh+a1NBxQtjVDdaGnnqgwEY8=;
 b=ZLh2zdiiGI+rm2Pz+QCwrhZU5BY7CjWhtG7ySumOsTOYqxRu5EuEH0FWkWsRk3XIBjSbJL
 6iMIkpEVLIbOXTZnurzFgX0gQ/jYpY77+vjNY+MQ+gKQy67XbsZG6/+X54+P4bSeuj/e9k
 JAtaMX0kKGiaC3PARlH/gXTLKF9k4wM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-841xhkZLNVaqfOW2qrvoeQ-1; Wed, 03 May 2023 10:56:10 -0400
X-MC-Unique: 841xhkZLNVaqfOW2qrvoeQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-63b66a3275eso2936124b3a.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683125769; x=1685717769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ga5qfW4cOT/Ickp9lNvh+a1NBxQtjVDdaGnnqgwEY8=;
 b=e3c/ktZekZWZOM+fux/GM7G3a7rxkUjoDT8a5PL6ZJecKWpPsMKeD7nZRpmDf9fo2P
 2gZm0qvmm5BSuXWPLoSEGg1k8fyt13WQecxlMXOdIuNJrkEqOPkVYXzl/ynTlAxXeZ7Q
 2dUIAajK7bv105IP8ECN1eER/kr6hBY/1WIb2oOr0cArSLTS42eFwHEa2XE11vTZ+ACK
 zxz52+MZN7DX65H+aZvZY7qJoYPQ8yMDl1ZzJirIw7dFouVZnvo+FcGfG0rZfyrmLsSh
 NkN7RuzeFaLZDKYRP8USyTitb4m/MnD/eI+bqJblws97qdjnHJSFimR+BQQnxFUeBvWB
 sapg==
X-Gm-Message-State: AC+VfDzD4jNMKfvz0PfsGJWGWeZ6dnREy+rn2DSoRSsBGbAFJMWRstY3
 UTwDCZ9orrSrQfVQgoSafMeZxG6wmtNeuA4R4i38UwR0QBPZEAL4ngSiLvM1daKHiZ949ALvzEu
 4SDDaqI4sZ+e1vlk=
X-Received: by 2002:a05:6a00:1409:b0:63d:4185:402b with SMTP id
 l9-20020a056a00140900b0063d4185402bmr30973826pfu.4.1683125768749; 
 Wed, 03 May 2023 07:56:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5INArtZUk8Hk92nmQwHvob4fQ++bveHLpP48CsM+Y5q9xVmwNJ7VNHCdXBzTLts5RopU//SQ==
X-Received: by 2002:a05:6a00:1409:b0:63d:4185:402b with SMTP id
 l9-20020a056a00140900b0063d4185402bmr30973804pfu.4.1683125768385; 
 Wed, 03 May 2023 07:56:08 -0700 (PDT)
Received: from localhost.localdomain ([115.96.153.99])
 by smtp.googlemail.com with ESMTPSA id
 p14-20020a62ab0e000000b0063a5837d9e8sm23584061pff.156.2023.05.03.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:56:08 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: alex.bennee@linaro.org, philmd@linaro.org, thuth@redhat.com,
 wainersm@redhat.com, bleal@redhat.com, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>, mst@redhat.com,
 berrange@redhat.com
Subject: [PATCH 2/2] tests/lcitool: Add mtools and xorriso as dependency for
 bios bits avocado tests
Date: Wed,  3 May 2023 20:25:47 +0530
Message-Id: <20230503145547.202251-3-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230503145547.202251-1-anisinha@redhat.com>
References: <20230503145547.202251-1-anisinha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bios bits avocado tests need mformat (provided by the mtools package) and
xorriso tools in order to run within gitlab CI containers. Add those
dependencies within the Dockerfiles so that containers can be built with
those tools present.

CC: mst@redhat.com
CC: berrange@redhat.com
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
 tests/docker/dockerfiles/alpine.docker                | 2 ++
 tests/docker/dockerfiles/centos8.docker               | 2 ++
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-amd64.docker          | 2 ++
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-armel-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 2 ++
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 2 ++
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 2 ++
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 2 ++
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora.docker                | 2 ++
 tests/docker/dockerfiles/opensuse-leap.docker         | 2 ++
 tests/docker/dockerfiles/ubuntu2004.docker            | 2 ++
 tests/docker/dockerfiles/ubuntu2204.docker            | 2 ++
 tests/lcitool/projects/qemu.yml                       | 2 ++
 20 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7622c849b2..aea3a25fb3 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson mtools ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 xorriso zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index da6aa6469b..ceb294e153 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson mtools ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 xorriso zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 81c70aeaf9..40ac3af096 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -67,6 +67,7 @@ RUN apk update && \
         make \
         mesa-dev \
         meson \
+        mtools \
         multipath-tools \
         musl-dev \
         ncurses-dev \
@@ -108,6 +109,7 @@ RUN apk update && \
         which \
         xen-dev \
         xfsprogs-dev \
+        xorriso \
         zlib-dev \
         zlib-static \
         zstd \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1a6a9087c1..c1691ac2a3 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -82,6 +82,7 @@ RUN dnf distro-sync -y && \
         lzo-devel \
         make \
         mesa-libgbm-devel \
+        mtools \
         ncurses-devel \
         nettle-devel \
         ninja-build \
@@ -114,6 +115,7 @@ RUN dnf distro-sync -y && \
         vte291-devel \
         which \
         xfsprogs-devel \
+        xorriso \
         zlib-devel \
         zlib-static \
         zstd && \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 2e7eb445f1..a33d677de3 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 28e2fa81b1..4126f66fa1 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -103,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -127,6 +128,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index f558770f84..538bcd998c 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index f3d7e07cce..37cc74d3c5 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 531c556ad5..f423ffc136 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 816dbd2911..90c1652135 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index b115b29af3..38629af0c9 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 301bddb536..0a66dd3af2 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 5d27c91c17..0f7b6ede55 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -37,6 +37,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +58,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index e7966ec7fd..209165fd66 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -38,6 +38,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                llvm \
                make \
                meson \
+               mtools \
                ninja-build \
                nmap-ncat \
                openssh-clients \
@@ -59,6 +60,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                tesseract-langpack-eng \
                util-linux \
                which \
+               xorriso \
                zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 86c3a8f2ac..784e3e4c2d 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -38,6 +38,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                llvm \
                make \
                meson \
+               mtools \
                ninja-build \
                nmap-ncat \
                openssh-clients \
@@ -59,6 +60,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                tesseract-langpack-eng \
                util-linux \
                which \
+               xorriso \
                zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index b698b7595d..a9ad65a76d 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -90,6 +90,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                make \
                mesa-libgbm-devel \
                meson \
+               mtools \
                ncurses-devel \
                nettle-devel \
                ninja-build \
@@ -128,6 +129,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                which \
                xen-devel \
                xfsprogs-devel \
+               xorriso \
                zlib-devel \
                zlib-static \
                zstd && \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index afb9f5419f..0bc6aff53c 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -82,6 +82,7 @@ RUN zypper update -y && \
            lzo-devel \
            make \
            mkisofs \
+           mtools \
            ncat \
            ncurses-devel \
            ninja \
@@ -111,6 +112,7 @@ RUN zypper update -y && \
            which \
            xen-devel \
            xfsprogs-devel \
+           xorriso \
            zlib-devel \
            zlib-devel-static \
            zstd && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index aa2f5ca7b4..57b7bfe9cb 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -100,6 +100,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       llvm \
                       locales \
                       make \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -126,6 +127,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 3f7d30e5d0..eaba38d854 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -103,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -127,6 +128,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index af3700379a..924208df32 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -73,6 +73,7 @@ packages:
  - llvm
  - lttng-ust
  - lzo
+ - mtools
  - netcat
  - nettle
  - ninja
@@ -116,6 +117,7 @@ packages:
  - which
  - xen
  - xfsprogs
+ - xorriso
  - zstdtools
  - zlib
  - zlib-static
-- 
2.31.1


