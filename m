Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A0662594
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:30:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxw-0000BJ-A1; Mon, 09 Jan 2023 07:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxu-0000Aj-6j
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:22 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxs-00060U-4V
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t5so3514628wrq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msNbVrY5Ck7M2M2GqYUu6XWKiG6PjDQ57JW5BgILQCE=;
 b=OS072HexoXTpyY7zA3ANAPfTWvtKrvA4WxUArtaRd9meeb1cpP7HPVucsuVNGkVaEW
 zYd9pLVyIMTHW2fABo7kT+xJe+6Ls2Pd068P7vHzi+IrPcgIWyb12QYrOqRQpJl5FOk/
 CAe2+gWzvJiOfmrWctfcO/2gJN5HICpwc1Ye2EMzb9UIMtvcdefA527OQqZ5jj32QIC+
 WpKyWvIT22AsEox9FnRQB6dYrT029mn1Or4sMOBXhpRwecu274b/umsJy8Ber0KSYryN
 9YPrCxK35NjbH2uO/OrJVViURz8otPp55fWjnfAzhMElbsx/F9tFREK9rkOR5mkJZxcl
 Ywfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=msNbVrY5Ck7M2M2GqYUu6XWKiG6PjDQ57JW5BgILQCE=;
 b=CfxAoaM23u7KHYiWPskJRHn7Zf0rdZyiTEY5AHnutRiuVVX7HNFbrAkoNysMDhGhav
 ++kJ/L5n9j468I1jvernKDOT91XZNwNfGS5TLlg4EkUwbn6Geyu+6uNJSjUWYC9pISc4
 9mLqXgS2Ji6RqH6SIpry64eCVSG0gJzwR99qss4fh+iV0W84AxEebi5LSNE9ScK8w/Q1
 gKHpyDEJP0RosaCcw5DgJTdhry5ipMumhMaiPbNgtEo8bZqOOgft6ylc7JdyKtGNERWZ
 YiOJUZjgjrneJrq3AGjhq7djSf65lrO4rlgqIBbgayxxH9tm4PRotd3gS/8AtWa+DnvT
 UWKA==
X-Gm-Message-State: AFqh2kqNSXOIS3S72L6rpE8cZlziUX1zwIBEiYS6ysGW31woSXuG1Abt
 ZRxpM8vQ5LQd7+pGqEZU2Whft7BP+lcq4kzG
X-Google-Smtp-Source: AMrXdXthzH+q3qR4uQrUpNrrVgrqTK5aYd/vOuD/1gwezWtwRkqnBFJAr7Oc4oyPlgm/5Dsl8LazOQ==
X-Received: by 2002:a05:6000:4088:b0:2bb:e896:5a09 with SMTP id
 da8-20020a056000408800b002bbe8965a09mr3577725wrb.66.1673266153523; 
 Mon, 09 Jan 2023 04:09:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm8511680wrv.76.2023.01.09.04.09.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 08/21] hw/i386: Use generic DeviceState instead of
 PFlashCFI01
Date: Mon,  9 Jan 2023 13:08:20 +0100
Message-Id: <20230109120833.3330-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/i386/pc_sysfw.c   | 14 +++++++-------
 include/hw/i386/pc.h |  3 +--
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 60db0efb41..1a12207dd1 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -71,7 +71,7 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory,
     memory_region_set_readonly(isa_bios, true);
 }
 
-static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
+static DeviceState *pc_pflash_create(PCMachineState *pcms,
                                      const char *name,
                                      const char *alias_prop_name)
 {
@@ -88,7 +88,7 @@ static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
      * will be removed with object_unparent.
      */
     object_unref(OBJECT(dev));
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 void pc_system_flash_create(PCMachineState *pcms)
@@ -143,7 +143,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
     int i;
     BlockBackend *blk;
     int64_t size;
-    PFlashCFI01 *system_flash;
+    DeviceState *system_flash;
     MemoryRegion *flash_mem;
     void *flash_ptr;
     int flash_size;
@@ -152,7 +152,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
         system_flash = pcms->flash[i];
-        blk = pflash_cfi01_get_blk(DEVICE(system_flash));
+        blk = pflash_cfi01_get_blk(system_flash);
         if (!blk) {
             break;
         }
@@ -187,7 +187,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
                         0x100000000ULL - total_size);
 
         if (i == 0) {
-            flash_mem = pflash_cfi01_get_memory(DEVICE(system_flash));
+            flash_mem = pflash_cfi01_get_memory(system_flash);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
@@ -214,9 +214,9 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(pcms->flash[i]),
+        pflash_cfi01_legacy_drive(pcms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
-        pflash_blk[i] = pflash_cfi01_get_blk(DEVICE(pcms->flash[i]));
+        pflash_blk[i] = pflash_cfi01_get_blk(pcms->flash[i]);
     }
 
     /* Reject gaps */
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 991f905f5d..70abe61805 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -6,7 +6,6 @@
 #include "qemu/uuid.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
-#include "hw/block/flash.h"
 #include "hw/i386/x86.h"
 
 #include "hw/acpi/acpi_dev_interface.h"
@@ -35,7 +34,7 @@ typedef struct PCMachineState {
     /* Pointers to devices and objects: */
     PCIBus *bus;
     I2CBus *smbus;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
     ISADevice *pcspk;
     DeviceState *iommu;
 
-- 
2.38.1


