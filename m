Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD55972D9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:24:11 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKtr-0006UD-PG
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKer-0004ju-2E; Wed, 17 Aug 2022 11:08:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKep-0002yJ-7y; Wed, 17 Aug 2022 11:08:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BEDCB74637F;
 Wed, 17 Aug 2022 17:08:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 98D77746324; Wed, 17 Aug 2022 17:08:33 +0200 (CEST)
Message-Id: <63d9b14c8ff5f73e35bffca1036394b5235735ee.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 15/31] ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:33 +0200 (CEST)
X-Spam-Probability: 8%
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

This device is shared between different 4xx socs.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc405.h         |  2 +-
 hw/ppc/ppc405_uc.c      |  2 +-
 hw/ppc/ppc4xx_devs.c    | 12 ++++++------
 hw/ppc/sam460ex.c       |  2 +-
 include/hw/ppc/ppc4xx.h |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 57e1494b05..343a84c98e 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -214,7 +214,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
-    Ppc405EbcState ebc;
+    Ppc4xxEbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
     Ppc4xxPlbState plb;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index c4268e4c40..e817f00ad1 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1091,7 +1091,7 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
-    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC405_EBC);
+    object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC4xx_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
 
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 00bb3fe974..fbfb21c8e8 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -756,7 +756,7 @@ enum {
 
 static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 {
-    Ppc405EbcState *ebc = opaque;
+    Ppc4xxEbcState *ebc = opaque;
     uint32_t ret;
 
     switch (dcrn) {
@@ -840,7 +840,7 @@ static uint32_t dcr_read_ebc(void *opaque, int dcrn)
 
 static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc405EbcState *ebc = opaque;
+    Ppc4xxEbcState *ebc = opaque;
 
     switch (dcrn) {
     case EBC0_CFGADDR:
@@ -899,7 +899,7 @@ static void dcr_write_ebc(void *opaque, int dcrn, uint32_t val)
 
 static void ppc405_ebc_reset(DeviceState *dev)
 {
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxEbcState *ebc = PPC4xx_EBC(dev);
     int i;
 
     ebc->addr = 0x00000000;
@@ -916,7 +916,7 @@ static void ppc405_ebc_reset(DeviceState *dev)
 
 static void ppc405_ebc_realize(DeviceState *dev, Error **errp)
 {
-    Ppc405EbcState *ebc = PPC405_EBC(dev);
+    Ppc4xxEbcState *ebc = PPC4xx_EBC(dev);
     Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
     ppc4xx_dcr_register(dcr, EBC0_CFGADDR, ebc, &dcr_read_ebc, &dcr_write_ebc);
@@ -975,9 +975,9 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
     }, {
-        .name           = TYPE_PPC405_EBC,
+        .name           = TYPE_PPC4xx_EBC,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405EbcState),
+        .instance_size  = sizeof(Ppc4xxEbcState),
         .class_init     = ppc405_ebc_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 6b1c843eeb..0d9259f0f2 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -372,7 +372,7 @@ static void sam460ex_init(MachineState *machine)
                                qdev_get_gpio_in(uic[0], 3));
 
     /* External bus controller */
-    dev = qdev_new(TYPE_PPC405_EBC);
+    dev = qdev_new(TYPE_PPC4xx_EBC);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
 
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 4472ec254e..a1781afa8e 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -95,9 +95,9 @@ struct Ppc4xxPlbState {
 };
 
 /* Peripheral controller */
-#define TYPE_PPC405_EBC "ppc405-ebc"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405EbcState, PPC405_EBC);
-struct Ppc405EbcState {
+#define TYPE_PPC4xx_EBC "ppc4xx-ebc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxEbcState, PPC4xx_EBC);
+struct Ppc4xxEbcState {
     Ppc4xxDcrDeviceState parent_obj;
 
     uint32_t addr;
-- 
2.30.4


