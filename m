Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF1A5EF598
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:40:31 +0200 (CEST)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsq6-0006W2-Dw
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw9-0004Qr-Fr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw6-0001DD-0L
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c11so1731690wrp.11
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=w1BOfNfTbPWbCCE6wFUXTgdO0ZaYbGzKjJsePIlPIOs=;
 b=wzDSUtqndCNJsl4STjdpK3A4trf0XSaj42XHJR9BHBmE0KlccyTdTHaaX5HlMTonPv
 OzbF8Y87FWT6ktIVWyRf6v6t/GUeahZE4117rqyyj8VAnLHFnfYezG28UH5vQwAk6mOA
 8WlSUCTEgssgKVAyQ2skgIucmh3NMiluSwSHs+OEo1iCNYpGxUvURIeBJLVDwmIVG93Q
 kE3fl78mtEChAQnF2b2qm/d1s7A/Sx3yJE8J6ZO/CCKO4RraPUCsRQ2/ooiyLLA2U60O
 /DxCHtO7r67/t6ZC63oriYQ/GRd2o+6yG/g0WGjcML2uA/1uU1hkLcdm/788dhV+Egwd
 y6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=w1BOfNfTbPWbCCE6wFUXTgdO0ZaYbGzKjJsePIlPIOs=;
 b=J+O64P/nZ/Lfds9kxaKyLbgGCjl2cglS2sG8cq1OY8Elyaw86Pl6sStvjQMJVjRZzI
 QJ0wj2mq0plp1mnE+si97XP+urrB03KqTISDPkNLJjnWFZnXO2GgMUDDl9NPVJfhmpyl
 FZBL2FFdjJb2s9QE/Un/3tTPVgQ7VbuPkGOKW0zzxqGnUB+pk7m+4ArY7BHQVD/TdW42
 r566NNH32F1jyJ7xjIg7i5CMXXuTJpdgRBnkZLkRV0hBWk2AxMUZoOSWqCvQQI+NQbnQ
 P6VoKUSfhfwoMXCqVwp86GLjh7c5D2aLZgvlHnI0tWi+asEy8EKijnksr/QV0AslUC10
 Wy3w==
X-Gm-Message-State: ACrzQf2QDZ1p+ZptORyuOJsZfgF4CC8Sd7nG8a9KowoqKlWK4IsGHvjv
 19CzIQSJY51xJk1zCYsUTXMvyg==
X-Google-Smtp-Source: AMsMyM4uWA3SbMbdpieUFIRWZXklZSP7cj9hqEWpKnqaHZCagqRKl0jhAKPR7ivI15u/seJG2cNxLg==
X-Received: by 2002:a5d:6dad:0:b0:22c:cedf:8e56 with SMTP id
 u13-20020a5d6dad000000b0022ccedf8e56mr2060621wrs.596.1664451756462; 
 Thu, 29 Sep 2022 04:42:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6289000000b00226dfac0149sm6324553wru.114.2022.09.29.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 236B51FFBF;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 07/51] target/hexagon: regenerate docker/cirrus files
Date: Thu, 29 Sep 2022 12:41:47 +0100
Message-Id: <20220929114231.583801-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Anton Johansson <anjo@rev.ng>

This patch updates the docker and cirrus files with the new packages by
running tests/lcitool/refresh

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220804115548.13024-10-anjo@rev.ng>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
 .gitlab-ci.d/cirrus/macos-11.vars                     | 2 +-
 tests/docker/dockerfiles/alpine.docker                | 2 ++
 tests/docker/dockerfiles/centos8.docker               | 2 ++
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 +++
 tests/docker/dockerfiles/debian-amd64.docker          | 2 ++
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 +++
 tests/docker/dockerfiles/debian-armel-cross.docker    | 3 +++
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 +++
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +++
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 +++
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 +++
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 +++
 tests/docker/dockerfiles/fedora.docker                | 2 ++
 tests/docker/dockerfiles/opensuse-leap.docker         | 2 ++
 tests/docker/dockerfiles/ubuntu2004.docker            | 2 ++
 17 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 1a5959810f..c3db1d7d30 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 5e5aafd7e5..d31faa787f 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index bec6e862d4..aee9f50de6 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 806cb19f17..7d6e95275a 100644
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
@@ -30,6 +31,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
+        flex \
         fuse3-dev \
         g++ \
         gcc \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3c29883332..d89113c0df 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -17,6 +17,7 @@ RUN dnf distro-sync -y && \
         alsa-lib-devel \
         bash \
         bc \
+        bison \
         brlapi-devel \
         bzip2 \
         bzip2-devel \
@@ -31,6 +32,7 @@ RUN dnf distro-sync -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        flex \
         fuse3-devel \
         gcc \
         gcc-c++ \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 7d2feb7bf7..9047759e76 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
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
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 8d78ba2484..a8b728ca64 100644
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
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b7ba2c527f..17a5709245 100644
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
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 9b1778261e..701fc70db0 100644
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
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index addbc9a793..5a11fe3900 100644
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
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 1bb7d8e184..9b90a4d6ff 100644
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
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index a94b459b23..02feaf26cb 100644
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
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index c641fd5d0e..97d3872ee2 100644
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
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index c0cbe09e66..95585e9e56 100644
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
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index b39d311bbc..fe84166ca1 100644
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
@@ -37,6 +38,7 @@ exec "$@"' > /usr/bin/nosync && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        flex \
         fuse3-devel \
         gcc \
         gcc-c++ \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 041cf9c1ff..d80064756f 100644
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
@@ -22,6 +23,7 @@ RUN zypper update -y && \
            dbus-1 \
            diffutils \
            findutils \
+           flex \
            fuse3-devel \
            gcc \
            gcc-c++ \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index e1f4ed7c80..24594afc15 100644
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
-- 
2.34.1


