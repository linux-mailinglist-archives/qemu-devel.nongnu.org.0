Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73E4B5A7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:17:43 +0100 (CET)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgr0-00014r-B6
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYo-0004rr-3U; Mon, 14 Feb 2022 13:58:54 -0500
Received: from [2607:f8b0:4864:20::635] (port=38407
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYm-0006Y9-AX; Mon, 14 Feb 2022 13:58:53 -0500
Received: by mail-pl1-x635.google.com with SMTP id c3so11274699pls.5;
 Mon, 14 Feb 2022 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5r1qohF89gVBikHeedld13Y+J8tlxW9bOOdQOVxRyA=;
 b=NayNXSwQUbYHMwrD/M+X4aMwBecAvWS4Xnnk8a9yoYDPKgRDwE4hLS4V63HjlTRxeV
 wzBkhMc7jcVOIafGUB49s7itxeptly+6B6KlPX+Qw0zerQHIfCxw+hpsges6MB3vRUr8
 FdM/dLwAYc3ZXMoQDF8Y3jB531eJSBR1kjR9aOXYsmbwmDRpV2UjJ0nz86ikXaorUZte
 fpRl377g3tpdd7bGvt9rv5B7vpdzzA31wGYyleDBxojbG7lP6lA5hUYPvLrfQ8tikgtq
 +cQcauHAh5AY4aq7sjv+FmZaKkGXSC2Mb5LRZyziKglkvw3Eyuc7qUQqp920DBjOIYNv
 uSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E5r1qohF89gVBikHeedld13Y+J8tlxW9bOOdQOVxRyA=;
 b=qhx/0euKE/RfhTlgOElDLL9uvPKG5uAyHcAovoxii8XxE+jo9BwKi4wWaEvzDGbimO
 TwxmZTRBfCB7VSbMStM5Q/CLDKrozXc1NfSCvprm/Lizcn6Vc3Pcwq5w9ibn19HBt57F
 ysGTpYFKT+qLUqozUFbrZab+dO4KfNFC5dSAn7Gggr84zxoubaz3NHO6+4HqFlexxnkc
 HoHGI20dWNzUpqu6o4uKkPQkJsMjGamw3KMnN+4w5bZTscZ00wvFftiUV9H6IHS0lzi9
 83FrHjy+EVxTMT/3J6xe+kMWh/Td5FfepHVPad8CTwUH45M8QpxGuVt5WQHpDWkNmKUN
 /THA==
X-Gm-Message-State: AOAM532RTax41NwH5EqBMpfV3u5vUA0gY9q8voLY9T0jx4mP0BQsr6wr
 XlIiTeAEYLGutDyw0UDjhrZRuRrVUVQ=
X-Google-Smtp-Source: ABdhPJwslQIcDPut9ZuSv2BDRTyxcXkX5MoLRI8WF/a/r7SUbXVFyeVBhKGfxLWl0cnmkS4urtqGQw==
X-Received: by 2002:a17:902:e80c:: with SMTP id
 u12mr364482plg.159.1644865130596; 
 Mon, 14 Feb 2022 10:58:50 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id l17sm36847331pfu.61.2022.02.14.10.58.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:50 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 16/16] gitlab-ci: Support macOS 12 via cirrus-run
Date: Mon, 14 Feb 2022 19:56:05 +0100
Message-Id: <20220214185605.28087-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add support for macOS 12 build on Cirrus-CI, similarly to commit
0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
but with the following differences:
 - Enable modules (configure --enable-modules)
 - Do not run softfloat3 tests (make check-softfloat)
 - Run Aarch64 qtests instead of x86_64 ones

Generate the vars file by calling 'make lcitool-refresh'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 audio/coreaudio.c                 |  2 +-
 tests/lcitool/refresh             |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..be1dce5d4e 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -87,6 +87,22 @@ x64-macos-11-base-build:
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
 
+x64-macos-12-base-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: macos-12
+    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image
+    CIRRUS_VM_IMAGE_NAME: monterey-base
+    CIRRUS_VM_CPUS: 12
+    CIRRUS_VM_RAM: 24G
+    UPDATE_COMMAND: brew update
+    INSTALL_COMMAND: brew install
+    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
+    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    CONFIGURE_ARGS: --enable-modules
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-qtest-aarch64
+
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
new file mode 100644
index 0000000000..a793258c64
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -0,0 +1,16 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables macos-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS='Test::Harness'
+CROSS_PKGS=''
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PACKAGING_COMMAND='brew'
+PIP3='/usr/local/bin/pip3'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PYTHON='/usr/local/bin/python3'
diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 5b3aeaced0..1faef7fa7a 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -45,7 +45,7 @@ typedef struct coreaudioVoiceOut {
 } coreaudioVoiceOut;
 
 #if !defined(MAC_OS_VERSION_12_0) \
-    || (MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_VERSION_12_0)
+    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
 #define kAudioObjectPropertyElementMain kAudioObjectPropertyElementMaster
 #endif
 
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 4ab90a310a..a714e2851d 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -89,6 +89,7 @@ try:
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
    generate_cirrus("macos-11")
+   generate_cirrus("macos-12")
 
    sys.exit(0)
 except Exception as ex:
-- 
2.34.1


