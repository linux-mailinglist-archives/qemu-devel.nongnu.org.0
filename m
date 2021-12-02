Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881084665E7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:57:03 +0100 (CET)
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnWA-00033b-By
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIU-0000xg-LJ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:54 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:53333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIL-0005Hj-6d
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D413F2219A;
 Thu,  2 Dec 2021 14:42:43 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0011579072f-43a2-4879-97a1-413a05702ac4,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 13/14] ppc/pnv: Move realize of PEC stacks under the PEC model
Date: Thu, 2 Dec 2021 15:42:34 +0100
Message-ID: <20211202144235.1276352-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b8c040ad-a0ee-4fad-8350-c652976e39cb
X-Ovh-Tracer-Id: 15808479118801799974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 36 ++++++++++++++++++++++++++++++++----
 hw/ppc/pnv.c               | 31 +------------------------------
 2 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index dfed2af0f7df..9b081d543057 100644
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
@@ -579,10 +583,34 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
                           &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
 
-    /*
-     * Let the machine/chip realize the PHB object to customize more
-     * easily some fields
-     */
+    {
+        Object *obj = OBJECT(&stack->phb);
+
+        object_property_set_int(obj, "chip-id", pec->chip_id, &error_fatal);
+        object_property_set_int(obj, "version", pecc->version, &error_fatal);
+        object_property_set_int(obj, "device-id", pecc->device_id,
+                                &error_fatal);
+        object_property_set_link(obj, "stack", OBJECT(stack),
+                                 &error_abort);
+        if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
+            return;
+        }
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
index 3a550eed0f36..7e13b15241fd 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1370,7 +1370,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
 static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 = PNV9_CHIP(chip);
-    int i, j;
+    int i;
 
     for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
@@ -1392,35 +1392,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
 
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
 
-- 
2.31.1


