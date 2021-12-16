Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634BC47800F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:41:03 +0100 (CET)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzQs-0004co-Hc
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM5-0004ch-Ti; Thu, 16 Dec 2021 15:27:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxM4-0007aT-7r; Thu, 16 Dec 2021 15:27:57 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJHuw7025348; 
 Thu, 16 Dec 2021 20:27:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys71g32r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:27 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGKF8ac016955;
 Thu, 16 Dec 2021 20:27:27 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cys71g326-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:27 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKCF8j028676;
 Thu, 16 Dec 2021 20:27:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3cy7sjt0g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:27:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BGKJK5x45089198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:19:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5594BA4062;
 Thu, 16 Dec 2021 20:27:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 143A9A405F;
 Thu, 16 Dec 2021 20:27:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 16 Dec 2021 20:27:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 591372201A0;
 Thu, 16 Dec 2021 21:27:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 098/101] ppc/pnv: Compute the PHB index from the PHB4 PEC model
Date: Thu, 16 Dec 2021 21:26:11 +0100
Message-Id: <20211216202614.414266-99-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cOuseZUrv7TvdoWJpEhUhUjS4HO7kK9T
X-Proofpoint-GUID: 6-oCQJL0Au9kH8Ify6_vSQjHMZmqavCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=858 malwarescore=0 clxscore=1034 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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

Use the num_stacks class attribute to compute the PHB index depending
on the PEC index :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

The routine pnv_pec_phb_offset() is a bit complex but it also prepares
ground for PHB5 which has a different layout of stacks: 3 per PECs.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211213132830.108372-12-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 16 ++++++++++++++++
 hw/ppc/pnv.c               |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 293909b5cb90..a7dd4173d598 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -374,6 +374,19 @@ static void pnv_pec_instance_init(Object *obj)
     }
 }
=20
+static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
+{
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    int index =3D pec->index;
+    int offset =3D 0;
+
+    while (index--) {
+        offset +=3D pecc->num_stacks[index];
+    }
+
+    return offset;
+}
+
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(dev);
@@ -394,8 +407,10 @@ static void pnv_pec_realize(DeviceState *dev, Error =
**errp)
     for (i =3D 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack =3D &pec->stacks[i];
         Object *stk_obj =3D OBJECT(stack);
+        int phb_id =3D pnv_pec_phb_offset(pec) + i;
=20
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
+        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort)=
;
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abo=
rt);
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -538,6 +553,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(obj);
=20
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
+    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index=
");
 }
=20
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 3957a8c3b1ae..712200264be2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1384,7 +1384,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *ch=
ip, Error **errp)
 {
     Pnv9Chip *chip9 =3D PNV9_CHIP(chip);
     int i, j;
-    int phb_id =3D 0;
=20
     for (i =3D 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec =3D &chip9->pecs[i];
@@ -1409,11 +1408,10 @@ static void pnv_chip_power9_phb_realize(PnvChip *=
chip, Error **errp)
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr)=
;
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
=20
-        for (j =3D 0; j < pec->num_stacks; j++, phb_id++) {
+        for (j =3D 0; j < pec->num_stacks; j++) {
             PnvPhb4PecStack *stack =3D &pec->stacks[j];
             Object *obj =3D OBJECT(&stack->phb);
=20
-            object_property_set_int(obj, "index", phb_id, &error_fatal);
             object_property_set_int(obj, "chip-id", chip->chip_id,
                                     &error_fatal);
             object_property_set_int(obj, "version", pecc->version,
--=20
2.31.1


