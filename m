Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55262E2FB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:27:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieG-0006Qy-JI; Thu, 17 Nov 2022 12:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie5-0006Lr-Mx
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006FW-Bd
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v1so4923656wrt.11
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMlvtnFEABWg8w92G/8HRIs95GXnsgMR5Vml1n/BCPw=;
 b=dWSPr9U14LI9Lv3mBmWZtcjDj3ICSFiaSrIZzGqEbWuR0Rk1k/93d2FGzCP+dM7DTs
 lvhGLGPJKPuUwS31VjeZAfMd0+3TF/CB6Mfn365UZreSGRO9cG2OKsXq0ES2MWdInaAJ
 Snq9NwSke0nSk0LSuT8olP9rMPaVieTmM3YgiJynOg7972NyERrMfr60CWPETu57ONsr
 /9UCcj+aRZsEbGlyzn2lTi1cxodkxwRMe6fN0Y/fyPt6hywkVhAVaPYM7cH2ueHpMkqU
 yzzntf54nPnDt+hAicS5Gs0nIezjyp3grVh8PJcY2jg73boqsLade2GbOva2fkdgdGMg
 nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMlvtnFEABWg8w92G/8HRIs95GXnsgMR5Vml1n/BCPw=;
 b=KDUcbu7mlo0J5COHf2lrxBDCxIJPNBKMbZQIQ6vn4vRCfN0srTZEesNLPb/eLMNv+G
 K/bAjcseoiSsNzKhbwqNSLnYG8kJyFq8wgMEsu1S6kb5ZMYq1M5ZYB74I15QpKsalmYs
 Ql3OaWkge/qhCeuvls2aC0WPO9JEK5rN2yrq8ig4/N3DX1Ftu6d1e9ybIHYH3PdDT/QL
 0IaqovN6016b0KHn8T39y3HR+bOyMwfUdTgc+3bK8Y3XnQ4WZWJSDkTbIA808hmxMDmL
 q2knh+iDjMxmXdoSuQttVQfJUO9HlPqcVF/XmdG+zDnpBMKlfrU248+lmIrLXokrk+HU
 HzLg==
X-Gm-Message-State: ANoB5plPMIw+cVon1c4nOabZ0+tNSnFECLSXq/i+/YPzkmSNl2vbQ5k8
 06BtVpqCF/YmteQm7hTSyxqLeA==
X-Google-Smtp-Source: AA0mqf6w03dmOokpDf2zEvyjyh+JeNtx5PVKaeqJeAy3oiIBN740CXhUBnGzSxFXUaOSb2OyLDy6zw==
X-Received: by 2002:adf:ff89:0:b0:22e:38b:95ff with SMTP id
 j9-20020adfff89000000b0022e038b95ffmr2009971wrr.202.1668705942142; 
 Thu, 17 Nov 2022 09:25:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a5d4d8e000000b0022cbf4cda62sm1754696wru.27.2022.11.17.09.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26A771FFC4;
 Thu, 17 Nov 2022 17:25:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v3 13/13] ci: replace x86_64 macos-11 with aarch64 macos-12
Date: Thu, 17 Nov 2022 17:25:32 +0000
Message-Id: <20221117172532.538149-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The Cirrus CI service has announced the intent to discontinue
support for x86_64 macOS CI runners. They already have aarch64
runners available and require all projects to switch to these
images before Jan 1st 2023. The different architecture is
merely determined by the image name requested.

For aarch64 they only support macOS 12 onwards. At the same
time our support policy only guarantees the most recent 2
major versions, so macOS 12 is already technically our min
version.

https://cirrus-ci.org/blog/2022/11/08/sunsetting-intel-macos-instances/

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221116175023.80627-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml                              | 12 ++++++------
 .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} | 12 ++++++------
 tests/lcitool/libvirt-ci                             |  2 +-
 tests/lcitool/refresh                                |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)
 rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index d70da61248..634a73a742 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -70,19 +70,19 @@ x64-freebsd-13-build:
     INSTALL_COMMAND: pkg install -y
     TEST_TARGETS: check
 
-x64-macos-11-base-build:
+aarch64-macos-12-base-build:
   extends: .cirrus_build_job
   variables:
-    NAME: macos-11
-    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    NAME: macos-12
+    CIRRUS_VM_INSTANCE_TYPE: macos_instance
     CIRRUS_VM_IMAGE_SELECTOR: image
-    CIRRUS_VM_IMAGE_NAME: big-sur-base
+    CIRRUS_VM_IMAGE_NAME: ghcr.io/cirruslabs/macos-monterey-base:latest
     CIRRUS_VM_CPUS: 12
     CIRRUS_VM_RAM: 24G
     UPDATE_COMMAND: brew update
     INSTALL_COMMAND: brew install
-    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
-    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    PATH_EXTRA: /opt/homebrew/ccache/libexec:/opt/homebrew/gettext/bin
+    PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
 
 
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-12.vars
similarity index 74%
rename from .gitlab-ci.d/cirrus/macos-11.vars
rename to .gitlab-ci.d/cirrus/macos-12.vars
index aee9f50de6..ef9e14b373 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -1,16 +1,16 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool variables macos-11 qemu
+#  $ lcitool variables macos-12 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-CCACHE='/usr/local/bin/ccache'
+CCACHE='/opt/homebrew/bin/ccache'
 CPAN_PKGS=''
 CROSS_PKGS=''
-MAKE='/usr/local/bin/gmake'
-NINJA='/usr/local/bin/ninja'
+MAKE='/opt/homebrew/bin/gmake'
+NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
-PIP3='/usr/local/bin/pip3'
+PIP3='/opt/homebrew/bin/pip3'
 PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
-PYTHON='/usr/local/bin/python3'
+PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index d40e203631..e3eb28cf2e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit d40e203631eb3eacee17e8cf8fd20aa5152db62a
+Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index ce0b24c0b1..fa966e4009 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -176,7 +176,7 @@ try:
     #
     generate_cirrus("freebsd-12")
     generate_cirrus("freebsd-13")
-    generate_cirrus("macos-11")
+    generate_cirrus("macos-12")
 
     sys.exit(0)
 except Exception as ex:
-- 
2.34.1


