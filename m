Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B758C6B0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:44:47 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0Fa-0007xZ-9Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzi-0005cl-Dm; Mon, 08 Aug 2022 06:28:28 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzg-0001TT-4K; Mon, 08 Aug 2022 06:28:22 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTt6rYrz4xV5;
 Mon,  8 Aug 2022 20:28:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTr6bQbz4xVB;
 Mon,  8 Aug 2022 20:28:16 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 14/22] ppc/ppc405: QOM'ify EBC
Date: Mon,  8 Aug 2022 12:27:26 +0200
Message-Id: <20220808102734.133084-15-clg@kaod.org>
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

EBC is currently modeled as a DCR device. Also drop the ppc405_ebc_init()
helper and adapt the sam460ex machine.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h    | 17 +++++++++++++-
 hw/ppc/ppc405_uc.c | 56 +++++++++++++++++++++++-----------------------
 hw/ppc/sam460ex.c  |  4 +++-
 3 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index c75e4c7cb50a..82bf8dae931f 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -63,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+/* Peripheral controller */
+#define TYPE_PPC405_EBC "ppc405-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
+struct Ppc405EbcState {
+    Ppc4xxDcrDeviceState parent_obj;
+
+    uint32_t addr;
+    uint32_t bcr[8];
+    uint32_t bap[8];
+    uint32_t bear;
+    uint32_t besr0;
+    uint32_t besr1;
+    uint32_t cfg;
+};
+
 /* DMA controller */
 #define TYPE_PPC405_DMA "ppc405-dma"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc405DmaState, PPC405_DMA);
@@ -192,12 +207,12 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    Ppc405EbcState ebc;
 };
 
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
 void ppc4xx_plb_init(CPUPPCState *env);
-void ppc405_ebc_init(CPUPPCState *env);
 
 #endif /* PPC405_H */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 49405e610dc1..732b05156715 100644
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
+static void ppc405_ebc_reset(DeviceState *opaque)
 {
-    ppc4xx_ebc_t *ebc;
+    Ppc405EbcState *ebc = PPC405_EBC(opaque);
     int i;
 
-    ebc = opaque;
     ebc->addr = 0x00000000;
     ebc->bap[0] = 0x7F8FFE80;
     ebc->bcr[0] = 0xFFE28000;
@@ -572,16 +558,21 @@ static void ebc_reset (void *opaque)
     ebc->cfg = 0x80400000;
 }
 
-void ppc405_ebc_init(CPUPPCState *env)
+static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
+
+    ppc4xx_dcr_register(dcr, EBC0_CFGADDR, &dcr_read_ebc, &dcr_write_ebc);
+    ppc4xx_dcr_register(dcr, EBC0_CFGDATA, &dcr_read_ebc, &dcr_write_ebc);
+}
+
+static void ppc405_ebc_class_init(ObjectClass *oc, void *data)
 {
-    ppc4xx_ebc_t *ebc;
-
-    ebc = g_new0(ppc4xx_ebc_t, 1);
-    qemu_register_reset(&ebc_reset, ebc);
-    ppc_dcr_register(env, EBC0_CFGADDR,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
-    ppc_dcr_register(env, EBC0_CFGDATA,
-                     ebc, &dcr_read_ebc, &dcr_write_ebc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_ebc_realize;
+    dc->user_creatable = false;
+    dc->reset = ppc405_ebc_reset;
 }
 
 /*****************************************************************************/
@@ -1367,6 +1358,8 @@ static void ppc405_soc_instance_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, TYPE_PPC405_GPIO);
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
+
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
 }
 
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
@@ -1427,7 +1420,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
                       s->do_dram_init);
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
+        return;
+    }
 
     /* DMA controller */
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->dma), &s->cpu, errp)) {
@@ -1509,6 +1504,11 @@ static void ppc405_soc_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ppc405_types[] = {
     {
+        .name           = TYPE_PPC405_EBC,
+        .parent         = TYPE_PPC4xx_DCR_DEVICE,
+        .instance_size  = sizeof(Ppc405EbcState),
+        .class_init     = ppc405_ebc_class_init,
+    }, {
         .name           = TYPE_PPC405_DMA,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
         .instance_size  = sizeof(Ppc405DmaState),
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0357ee077f0c..320c61a7f36c 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -371,7 +371,9 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
-    ppc405_ebc_init(env);
+    dev = qdev_new(TYPE_PPC405_EBC);
+    ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
+    object_unref(OBJECT(dev));
 
     /* CPR */
     ppc4xx_cpr_init(env);
-- 
2.37.1


