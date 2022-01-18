Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B4928B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:48:30 +0100 (CET)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pmf-0004Kj-KJ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDn-0004Fy-CU; Tue, 18 Jan 2022 08:08:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40822
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDj-0000Gg-4C; Tue, 18 Jan 2022 08:08:22 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IBRJp3018664; 
 Tue, 18 Jan 2022 13:07:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjy7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICuaUA012614;
 Tue, 18 Jan 2022 13:07:48 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnvpmjy6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:48 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7QNv011046;
 Tue, 18 Jan 2022 13:07:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3dknhj3d3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20ID7iAG44106026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28750AE053;
 Tue, 18 Jan 2022 13:07:44 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA4D4AE04D;
 Tue, 18 Jan 2022 13:07:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2DE042201EB;
 Tue, 18 Jan 2022 14:07:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 17/31] ppc/pnv: move nest_regs[] to PnvPHB4
Date: Tue, 18 Jan 2022 14:07:16 +0100
Message-Id: <20220118130730.1927983-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O0magiw7bmI9-NzOJ1BzygC5CsBOUNjq
X-Proofpoint-GUID: eQN70r5VxrfjA-i8tsvbVf558pQM77U0
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

stack->nest_regs[] is used in several XSCOM functions and it's one of
the main culprits of having to deal with stack->phb pointers around the
code.

Sure, we're having to add 2 extra stack->phb pointers to ease
nest_regs[] migration to PnvPHB4. They'll be dealt with shortly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-8-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  7 +++--
 hw/pci-host/pnv_phb4.c         | 52 ++++++++++++++++++----------------
 2 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 4a8f510f6dc5..a7e08772c1ae 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -112,6 +112,10 @@ struct PnvPHB4 {
     uint64_t pci_regs[PHB4_PEC_PCI_STK_REGS_COUNT];
     MemoryRegion pci_regs_mr;
=20
+    /* Nest registers */
+#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
+    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
+
     /* Memory windows from PowerBus to PHB */
     MemoryRegion phbbar;
     MemoryRegion intbar;
@@ -165,9 +169,6 @@ struct PnvPhb4PecStack {
     /* My own stack number */
     uint32_t stack_no;
=20
-    /* Nest registers */
-#define PHB4_PEC_NEST_STK_REGS_COUNT  0x17
-    uint64_t nest_regs[PHB4_PEC_NEST_STK_REGS_COUNT];
     MemoryRegion nest_regs_mr;
=20
     /* PHB pass-through XSCOM */
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index dc4db091e47b..916a7a3cf0f4 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -862,10 +862,11 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *o=
paque, hwaddr addr,
                                             unsigned size)
 {
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    PnvPHB4 *phb =3D stack->phb;
     uint32_t reg =3D addr >> 3;
=20
     /* TODO: add list of allowed registers and error out if not */
-    return stack->nest_regs[reg];
+    return phb->nest_regs[reg];
 }
=20
 static void pnv_phb4_update_regions(PnvPHB4 *phb)
@@ -897,7 +898,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     PnvPhb4PecState *pec =3D stack->pec;
     PnvPHB4 *phb =3D stack->phb;
     MemoryRegion *sysmem =3D get_system_memory();
-    uint64_t bar_en =3D stack->nest_regs[PEC_NEST_STK_BAR_EN];
+    uint64_t bar_en =3D phb->nest_regs[PEC_NEST_STK_BAR_EN];
     uint64_t bar, mask, size;
     char name[64];
=20
@@ -933,8 +934,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     /* Handle maps */
     if (!memory_region_is_mapped(&phb->mmbar0) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
-        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
+        bar =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
+        mask =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
         size =3D ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio0",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -945,8 +946,8 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     }
     if (!memory_region_is_mapped(&phb->mmbar1) &&
         (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
-        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
+        bar =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
+        mask =3D phb->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
         size =3D ((~mask) >> 8) + 1;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-mmio1",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -957,7 +958,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     }
     if (!memory_region_is_mapped(&phb->phbbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
+        bar =3D phb->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
         size =3D PNV_PHB4_NUM_REGS << 3;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d",
                  pec->chip_id, pec->index, stack->stack_no);
@@ -966,7 +967,7 @@ static void pnv_pec_stk_update_map(PnvPhb4PecStack *s=
tack)
     }
     if (!memory_region_is_mapped(&phb->intbar) &&
         (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
+        bar =3D phb->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
         size =3D PNV_PHB4_MAX_INTs << 16;
         snprintf(name, sizeof(name), "pec-%d.%d-phb-%d-int",
                  stack->pec->chip_id, stack->pec->index, stack->stack_no=
);
@@ -982,34 +983,35 @@ static void pnv_pec_stk_nest_xscom_write(void *opaq=
ue, hwaddr addr,
                                          uint64_t val, unsigned size)
 {
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    PnvPHB4 *phb =3D stack->phb;
     PnvPhb4PecState *pec =3D stack->pec;
     uint32_t reg =3D addr >> 3;
=20
     switch (reg) {
     case PEC_NEST_STK_PCI_NEST_FIR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] =3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] =3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_CLR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &=3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &=3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_SET:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |=3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |=3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSK:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] =3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] =3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &=3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &=3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |=3D val;
+        phb->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |=3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
     case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
-        stack->nest_regs[reg] =3D val;
+        phb->nest_regs[reg] =3D val;
         break;
     case PEC_NEST_STK_PCI_NEST_FIR_WOF:
-        stack->nest_regs[reg] =3D 0;
+        phb->nest_regs[reg] =3D 0;
         break;
     case PEC_NEST_STK_ERR_REPORT_0:
     case PEC_NEST_STK_ERR_REPORT_1:
@@ -1017,39 +1019,39 @@ static void pnv_pec_stk_nest_xscom_write(void *op=
aque, hwaddr addr,
         /* Flag error ? */
         break;
     case PEC_NEST_STK_PBCQ_MODE:
-        stack->nest_regs[reg] =3D val & 0xff00000000000000ull;
+        phb->nest_regs[reg] =3D val & 0xff00000000000000ull;
         break;
     case PEC_NEST_STK_MMIO_BAR0:
     case PEC_NEST_STK_MMIO_BAR0_MASK:
     case PEC_NEST_STK_MMIO_BAR1:
     case PEC_NEST_STK_MMIO_BAR1_MASK:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] &
             (PEC_NEST_STK_BAR_EN_MMIO0 |
              PEC_NEST_STK_BAR_EN_MMIO1)) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] =3D val & 0xffffffffff000000ull;
+        phb->nest_regs[reg] =3D val & 0xffffffffff000000ull;
         break;
     case PEC_NEST_STK_PHB_REGS_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
PHB) {
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PH=
B) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] =3D val & 0xffffffffffc00000ull;
+        phb->nest_regs[reg] =3D val & 0xffffffffffc00000ull;
         break;
     case PEC_NEST_STK_INT_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
INT) {
+        if (phb->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_IN=
T) {
             phb_pec_error(pec, "Changing enabled BAR unsupported\n");
         }
-        stack->nest_regs[reg] =3D val & 0xfffffff000000000ull;
+        phb->nest_regs[reg] =3D val & 0xfffffff000000000ull;
         break;
     case PEC_NEST_STK_BAR_EN:
-        stack->nest_regs[reg] =3D val & 0xf000000000000000ull;
+        phb->nest_regs[reg] =3D val & 0xf000000000000000ull;
         pnv_pec_stk_update_map(stack);
         break;
     case PEC_NEST_STK_DATA_FRZ_TYPE:
     case PEC_NEST_STK_PBCQ_TUN_BAR:
         /* Not used for now */
-        stack->nest_regs[reg] =3D val;
+        phb->nest_regs[reg] =3D val;
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_=
PRIx
--=20
2.31.1


