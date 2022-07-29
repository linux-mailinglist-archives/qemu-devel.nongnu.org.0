Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD12A584E06
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:30:15 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMJx-00006l-3l
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9z-0002Vh-7D
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9w-0005s9-4E
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso2209639wms.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWs22E+OLc1dgV2D716Uqj1nygUp2lEcOLcEu7aNjhA=;
 b=E8XkGejQI3FwcZWFkFvyoFMb6mwAj2luf4IYOxK9os6HEnOJEPbzdGm7yJ0d2wUUnH
 B+k0HR7LU7fFoTPCDWywQRMFAfeGSTdkuKzRKlypHz+jTbaj0/o0kcdV0gyLBw+1qV+p
 54ktAdg3G7jjimRxEVCld047ov0xIAQ3CmK3fnaIECB/zelMZVHZJMjn5+V5vNuOXerM
 YQW+FhLhSFRz9pVmzPV0qz+lyeWsMtviXKsQL/0Nav9kTLBgq1Dc1nDeT6NiBXF57NMt
 WiRxBZgxv3LNb3RjtZYDoWMHJ4thDSzOzj/VK/MG9eoT9lQ4BL0mZT3cSNuPsbHXvSnq
 nz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UWs22E+OLc1dgV2D716Uqj1nygUp2lEcOLcEu7aNjhA=;
 b=AHMCoGFK1489QzZ+JLosGJtraYgvCDFq5opbJq8jkvgS6hfz1Fcib+t1eFVaiTItL8
 Xrp++3tYHia4LA/cwSB4xsBRLPNdh8Yc/Ff7tKYaegJ522YHf5OPv/yZ1a9gqVumxpy5
 I237W1iKgnoIpMnyEPgWaZ+/54fre6U3ERmmHwR9WVzmE6wU+dyJZll7BtPCq9hiNr0r
 95WYh+Tsf9mQKsJhgeDLdTsVuN/kb0TffKLNG8ajRA2TnxB0ILjFaGKJVRtUjs2/d4w1
 E4CvyDVycl5o3yLAtO9kgHsrfV3TbxO6gXYwOMcsuO2H1wdB5IY8mldIYd8cz0ORjNRf
 6NJg==
X-Gm-Message-State: AJIora/FtKU/e4xsTw1aWb2fatfECTtHORq6BgoaEDr52n+3qCr8RjgL
 qd1YwyFXg4I+mAvZQ9GTrtErRg==
X-Google-Smtp-Source: AGRyM1sF1mQ9INR4AaZl9QpLzrR4uQdtdB/0atFTpsK8R/9lx1diBZ78ysXLV78ByzetV4HR4Vn7LA==
X-Received: by 2002:a05:600c:1e8a:b0:3a3:20fc:a651 with SMTP id
 be10-20020a05600c1e8a00b003a320fca651mr1819758wmb.39.1659086389479; 
 Fri, 29 Jul 2022 02:19:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003a2e1883a27sm10034734wmq.18.2022.07.29.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF72F1FFB8;
 Fri, 29 Jul 2022 10:19:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/13] tests: refresh to latest libvirt-ci module
Date: Fri, 29 Jul 2022 10:19:31 +0100
Message-Id: <20220729091943.2152410-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Notable changes:

  - libvirt-ci source tree was re-arranged, so the script we
    run now lives in a bin/ sub-dir

  - opensuse 15.2 is replaced by opensuse 15.3

  - libslirp is temporarily dropped on opensuse as the
    libslirp-version.h is broken

     https://bugzilla.opensuse.org/show_bug.cgi?id=1201551

  - The incorrectly named python3-virtualenv module was
    changed to python3-venv, but most distros don't need
    any package as 'venv' is a standard part of python

  - glibc-static was renamed to libc-static, to reflect
    fact that it isn't going to be glibc on all distros

  - The cmocka/json-c deps that were manually added to
    the centos dockerfile and are now consistently added
    to all targets

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220722130431.2319019-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220725140520.515340-2-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index f59263731f..8fa5a320e9 100644
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
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 40fc961398..8ed7e33a77 100644
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
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv perl5 pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index cfe9181fd4..bec6e862d4 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
-PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PKGS='bash bc bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 3f4c0f95cb..806cb19f17 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -21,6 +21,7 @@ RUN apk update && \
         cdrkit \
         ceph-dev \
         clang \
+        cmocka-dev \
         ctags \
         curl-dev \
         cyrus-sasl-dev \
@@ -39,6 +40,7 @@ RUN apk update && \
         glib-static \
         gnutls-dev \
         gtk+3.0-dev \
+        json-c-dev \
         libaio-dev \
         libbpf-dev \
         libcap-ng-dev \
@@ -64,6 +66,7 @@ RUN apk update && \
         mesa-dev \
         meson \
         multipath-tools \
+        musl-dev \
         ncurses-dev \
         ndctl-dev \
         net-tools \
@@ -81,7 +84,6 @@ RUN apk update && \
         py3-pip \
         py3-sphinx \
         py3-sphinx_rtd_theme \
-        py3-virtualenv \
         py3-yaml \
         python3 \
         rpm2cpio \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 10618bfa83..3c29883332 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -6,11 +6,12 @@
 
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
@@ -45,6 +46,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
@@ -60,7 +62,6 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
-        json-c-devel \
         libnfs-devel \
         libpmem-devel \
         libpng-devel \
@@ -99,7 +100,6 @@ RUN dnf update -y && \
         python3-pip \
         python3-sphinx \
         python3-sphinx_rtd_theme \
-        python3-virtualenv \
         rdma-core-devel \
         rpm \
         sed \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 503e282802..8d78ba2484 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -41,6 +41,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev \
             libcap-ng-dev \
             libcapstone-dev \
+            libcmocka-dev \
             libcurl4-gnutls-dev \
             libdaxctl-dev \
             libdrm-dev \
@@ -59,6 +60,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg62-turbo-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b60426834c..b7ba2c527f 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:arm64 \
             libcap-ng-dev:arm64 \
             libcapstone-dev:arm64 \
+            libcmocka-dev:arm64 \
             libcurl4-gnutls-dev:arm64 \
             libdaxctl-dev:arm64 \
             libdrm-dev:arm64 \
@@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:arm64 \
             libjemalloc-dev:arm64 \
             libjpeg62-turbo-dev:arm64 \
+            libjson-c-dev:arm64 \
             liblttng-ust-dev:arm64 \
             liblzo2-dev:arm64 \
             libncursesw5-dev:arm64 \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index a6153e5a83..9b1778261e 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:armel \
             libcap-ng-dev:armel \
             libcapstone-dev:armel \
+            libcmocka-dev:armel \
             libcurl4-gnutls-dev:armel \
             libdaxctl-dev:armel \
             libdrm-dev:armel \
@@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:armel \
             libjemalloc-dev:armel \
             libjpeg62-turbo-dev:armel \
+            libjson-c-dev:armel \
             liblttng-ust-dev:armel \
             liblzo2-dev:armel \
             libncursesw5-dev:armel \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index a2ebce96f8..addbc9a793 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:armhf \
             libcap-ng-dev:armhf \
             libcapstone-dev:armhf \
+            libcmocka-dev:armhf \
             libcurl4-gnutls-dev:armhf \
             libdaxctl-dev:armhf \
             libdrm-dev:armhf \
@@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:armhf \
             libjemalloc-dev:armhf \
             libjpeg62-turbo-dev:armhf \
+            libjson-c-dev:armhf \
             liblttng-ust-dev:armhf \
             liblzo2-dev:armhf \
             libncursesw5-dev:armhf \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index b02dcb7fd9..1bb7d8e184 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -83,6 +83,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:mips64el \
             libcap-ng-dev:mips64el \
             libcapstone-dev:mips64el \
+            libcmocka-dev:mips64el \
             libcurl4-gnutls-dev:mips64el \
             libdaxctl-dev:mips64el \
             libdrm-dev:mips64el \
@@ -101,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:mips64el \
             libjemalloc-dev:mips64el \
             libjpeg62-turbo-dev:mips64el \
+            libjson-c-dev:mips64el \
             liblttng-ust-dev:mips64el \
             liblzo2-dev:mips64el \
             libncursesw5-dev:mips64el \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index b6d99ae324..a94b459b23 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -83,6 +83,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:mipsel \
             libcap-ng-dev:mipsel \
             libcapstone-dev:mipsel \
+            libcmocka-dev:mipsel \
             libcurl4-gnutls-dev:mipsel \
             libdaxctl-dev:mipsel \
             libdrm-dev:mipsel \
@@ -101,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:mipsel \
             libjemalloc-dev:mipsel \
             libjpeg62-turbo-dev:mipsel \
+            libjson-c-dev:mipsel \
             liblttng-ust-dev:mipsel \
             liblzo2-dev:mipsel \
             libncursesw5-dev:mipsel \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index bcf04bc90b..c641fd5d0e 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:ppc64el \
             libcap-ng-dev:ppc64el \
             libcapstone-dev:ppc64el \
+            libcmocka-dev:ppc64el \
             libcurl4-gnutls-dev:ppc64el \
             libdaxctl-dev:ppc64el \
             libdrm-dev:ppc64el \
@@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:ppc64el \
             libjemalloc-dev:ppc64el \
             libjpeg62-turbo-dev:ppc64el \
+            libjson-c-dev:ppc64el \
             liblttng-ust-dev:ppc64el \
             liblzo2-dev:ppc64el \
             libncursesw5-dev:ppc64el \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index ff79a2cc4f..c0cbe09e66 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -84,6 +84,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev:s390x \
             libcap-ng-dev:s390x \
             libcapstone-dev:s390x \
+            libcmocka-dev:s390x \
             libcurl4-gnutls-dev:s390x \
             libdaxctl-dev:s390x \
             libdrm-dev:s390x \
@@ -102,6 +103,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev:s390x \
             libjemalloc-dev:s390x \
             libjpeg62-turbo-dev:s390x \
+            libjson-c-dev:s390x \
             liblttng-ust-dev:s390x \
             liblzo2-dev:s390x \
             libncursesw5-dev:s390x \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 2e6a84abfd..b39d311bbc 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -53,12 +53,14 @@ exec "$@"' > /usr/bin/nosync && \
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
@@ -106,7 +108,6 @@ exec "$@"' > /usr/bin/nosync && \
         python3-pip \
         python3-sphinx \
         python3-sphinx_rtd_theme \
-        python3-virtualenv \
         rdma-core-devel \
         rpm \
         sed \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 6f5993d602..047a435ab5 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.opensuse.org/opensuse/leap:15.2
+FROM registry.opensuse.org/opensuse/leap:15.3
 
 RUN zypper update -y && \
     zypper install -y \
@@ -44,6 +44,7 @@ RUN zypper update -y && \
            libbz2-devel \
            libcacard-devel \
            libcap-ng-devel \
+           libcmocka-devel \
            libcurl-devel \
            libdrm-devel \
            libepoxy-devel \
@@ -53,6 +54,7 @@ RUN zypper update -y && \
            libgnutls-devel \
            libiscsi-devel \
            libjpeg8-devel \
+           libjson-c-devel \
            libndctl-devel \
            libnettle-devel \
            libnfs-devel \
@@ -94,7 +96,6 @@ RUN zypper update -y && \
            python3-pip \
            python3-setuptools \
            python3-sphinx_rtd_theme \
-           python3-virtualenv \
            python3-wheel \
            rdma-core-devel \
            rpm \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index a3b38884e3..99803b343b 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -40,6 +40,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libcacard-dev \
             libcap-ng-dev \
             libcapstone-dev \
+            libcmocka-dev \
             libcurl4-gnutls-dev \
             libdaxctl-dev \
             libdrm-dev \
@@ -58,6 +59,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index f83b916d5e..324355cf62 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
+Subproject commit 324355cf62e86fb551408575afb123bac989ac37
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d068a7a8de..d9f826f8eb 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -9,6 +9,7 @@ packages:
  - capstone
  - ccache
  - clang
+ - cmocka
  - column
  - ctags
  - cyrus-sasl
@@ -26,15 +27,16 @@ packages:
  - genisoimage
  - glib2
  - glib2-static
- - glibc-static
  - glusterfs
  - gnutls
  - gtk3
  - hostname
+ - json-c
  - libaio
  - libattr
  - libasan
  - libbpf
+ - libc-static
  - libcacard
  - libcap-ng
  - libcurl
@@ -90,7 +92,7 @@ packages:
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
2.30.2


