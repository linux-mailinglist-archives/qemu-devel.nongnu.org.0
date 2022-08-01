Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92048586BA9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:14:51 +0200 (CEST)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVFy-0002bF-Kq
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCl-0004Pw-C0; Mon, 01 Aug 2022 09:11:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVCi-0007Ix-HW; Mon, 01 Aug 2022 09:11:30 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJRM3zn8z4xGJ;
 Mon,  1 Aug 2022 23:11:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJRJ5Cn9z4x1L;
 Mon,  1 Aug 2022 23:11:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 09/19] ppc/ppc405: QOM'ify OCM
Date: Mon,  1 Aug 2022 15:10:29 +0200
Message-Id: <20220801131039.1693913-10-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801131039.1693913-1-clg@kaod.org>
References: <20220801131039.1693913-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 18 ++++++++++++
 hw/ppc/ppc405_uc.c | 73 ++++++++++++++++++++++++++++------------------
 2 files changed, 63 insertions(+), 28 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index f7c0eb1d0008..e56363366cad 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,23 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* On Chip Memory */
+#define TYPE_PPC405_OCM "ppc405-ocm"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405OcmState, PPC405_OCM);
+struct Ppc405OcmState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
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
@@ -141,6 +158,7 @@ struct Ppc405SoCState {
     DeviceState *uic;
     Ppc405CpcState cpc;
     Ppc405GptState gpt;
+    Ppc405OcmState ocm;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 0f5e4ec15f14..59cade4c0680 100644
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
@@ -830,10 +819,9 @@ static void ocm_update_mappings (ppc405_ocm_t *ocm,
 
 static uint32_t dcr_read_ocm (void *opaque, int dcrn)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(opaque);
     uint32_t ret;
 
-    ocm = opaque;
     switch (dcrn) {
     case OCM0_ISARC:
         ret = ocm->isarc;
@@ -857,10 +845,9 @@ static uint32_t dcr_read_ocm (void *opaque, int dcrn)
 
 static void dcr_write_ocm (void *opaque, int dcrn, uint32_t val)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(opaque);
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
@@ -903,17 +889,21 @@ static void ocm_reset (void *opaque)
     ocm->dsacntl = dsacntl;
 }
 
-static void ppc405_ocm_init(CPUPPCState *env)
+static void ppc405_ocm_realize(DeviceState *dev, Error **errp)
 {
-    ppc405_ocm_t *ocm;
+    Ppc405OcmState *ocm = PPC405_OCM(dev);
+    CPUPPCState *env;
+
+    assert(ocm->cpu);
+
+    env = &ocm->cpu->env;
 
-    ocm = g_new0(ppc405_ocm_t, 1);
     /* XXX: Size is 4096 or 0x04000000 */
-    memory_region_init_ram(&ocm->isarc_ram, NULL, "ppc405.ocm", 4 * KiB,
+    memory_region_init_ram(&ocm->isarc_ram, OBJECT(ocm), "ppc405.ocm", 4 * KiB,
                            &error_fatal);
-    memory_region_init_alias(&ocm->dsarc_ram, NULL, "ppc405.dsarc",
+    memory_region_init_alias(&ocm->dsarc_ram, OBJECT(ocm), "ppc405.dsarc",
                              &ocm->isarc_ram, 0, 4 * KiB);
-    qemu_register_reset(&ocm_reset, ocm);
+
     ppc_dcr_register(env, OCM0_ISARC,
                      ocm, &dcr_read_ocm, &dcr_write_ocm);
     ppc_dcr_register(env, OCM0_ISACNTL,
@@ -924,6 +914,22 @@ static void ppc405_ocm_init(CPUPPCState *env)
                      ocm, &dcr_read_ocm, &dcr_write_ocm);
 }
 
+static Property ppc405_ocm_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405OcmState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_ocm_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ocm_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_ocm_reset;
+    device_class_set_props(dc, ppc405_ocm_properties);
+}
+
 /*****************************************************************************/
 /* General purpose timers */
 static int ppc4xx_gpt_compare(Ppc405GptState *gpt, int n)
@@ -1413,6 +1419,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_property_add_alias(obj, "sys-clk", OBJECT(&s->cpc), "sys-clk");
 
     object_initialize_child(obj, "gpt", &s->gpt, TYPE_PPC405_GPT);
+
+    object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1517,7 +1525,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* OCM */
-    ppc405_ocm_init(env);
+    object_property_set_link(OBJECT(&s->ocm), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ocm), errp)) {
+        return;
+    }
 
     /* GPT */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpt), errp)) {
@@ -1560,6 +1572,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_OCM,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405OcmState),
+        .class_init     = ppc405_ocm_class_init,
+    }, {
         .name           = TYPE_PPC405_GPT,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405GptState),
-- 
2.37.1


