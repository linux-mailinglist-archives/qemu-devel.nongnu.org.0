Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB605669C91
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:38:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnK-0001Wq-Cb; Fri, 13 Jan 2023 09:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-00012q-L4
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003hx-8s
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so1129085wmc.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4zdHeiITJEFYFvL/oVldM7ClF1Ud0kfLQubpqfkMy+k=;
 b=WXsVH5NuKAPkxdD0Lf8OUmIiiIW0tjTki/wm2mSN76e3ksW1zHuzCJEiANoIvnMRhO
 yqewPgqZQHwC60utBEObCgQJZ69IFWky5pSailAjTo7xJUUcde11rS8YUJO1Dit2Hmog
 HU+jrg5dVHcPz5Jo5RmLZ8VBbwumvMAfDbpuZOW1hb549hAwP3j3TBsM8K4h59AVohvF
 5eKCyF56pr705MW8t23RZd1DFivsZqQda28ILoS78cm6ar/Jm1dRPk2g8Of/rPRGJime
 I8gGRwvoPpJt8e7ha00an67OOgAH+Y0P92DrkJARYtGQMPMTI+WlbXaPluhtSGnB45UJ
 An4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zdHeiITJEFYFvL/oVldM7ClF1Ud0kfLQubpqfkMy+k=;
 b=CBy3RUAEsLYkh+BFg5zVX4FqbGRCnP84RQuq6rCfMmHCZ4nXW8+PGni+rfeDeHZBSn
 HB+cl1y3GBX5e4Z+hjbynAahNbgPybpmM3f3pVX+gnrx9XeDpLDjDPjhTh/yzQ02kwM8
 wtr6s5aluNm2aw4gXx1NtZFUxEZRjK46zDXlze3tGTLmLJs+saTBU9xonysBBopYVpVr
 ywsfPrvFaW6y+sg8LvU34/WBdKL7wigszErJifcWmDOPT1ZI71YpI4uUvzBmv7s9fS3G
 cJEtWIlcyEzCkcV+n/gPcmFwc8uRrI3MkZLv9WGZ6kDAc6+7GxcO2oKX8rINxOPlPWgn
 dtew==
X-Gm-Message-State: AFqh2kqCium1duXfXCRI+g51CWKuwLyEnaZ4lfdCcU5JnozVaQl6S2PW
 oXemN50M30G53nThHjuS4Kg0l4PrLOwGu08G
X-Google-Smtp-Source: AMrXdXtpjTqsVgmDbd9wpcXzNRulsVI847yEtPPE6cYPNRSh7uZU0VDJ2XEFnhVMj7Gd40uemp7oZA==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr50204939wmb.31.1673619102720; 
 Fri, 13 Jan 2023 06:11:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/38] hw/arm/mainstone: Use the IEC binary prefix definitions
Date: Fri, 13 Jan 2023 14:11:05 +0000
Message-Id: <20230113141126.535646-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-8-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mainstone.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index f6293c6c13a..eebaed6e3ea 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/arm/pxa.h"
@@ -99,19 +100,20 @@ static const struct keymap map[0xE0] = {
 
 enum mainstone_model_e { mainstone };
 
-#define MAINSTONE_RAM	0x04000000
-#define MAINSTONE_ROM	0x00800000
-#define MAINSTONE_FLASH	0x02000000
+#define MAINSTONE_RAM_SIZE      (64 * MiB)
+#define MAINSTONE_ROM_SIZE      (8 * MiB)
+#define MAINSTONE_FLASH_SIZE    (32 * MiB)
 
 static struct arm_boot_info mainstone_binfo = {
     .loader_start = PXA2XX_SDRAM_BASE,
-    .ram_size = 0x04000000,
+    .ram_size = MAINSTONE_RAM_SIZE,
 };
 
+#define FLASH_SECTOR_SIZE   (256 * KiB)
+
 static void mainstone_common_init(MachineState *machine,
                                   enum mainstone_model_e model, int arm_id)
 {
-    uint32_t sector_len = 256 * 1024;
     hwaddr mainstone_flash_base[] = { MST_FLASH_0, MST_FLASH_1 };
     PXA2xxState *mpu;
     DeviceState *mst_irq;
@@ -121,7 +123,7 @@ static void mainstone_common_init(MachineState *machine,
 
     /* Setup CPU & memory */
     mpu = pxa270_init(mainstone_binfo.ram_size, machine->cpu_type);
-    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
+    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM_SIZE,
                            &error_fatal);
     memory_region_add_subregion(get_system_memory(), 0x00000000, rom);
 
@@ -130,9 +132,9 @@ static void mainstone_common_init(MachineState *machine,
         dinfo = drive_get(IF_PFLASH, 0, i);
         if (!pflash_cfi01_register(mainstone_flash_base[i],
                                    i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH,
+                                   MAINSTONE_FLASH_SIZE,
                                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, 0)) {
+                                   FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             error_report("Error registering flash memory");
             exit(1);
         }
-- 
2.34.1


