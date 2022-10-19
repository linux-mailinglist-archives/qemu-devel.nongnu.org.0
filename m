Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AD604D0B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:20:29 +0200 (CEST)
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBnw-0004cG-8n
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBXK-0006hS-9U; Wed, 19 Oct 2022 12:03:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1olBX6-0001Sq-9Z; Wed, 19 Oct 2022 12:03:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9252B75A176;
 Wed, 19 Oct 2022 18:02:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4FD2675A173; Wed, 19 Oct 2022 18:02:56 +0200 (CEST)
Message-Id: <8e7539cb1fccd7556b68351c4dcf62534c3a69cf.1666194485.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666194485.git.balaton@eik.bme.hu>
References: <cover.1666194485.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 5/8] ppc4xx_sdram: Rename local state variable for brevity
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, philmd@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Wed, 19 Oct 2022 18:02:56 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the sdram local state variable to s in dcr read/write functions
and reset methods for better readability and to match realize methods.
Other places not converted will be changed or removed in subsequent
patches.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/ppc4xx_sdram.c | 158 +++++++++++++++++++++---------------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 2294747594..4bc53c8f01 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -237,56 +237,56 @@ static void sdram_ddr_unmap_bcr(Ppc4xxSdramDdrState *sdram)
 
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
@@ -304,78 +304,78 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
 
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
@@ -386,21 +386,21 @@ static void sdram_ddr_dcr_write(void *opaque, int dcrn, uint32_t val)
 
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
@@ -572,7 +572,7 @@ static void sdram_ddr2_unmap_bcr(Ppc4xxSdramDdr2State *sdram)
 
 static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 {
-    Ppc4xxSdramDdr2State *sdram = opaque;
+    Ppc4xxSdramDdr2State *s = opaque;
     uint32_t ret = 0;
 
     switch (dcrn) {
@@ -580,9 +580,9 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
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
@@ -592,16 +592,16 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
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
@@ -627,7 +627,7 @@ static uint32_t sdram_ddr2_dcr_read(void *opaque, int dcrn)
 
 static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc4xxSdramDdr2State *sdram = opaque;
+    Ppc4xxSdramDdr2State *s = opaque;
 
     switch (dcrn) {
     case SDRAM_R0BAS:
@@ -641,25 +641,25 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
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
-            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+            if (!(s->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
                 (val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("enable");
                 /* validate all RAM mappings */
-                sdram_ddr2_map_bcr(sdram);
-                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
-            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
+                sdram_ddr2_map_bcr(s);
+                s->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
+            } else if ((s->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
                        !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
                 trace_ppc4xx_sdram_enable("disable");
                 /* invalidate all RAM mappings */
-                sdram_ddr2_unmap_bcr(sdram);
-                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
+                sdram_ddr2_unmap_bcr(s);
+                s->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
             }
             break;
         default:
@@ -673,10 +673,10 @@ static void sdram_ddr2_dcr_write(void *opaque, int dcrn, uint32_t val)
 
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


