Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1924B702DF0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:20:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXrw-0005bv-3c; Mon, 15 May 2023 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqr-0004U0-B7
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqj-00010p-Qw
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upHoAtlJmXg/oCVzOrJe2a5fT4i9L00TrRm8zpjHZZc=;
 b=Ju9zIGFRgtb42thTSnU52LCUDOTQukqDd6oegiXRniHIgTOafy5+8KT1y80a5R7hVv9CJY
 xVDMW2t1MFzNu8a9Rl3qVjBJ4vdPfe0/5BKXy411XfLWczYAyhwB2zSa+Lpz4r/r4Sb2bX
 CXzK3YA/hSzyfC8zm1YCsjBQmpgxaXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-K8SP8DnCNp-WS3ig8s-87w-1; Mon, 15 May 2023 09:02:47 -0400
X-MC-Unique: K8SP8DnCNp-WS3ig8s-87w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA6A1C0ED13;
 Mon, 15 May 2023 13:02:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6CE40C6EC4;
 Mon, 15 May 2023 13:02:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Ani Sinha <anisinha@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 08/21] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
Date: Mon, 15 May 2023 15:02:20 +0200
Message-Id: <20230515130233.418183-9-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Ani Sinha <anisinha@redhat.com>

Bios bits avocado tests need mformat (provided by the mtools package) and
xorriso tools in order to run within gitlab CI containers. Add those
dependencies within the Dockerfiles so that containers can be built with
those tools present and bios bits avocado tests can be run there.

xorriso package conflicts with genisoimage package on some distributions.
Therefore, it is not possible to have both the packages at the same time
in the container image uniformly for all distribution flavors. Further,
on some distributions like RHEL, both xorriso and genisoimage
packages provide /usr/bin/genisoimage and on some other distributions like
Fedora, only genisoimage package provides the same utility.
Therefore, this change removes the dependency on geninsoimage for building
container images altogether keeping only xorriso package. At the same time,
cdrom-test.c is updated to use and check for existence of only xorrisofs.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20230504154611.85854-3-anisinha@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cdrom-test.c                           | 14 +++++++-------
 .gitlab-ci.d/cirrus/freebsd-13.vars                |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                  |  2 +-
 tests/docker/dockerfiles/alpine.docker             |  3 ++-
 tests/docker/dockerfiles/centos8.docker            |  3 ++-
 tests/docker/dockerfiles/debian-amd64-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-amd64.docker       |  3 ++-
 tests/docker/dockerfiles/debian-arm64-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-armel-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-armhf-cross.docker |  3 ++-
 .../dockerfiles/debian-mips64el-cross.docker       |  3 ++-
 .../docker/dockerfiles/debian-mipsel-cross.docker  |  3 ++-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |  3 ++-
 tests/docker/dockerfiles/debian-s390x-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora-win32-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora-win64-cross.docker |  3 ++-
 tests/docker/dockerfiles/fedora.docker             |  3 ++-
 tests/docker/dockerfiles/opensuse-leap.docker      |  3 ++-
 tests/docker/dockerfiles/ubuntu2004.docker         |  3 ++-
 tests/docker/dockerfiles/ubuntu2204.docker         |  3 ++-
 tests/lcitool/projects/qemu.yml                    |  3 ++-
 21 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 31d3bacd8c..2b7e10d920 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -17,7 +17,7 @@
 
 static char isoimage[] = "cdrom-boot-iso-XXXXXX";
 
-static int exec_genisoimg(const char **args)
+static int exec_xorrisofs(const char **args)
 {
     gchar *out_err = NULL;
     gint exit_status = -1;
@@ -43,7 +43,7 @@ static int prepare_image(const char *arch, char *isoimage)
     char *codefile = NULL;
     int ifh, ret = -1;
     const char *args[] = {
-        "genisoimage", "-quiet", "-l", "-no-emul-boot",
+        "xorrisofs", "-quiet", "-l", "-no-emul-boot",
         "-b", NULL, "-o", isoimage, srcdir, NULL
     };
 
@@ -75,9 +75,9 @@ static int prepare_image(const char *arch, char *isoimage)
     }
 
     args[5] = strchr(codefile, '/') + 1;
-    ret = exec_genisoimg(args);
+    ret = exec_xorrisofs(args);
     if (ret) {
-        fprintf(stderr, "genisoimage failed: %i\n", ret);
+        fprintf(stderr, "xorrisofs failed: %i\n", ret);
     }
 
     unlink(codefile);
@@ -211,12 +211,12 @@ int main(int argc, char **argv)
 {
     int ret;
     const char *arch = qtest_get_arch();
-    const char *genisocheck[] = { "genisoimage", "-version", NULL };
+    const char *xorrisocheck[] = { "xorrisofs", "-version", NULL };
 
     g_test_init(&argc, &argv, NULL);
 
-    if (exec_genisoimg(genisocheck)) {
-        /* genisoimage not available - so can't run tests */
+    if (exec_xorrisofs(xorrisocheck)) {
+        /* xorrisofs not available - so can't run tests */
         return g_test_run();
     }
 
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7622c849b2..facb649f5b 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson mtools ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 xorriso zstd'
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
index 81c70aeaf9..0097637dca 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -19,7 +19,6 @@ RUN apk update && \
         ca-certificates \
         capstone-dev \
         ccache \
-        cdrkit \
         ceph-dev \
         clang \
         cmocka-dev \
@@ -67,6 +66,7 @@ RUN apk update && \
         make \
         mesa-dev \
         meson \
+        mtools \
         multipath-tools \
         musl-dev \
         ncurses-dev \
@@ -108,6 +108,7 @@ RUN apk update && \
         which \
         xen-dev \
         xfsprogs-dev \
+        xorriso \
         zlib-dev \
         zlib-static \
         zstd \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1a6a9087c1..78f454b782 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -36,7 +36,6 @@ RUN dnf distro-sync -y && \
         fuse3-devel \
         gcc \
         gcc-c++ \
-        genisoimage \
         gettext \
         git \
         glib2-devel \
@@ -82,6 +81,7 @@ RUN dnf distro-sync -y && \
         lzo-devel \
         make \
         mesa-libgbm-devel \
+        mtools \
         ncurses-devel \
         nettle-devel \
         ninja-build \
@@ -114,6 +114,7 @@ RUN dnf distro-sync -y && \
         vte291-devel \
         which \
         xfsprogs-devel \
+        xorriso \
         zlib-devel \
         zlib-static \
         zstd && \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 2e7eb445f1..40a2b6acc4 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 28e2fa81b1..e39871c7bb 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -28,7 +28,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       g++ \
                       gcc \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -103,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -127,6 +127,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index f558770f84..c99300bbfa 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index f3d7e07cce..5db5c78b31 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 531c556ad5..ae6600b25f 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 816dbd2911..daa2d48e36 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index b115b29af3..5af04e2054 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 301bddb536..1eeba7fcab 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 5d27c91c17..52e89a6dab 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -25,7 +25,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       findutils \
                       flex \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -37,6 +36,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       ncat \
                       ninja-build \
                       openssh-client \
@@ -57,6 +57,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
+                      xorriso \
                       zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index e7966ec7fd..dc72ae9cc9 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -30,7 +30,6 @@ exec "$@"\n' > /usr/bin/nosync && \
                findutils \
                flex \
                gcovr \
-               genisoimage \
                git \
                glib2-devel \
                glibc-langpack-en \
@@ -38,6 +37,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                llvm \
                make \
                meson \
+               mtools \
                ninja-build \
                nmap-ncat \
                openssh-clients \
@@ -59,6 +59,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                tesseract-langpack-eng \
                util-linux \
                which \
+               xorriso \
                zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 86c3a8f2ac..7eb4a5dba2 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -30,7 +30,6 @@ exec "$@"\n' > /usr/bin/nosync && \
                findutils \
                flex \
                gcovr \
-               genisoimage \
                git \
                glib2-devel \
                glibc-langpack-en \
@@ -38,6 +37,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                llvm \
                make \
                meson \
+               mtools \
                ninja-build \
                nmap-ncat \
                openssh-clients \
@@ -59,6 +59,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                tesseract-langpack-eng \
                util-linux \
                which \
+               xorriso \
                zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index b698b7595d..3a69eefdda 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -43,7 +43,6 @@ exec "$@"\n' > /usr/bin/nosync && \
                gcc \
                gcc-c++ \
                gcovr \
-               genisoimage \
                gettext \
                git \
                glib2-devel \
@@ -90,6 +89,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                make \
                mesa-libgbm-devel \
                meson \
+               mtools \
                ncurses-devel \
                nettle-devel \
                ninja-build \
@@ -128,6 +128,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                which \
                xen-devel \
                xfsprogs-devel \
+               xorriso \
                zlib-devel \
                zlib-static \
                zstd && \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index afb9f5419f..185abe57d8 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -81,7 +81,7 @@ RUN zypper update -y && \
            lttng-ust-devel \
            lzo-devel \
            make \
-           mkisofs \
+           mtools \
            ncat \
            ncurses-devel \
            ninja \
@@ -111,6 +111,7 @@ RUN zypper update -y && \
            which \
            xen-devel \
            xfsprogs-devel \
+           xorriso \
            zlib-devel \
            zlib-devel-static \
            zstd && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index aa2f5ca7b4..8f864d19e6 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -28,7 +28,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       g++ \
                       gcc \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -100,6 +99,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       llvm \
                       locales \
                       make \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -126,6 +126,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 3f7d30e5d0..1d442cdfe6 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -28,7 +28,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       g++ \
                       gcc \
                       gcovr \
-                      genisoimage \
                       gettext \
                       git \
                       hostname \
@@ -103,6 +102,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       locales \
                       make \
                       meson \
+                      mtools \
                       multipath-tools \
                       ncat \
                       nettle-dev \
@@ -127,6 +127,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
+                      xorriso \
                       zlib1g-dev \
                       zstd && \
     eatmydata apt-get autoremove -y && \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index af3700379a..566db8313b 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -26,7 +26,6 @@ packages:
  - gcc
  - gcovr
  - gettext
- - genisoimage
  - glib2
  - glib2-native
  - glib2-static
@@ -73,6 +72,7 @@ packages:
  - llvm
  - lttng-ust
  - lzo
+ - mtools
  - netcat
  - nettle
  - ninja
@@ -116,6 +116,7 @@ packages:
  - which
  - xen
  - xfsprogs
+ - xorriso
  - zstdtools
  - zlib
  - zlib-static
-- 
2.31.1


