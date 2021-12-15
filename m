Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6767647611E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:54:19 +0100 (CET)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZPu-0003wg-GY
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiy-0005r7-2L; Wed, 15 Dec 2021 12:05:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62528
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXik-0004x0-VN; Wed, 15 Dec 2021 12:05:43 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfbWP019650; 
 Wed, 15 Dec 2021 17:05:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyfv3qb06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGrA3X011213;
 Wed, 15 Dec 2021 17:05:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyfv3qay7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2kBS004398;
 Wed, 15 Dec 2021 17:05:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jqyfnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:05:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BFGv5HD37355916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 16:57:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CF3D4C050;
 Wed, 15 Dec 2021 17:05:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFA1B4C046;
 Wed, 15 Dec 2021 17:05:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:05:04 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 13378220247;
 Wed, 15 Dec 2021 18:05:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 099/102] ppc/pnv: Compute the PHB index from the PHB4 PEC model
Date: Wed, 15 Dec 2021 18:03:54 +0100
Message-Id: <20211215170357.321643-87-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UzLwbDjdDC_LYoLqEKkgbw8zcRNZrY2K
X-Proofpoint-ORIG-GUID: 4cXYwj50u6ONLceH9vKSGNAuSOWcxMDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1034
 priorityscore=1501 mlxlogscore=870 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


