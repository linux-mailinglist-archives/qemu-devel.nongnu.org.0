Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57736591BC6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:56:57 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtVQ-0001RN-Ez
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9v-0000PE-A4; Sat, 13 Aug 2022 11:34:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9t-0006Ko-7I; Sat, 13 Aug 2022 11:34:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFD87748194;
 Sat, 13 Aug 2022 17:34:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8ED1574818E; Sat, 13 Aug 2022 17:34:39 +0200 (CEST)
Message-Id: <3f182ba0e89eeea855516cf3651fb8cc4cf9b546.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 12/22] ppc4xx: Move PLB model to ppc4xx_devs.c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:39 +0200 (CEST)
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

The PLB is shared between 405 and 440 so move it to the shared file.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h         | 11 -----
 hw/ppc/ppc405_uc.c      | 93 ----------------------------------------
 hw/ppc/ppc4xx_devs.c    | 94 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/ppc4xx.h | 11 +++++
 4 files changed, 105 insertions(+), 104 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 31c94e4742..d85c595f9d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,17 +63,6 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
-/* Peripheral local bus arbitrer */
-#define TYPE_PPC405_PLB "ppc405-plb"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
-struct Ppc405PlbState {
-    Ppc4xxDcrDeviceState parent_obj;
-
-    uint32_t acr;
-    uint32_t bear;
-    uint32_t besr;
-};
-
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 922c23346f..3de6c77631 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -137,94 +137,6 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size)
 /*****************************************************************************/
 /* Shared peripherals */
 
-/*****************************************************************************/
-/* Peripheral local bus arbitrer */
-enum {
-    PLB3A0_ACR = 0x077,
-    PLB4A0_ACR = 0x081,
-    PLB0_BESR  = 0x084,
-    PLB0_BEAR  = 0x086,
-    PLB0_ACR   = 0x087,
-    PLB4A1_ACR = 0x089,
-};
-
-static uint32_t dcr_read_plb(void *opaque, int dcrn)
-{
-    Ppc405PlbState *plb = opaque;
-    uint32_t ret;
-
-    switch (dcrn) {
-    case PLB0_ACR:
-        ret = plb->acr;
-        break;
-    case PLB0_BEAR:
-        ret = plb->bear;
-        break;
-    case PLB0_BESR:
-        ret = plb->besr;
-        break;
-    default:
-        /* Avoid gcc warning */
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
-{
-    Ppc405PlbState *plb = opaque;
-
-    switch (dcrn) {
-    case PLB0_ACR:
-        /* We don't care about the actual parameters written as
-         * we don't manage any priorities on the bus
-         */
-        plb->acr = val & 0xF8000000;
-        break;
-    case PLB0_BEAR:
-        /* Read only */
-        break;
-    case PLB0_BESR:
-        /* Write-clear */
-        plb->besr &= ~val;
-        break;
-    }
-}
-
-static void ppc405_plb_reset(DeviceState *dev)
-{
-    Ppc405PlbState *plb = PPC405_PLB(dev);
-
-    plb->acr = 0x00000000;
-    plb->bear = 0x00000000;
-    plb->besr = 0x00000000;
-}
-
-static void ppc405_plb_realize(DeviceState *dev, Error **errp)
-{
-    Ppc405PlbState *plb = PPC405_PLB(dev);
-    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
-
-    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-}
-
-static void ppc405_plb_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    dc->realize = ppc405_plb_realize;
-    dc->reset = ppc405_plb_reset;
-    /* Reason: only works as function of a ppc4xx SoC */
-    dc->user_creatable = false;
-}
-
 /*****************************************************************************/
 /* PLB to OPB bridge */
 enum {
@@ -1535,11 +1447,6 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
-        .name           = TYPE_PPC405_PLB,
-        .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405PlbState),
-        .class_init     = ppc405_plb_class_init,
-    }, {
         .name           = TYPE_PPC405_POB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405PobState),
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 7d40c1b68a..843d759b1b 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -658,6 +658,95 @@ static void ppc4xx_mal_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, ppc4xx_mal_properties);
 }
 
+/*****************************************************************************/
+/* Peripheral local bus arbitrer */
+enum {
+    PLB3A0_ACR = 0x077,
+    PLB4A0_ACR = 0x081,
+    PLB0_BESR  = 0x084,
+    PLB0_BEAR  = 0x086,
+    PLB0_ACR   = 0x087,
+    PLB4A1_ACR = 0x089,
+};
+
+static uint32_t dcr_read_plb(void *opaque, int dcrn)
+{
+    Ppc405PlbState *plb = opaque;
+    uint32_t ret;
+
+    switch (dcrn) {
+    case PLB0_ACR:
+        ret = plb->acr;
+        break;
+    case PLB0_BEAR:
+        ret = plb->bear;
+        break;
+    case PLB0_BESR:
+        ret = plb->besr;
+        break;
+    default:
+        /* Avoid gcc warning */
+        ret = 0;
+        break;
+    }
+
+    return ret;
+}
+
+static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
+{
+    Ppc405PlbState *plb = opaque;
+
+    switch (dcrn) {
+    case PLB0_ACR:
+        /*
+         * We don't care about the actual parameters written as
+         * we don't manage any priorities on the bus
+         */
+        plb->acr = val & 0xF8000000;
+        break;
+    case PLB0_BEAR:
+        /* Read only */
+        break;
+    case PLB0_BESR:
+        /* Write-clear */
+        plb->besr &= ~val;
+        break;
+    }
+}
+
+static void ppc405_plb_reset(DeviceState *dev)
+{
+    Ppc405PlbState *plb = PPC405_PLB(dev);
+
+    plb->acr = 0x00000000;
+    plb->bear = 0x00000000;
+    plb->besr = 0x00000000;
+}
+
+static void ppc405_plb_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
+}
+
+static void ppc405_plb_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_plb_realize;
+    dc->reset = ppc405_plb_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+}
+
 /* PPC4xx_DCR_DEVICE */
 
 void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
@@ -694,6 +783,11 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_size  = sizeof(Ppc4xxMalState),
         .instance_finalize = ppc4xx_mal_finalize,
         .class_init     = ppc4xx_mal_class_init,
+    }, {
+        .name           = TYPE_PPC405_PLB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PlbState),
+        .class_init     = ppc405_plb_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index f40bd49bc7..e696e159f3 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -83,4 +83,15 @@ struct Ppc4xxMalState {
     uint8_t  rxcnum;
 };
 
+/* Peripheral local bus arbitrer */
+#define TYPE_PPC405_PLB "ppc405-plb"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
+struct Ppc405PlbState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t acr;
+    uint32_t bear;
+    uint32_t besr;
+};
+
 #endif /* PPC4XX_H */
-- 
2.30.4


