Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4A4E4D72
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:36:59 +0100 (CET)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvYA-0000sY-Ad
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:36:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQf-00005e-Ob; Wed, 23 Mar 2022 03:29:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64574
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWvQe-0001N4-3I; Wed, 23 Mar 2022 03:29:13 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22N5ftOr002834; 
 Wed, 23 Mar 2022 07:28:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywmn1ndg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:55 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22N7FT9F001209;
 Wed, 23 Mar 2022 07:28:55 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eywmn1ncy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22N794A3015228;
 Wed, 23 Mar 2022 07:28:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ew6t8psbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 07:28:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22N7SoBx49676752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 07:28:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E35F65204E;
 Wed, 23 Mar 2022 07:28:50 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A9E6C5204F;
 Wed, 23 Mar 2022 07:28:50 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.50.222])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 13141220121;
 Wed, 23 Mar 2022 08:28:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 4/5] ppc/pnv: Remove PnvPsiClas::irq_set
Date: Wed, 23 Mar 2022 08:28:45 +0100
Message-Id: <20220323072846.1780212-5-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323072846.1780212-1-clg@kaod.org>
References: <20220323072846.1780212-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fchCHfYPZGXvzgCV89x-7IhiL_IWz7Fe
X-Proofpoint-GUID: g53e5UpZus-ef1an3fbLrQkLziG04ZMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_08,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1034 mlxscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=700 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230040
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All devices raising PSI interrupts are now converted to use GPIO lines
and the pnv_psi_irq_set() routines have become useless. Drop them.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv_psi.h |  4 ----
 hw/ppc/pnv_psi.c         | 23 ++++++-----------------
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index 6d9f8ce7c031..8253469b8fee 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -79,8 +79,6 @@ struct PnvPsiClass {
     uint64_t bar_mask;
     const char *compat;
     int compat_size;
-
-    void (*irq_set)(PnvPsi *psi, int, bool state);
 };
=20
 /* The PSI and FSP interrupts are muxed on the same IRQ number */
@@ -95,8 +93,6 @@ typedef enum PnvPsiIrq {
=20
 #define PSI_NUM_INTERRUPTS 6
=20
-void pnv_psi_irq_set(PnvPsi *psi, int irq, bool state);
-
 /* P9 PSI Interrupts */
 #define PSIHB9_IRQ_PSI          0
 #define PSIHB9_IRQ_OCC          1
diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 8b6298d4bd96..950ecca40573 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -211,19 +211,9 @@ static const uint64_t stat_bits[PSI_NUM_INTERRUPTS] =
=3D {
     [PSIHB_IRQ_EXTERNAL]  =3D PSIHB_IRQ_STAT_EXT,
 };
=20
-void pnv_psi_irq_set(PnvPsi *psi, int irq, bool state)
-{
-    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
-}
-
-static void __pnv_psi_irq_set(void *opaque, int irq, int state)
-{
-    PnvPsi *psi =3D (PnvPsi *) opaque;
-    PNV_PSI_GET_CLASS(psi)->irq_set(psi, irq, state);
-}
-
-static void pnv_psi_power8_irq_set(PnvPsi *psi, int irq, bool state)
+static void pnv_psi_power8_set_irq(void *opaque, int irq, int state)
 {
+    PnvPsi *psi =3D opaque;
     uint32_t xivr_reg;
     uint32_t stat_reg;
     uint32_t src;
@@ -518,7 +508,7 @@ static void pnv_psi_power8_realize(DeviceState *dev, =
Error **errp)
         ics_set_irq_type(ics, i, true);
     }
=20
-    qdev_init_gpio_in(dev, __pnv_psi_irq_set, ics->nr_irqs);
+    qdev_init_gpio_in(dev, pnv_psi_power8_set_irq, ics->nr_irqs);
=20
     psi->qirqs =3D qemu_allocate_irqs(ics_set_irq, ics, ics->nr_irqs);
=20
@@ -581,7 +571,6 @@ static void pnv_psi_power8_class_init(ObjectClass *kl=
ass, void *data)
     ppc->xscom_pcba =3D PNV_XSCOM_PSIHB_BASE;
     ppc->xscom_size =3D PNV_XSCOM_PSIHB_SIZE;
     ppc->bar_mask   =3D PSIHB_BAR_MASK;
-    ppc->irq_set    =3D pnv_psi_power8_irq_set;
     ppc->compat     =3D compat;
     ppc->compat_size =3D sizeof(compat);
 }
@@ -819,8 +808,9 @@ static const MemoryRegionOps pnv_psi_p9_xscom_ops =3D=
 {
     }
 };
=20
-static void pnv_psi_power9_irq_set(PnvPsi *psi, int irq, bool state)
+static void pnv_psi_power9_set_irq(void *opaque, int irq, int state)
 {
+    PnvPsi *psi =3D opaque;
     uint64_t irq_method =3D psi->regs[PSIHB_REG(PSIHB9_INTERRUPT_CONTROL=
)];
=20
     if (irq > PSIHB9_NUM_IRQS) {
@@ -881,7 +871,7 @@ static void pnv_psi_power9_realize(DeviceState *dev, =
Error **errp)
=20
     psi->qirqs =3D qemu_allocate_irqs(xive_source_set_irq, xsrc, xsrc->n=
r_irqs);
=20
-    qdev_init_gpio_in(dev, __pnv_psi_irq_set, xsrc->nr_irqs);
+    qdev_init_gpio_in(dev, pnv_psi_power9_set_irq, xsrc->nr_irqs);
=20
     /* XSCOM region for PSI registers */
     pnv_xscom_region_init(&psi->xscom_regs, OBJECT(dev), &pnv_psi_p9_xsc=
om_ops,
@@ -908,7 +898,6 @@ static void pnv_psi_power9_class_init(ObjectClass *kl=
ass, void *data)
     ppc->xscom_pcba =3D PNV9_XSCOM_PSIHB_BASE;
     ppc->xscom_size =3D PNV9_XSCOM_PSIHB_SIZE;
     ppc->bar_mask   =3D PSIHB9_BAR_MASK;
-    ppc->irq_set    =3D pnv_psi_power9_irq_set;
     ppc->compat     =3D compat;
     ppc->compat_size =3D sizeof(compat);
=20
--=20
2.34.1


