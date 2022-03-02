Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527E4CA4C6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:28:08 +0100 (CET)
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO5P-0002RS-71
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrI-0001Og-1M; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21744
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001st-3l; Wed, 02 Mar 2022 06:09:27 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AmT5m030381; 
 Wed, 2 Mar 2022 11:08:53 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej75ercwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B3QkU030533;
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu95249-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8nR240632716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1C5F4C044;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF4C14C046;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 1EBB92201C1;
 Wed,  2 Mar 2022 12:08:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 60/87] ppc/pnv: Add POWER10 quads
Date: Wed,  2 Mar 2022 12:07:36 +0100
Message-Id: <20220302110803.849505-61-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3ne2La1GwvujHDR1zZ3wDOUFhyfD1xYB
X-Proofpoint-GUID: 3ne2La1GwvujHDR1zZ3wDOUFhyfD1xYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=606
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
index 2431a7a5a38a..77f250b86d8f 100644
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


