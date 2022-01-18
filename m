Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A804927F3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:03:03 +0100 (CET)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9p4g-0004Nn-P6
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDK-0003kh-8k; Tue, 18 Jan 2022 08:07:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDH-0000E3-OR; Tue, 18 Jan 2022 08:07:53 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICv8H2014254; 
 Tue, 18 Jan 2022 13:07:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0prcu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ID4ilH001459;
 Tue, 18 Jan 2022 13:07:48 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0prcsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:48 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID2q6e010888;
 Tue, 18 Jan 2022 13:07:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3dknw93b8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20ID7hYW17433032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81AF111C04A;
 Tue, 18 Jan 2022 13:07:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E60E11C06C;
 Tue, 18 Jan 2022 13:07:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 873B322016C;
 Tue, 18 Jan 2022 14:07:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 16/31] ppc/pnv: move mmbar0/mmbar1 and friends to PnvPHB4
Date: Tue, 18 Jan 2022 14:07:15 +0100
Message-Id: <20220118130730.1927983-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kY_W2Nw1Jj7S92x45YQN-NFL09IXai2-
X-Proofpoint-ORIG-GUID: FUvqpLDK9o55wFmtASQCNDnyO-iEDL4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

These 2 MemoryRegions, together with mmio(0|1)_base and mmio(0|1)_size
variables, are used together in the same functions. We're better of
moving them all in a single step.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-7-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 14 ++++-----
 hw/pci-host/pnv_phb4.c         | 52 +++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index cf5dd4009ccb..4a8f510f6dc5 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -115,6 +115,12 @@ struct PnvPHB4 {
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
     MemoryRegion intbar;
+    MemoryRegion mmbar0;
+    MemoryRegion mmbar1;
+    uint64_t mmio0_base;
+    uint64_t mmio0_size;
+    uint64_t mmio1_base;
+    uint64_t mmio1_size;
=20
     /* On-chip IODA tables */
     uint64_t ioda_LIST[PNV_PHB4_MAX_LSIs];
@@ -167,14 +173,6 @@ struct PnvPhb4PecStack {
     /* PHB pass-through XSCOM */
     MemoryRegion phb_regs_mr;
=20
-    /* Memory windows from PowerBus to PHB */
-    MemoryRegion mmbar0;
-    MemoryRegion mmbar1;
-    uint64_t mmio0_base;
-    uint64_t mmio0_size;
-    uint64_t mmio1_base;
-    uint64_t mmio1_size;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
=20
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 034721f15915..dc4db091e47b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -228,16 +228,16 @@ static void pnv_phb4_check_mbt(PnvPHB4 *phb, uint32=
_t index)
     /* TODO: Figure out how to implemet/decode AOMASK */
=20
     /* Check if it matches an enabled MMIO region in the PEC stack */
-    if (memory_region_is_mapped(&phb->stack->mmbar0) &&
-        base >=3D phb->stack->mmio0_base &&
-        (base + size) <=3D (phb->stack->mmio0_base + phb->stack->mmio0_s=
ize)) {
-        parent =3D &phb->stack->mmbar0;
-        base -=3D phb->stack->mmio0_base;
-    } else if (memory_region_is_mapped(&phb->stack->mmbar1) &&
-        base >=3D phb->stack->mmio1_base &&
-        (base + size) <=3D (phb->stack->mmio1_base + phb->stack->mmio1_s=
ize)) {
-        parent =3D &phb->stack->mmbar1;
-        base -=3D phb->stack->mmio1_base;
+    if (memory_region_is_mapped(&phb->mmbar0) &&
+        base >=3D phb->mmio0_base &&
+        (base + size) <=3D (phb->mmio0_base + phb->mmio0_size)) {
+        parent =3D &phb->mmbar0;
+        base -=3D phb->mmio0_base;
+    } else if (memory_region_is_mapped(&phb->mmbar1) &&
+        base >=3D phb->mmio1_base &&
+        (base + size) <=3D (phb->mmio1_base + phb->mmio1_size)) {
+        parent =3D &phb->mmbar1;
+        base -=3D phb->mmio1_base;
     } else {
         phb_error(phb, "PHB MBAR %d out of parent bounds", index);
         return;
@@ -910,13 +910,13 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack =
*stack)
      */
=20
     /* Handle unmaps */
-    if (memory_region_is_mapped(&stack->mmbar0) &&
+    if (memory_region_is_mapped(&phb->mmbar0) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar0);
+        memory_region_del_subregion(sysmem, &phb->mmbar0);
     }
-    if (memory_region_is_mapped(&stack->mmbar1) &&
+    if (memory_region_is_mapped(&phb->mmbar1) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar1);
+        memory_region_del_subregion(sysmem, &phb->mmbar1);
     }
     if (memory_region_is_mapped(&phb->phbbar) &&
         !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
@@ -931,29 +931,29 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack =
*stack)
     pnv_phb4_update_regions(phb);
=20
     /* Handle maps */
-    if (!memory_region_is_mapped(&stack->mmbar0) &&
+    if (!memory_region_is_mapped(&phb->mmbar0) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
         bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
         mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size =3D ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
-        stack->mmio0_base =3D bar;
-        stack->mmio0_size =3D size;
+        memory_region_init(&phb->mmbar0, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->mmbar0);
+        phb->mmio0_base =3D bar;
+        phb->mmio0_size =3D size;
     }
-    if (!memory_region_is_mapped(&stack->mmbar1) &&
+    if (!memory_region_is_mapped(&phb->mmbar1) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
         bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
         mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size =3D ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
+        snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
                  pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
-        stack->mmio1_base =3D bar;
-        stack->mmio1_size =3D size;
+        memory_region_init(&phb->mmbar1, OBJECT(phb), name, size);
+        memory_region_add_subregion(sysmem, bar, &phb->mmbar1);
+        phb->mmio1_base =3D bar;
+        phb->mmio1_size =3D size;
     }
     if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
--=20
2.31.1


