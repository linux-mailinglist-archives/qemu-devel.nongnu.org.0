Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8849628C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:02:16 +0100 (CET)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwMh-0005Xd-FL
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:02:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw3H-0001rt-CJ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:11 -0500
Received: from [2a00:1450:4864:20::32b] (port=53058
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw39-0007j9-Jh
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:42:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v123so18483925wme.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Of3l4u3FiVNd7t/06K1VRlM0oLlSgnk/M7vVzXCwT4=;
 b=oFFLIVtpb8Z5/j45PuAaaLqj876/YB06VGoRsxv+pbAucBA7w3kyntEUfEGFJpQY1i
 aCmAg7AiJQ+5fMDbchd73EwbytZ/9801pWU3tE0jRDXfojvIfO3CzmCF9Q5gLR0VkLRv
 g2K+q5/PTw3cP8kJHDsvS+g4A/Z8OvdDbvFSdewyVHUDm676G3JAl9gqn/58lBqntfKq
 GIGuO1lFouJ0CiKadU5AEzzkezHGBF+j9AiuquwMv/ZmIiFevsLO7xm0EEuu3KtObJWx
 v1WGO4xCGKyRY5+huhYfEUfuqOnLImOOAYk5K/0yht4foZbIe98ApP6k89snd7jilD0o
 lT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5Of3l4u3FiVNd7t/06K1VRlM0oLlSgnk/M7vVzXCwT4=;
 b=XO3zX+lcjmnHs+NWVTfOORuHEu2OhCguTZHWWBRog1ks0+g/LD82jfTWCyXH9+iDLU
 G0gk2gWYGShelJkHYjWaFVST/YGXp+S2BfqLU7IR6URZxZxwR0IC3TQUJQrFeBZNnYjJ
 ggXjlJtJUc6qem7kx/JpRd2X68MAp+vHlmx50kIS86Wybu2UWI9Lly0N7atb+j/Pakks
 IrbO0IeQ5oYhDGiRjmtf0qvH19Jpu9+aPIvHF5wIRa/Wp0uSvWvHMKLm91uVha/mttrS
 XzuFdUE+ZwilJdup6bzT04waYru151yvdHu6zsrNSMvna9QPEGhMGbzQ+8snIYda+SNu
 RiIg==
X-Gm-Message-State: AOAM533bgxv2JTuM7eoh6jyxI2INi2MR8TYvzTZu0PbxoWAlMKmi+wpR
 cIjA3H2DuVaUMc37y5dIxg4UgDDR5MM=
X-Google-Smtp-Source: ABdhPJxk+4CSbG7g4u+dlbT+insxSI9wOxmsvAiogYhbHhNio5QkgcpkkZUjO7t48xQ9lex5SGTaHg==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr1229141wml.85.1642779721519; 
 Fri, 21 Jan 2022 07:42:01 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 bd20sm6242750wmb.38.2022.01.21.07.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:42:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 5/7] tests/lcitool: Refresh submodule and remove libxml2
Date: Fri, 21 Jan 2022 16:41:32 +0100
Message-Id: <20220121154134.315047-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154134.315047-1-f4bug@amsat.org>
References: <20220121154134.315047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The previous commit removed all uses of libxml2.

Refresh lcitool submodule, update qemu.yml and refresh the generated
files by running:

  $ make lcitool-refresh

Note: This refreshment also removes libudev dependency on Fedora
and CentOS due to libvirt-ci commit 18bfaee ("mappings: Improve
mapping for libudev"), since "The udev project has been absorbed
by the systemd project", and lttng-ust on FreeBSD runners due to
libvirt-ci commit 6dd9b6f ("guests: drop lttng-ust from FreeBSD
platform").

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             | 2 +-
 tests/docker/dockerfiles/alpine.docker        | 4 ++--
 tests/docker/dockerfiles/centos8.docker       | 4 +---
 tests/docker/dockerfiles/fedora.docker        | 4 +---
 tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
 tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
 tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
 tests/lcitool/libvirt-ci                      | 2 +-
 tests/lcitool/projects/qemu.yml               | 1 -
 11 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
index 9c52266811f..07f313aa3ab 100644
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
index 7b44dba324e..8a648dda1ed 100644
--- a/.gitlab-ci.d/cirrus/freebsd-13.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
index 613d1373c23..08183f8793c 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/usr/local/bin/pip3'
-PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index eb2251c81c8..591af43d60e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile alpine-edge qemu
+#  $ lcitool dockerfile --layers all alpine-edge qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -56,7 +56,6 @@ RUN apk update && \
         libtasn1-dev \
         liburing-dev \
         libusb-dev \
-        libxml2-dev \
         linux-pam-dev \
         llvm11 \
         lttng-ust-dev \
@@ -109,6 +108,7 @@ RUN apk update && \
         zlib-dev \
         zlib-static \
         zstd-dev && \
+    apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b3..3abac7a8b13 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile centos-8 qemu
+#  $ lcitool dockerfile --layers all centos-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -69,10 +69,8 @@ RUN dnf update -y && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
-        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 60207f3da38..1d01cd94405 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-35 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -77,10 +77,8 @@ exec "$@"' > /usr/bin/nosync && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
-        libxml2-devel \
         libzstd-devel \
         llvm \
         lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f57d8cfb299..1b78d8369a7 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -71,7 +71,6 @@ RUN zypper update -y && \
            libudev-devel \
            liburing-devel \
            libusb-1_0-devel \
-           libxml2-devel \
            libzstd-devel \
            llvm \
            lttng-ust-devel \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0ffa3c4d4b5..003ee2cfedd 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-1804 qemu
+#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -89,7 +89,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
-            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 4e562dfdcd3..8993d2d9e05 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -91,7 +91,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvirglrenderer-dev \
             libvte-2.91-dev \
             libxen-dev \
-            libxml2-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 29cec2153b9..6dd9b6fab1f 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
+Subproject commit 6dd9b6fab1fe081b16bc975485d7a02c81ba5fbe
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index ed5ab1407a9..de51a2f1dd4 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -63,7 +63,6 @@ packages:
  - liburing
  - libusbx
  - libvdeplug
- - libxml2
  - libzstd
  - llvm
  - lttng-ust
-- 
2.34.1


