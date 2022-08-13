Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994DE591B91
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 17:43:09 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMtI4-00043q-Ec
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 11:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9q-00005T-0b; Sat, 13 Aug 2022 11:34:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:28292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oMt9l-0006Ib-TT; Sat, 13 Aug 2022 11:34:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6666A748195;
 Sat, 13 Aug 2022 17:34:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 30873748190; Sat, 13 Aug 2022 17:34:31 +0200 (CEST)
Message-Id: <945147317f98dd64e0dfa7a91a9786f3c111e903.1660402839.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660402839.git.balaton@eik.bme.hu>
References: <cover.1660402839.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 04/22] ppc/ppc405: QOM'ify OCM
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Aug 2022 17:34:31 +0200 (CEST)
X-Spam-Probability: 10%
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

From: Cédric Le Goater <clg@kaod.org>

The OCM controller is currently modeled as a simple DCR device with
a couple of memory regions.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h    | 16 ++++++++++
 hw/ppc/ppc405_uc.c | 77 +++++++++++++++++++++++-----------------------
 2 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index bcf55e4f6b..a5b493d3e7 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* On Chip Memory */
+#define TYPE_PPC405_OCM "ppc405-ocm"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
+struct Ppc405OcmState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    MemoryRegion ram;
+    MemoryRegion isarc_ram;
+    MemoryRegion dsarc_ram;
+    uint32_t isarc;
+    uint32_t isacntl;
+    uint32_t dsarc;
+    uint32_t dsacntl;
+};
+
 /* General purpose timers */
 #define TYPE_PPC405_GPT "ppc405-gpt"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GptState, PPC405_GPT);
@@ -136,6 +151,7 @@ struct Ppc405SoCState {
     DeviceState *uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
+    Ppc405OcmState ocm;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index bf95fabdc0..2282cfcd18 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -773,20 +773,9 @@ enum {
     OCM0_DSACNTL = 0x01B,
 };
 
-typedef struct ppc405_ocm_t ppc405_ocm_t;
-struct ppc405_ocm_t {
-    MemoryRegion ram;
-    MemoryRegion isarc_ram;
-    MemoryRegion dsarc_ram;
-    uint32_t isarc;
-    uint32_t isacntl;
-    uint32_t dsarc;
-    uint32_t dsacntl;
-};
-
-static void ocm_update_mappings (ppc405_ocm_t *ocm,
-                                 uint32_t isarc, uint32_t isacntl,
-                                 uint32_t dsarc, uint32_t dsacntl)
+static void ocm_update_mappings(Ppc405OcmState *ocm,
+                                uint32_t isarc, uint32_t isacntl,
+                                uint32_t dsarc, uint32_t dsacntl)
 {
     trace_ocm_update_mappings(isarc, isacntl, dsarc, dsacntl, ocm->isarc,
                               ocm->isacntl, ocm->dsarc, ocm->dsacntl);
@@ -828,12 +817,11 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
     }
 }
 
-static uint32_t dcr_read_ocm (void *opaque, int dcrn)
+static uint32_t dcr_read_ocm(void *opaque, int dcrn)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = opaque;
     uint32_t ret;
 
-    ocm = opaque;
     switch (dcrn) {
     case OCM0_ISARC:
         ret = ocm->isarc;
@@ -855,12 +843,11 @@ static uint32_t dcr_read_ocm (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_ocm(void *opaque, int dcrn, uint32_t val)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = opaque;
     uint32_t isarc, dsarc, isacntl, dsacntl;
 
-    ocm = opaque;
     isarc = ocm->isarc;
     dsarc = ocm->dsarc;
     isacntl = ocm->isacntl;
@@ -886,12 +873,11 @@ static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
     ocm->dsacntl = dsacntl;
 }
 
-static void ocm_reset (void *opaque)
+static void ppc405_ocm_reset(DeviceState *dev)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(dev);
     uint32_t isarc, dsarc, isacntl, dsacntl;
 
-    ocm = opaque;
     isarc = 0x00000000;
     isacntl = 0x00000000;
     dsarc = 0x00000000;
@@ -903,25 +889,31 @@ static void ocm_reset (void *opaque)
     ocm->dsacntl = dsacntl;
 }
 
-static void ppc405_ocm_init(CPUPPCState *env)
+static void ppc405_ocm_realize(DeviceState *dev, Error **errp)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(dev);
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
-    ocm = g_new0(ppc405_ocm_t, 1);
     /* XXX: Size is 4096 or 0x04000000 */
-    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
+    memory_region_init_ram(&ocm->isarc_ram, OBJECT(ocm), "ppc405.ocm", 4 * KiB,
                            &error_fatal);
-    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc",
+    memory_region_init_alias(&ocm->dsarc_ram, OBJECT(ocm), "ppc405.dsarc",
                              &ocm->isarc_ram, 0, 4 * KiB);
-    qemu_register_reset(&ocm_reset, ocm);
-    ppc_dcr_register(env, OCM0_ISARC,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_ISACNTL,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_DSARC,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
-    ppc_dcr_register(env, OCM0_DSACNTL,
-                     ocm, &dcr_read_ocm, &dcr_write_ocm);
+
+    ppc4xx_dcr_register(dcr, OCM0_ISARC, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_ISACNTL, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_DSARC, ocm, &dcr_read_ocm, &dcr_write_ocm);
+    ppc4xx_dcr_register(dcr, OCM0_DSACNTL, ocm, &dcr_read_ocm, &dcr_write_ocm);
+}
+
+static void ppc405_ocm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ocm_realize;
+    dc->reset = ppc405_ocm_reset;
+    /* Reason: only works as function of a ppc4xx SoC */
+    dc->user_creatable = false;
 }
 
 /*****************************************************************************/
@@ -1417,6 +1409,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
+
+    object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 }
 
 static void ppc405_reset(void *opaque)
@@ -1513,7 +1507,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* OCM */
-    ppc405_ocm_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ocm), &s->cpu, errp)) {
+        return;
+    }
 
     /* GPT */
     sbd = SYS_BUS_DEVICE(&s->gpt);
@@ -1556,6 +1552,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OCM,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405OcmState),
+        .class_init     = ppc405_ocm_class_init,
+    }, {
         .name           = TYPE_PPC405_GPT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405GptState),
-- 
2.30.4


