Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B358DB92
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:05:29 +0200 (CEST)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLRjU-00027c-M6
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKq-0004fa-Br; Tue, 09 Aug 2022 11:40:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51723
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=uImW=YN=kaod.org=clg@ozlabs.org>)
 id 1oLRKo-0004SK-7O; Tue, 09 Aug 2022 11:40:00 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M2HLz6VDQz4xVL;
 Wed, 10 Aug 2022 01:39:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M2HLx6D07z4xTv;
 Wed, 10 Aug 2022 01:39:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 17/24] ppc/ppc405: QOM'ify PLB
Date: Tue,  9 Aug 2022 17:38:57 +0200
Message-Id: <20220809153904.485018-18-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809153904.485018-1-clg@kaod.org>
References: <20220809153904.485018-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=uImW=YN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

PLB is currently modeled as a simple DCR device. Also drop the
ppc4xx_plb_init() helper and adapt the sam460ex machine.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 14 +++++++++--
 hw/ppc/ppc405_uc.c | 59 ++++++++++++++++++++++++++--------------------
 hw/ppc/sam460ex.c  |  4 +++-
 3 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4140e811d5ec..cb34792daf6b 100644
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
index 2ea34090de49..7f4c616da67c 100644
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
@@ -202,28 +193,35 @@ static void dcr_write_plb (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_plb_reset (void *opaque)
+static void ppc405_plb_reset(DeviceState *opaque)
 {
-    ppc4xx_plb_t *plb;
+    Ppc405PlbState *plb = PPC405_PLB(opaque);
 
-    plb = opaque;
     plb->acr = 0x00000000;
     plb->bear = 0x00000000;
     plb->besr = 0x00000000;
 }
 
-void ppc4xx_plb_init(CPUPPCState *env)
+static void ppc405_plb_realize(DeviceState *dev, Error **errp)
+{
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, PLB3A0_ACR, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A0_ACR, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_ACR, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BEAR, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB0_BESR, &dcr_read_plb, &dcr_write_plb);
+    ppc4xx_dcr_register(dcr, PLB4A1_ACR, &dcr_read_plb, &dcr_write_plb);
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
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
+    dc->reset = ppc405_plb_reset;
 }
 
 /*****************************************************************************/
@@ -1368,6 +1366,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
+
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1398,7 +1398,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* PLB arbitrer */
-    ppc4xx_plb_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->plb), &s->cpu, errp)) {
+        return;
+    }
 
     /* PLB to OPB bridge */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
@@ -1523,6 +1525,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
index 320c61a7f36c..31139c1554de 100644
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
2.37.1


