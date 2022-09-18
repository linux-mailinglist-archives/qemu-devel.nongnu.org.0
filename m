Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653C5BBFDB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:35:52 +0200 (CEST)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa115-00028d-7S
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0qA-0004R8-7X; Sun, 18 Sep 2022 16:24:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oa0q8-0004A3-HH; Sun, 18 Sep 2022 16:24:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0383375A166;
 Sun, 18 Sep 2022 22:24:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F84B75A162; Sun, 18 Sep 2022 22:24:30 +0200 (CEST)
Message-Id: <2aca0d9e5a58aa06dc9b8cf84595bbaa184fe7cb.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663531117.git.balaton@eik.bme.hu>
References: <cover.1663531117.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 10/21] ppc440_sdram: Implement enable bit in the DDR2 SDRAM
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Sep 2022 22:24:30 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 900b7ab998..3fbfe4ad13 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -485,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
 /* SDRAM controller */
 typedef struct ppc440_sdram_t {
     uint32_t addr;
+    uint32_t mcopt2;
     int nbanks;
     Ppc4xxSdramBank bank[4];
 } ppc440_sdram_t;
@@ -600,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
     int i;
 
     for (i = 0; i < sdram->nbanks; i++) {
-        if (sdram->bank[i].size != 0) {
+        if (sdram->bank[i].size) {
             sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
                                               sdram->bank[i].size), 1);
         } else {
@@ -609,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
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
@@ -640,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
             ret = 0x80000000;
             break;
         case 0x21: /* SDRAM_MCOPT2 */
-            ret = 0x08000000;
+            ret = sdram->mcopt2;
             break;
         case 0x40: /* SDRAM_MB0CF */
             ret = 0x00008001;
@@ -662,6 +674,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
     return ret;
 }
 
+#define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
+
 static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
 {
     ppc440_sdram_t *sdram = opaque;
@@ -684,6 +698,21 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
         switch (sdram->addr) {
         case 0x00: /* B0CR */
             break;
+        case 0x21: /* SDRAM_MCOPT2 */
+            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+                (val & SDRAM_DDR2_MCOPT2_DCEN)) {
+                trace_ppc4xx_sdram_enable("enable");
+                /* validate all RAM mappings */
+                sdram_map_bcr(sdram);
+                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
+            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+                       !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
+                trace_ppc4xx_sdram_enable("disable");
+                /* invalidate all RAM mappings */
+                sdram_unmap_bcr(sdram);
+                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
+            }
+            break;
         default:
             break;
         }
@@ -698,6 +727,7 @@ static void sdram_reset(void *opaque)
     ppc440_sdram_t *sdram = opaque;
 
     sdram->addr = 0;
+    sdram->mcopt2 = SDRAM_DDR2_MCOPT2_DCEN;
 }
 
 void ppc440_sdram_init(CPUPPCState *env, int nbanks,
-- 
2.30.4


