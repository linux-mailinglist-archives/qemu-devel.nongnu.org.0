Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB2492845
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:23:00 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pNy-0007dq-Vu
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDN-0003pX-Lv; Tue, 18 Jan 2022 08:07:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65532
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDL-0000F9-4w; Tue, 18 Jan 2022 08:07:56 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IBRLvi018825; 
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjya7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICu8DE011177;
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjy93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:51 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID2quI010900;
 Tue, 18 Jan 2022 13:07:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw93b9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7lpq41484714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5752EAE04D;
 Tue, 18 Jan 2022 13:07:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14BBDAE059;
 Tue, 18 Jan 2022 13:07:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5C97822016C;
 Tue, 18 Jan 2022 14:07:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 22/31] ppc/pnv: reduce stack->stack_no usage
Date: Tue, 18 Jan 2022 14:07:21 +0100
Message-Id: <20220118130730.1927983-23-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ImTTqptn5UFVwIFIOxd-reYtHoj9ulx-
X-Proofpoint-GUID: QYhDQjzysIsAIK5MQW64ZSRmySbzO4Na
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 clxscore=1034 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

'stack->stack_no' represents the order that a stack appears in its PEC.
Its primary use is in XSCOM address space calculation in
pnv_phb4_xscom_realize() when calculating the memory region offset.

This attribute is redundant with phb->phb_id, which is calculated via
pnv_phb4_pec_get_phb_id() using stack->stack_no information. It'll also
be awkward to assign it when dealing with PECs and PHBs only in a future
patch.

A new pnv_phb4_get_phb_stack_no() helper is introduced to eliminate most
of the stack->stack_no uses we have. The only use left after this patch
is during pnv_pec_stk_default_phb_realize() when calculating phb_id,
which will also handled in the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220114180719.52117-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 46 +++++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 2658ef2d84b1..4933fe57fe48 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -868,6 +868,28 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *op=
aque, hwaddr addr,
     return phb->nest_regs[reg];
 }
=20
+/*
+ * Return the 'stack_no' of a PHB4. 'stack_no' is the order
+ * the PHB4 occupies in the PEC. This is the reverse of what
+ * pnv_phb4_pec_get_phb_id() does.
+ *
+ * E.g. a phb with phb_id =3D 4 and pec->index =3D 1 (PEC1) will
+ * be the second phb (stack_no =3D 1) of the PEC.
+ */
+static int pnv_phb4_get_phb_stack_no(PnvPHB4 *phb)
+{
+    PnvPhb4PecState *pec =3D phb->pec;
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    int index =3D pec->index;
+    int stack_no =3D phb->phb_id;
+
+    while (index--) {
+        stack_no -=3D pecc->num_stacks[index];
+    }
+
+    return stack_no;
+}
+
 static void pnv_phb4_update_regions(PnvPHB4 *phb)
 {
     /* Unmap first always */
@@ -894,10 +916,10 @@ static void pnv_phb4_update_regions(PnvPHB4 *phb)
=20
 static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack =3D phb->stack;
     PnvPhb4PecState *pec =3D phb->pec;
     MemoryRegion *sysmem =3D get_system_memory();
     uint64_t bar_en =3D phb->nest_regs[PEC_NEST_STK_BAR_EN];
+    int stack_no =3D pnv_phb4_get_phb_stack_no(phb);
     uint64_t bar, mask, size;
     char name[64];
=20
@@ -937,7 +959,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size =3D ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
         phb->mmio0_base =3D bar;
@@ -949,7 +971,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         mask =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size =3D ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
         phb->mmio1_base =3D bar;
@@ -960,7 +982,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar =3D phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size =3D PNV_PHB4_NUM_REGS << 3;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
-                 pec->chip_id, pec->index, stack->stack_no);
+                 pec->chip_id, pec->index, stack_no);
         memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
@@ -969,7 +991,7 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
         bar =3D phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size =3D PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
-                 phb->pec->chip_id, phb->pec->index, stack->stack_no);
+                 phb->pec->chip_id, phb->pec->index, stack_no);
         memory_region_init(&phb->intbar, OBJECT(phb), name, size);
         memory_region_add_subregion(sysmem, bar, &phb->intbar);
     }
@@ -1458,9 +1480,9 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus=
, void *opaque, int devfn)
=20
 static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
 {
-    PnvPhb4PecStack *stack =3D phb->stack;
     PnvPhb4PecState *pec =3D phb->pec;
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    int stack_no =3D pnv_phb4_get_phb_stack_no(phb);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
     char name[64];
@@ -1469,20 +1491,20 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
=20
     /* Initialize the XSCOM regions for the stack registers */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_nest_xscom_ops, phb, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
=20
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
=20
     /* PHB pass-through */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
-             pec->chip_id, pec->index, stack->stack_no);
+             pec->chip_id, pec->index, stack_no);
     pnv_xscom_region_init(&phb->phb_regs_mr, OBJECT(phb),
                           &pnv_phb4_xscom_ops, phb, name, 0x40);
=20
@@ -1491,14 +1513,14 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
=20
     /* Populate the XSCOM address space. */
     pnv_xscom_add_subregion(pec->chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1)=
,
+                            pec_nest_base + 0x40 * (stack_no + 1),
                             &phb->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            pec_pci_base + 0x40 * (stack_no + 1),
                             &phb->pci_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
+                            0x40 * stack_no,
                             &phb->phb_regs_mr);
 }
=20
--=20
2.31.1


