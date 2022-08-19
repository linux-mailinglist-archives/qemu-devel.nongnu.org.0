Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6D59A2F3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:41:19 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5zh-0004ep-Vg
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5IG-0000SI-WF; Fri, 19 Aug 2022 12:56:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5ID-00011f-N5; Fri, 19 Aug 2022 12:56:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 35074747F1C;
 Fri, 19 Aug 2022 18:56:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F3BE1747F1B; Fri, 19 Aug 2022 18:55:59 +0200 (CEST)
Message-Id: <66bf4ca4e8555563ebea564000c257f8c143aade.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 20/20] ppc4xx_sdram: Convert DDR SDRAM controller to new bank
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:59 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use the generic bank handling introduced in previous patch in the DDR
SDRAM controller too. This also fixes previously broken region unmap
due to sdram_ddr_unmap_bcr() ignoring container region so it crashed
with an assert when the guest tried to disable the controller.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc4xx_sdram.c | 98 ++++++++++++++++---------------------------
 1 file changed, 37 insertions(+), 61 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index b0bdfa5bc1..60c1bfcf46 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -137,6 +137,8 @@ static void sdram_bank_set_bcr(Ppc4xxSdramBank *bank, uint32_t bcr,
 
 /*****************************************************************************/
 /* DDR SDRAM controller */
+#define SDRAM_DDR_BCR_MASK 0xFFDEE001
+
 static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
@@ -195,58 +197,6 @@ static hwaddr sdram_ddr_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
-                              uint32_t bcr, int enabled)
-{
-    if (sdram->bank[i].bcr & 1) {
-        /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
-                                 sdram_ddr_size(sdram->bank[i].bcr));
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].container);
-        memory_region_del_subregion(&sdram->bank[i].container,
-                                    &sdram->bank[i].ram);
-        object_unparent(OBJECT(&sdram->bank[i].container));
-    }
-    sdram->bank[i].bcr = bcr & 0xFFDEE001;
-    if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
-        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_ddr_size(bcr));
-        memory_region_add_subregion(&sdram->bank[i].container, 0,
-                                    &sdram->bank[i].ram);
-        memory_region_add_subregion(get_system_memory(),
-                                    sdram_ddr_base(bcr),
-                                    &sdram->bank[i].container);
-    }
-}
-
-static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size != 0) {
-            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
-                                                      sdram->bank[i].size), 1);
-        } else {
-            sdram_ddr_set_bcr(sdram, i, 0, 0);
-        }
-    }
-}
-
-static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
-{
-    int i;
-
-    for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
-                                 sdram_ddr_size(sdram->bank[i].bcr));
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->bank[i].ram);
-    }
-}
-
 static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
 {
     Ppc4xxSdramDdrState *s = opaque;
@@ -317,6 +267,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
 static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
     Ppc4xxSdramDdrState *s = opaque;
+    int i;
 
     switch (dcrn) {
     case SDRAM0_CFGADDR:
@@ -338,12 +289,24 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             if (!(s->cfg & 0x80000000) && (val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_ddr_map_bcr(s);
+                for (i = 0; i < s->nbanks; i++) {
+                    if (s->bank[i].size) {
+                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                                           s->bank[i].base, s->bank[i].size,
+                                           1);
+                    }
+                }
                 s->status &= ~0x80000000;
             } else if ((s->cfg & 0x80000000) && !(val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_ddr_unmap_bcr(s);
+                for (i = 0; i < s->nbanks; i++) {
+                    if (s->bank[i].size) {
+                        sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                                           s->bank[i].base, s->bank[i].size,
+                                           0);
+                    }
+                }
                 s->status |= 0x80000000;
             }
             if (!(s->cfg & 0x40000000) && (val & 0x40000000)) {
@@ -363,16 +326,16 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             s->pmit = (val & 0xF8000000) | 0x07C00000;
             break;
         case 0x40: /* SDRAM_B0CR */
-            sdram_ddr_set_bcr(s, 0, val, s->cfg & 0x80000000);
-            break;
         case 0x44: /* SDRAM_B1CR */
-            sdram_ddr_set_bcr(s, 1, val, s->cfg & 0x80000000);
-            break;
         case 0x48: /* SDRAM_B2CR */
-            sdram_ddr_set_bcr(s, 2, val, s->cfg & 0x80000000);
-            break;
         case 0x4C: /* SDRAM_B3CR */
-            sdram_ddr_set_bcr(s, 3, val, s->cfg & 0x80000000);
+            i = (s->addr - 0x40) / 4;
+            val &= SDRAM_DDR_BCR_MASK;
+            if (s->bank[i].size) {
+                sdram_bank_set_bcr(&s->bank[i], val,
+                                   sdram_ddr_base(val), sdram_ddr_size(val),
+                                   s->cfg & 0x80000000);
+            }
             break;
         case 0x80: /* SDRAM_TR */
             s->tr = val & 0x018FC01F;
@@ -422,6 +385,7 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
     const ram_addr_t valid_bank_sizes[] = {
         256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
     };
+    int i;
 
     if (s->nbanks < 1 || s->nbanks > 4) {
         error_setg(errp, "Invalid number of RAM banks");
@@ -432,6 +396,18 @@ static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
         return;
     }
     ppc4xx_sdram_banks(s->dram_mr, s->nbanks, s->bank, valid_bank_sizes);
+    for (i = 0; i < s->nbanks; i++) {
+        if (s->bank[i].size) {
+            s->bank[i].bcr = sdram_ddr_bcr(s->bank[i].base, s->bank[i].size);
+            sdram_bank_set_bcr(&s->bank[i], s->bank[i].bcr,
+                               s->bank[i].base, s->bank[i].size, 0);
+        } else {
+            sdram_bank_set_bcr(&s->bank[i], 0, 0, 0, 0);
+        }
+        trace_ppc4xx_sdram_init(sdram_ddr_base(s->bank[i].bcr),
+                                sdram_ddr_size(s->bank[i].bcr),
+                                s->bank[i].bcr);
+    }
 
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-- 
2.30.4


