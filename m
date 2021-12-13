Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA5472D6D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:34:56 +0100 (CET)
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlTi-0003AK-4b
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:34:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlO0-0007gA-Ew; Mon, 13 Dec 2021 08:29:00 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mwlNu-0000Jf-JV; Mon, 13 Dec 2021 08:29:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A5A2920A50;
 Mon, 13 Dec 2021 13:28:52 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a4648ea2-9289-4b6d-9afa-84a9cba541aa,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 11/19] ppc/pnv: Compute the PHB index from the PHB4 PEC
 model
Date: Mon, 13 Dec 2021 14:28:22 +0100
Message-ID: <20211213132830.108372-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d8306a08-40a8-4a9f-a6bc-2e7d3f69aad2
X-Ovh-Tracer-Id: 5373920258204928806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the num_stacks class attribute to compute the PHB index depending
on the PEC index :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

The routine pnv_pec_phb_offset() is a bit complex but it also prepares
ground for PHB5 which has a different layout of stacks: 3 per PECs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 16 ++++++++++++++++
 hw/ppc/pnv.c               |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 293909b5cb90..a7dd4173d598 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -374,6 +374,19 @@ static void pnv_pec_instance_init(Object *obj)
     }
 }
 
+static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
+{
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int index = pec->index;
+    int offset = 0;
+
+    while (index--) {
+        offset += pecc->num_stacks[index];
+    }
+
+    return offset;
+}
+
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
@@ -394,8 +407,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
+        int phb_id = pnv_pec_phb_offset(pec) + i;
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
+        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -538,6 +553,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
+    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 87edbbe91e0f..284fbd50dae3 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1384,7 +1384,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
     int i, j;
-    int phb_id = 0;
 
     for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
@@ -1409,11 +1408,10 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
 
-        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
+        for (j = 0; j < pec->num_stacks; j++) {
             PnvPhb4PecStack *stack = &pec->stacks[j];
             Object *obj = OBJECT(&stack->phb);
 
-            object_property_set_int(obj, "index", phb_id, &error_fatal);
             object_property_set_int(obj, "chip-id", chip->chip_id,
                                     &error_fatal);
             object_property_set_int(obj, "version", pecc->version,
-- 
2.31.1


