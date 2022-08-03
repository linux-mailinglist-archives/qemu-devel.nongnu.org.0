Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9695588D20
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:39:34 +0200 (CEST)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEaz-0000zF-Rp
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERC-0003Dm-8D; Wed, 03 Aug 2022 09:29:26 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJERA-0000X7-35; Wed, 03 Aug 2022 09:29:25 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXl7129jz4xGP;
 Wed,  3 Aug 2022 23:29:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXl52Y8Mz4xGH;
 Wed,  3 Aug 2022 23:29:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
Date: Wed,  3 Aug 2022 15:28:36 +0200
Message-Id: <20220803132844.2370514-13-clg@kaod.org>
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
 hw/ppc/ppc405.h    | 16 +++++++++++
 hw/ppc/ppc405_uc.c | 71 +++++++++++++++++++++++++++++++---------------
 2 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 1da34a7f10f3..1c7fe07b8084 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,7 +65,22 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    DeviceState parent_obj;
+
+    PowerPCCPU *cpu;
 
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
 
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
@@ -203,6 +218,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    Ppc405EbcState ebc;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 6bd93c1cb90c..0166f3fc36da 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -393,17 +393,6 @@ static void ppc4xx_opba_init(hwaddr base)
 
 /*****************************************************************************/
 /* Peripheral controller */
-typedef struct ppc4xx_ebc_t ppc4xx_ebc_t;
-struct ppc4xx_ebc_t {
-    uint32_t addr;
-    uint32_t bcr[8];
-    uint32_t bap[8];
-    uint32_t bear;
-    uint32_t besr0;
-    uint32_t besr1;
-    uint32_t cfg;
-};
-
 enum {
     EBC0_CFGADDR = 0x012,
     EBC0_CFGDATA = 0x013,
@@ -411,10 +400,9 @@ enum {
 
 static uint32_t dcr_read_ebc (void *opaque, int dcrn)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(opaque);
     uint32_t ret;
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ret = ebc->addr;
@@ -496,9 +484,8 @@ static uint32_t dcr_read_ebc (void *opaque, int dcrn)
 
 static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(opaque);
 
-    ebc = opaque;
     switch (dcrn) {
     case EBC0_CFGADDR:
         ebc->addr = val;
@@ -554,12 +541,11 @@ static void dcr_write_ebc (void *opaque, int dcrn, uint32_t val)
     }
 }
 
-static void ebc_reset (void *opaque)
+static void ppc405_ebc_reset(DeviceState *dev)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
     int i;
 
-    ebc = opaque;
     ebc->addr = 0x00000000;
     ebc->bap[0] = 0x7F8FFE80;
     ebc->bcr[0] = 0xFFE28000;
@@ -572,18 +558,46 @@ static void ebc_reset (void *opaque)
     ebc->cfg = 0x80400000;
 }
 
-void ppc405_ebc_init(CPUPPCState *env)
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    CPUPPCState *env;
+
+    assert(ebc->cpu);
+
+    env = &ebc->cpu->env;
 
-    ebc = g_new0(ppc4xx_ebc_t, 1);
-    qemu_register_reset(&ebc_reset, ebc);
     ppc_dcr_register(env, EBC0_CFGADDR,
                      ebc, &dcr_read_ebc, &dcr_write_ebc);
     ppc_dcr_register(env, EBC0_CFGDATA,
                      ebc, &dcr_read_ebc, &dcr_write_ebc);
 }
 
+static Property ppc405_ebc_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405EbcState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_ebc_reset;
+    device_class_set_props(dc, ppc405_ebc_properties);
+}
+
+void ppc405_ebc_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    DeviceState *dev = qdev_new(TYPE_PPC405_EBC);
+
+    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
+}
+
 /*****************************************************************************/
 /* DMA controller */
 enum {
@@ -1418,6 +1432,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
+
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1490,7 +1506,11 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                       s->ram_bases, s->ram_sizes, s->do_dram_init);
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    object_property_set_link(OBJECT(&s->ebc), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&s->ebc), NULL, errp)) {
+        return;
+    }
 
     /* DMA controller */
     object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
@@ -1576,6 +1596,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
+    }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405DmaState),
-- 
2.37.1


