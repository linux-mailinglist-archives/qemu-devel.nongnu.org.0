Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E748C41D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:43:55 +0100 (CET)
Received: from localhost ([::1]:57766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cyo-0008Gi-2x
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:43:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFJ-00073Y-TP; Wed, 12 Jan 2022 06:56:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57500
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFI-0007YL-DR; Wed, 12 Jan 2022 06:56:53 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CBLM6a019354; 
 Wed, 12 Jan 2022 11:56:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhx1us83w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:28 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBgl8W027243;
 Wed, 12 Jan 2022 11:56:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhx1us834-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:28 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmI3W018118;
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3df289s284-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CBlKFj12976538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:47:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CF48AE080;
 Wed, 12 Jan 2022 11:56:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A693AE076;
 Wed, 12 Jan 2022 11:56:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 810DA2201C6;
 Wed, 12 Jan 2022 12:56:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 29/34] ppc/pnv: set phb4 properties in stk_realize()
Date: Wed, 12 Jan 2022 12:55:46 +0100
Message-Id: <20220112115551.987666-30-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yheWGtXyioxGXrHqcorhTcg_XlU45rKZ
X-Proofpoint-ORIG-GUID: CGpP-utUIjjhQI3Q6gR8GpXZ0COETC4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1034 phishscore=0 priorityscore=1501
 mlxlogscore=974 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
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

Moving all phb4 properties setup to stk_realize() keeps this logic in
a single place instead of having it scattered between stk_realize() and
pec_realize().

'phb->index' can be retrieved using stack->stack_no and
pnv_phb4_pec_get_phb_id(), deprecating the use of 'phb-id' alias that
was being used for this purpose in pec_realize().

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220111131027.599784-2-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d64310e7db1e..f8038dff171c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -392,10 +392,8 @@ static void pnv_pec_realize(DeviceState *dev, Error =
**errp)
     for (i =3D 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack =3D &pec->stacks[i];
         Object *stk_obj =3D OBJECT(stack);
-        int phb_id =3D pnv_phb4_pec_get_phb_id(pec, i);
=20
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort)=
;
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abo=
rt);
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -534,7 +532,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(obj);
=20
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index=
");
 }
=20
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -543,6 +540,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Err=
or **errp)
     PnvPhb4PecState *pec =3D stack->pec;
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     PnvChip *chip =3D pec->chip;
+    int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
     char name[64];
@@ -570,6 +568,8 @@ static void pnv_pec_stk_realize(DeviceState *dev, Err=
or **errp)
=20
     object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id=
,
                             &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+                            &error_fatal);
     object_property_set_int(OBJECT(&stack->phb), "version", pecc->versio=
n,
                             &error_fatal);
     object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack)=
,
--=20
2.31.1


