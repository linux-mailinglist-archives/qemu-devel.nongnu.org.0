Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD248C535
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:55:36 +0100 (CET)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7e6A-0000zM-Ny
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFR-0007Kr-Sm; Wed, 12 Jan 2022 06:57:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFP-0007c9-1Y; Wed, 12 Jan 2022 06:57:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAZtwN005046; 
 Wed, 12 Jan 2022 11:56:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcwfx12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:29 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CB7PB3017224;
 Wed, 12 Jan 2022 11:56:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcwfwy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmRm9031226;
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3df289h2xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuN8c46006708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33AEDA4EDC;
 Wed, 12 Jan 2022 11:56:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D978AA4ECC;
 Wed, 12 Jan 2022 11:56:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2C2B022016C;
 Wed, 12 Jan 2022 12:56:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 30/34] ppc/pnv: move PHB4 XSCOM init to phb4_realize()
Date: Wed, 12 Jan 2022 12:55:47 +0100
Message-Id: <20220112115551.987666-31-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g5kO4qNNiusabBpXf9BW5BCt8-9WPc_F
X-Proofpoint-ORIG-GUID: -Q4c_KQMKzIAVkwpLTJKUT3nGI7QmAMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1034 phishscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120075
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

The 'stack->phb_regs_mr' PHB4 passthrough XSCOM initialization relies on
'stack->phb' being not NULL. Moving 'stack->phb_regs_mr' region_init()
and add_subregion() to phb4_realize() time is a natural thing to do
since it's strictly PHB related.

The remaining XSCOM initialization is also related to 'stack->phb' but
in a different manner. For instance, 'stack->nest_regs_mr'
MemoryRegionOps, 'pnv_pec_stk_nest_xscom_ops', uses
pnv_pec_stk_nest_xscom_write() as a write callback. When trying to write
the PEC_NEST_STK_BAR_EN reg, pnv_pec_stk_update_map() is called. Inside
this function, pnv_phb4_update_regions() is called twice. This function
uses 'stack->phb' to manipulate memory regions of the phb.

This is not a problem now but, when enabling user creatable phb4s, a
stack that doesn't have an associated phb (i.e. stack->phb =3D NULL) it
will cause a SIGINT during boot in pnv_phb4_update_regions().

All this can be avoided if all XSCOM realize is moved to phb4_realize(),
when we have certainty about the existence of 'stack->phb'. A lot of
code was moved from pnv_phb4_pec.c to pnv_phb4.c due to static constant
and variables being used but the cleaner logic is worth the trouble.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220111131027.599784-3-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c     | 304 +++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c | 292 -----------------------------------
 2 files changed, 304 insertions(+), 292 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 2223b985b269..8ef58bf2de7a 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -29,6 +29,10 @@
     qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            =
\
                   (phb)->chip_id, (phb)->phb_id, ## __VA_ARGS__)
=20
+#define phb_pec_error(pec, fmt, ...)                                    =
\
+    qemu_log_mask(LOG_GUEST_ERROR, "phb4_pec[%d:%d]: " fmt "\n",        =
\
+                  (pec)->chip_id, (pec)->index, ## __VA_ARGS__)
+
 /*
  * QEMU version of the GETFIELD/SETFIELD macros
  *
@@ -854,6 +858,258 @@ const MemoryRegionOps pnv_phb4_xscom_ops =3D {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
+static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
+                                            unsigned size)
+{
+    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg =3D addr >> 3;
+
+    /* TODO: add list of allowed registers and error out if not */
+    return stack->nest_regs[reg];
+}
+
+static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
+{
+    PnvPhb4PecState *pec =3D stack->pec;
+    MemoryRegion *sysmem =3D get_system_memory();
+    uint64_t bar_en =3D stack->nest_regs[PEC_NEST_STK_BAR_EN];
+    uint64_t bar, mask, size;
+    char name[64];
+
+    /*
+     * NOTE: This will really not work well if those are remapped
+     * after the PHB has created its sub regions. We could do better
+     * if we had a way to resize regions but we don't really care
+     * that much in practice as the stuff below really only happens
+     * once early during boot
+     */
+
+    /* Handle unmaps */
+    if (memory_region_is_mapped(&stack->mmbar0) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
+        memory_region_del_subregion(sysmem, &stack->mmbar0);
+    }
+    if (memory_region_is_mapped(&stack->mmbar1) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
+        memory_region_del_subregion(sysmem, &stack->mmbar1);
+    }
+    if (memory_region_is_mapped(&stack->phbbar) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
+        memory_region_del_subregion(sysmem, &stack->phbbar);
+    }
+    if (memory_region_is_mapped(&stack->intbar) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
+        memory_region_del_subregion(sysmem, &stack->intbar);
+    }
+
+    /* Update PHB */
+    pnv_phb4_update_regions(stack);
+
+    /* Handle maps */
+    if (!memory_region_is_mapped(&stack->mmbar0) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
+        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
+        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
+        size =3D ((~mask) >> 8) + 1;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
+        stack->mmio0_base =3D bar;
+        stack->mmio0_size =3D size;
+    }
+    if (!memory_region_is_mapped(&stack->mmbar1) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
+        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
+        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
+        size =3D ((~mask) >> 8) + 1;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
+        stack->mmio1_base =3D bar;
+        stack->mmio1_size =3D size;
+    }
+    if (!memory_region_is_mapped(&stack->phbbar) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
+        bar =3D stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
+        size =3D PNV_PHB4_NUM_REGS << 3;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
+    }
+    if (!memory_region_is_mapped(&stack->intbar) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
+        bar =3D stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
+        size =3D PNV_PHB4_MAX_INTs << 16;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
+                 stack->pec->chip_id, stack->pec->index, stack->stack_no=
);
+        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->intbar);
+    }
+
+    /* Update PHB */
+    pnv_phb4_update_regions(stack);
+}
+
+static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
+                                         uint64_t val, unsigned size)
+{
+    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecState *pec =3D stack->pec;
+    uint32_t reg =3D addr >> 3;
+
+    switch (reg) {
+    case PEC_NEST_STK_PCI_NEST_FIR:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] =3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_CLR:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &=3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_SET:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |=3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSK:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] =3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &=3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |=3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
+    case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
+        stack->nest_regs[reg] =3D val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_WOF:
+        stack->nest_regs[reg] =3D 0;
+        break;
+    case PEC_NEST_STK_ERR_REPORT_0:
+    case PEC_NEST_STK_ERR_REPORT_1:
+    case PEC_NEST_STK_PBCQ_GNRL_STATUS:
+        /* Flag error ? */
+        break;
+    case PEC_NEST_STK_PBCQ_MODE:
+        stack->nest_regs[reg] =3D val & 0xff00000000000000ull;
+        break;
+    case PEC_NEST_STK_MMIO_BAR0:
+    case PEC_NEST_STK_MMIO_BAR0_MASK:
+    case PEC_NEST_STK_MMIO_BAR1:
+    case PEC_NEST_STK_MMIO_BAR1_MASK:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
+            (PEC_NEST_STK_BAR_EN_MMIO0 |
+             PEC_NEST_STK_BAR_EN_MMIO1)) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] =3D val & 0xffffffffff000000ull;
+        break;
+    case PEC_NEST_STK_PHB_REGS_BAR:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
PHB) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] =3D val & 0xffffffffffc00000ull;
+        break;
+    case PEC_NEST_STK_INT_BAR:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
INT) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] =3D val & 0xfffffff000000000ull;
+        break;
+    case PEC_NEST_STK_BAR_EN:
+        stack->nest_regs[reg] =3D val & 0xf000000000000000ull;
+        pnv_pec_stk_update_map(stack);
+        break;
+    case PEC_NEST_STK_DATA_FRZ_TYPE:
+    case PEC_NEST_STK_PBCQ_TUN_BAR:
+        /* Not used for now */
+        stack->nest_regs[reg] =3D val;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_=
PRIx
+                      "=3D%"PRIx64"\n", addr, val);
+    }
+}
+
+static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops =3D {
+    .read =3D pnv_pec_stk_nest_xscom_read,
+    .write =3D pnv_pec_stk_nest_xscom_write,
+    .valid.min_access_size =3D 8,
+    .valid.max_access_size =3D 8,
+    .impl.min_access_size =3D 8,
+    .impl.max_access_size =3D 8,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+};
+
+static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
+                                           unsigned size)
+{
+    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg =3D addr >> 3;
+
+    /* TODO: add list of allowed registers and error out if not */
+    return stack->pci_regs[reg];
+}
+
+static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
+                                        uint64_t val, unsigned size)
+{
+    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg =3D addr >> 3;
+
+    switch (reg) {
+    case PEC_PCI_STK_PCI_FIR:
+        stack->nest_regs[reg] =3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_CLR:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_SET:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSK:
+        stack->nest_regs[reg] =3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSKC:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSKS:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_ACT0:
+    case PEC_PCI_STK_PCI_FIR_ACT1:
+        stack->nest_regs[reg] =3D val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_WOF:
+        stack->nest_regs[reg] =3D 0;
+        break;
+    case PEC_PCI_STK_ETU_RESET:
+        stack->nest_regs[reg] =3D val & 0x8000000000000000ull;
+        /* TODO: Implement reset */
+        break;
+    case PEC_PCI_STK_PBAIB_ERR_REPORT:
+        break;
+    case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
+    case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
+        stack->nest_regs[reg] =3D val;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWAD=
DR_PRIx
+                      "=3D%"PRIx64"\n", addr, val);
+    }
+}
+
+static const MemoryRegionOps pnv_pec_stk_pci_xscom_ops =3D {
+    .read =3D pnv_pec_stk_pci_xscom_read,
+    .write =3D pnv_pec_stk_pci_xscom_write,
+    .valid.min_access_size =3D 8,
+    .valid.max_access_size =3D 8,
+    .impl.min_access_size =3D 8,
+    .impl.max_access_size =3D 8,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+};
+
 static int pnv_phb4_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     /* Check that out properly ... */
@@ -1175,6 +1431,52 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bu=
s, void *opaque, int devfn)
     return &ds->dma_as;
 }
=20
+static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
+{
+    PnvPhb4PecStack *stack =3D phb->stack;
+    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    uint32_t pec_nest_base;
+    uint32_t pec_pci_base;
+    char name[64];
+
+    assert(pec);
+
+    /* Initialize the XSCOM regions for the stack registers */
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
+                          &pnv_pec_stk_nest_xscom_ops, stack, name,
+                          PHB4_PEC_NEST_STK_REGS_COUNT);
+
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
+                          &pnv_pec_stk_pci_xscom_ops, stack, name,
+                          PHB4_PEC_PCI_STK_REGS_COUNT);
+
+    /* PHB pass-through */
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
+                          &pnv_phb4_xscom_ops, phb, name, 0x40);
+
+    pec_nest_base =3D pecc->xscom_nest_base(pec);
+    pec_pci_base =3D pecc->xscom_pci_base(pec);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1)=
,
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
+}
+
 static void pnv_phb4_instance_init(Object *obj)
 {
     PnvPHB4 *phb =3D PNV_PHB4(obj);
@@ -1247,6 +1549,8 @@ static void pnv_phb4_realize(DeviceState *dev, Erro=
r **errp)
     pnv_phb4_update_xsrc(phb);
=20
     phb->qirqs =3D qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->n=
r_irqs);
+
+    pnv_phb4_xscom_realize(phb);
 }
=20
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index f8038dff171c..bf0fdf33fd8c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -111,258 +111,6 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops =
=3D {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
-static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
-                                            unsigned size)
-{
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg =3D addr >> 3;
-
-    /* TODO: add list of allowed registers and error out if not */
-    return stack->nest_regs[reg];
-}
-
-static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
-{
-    PnvPhb4PecState *pec =3D stack->pec;
-    MemoryRegion *sysmem =3D get_system_memory();
-    uint64_t bar_en =3D stack->nest_regs[PEC_NEST_STK_BAR_EN];
-    uint64_t bar, mask, size;
-    char name[64];
-
-    /*
-     * NOTE: This will really not work well if those are remapped
-     * after the PHB has created its sub regions. We could do better
-     * if we had a way to resize regions but we don't really care
-     * that much in practice as the stuff below really only happens
-     * once early during boot
-     */
-
-    /* Handle unmaps */
-    if (memory_region_is_mapped(&stack->mmbar0) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar0);
-    }
-    if (memory_region_is_mapped(&stack->mmbar1) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar1);
-    }
-    if (memory_region_is_mapped(&stack->phbbar) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        memory_region_del_subregion(sysmem, &stack->phbbar);
-    }
-    if (memory_region_is_mapped(&stack->intbar) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        memory_region_del_subregion(sysmem, &stack->intbar);
-    }
-
-    /* Update PHB */
-    pnv_phb4_update_regions(stack);
-
-    /* Handle maps */
-    if (!memory_region_is_mapped(&stack->mmbar0) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
-        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
-        size =3D ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
-        stack->mmio0_base =3D bar;
-        stack->mmio0_size =3D size;
-    }
-    if (!memory_region_is_mapped(&stack->mmbar1) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
-        mask =3D stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
-        size =3D ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
-        stack->mmio1_base =3D bar;
-        stack->mmio1_size =3D size;
-    }
-    if (!memory_region_is_mapped(&stack->phbbar) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
-        size =3D PNV_PHB4_NUM_REGS << 3;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
-    }
-    if (!memory_region_is_mapped(&stack->intbar) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        bar =3D stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
-        size =3D PNV_PHB4_MAX_INTs << 16;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
-                 stack->pec->chip_id, stack->pec->index, stack->stack_no=
);
-        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->intbar);
-    }
-
-    /* Update PHB */
-    pnv_phb4_update_regions(stack);
-}
-
-static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
-                                         uint64_t val, unsigned size)
-{
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    PnvPhb4PecState *pec =3D stack->pec;
-    uint32_t reg =3D addr >> 3;
-
-    switch (reg) {
-    case PEC_NEST_STK_PCI_NEST_FIR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] =3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_CLR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &=3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_SET:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |=3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSK:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] =3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &=3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |=3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
-    case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
-        stack->nest_regs[reg] =3D val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_WOF:
-        stack->nest_regs[reg] =3D 0;
-        break;
-    case PEC_NEST_STK_ERR_REPORT_0:
-    case PEC_NEST_STK_ERR_REPORT_1:
-    case PEC_NEST_STK_PBCQ_GNRL_STATUS:
-        /* Flag error ? */
-        break;
-    case PEC_NEST_STK_PBCQ_MODE:
-        stack->nest_regs[reg] =3D val & 0xff00000000000000ull;
-        break;
-    case PEC_NEST_STK_MMIO_BAR0:
-    case PEC_NEST_STK_MMIO_BAR0_MASK:
-    case PEC_NEST_STK_MMIO_BAR1:
-    case PEC_NEST_STK_MMIO_BAR1_MASK:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
-            (PEC_NEST_STK_BAR_EN_MMIO0 |
-             PEC_NEST_STK_BAR_EN_MMIO1)) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] =3D val & 0xffffffffff000000ull;
-        break;
-    case PEC_NEST_STK_PHB_REGS_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
PHB) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] =3D val & 0xffffffffffc00000ull;
-        break;
-    case PEC_NEST_STK_INT_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_=
INT) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] =3D val & 0xfffffff000000000ull;
-        break;
-    case PEC_NEST_STK_BAR_EN:
-        stack->nest_regs[reg] =3D val & 0xf000000000000000ull;
-        pnv_pec_stk_update_map(stack);
-        break;
-    case PEC_NEST_STK_DATA_FRZ_TYPE:
-    case PEC_NEST_STK_PBCQ_TUN_BAR:
-        /* Not used for now */
-        stack->nest_regs[reg] =3D val;
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_=
PRIx
-                      "=3D%"PRIx64"\n", addr, val);
-    }
-}
-
-static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops =3D {
-    .read =3D pnv_pec_stk_nest_xscom_read,
-    .write =3D pnv_pec_stk_nest_xscom_write,
-    .valid.min_access_size =3D 8,
-    .valid.max_access_size =3D 8,
-    .impl.min_access_size =3D 8,
-    .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
-};
-
-static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
-                                           unsigned size)
-{
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg =3D addr >> 3;
-
-    /* TODO: add list of allowed registers and error out if not */
-    return stack->pci_regs[reg];
-}
-
-static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
-                                        uint64_t val, unsigned size)
-{
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg =3D addr >> 3;
-
-    switch (reg) {
-    case PEC_PCI_STK_PCI_FIR:
-        stack->nest_regs[reg] =3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &=3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_SET:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |=3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->nest_regs[reg] =3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &=3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |=3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_ACT0:
-    case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->nest_regs[reg] =3D val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->nest_regs[reg] =3D 0;
-        break;
-    case PEC_PCI_STK_ETU_RESET:
-        stack->nest_regs[reg] =3D val & 0x8000000000000000ull;
-        /* TODO: Implement reset */
-        break;
-    case PEC_PCI_STK_PBAIB_ERR_REPORT:
-        break;
-    case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
-    case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->nest_regs[reg] =3D val;
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWAD=
DR_PRIx
-                      "=3D%"PRIx64"\n", addr, val);
-    }
-}
-
-static const MemoryRegionOps pnv_pec_stk_pci_xscom_ops =3D {
-    .read =3D pnv_pec_stk_pci_xscom_read,
-    .write =3D pnv_pec_stk_pci_xscom_write,
-    .valid.min_access_size =3D 8,
-    .valid.max_access_size =3D 8,
-    .impl.min_access_size =3D 8,
-    .impl.max_access_size =3D 8,
-    .endianness =3D DEVICE_BIG_ENDIAN,
-};
-
 static void pnv_pec_instance_init(Object *obj)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(obj);
@@ -539,32 +287,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Er=
ror **errp)
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec =3D stack->pec;
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvChip *chip =3D pec->chip;
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
-    uint32_t pec_nest_base;
-    uint32_t pec_pci_base;
-    char name[64];
-
-    assert(pec);
-
-    /* Initialize the XSCOM regions for the stack registers */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_nest_xscom_ops, stack, name,
-                          PHB4_PEC_NEST_STK_REGS_COUNT);
-
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_pci_xscom_ops, stack, name,
-                          PHB4_PEC_PCI_STK_REGS_COUNT);
-
-    /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
-                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
=20
     object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id=
,
                             &error_fatal);
@@ -577,21 +300,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Er=
ror **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
-
-    pec_nest_base =3D pecc->xscom_nest_base(pec);
-    pec_pci_base =3D pecc->xscom_pci_base(pec);
-
-    /* Populate the XSCOM address space. */
-    pnv_xscom_add_subregion(chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1)=
,
-                            &stack->nest_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
 }
=20
 static Property pnv_pec_stk_properties[] =3D {
--=20
2.31.1


