Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F16588D1D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:39:01 +0200 (CEST)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEaS-0008MS-Me
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER9-00033p-W8; Wed, 03 Aug 2022 09:29:24 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53853
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=fO70=YH=kaod.org=clg@ozlabs.org>)
 id 1oJER7-0000Xr-Qy; Wed, 03 Aug 2022 09:29:23 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LyXl45xS4z4xGK;
 Wed,  3 Aug 2022 23:29:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyXl30Kktz4xGH;
 Wed,  3 Aug 2022 23:29:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 11/20] ppc/ppc405: QOM'ify DMA
Date: Wed,  3 Aug 2022 15:28:35 +0200
Message-Id: <20220803132844.2370514-12-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803132844.2370514-1-clg@kaod.org>
References: <20220803132844.2370514-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=fO70=YH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 23 +++++++++++++
 hw/ppc/ppc405_uc.c | 80 +++++++++++++++++++++++++++++-----------------
 2 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 36f6fd45217e..1da34a7f10f3 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -65,6 +65,28 @@ struct ppc4xx_bd_info_t {
 
 typedef struct Ppc405SoCState Ppc405SoCState;
 
+
+
+/* DMA controller */
+#define TYPE_PPC405_DMA "ppc405-dma"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
+struct Ppc405DmaState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
+
+    qemu_irq irqs[4];
+    uint32_t cr[4];
+    uint32_t ct[4];
+    uint32_t da[4];
+    uint32_t sa[4];
+    uint32_t sg[4];
+    uint32_t sr;
+    uint32_t sgc;
+    uint32_t slp;
+    uint32_t pol;
+};
+
 /* GPIO */
 #define TYPE_PPC405_GPIO "ppc405-gpio"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405GpioState, PPC405_GPIO);
@@ -180,6 +202,7 @@ struct Ppc405SoCState {
     Ppc405GptState gpt;
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
+    Ppc405DmaState dma;
 };
 
 /* PowerPC 405 core */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index bd018804594a..6bd93c1cb90c 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -613,35 +613,20 @@ enum {
     DMA0_POL = 0x126,
 };
 
-typedef struct ppc405_dma_t ppc405_dma_t;
-struct ppc405_dma_t {
-    qemu_irq irqs[4];
-    uint32_t cr[4];
-    uint32_t ct[4];
-    uint32_t da[4];
-    uint32_t sa[4];
-    uint32_t sg[4];
-    uint32_t sr;
-    uint32_t sgc;
-    uint32_t slp;
-    uint32_t pol;
-};
-
-static uint32_t dcr_read_dma (void *opaque, int dcrn)
+static uint32_t dcr_read_dma(void *opaque, int dcrn)
 {
     return 0;
 }
 
-static void dcr_write_dma (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
 {
 }
 
-static void ppc405_dma_reset (void *opaque)
+static void ppc405_dma_reset(DeviceState *dev)
 {
-    ppc405_dma_t *dma;
+    Ppc405DmaState *dma = PPC405_DMA(dev);
     int i;
 
-    dma = opaque;
     for (i = 0; i < 4; i++) {
         dma->cr[i] = 0x00000000;
         dma->ct[i] = 0x00000000;
@@ -655,13 +640,20 @@ static void ppc405_dma_reset (void *opaque)
     dma->pol = 0x00000000;
 }
 
-static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
+static void ppc405_dma_realize(DeviceState *dev, Error **errp)
 {
-    ppc405_dma_t *dma;
+    Ppc405DmaState *dma = PPC405_DMA(dev);
+    CPUPPCState *env;
+    int i;
+
+    assert(dma->cpu);
+
+    env = &dma->cpu->env;
+
+    for (i = 0; i < ARRAY_SIZE(dma->irqs); i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dma), &dma->irqs[i]);
+    }
 
-    dma = g_new0(ppc405_dma_t, 1);
-    memcpy(dma->irqs, irqs, 4 * sizeof(qemu_irq));
-    qemu_register_reset(&ppc405_dma_reset, dma);
     ppc_dcr_register(env, DMA0_CR0,
                      dma, &dcr_read_dma, &dcr_write_dma);
     ppc_dcr_register(env, DMA0_CT0,
@@ -712,6 +704,22 @@ static void ppc405_dma_init(CPUPPCState *env, qemu_irq irqs[4])
                      dma, &dcr_read_dma, &dcr_write_dma);
 }
 
+static Property ppc405_dma_properties[] = {
+    DEFINE_PROP_LINK("cpu", Ppc405DmaState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_dma_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_dma_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_dma_reset;
+    device_class_set_props(dc, ppc405_dma_properties);
+}
+
 /*****************************************************************************/
 static uint64_t ppc405_gpio_read(void *opaque, hwaddr addr, unsigned size)
 {
@@ -1408,12 +1416,14 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "ocm", &s->ocm, TYPE_PPC405_OCM);
 
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
+
+    object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq dma_irqs[4], mal_irqs[4];
+    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     Error *err = NULL;
     int i;
@@ -1483,11 +1493,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     ppc405_ebc_init(env);
 
     /* DMA controller */
-    dma_irqs[0] = qdev_get_gpio_in(s->uic, 5);
-    dma_irqs[1] = qdev_get_gpio_in(s->uic, 6);
-    dma_irqs[2] = qdev_get_gpio_in(s->uic, 7);
-    dma_irqs[3] = qdev_get_gpio_in(s->uic, 8);
-    ppc405_dma_init(env, dma_irqs);
+    object_property_set_link(OBJECT(&s->dma), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dma), errp)) {
+        return;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->dma.irqs); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), i,
+                           qdev_get_gpio_in(s->uic, 5 + i));
+    }
 
     /* I2C controller */
     sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
@@ -1561,6 +1576,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_DMA,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc405DmaState),
+        .class_init     = ppc405_dma_class_init,
+    }, {
         .name           = TYPE_PPC405_GPIO,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc405GpioState),
-- 
2.37.1


