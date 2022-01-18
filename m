Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684349285E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:28:37 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pTQ-0002UE-8m
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:28:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDT-0003ty-Np; Tue, 18 Jan 2022 08:08:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDR-0000HK-By; Tue, 18 Jan 2022 08:08:03 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IBS6dT008755; 
 Tue, 18 Jan 2022 13:07:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnvq0k07e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:50 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICblUJ020272;
 Tue, 18 Jan 2022 13:07:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnvq0k05x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7cvg008305;
 Tue, 18 Jan 2022 13:07:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3dknw94h88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7j5E38797598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C3BF11C052;
 Tue, 18 Jan 2022 13:07:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 292EB11C050;
 Tue, 18 Jan 2022 13:07:45 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:45 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 704932201EB;
 Tue, 18 Jan 2022 14:07:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 19/31] ppc/pnv: move nest_regs_mr to PnvPHB4
Date: Tue, 18 Jan 2022 14:07:18 +0100
Message-Id: <20220118130730.1927983-20-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ejuggZ69Fu0GEVwj2WKGJekCRkw7NCvY
X-Proofpoint-GUID: tI1wNfZ3D_Ns9hL5I-sVCIcQm6TEbS6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1034 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

We're now able to cleanly move nest_regs_mr to the PnvPHB4 device.

One thing of notice here is the need to use a phb->stack->pec pointer
because pnv_pec_stk_nest_xscom_write requires a PEC object. Another
thing that can be noticed in the use of 'stack->stack_no' that still
remains throughout the XSCOM code.

After moving all MemoryRegions to the PnvPHB4 object, this illustrates
what is the remaining role of the stack: provide a PEC pointer and the
'stack_no' information. If we can provide these in the PnvPHB4 object
instead (spoiler: we can, and we will), the PnvPhb4PecStack device will
be deprecated and can be removed.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-10-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  3 +--
 hw/pci-host/pnv_phb4.c         | 16 +++++++---------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index a7e08772c1ae..1d53dda0ed95 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -115,6 +115,7 @@ struct PnvPHB4 {
     /* Nest registers */
 #define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
     uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
+    MemoryRegion nest_regs_mr;
=20
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
@@ -169,8 +170,6 @@ struct PnvPhb4PecStack {
     /* My own stack number */
     uint32_t stack_no;
=20
-    MemoryRegion nest_regs_mr;
-
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 0f4464ec67f4..37bab10fcb69 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -861,8 +861,7 @@ const MemoryRegionOps pnv_phb4_xscom_ops =3D {
 static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
                                             unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    PnvPHB4 *phb =3D stack->phb;
+    PnvPHB4 *phb =3D PNV_PHB4(opaque);
     uint32_t reg =3D addr >> 3;
=20
     /* TODO: add list of allowed registers and error out if not */
@@ -982,9 +981,8 @@ static void pnv_pec_stk_update_map(PnvPHB4 *phb)
 static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    PnvPHB4 *phb =3D stack->phb;
-    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPHB4 *phb =3D PNV_PHB4(opaque);
+    PnvPhb4PecState *pec =3D phb->stack->pec;
     uint32_t reg =3D addr >> 3;
=20
     switch (reg) {
@@ -1470,10 +1468,10 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
     assert(pec);
=20
     /* Initialize the XSCOM regions for the stack registers */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_nest_xscom_ops, stack, name,
+    pnv_xscom_region_init(&phb->nest_regs_mr, OBJECT(phb),
+                          &pnv_pec_stk_nest_xscom_ops, phb, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
=20
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
@@ -1494,7 +1492,7 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
     /* Populate the XSCOM address space. */
     pnv_xscom_add_subregion(pec->chip,
                             pec_nest_base + 0x40 * (stack->stack_no + 1)=
,
-                            &stack->nest_regs_mr);
+                            &phb->nest_regs_mr);
     pnv_xscom_add_subregion(pec->chip,
                             pec_pci_base + 0x40 * (stack->stack_no + 1),
                             &phb->pci_regs_mr);
--=20
2.31.1


