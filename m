Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70577492810
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:12:14 +0100 (CET)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pDZ-0000KX-Ga
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:12:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDI-0003iq-Nd; Tue, 18 Jan 2022 08:07:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDG-0000Dl-Pp; Tue, 18 Jan 2022 08:07:52 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICWDDL016174; 
 Tue, 18 Jan 2022 13:07:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnr9ssa92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:46 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICWrGa025125;
 Tue, 18 Jan 2022 13:07:45 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnr9ssa7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:45 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID25Oi007143;
 Tue, 18 Jan 2022 13:07:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3dknw9b9yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7ewN42336636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51A8B4C040;
 Tue, 18 Jan 2022 13:07:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E2114C052;
 Tue, 18 Jan 2022 13:07:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 555FA2201EB;
 Tue, 18 Jan 2022 14:07:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 11/31] ppc/pnv: use PHB4 obj in pnv_pec_stk_pci_xscom_ops
Date: Tue, 18 Jan 2022 14:07:10 +0100
Message-Id: <20220118130730.1927983-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8fivm_3kuDKkjNMwUIbAbYOmmE4yjtCt
X-Proofpoint-ORIG-GUID: 6i-Krj9qn1fFKVlPK10AjyDK9VHcysLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1034
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The current relationship between PnvPhb4PecStack and PnvPHB4 objects is
overly complex. Recent work done in pnv_phb4.c and pnv_phb4_pec.c shows
that the stack obj role in the overall design is more of a placeholder fo=
r
its 'phb' object, having no atributes that stand on its own. This became
clearer after pnv-phb4 user creatable devices were implemented.

What remains now are a lot of stack->phb and phb->stack pointers
throughout .read and .write callbacks of MemoryRegionOps that are being
initialized in phb4_realize() time. stk_realize() is a no-op if the
machine is being run with -nodefaults.

The first step of trying to decouple the stack and phb relationship is
to move the MemoryRegionOps that belongs to PnvPhb4PecStack to PhbPHB4.
Unfortunately this can't be done  without some preliminary steps to
change the usage of 'stack' and replace it with 'phb' in these
read/write callbacks.

This patch starts this process by using a PnvPHB4 opaque in
pnv_pec_stk_pci_xscom_ops instead of PnvPhb4PecStack.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20220113192952.911188-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a7b638831ea5..e010572376dc 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1071,7 +1071,7 @@ static const MemoryRegionOps pnv_pec_stk_nest_xscom=
_ops =3D {
 static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
                                            unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecStack *stack =3D PNV_PHB4(opaque)->stack;
     uint32_t reg =3D addr >> 3;
=20
     /* TODO: add list of allowed registers and error out if not */
@@ -1081,7 +1081,7 @@ static uint64_t pnv_pec_stk_pci_xscom_read(void *op=
aque, hwaddr addr,
 static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
                                         uint64_t val, unsigned size)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecStack *stack =3D PNV_PHB4(opaque)->stack;
     uint32_t reg =3D addr >> 3;
=20
     switch (reg) {
@@ -1475,10 +1475,10 @@ static void pnv_phb4_xscom_realize(PnvPHB4 *phb)
                           &pnv_pec_stk_nest_xscom_ops, stack, name,
                           PHB4_PEC_NEST_STK_REGS_COUNT);
=20
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-phb-%d",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_pci_xscom_ops, stack, name,
+    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(phb),
+                          &pnv_pec_stk_pci_xscom_ops, phb, name,
                           PHB4_PEC_PCI_STK_REGS_COUNT);
=20
     /* PHB pass-through */
--=20
2.31.1


