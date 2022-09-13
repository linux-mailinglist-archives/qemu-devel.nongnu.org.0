Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38F5B7A06
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:49:04 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAxz-000742-N1
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ3-0006Uz-N9; Tue, 13 Sep 2022 14:23:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ0-0007dc-Ew; Tue, 13 Sep 2022 14:23:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6D856747DFD;
 Tue, 13 Sep 2022 20:23:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2C5D8747644; Tue, 13 Sep 2022 20:23:12 +0200 (CEST)
Message-Id: <7a3c5b37e02c76ba2dd63dff5455c046e5d141cd.1663092335.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663092335.git.balaton@eik.bme.hu>
References: <cover.1663092335.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 11/18] ppc440_sdram: Rename local variable for readibility
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 20:23:12 +0200 (CEST)
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

Rename local sdram variable in ppc440_sdram_init to s for readibility.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c   | 81 ++++++++++++++++++++++----------------------
 hw/ppc/ppc4xx_devs.c | 44 ++++++++++++------------
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index b3f56c49b5..565bfffc22 100644
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
             if (!(sdram->mcopt2 & BIT(27)) && (val & BIT(27))) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_map_bcr(sdram);
+                sdram_ddr2_map_bcr(sdram);
                 sdram->mcopt2 |= BIT(27);
             } else if ((sdram->mcopt2 & BIT(27)) && !(val & BIT(27))) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_unmap_bcr(sdram);
+                sdram_ddr2_unmap_bcr(sdram);
                 sdram->mcopt2 &= ~BIT(27);
             }
             break;
@@ -718,7 +719,7 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void sdram_reset(void *opaque)
+static void sdram_ddr2_reset(void *opaque)
 {
     ppc440_sdram_t *sdram = opaque;
 
@@ -729,40 +730,40 @@ static void sdram_reset(void *opaque)
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        Ppc4xxSdramBank *ram_banks)
 {
-    ppc440_sdram_t *sdram;
+    ppc440_sdram_t *s;
     int i;
 
-    sdram = g_malloc0(sizeof(*sdram));
-    sdram->nbanks = nbanks;
+    s = g_malloc0(sizeof(*s));
+    s->nbanks = nbanks;
     for (i = 0; i < nbanks; i++) {
-        sdram->bank[i].ram = ram_banks[i].ram;
-        sdram->bank[i].base = ram_banks[i].base;
-        sdram->bank[i].size = ram_banks[i].size;
+        s->bank[i].ram = ram_banks[i].ram;
+        s->bank[i].base = ram_banks[i].base;
+        s->bank[i].size = ram_banks[i].size;
     }
-    qemu_register_reset(&sdram_reset, sdram);
+    qemu_register_reset(&sdram_ddr2_reset, s);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
 
     ppc_dcr_register(env, SDRAM_R0BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R1BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R2BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_R3BAS,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1HB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDULL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONF1LL,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_CONFPATHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
+                     s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
     ppc_dcr_register(env, SDRAM_PLBADDUHB,
-                     sdram, &dcr_read_sdram, &dcr_write_sdram);
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


