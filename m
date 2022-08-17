Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D75972E7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:29:19 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKyr-00076z-H7
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKep-0004h2-7l; Wed, 17 Aug 2022 11:08:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKem-0002up-8M; Wed, 17 Aug 2022 11:08:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8EE29747F20;
 Wed, 17 Aug 2022 17:08:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5FBCB747F19; Wed, 17 Aug 2022 17:08:28 +0200 (CEST)
Message-Id: <c4256d1bffca86fe1d696aa9c56732e5f563e114.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 10/31] ppc/ppc405: QOM'ify PLB
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:28 +0200 (CEST)
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

PLB is currently modeled as a simple DCR device. Also drop the
ppc4xx_plb_init() helper and adapt the sam460ex machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: ppc4xx_dcr_register changes]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    | 14 ++++++++--
 hw/ppc/ppc405_uc.c | 64 ++++++++++++++++++++++++++--------------------
 hw/ppc/sam460ex.c  |  4 ++-
 3 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4140e811d5..cb34792daf 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,17 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
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
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
@@ -232,11 +243,10 @@ struct Ppc405SoCState {
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
+    Ppc405PlbState plb;
 };
 
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
-void ppc4xx_plb_init(CPUPPCState *env);
-
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 0ad1cce790..94ea6b5b70 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -148,19 +148,11 @@ enum {
     PLB4A1_ACR = 0x089,
 };
 
-typedef struct ppc4xx_plb_t ppc4xx_plb_t;
-struct ppc4xx_plb_t {
-    uint32_t acr;
-    uint32_t bear;
-    uint32_t besr;
-};
-
-static uint32_t dcr_read_plb (void *opaque, int dcrn)
+static uint32_t dcr_read_plb(void *opaque, int dcrn)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = opaque;
     uint32_t ret;
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         ret = plb->acr;
@@ -180,11 +172,10 @@ static uint32_t dcr_read_plb (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = opaque;
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         /* We don't care about the actual parameters written as
@@ -202,28 +193,36 @@ static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_plb_reset (void *opaque)
+static void ppc405_plb_reset(DeviceState *dev)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(dev);
 
-    plb = opaque;
     plb->acr = 0x00000000;
     plb->bear = 0x00000000;
     plb->besr = 0x00000000;
 }
 
-void ppc4xx_plb_init(CPUPPCState *env)
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
 {
-    ppc4xx_plb_t *plb;
-
-    plb = g_new0(ppc4xx_plb_t, 1);
-    ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
-    ppc_dcr_register(env, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    qemu_register_reset(ppc4xx_plb_reset, plb);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_plb_realize;
+    dc->reset = ppc405_plb_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1371,6 +1370,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
+
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1402,7 +1403,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->plb), &s->cpu, errp)) {
+        return;
+    }
 
     /* PLB to OPB bridge */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
@@ -1527,6 +1530,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_PLB,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405PlbState),
+        .class_init     = ppc405_plb_class_init,
+    }, {
         .name           = TYPE_PPC405_POB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405PobState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 320c61a7f3..31139c1554 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -309,7 +309,9 @@ static void sam460ex_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    dev = qdev_new(TYPE_PPC405_PLB);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
 
     /* interrupt controllers */
     for (i = 0; i < ARRAY_SIZE(uic); i++) {
-- 
2.30.4


