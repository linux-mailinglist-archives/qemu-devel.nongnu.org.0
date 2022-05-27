Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBAD5365E1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:22:19 +0200 (CEST)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucjC-0007qW-TX
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8T-0003Ht-6g
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8R-0003tV-IF
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id 7so1710362wmz.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhcnR5mvK7iggX2nmWmEHPyhR/OcHiHEHOzzq5kXOM4=;
 b=NbKxZklTmBJa0TOXq2y8eWM5vKBIpoWUquy7STZ2AQoFy9OcvOe+dYOcDOyu/YJYwW
 uSzaipOqgyrR9Z7COy1ShuDZLuqPZ2TAUQKOY7AOwnwgpSK593rhXgsnoV0ZW59LaLwb
 +KPg4xBXfVytrD9GB2H8TahuW+8Q3EBall5MHcJYqzp8XY0H4ZFmDzVBk/b3d+gjf1Dp
 lI9PACev7HbNNltul1EkFNOnZ2aomni1auL04CWxt1Rh2549pL9ig1mEYBuRmfEZym4I
 ivLtpFuKPOjKIQbnnAHyq1cEKWhjHIM0q5sy1tVDpi8kzPByt8o2NI0F1weVhb7Bm5ST
 j46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhcnR5mvK7iggX2nmWmEHPyhR/OcHiHEHOzzq5kXOM4=;
 b=zm7VRCjjFiaTeTZ8oLkyezKUqJqA6j9U/o0iUgnbvLWQfro/7JvNMtA3pq6F7YNyfZ
 dlGRqWOi+7OEizODs+TtxbCP8l3ms/Z72sdInrkvXMswjdCd/2iiZLw1+OduBWHVPCk9
 LowVRMRxJK5WVLGKVvZBB3J22Wf45IULDDaHjJZl0sQZvFBi3kyiOcHXHisN9bCCzYXT
 7luZ0fyycrR7Ax0xwIMAW++slu17Nn1WSNQWIdfq3tRWlKSpGwvZgxAs4YuVEMvMH33k
 loes6dUekxRBbsuz5302qZ0Rr/W8XfgxLdbkjiijJX5t8gmeZuhPCOqxvIwJ41vUklb1
 krAw==
X-Gm-Message-State: AOAM531ockKOPuyxRMNU+H30p9t5iuz8mktlDhOXEGEqO+TIlVyiQad2
 /PXINi+0LfW75blV7G2roeoGuQ==
X-Google-Smtp-Source: ABdhPJycSrs8z49haLVKLnDrFMrMDjwOYijja00eIoJMgy3cdH02+8KZhl5pFuUeZcBzY/JmiUWJPw==
X-Received: by 2002:a7b:c24c:0:b0:397:3751:2d2a with SMTP id
 b12-20020a7bc24c000000b0039737512d2amr7639295wmj.51.1653666258245; 
 Fri, 27 May 2022 08:44:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a7bc929000000b003974a3af623sm2595102wml.17.2022.05.27.08.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 482EE1FFC8;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 16/33] configure, meson: move symlinking of ROMs to meson
Date: Fri, 27 May 2022 16:35:46 +0100
Message-Id: <20220527153603.887929-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
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

From: Paolo Bonzini <pbonzini@redhat.com>

This is useful because pc-bios/meson.build already has a list of all ROM
files, and thus does not need to use wildcards.  The problems with
wildcards are mentioned above the definition of the LINKS variable,
but then the recommendation is disattended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-6-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure           | 15 ---------------
 pc-bios/meson.build | 17 ++++++++++++-----
 2 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 7a071c161a..2138f61e54 100755
--- a/configure
+++ b/configure
@@ -2097,21 +2097,6 @@ LINKS="$LINKS tests/avocado tests/data"
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
index c86dedf7df..41ba1c0ec7 100644
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
@@ -83,11 +83,18 @@ blobs = files(
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
 
 subdir('descriptors')
 subdir('keymaps')
-- 
2.30.2


