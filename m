Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8A6740A0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZOT-0005wL-PK; Thu, 19 Jan 2023 13:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOO-0005va-LN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:04 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOK-0004Hp-3g
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso2663083wmn.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0YfL8vRVyh3lous/0s95D/+xZNaaK4U/ROvzEEMvDk=;
 b=CoF0eDAJJVbZ/BEsw1lJKzskIyKbFI5V5by1qXTRaP5VI0Ai5ozBOuiEIRmujHij99
 AXDdChS4fzn0LEnAFtOzBjJOEzee/zPYQOjVtx0b9fP8QY168LjblQsK9ynZlpKUBIJd
 ZUvipzM6kzBqK04I+EIIWMI6v1Qq01DhUAZBgZ/EciPFzwGzIAb7mW1JIkP4E2fxdwJn
 NJI9xl8uGwwDdfCJ2lhIGQpPAnIaTnbMfIH1z9CK5G/WJD6zFeUiyIpLDbdE/LZsWuMt
 y4VbN20UHWf8DhJ4VHmArDvCKfLHEegZXu3OOMHi4YGIHBQlXCoO33LWR+JcbEaf+l+n
 FAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0YfL8vRVyh3lous/0s95D/+xZNaaK4U/ROvzEEMvDk=;
 b=elbvtJtXPdI2a5ypxrD9wdDmR7SP0QOQ1EV7nr4NLjzMBw4GlGrdhqnxBY03J7IGTW
 n1jSNH3PzWqga0L16GlwT38ZfGOhOvRgBSOMsnHrM45BzrF+/dXdMx1TW7njW4WYVXNs
 +lFv69wbHDbGno8hPEYNYu6i2BTHGrujneaTQNOWOwF/BNK4imC8Wf4k+0JF41d2XhpL
 3PMXXiVWWP57qCMU0QB2O97AqPxTXwYQx6eFZSjp5wjSUq0Q97RLraewHHEsw65gcXNg
 nhidKC/P95VWc/01mZEApal1+t1Kq3ceMxaGMpY668MqMDdqKeN79cQyjjp/anE0EwdO
 98yw==
X-Gm-Message-State: AFqh2ko9EI+1RQm2lo0AcVhMZ9BHZ17mbiWgq96FTEmSK1NvsBJSXqwt
 8m/M2dGrCQPAXbi2cnPWHj6rhw==
X-Google-Smtp-Source: AMrXdXunNxcRf8193TFBF6BgU5tylSdFyBeMJOs7pEjWs6t2N9dw9ajfP0qtGQEnLcaUhgW0/OZXXQ==
X-Received: by 2002:a05:600c:3c91:b0:3da:f5d1:c677 with SMTP id
 bg17-20020a05600c3c9100b003daf5d1c677mr7343131wmb.35.1674151916765; 
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003db11dfc687sm5443818wmc.36.2023.01.19.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC64F1FFB8;
 Thu, 19 Jan 2023 18:04:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 11/18] lcitool: drop perl from QEMU project/dependencies
Date: Thu, 19 Jan 2023 18:04:12 +0000
Message-Id: <20230119180419.30304-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-8-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
 tests/docker/dockerfiles/fedora.docker                | 1 -
 tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
 tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
 tests/lcitool/projects/qemu.yml                       | 1 -
 tests/vm/centos.aarch64                               | 2 +-
 23 files changed, 4 insertions(+), 23 deletions(-)

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
index cc5d1ac4be..de811b332b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -42,7 +42,6 @@ exec "$@"' > /usr/bin/nosync && \
                nmap-ncat \
                openssh-clients \
                pcre-static \
-               perl-base \
                python3 \
                python3-PyYAML \
                python3-numpy \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index cabbf4edfc..71681d6f92 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -42,7 +42,6 @@ exec "$@"' > /usr/bin/nosync && \
                nmap-ncat \
                openssh-clients \
                pcre-static \
-               perl-base \
                python3 \
                python3-PyYAML \
                python3-numpy \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f44b005000..ca3793b04b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
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
2.34.1


