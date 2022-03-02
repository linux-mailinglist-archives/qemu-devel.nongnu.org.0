Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66E4CA4C4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:26:27 +0100 (CET)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO3l-0006nn-6z
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrI-0001Pn-4V; Wed, 02 Mar 2022 06:09:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13384
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001tG-2Y; Wed, 02 Mar 2022 06:09:27 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228OVMC001322; 
 Wed, 2 Mar 2022 11:08:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ej51mb62t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2fPG022365;
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3efbu9d1wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8mOI46793198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68990A4073;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D920A4067;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8152E220294;
 Wed,  2 Mar 2022 12:08:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 59/87] ppc/pnv: Add a OCC model for POWER10
Date: Wed,  2 Mar 2022 12:07:35 +0100
Message-Id: <20220302110803.849505-60-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OA8lO9TFA_D9xn4_iPbKAvCs9tG6zBIT
X-Proofpoint-ORIG-GUID: OA8lO9TFA_D9xn4_iPbKAvCs9tG6zBIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 mlxlogscore=846
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our OCC model is very mininal and POWER10 can simply reuse the OCC
model we introduced for POWER9.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h       |  1 +
 include/hw/ppc/pnv_occ.h   |  2 ++
 include/hw/ppc/pnv_xscom.h |  3 +++
 hw/ppc/pnv.c               | 10 ++++++++++
 hw/ppc/pnv_occ.c           | 16 ++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 6b3457b4495d..21e69b0fc187 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -128,6 +128,7 @@ struct Pnv10Chip {
     PnvXive2     xive;
     Pnv9Psi      psi;
     PnvLpcController lpc;
+    PnvOCC       occ;
 };
=20
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index b78185aecaf2..f982ba002481 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -32,6 +32,8 @@ DECLARE_INSTANCE_CHECKER(PnvOCC, PNV8_OCC,
 #define TYPE_PNV9_OCC TYPE_PNV_OCC "-POWER9"
 DECLARE_INSTANCE_CHECKER(PnvOCC, PNV9_OCC,
                          TYPE_PNV9_OCC)
+#define TYPE_PNV10_OCC TYPE_PNV_OCC "-POWER10"
+DECLARE_INSTANCE_CHECKER(PnvOCC, PNV10_OCC, TYPE_PNV10_OCC)
=20
 #define PNV_OCC_SENSOR_DATA_BLOCK_OFFSET 0x00580000
 #define PNV_OCC_SENSOR_DATA_BLOCK_SIZE   0x00025800
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 188da874a4b0..151df15378d1 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -131,6 +131,9 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
 #define PNV10_XSCOM_PSIHB_SIZE     0x100
=20
+#define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
+#define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
+
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f486fdfb5c72..2431a7a5a38a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1582,6 +1582,7 @@ static void pnv_chip_power10_instance_init(Object *=
obj)
                               "xive-fabric");
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
+    object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
 }
=20
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
@@ -1647,6 +1648,15 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
     chip->fw_mr =3D &chip10->lpc.isa_fw;
     chip->dt_isa_nodename =3D g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc=
@0",
                                             (uint64_t) PNV10_LPCM_BASE(c=
hip));
+
+    /* Create the simplified OCC model */
+    object_property_set_link(OBJECT(&chip10->occ), "psi", OBJECT(&chip10=
->psi),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&chip10->occ), NULL, errp)) {
+        return;
+    }
+    pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
+                            &chip10->occ.xscom_regs);
 }
=20
 static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr=
)
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 5a716c256edc..4ed66f5e1fcc 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -236,7 +236,9 @@ static const MemoryRegionOps pnv_occ_power9_xscom_ops=
 =3D {
 static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
 {
     PnvOCCClass *poc =3D PNV_OCC_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->desc =3D "PowerNV OCC Controller (POWER9)";
     poc->xscom_size =3D PNV9_XSCOM_OCC_SIZE;
     poc->xscom_ops =3D &pnv_occ_power9_xscom_ops;
     poc->psi_irq =3D PSIHB9_IRQ_OCC;
@@ -249,6 +251,19 @@ static const TypeInfo pnv_occ_power9_type_info =3D {
     .class_init    =3D pnv_occ_power9_class_init,
 };
=20
+static void pnv_occ_power10_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "PowerNV OCC Controller (POWER10)";
+}
+
+static const TypeInfo pnv_occ_power10_type_info =3D {
+    .name          =3D TYPE_PNV10_OCC,
+    .parent        =3D TYPE_PNV9_OCC,
+    .class_init    =3D pnv_occ_power10_class_init,
+};
+
 static void pnv_occ_realize(DeviceState *dev, Error **errp)
 {
     PnvOCC *occ =3D PNV_OCC(dev);
@@ -297,6 +312,7 @@ static void pnv_occ_register_types(void)
     type_register_static(&pnv_occ_type_info);
     type_register_static(&pnv_occ_power8_type_info);
     type_register_static(&pnv_occ_power9_type_info);
+    type_register_static(&pnv_occ_power10_type_info);
 }
=20
 type_init(pnv_occ_register_types);
--=20
2.34.1


