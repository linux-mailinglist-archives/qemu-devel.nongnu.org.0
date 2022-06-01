Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D353AC78
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:08:39 +0200 (CEST)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSlq-00040q-48
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjJ-0001CF-35
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:06:01 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSjH-0004xf-Ax
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:06:00 -0400
Received: by mail-ed1-x530.google.com with SMTP id h19so3311480edj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mwQ8fEIX4rzlWWy6Fnjhic1Pl6r2YJjXocJFFOMURaY=;
 b=oXXNjmZ0XqglSYC28mz5QlsamdboJVnsrHP7ueKM+n+m3ekdNiB4BKhq0gBATLPcEL
 mNpSH4YK+eJzKmnNbp7nS1eQxRB5fLtMhNgvux60uraJAnbSoZMcMoIHVqJ+Jsc0TJU2
 FXFwYGkzcPxuzky7Dgugm/LdKt9tfQ7ea8jwwGNVMIV0UuttCtXJPwrqMwCPbqfPtT1T
 RCUlZo/krnTv1m+zzYzTIGembFqavQpYS4keBoRvHQ5H2aQV1fHaVQFXxDuEB1mqhuxp
 jQMDHWAeYo9roFV4AKHlT4iXIK0XHXg2OIhuGOJglJe5Pl8KQYYLv8TQ9KfzQ34iqrjU
 nRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mwQ8fEIX4rzlWWy6Fnjhic1Pl6r2YJjXocJFFOMURaY=;
 b=NmU8kJcC78QN89btY5thB7ZwiC469TdZPxmVG9c4cPxW/ZXrN+oyfQPEHDWuQyyQ4A
 v5ZRRdk63GKaZMa2zUaUmh/0UoFF/AKoKWDGjYse5IT0Fv/Yb/fSmwf3e7lLJFyYF/78
 05OL/wnRrSpnLEh6D5H00gIbq/q4My1YKtAQLfs0JMONH77i6IdkfUrjRP9TGSCJCZzN
 ZTEF766829220AH/pfJM1ZYnyY1FWlwI6rotO0pnSJauIv8V+bqPrJj4NOMFY/o+RO9w
 MPNcsLnpwtwVTcrK5pIFS+VASAfW+fwC2dM7IoGRYATrPerrr60OzN+hE/etXkEEFgQs
 /MHQ==
X-Gm-Message-State: AOAM530/QkyVbv0FhZKM//SRrdR61CJJv9AuCtEma7qGYyGAXJ9rnLP7
 CMzWM2FmxUPTzD9IKsaKKl53Rg==
X-Google-Smtp-Source: ABdhPJzGct+4Xnz4MTvJMKebuXCejTME/WZiKErkFfUHIFOJ7LBxwt2W10Ylb6OlAKI1CKUgZM9F9w==
X-Received: by 2002:a05:6402:22eb:b0:42d:d578:25d9 with SMTP id
 dn11-20020a05640222eb00b0042dd57825d9mr1067780edb.310.1654106758604; 
 Wed, 01 Jun 2022 11:05:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a17090636c200b00705fa7087bbsm984959ejc.142.2022.06.01.11.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:05:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39C7D1FFC8;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 16/33] configure, meson: move symlinking of ROMs to meson
Date: Wed,  1 Jun 2022 19:05:20 +0100
Message-Id: <20220601180537.2329566-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Message-Id: <20220527153603.887929-17-alex.bennee@linaro.org>

diff --git a/configure b/configure
index c88ef94fec..7b6adc29fe 100755
--- a/configure
+++ b/configure
@@ -2100,21 +2100,6 @@ LINKS="$LINKS tests/avocado tests/data"
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


