Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1F6E8EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAB-0000Z4-DS; Thu, 20 Apr 2023 06:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0000X7-T1
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppR9x-0003eD-HC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 m39-20020a05600c3b2700b003f170e75bd3so3207665wms.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985100; x=1684577100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YUILg6m9rwPONLf0mtn/8w2tqdGMLI7ZnZcN+Z+Sb6I=;
 b=mxbetkncdh3JyOzzKyEBEq/dduxyMLOTqBOQ+WaX/982XPhGZFUD//3zSYwpAQOMSU
 FKUADRiaV3KpWUZhJTj8/EA7rlJrv82/slnad/0E1+ZWrtuvPQ65wRSsKB6RRQOwFnx9
 4wOiJZw7CE8x7mkXW7jfdtEmrwFSHWuSIA0EmGYNC7On/ifUNArC8kS6M6cUKQGY9w9l
 Hdr3TWB2/n8B1inQv14p7t87BjVuw1kT0dUEDRasXAagjhlEc/WYiSAi0Gf7bX/d2hV4
 9+Ub01iJCoz4Q8I1VilS+2QAwAWosVBBLeeGtEEDXnHbL/KproMolYCovS47NjMq5qrF
 GQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985100; x=1684577100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YUILg6m9rwPONLf0mtn/8w2tqdGMLI7ZnZcN+Z+Sb6I=;
 b=BHsh2Ean2lrucoM9rhYDpIFywXX322oK3x7JI/qpJsLcPcD7EEXkv+pXJOKLxLuvZ9
 LFmVRPCFkSGN/BWclkw8zQflyOFadfz6POL4j7bzWK+z/zl+t2unhZY8RwbvuWOGInVn
 tJt8zqwOTBGzy942RrsQdkIiTAHp+Jy2wLwi3VknzKTFdvHzGVIFhCTwE2gxl4lxLGZ6
 IPAhY17oS2YK0/SrxP88/Ctgi1bH1/cBzM7KmLieI6irKSVGC32nB9gxVjgsIvUlmsvH
 UdZdRGAIgil9Jg8ZURRm3pW2ssSz2jC+h/k2fvGMSmlj0XK/JP3fVyKDNfJxOSMelyoI
 tGjQ==
X-Gm-Message-State: AAQBX9e8WyxN9lP3aJDKVur/jvZk4DZsL/E9ndQEZI4Jl+FeH8TXbfsk
 NAgzAPtE0b6jilb2Lym5OTkiEMoKuvVgnU39fok=
X-Google-Smtp-Source: AKy350aSGQGcJ7c695DHmVCCZRSufux/5e2XYM1zFldcHkanCJfN7LrC8neP8cdz9zvjjhLGiRNrUw==
X-Received: by 2002:a7b:c4c6:0:b0:3f1:7006:e782 with SMTP id
 g6-20020a7bc4c6000000b003f17006e782mr801928wmk.25.1681985099959; 
 Thu, 20 Apr 2023 03:04:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.04.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:04:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] hw/arm: Fix some typos in comments (most found by
 codespell)
Date: Thu, 20 Apr 2023 11:04:36 +0100
Message-Id: <20230420100456.944969-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230409200526.1156456-1-sw@weilnetz.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/exynos4210.c       | 4 ++--
 hw/arm/musicpal.c         | 2 +-
 hw/arm/omap1.c            | 2 +-
 hw/arm/omap2.c            | 2 +-
 hw/arm/virt-acpi-build.c  | 2 +-
 hw/arm/virt.c             | 2 +-
 hw/arm/xlnx-versal-virt.c | 2 +-
 hw/arm/Kconfig            | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 6f2dda13f63..de39fb0ece8 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -326,7 +326,7 @@ static int mapline_size(const int *mapline)
 
 /*
  * Initialize board IRQs.
- * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
+ * These IRQs contain split Int/External Combiner and External Gic IRQs.
  */
 static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
@@ -744,7 +744,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
          * - SDMA
          * - ADMA2
          *
-         * As this part of the Exynos4210 is not publically available,
+         * As this part of the Exynos4210 is not publicly available,
          * we used the "HS-MMC Controller S3C2416X RISC Microprocessor"
          * public datasheet which is very similar (implementing
          * MMC Specification Version 4.0 being the only difference noted)
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index c9010b2ffbb..58f3d30c9b1 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -100,7 +100,7 @@
 #define MP_LCD_SPI_CMD          0x00104011
 #define MP_LCD_SPI_INVALID      0x00000000
 
-/* Commmands */
+/* Commands */
 #define MP_LCD_INST_SETPAGE0    0xB0
 /* ... */
 #define MP_LCD_INST_SETPAGE7    0xB7
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 559c066ce90..d5438156ee9 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -4057,7 +4057,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *dram,
     s->led[1] = omap_lpg_init(system_memory,
                               0xfffbd800, omap_findclk(s, "clk32-kHz"));
 
-    /* Register mappings not currenlty implemented:
+    /* Register mappings not currently implemented:
      * MCSI2 Comm	fffb2000 - fffb27ff (not mapped on OMAP310)
      * MCSI1 Bluetooth	fffb2800 - fffb2fff (not mapped on OMAP310)
      * USB W2FC		fffb4000 - fffb47ff
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 366d6af1b66..d5a2ae7af6e 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2523,7 +2523,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sdram,
                     omap_findclk(s, "func_96m_clk"),
                     omap_findclk(s, "core_l4_iclk"));
 
-    /* All register mappings (includin those not currenlty implemented):
+    /* All register mappings (including those not currently implemented):
      * SystemControlMod	48000000 - 48000fff
      * SystemControlL4	48001000 - 48001fff
      * 32kHz Timer Mod	48004000 - 48004fff
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49f..4af0de8b241 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -694,7 +694,7 @@ static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
     build_append_int_noprefix(table_data, 0xE, 1);  /* Type */
     build_append_int_noprefix(table_data, 16, 1);   /* Length */
     build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
-    /* Discovery Range Base Addres */
+    /* Discovery Range Base Address */
     build_append_int_noprefix(table_data, base, 8);
     build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
 }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef7..4983f5fc93a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2052,7 +2052,7 @@ static void machvirt_init(MachineState *machine)
         int pa_bits;
 
         /*
-         * Instanciate a temporary CPU object to find out about what
+         * Instantiate a temporary CPU object to find out about what
          * we are about to deal with. Once this is done, get rid of
          * the object.
          */
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 37fc9b919c0..668a9d65a43 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -659,7 +659,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
 
     /* Make the APU cpu address space visible to virtio and other
-     * modules unaware of muliple address-spaces.  */
+     * modules unaware of multiple address-spaces.  */
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff56..db1105c7175 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -126,7 +126,7 @@ config OLIMEX_STM32_H405
 config NSERIES
     bool
     select OMAP
-    select TMP105   # tempature sensor
+    select TMP105   # temperature sensor
     select BLIZZARD # LCD/TV controller
     select ONENAND
     select TSC210X  # touchscreen/sensors/audio
-- 
2.34.1


