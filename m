Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C6586C04
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:30:55 +0200 (CEST)
Received: from localhost ([::1]:44842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVVT-0001DA-Q5
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVDC-0005jj-2y; Mon, 01 Aug 2022 09:11:58 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIVD9-0007NQ-KY; Mon, 01 Aug 2022 09:11:57 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxJRs1Q0Gz4xGS;
 Mon,  1 Aug 2022 23:11:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxJRp2VD8z4xGQ;
 Mon,  1 Aug 2022 23:11:49 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 16/19] ppc/ppc405: QOM'ify MAL
Date: Mon,  1 Aug 2022 15:10:36 +0200
Message-Id: <20220801131039.1693913-17-clg@kaod.org>
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
 hw/ppc/ppc405.h         |   1 +
 include/hw/ppc/ppc4xx.h |  28 ++++++++++
 hw/ppc/ppc405_uc.c      |  20 +++++--
 hw/ppc/ppc4xx_devs.c    | 120 +++++++++++++++++++++++++---------------
 4 files changed, 118 insertions(+), 51 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 4ff5cdcf5c65..0cbfd977aecf 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -259,6 +259,7 @@ struct Ppc405SoCState {
     Ppc405OpbaState opba;
     Ppc405PobState pob;
     Ppc405PlbState plb;
+    Ppc4xxMalState mal;
 };
 
 /* PowerPC 405 core */
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 980f964b5a91..a383560576d7 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -26,6 +26,7 @@
 #define PPC4XX_H
 
 #include "hw/ppc/ppc.h"
+#include "hw/sysbus.h"
 #include "exec/memory.h"
 
 /* PowerPC 4xx core initialization */
@@ -44,6 +45,33 @@ void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
                         hwaddr *ram_sizes,
                         int do_init);
 
+/* Memory Access Layer (MAL) */
+#define TYPE_PPC4xx_MAL "ppc4xx-mal"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxMalState, PPC4xx_MAL);
+struct Ppc4xxMalState {
+    SysBusDevice parent_obj;
+
+    PowerPCCPU *cpu;
+
+    qemu_irq irqs[4];
+    uint32_t cfg;
+    uint32_t esr;
+    uint32_t ier;
+    uint32_t txcasr;
+    uint32_t txcarr;
+    uint32_t txeobisr;
+    uint32_t txdeir;
+    uint32_t rxcasr;
+    uint32_t rxcarr;
+    uint32_t rxeobisr;
+    uint32_t rxdeir;
+    uint32_t *txctpr;
+    uint32_t *rxctpr;
+    uint32_t *rcbs;
+    uint8_t  txcnum;
+    uint8_t  rxcnum;
+};
+
 void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                      qemu_irq irqs[4]);
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 45bcf3a6dd8a..de2c3c0c747c 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1466,12 +1466,13 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 
     object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
+
+    object_initialize_child(obj, "mal", &s->mal, TYPE_PPC4xx_MAL);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    qemu_irq mal_irqs[4];
     CPUPPCState *env;
     Error *err = NULL;
     int i;
@@ -1612,11 +1613,18 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* MAL */
-    mal_irqs[0] = qdev_get_gpio_in(s->uic, 11);
-    mal_irqs[1] = qdev_get_gpio_in(s->uic, 12);
-    mal_irqs[2] = qdev_get_gpio_in(s->uic, 13);
-    mal_irqs[3] = qdev_get_gpio_in(s->uic, 14);
-    ppc4xx_mal_init(env, 4, 2, mal_irqs);
+    object_property_set_int(OBJECT(&s->mal), "txc-num", 4, &error_abort);
+    object_property_set_int(OBJECT(&s->mal), "rxc-num", 2, &error_abort);
+    object_property_set_link(OBJECT(&s->mal), "cpu", OBJECT(&s->cpu),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mal), errp)) {
+        return;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->mal.irqs); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->mal), i,
+                           qdev_get_gpio_in(s->uic, 11 + i));
+    }
 
     /* Ethernet */
     /* Uses UIC IRQs 9, 15, 17 */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 737c0896b4f8..c935a7acf6a0 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -491,32 +491,10 @@ enum {
     MAL0_RCBS1    = 0x1E1,
 };
 
-typedef struct ppc4xx_mal_t ppc4xx_mal_t;
-struct ppc4xx_mal_t {
-    qemu_irq irqs[4];
-    uint32_t cfg;
-    uint32_t esr;
-    uint32_t ier;
-    uint32_t txcasr;
-    uint32_t txcarr;
-    uint32_t txeobisr;
-    uint32_t txdeir;
-    uint32_t rxcasr;
-    uint32_t rxcarr;
-    uint32_t rxeobisr;
-    uint32_t rxdeir;
-    uint32_t *txctpr;
-    uint32_t *rxctpr;
-    uint32_t *rcbs;
-    uint8_t  txcnum;
-    uint8_t  rxcnum;
-};
-
-static void ppc4xx_mal_reset(void *opaque)
+static void ppc4xx_mal_reset(DeviceState *dev)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(dev);
 
-    mal = opaque;
     mal->cfg = 0x0007C000;
     mal->esr = 0x00000000;
     mal->ier = 0x00000000;
@@ -530,10 +508,9 @@ static void ppc4xx_mal_reset(void *opaque)
 
 static uint32_t dcr_read_mal(void *opaque, int dcrn)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(opaque);
     uint32_t ret;
 
-    mal = opaque;
     switch (dcrn) {
     case MAL0_CFG:
         ret = mal->cfg;
@@ -587,13 +564,12 @@ static uint32_t dcr_read_mal(void *opaque, int dcrn)
 
 static void dcr_write_mal(void *opaque, int dcrn, uint32_t val)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(opaque);
 
-    mal = opaque;
     switch (dcrn) {
     case MAL0_CFG:
         if (val & 0x80000000) {
-            ppc4xx_mal_reset(mal);
+            ppc4xx_mal_reset(DEVICE(mal));
         }
         mal->cfg = val & 0x00FFC087;
         break;
@@ -644,23 +620,30 @@ static void dcr_write_mal(void *opaque, int dcrn, uint32_t val)
     }
 }
 
-void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
-                     qemu_irq irqs[4])
+static void ppc4xx_mal_realize(DeviceState *dev, Error **errp)
 {
-    ppc4xx_mal_t *mal;
+    Ppc4xxMalState *mal = PPC4xx_MAL(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    CPUPPCState *env;
     int i;
 
-    assert(txcnum <= 32 && rxcnum <= 32);
-    mal = g_malloc0(sizeof(*mal));
-    mal->txcnum = txcnum;
-    mal->rxcnum = rxcnum;
-    mal->txctpr = g_new0(uint32_t, txcnum);
-    mal->rxctpr = g_new0(uint32_t, rxcnum);
-    mal->rcbs = g_new0(uint32_t, rxcnum);
-    for (i = 0; i < 4; i++) {
-        mal->irqs[i] = irqs[i];
+    assert(mal->cpu);
+
+    env = &mal->cpu->env;
+
+    if (mal->txcnum > 32 || mal->rxcnum > 32) {
+        error_setg(errp, "invalid TXC/RXC number");
+        return;
     }
-    qemu_register_reset(&ppc4xx_mal_reset, mal);
+
+    mal->txctpr = g_new0(uint32_t, mal->txcnum);
+    mal->rxctpr = g_new0(uint32_t, mal->rxcnum);
+    mal->rcbs = g_new0(uint32_t, mal->rxcnum);
+
+    for (i = 0; i < ARRAY_SIZE(mal->irqs); i++) {
+        sysbus_init_irq(sbd, &mal->irqs[i]);
+    }
+
     ppc_dcr_register(env, MAL0_CFG,
                      mal, &dcr_read_mal, &dcr_write_mal);
     ppc_dcr_register(env, MAL0_ESR,
@@ -683,16 +666,63 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
                      mal, &dcr_read_mal, &dcr_write_mal);
     ppc_dcr_register(env, MAL0_RXDEIR,
                      mal, &dcr_read_mal, &dcr_write_mal);
-    for (i = 0; i < txcnum; i++) {
+    for (i = 0; i < mal->txcnum; i++) {
         ppc_dcr_register(env, MAL0_TXCTP0R + i,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
-    for (i = 0; i < rxcnum; i++) {
+    for (i = 0; i < mal->rxcnum; i++) {
         ppc_dcr_register(env, MAL0_RXCTP0R + i,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
-    for (i = 0; i < rxcnum; i++) {
+    for (i = 0; i < mal->rxcnum; i++) {
         ppc_dcr_register(env, MAL0_RCBS0 + i,
                          mal, &dcr_read_mal, &dcr_write_mal);
     }
 }
+
+static Property ppc4xx_mal_properties[] = {
+    DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
+    DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
+    DEFINE_PROP_LINK("cpu", Ppc4xxMalState, cpu, TYPE_POWERPC_CPU,
+                     PowerPCCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc4xx_mal_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc4xx_mal_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc4xx_mal_reset;
+    device_class_set_props(dc, ppc4xx_mal_properties);
+}
+
+void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
+                     qemu_irq irqs[4])
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    DeviceState *dev = qdev_new(TYPE_PPC4xx_MAL);
+    Ppc4xxMalState *mal = PPC4xx_MAL(dev);
+    int i;
+
+    qdev_prop_set_uint32(dev, "txc-num", txcnum);
+    qdev_prop_set_uint32(dev, "rxc-num", rxcnum);
+    object_property_set_link(OBJECT(cpu), "cpu", OBJECT(dev), &error_abort);
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
+
+    for (i = 0; i < ARRAY_SIZE(mal->irqs); i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irqs[i]);
+    }
+}
+
+static const TypeInfo ppc4xx_types[] = {
+    {
+        .name           = TYPE_PPC4xx_MAL,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(Ppc4xxMalState),
+        .class_init     = ppc4xx_mal_class_init,
+    }
+};
+
+DEFINE_TYPES(ppc4xx_types)
-- 
2.37.1


