Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E75F4438
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:27:06 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhwv-0002Ge-Ua
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYU-0008Ff-K4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYR-0007Nt-Q2
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:50 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j16so9270655wrh.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YIVJJQvlRiAhMhZzxjqeSiXDlFrZQHrITsFN+iorkzo=;
 b=Zgg1EGHLbKFpXRExz6aWrswpxOhTsP4Kj0vilZWs9iYNkRlaSQchNp7izlSk3RozF1
 9HmJwBzjHZD9qgWTFfz5BY+W0tfS+Tv8EYmd3D0CIDMsvIkqnCjuL6R2NqS3v+a1JOPb
 eix7N69suE2RJuREe2k2MbOe2Y4z/dzfZVTM4oFhaRRuwkCbSzP/nZZ3ibGFsK5nwnfp
 pEK0Y6iNwXmWbefjXqL+i9wmCo33147BzxtizdobW7yTe9QnmBJ9rPzDBHTnpBKsdBC/
 rO8/cEV4Bq75PPkBWAV7vh9O95wNDTWwN+JNT78/kK4V4GBZpQEvv9dekUW5o2KQFobT
 3Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YIVJJQvlRiAhMhZzxjqeSiXDlFrZQHrITsFN+iorkzo=;
 b=dJwUPzBBNJKt+PPEtD+tjIqKT2p41Vq+p1D1tZhGXWK7kkQYUdK1hrdMKp77323q6y
 09bd44oaXW63QOf0HXIjkIzpq9AjBAgLYtyNqfpv3VaqNPke2hJ/fC92L3WPdJG6DGPF
 lPIOoAID+Iedxk4/NQH7Tj8o8rtV+3I8tR002zenKn1z+Xqa+7icFpqbFcIhecQHbiAz
 ZBUeUqQPhvpqr3CV4N24xUS6U1u+AKcF1jiWfWcGk673NgnJ6KplPKrj80bVjVKJNEhN
 1AXOoV6DTd6K8CZ9w3xakpczoXpA2wl9eaVZ/bD4PiHhBOycZZNxJTNsjCtf50owx1PI
 a+Ow==
X-Gm-Message-State: ACrzQf2f3QsUvOV4cJ6cJp74mzMsRmxoGlzQu4w5bztDPx++re8KZVIw
 dfmkVtV/x/nEt+aa6Xt67EE5cg==
X-Google-Smtp-Source: AMsMyM4yGG8UcZxdArZsWuca1c4G5FfFfbOeDkCzTdwNAIbTrxtnXQ55B2hofUGMPAFSpAs2LeYATA==
X-Received: by 2002:a05:6000:1842:b0:22a:4d1d:4bd6 with SMTP id
 c2-20020a056000184200b0022a4d1d4bd6mr15967982wri.603.1664888505720; 
 Tue, 04 Oct 2022 06:01:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm19587239wmh.23.2022.10.04.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EB2A1FFBF;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 07/54] target/hexagon: regenerate docker/cirrus files
Date: Tue,  4 Oct 2022 14:00:51 +0100
Message-Id: <20221004130138.2299307-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20220929114231.583801-8-alex.bennee@linaro.org>

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


