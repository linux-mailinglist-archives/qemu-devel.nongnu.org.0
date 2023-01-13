Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E822669D94
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:23:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnK-0001Ya-Ux; Fri, 13 Jan 2023 09:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmS-0000r5-6U
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmO-0003f4-Oa
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so18857413wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wzuNZCXupgu//7V2i08nAuAgXUWawm0tfvprgDr6yp0=;
 b=OlHmUjPQBFqAsgF43cARB5xBAlPIbwDSVy8iJ2J8bdorXmF16InjnNWbKw0ffe+k/5
 Eoy1MV7hKnFAdhLaC3iBdXzBaOu3PDfycwvaMss2qKekunQPs5kX7MFeQbxdoSqGv5aP
 sJgjgcmO684xNmRqBo+kOq7AqnHbhDff+yTULLWBlRlXBPU8p/mDsdwOfivsvsnB+y+y
 +2hNl6T/Q9JMBextlstckMoEZAxnBW+p28a1EaRNvy8AgZZr1F6EDZrxYBEyyuUhZsoh
 UvT4OqcRhtdMp4JP+kGX4STMlTswprJ7Tmk3DaegmRbhej41+dBHBvCBCRCcQy+zseSh
 eUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzuNZCXupgu//7V2i08nAuAgXUWawm0tfvprgDr6yp0=;
 b=aelF9ZLbxVY3c0PDIIrKsIzFc2FP4caGrn9PaVN7QEgifKbXYabkHuHweAPV2uVmpT
 6DExcqfQzDD/WGHF6GIQxe82/eF1rNNx298hSv3Ajtt0bT6sKKGr2XT3BlLPhBH3qSKi
 OJSgyuXWYUSrGKZYP5+Y+AG8flsgAqpfkoJ3LMABHZ7JSm7D6P940YjpuuYv2iGcy8jw
 hMnhCLD+ww6xXA0hgsmaAsxinCie+Al/I8ZePHYiEpgIpXLisEMhB/wHrtvNcXb5Y8WQ
 ENjhUmXbDPnEWfSqdKHNcq+yaIjxbONQq1LIuAVEyIxgqsWd5FLwP6Lp7GWWRI9BNJS+
 8v/A==
X-Gm-Message-State: AFqh2kpCxK6jewcp32vwzv8DH5nVeOO3195oyx+z4z/tnpsOozCOTqTC
 3zpmZmuJCnufNXkEBzrZ/Pls4DxTehiBaQ2D
X-Google-Smtp-Source: AMrXdXt/RJN1BXd4hx8OWvHeqXztD7pR7z3RDf2/9MSuVA82LLAge9/lHR+bcr6ckNx0aPlDNL68vA==
X-Received: by 2002:a05:600c:4fc9:b0:3da:8f9:4f62 with SMTP id
 o9-20020a05600c4fc900b003da08f94f62mr8009244wmq.7.1673619095140; 
 Fri, 13 Jan 2023 06:11:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/38] hw/arm: Allwinner A10 enable SPL load from MMC
Date: Fri, 13 Jan 2023 14:10:56 +0000
Message-Id: <20230113141126.535646-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

This patch enables copying of SPL from MMC if `-kernel` parameter is not
passed when starting QEMU. SPL is copied to SRAM_A.

The approach is reused from Allwinner H3 implementation.

Tested with Armbian and custom Yocto image.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20221226220303.14420-7-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/allwinner-a10.h | 21 +++++++++++++++++++++
 hw/arm/allwinner-a10.c         | 18 ++++++++++++++++++
 hw/arm/cubieboard.c            |  5 +++++
 3 files changed, 44 insertions(+)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index e569e661095..e0f2f7ab198 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -16,6 +16,7 @@
 #include "hw/misc/allwinner-a10-ccm.h"
 #include "hw/misc/allwinner-a10-dramc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "sysemu/block-backend.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -48,4 +49,24 @@ struct AwA10State {
     OHCISysBusState ohci[AW_A10_NUM_USB];
 };
 
+/**
+ * Emulate Boot ROM firmware setup functionality.
+ *
+ * A real Allwinner A10 SoC contains a Boot ROM
+ * which is the first code that runs right after
+ * the SoC is powered on. The Boot ROM is responsible
+ * for loading user code (e.g. a bootloader) from any
+ * of the supported external devices and writing the
+ * downloaded code to internal SRAM. After loading the SoC
+ * begins executing the code written to SRAM.
+ *
+ * This function emulates the Boot ROM by copying 32 KiB
+ * of data at offset 8 KiB from the given block device and writes it to
+ * the start of the first internal SRAM memory.
+ *
+ * @s: Allwinner A10 state object pointer
+ * @blk: Block backend device object pointer
+ */
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk);
+
 #endif
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 17e439777e4..dc1966ff7a2 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -24,7 +24,9 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/usb/hcd-ohci.h"
+#include "hw/loader.h"
 
+#define AW_A10_SRAM_A_BASE      0x00000000
 #define AW_A10_DRAMC_BASE       0x01c01000
 #define AW_A10_MMC0_BASE        0x01c0f000
 #define AW_A10_CCM_BASE         0x01c20000
@@ -38,6 +40,22 @@
 #define AW_A10_RTC_BASE         0x01c20d00
 #define AW_A10_I2C0_BASE        0x01c2ac00
 
+void allwinner_a10_bootrom_setup(AwA10State *s, BlockBackend *blk)
+{
+    const int64_t rom_size = 32 * KiB;
+    g_autofree uint8_t *buffer = g_new0(uint8_t, rom_size);
+
+    if (blk_pread(blk, 8 * KiB, rom_size, buffer, 0) < 0) {
+        error_setg(&error_fatal, "%s: failed to read BlockBackend data",
+                   __func__);
+        return;
+    }
+
+    rom_add_blob("allwinner-a10.bootrom", buffer, rom_size,
+                  rom_size, AW_A10_SRAM_A_BASE,
+                  NULL, NULL, NULL, NULL, false);
+}
+
 static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index dca257620d0..71a7df15083 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -99,6 +99,11 @@ static void cubieboard_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
                                 machine->ram);
 
+    /* Load target kernel or start using BootROM */
+    if (!machine->kernel_filename && blk && blk_is_available(blk)) {
+        /* Use Boot ROM to copy data from SD card to SRAM */
+        allwinner_a10_bootrom_setup(a10, blk);
+    }
     /* TODO create and connect IDE devices for ide_drive_get() */
 
     cubieboard_binfo.ram_size = machine->ram_size;
-- 
2.34.1


