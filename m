Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86554C710A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:55:16 +0100 (CET)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOiMl-00017n-Eg
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:55:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKG-0006gv-R3; Mon, 28 Feb 2022 10:52:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKE-0000s8-S4; Mon, 28 Feb 2022 10:52:40 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SEC2LV010221; 
 Mon, 28 Feb 2022 15:52:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egyxjatdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:33 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFLY1w007105;
 Mon, 28 Feb 2022 15:52:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egyxjatcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:33 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlPew016579;
 Mon, 28 Feb 2022 15:52:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu98tng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21SFqS4B41615762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB4742049;
 Mon, 28 Feb 2022 15:52:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AAAB42045;
 Mon, 28 Feb 2022 15:52:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:28 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 56BD22203EC;
 Mon, 28 Feb 2022 16:52:27 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 05/18] ppc/pnv: Add POWER10 quads
Date: Mon, 28 Feb 2022 16:52:09 +0100
Message-Id: <20220228155222.643974-6-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tf7HGXluammQqpCEb3G-Rmke6ySWiFJi
X-Proofpoint-GUID: xxmnMmkR8z-TFhzSo9RMNaMHVbkXH8mo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=652 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280083
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and use a pnv_chip_power10_quad_realize() helper to avoid code
duplication with P9. This still needs some refinements on the XSCOM
registers handling in PnvQuad.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h |  3 +++
 hw/ppc/pnv.c         | 50 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 21e69b0fc187..6449fba39bfb 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -129,6 +129,9 @@ struct Pnv10Chip {
     Pnv9Psi      psi;
     PnvLpcController lpc;
     PnvOCC       occ;
+
+    uint32_t     nr_quads;
+    PnvQuad      *quads;
 };
=20
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8394b786d89d..514019366c86 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1388,6 +1388,21 @@ static void pnv_chip_power9_instance_init(Object *=
obj)
     }
 }
=20
+static void pnv_chip_quad_realize_one(PnvChip *chip, PnvQuad *eq,
+                                      PnvCore *pnv_core)
+{
+    char eq_name[32];
+    int core_id =3D CPU_CORE(pnv_core)->core_id;
+
+    snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
+    object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
+                                       sizeof(*eq), TYPE_PNV_QUAD,
+                                       &error_fatal, NULL);
+
+    object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal=
);
+    qdev_realize(DEVICE(eq), NULL, &error_fatal);
+}
+
 static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
 {
     PnvChip *chip =3D PNV_CHIP(chip9);
@@ -1397,18 +1412,9 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9,=
 Error **errp)
     chip9->quads =3D g_new0(PnvQuad, chip9->nr_quads);
=20
     for (i =3D 0; i < chip9->nr_quads; i++) {
-        char eq_name[32];
         PnvQuad *eq =3D &chip9->quads[i];
-        PnvCore *pnv_core =3D chip->cores[i * 4];
-        int core_id =3D CPU_CORE(pnv_core)->core_id;
-
-        snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
-        object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
-                                           sizeof(*eq), TYPE_PNV_QUAD,
-                                           &error_fatal, NULL);
=20
-        object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_f=
atal);
-        qdev_realize(DEVICE(eq), NULL, &error_fatal);
+        pnv_chip_quad_realize_one(chip, eq, chip->cores[i * 4]);
=20
         pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->quad_id),
                                 &eq->xscom_regs);
@@ -1585,6 +1591,24 @@ static void pnv_chip_power10_instance_init(Object =
*obj)
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
 }
=20
+static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **err=
p)
+{
+    PnvChip *chip =3D PNV_CHIP(chip10);
+    int i;
+
+    chip10->nr_quads =3D DIV_ROUND_UP(chip->nr_cores, 4);
+    chip10->quads =3D g_new0(PnvQuad, chip10->nr_quads);
+
+    for (i =3D 0; i < chip10->nr_quads; i++) {
+        PnvQuad *eq =3D &chip10->quads[i];
+
+        pnv_chip_quad_realize_one(chip, eq, chip->cores[i * 4]);
+
+        pnv_xscom_add_subregion(chip, PNV10_XSCOM_EQ_BASE(eq->quad_id),
+                                &eq->xscom_regs);
+    }
+}
+
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
@@ -1606,6 +1630,12 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
         return;
     }
=20
+    pnv_chip_power10_quad_realize(chip10, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* XIVE2 interrupt controller (POWER10) */
     object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
                             PNV10_XIVE2_IC_BASE(chip), &error_fatal);
--=20
2.34.1


