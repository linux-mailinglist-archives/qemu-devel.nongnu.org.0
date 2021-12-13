Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81100472E16
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:54:11 +0100 (CET)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlmM-0006kp-FO
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO2-0007pB-Hg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:02 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:55961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlNv-0000KF-8o
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 904AB20A8F;
 Mon, 13 Dec 2021 13:28:53 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003492d6eeb-7009-4398-b9b1-10fe5687df44,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 13/19] ppc/pnv: Move realize of PEC stacks under the PEC
 model
Date: Mon, 13 Dec 2021 14:28:24 +0100
Message-ID: <20211213132830.108372-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e99f0f81-a163-4585-85bf-532d9774b598
X-Ovh-Tracer-Id: 5374201730957347622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This change will help us providing support for user created PHB4
devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 34 ++++++++++++++++++++++++++++++----
 hw/ppc/pnv.c               | 37 ++++---------------------------------
 2 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index dfed2af0f7df..24a3adcae326 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -556,6 +556,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvChip *chip = pec->chip;
+    uint32_t pec_nest_base;
+    uint32_t pec_pci_base;
     char name[64];
 
     assert(pec);
@@ -579,10 +583,32 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
                           &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
 
-    /*
-     * Let the machine/chip realize the PHB object to customize more
-     * easily some fields
-     */
+    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
+                            &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "device-id", pecc->device_id,
+                            &error_fatal);
+    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
+        return;
+    }
+
+    pec_nest_base = pecc->xscom_nest_base(pec);
+    pec_pci_base = pecc->xscom_pci_base(pec);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
 }
 
 static Property pnv_pec_stk_properties[] = {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c59a4a078cd0..08b037f4e753 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1380,10 +1380,10 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
     }
 }
 
-static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
+static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
-    int i, j;
+    int i;
 
     for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
@@ -1405,35 +1405,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
 
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
-
-        for (j = 0; j < pec->num_stacks; j++) {
-            PnvPhb4PecStack *stack = &pec->stacks[j];
-            Object *obj = OBJECT(&stack->phb);
-
-            object_property_set_int(obj, "chip-id", chip->chip_id,
-                                    &error_fatal);
-            object_property_set_int(obj, "version", pecc->version,
-                                    &error_fatal);
-            object_property_set_int(obj, "device-id", pecc->device_id,
-                                    &error_fatal);
-            object_property_set_link(obj, "stack", OBJECT(stack),
-                                     &error_abort);
-            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
-                return;
-            }
-
-            /* Populate the XSCOM address space. */
-            pnv_xscom_add_subregion(chip,
-                                   pec_nest_base + 0x40 * (stack->stack_no + 1),
-                                   &stack->nest_regs_mr);
-            pnv_xscom_add_subregion(chip,
-                                    pec_pci_base + 0x40 * (stack->stack_no + 1),
-                                    &stack->pci_regs_mr);
-            pnv_xscom_add_subregion(chip,
-                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                                    0x40 * stack->stack_no,
-                                    &stack->phb_regs_mr);
-        }
     }
 }
 
@@ -1529,8 +1500,8 @@ static void pnv_chip_power9_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV9_HOMER_BASE(chip),
                                 &chip9->homer.regs);
 
-    /* PHBs */
-    pnv_chip_power9_phb_realize(chip, &local_err);
+    /* PEC PHBs */
+    pnv_chip_power9_pec_realize(chip, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
-- 
2.31.1


