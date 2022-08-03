Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE41588DF2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:54:03 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEp0-0005ld-Bb
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERK-0003g2-J1; Wed, 03 Aug 2022 09:29:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERI-0000cQ-E2; Wed, 03 Aug 2022 09:29:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXlG09Vmz4xGR;
 Wed,  3 Aug 2022 23:29:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXlD1hLNz4xGH;
 Wed,  3 Aug 2022 23:29:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 15/20] ppc/ppc405: QOM'ify PLB
Date: Wed,  3 Aug 2022 15:28:39 +0200
Message-Id: <20220803132844.2370514-16-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803132844.2370514-1-clg@kaod.org>
References: <20220803132844.2370514-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 14 ++++++++++
 hw/ppc/ppc405_uc.c | 67 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 8acb90427596..8ca32f35ce67 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* Peripheral local bus arbitrer */
+#define TYPE_PPC405_PLB "ppc405-plb"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
+struct Ppc405PlbState {
+    DeviceState parent_obj;
+
+    PowerPCCPU *cpu;
+
+    uint32_t acr;
+    uint32_t bear;
+    uint32_t besr;
+};
+
 /* PLB to OPB bridge */
 #define TYPE_PPC405_POB "ppc405-pob"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
@@ -245,6 +258,7 @@ struct Ppc405SoCState {
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
+    Ppc405PlbState plb;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index ca214ee4d741..9bbd524ad5ea 100644
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
 static uint32_t dcr_read_plb (void *opaque, int dcrn)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(opaque);
     uint32_t ret;
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         ret = plb->acr;
@@ -182,9 +174,8 @@ static uint32_t dcr_read_plb (void *opaque, int dcrn)
 
 static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(opaque);
 
-    plb = opaque;
     switch (dcrn) {
     case PLB0_ACR:
         /* We don't care about the actual parameters written as
@@ -202,28 +193,55 @@ static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
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
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(dev);
+    CPUPPCState *env;
+
+    assert(plb->cpu);
+
+    env = &plb->cpu->env;
 
-    plb = g_new0(ppc4xx_plb_t, 1);
     ppc_dcr_register(env, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB4A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB0_BEAR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB0_BESR, plb, &dcr_read_plb, &dcr_write_plb);
     ppc_dcr_register(env, PLB4A1_ACR, plb, &dcr_read_plb, &dcr_write_plb);
-    qemu_register_reset(ppc4xx_plb_reset, plb);
+}
+
+static Property ppc405_plb_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405PlbState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_plb_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_plb_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_plb_reset;
+    device_class_set_props(dc, ppc405_plb_properties);
+}
+
+void ppc4xx_plb_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
+
+    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
 }
 
 /*****************************************************************************/
@@ -1446,6 +1464,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
+
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1484,7 +1504,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    object_property_set_link(OBJECT(&s->plb), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&s->plb), NULL, errp)) {
+        return;
+    }
 
     /* PLB to OPB bridge */
     object_property_set_link(OBJECT(&s->pob), "cpu", OBJECT(&s->cpu),
@@ -1615,6 +1639,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_PLB,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405PlbState),
+        .class_init     = ppc405_plb_class_init,
+    }, {
         .name           = TYPE_PPC405_POB,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405PobState),
-- 
2.37.1


