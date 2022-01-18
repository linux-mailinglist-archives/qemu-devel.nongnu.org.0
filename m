Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47824927F9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:05:59 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9p7W-0001pS-Jm
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDG-0003ew-6X; Tue, 18 Jan 2022 08:07:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7492
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDE-0000D0-CV; Tue, 18 Jan 2022 08:07:49 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICaa9C021706; 
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4huc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:45 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICefx4005968;
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4hub2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7fi1008351;
 Tue, 18 Jan 2022 13:07:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw94h7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7f5K38797692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EED0642045;
 Tue, 18 Jan 2022 13:07:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAB0542041;
 Tue, 18 Jan 2022 13:07:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id F0A5122016C;
 Tue, 18 Jan 2022 14:07:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 12/31] ppc/pnv: move PCI registers to PnvPHB4
Date: Tue, 18 Jan 2022 14:07:11 +0100
Message-Id: <20220118130730.1927983-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J8VvE--40-jxIvVua0eD4uOdxTDZCjE5
X-Proofpoint-ORIG-GUID: wwo-ptL63LB_rTRCHfUcgMbzXX3drJE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Previous patch changed pnv_pec_stk_pci_xscom_read() and
pnv_pec_stk_pci_xscom_write() to use a PnvPHB4 opaque, making it easier
to move both pci_regs[] and the pci_regs_mr MemoryRegion to the PnvHB4
object.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 10 +++++-----
 hw/pci-host/pnv_phb4.c         | 30 +++++++++++++++---------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 4b7ce8a7239f..4487c3a6e2da 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -107,6 +107,11 @@ struct PnvPHB4 {
     MemoryRegion pci_mmio;
     MemoryRegion pci_io;
=20
+    /* PCI registers (excluding pass-through) */
+#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
+    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
+    MemoryRegion pci_regs_mr;
+
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
     uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
@@ -155,11 +160,6 @@ struct PnvPhb4PecStack {
     uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
     MemoryRegion nest_regs_mr;
=20
-    /* PCI registers (excluding pass-through) */
-#define PHB4_PEC_PCI_STK_REGS_COUNT  0xf
-    uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
-    MemoryRegion pci_regs_mr;
-
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e010572376dc..fd9f6af4b3a4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1071,54 +1071,54 @@ static const MemoryRegionOps pnv_pec_stk_nest_xsc=
om_ops =3D {
 static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
                                            unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4(opaque)->stack;
+    PnvPHB4 *phb =3D PNV_PHB4(opaque);
     uint32_t reg =3D addr >> 3;
=20
     /* TODO: add list of allowed registers and error out if not */
-    return stack->pci_regs[reg];
+    return phb->pci_regs[reg];
 }
=20
 static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
                                         uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4(opaque)->stack;
+    PnvPHB4 *phb =3D PNV_PHB4(opaque);
     uint32_t reg =3D addr >> 3;
=20
     switch (reg) {
     case PEC_PCI_STK_PCI_FIR:
-        stack->pci_regs[reg] =3D val;
+        phb->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_SET:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->pci_regs[reg] =3D val;
+        phb->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
+        phb->pci_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_ACT0:
     case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->pci_regs[reg] =3D val;
+        phb->pci_regs[reg] =3D val;
         break;
     case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->pci_regs[reg] =3D 0;
+        phb->pci_regs[reg] =3D 0;
         break;
     case PEC_PCI_STK_ETU_RESET:
-        stack->pci_regs[reg] =3D val & 0x8000000000000000ull;
+        phb->pci_regs[reg] =3D val & 0x8000000000000000ull;
         /* TODO: Implement reset */
         break;
     case PEC_PCI_STK_PBAIB_ERR_REPORT:
         break;
     case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
     case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->pci_regs[reg] =3D val;
+        phb->pci_regs[reg] =3D val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWAD=
DR_PRIx
@@ -1477,7 +1477,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
=20
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(phb),
+    pnv_xscom_region_init(&phb->pci_regs_mr, OBJECT(phb),
                           &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
=20
@@ -1496,7 +1496,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                             &stack->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
+                            &phb->pci_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
                             0x40 * stack->stack_no,
--=20
2.31.1


