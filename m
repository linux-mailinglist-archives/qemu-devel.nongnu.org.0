Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3748C519
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:49:53 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7e0e-0002vj-Je
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFO-0007BP-ED; Wed, 12 Jan 2022 06:56:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cFK-0007Zn-ED; Wed, 12 Jan 2022 06:56:58 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAu8Xc017179; 
 Wed, 12 Jan 2022 11:56:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0ub3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:29 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CBuTGE000448;
 Wed, 12 Jan 2022 11:56:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhrdw0ua3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBkxFG018217;
 Wed, 12 Jan 2022 11:56:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3df289ap4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:26 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBuNU735127680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5D4111C074;
 Wed, 12 Jan 2022 11:56:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83CD711C05B;
 Wed, 12 Jan 2022 11:56:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C95B92201C6;
 Wed, 12 Jan 2022 12:56:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 31/34] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Date: Wed, 12 Jan 2022 12:55:48 +0100
Message-Id: <20220112115551.987666-32-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I7uJ8ZBFkZDbXMTNC3VZhR6nE9KrXmoh
X-Proofpoint-GUID: zmFd1jcoz1EC7ibpVgHXWpOBVtFm4I0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=644
 malwarescore=0 bulkscore=0 clxscore=1034 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
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

At this moment, stack->phb is the plain PnvPHB4 device itself instead of
a pointer to the device. This will present a problem when adding user
creatable devices because we can't deal with this struct and the
realize() callback from the user creatable device.

We can't get rid of this attribute, similar to what we did when enabling
pnv-phb3 user creatable devices, because pnv_phb4_update_regions() needs
to access stack->phb to do its job. This function is called twice in
pnv_pec_stk_update_map(), which is one of the nested xscom write
callbacks (via pnv_pec_stk_nest_xscom_write()). In fact,
pnv_pec_stk_update_map() code comment is explicit about how the order of
the unmap/map operations relates with the PHB subregions.

All of this indicates that this code is tied together in a way that we
either go on a crusade, featuring lots of refactories and redesign and
considerable pain, to decouple stack and phb mapping, or we allow stack
update_map operations to access the associated PHB as it is today even
after introducing pnv-phb4 user devices.

This patch chooses the latter. Instead of getting rid of stack->phb,
turn it into a PHB pointer. This will allow us to assign an user created
PHB to an existing stack later. In this process,
pnv_pec_stk_instance_init() is removed because stack->phb is being
initialized in stk_realize() instead.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220111131027.599784-4-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h |  7 +++++--
 hw/pci-host/pnv_phb4.c         |  2 +-
 hw/pci-host/pnv_phb4_pec.c     | 20 +++++++-------------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 5ee996ebc650..82f054cf218a 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -177,8 +177,11 @@ struct PnvPhb4PecStack {
     /* The owner PEC */
     PnvPhb4PecState *pec;
=20
-    /* The actual PHB */
-    PnvPHB4 phb;
+    /*
+     * PHB4 pointer. pnv_phb4_update_regions() needs to access
+     * the PHB4 via a PnvPhb4PecStack pointer.
+     */
+    PnvPHB4 *phb;
 };
=20
 struct PnvPhb4PecState {
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 8ef58bf2de7a..e25adb88604c 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1728,7 +1728,7 @@ type_init(pnv_phb4_register_types);
=20
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
-    PnvPHB4 *phb =3D &stack->phb;
+    PnvPHB4 *phb =3D stack->phb;
=20
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index bf0fdf33fd8c..d4c52a5d284c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -275,13 +275,6 @@ static const TypeInfo pnv_pec_type_info =3D {
     }
 };
=20
-static void pnv_pec_stk_instance_init(Object *obj)
-{
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(obj);
-
-    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-}
-
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
@@ -289,15 +282,17 @@ static void pnv_pec_stk_realize(DeviceState *dev, E=
rror **errp)
     PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
=20
-    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id=
,
+    stack->phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+
+    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "version", pecc->versio=
n,
+    object_property_set_int(OBJECT(stack->phb), "version", pecc->version=
,
                             &error_fatal);
-    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack)=
,
+    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
                              &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
     }
 }
@@ -324,7 +319,6 @@ static const TypeInfo pnv_pec_stk_type_info =3D {
     .name          =3D TYPE_PNV_PHB4_PEC_STACK,
     .parent        =3D TYPE_DEVICE,
     .instance_size =3D sizeof(PnvPhb4PecStack),
-    .instance_init =3D pnv_pec_stk_instance_init,
     .class_init    =3D pnv_pec_stk_class_init,
     .interfaces    =3D (InterfaceInfo[]) {
         { TYPE_PNV_XSCOM_INTERFACE },
--=20
2.31.1


