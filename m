Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7C4A6807
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:32:39 +0100 (CET)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1hW-0000o1-O8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Ct-6N
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::62c] (port=43968
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000dW-1C
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:37 -0500
Received: by mail-ej1-x62c.google.com with SMTP id d10so56833422eje.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwYtA2KKG+0bbq8x95tFKhT0n1BvnQylT/23Qq8x4yM=;
 b=al7Ig/VvxAl/uozViOnvTaKDP9AQphq1Ybm/qTdpEfCkRsIHh1qIJ4QwPVJ9TS/ZAp
 bElE/MnaJlbGsBOZsE5+GRXFOmbtzh5e8QBr/2s0YL0KXq3f4wuY2KRNcm1NiHbWvlMX
 maikoU4Kk3bhLn6AkPxEUw8HbsDqUqfxjcO4RB9LLiTDcyuisyqVaouo78CKLl77W+kM
 dwbIwNXlvTguHn6bg/GCtLMjsoSdPUrq4b9Yobj0Z4CixBDThM66Cv0HHw4vInwlE3yX
 zCkcbMNrNDNuxiVoBZo0yBAKcjXOytDFENi4/ZE3rnJKKz66MFMl5qX0uV91M/y8clJM
 e33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwYtA2KKG+0bbq8x95tFKhT0n1BvnQylT/23Qq8x4yM=;
 b=mFIwU3gq9RQHY+4p3QmAZxL1Yq2DMqNIlNoHf+SyPkXOekq/tGvwMNrGSb3uyoYfaN
 o0uvYiez863AWrg8G8PmpNBNhmjkbZl6Li/gQ89jBL49W5ORO+dMEtq3MrSLe3RGiCj8
 XwLSDkCeykmGi11Z5wy5tdDhym4HVbK6F/hTuqqkN1EPwwS80aN59wTUig+4ZLEbgxnT
 eSEiCh85rxPXmCH3w7B3310JvtrpCEyfPozzBfVGiMubpj6RlIcyx8SGogMAjXe192y6
 5t2oAESXkssuVXMxeLY1g+Rv6SVxnf6iIINvpsOwbzFRkxxncZQjEnvCPZL1oCmokPJo
 /RBw==
X-Gm-Message-State: AOAM531GUIdlHQ7YuHT/v+2fqrZUQ58V8VBkp5cXXkmtB6gyGs49VUPC
 96SKqm9mdFfxOycgGDSZ1YMQdg==
X-Google-Smtp-Source: ABdhPJwJEI14LRhA3QAEihbiN2Lkf2NTp/76OI+LmEHzB+HHfdQIlQ94S8akS5Yno6R+dhep78HKGA==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr22583130ejc.637.1643739667879; 
 Tue, 01 Feb 2022 10:21:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id jt17sm14766846ejb.161.2022.02.01.10.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93DF11FFC1;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/25] tests/lcitool: Refresh submodule and remove libxml2
Date: Tue,  1 Feb 2022 18:20:34 +0000
Message-Id: <20220201182050.15087-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Luke.Craig@ll.mit.edu,
 pbonzini@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-6-f4bug@amsat.org>
Message-Id: <20220124201608.604599-10-alex.bennee@linaro.org>
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
index 9c52266811..07f313aa3a 100644
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
index 7b44dba324..8a648dda1e 100644
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
index 613d1373c2..08183f8793 100644
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
index eb2251c81c..591af43d60 100644
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
index cbb909d02b..3abac7a8b1 100644
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
index 60207f3da3..1d01cd9440 100644
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
index f57d8cfb29..1b78d8369a 100644
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
index 0ffa3c4d4b..003ee2cfed 100644
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
index 4e562dfdcd..8993d2d9e0 100644
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
index 29cec2153b..6dd9b6fab1 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
+Subproject commit 6dd9b6fab1fe081b16bc975485d7a02c81ba5fbe
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index ed5ab1407a..de51a2f1dd 100644
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
2.30.2


