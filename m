Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF076626F3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:26:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxt-00005r-DZ; Mon, 09 Jan 2023 07:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxZ-0008Rm-72
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxW-0005uo-1D
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id s9so7921605wru.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ayDdN6M5SazcUk4shwb3UZYWrM6pyYZwkB3Sw1AVCg0=;
 b=WgXi4yM4j2ZAAR77wtctBBmGYF5P8Xuff1uG1iDJeCcY3khoa0+HNuYhFqDCMhSDps
 QtHvSJ1rB19SdykJ5ARrm07smC3nS40sVLAGvU0wjRrIhN7s/IvplWw98wN81wwI/NKf
 YyWmnVXd/RNuzNb3Ef5GFF7jeKG7WeZeca9+awI83Rg5OPM77j9oRsgFhhvoIb7u5BGK
 qY+ytbagDxcsH62efkaGcDpx3ATcAm64W62hKjLDxmadAt4WJ7LIQNntnMCvDmA+qXYI
 GxmdfbUKXjQhjYdM9pF54jszvVBPYS5K7ubVu6VgXApgNdb7UlEBV245BPonEKlJmprZ
 9aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ayDdN6M5SazcUk4shwb3UZYWrM6pyYZwkB3Sw1AVCg0=;
 b=OL63S2JHWiVoUwcPWYJT3V4nNQIZcB1ilkrjI3jczqr0JUWtNn65IGLzm/mnhllbpF
 daCPXzF7nG0J8yw9rue6MqOkzbz33IOq61hD0njp9eZeSbubDyDmVOZUheJow/uYEX80
 LgoQRo3WEWUxjm1P0uhtnha7PZj0dwM4NgxCgD5YNYvdKrZcCOhTE2vFoPrUE5FRm9Il
 JzLYGCFHsR0Dl50UMzM/PY0tc94WVjycKdPvLK9nmjIIHCynIOg06/cQCNzNspSq3nDj
 t+ex+6sVMwQSF6Z54Re1lzg1q9E2V4Kk4vr2i2BObHl9+oCiQSkDRscspGKVaLQmaumL
 Xlvw==
X-Gm-Message-State: AFqh2koj/vXlRVAWsoeUGMJ0xALTkCWV42KU+RMmwHwhDGbymMWEyy/2
 KJ9SprRvyawOT4E1E5K6FbPZVmMgHz2YYMgN
X-Google-Smtp-Source: AMrXdXuhCBbZa7RXdJrO6d/okGB4+zqNLtt5jJ7mCSv6mzENUHPEd8feyglhHBcNSqTGSQ/TZ8d5pA==
X-Received: by 2002:a5d:4a89:0:b0:2b0:17a0:a255 with SMTP id
 o9-20020a5d4a89000000b002b017a0a255mr9995035wrq.15.1673266134401; 
 Mon, 09 Jan 2023 04:08:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a05600001d100b00241d21d4652sm8367155wrx.21.2023.01.09.04.08.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 04/21] hw/block: Pass DeviceState to
 pflash_cfi01_get_memory()
Date: Mon,  9 Jan 2023 13:08:16 +0100
Message-Id: <20230109120833.3330-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

The point of a getter() function is to not expose the structure
internal fields. Otherwise callers could simply access the
PFlashCFI01::mem field.

Have the callers pass a DeviceState* argument. The QOM
type check is done in the callee.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/block/pflash_cfi01.c  | 4 +++-
 hw/i386/pc_sysfw.c       | 2 +-
 hw/mips/malta.c          | 3 ++-
 hw/ppc/e500.c            | 2 +-
 hw/xtensa/xtfpga.c       | 2 +-
 include/hw/block/flash.h | 2 +-
 6 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8beba24989..866ea596ea 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -991,8 +991,10 @@ BlockBackend *pflash_cfi01_get_blk(DeviceState *dev)
     return fl->blk;
 }
 
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl)
+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev)
 {
+    PFlashCFI01 *fl = PFLASH_CFI01(dev);
+
     return &fl->mem;
 }
 
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c08cba6628..60db0efb41 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -187,7 +187,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                         0x100000000ULL - total_size);
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(system_flash);
+            flash_mem = pflash_cfi01_get_memory(DEVICE(system_flash));
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e645ba1322..9657f7f6da 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1292,7 +1292,8 @@ void mips_malta_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                FLASH_SECTOR_SIZE,
                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
-    bios = pflash_cfi01_get_memory(fl);
+    dev = DEVICE(fl);
+    bios = pflash_cfi01_get_memory(dev);
     fl_idx++;
     if (kernel_filename) {
         ram_low_size = MIN(ram_size, 256 * MiB);
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 9fa1f8e6cf..b127068431 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1144,7 +1144,7 @@ void ppce500_init(MachineState *machine)
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
         memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
-                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
+                                    pflash_cfi01_get_memory(dev));
     }
 
     /*
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f..bce3a543b0 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -459,7 +459,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         }
     } else {
         if (flash) {
-            MemoryRegion *flash_mr = pflash_cfi01_get_memory(flash);
+            MemoryRegion *flash_mr = pflash_cfi01_get_memory(DEVICE(flash));
             MemoryRegion *flash_io = g_malloc(sizeof(*flash_io));
             uint32_t size = env->config->sysrom.location[0].size;
 
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 701a2c1701..25affdf7a5 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -22,7 +22,7 @@ PFlashCFI01 *pflash_cfi01_register(hwaddr base,
                                    uint16_t id2, uint16_t id3,
                                    int be);
 BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
-MemoryRegion *pflash_cfi01_get_memory(PFlashCFI01 *fl);
+MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
 /* pflash_cfi02.c */
-- 
2.38.1


