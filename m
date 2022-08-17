Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC65972E4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:27:50 +0200 (CEST)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKxR-0003wV-9W
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKer-0004jt-2H; Wed, 17 Aug 2022 11:08:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeo-0002xo-5v; Wed, 17 Aug 2022 11:08:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C257874633E;
 Wed, 17 Aug 2022 17:08:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8E04D746324; Wed, 17 Aug 2022 17:08:32 +0200 (CEST)
Message-Id: <10eae70509ca4bd74858fc2c0a0f0e4eb9330199.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 14/31] ppc4xx: Move EBC model to ppc4xx_devs.c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:32 +0200 (CEST)
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

The EBC is shared between 405 and 440 so move it to shared file.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h         |  15 ----
 hw/ppc/ppc405_uc.c      | 191 ----------------------------------------
 hw/ppc/ppc4xx_devs.c    | 191 ++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h |  15 ++++
 4 files changed, 206 insertions(+), 206 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8521be317d..57e1494b05 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -85,21 +85,6 @@ struct Ppc405OpbaState {
     uint8_t pr;
 };
 
-/* Peripheral controller */
-#define TYPE_PPC405_EBC "ppc405-ebc"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
-struct Ppc405EbcState {
-    Ppc4xxDcrDeviceState parent_obj;
-
-    uint32_t addr;
-    uint32_t bcr[8];
-    uint32_t bap[8];
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t cfg;
-};
-
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 4e875288be..c4268e4c40 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -299,192 +299,6 @@ static void ppc405_opba_class_init(ObjectClass *oc, void *data)
 /* Code decompression controller */
 /* XXX: TODO */
 
-/*****************************************************************************/
-/* Peripheral controller */
-enum {
-    EBC0_CFGADDR = 0x012,
-    EBC0_CFGDATA = 0x013,
-};
-
-static uint32_t dcr_read_ebc(void *opaque, int dcrn)
-{
-    Ppc405EbcState *ebc = opaque;
-    uint32_t ret;
-
-    switch (dcrn) {
-    case EBC0_CFGADDR:
-        ret = ebc->addr;
-        break;
-    case EBC0_CFGDATA:
-        switch (ebc->addr) {
-        case 0x00: /* B0CR */
-            ret = ebc->bcr[0];
-            break;
-        case 0x01: /* B1CR */
-            ret = ebc->bcr[1];
-            break;
-        case 0x02: /* B2CR */
-            ret = ebc->bcr[2];
-            break;
-        case 0x03: /* B3CR */
-            ret = ebc->bcr[3];
-            break;
-        case 0x04: /* B4CR */
-            ret = ebc->bcr[4];
-            break;
-        case 0x05: /* B5CR */
-            ret = ebc->bcr[5];
-            break;
-        case 0x06: /* B6CR */
-            ret = ebc->bcr[6];
-            break;
-        case 0x07: /* B7CR */
-            ret = ebc->bcr[7];
-            break;
-        case 0x10: /* B0AP */
-            ret = ebc->bap[0];
-            break;
-        case 0x11: /* B1AP */
-            ret = ebc->bap[1];
-            break;
-        case 0x12: /* B2AP */
-            ret = ebc->bap[2];
-            break;
-        case 0x13: /* B3AP */
-            ret = ebc->bap[3];
-            break;
-        case 0x14: /* B4AP */
-            ret = ebc->bap[4];
-            break;
-        case 0x15: /* B5AP */
-            ret = ebc->bap[5];
-            break;
-        case 0x16: /* B6AP */
-            ret = ebc->bap[6];
-            break;
-        case 0x17: /* B7AP */
-            ret = ebc->bap[7];
-            break;
-        case 0x20: /* BEAR */
-            ret = ebc->bear;
-            break;
-        case 0x21: /* BESR0 */
-            ret = ebc->besr0;
-            break;
-        case 0x22: /* BESR1 */
-            ret = ebc->besr1;
-            break;
-        case 0x23: /* CFG */
-            ret = ebc->cfg;
-            break;
-        default:
-            ret = 0x00000000;
-            break;
-        }
-        break;
-    default:
-        ret = 0x00000000;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc405EbcState *ebc = opaque;
-
-    switch (dcrn) {
-    case EBC0_CFGADDR:
-        ebc->addr = val;
-        break;
-    case EBC0_CFGDATA:
-        switch (ebc->addr) {
-        case 0x00: /* B0CR */
-            break;
-        case 0x01: /* B1CR */
-            break;
-        case 0x02: /* B2CR */
-            break;
-        case 0x03: /* B3CR */
-            break;
-        case 0x04: /* B4CR */
-            break;
-        case 0x05: /* B5CR */
-            break;
-        case 0x06: /* B6CR */
-            break;
-        case 0x07: /* B7CR */
-            break;
-        case 0x10: /* B0AP */
-            break;
-        case 0x11: /* B1AP */
-            break;
-        case 0x12: /* B2AP */
-            break;
-        case 0x13: /* B3AP */
-            break;
-        case 0x14: /* B4AP */
-            break;
-        case 0x15: /* B5AP */
-            break;
-        case 0x16: /* B6AP */
-            break;
-        case 0x17: /* B7AP */
-            break;
-        case 0x20: /* BEAR */
-            break;
-        case 0x21: /* BESR0 */
-            break;
-        case 0x22: /* BESR1 */
-            break;
-        case 0x23: /* CFG */
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-}
-
-static void ppc405_ebc_reset(DeviceState *dev)
-{
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
-    int i;
-
-    ebc->addr = 0x00000000;
-    ebc->bap[0] = 0x7F8FFE80;
-    ebc->bcr[0] = 0xFFE28000;
-    for (i = 0; i < 8; i++) {
-        ebc->bap[i] = 0x00000000;
-        ebc->bcr[i] = 0x00000000;
-    }
-    ebc->besr0 = 0x00000000;
-    ebc->besr1 = 0x00000000;
-    ebc->cfg = 0x80400000;
-}
-
-static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
-{
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-
-    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
-    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
-}
-
-static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc405_ebc_realize;
-    dc->reset = ppc405_ebc_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-}
-
 /*****************************************************************************/
 /* DMA controller */
 enum {
@@ -1456,11 +1270,6 @@ static const TypeInfo ppc405_types[] = {
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OpbaState),
         .class_init     = ppc405_opba_class_init,
-    }, {
-        .name           = TYPE_PPC405_EBC,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405EbcState),
-        .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 3baa2fa2b3..00bb3fe974 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -747,6 +747,192 @@ static void ppc405_plb_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
 }
 
+/*****************************************************************************/
+/* Peripheral controller */
+enum {
+    EBC0_CFGADDR = 0x012,
+    EBC0_CFGDATA = 0x013,
+};
+
+static uint32_t dcr_read_ebc(void *opaque, int dcrn)
+{
+    Ppc405EbcState *ebc = opaque;
+    uint32_t ret;
+
+    switch (dcrn) {
+    case EBC0_CFGADDR:
+        ret = ebc->addr;
+        break;
+    case EBC0_CFGDATA:
+        switch (ebc->addr) {
+        case 0x00: /* B0CR */
+            ret = ebc->bcr[0];
+            break;
+        case 0x01: /* B1CR */
+            ret = ebc->bcr[1];
+            break;
+        case 0x02: /* B2CR */
+            ret = ebc->bcr[2];
+            break;
+        case 0x03: /* B3CR */
+            ret = ebc->bcr[3];
+            break;
+        case 0x04: /* B4CR */
+            ret = ebc->bcr[4];
+            break;
+        case 0x05: /* B5CR */
+            ret = ebc->bcr[5];
+            break;
+        case 0x06: /* B6CR */
+            ret = ebc->bcr[6];
+            break;
+        case 0x07: /* B7CR */
+            ret = ebc->bcr[7];
+            break;
+        case 0x10: /* B0AP */
+            ret = ebc->bap[0];
+            break;
+        case 0x11: /* B1AP */
+            ret = ebc->bap[1];
+            break;
+        case 0x12: /* B2AP */
+            ret = ebc->bap[2];
+            break;
+        case 0x13: /* B3AP */
+            ret = ebc->bap[3];
+            break;
+        case 0x14: /* B4AP */
+            ret = ebc->bap[4];
+            break;
+        case 0x15: /* B5AP */
+            ret = ebc->bap[5];
+            break;
+        case 0x16: /* B6AP */
+            ret = ebc->bap[6];
+            break;
+        case 0x17: /* B7AP */
+            ret = ebc->bap[7];
+            break;
+        case 0x20: /* BEAR */
+            ret = ebc->bear;
+            break;
+        case 0x21: /* BESR0 */
+            ret = ebc->besr0;
+            break;
+        case 0x22: /* BESR1 */
+            ret = ebc->besr1;
+            break;
+        case 0x23: /* CFG */
+            ret = ebc->cfg;
+            break;
+        default:
+            ret = 0x00000000;
+            break;
+        }
+        break;
+    default:
+        ret = 0x00000000;
+        break;
+    }
+
+    return ret;
+}
+
+static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc405EbcState *ebc = opaque;
+
+    switch (dcrn) {
+    case EBC0_CFGADDR:
+        ebc->addr = val;
+        break;
+    case EBC0_CFGDATA:
+        switch (ebc->addr) {
+        case 0x00: /* B0CR */
+            break;
+        case 0x01: /* B1CR */
+            break;
+        case 0x02: /* B2CR */
+            break;
+        case 0x03: /* B3CR */
+            break;
+        case 0x04: /* B4CR */
+            break;
+        case 0x05: /* B5CR */
+            break;
+        case 0x06: /* B6CR */
+            break;
+        case 0x07: /* B7CR */
+            break;
+        case 0x10: /* B0AP */
+            break;
+        case 0x11: /* B1AP */
+            break;
+        case 0x12: /* B2AP */
+            break;
+        case 0x13: /* B3AP */
+            break;
+        case 0x14: /* B4AP */
+            break;
+        case 0x15: /* B5AP */
+            break;
+        case 0x16: /* B6AP */
+            break;
+        case 0x17: /* B7AP */
+            break;
+        case 0x20: /* BEAR */
+            break;
+        case 0x21: /* BESR0 */
+            break;
+        case 0x22: /* BESR1 */
+            break;
+        case 0x23: /* CFG */
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void ppc405_ebc_reset(DeviceState *dev)
+{
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    int i;
+
+    ebc->addr = 0x00000000;
+    ebc->bap[0] = 0x7F8FFE80;
+    ebc->bcr[0] = 0xFFE28000;
+    for (i = 0; i < 8; i++) {
+        ebc->bap[i] = 0x00000000;
+        ebc->bcr[i] = 0x00000000;
+    }
+    ebc->besr0 = 0x00000000;
+    ebc->besr1 = 0x00000000;
+    ebc->cfg = 0x80400000;
+}
+
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
+    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, ebc, &dcr_read_ebc, &dcr_write_ebc);
+}
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->reset = ppc405_ebc_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+}
+
 /* PPC4xx_DCR_DEVICE */
 
 void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
@@ -788,6 +974,11 @@ static const TypeInfo ppc4xx_types[] = {
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
+    }, {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index b19e59271b..4472ec254e 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -94,4 +94,19 @@ struct Ppc4xxPlbState {
     uint32_t besr;
 };
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
+
 #endif /* PPC4XX_H */
-- 
2.30.4


