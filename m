Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F65F49282A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:18:42 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pJp-00014A-96
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDN-0003pW-Kw; Tue, 18 Jan 2022 08:07:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59534
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDL-0000FD-AY; Tue, 18 Jan 2022 08:07:57 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IBRM2q018851; 
 Tue, 18 Jan 2022 13:07:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjy5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:46 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICj6v0030530;
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjy4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:45 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7eM2002495;
 Tue, 18 Jan 2022 13:07:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3dknhjck5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7f7k39125406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96DB04204F;
 Tue, 18 Jan 2022 13:07:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52C9842041;
 Tue, 18 Jan 2022 13:07:41 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:41 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 99E1A2201EB;
 Tue, 18 Jan 2022 14:07:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 13/31] ppc/pnv: move phbbar to PnvPHB4
Date: Tue, 18 Jan 2022 14:07:12 +0100
Message-Id: <20220118130730.1927983-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EsaIskPOydK7IrSEbHswTUFV_K5WM2nu
X-Proofpoint-GUID: mTry5D7Lf7KqEgCJ9qBwIflEQUPmZuXH
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

This MemoryRegion is simple enough to be moved in a single step.

A 'stack->phb' pointer had to be introduced in pnv_pec_stk_update_map()
because this function isn't ready to be fully converted to use a PnvPHB4
pointer instead. This will be dealt with in the following patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  4 +++-
 hw/pci-host/pnv_phb4.c         | 19 ++++++++++---------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 4487c3a6e2da..b11fa80e81e6 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -112,6 +112,9 @@ struct PnvPHB4 {
     uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
     MemoryRegion pci_regs_mr;
=20
+    /* Memory windows from PowerBus to PHB */
+    MemoryRegion phbbar;
+
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
     uint64_t ioda_MIST[PNV_PHB4_MAX_MIST];
@@ -166,7 +169,6 @@ struct PnvPhb4PecStack {
     /* Memory windows from PowerBus to PHB */
     MemoryRegion mmbar0;
     MemoryRegion mmbar1;
-    MemoryRegion phbbar;
     MemoryRegion intbar;
     uint64_t mmio0_base;
     uint64_t mmio0_size;
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fd9f6af4b3a4..00eaf91fca3a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -874,15 +874,15 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack=
 *stack)
=20
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
-        memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
+        memory_region_del_subregion(&phb->phbbar, &phb->mr_regs);
     }
     if (memory_region_is_mapped(&phb->xsrc.esb_mmio)) {
         memory_region_del_subregion(&stack->intbar, &phb->xsrc.esb_mmio)=
;
     }
=20
     /* Map registers if enabled */
-    if (memory_region_is_mapped(&stack->phbbar)) {
-        memory_region_add_subregion(&stack->phbbar, 0, &phb->mr_regs);
+    if (memory_region_is_mapped(&phb->phbbar)) {
+        memory_region_add_subregion(&phb->phbbar, 0, &phb->mr_regs);
     }
=20
     /* Map ESB if enabled */
@@ -897,6 +897,7 @@ static void pnv_phb4_update_regions(PnvPhb4PecStack *=
stack)
 static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
 {
     PnvPhb4PecState *pec =3D stack->pec;
+    PnvPHB4 *phb =3D stack->phb;
     MemoryRegion *sysmem =3D get_system_memory();
     uint64_t bar_en =3D stack->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
@@ -919,9 +920,9 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
         memory_region_del_subregion(sysmem, &stack->mmbar1);
     }
-    if (memory_region_is_mapped(&stack->phbbar) &&
+    if (memory_region_is_mapped(&phb->phbbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        memory_region_del_subregion(sysmem, &stack->phbbar);
+        memory_region_del_subregion(sysmem, &phb->phbbar);
     }
     if (memory_region_is_mapped(&stack->intbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
@@ -956,14 +957,14 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack =
*stack)
         stack->mmio1_base =3D bar;
         stack->mmio1_size =3D size;
     }
-    if (!memory_region_is_mapped(&stack->phbbar) &&
+    if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
         bar =3D stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size =3D PNV_PHB4_NUM_REGS << 3;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
+        memory_region_init(&phb->phbbar, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->phbbar);
     }
     if (!memory_region_is_mapped(&stack->intbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
--=20
2.31.1


