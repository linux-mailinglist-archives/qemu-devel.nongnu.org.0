Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4980359A2D2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:14:33 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5Zo-0003cZ-De
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hl-0007vA-M8; Fri, 19 Aug 2022 12:55:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hj-0000yR-QF; Fri, 19 Aug 2022 12:55:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 74671747E0F;
 Fri, 19 Aug 2022 18:55:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4F14F747DFD; Fri, 19 Aug 2022 18:55:49 +0200 (CEST)
Message-Id: <b37dac18c136a1b3dfc40b443a55480dd1ad8e90.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 10/20] ppc440_sdram: Implement enable bit in the DDR2 SDRAM
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:49 +0200 (CEST)
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
 hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index c33f91e134..7c1513ff69 100644
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
+            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_map_bcr(sdram);
+                sdram->mcopt2 |= 0x08000000;
+            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_unmap_bcr(sdram);
+                sdram->mcopt2 &= ~0x08000000;
+            }
+            break;
         default:
             break;
         }
@@ -694,6 +723,7 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
+    sdram->mcopt2 = 0x08000000;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-- 
2.30.4


