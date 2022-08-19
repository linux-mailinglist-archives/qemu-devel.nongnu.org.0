Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA08F59A2D6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:19:05 +0200 (CEST)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5eD-0000TW-2f
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Ho-0007vI-Fg; Fri, 19 Aug 2022 12:55:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hm-0000zG-5f; Fri, 19 Aug 2022 12:55:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BB648747F1C;
 Fri, 19 Aug 2022 18:55:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 83295747F1B; Fri, 19 Aug 2022 18:55:52 +0200 (CEST)
Message-Id: <70317978fe83a3710e89618fd1ac906f4e68154f.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 13/20] ppc4xx_sdram: Rename functions to prevent name clashes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:52 +0200 (CEST)
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

Rename functions to avoid name clashes when moving the DDR2 controller
model currently called ppc440_sdram to ppc4xx_devs. This also more
clearly shows which function belongs to which model.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c   | 69 ++++++++++++++++++++++----------------------
 hw/ppc/ppc4xx_devs.c | 44 ++++++++++++++--------------
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 72eb75d3d2..b39c6dbbd2 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -502,7 +502,7 @@ enum {
     SDRAM_PLBADDUHB = 0x50,
 };
 
-static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
+static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
 {
     uint32_t bcr;
 
@@ -547,12 +547,12 @@ static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr2_base(uint32_t bcr)
 {
     return (bcr & 0xffe00000) << 2;
 }
 
-static uint64_t sdram_size(uint32_t bcr)
+static uint64_t sdram_ddr2_size(uint32_t bcr)
 {
     uint64_t size;
     int sh;
@@ -578,50 +578,51 @@ static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
     object_unparent(OBJECT(&bank->container));
 }
 
-static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr2_set_bcr(ppc440_sdram_t *sdram, int i,
+                               uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr2_base(sdram->bank[i].bcr),
+                                 sdram_ddr2_size(sdram->bank[i].bcr));
         sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
-    sdram->bank[i].base = sdram_base(bcr);
-    sdram->bank[i].size = sdram_size(bcr);
+    sdram->bank[i].base = sdram_ddr2_base(bcr);
+    sdram->bank[i].size = sdram_ddr2_size(bcr);
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr2_base(bcr), sdram_ddr2_size(bcr));
         sdram_bank_map(&sdram->bank[i]);
     }
 }
 
-static void sdram_map_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_map_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+            sdram_ddr2_set_bcr(sdram, i,
+                               sdram_ddr2_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr2_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
+static void sdram_ddr2_unmap_bcr(ppc440_sdram_t *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size) {
-            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+            sdram_ddr2_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
         }
     }
 }
 
-static uint32_t dcr_read_sdram(void *opaque, int dcrn)
+static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
     ppc440_sdram_t *sdram = opaque;
     uint32_t ret = 0;
@@ -632,8 +633,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
         if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
-            ret = sdram_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
-                            sdram->bank[dcrn - SDRAM_R0BAS].size);
+            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -674,7 +675,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
+static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -700,12 +701,12 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
             if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr2_map_bcr(sdram);
                 sdram->mcopt2 |= 0x08000000;
             } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr2_unmap_bcr(sdram);
                 sdram->mcopt2 &= ~0x08000000;
             }
             break;
@@ -718,7 +719,7 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset(void *opaque)
+static void sdram_ddr2_reset(void *opaque)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -739,30 +740,30 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
         s->bank[i].base = ram_banks[i].base;
         s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, s);
+    qemu_register_reset(&sdram_ddr2_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     s, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 }
 
 /*****************************************************************************/
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index bfe7b2d3a6..7655967351 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -81,12 +81,12 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
     return bcr;
 }
 
-static inline hwaddr sdram_base(uint32_t bcr)
+static inline hwaddr sdram_ddr_base(uint32_t bcr)
 {
     return bcr & 0xFF800000;
 }
 
-static target_ulong sdram_size(uint32_t bcr)
+static target_ulong sdram_ddr_size(uint32_t bcr)
 {
     target_ulong size;
     int sh;
@@ -101,13 +101,13 @@ static target_ulong sdram_size(uint32_t bcr)
     return size;
 }
 
-static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
-                          uint32_t bcr, int enabled)
+static void sdram_ddr_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
+                              uint32_t bcr, int enabled)
 {
     if (sdram->bank[i].bcr & 1) {
         /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].container);
         memory_region_del_subregion(&sdram->bank[i].container,
@@ -116,38 +116,38 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
     }
     sdram->bank[i].bcr = bcr & 0xFFDEE001;
     if (enabled && (bcr & 1)) {
-        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_ddr_base(bcr), sdram_ddr_size(bcr));
         memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
-                           sdram_size(bcr));
+                           sdram_ddr_size(bcr));
         memory_region_add_subregion(&sdram->bank[i].container, 0,
                                     &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
-                                    sdram_base(bcr),
+                                    sdram_ddr_base(bcr),
                                     &sdram->bank[i].container);
     }
 }
 
-static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_map_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
         if (sdram->bank[i].size != 0) {
-            sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
-                                                  sdram->bank[i].size), 1);
+            sdram_ddr_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
+                                                      sdram->bank[i].size), 1);
         } else {
-            sdram_set_bcr(sdram, i, 0, 0);
+            sdram_ddr_set_bcr(sdram, i, 0, 0);
         }
     }
 }
 
-static void sdram_unmap_bcr(Ppc4xxSdramDdrState *sdram)
+static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 {
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
-                                 sdram_size(sdram->bank[i].bcr));
+        trace_ppc4xx_sdram_unmap(sdram_ddr_base(sdram->bank[i].bcr),
+                                 sdram_ddr_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
                                     &sdram->bank[i].ram);
     }
@@ -244,12 +244,12 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr_map_bcr(sdram);
                 sdram->status &= ~0x80000000;
             } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr_unmap_bcr(sdram);
                 sdram->status |= 0x80000000;
             }
             if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
@@ -269,16 +269,16 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
             sdram->pmit = (val & 0xF8000000) | 0x07C00000;
             break;
         case 0x40: /* SDRAM_B0CR */
-            sdram_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
             break;
         case 0x44: /* SDRAM_B1CR */
-            sdram_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
             break;
         case 0x48: /* SDRAM_B2CR */
-            sdram_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
             break;
         case 0x4C: /* SDRAM_B3CR */
-            sdram_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
             break;
         case 0x80: /* SDRAM_TR */
             sdram->tr = val & 0x018FC01F;
-- 
2.30.4


