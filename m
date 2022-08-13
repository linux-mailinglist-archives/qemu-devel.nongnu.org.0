Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC02591B96
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:43:21 +0200 (CEST)
Received: from localhost ([::1]:46660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtIG-0004v2-Q9
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9t-0000Gv-7A; Sat, 13 Aug 2022 11:34:41 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9r-0006K4-6u; Sat, 13 Aug 2022 11:34:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 97075748197;
 Sat, 13 Aug 2022 17:34:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6D9DC74818E; Sat, 13 Aug 2022 17:34:36 +0200 (CEST)
Message-Id: <eaf21a1fcfd071766f50c04ccff5a3b7f6cb9ee9.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 09/22] ppc/ppc405: QOM'ify POB
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:36 +0200 (CEST)
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

From: Cédric Le Goater <clg@kaod.org>

POB is currently modeled as a simple DCR device.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    | 12 ++++++++++
 hw/ppc/ppc405_uc.c | 56 ++++++++++++++++++++++++++--------------------
 2 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index d63c2acdc7..4140e811d5 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* PLB to OPB bridge */
+#define TYPE_PPC405_POB "ppc405-pob"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
+struct Ppc405PobState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+};
+
 /* OPB arbitrer */
 #define TYPE_PPC405_OPBA "ppc405-opba"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
@@ -220,6 +231,7 @@ struct Ppc405SoCState {
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
+    Ppc405PobState pob;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 911ec958c6..0ad1cce790 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -234,19 +234,11 @@ enum {
     POB0_BEAR  = 0x0A4,
 };
 
-typedef struct ppc4xx_pob_t ppc4xx_pob_t;
-struct ppc4xx_pob_t {
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-};
-
-static uint32_t dcr_read_pob (void *opaque, int dcrn)
+static uint32_t dcr_read_pob(void *opaque, int dcrn)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = opaque;
     uint32_t ret;
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         ret = pob->bear;
@@ -266,11 +258,10 @@ static uint32_t dcr_read_pob (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_pob(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = opaque;
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         /* Read only */
@@ -286,26 +277,34 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_pob_reset (void *opaque)
+static void ppc405_pob_reset(DeviceState *dev)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(dev);
 
-    pob = opaque;
     /* No error */
     pob->bear = 0x00000000;
     pob->besr0 = 0x0000000;
     pob->besr1 = 0x0000000;
 }
 
-static void ppc4xx_pob_init(CPUPPCState *env)
+static void ppc405_pob_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405PobState *pob = PPC405_POB(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
+}
+
+static void ppc405_pob_class_init(ObjectClass *oc, void *data)
 {
-    ppc4xx_pob_t *pob;
+    DeviceClass *dc = DEVICE_CLASS(oc);
 
-    pob = g_new0(ppc4xx_pob_t, 1);
-    ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
-    qemu_register_reset(ppc4xx_pob_reset, pob);
+    dc->realize = ppc405_pob_realize;
+    dc->reset = ppc405_pob_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1370,6 +1369,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
+
+    object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1404,7 +1405,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_plb_init(env);
 
     /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
+        return;
+    }
 
     /* OBP arbitrer */
     sbd = SYS_BUS_DEVICE(&s->opba);
@@ -1524,6 +1527,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_POB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PobState),
+        .class_init     = ppc405_pob_class_init,
+    }, {
         .name           = TYPE_PPC405_OPBA,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OpbaState),
-- 
2.30.4


