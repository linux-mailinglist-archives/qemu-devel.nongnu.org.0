Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C584760D7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:36:49 +0100 (CET)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ8y-0005LC-Ks
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXin-0005ju-VQ; Wed, 15 Dec 2021 12:05:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36014
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXig-0004v1-Gu; Wed, 15 Dec 2021 12:05:38 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbSI012421; 
 Wed, 15 Dec 2021 17:05:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmvx1by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFH5BpU026514;
 Wed, 15 Dec 2021 17:05:11 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cygmvx1ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:11 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3FIL004274;
 Wed, 15 Dec 2021 17:05:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77p79ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH56MD41877846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:05:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C27BAA4060;
 Wed, 15 Dec 2021 17:05:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75C79A405B;
 Wed, 15 Dec 2021 17:05:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:06 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id AFC1B220247;
 Wed, 15 Dec 2021 18:05:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 101/102] ppc/pnv: Move realize of PEC stacks under the PEC model
Date: Wed, 15 Dec 2021 18:03:56 +0100
Message-Id: <20211215170357.321643-89-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d7rDe2ZKpdrfZ_9r2Tst6wv2mnnV9qL1
X-Proofpoint-ORIG-GUID: zD3z8bNNPKNAoknsKhwTJvIpi19pqMUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1034 lowpriorityscore=0 malwarescore=0
 mlxlogscore=935 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change will help us providing support for user created PHB4
devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-14-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 34 ++++++++++++++++++++++++++++++----
 hw/ppc/pnv.c               | 37 ++++---------------------------------
 2 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index dfed2af0f7df..24a3adcae326 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -556,6 +556,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Er=
ror **errp)
 {
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec =3D stack->pec;
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    PnvChip *chip =3D pec->chip;
+    uint32_t pec_nest_base;
+    uint32_t pec_pci_base;
     char name[64];
=20
     assert(pec);
@@ -579,10 +583,32 @@ static void pnv_pec_stk_realize(DeviceState *dev, E=
rror **errp)
     pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
                           &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
=20
-    /*
-     * Let the machine/chip realize the PHB object to customize more
-     * easily some fields
-     */
+    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id=
,
+                            &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "version", pecc->versio=
n,
+                            &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "device-id", pecc->devi=
ce_id,
+                            &error_fatal);
+    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack)=
,
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
+        return;
+    }
+
+    pec_nest_base =3D pecc->xscom_nest_base(pec);
+    pec_pci_base =3D pecc->xscom_pci_base(pec);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1)=
,
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
 }
=20
 static Property pnv_pec_stk_properties[] =3D {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 57a5180bccf2..c0b47a7d8909 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1380,10 +1380,10 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9=
, Error **errp)
     }
 }
=20
-static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
+static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
-    int i, j;
+    int i;
=20
     for (i =3D 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
@@ -1405,35 +1405,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *c=
hip, Error **errp)
=20
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr)=
;
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
-
-        for (j =3D 0; j < pec->num_stacks; j++) {
-            PnvPhb4PecStack *stack =3D &pec->stacks[j];
-            Object *obj =3D OBJECT(&stack->phb);
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
-                                   pec_nest_base + 0x40 * (stack->stack_=
no + 1),
-                                   &stack->nest_regs_mr);
-            pnv_xscom_add_subregion(chip,
-                                    pec_pci_base + 0x40 * (stack->stack_=
no + 1),
-                                    &stack->pci_regs_mr);
-            pnv_xscom_add_subregion(chip,
-                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_ST=
K0 +
-                                    0x40 * stack->stack_no,
-                                    &stack->phb_regs_mr);
-        }
     }
 }
=20
@@ -1529,8 +1500,8 @@ static void pnv_chip_power9_realize(DeviceState *de=
v, Error **errp)
     memory_region_add_subregion(get_system_memory(), PNV9_HOMER_BASE(chi=
p),
                                 &chip9->homer.regs);
=20
-    /* PHBs */
-    pnv_chip_power9_phb_realize(chip, &local_err);
+    /* PEC PHBs */
+    pnv_chip_power9_pec_realize(chip, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
--=20
2.31.1


