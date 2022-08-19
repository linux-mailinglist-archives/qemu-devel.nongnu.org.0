Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A559A2DF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:25:16 +0200 (CEST)
Received: from localhost ([::1]:43146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5kB-0003BV-VW
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hu-0008De-Cy; Fri, 19 Aug 2022 12:56:02 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:14311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oP5Hr-00011I-J3; Fri, 19 Aug 2022 12:56:02 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E163747F20;
 Fri, 19 Aug 2022 18:55:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CC102747F1B; Fri, 19 Aug 2022 18:55:57 +0200 (CEST)
Message-Id: <1c96e2f1b29eb44af9f474060560722753f59656.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660926381.git.balaton@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 18/20] ppc4xx_sdram: Rename local state variable for brevity
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 18:55:57 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the sdram local state variable to s in dcr read/write functions
and reset methods for better readability and to match realize methods.
Other places not converted will be changed or removed in subsequent
patches.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc4xx_sdram.c | 158 +++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 69b670737f..a479d15fa6 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -233,56 +233,56 @@ static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 
 static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
 {
-    Ppc4xxSdramDdrState *sdram = opaque;
+    Ppc4xxSdramDdrState *s = opaque;
     uint32_t ret;
 
     switch (dcrn) {
     case SDRAM0_CFGADDR:
-        ret = sdram->addr;
+        ret = s->addr;
         break;
     case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
+        switch (s->addr) {
         case 0x00: /* SDRAM_BESR0 */
-            ret = sdram->besr0;
+            ret = s->besr0;
             break;
         case 0x08: /* SDRAM_BESR1 */
-            ret = sdram->besr1;
+            ret = s->besr1;
             break;
         case 0x10: /* SDRAM_BEAR */
-            ret = sdram->bear;
+            ret = s->bear;
             break;
         case 0x20: /* SDRAM_CFG */
-            ret = sdram->cfg;
+            ret = s->cfg;
             break;
         case 0x24: /* SDRAM_STATUS */
-            ret = sdram->status;
+            ret = s->status;
             break;
         case 0x30: /* SDRAM_RTR */
-            ret = sdram->rtr;
+            ret = s->rtr;
             break;
         case 0x34: /* SDRAM_PMIT */
-            ret = sdram->pmit;
+            ret = s->pmit;
             break;
         case 0x40: /* SDRAM_B0CR */
-            ret = sdram->bank[0].bcr;
+            ret = s->bank[0].bcr;
             break;
         case 0x44: /* SDRAM_B1CR */
-            ret = sdram->bank[1].bcr;
+            ret = s->bank[1].bcr;
             break;
         case 0x48: /* SDRAM_B2CR */
-            ret = sdram->bank[2].bcr;
+            ret = s->bank[2].bcr;
             break;
         case 0x4C: /* SDRAM_B3CR */
-            ret = sdram->bank[3].bcr;
+            ret = s->bank[3].bcr;
             break;
         case 0x80: /* SDRAM_TR */
             ret = -1; /* ? */
             break;
         case 0x94: /* SDRAM_ECCCFG */
-            ret = sdram->ecccfg;
+            ret = s->ecccfg;
             break;
         case 0x98: /* SDRAM_ECCESR */
-            ret = sdram->eccesr;
+            ret = s->eccesr;
             break;
         default: /* Error */
             ret = -1;
@@ -300,78 +300,78 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
 
 static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc4xxSdramDdrState *sdram = opaque;
+    Ppc4xxSdramDdrState *s = opaque;
 
     switch (dcrn) {
     case SDRAM0_CFGADDR:
-        sdram->addr = val;
+        s->addr = val;
         break;
     case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
+        switch (s->addr) {
         case 0x00: /* SDRAM_BESR0 */
-            sdram->besr0 &= ~val;
+            s->besr0 &= ~val;
             break;
         case 0x08: /* SDRAM_BESR1 */
-            sdram->besr1 &= ~val;
+            s->besr1 &= ~val;
             break;
         case 0x10: /* SDRAM_BEAR */
-            sdram->bear = val;
+            s->bear = val;
             break;
         case 0x20: /* SDRAM_CFG */
             val &= 0xFFE00000;
-            if (!(sdram->cfg & 0x80000000) && (val & 0x80000000)) {
+            if (!(s->cfg & 0x80000000) && (val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_ddr_map_bcr(sdram);
-                sdram->status &= ~0x80000000;
-            } else if ((sdram->cfg & 0x80000000) && !(val & 0x80000000)) {
+                sdram_ddr_map_bcr(s);
+                s->status &= ~0x80000000;
+            } else if ((s->cfg & 0x80000000) && !(val & 0x80000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_ddr_unmap_bcr(sdram);
-                sdram->status |= 0x80000000;
+                sdram_ddr_unmap_bcr(s);
+                s->status |= 0x80000000;
             }
-            if (!(sdram->cfg & 0x40000000) && (val & 0x40000000)) {
-                sdram->status |= 0x40000000;
-            } else if ((sdram->cfg & 0x40000000) && !(val & 0x40000000)) {
-                sdram->status &= ~0x40000000;
+            if (!(s->cfg & 0x40000000) && (val & 0x40000000)) {
+                s->status |= 0x40000000;
+            } else if ((s->cfg & 0x40000000) && !(val & 0x40000000)) {
+                s->status &= ~0x40000000;
             }
-            sdram->cfg = val;
+            s->cfg = val;
             break;
         case 0x24: /* SDRAM_STATUS */
             /* Read-only register */
             break;
         case 0x30: /* SDRAM_RTR */
-            sdram->rtr = val & 0x3FF80000;
+            s->rtr = val & 0x3FF80000;
             break;
         case 0x34: /* SDRAM_PMIT */
-            sdram->pmit = (val & 0xF8000000) | 0x07C00000;
+            s->pmit = (val & 0xF8000000) | 0x07C00000;
             break;
         case 0x40: /* SDRAM_B0CR */
-            sdram_ddr_set_bcr(sdram, 0, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(s, 0, val, s->cfg & 0x80000000);
             break;
         case 0x44: /* SDRAM_B1CR */
-            sdram_ddr_set_bcr(sdram, 1, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(s, 1, val, s->cfg & 0x80000000);
             break;
         case 0x48: /* SDRAM_B2CR */
-            sdram_ddr_set_bcr(sdram, 2, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(s, 2, val, s->cfg & 0x80000000);
             break;
         case 0x4C: /* SDRAM_B3CR */
-            sdram_ddr_set_bcr(sdram, 3, val, sdram->cfg & 0x80000000);
+            sdram_ddr_set_bcr(s, 3, val, s->cfg & 0x80000000);
             break;
         case 0x80: /* SDRAM_TR */
-            sdram->tr = val & 0x018FC01F;
+            s->tr = val & 0x018FC01F;
             break;
         case 0x94: /* SDRAM_ECCCFG */
-            sdram->ecccfg = val & 0x00F00000;
+            s->ecccfg = val & 0x00F00000;
             break;
         case 0x98: /* SDRAM_ECCESR */
             val &= 0xFFF0F000;
-            if (sdram->eccesr == 0 && val != 0) {
-                qemu_irq_raise(sdram->irq);
-            } else if (sdram->eccesr != 0 && val == 0) {
-                qemu_irq_lower(sdram->irq);
+            if (s->eccesr == 0 && val != 0) {
+                qemu_irq_raise(s->irq);
+            } else if (s->eccesr != 0 && val == 0) {
+                qemu_irq_lower(s->irq);
             }
-            sdram->eccesr = val;
+            s->eccesr = val;
             break;
         default: /* Error */
             break;
@@ -382,21 +382,21 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
 
 static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
 {
-    Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
-
-    sdram->addr = 0;
-    sdram->bear = 0;
-    sdram->besr0 = 0; /* No error */
-    sdram->besr1 = 0; /* No error */
-    sdram->cfg = 0;
-    sdram->ecccfg = 0; /* No ECC */
-    sdram->eccesr = 0; /* No error */
-    sdram->pmit = 0x07C00000;
-    sdram->rtr = 0x05F00000;
-    sdram->tr = 0x00854009;
+    Ppc4xxSdramDdrState *s = PPC4xx_SDRAM_DDR(dev);
+
+    s->addr = 0;
+    s->bear = 0;
+    s->besr0 = 0; /* No error */
+    s->besr1 = 0; /* No error */
+    s->cfg = 0;
+    s->ecccfg = 0; /* No ECC */
+    s->eccesr = 0; /* No error */
+    s->pmit = 0x07C00000;
+    s->rtr = 0x05F00000;
+    s->tr = 0x00854009;
     /* We pre-initialize RAM banks */
-    sdram->status = 0;
-    sdram->cfg = 0x00800000;
+    s->status = 0;
+    s->cfg = 0x00800000;
 }
 
 static void ppc4xx_sdram_ddr_realize(DeviceState *dev, Error **errp)
@@ -564,7 +564,7 @@ static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
 
 static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
-    Ppc4xxSdramDdr2State *sdram = opaque;
+    Ppc4xxSdramDdr2State *s = opaque;
     uint32_t ret = 0;
 
     switch (dcrn) {
@@ -572,9 +572,9 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
     case SDRAM_R1BAS:
     case SDRAM_R2BAS:
     case SDRAM_R3BAS:
-        if (sdram->bank[dcrn - SDRAM_R0BAS].size) {
-            ret = sdram_ddr2_bcr(sdram->bank[dcrn - SDRAM_R0BAS].base,
-                                 sdram->bank[dcrn - SDRAM_R0BAS].size);
+        if (s->bank[dcrn - SDRAM_R0BAS].size) {
+            ret = sdram_ddr2_bcr(s->bank[dcrn - SDRAM_R0BAS].base,
+                                 s->bank[dcrn - SDRAM_R0BAS].size);
         }
         break;
     case SDRAM_CONF1HB:
@@ -584,16 +584,16 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
     case SDRAM_PLBADDUHB:
         break;
     case SDRAM0_CFGADDR:
-        ret = sdram->addr;
+        ret = s->addr;
         break;
     case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
+        switch (s->addr) {
         case 0x14: /* SDRAM_MCSTAT (405EX) */
         case 0x1F:
             ret = 0x80000000;
             break;
         case 0x21: /* SDRAM_MCOPT2 */
-            ret = sdram->mcopt2;
+            ret = s->mcopt2;
             break;
         case 0x40: /* SDRAM_MB0CF */
             ret = 0x00008001;
@@ -617,7 +617,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 
 static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc4xxSdramDdr2State *sdram = opaque;
+    Ppc4xxSdramDdr2State *s = opaque;
 
     switch (dcrn) {
     case SDRAM_R0BAS:
@@ -631,23 +631,23 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
     case SDRAM_PLBADDUHB:
         break;
     case SDRAM0_CFGADDR:
-        sdram->addr = val;
+        s->addr = val;
         break;
     case SDRAM0_CFGDATA:
-        switch (sdram->addr) {
+        switch (s->addr) {
         case 0x00: /* B0CR */
             break;
         case 0x21: /* SDRAM_MCOPT2 */
-            if (!(sdram->mcopt2 & 0x08000000) && (val & 0x08000000)) {
+            if (!(s->mcopt2 & 0x08000000) && (val & 0x08000000)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_ddr2_map_bcr(sdram);
-                sdram->mcopt2 |= 0x08000000;
-            } else if ((sdram->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
+                sdram_ddr2_map_bcr(s);
+                s->mcopt2 |= 0x08000000;
+            } else if ((s->mcopt2 & 0x08000000) && !(val & 0x08000000)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_ddr2_unmap_bcr(sdram);
-                sdram->mcopt2 &= ~0x08000000;
+                sdram_ddr2_unmap_bcr(s);
+                s->mcopt2 &= ~0x08000000;
             }
             break;
         default:
@@ -661,10 +661,10 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 
 static void ppc4xx_sdram_ddr2_reset(DeviceState *dev)
 {
-    Ppc4xxSdramDdr2State *sdram = PPC4xx_SDRAM_DDR2(dev);
+    Ppc4xxSdramDdr2State *s = PPC4xx_SDRAM_DDR2(dev);
 
-    sdram->addr = 0;
-    sdram->mcopt2 = 0;
+    s->addr = 0;
+    s->mcopt2 = 0;
 }
 
 static void ppc4xx_sdram_ddr2_realize(DeviceState *dev, Error **errp)
-- 
2.30.4


