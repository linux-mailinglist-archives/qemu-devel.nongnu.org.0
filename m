Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B35514CAE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:23:29 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRWq-0005yL-Ev
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRw-0005iW-97
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRu-0004ZK-Ng
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: by mail-ed1-x531.google.com with SMTP id z19so9228958edx.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/6OytvJbsLh0C+nIPVe7VJ1Gh5+e5oo89SAz9CqAEM=;
 b=IrKA8kAVXWTWjnZM2GSLaGVrLFA7ZUXg/SgAk//fLbJ2W6b6+414G0bi23hxmcSVPK
 YqvXgtu3PHC0ePEuu6PJoF5LJn2MhX7lO+58RX9sdTZ4pc+rAVOfOteeJ6s5Tb7hrXD6
 uBpHlu7WKq5oE719UDib3jeOxdAtzBkNPiUdX6qol/w9MMukA/X4gS+kgtopEnz+qkfC
 ySm/7hkzsJGPp1D8yNUrijGceXuVOYNhckkNv9qRsfwjTnFo3G5ur2P/SxwIbLvkHpTK
 oBWlEmKoGZiXfKMGLTKDU6NXhbLQraL6FVKBxLwPkm0YvCALFdnNszX9M/quiXqnz8Rr
 /RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D/6OytvJbsLh0C+nIPVe7VJ1Gh5+e5oo89SAz9CqAEM=;
 b=wYw4mhcozgB9WqmnHlQbLhqmztNoCmNe/ZjrdSTkkm2pZkkBIG/KJ0dninDPajZw+a
 pqqRIBMfY87FUq0A2/XWhX8RfjTwayH4JiFMg7FEWWfZbOlTZAF+BZC9OHfHKAMVVPN0
 tKt1z6WodlTC9n5GdYl7ChYfRkOo37l6IideA4LaoqW92MppOMKy87Y55uiDnGyX1n4g
 AdxIdJeTPkJ1vNJDTapdCTfresQw6fbdMKDPM5UWwQS9XHIaP6chP5bjmiUYKL0IUxOd
 oIHEBRl/wJ7bSwQ7Gw4uEyjha1eVOYlqQ1EGwiHNKi4W6jawA3ZaFkQPo4NkY61H2m4E
 OYZg==
X-Gm-Message-State: AOAM532B97EcrEXCCwqnUwHlFkxVYgFLFeicr7XOVTYx63VjjOZk8Qrh
 OmGZc9HPAMBdi+hPP3dueq4qZfeFt2VZOQ==
X-Google-Smtp-Source: ABdhPJxgM0aOApzFH/L3TVA/ezFuWAcyQIEwheFkGcFK4eXpLsl8u5ORffEdC00IRs7xCcmtKv/bnA==
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr41550691eds.246.1651241900556; 
 Fri, 29 Apr 2022 07:18:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/12] configure, meson: move symlinking of ROMs to meson
Date: Fri, 29 Apr 2022 16:18:07 +0200
Message-Id: <20220429141813.328975-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is useful because pc-bios/meson.build already has a list of all ROM
files, and thus does not need to use wildcards.  The problems with
wildcards are mentioned above the definition of the LINKS variable,
but then the recommendation is disattended.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 15 ---------------
 pc-bios/meson.build    | 18 +++++++++++++-----
 tests/Makefile.include |  2 +-
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index 8626989239..bdb0cc35a8 100755
--- a/configure
+++ b/configure
@@ -2449,21 +2449,6 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
-for bios_file in \
-    $source_path/pc-bios/*.bin \
-    $source_path/pc-bios/*.elf \
-    $source_path/pc-bios/*.lid \
-    $source_path/pc-bios/*.rom \
-    $source_path/pc-bios/*.dtb \
-    $source_path/pc-bios/*.img \
-    $source_path/pc-bios/openbios-* \
-    $source_path/pc-bios/u-boot.* \
-    $source_path/pc-bios/palcode-* \
-    $source_path/pc-bios/qemu_vga.ndrv
-
-do
-    LINKS="$LINKS pc-bios/$(basename $bios_file)"
-done
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
         mkdir -p `dirname ./$f`
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index c86dedf7df..8ba81f5518 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -23,7 +23,7 @@ if unpack_edk2_blobs
   endforeach
 endif
 
-blobs = files(
+blobs = [
   'bios.bin',
   'bios-256k.bin',
   'bios-microvm.bin',
@@ -83,11 +83,19 @@ blobs = files(
   'npcm7xx_bootrom.bin',
   'vof.bin',
   'vof-nvram.bin',
-)
+]
 
-if get_option('install_blobs')
-  install_data(blobs, install_dir: qemu_datadir)
-endif
+ln_s = [find_program('ln', required: true), '-sf']
+foreach f : blobs
+  roms += custom_target(f,
+                build_by_default: have_system,
+                output: f,
+                input: files('meson.build'),            # dummy input
+                install: get_option('install_blobs'),
+                install_dir: qemu_datadir,
+                command: [ ln_s, meson.project_source_root() / 'pc-bios' / f, '@OUTPUT@' ])
+endforeach
+alias_target('emulator-firmware', roms)
 
 subdir('descriptors')
 subdir('keymaps')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index bef96a775c..1fe7c8cd09 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -56,7 +56,7 @@ $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
-$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins) emulator-firmware
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
                         TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
-- 
2.35.1



