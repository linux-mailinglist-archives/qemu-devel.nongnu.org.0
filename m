Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71E58C753
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 13:11:18 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0fF-00046D-3p
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 07:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzo-0005eH-Ef; Mon, 08 Aug 2022 06:28:30 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzm-0001Uv-Em; Mon, 08 Aug 2022 06:28:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XV00Pzdz4xVP;
 Mon,  8 Aug 2022 20:28:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTy08wHz4xVB;
 Mon,  8 Aug 2022 20:28:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 16/22] ppc/ppc405: QOM'ify POB
Date: Mon,  8 Aug 2022 12:27:28 +0200
Message-Id: <20220808102734.133084-17-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

POB is currently modeled as a simple DCR device.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 12 +++++++++++
 hw/ppc/ppc405_uc.c | 50 ++++++++++++++++++++++++++--------------------
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index d63c2acdc7b5..4140e811d5ec 100644
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
index d66db9b9c14a..1e731f69932c 100644
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
@@ -286,26 +277,32 @@ static void dcr_write_pob (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ppc4xx_pob_reset (void *opaque)
+static void ppc405_pob_reset(DeviceState *opaque)
 {
-    ppc4xx_pob_t *pob;
+    Ppc405PobState *pob = PPC405_POB(opaque);
 
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
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
-    pob = g_new0(ppc4xx_pob_t, 1);
-    ppc_dcr_register(env, POB0_BEAR, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR0, pob, &dcr_read_pob, &dcr_write_pob);
-    ppc_dcr_register(env, POB0_BESR1, pob, &dcr_read_pob, &dcr_write_pob);
-    qemu_register_reset(ppc4xx_pob_reset, pob);
+    ppc4xx_dcr_register(dcr, POB0_BEAR, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR0, &dcr_read_pob, &dcr_write_pob);
+    ppc4xx_dcr_register(dcr, POB0_BESR1, &dcr_read_pob, &dcr_write_pob);
+}
+
+static void ppc405_pob_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_pob_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_pob_reset;
 }
 
 /*****************************************************************************/
@@ -1361,6 +1358,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
+
+    object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1389,7 +1388,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc4xx_plb_init(env);
 
     /* PLB to OPB bridge */
-    ppc4xx_pob_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->pob), &s->cpu, errp)) {
+        return;
+    }
 
     /* OBP arbitrer */
    if (!sysbus_realize(SYS_BUS_DEVICE(&s->opba), errp)) {
@@ -1508,6 +1509,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
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
2.37.1


