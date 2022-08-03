Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22633588D7A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:43:31 +0200 (CEST)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEeo-0006pV-7k
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERH-0003VQ-T2; Wed, 03 Aug 2022 09:29:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERF-0000X7-OJ; Wed, 03 Aug 2022 09:29:31 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXlC5Bvsz4xG9;
 Wed,  3 Aug 2022 23:29:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXl96lYjz4xGH;
 Wed,  3 Aug 2022 23:29:25 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 14/20] ppc/ppc405: QOM'ify POB
Date: Wed,  3 Aug 2022 15:28:38 +0200
Message-Id: <20220803132844.2370514-15-clg@kaod.org>
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
 hw/ppc/ppc405.h    | 14 +++++++++++
 hw/ppc/ppc405_uc.c | 58 +++++++++++++++++++++++++++++++---------------
 2 files changed, 53 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 808662d81599..8acb90427596 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,19 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* PLB to OPB bridge */
+#define TYPE_PPC405_POB "ppc405-pob"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PobState, PPC405_POB);
+struct Ppc405PobState {
+    DeviceState parent_obj;
+
+    PowerPCCPU *cpu;
+
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+};
+
 /* OPB arbitrer */
 #define TYPE_PPC405_OPBA "ppc405-opba"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OpbaState, PPC405_OPBA);
@@ -231,6 +244,7 @@ struct Ppc405SoCState {
     Ppc405DmaState dma;
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
+    Ppc405PobState pob;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 04f7af0f8f09..ca214ee4d741 100644
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
 static uint32_t dcr_read_pob (void *opaque, int dcrn)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(opaque);
     uint32_t ret;
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         ret = pob->bear;
@@ -268,9 +260,8 @@ static uint32_t dcr_read_pob (void *opaque, int dcrn)
 
 static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(opaque);
 
-    pob = opaque;
     switch (dcrn) {
     case POB0_BEAR:
         /* Read only */
@@ -286,26 +277,44 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
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
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(dev);
+    CPUPPCState *env;
+
+    assert(pob->cpu);
+
+    env = &pob->cpu->env;
 
-    pob = g_new0(ppc4xx_pob_t, 1);
     ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
     ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
     ppc_dcr_register(env, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
-    qemu_register_reset(ppc4xx_pob_reset, pob);
+}
+
+static Property ppc405_pob_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405PobState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_pob_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_pob_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_pob_reset;
+    device_class_set_props(dc, ppc405_pob_properties);
 }
 
 /*****************************************************************************/
@@ -1435,6 +1444,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
+
+    object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1476,7 +1487,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_plb_init(env);
 
     /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
+    object_property_set_link(OBJECT(&s->pob), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&s->pob), NULL, errp)) {
+        return;
+    }
 
     /* OBP arbitrer */
    if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
@@ -1600,6 +1615,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_POB,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405PobState),
+        .class_init     = ppc405_pob_class_init,
+    }, {
         .name           = TYPE_PPC405_OPBA,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405OpbaState),
-- 
2.37.1


