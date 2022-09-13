Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5925B7A04
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:48:50 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAxl-0006OL-A6
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ3-0006UC-BO; Tue, 13 Sep 2022 14:23:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:15215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oYAZ0-0007dC-5U; Tue, 13 Sep 2022 14:23:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 610C0747DFA;
 Tue, 13 Sep 2022 20:23:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 22BD8747644; Tue, 13 Sep 2022 20:23:11 +0200 (CEST)
Message-Id: <925d4a2e2784ab2b3439678efe5313d9a1de272b.1663092335.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663092335.git.balaton@eik.bme.hu>
References: <cover.1663092335.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 10/18] ppc440_sdram: Implement enable bit in the DDR2 SDRAM
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2022 20:23:11 +0200 (CEST)
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

To allow removing the do_init hack we need to improve the DDR2 SDRAM
controller model to handle the enable/disable bit that it ignored so
far.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: replace 0x08000000 with BIT(27)

 hw/ppc/ppc440.h    |  3 +--
 hw/ppc/ppc440_uc.c | 40 +++++++++++++++++++++++++++++++++-------
 hw/ppc/sam460ex.c  |  8 +++++++-
 3 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
index e6c905b7d6..01d76b8000 100644
--- a/hw/ppc/ppc440.h
+++ b/hw/ppc/ppc440.h
@@ -17,8 +17,7 @@ void ppc4xx_l2sram_init(CPUPPCState *env);
 void ppc4xx_cpr_init(CPUPPCState *env);
 void ppc4xx_sdr_init(CPUPPCState *env);
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks,
-                       int do_init);
+                       Ppc4xxSdramBank *ram_banks);
 void ppc4xx_ahb_init(CPUPPCState *env);
 void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
 void ppc460ex_pcie_init(CPUPPCState *env);
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 01184e717b..b3f56c49b5 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -23,6 +23,7 @@
 #include "sysemu/reset.h"
 #include "ppc440.h"
 #include "qom/object.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* L2 Cache as SRAM */
@@ -484,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 /* SDRAM controller */
 typedef struct ppc440_sdram_t {
     uint32_t addr;
+    uint32_t mcopt2;
     int nbanks;
     Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
@@ -581,12 +583,15 @@ static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
 {
     if (sdram->bank[i].bcr & 1) {
         /* First unmap RAM if enabled */
+        trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
+                                 sdram_size(sdram->bank[i].bcr));
         sdram_bank_unmap(&sdram->bank[i]);
     }
     sdram->bank[i].bcr = bcr & 0xffe0ffc1;
     sdram->bank[i].base = sdram_base(bcr);
     sdram->bank[i].size = sdram_size(bcr);
     if (enabled && (bcr & 1)) {
+        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
         sdram_bank_map(&sdram->bank[i]);
     }
 }
@@ -596,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size != 0) {
+        if (sdram->bank[i].size) {
             sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
@@ -605,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     }
 }
 
+static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
+{
+    int i;
+
+    for (i = 0; i < sdram->nbanks; i++) {
+        if (sdram->bank[i].size) {
+            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
+        }
+    }
+}
+
 static uint32_t dcr_read_sdram(void *opaque, int dcrn)
 {
     ppc440_sdram_t *sdram = opaque;
@@ -636,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
             ret = 0x80000000;
             break;
         case 0x21: /* SDRAM_MCOPT2 */
-            ret = 0x08000000;
+            ret = sdram->mcopt2;
             break;
         case 0x40: /* SDRAM_MB0CF */
             ret = 0x00008001;
@@ -680,6 +696,19 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
         switch (sdram->addr) {
         case 0x00: /* B0CR */
             break;
+        case 0x21: /* SDRAM_MCOPT2 */
+            if (!(sdram->mcopt2 & BIT(27)) && (val & BIT(27))) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_map_bcr(sdram);
+                sdram->mcopt2 |= BIT(27);
+            } else if ((sdram->mcopt2 & BIT(27)) && !(val & BIT(27))) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_unmap_bcr(sdram);
+                sdram->mcopt2 &= ~BIT(27);
+            }
+            break;
         default:
             break;
         }
@@ -694,11 +723,11 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
+    sdram->mcopt2 = 0;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-                       Ppc4xxSdramBank *ram_banks,
-                       int do_init)
+                       Ppc4xxSdramBank *ram_banks)
 {
     ppc440_sdram_t *sdram;
     int i;
@@ -715,9 +744,6 @@ void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
     ppc_dcr_register(env, SDRAM0_CFGDATA,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
-    if (do_init) {
-        sdram_map_bcr(sdram);
-    }
 
     ppc_dcr_register(env, SDRAM_R0BAS,
                      sdram, &dcr_read_sdram, &dcr_write_sdram);
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index f4c2a693fb..dac329d482 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -345,7 +345,13 @@ static void sam460ex_init(MachineState *machine)
     ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
 
     /* FIXME: does 460EX have ECC interrupts? */
-    ppc440_sdram_init(env, 1, ram_banks, 1);
+    ppc440_sdram_init(env, 1, ram_banks);
+    /* Enable SDRAM memory regions as we may boot without firmware */
+    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
+        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000)) {
+        error_report("Couldn't enable memory regions");
+        exit(1);
+    }
 
     /* IIC controllers and devices */
     dev = sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700,
-- 
2.30.4


