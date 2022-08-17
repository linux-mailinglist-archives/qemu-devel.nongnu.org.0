Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D626597304
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:35:06 +0200 (CEST)
Received: from localhost ([::1]:52282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOL4T-0005Vv-MM
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKf3-0004uf-19; Wed, 17 Aug 2022 11:08:49 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKf0-0003AY-RH; Wed, 17 Aug 2022 11:08:48 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6691574763E;
 Wed, 17 Aug 2022 17:08:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2B7B874638A; Wed, 17 Aug 2022 17:08:45 +0200 (CEST)
Message-Id: <20806906cd93129675c858a1560bd7f5514d39ca.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 26/31] ppc4xx: Introduce Ppc4xxSdramBank struct
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:45 +0200 (CEST)
X-Spam-Probability: 10%
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

Instead of storing sdram bank parameters in unrelated arrays put them
in a struct so it's clear they belong to the same bank and simplify
the state struct using this bank type.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c      | 49 +++++++++++++++++-----------------
 hw/ppc/ppc4xx_devs.c    | 59 ++++++++++++++++++++---------------------
 include/hw/ppc/ppc4xx.h |  8 ++++++
 3 files changed, 61 insertions(+), 55 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 53e981ddf4..db33334e29 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -16,7 +16,7 @@
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "exec/memory.h"
-#include "hw/ppc/ppc.h"
+#include "hw/ppc/ppc4xx.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci.h"
 #include "sysemu/block-backend.h"
@@ -485,11 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 typedef struct ppc440_sdram_t {
     uint32_t addr;
     int nbanks;
-    MemoryRegion containers[4]; /* used for clipping */
-    MemoryRegion *ram_memories;
-    hwaddr ram_bases[4];
-    hwaddr ram_sizes[4];
-    uint32_t bcr[4];
+    Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
 
 enum {
@@ -570,23 +566,23 @@ static uint64_t sdram_size(uint32_t bcr)
 static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bcr[i] & 1) {
+    if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->containers[i]);
-        memory_region_del_subregion(&sdram->containers[i],
-                                    &sdram->ram_memories[i]);
-        object_unparent(OBJECT(&sdram->containers[i]));
+                                    &sdram->bank[i].container);
+        memory_region_del_subregion(&sdram->bank[i].container,
+                                    &sdram->bank[i].ram);
+        object_unparent(OBJECT(&sdram->bank[i].container));
     }
-    sdram->bcr[i] = bcr & 0xffe0ffc1;
+    sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     if (enabled && (bcr & 1)) {
-        memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
+        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
-        memory_region_add_subregion(&sdram->containers[i], 0,
-                                    &sdram->ram_memories[i]);
+        memory_region_add_subregion(&sdram->bank[i].container, 0,
+                                    &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
                                     sdram_base(bcr),
-                                    &sdram->containers[i]);
+                                    &sdram->bank[i].container);
     }
 }
 
@@ -595,9 +591,9 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->ram_sizes[i] != 0) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->ram_bases[i],
-                                              sdram->ram_sizes[i]), 1);
+        if (sdram->bank[i].size != 0) {
+            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+                                              sdram->bank[i].size), 1);
         } else {
             sdram_set_bcr(sdram, i, 0, 0);
         }
@@ -614,9 +610,9 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     case SDRAM_R1BAS:
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
-        if (sdram->ram_sizes[dcrn - SDRAM_R0BAS]) {
-            ret = sdram_bcr(sdram->ram_bases[dcrn - SDRAM_R0BAS],
-                            sdram->ram_sizes[dcrn - SDRAM_R0BAS]);
+        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
+            ret = sdram_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
+                            sdram->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -701,12 +697,15 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                        int do_init)
 {
     ppc440_sdram_t *sdram;
+    int i;
 
     sdram = g_malloc0(sizeof(*sdram));
     sdram->nbanks = nbanks;
-    sdram->ram_memories = ram_memories;
-    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
+    for (i = 0; i < nbanks; i++) {
+        sdram->bank[i].ram = ram_memories[i];
+        sdram->bank[i].base = ram_bases[i];
+        sdram->bank[i].size = ram_sizes[i];
+    }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index b4cd10f735..1226ec4aa9 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -42,10 +42,7 @@ typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
 struct ppc4xx_sdram_t {
     uint32_t addr;
     int nbanks;
-    MemoryRegion containers[4]; /* used for clipping */
-    MemoryRegion *ram_memories;
-    hwaddr ram_bases[4];
-    hwaddr ram_sizes[4];
+    Ppc4xxSdramBank bank[4];
     uint32_t besr0;
     uint32_t besr1;
     uint32_t bear;
@@ -53,7 +50,6 @@ struct ppc4xx_sdram_t {
     uint32_t status;
     uint32_t rtr;
     uint32_t pmit;
-    uint32_t bcr[4];
     uint32_t tr;
     uint32_t ecccfg;
     uint32_t eccesr;
@@ -131,26 +127,26 @@ static target_ulong sdram_size(uint32_t bcr)
 static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
                           uint32_t bcr, int enabled)
 {
-    if (sdram->bcr[i] & 0x00000001) {
+    if (sdram->bank[i].bcr & 0x00000001) {
         /* Unmap RAM */
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
-                                 sdram_size(sdram->bcr[i]));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->containers[i]);
-        memory_region_del_subregion(&sdram->containers[i],
-                                    &sdram->ram_memories[i]);
-        object_unparent(OBJECT(&sdram->containers[i]));
+                                    &sdram->bank[i].container);
+        memory_region_del_subregion(&sdram->bank[i].container,
+                                    &sdram->bank[i].ram);
+        object_unparent(OBJECT(&sdram->bank[i].container));
     }
-    sdram->bcr[i] = bcr & 0xFFDEE001;
+    sdram->bank[i].bcr = bcr & 0xFFDEE001;
     if (enabled && (bcr & 0x00000001)) {
         trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
-        memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
+        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
                            sdram_size(bcr));
-        memory_region_add_subregion(&sdram->containers[i], 0,
-                                    &sdram->ram_memories[i]);
+        memory_region_add_subregion(&sdram->bank[i].container, 0,
+                                    &sdram->bank[i].ram);
         memory_region_add_subregion(get_system_memory(),
                                     sdram_base(bcr),
-                                    &sdram->containers[i]);
+                                    &sdram->bank[i].container);
     }
 }
 
@@ -159,9 +155,9 @@ static void sdram_map_bcr(ppc4xx_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->ram_sizes[i] != 0) {
-            sdram_set_bcr(sdram, i, sdram_bcr(sdram->ram_bases[i],
-                                              sdram->ram_sizes[i]), 1);
+        if (sdram->bank[i].size != 0) {
+            sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
+                                              sdram->bank[i].size), 1);
         } else {
             sdram_set_bcr(sdram, i, 0x00000000, 0);
         }
@@ -173,10 +169,10 @@ static void sdram_unmap_bcr(ppc4xx_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bcr[i]),
-                                 sdram_size(sdram->bcr[i]));
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
         memory_region_del_subregion(get_system_memory(),
-                                    &sdram->ram_memories[i]);
+                                    &sdram->bank[i].ram);
     }
 }
 
@@ -214,16 +210,16 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
             ret = sdram->pmit;
             break;
         case 0x40: /* SDRAM_B0CR */
-            ret = sdram->bcr[0];
+            ret = sdram->bank[0].bcr;
             break;
         case 0x44: /* SDRAM_B1CR */
-            ret = sdram->bcr[1];
+            ret = sdram->bank[1].bcr;
             break;
         case 0x48: /* SDRAM_B2CR */
-            ret = sdram->bcr[2];
+            ret = sdram->bank[2].bcr;
             break;
         case 0x4C: /* SDRAM_B3CR */
-            ret = sdram->bcr[3];
+            ret = sdram->bank[3].bcr;
             break;
         case 0x80: /* SDRAM_TR */
             ret = -1; /* ? */
@@ -358,13 +354,16 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
                        int do_init)
 {
     ppc4xx_sdram_t *sdram;
+    int i;
 
     sdram = g_new0(ppc4xx_sdram_t, 1);
     sdram->irq = irq;
     sdram->nbanks = nbanks;
-    sdram->ram_memories = ram_memories;
-    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
-    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
+    for (i = 0; i < nbanks; i++) {
+        sdram->bank[i].ram = ram_memories[i];
+        sdram->bank[i].base = ram_bases[i];
+        sdram->bank[i].size = ram_sizes[i];
+    }
     qemu_register_reset(&sdram_reset, sdram);
     ppc_dcr_register(env, SDRAM0_CFGADDR,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index a1781afa8e..2af0d60577 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,6 +29,14 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+typedef struct {
+    MemoryRegion ram;
+    MemoryRegion container; /* used for clipping */
+    hwaddr base;
+    hwaddr size;
+    uint32_t bcr;
+} Ppc4xxSdramBank;
+
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
-- 
2.30.4


