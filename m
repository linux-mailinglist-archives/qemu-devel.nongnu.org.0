Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1621492849
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:24:46 +0100 (CET)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pPh-0003rH-Vs
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:24:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDm-0004EN-Vf; Tue, 18 Jan 2022 08:08:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDg-0000FY-7d; Tue, 18 Jan 2022 08:08:21 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICv2V3013758; 
 Tue, 18 Jan 2022 13:07:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0prcw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:53 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ID47BA026479;
 Tue, 18 Jan 2022 13:07:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnx0prcvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID2wXk016163;
 Tue, 18 Jan 2022 13:07:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3dknwabbwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7mP234996482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D8D8A405B;
 Tue, 18 Jan 2022 13:07:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 597C3A405C;
 Tue, 18 Jan 2022 13:07:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A05E522016C;
 Tue, 18 Jan 2022 14:07:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 24/31] ppc/pnv: move default_phb_realize() to pec_realize()
Date: Tue, 18 Jan 2022 14:07:23 +0100
Message-Id: <20220118130730.1927983-25-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9VHFLSbwRDD3Q4sFfgMkDgjRVe_L5Fhw
X-Proofpoint-ORIG-GUID: ZXt9Kbltb0yuVplOsp0hL4IXNPdptihP
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

Move the current pnv_pec_stk_default_phb_realize() call to
pec_realize(), renaming the function to pnv_pec_default_phb_realize(),
and set the PHB attributes using the PEC object directly.

This will be important to allow for PECs devices to handle PHB4s
directly later on.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220114180719.52117-5-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb4_pec.c | 63 ++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index ed1d6441821a..a80a21db771a 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,6 +112,30 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops =3D=
 {
     .endianness =3D DEVICE_BIG_ENDIAN,
 };
=20
+static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
+                                        int stack_no,
+                                        Error **errp)
+{
+    PnvPhb4PecState *pec =3D stack->pec;
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+    int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack_no);
+
+    stack->phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
+    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "version", pecc->version=
,
+                            &error_fatal);
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
+        return;
+    }
+}
+
 static void pnv_pec_instance_init(Object *obj)
 {
     PnvPhb4PecState *pec =3D PNV_PHB4_PEC(obj);
@@ -144,6 +168,15 @@ static void pnv_pec_realize(DeviceState *dev, Error =
**errp)
=20
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abo=
rt);
+
+        if (defaults_enabled()) {
+            pnv_pec_default_phb_realize(stack, i, errp);
+        }
+
+        /*
+         * qdev gets angry if we don't realize 'stack' here, even
+         * if stk_realize() is now empty.
+         */
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
         }
@@ -276,38 +309,8 @@ static const TypeInfo pnv_pec_type_info =3D {
     }
 };
=20
-static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
-                                            Error **errp)
-{
-    PnvPhb4PecState *pec =3D stack->pec;
-    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
-    int phb_id =3D pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
-
-    stack->phb =3D PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-
-    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
-                             &error_abort);
-    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "version", pecc->version=
,
-                            &error_fatal);
-
-    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
-        return;
-    }
-}
-
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
-    PnvPhb4PecStack *stack =3D PNV_PHB4_PEC_STACK(dev);
-
-    if (!defaults_enabled()) {
-        return;
-    }
-
-    pnv_pec_stk_default_phb_realize(stack, errp);
 }
=20
 static Property pnv_pec_stk_properties[] =3D {
--=20
2.31.1


