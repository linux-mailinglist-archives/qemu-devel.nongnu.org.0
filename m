Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730AA6A5F58
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KE-0002YI-Rz; Tue, 28 Feb 2023 14:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JW-0002Fl-EZ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JQ-0002mt-PI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso6878427wmb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVYhUCjpOP2uAT3SZ5vy1u8FJHQqVehe61kdgG7Ht4k=;
 b=rwJ80EWdAmdiOS9M1JjIdrMaMKbNHRnBJMTf415GiiWqSQnxjnGWTb/QtWlLrtzCec
 TX6/Ma5sgDNDL8NUJMNc7DQo2owA275StExHF30FnAo/XQG21tVXVoqooMYHY9YRbpow
 bWUNVr8wPHcdJXxbpuDG6oEuIE0Q19CLFk3TNlgV+RVHz54EvsjHnrGYoKATRhZgtxYc
 ZAUDNdnraY6eY3diYSvNsH+tCZMYICOi0vXRhEfGAVCWqxtIO3+FRE3XfML3Je2G1Xp5
 fBuXqXf99zLzcCOY4jNZIC9pyVKxi2eeDC4/n6b80GV3dHHpUFA1NMe3lPvEgGfYD2Z8
 slSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVYhUCjpOP2uAT3SZ5vy1u8FJHQqVehe61kdgG7Ht4k=;
 b=nqta5r+r8ZfS6ccAJHWN4jHiN0UihehFvd+TJgi1JXdPPrXcSGAHgEV1Yg8NiC4Q3S
 q2GTCEMIBnUB60F1quBvtf96Lzozbc2A6DtzRzKYjY892rCQGJIOF9uK5ePaV601dT4E
 HnIXpAXfN/URzYWgpM1+4Ip3PrZN3gdsQ04rXgsYhus04t88nRqv03N+jp8f/HnMlcgu
 nEIBUuv3cRpX+9gq6HZRUwF6ipMVoR+TLXUgVX+b0xmXBQN8KN/pHcQSl69yL3LKzrF/
 TDrNvCLh3kmkkxy5r/kxIVs6hZY/U234370tED3UiFdvmMY4bJQYzHmv6HapRyZCcbxA
 U/Ew==
X-Gm-Message-State: AO0yUKVO/O4LwGDnLNG2QgkHUJCFpffB4g8fPQV2BnvKC054ot3JTKk2
 7/9buSxosu0jabxLtLCMYg+mLw==
X-Google-Smtp-Source: AK7set/CPxkn2MR05oTWDwxmgc4N2PpfbSfDSPyzpXTLXhY4zJ8E7nTHzNrrYnqpYCAxS7yY1TS03g==
X-Received: by 2002:a05:600c:310c:b0:3eb:3e75:5d6e with SMTP id
 g12-20020a05600c310c00b003eb3e755d6emr3126640wmo.18.1677611215283; 
 Tue, 28 Feb 2023 11:06:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b003e7f1086660sm17005637wme.15.2023.02.28.11.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83D671FFBA;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 02/24] tests: add socat dependency for tests
Date: Tue, 28 Feb 2023 19:06:31 +0000
Message-Id: <20230228190653.1602033-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

We only use it for test-io-channel-command at the moment.
Unfortunately bringing socat into CI exposed an existing bug in the
test-io-channel-command unit test so we disabled it for MacOS in the
previous patch.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230221094558.2864616-4-alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
 .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
 tests/docker/dockerfiles/alpine.docker                | 1 +
 tests/docker/dockerfiles/centos8.docker               | 1 +
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-amd64.docker          | 1 +
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-armel-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 +
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 +
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 +
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 +
 tests/docker/dockerfiles/fedora.docker                | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker         | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker            | 1 +
 tests/lcitool/projects/qemu.yml                       | 1 +
 20 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 8934e5d57f..44d8a2a511 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 65ce456c48..7622c849b2 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index 65b78fa08f..da6aa6469b 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 4a569d82f6..56cf14e553 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -94,6 +94,7 @@ RUN apk update && \
         sed \
         snappy-dev \
         sndio-dev \
+        socat \
         sparse \
         spice-dev \
         spice-protocol \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index fbc953c6dc..1291ae1b04 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -105,6 +105,7 @@ RUN dnf distro-sync -y && \
         rpm \
         sed \
         snappy-devel \
+        socat \
         spice-protocol \
         spice-server-devel \
         systemd-devel \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 5175095a85..856db95100 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index b61f664ea2..e3dba71ad5 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -120,6 +120,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       systemtap-sdt-dev \
                       tar \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b69958c69f..b00e9e9bcf 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 96b524fab6..fb1129f256 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 08a75cebdb..7a2b864a38 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 5930e6fa5d..5a3340e964 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index c65d9830e7..422fdebe8f 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 2ae56c978e..78d7ae6211 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 0db86a0fcd..d06ea3605a 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -52,6 +52,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index b659c0b8a8..21ed1c6081 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -52,6 +52,7 @@ exec "$@"' > /usr/bin/nosync && \
                python3-sphinx_rtd_theme \
                rpm \
                sed \
+               socat \
                sparse \
                spice-protocol \
                tar \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 0a404c15bf..95d30e7936 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -52,6 +52,7 @@ exec "$@"' > /usr/bin/nosync && \
                python3-sphinx_rtd_theme \
                rpm \
                sed \
+               socat \
                sparse \
                spice-protocol \
                tar \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 5d60a96141..8e06d080b8 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -113,6 +113,7 @@ exec "$@"' > /usr/bin/nosync && \
                rpm \
                sed \
                snappy-devel \
+               socat \
                sparse \
                spice-protocol \
                spice-server-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4b2c02d6ab..568c1c979f 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -104,6 +104,7 @@ RUN zypper update -y && \
            sed \
            snappy-devel \
            sndio-devel \
+           socat \
            sparse \
            spice-protocol-devel \
            systemd-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 13ab0b6887..f34d88d33d 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -119,6 +119,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-yaml \
                       rpm2cpio \
                       sed \
+                      socat \
                       sparse \
                       systemtap-sdt-dev \
                       tar \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 6467bcf08a..2854748f49 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -101,6 +101,7 @@ packages:
  - sed
  - snappy
  - sndio
+ - socat
  - sparse
  - spice-protocol
  - spice-server
-- 
2.39.2


