Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6D14C7162
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:11:18 +0100 (CET)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOicH-00027N-Bi
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKP-0006m2-VM; Mon, 28 Feb 2022 10:52:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nOiKO-0001C0-3F; Mon, 28 Feb 2022 10:52:49 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SF4ssK025553; 
 Mon, 28 Feb 2022 15:52:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egy3cce85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:35 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21SFd6XU013866;
 Mon, 28 Feb 2022 15:52:35 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egy3cce7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SFlPaL010226;
 Mon, 28 Feb 2022 15:52:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3efbu902vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 15:52:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21SFqT5O36831644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 15:52:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B8611C054;
 Mon, 28 Feb 2022 15:52:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76B4011C050;
 Mon, 28 Feb 2022 15:52:29 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 28 Feb 2022 15:52:29 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.32])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A951B2203EC;
 Mon, 28 Feb 2022 16:52:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 07/18] ppc/pnv: Add a HOMER model to POWER10
Date: Mon, 28 Feb 2022 16:52:11 +0100
Message-Id: <20220228155222.643974-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228155222.643974-1-clg@kaod.org>
References: <20220228155222.643974-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h_UXAT_ZMb_VpqR5uUYpKc4qW8yPGV-N
X-Proofpoint-ORIG-GUID: iBivTnA1JGEdwIVXPH02vwKRpLInGczU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_06,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1034 mlxlogscore=573 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h       | 10 ++++++
 include/hw/ppc/pnv_homer.h |  3 ++
 include/hw/ppc/pnv_xscom.h |  3 ++
 hw/ppc/pnv.c               | 20 ++++++++++++
 hw/ppc/pnv_homer.c         | 64 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index e5141851faed..1e34ddd502d8 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -129,6 +129,7 @@ struct Pnv10Chip {
     Pnv9Psi      psi;
     PnvLpcController lpc;
     PnvOCC       occ;
+    PnvHomer     homer;
=20
     uint32_t     nr_quads;
     PnvQuad      *quads;
@@ -364,4 +365,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV10_XIVE2_END_SIZE        0x0000020000000000ull
 #define PNV10_XIVE2_END_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000606000000=
0000ull)
=20
+#define PNV10_OCC_COMMON_AREA_SIZE  0x0000000000800000ull
+#define PNV10_OCC_COMMON_AREA_BASE  0x300fff800000ull
+#define PNV10_OCC_SENSOR_BASE(chip) (PNV10_OCC_COMMON_AREA_BASE +       =
\
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
+
+#define PNV10_HOMER_SIZE              0x0000000000400000ull
+#define PNV10_HOMER_BASE(chip)                                          =
 \
+    (0x300ffd800000ll + ((uint64_t)(chip)->chip_id) * PNV10_HOMER_SIZE)
+
 #endif /* PPC_PNV_H */
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index 1889e3083c57..07e8b193116e 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -32,6 +32,9 @@ DECLARE_INSTANCE_CHECKER(PnvHomer, PNV8_HOMER,
 #define TYPE_PNV9_HOMER TYPE_PNV_HOMER "-POWER9"
 DECLARE_INSTANCE_CHECKER(PnvHomer, PNV9_HOMER,
                          TYPE_PNV9_HOMER)
+#define TYPE_PNV10_HOMER TYPE_PNV_HOMER "-POWER10"
+DECLARE_INSTANCE_CHECKER(PnvHomer, PNV10_HOMER,
+                         TYPE_PNV10_HOMER)
=20
 struct PnvHomer {
     DeviceState parent;
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 75db33d46af6..7c7440de0c40 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -134,6 +134,9 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
 #define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
=20
+#define PNV10_XSCOM_PBA_BASE       0x01010CDA
+#define PNV10_XSCOM_PBA_SIZE       0x40
+
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8ecdfb1884b4..0b53406fe29c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1595,6 +1595,7 @@ static void pnv_chip_power10_instance_init(Object *=
obj)
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
+    object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOM=
ER);
=20
     if (defaults_enabled()) {
         chip->num_pecs =3D pcc->num_pecs;
@@ -1731,6 +1732,25 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
     pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
                             &chip10->occ.xscom_regs);
=20
+    /* OCC SRAM model */
+    memory_region_add_subregion(get_system_memory(),
+                                PNV10_OCC_SENSOR_BASE(chip),
+                                &chip10->occ.sram_regs);
+
+    /* HOMER */
+    object_property_set_link(OBJECT(&chip10->homer), "chip", OBJECT(chip=
),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&chip10->homer), NULL, errp)) {
+        return;
+    }
+    /* Homer Xscom region */
+    pnv_xscom_add_subregion(chip, PNV10_XSCOM_PBA_BASE,
+                            &chip10->homer.pba_regs);
+
+    /* Homer mmio region */
+    memory_region_add_subregion(get_system_memory(), PNV10_HOMER_BASE(ch=
ip),
+                                &chip10->homer.regs);
+
     /* PHBs */
     pnv_chip_power10_phb_realize(chip, &local_err);
     if (local_err) {
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index 9a262629b73a..ea73919e54ca 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -332,6 +332,69 @@ static const TypeInfo pnv_homer_power9_type_info =3D=
 {
     .class_init    =3D pnv_homer_power9_class_init,
 };
=20
+static uint64_t pnv_homer_power10_pba_read(void *opaque, hwaddr addr,
+                                          unsigned size)
+{
+    PnvHomer *homer =3D PNV_HOMER(opaque);
+    PnvChip *chip =3D homer->chip;
+    uint32_t reg =3D addr >> 3;
+    uint64_t val =3D 0;
+
+    switch (reg) {
+    case PBA_BAR0:
+        val =3D PNV10_HOMER_BASE(chip);
+        break;
+    case PBA_BARMASK0: /* P10 homer region mask */
+        val =3D (PNV10_HOMER_SIZE - 1) & 0x300000;
+        break;
+    case PBA_BAR2: /* P10 occ common area */
+        val =3D PNV10_OCC_COMMON_AREA_BASE;
+        break;
+    case PBA_BARMASK2: /* P10 occ common area size */
+        val =3D (PNV10_OCC_COMMON_AREA_SIZE - 1) & 0x700000;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "PBA: read to unimplemented register: O=
x%"
+                      HWADDR_PRIx "\n", addr >> 3);
+    }
+    return val;
+}
+
+static void pnv_homer_power10_pba_write(void *opaque, hwaddr addr,
+                                         uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "PBA: write to unimplemented register: Ox%"
+                  HWADDR_PRIx "\n", addr >> 3);
+}
+
+static const MemoryRegionOps pnv_homer_power10_pba_ops =3D {
+    .read =3D pnv_homer_power10_pba_read,
+    .write =3D pnv_homer_power10_pba_write,
+    .valid.min_access_size =3D 8,
+    .valid.max_access_size =3D 8,
+    .impl.min_access_size =3D 8,
+    .impl.max_access_size =3D 8,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+};
+
+static void pnv_homer_power10_class_init(ObjectClass *klass, void *data)
+{
+    PnvHomerClass *homer =3D PNV_HOMER_CLASS(klass);
+
+    homer->pba_size =3D PNV10_XSCOM_PBA_SIZE;
+    homer->pba_ops =3D &pnv_homer_power10_pba_ops;
+    homer->homer_size =3D PNV10_HOMER_SIZE;
+    homer->homer_ops =3D &pnv_power9_homer_ops; /* TODO */
+    homer->core_max_base =3D PNV9_CORE_MAX_BASE;
+}
+
+static const TypeInfo pnv_homer_power10_type_info =3D {
+    .name          =3D TYPE_PNV10_HOMER,
+    .parent        =3D TYPE_PNV_HOMER,
+    .instance_size =3D sizeof(PnvHomer),
+    .class_init    =3D pnv_homer_power10_class_init,
+};
+
 static void pnv_homer_realize(DeviceState *dev, Error **errp)
 {
     PnvHomer *homer =3D PNV_HOMER(dev);
@@ -377,6 +440,7 @@ static void pnv_homer_register_types(void)
     type_register_static(&pnv_homer_type_info);
     type_register_static(&pnv_homer_power8_type_info);
     type_register_static(&pnv_homer_power9_type_info);
+    type_register_static(&pnv_homer_power10_type_info);
 }
=20
 type_init(pnv_homer_register_types);
--=20
2.34.1


