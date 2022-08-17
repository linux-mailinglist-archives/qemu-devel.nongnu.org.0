Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0745972D0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:21:37 +0200 (CEST)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKrQ-0000po-RJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKeq-0004jp-Im; Wed, 17 Aug 2022 11:08:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oOKen-0002xP-7F; Wed, 17 Aug 2022 11:08:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A992F747F3F;
 Wed, 17 Aug 2022 17:08:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8327B747F19; Wed, 17 Aug 2022 17:08:31 +0200 (CEST)
Message-Id: <5b13ebfd12a71a28035bed5a915cbeee81cf21d1.1660746880.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1660746880.git.balaton@eik.bme.hu>
References: <cover.1660746880.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 13/31] ppc4xx: Rename ppc405-plb to ppc4xx-plb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 17:08:31 +0200 (CEST)
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
index d85c595f9d..8521be317d 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -232,7 +232,7 @@ struct Ppc405SoCState {
     Ppc405EbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
-    Ppc405PlbState plb;
+    Ppc4xxPlbState plb;
     Ppc4xxMalState mal;
 };
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 3de6c77631..4e875288be 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1283,7 +1283,7 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "pob", &s->pob, TYPE_PPC405_POB);
 
-    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC405_PLB);
+    object_initialize_child(obj, "plb", &s->plb, TYPE_PPC4xx_PLB);
 
     object_initialize_child(obj, "mal", &s->mal, TYPE_PPC4xx_MAL);
 }
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 843d759b1b..3baa2fa2b3 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -671,7 +671,7 @@ enum {
 
 static uint32_t dcr_read_plb(void *opaque, int dcrn)
 {
-    Ppc405PlbState *plb = opaque;
+    Ppc4xxPlbState *plb = opaque;
     uint32_t ret;
 
     switch (dcrn) {
@@ -695,7 +695,7 @@ static uint32_t dcr_read_plb(void *opaque, int dcrn)
 
 static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 {
-    Ppc405PlbState *plb = opaque;
+    Ppc4xxPlbState *plb = opaque;
 
     switch (dcrn) {
     case PLB0_ACR:
@@ -717,7 +717,7 @@ static void dcr_write_plb(void *opaque, int dcrn, uint32_t val)
 
 static void ppc405_plb_reset(DeviceState *dev)
 {
-    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxPlbState *plb = PPC4xx_PLB(dev);
 
     plb->acr = 0x00000000;
     plb->bear = 0x00000000;
@@ -726,7 +726,7 @@ static void ppc405_plb_reset(DeviceState *dev)
 
 static void ppc405_plb_realize(DeviceState *dev, Error **errp)
 {
-    Ppc405PlbState *plb = PPC405_PLB(dev);
+    Ppc4xxPlbState *plb = PPC4xx_PLB(dev);
     Ppc4xxDcrDeviceState *dcr = PPC4xx_DCR_DEVICE(dev);
 
     ppc4xx_dcr_register(dcr, PLB3A0_ACR, plb, &dcr_read_plb, &dcr_write_plb);
@@ -784,9 +784,9 @@ static const TypeInfo ppc4xx_types[] = {
         .instance_finalize = ppc4xx_mal_finalize,
         .class_init     = ppc4xx_mal_class_init,
     }, {
-        .name           = TYPE_PPC405_PLB,
+        .name           = TYPE_PPC4xx_PLB,
         .parent         = TYPE_PPC4xx_DCR_DEVICE,
-        .instance_size  = sizeof(Ppc405PlbState),
+        .instance_size  = sizeof(Ppc4xxPlbState),
         .class_init     = ppc405_plb_class_init,
     }, {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index c16303462d..6b1c843eeb 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -308,7 +308,7 @@ static void sam460ex_init(MachineState *machine)
     ppc_dcr_init(env, NULL, NULL);
 
     /* PLB arbitrer */
-    dev = qdev_new(TYPE_PPC405_PLB);
+    dev = qdev_new(TYPE_PPC4xx_PLB);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
 
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index e696e159f3..b19e59271b 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -84,9 +84,9 @@ struct Ppc4xxMalState {
 };
 
 /* Peripheral local bus arbitrer */
-#define TYPE_PPC405_PLB "ppc405-plb"
-OBJECT_DECLARE_SIMPLE_TYPE(Ppc405PlbState, PPC405_PLB);
-struct Ppc405PlbState {
+#define TYPE_PPC4xx_PLB "ppc4xx-plb"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxPlbState, PPC4xx_PLB);
+struct Ppc4xxPlbState {
     Ppc4xxDcrDeviceState parent_obj;
 
     uint32_t acr;
-- 
2.30.4


