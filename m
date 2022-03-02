Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E646F4CA4C9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:29:17 +0100 (CET)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO6X-0004vT-1M
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:29:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrK-0001TD-4C; Wed, 02 Mar 2022 06:09:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001tc-4I; Wed, 02 Mar 2022 06:09:29 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AILrW022671; 
 Wed, 2 Mar 2022 11:08:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0y92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:54 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2faT027265;
 Wed, 2 Mar 2022 11:08:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8n0U46793212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D44FAE05D;
 Wed,  2 Mar 2022 11:08:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AC25AE05F;
 Wed,  2 Mar 2022 11:08:49 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:49 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A179F220294;
 Wed,  2 Mar 2022 12:08:48 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 61/87] ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
Date: Wed,  2 Mar 2022 12:07:37 +0100
Message-Id: <20220302110803.849505-62-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sS4Y4JsH5CWCG8jKktMNE9NsK7cO_Uil
X-Proofpoint-ORIG-GUID: sS4Y4JsH5CWCG8jKktMNE9NsK7cO_Uil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=949 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB4 and PHB5 are very similar. Use the PHB4 models with some minor
adjustements in a subclass for P10.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 12 ++++++++
 include/hw/ppc/pnv.h           |  3 ++
 include/hw/ppc/pnv_xscom.h     |  6 ++++
 hw/pci-host/pnv_phb4.c         | 20 +++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 53 ++++++++++++++++++++++++++++++++++
 hw/ppc/pnv.c                   | 51 ++++++++++++++++++++++++++++++++
 6 files changed, 145 insertions(+)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 0c7635dec591..fbcf5bfb5585 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -49,6 +49,7 @@ typedef struct PnvPhb4DMASpace {
  */
 #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
 #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
+#define TYPE_PNV_PHB5_ROOT_PORT "pnv-phb5-root-port"
=20
 typedef struct PnvPHB4RootPort {
     PCIESlot parent_obj;
@@ -206,4 +207,15 @@ struct PnvPhb4PecClass {
     const char *rp_model;
 };
=20
+/*
+ * POWER10 definitions
+ */
+
+#define PNV_PHB5_VERSION           0x000000a500000001ull
+#define PNV_PHB5_DEVICE_ID         0x0652
+
+#define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
+#define PNV_PHB5_PEC(obj) \
+    OBJECT_CHECK(PnvPhb4PecState, (obj), TYPE_PNV_PHB5_PEC)
+
 #endif /* PCI_HOST_PNV_PHB4_H */
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 6449fba39bfb..e5141851faed 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -132,6 +132,9 @@ struct Pnv10Chip {
=20
     uint32_t     nr_quads;
     PnvQuad      *quads;
+
+#define PNV10_CHIP_MAX_PEC 2
+    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
 };
=20
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 151df15378d1..75db33d46af6 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -137,6 +137,12 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
=20
+#define PNV10_XSCOM_PEC_NEST_BASE  0x3011800 /* index goes downwards ...=
 */
+#define PNV10_XSCOM_PEC_NEST_SIZE  0x100
+
+#define PNV10_XSCOM_PEC_PCI_BASE   0x8010800 /* index goes upwards ... *=
/
+#define PNV10_XSCOM_PEC_PCI_SIZE   0x200
+
 void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
 int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
                  uint64_t xscom_base, uint64_t xscom_size,
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 846e7d0c3e24..5344a6d4a693 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1812,9 +1812,29 @@ static const TypeInfo pnv_phb4_root_port_info =3D =
{
     .class_init    =3D pnv_phb4_root_port_class_init,
 };
=20
+static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data=
)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
+
+    dc->desc     =3D "IBM PHB5 PCIE Root Port";
+    dc->user_creatable =3D true;
+
+    k->vendor_id =3D PCI_VENDOR_ID_IBM;
+    k->device_id =3D PNV_PHB5_DEVICE_ID;
+}
+
+static const TypeInfo pnv_phb5_root_port_info =3D {
+    .name          =3D TYPE_PNV_PHB5_ROOT_PORT,
+    .parent        =3D TYPE_PNV_PHB4_ROOT_PORT,
+    .instance_size =3D sizeof(PnvPHB4RootPort),
+    .class_init    =3D pnv_phb5_root_port_class_init,
+};
+
 static void pnv_phb4_register_types(void)
 {
     type_register_static(&pnv_phb4_root_bus_info);
+    type_register_static(&pnv_phb5_root_port_info);
     type_register_static(&pnv_phb4_root_port_info);
     type_register_static(&pnv_phb4_type_info);
     type_register_static(&pnv_phb4_iommu_memory_region_info);
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 40d89fda56e5..0ab36e9c8f3c 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -281,9 +281,62 @@ static const TypeInfo pnv_pec_type_info =3D {
     }
 };
=20
+/*
+ * POWER10 definitions
+ */
+
+static uint32_t pnv_phb5_pec_xscom_pci_base(PnvPhb4PecState *pec)
+{
+    return PNV10_XSCOM_PEC_PCI_BASE + 0x1000000 * pec->index;
+}
+
+static uint32_t pnv_phb5_pec_xscom_nest_base(PnvPhb4PecState *pec)
+{
+    /* index goes down ... */
+    return PNV10_XSCOM_PEC_NEST_BASE - 0x1000000 * pec->index;
+}
+
+/*
+ * PEC0 -> 3 stacks
+ * PEC1 -> 3 stacks
+ */
+static const uint32_t pnv_phb5_pec_num_stacks[] =3D { 3, 3 };
+
+static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
+{
+    PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_CLASS(klass);
+    static const char compat[] =3D "ibm,power10-pbcq";
+    static const char stk_compat[] =3D "ibm,power10-phb-stack";
+
+    pecc->xscom_nest_base =3D pnv_phb5_pec_xscom_nest_base;
+    pecc->xscom_pci_base  =3D pnv_phb5_pec_xscom_pci_base;
+    pecc->xscom_nest_size =3D PNV10_XSCOM_PEC_NEST_SIZE;
+    pecc->xscom_pci_size  =3D PNV10_XSCOM_PEC_PCI_SIZE;
+    pecc->compat =3D compat;
+    pecc->compat_size =3D sizeof(compat);
+    pecc->stk_compat =3D stk_compat;
+    pecc->stk_compat_size =3D sizeof(stk_compat);
+    pecc->version =3D PNV_PHB5_VERSION;
+    pecc->num_phbs =3D pnv_phb5_pec_num_stacks;
+    pecc->rp_model =3D TYPE_PNV_PHB5_ROOT_PORT;
+}
+
+static const TypeInfo pnv_phb5_pec_type_info =3D {
+    .name          =3D TYPE_PNV_PHB5_PEC,
+    .parent        =3D TYPE_PNV_PHB4_PEC,
+    .instance_size =3D sizeof(PnvPhb4PecState),
+    .class_init    =3D pnv_phb5_pec_class_init,
+    .class_size    =3D sizeof(PnvPhb4PecClass),
+    .interfaces    =3D (InterfaceInfo[]) {
+        { TYPE_PNV_XSCOM_INTERFACE },
+        { }
+    }
+};
+
 static void pnv_pec_register_types(void)
 {
     type_register_static(&pnv_pec_type_info);
+    type_register_static(&pnv_phb5_pec_type_info);
 }
=20
 type_init(pnv_pec_register_types);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 77f250b86d8f..34659087e803 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -727,6 +727,9 @@ static void pnv_chip_power10_pic_print_info(PnvChip *=
chip, Monitor *mon)
=20
     pnv_xive2_pic_print_info(&chip10->xive, mon);
     pnv_psi_pic_print_info(&chip10->psi, mon);
+
+    object_child_foreach_recursive(OBJECT(chip),
+                         pnv_chip_power9_pic_print_info_child, mon);
 }
=20
 /* Always give the first 1GB to chip 0 else we won't boot */
@@ -1581,7 +1584,10 @@ static void pnv_chip_power9_class_init(ObjectClass=
 *klass, void *data)
=20
 static void pnv_chip_power10_instance_init(Object *obj)
 {
+    PnvChip *chip =3D PNV_CHIP(obj);
     Pnv10Chip *chip10 =3D PNV10_CHIP(obj);
+    PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(obj);
+    int i;
=20
     object_initialize_child(obj, "xive", &chip10->xive, TYPE_PNV_XIVE2);
     object_property_add_alias(obj, "xive-fabric", OBJECT(&chip10->xive),
@@ -1589,6 +1595,15 @@ static void pnv_chip_power10_instance_init(Object =
*obj)
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
+
+    if (defaults_enabled()) {
+        chip->num_pecs =3D pcc->num_pecs;
+    }
+
+    for (i =3D 0; i < chip->num_pecs; i++) {
+        object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
+                                TYPE_PNV_PHB5_PEC);
+    }
 }
=20
 static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **err=
p)
@@ -1609,6 +1624,34 @@ static void pnv_chip_power10_quad_realize(Pnv10Chi=
p *chip10, Error **errp)
     }
 }
=20
+static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
+{
+    Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
+    int i;
+
+    for (i =3D 0; i < chip->num_pecs; i++) {
+        PnvPhb4PecState *pec =3D &chip10->pecs[i];
+        PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+        uint32_t pec_nest_base;
+        uint32_t pec_pci_base;
+
+        object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
+        object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
+                                &error_fatal);
+        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
+                                 &error_fatal);
+        if (!qdev_realize(DEVICE(pec), NULL, errp)) {
+            return;
+        }
+
+        pec_nest_base =3D pecc->xscom_nest_base(pec);
+        pec_pci_base =3D pecc->xscom_pci_base(pec);
+
+        pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr)=
;
+        pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
+    }
+}
+
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
@@ -1687,6 +1730,13 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
     }
     pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
                             &chip10->occ.xscom_regs);
+
+    /* PHBs */
+    pnv_chip_power10_phb_realize(chip, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 }
=20
 static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr=
)
@@ -1713,6 +1763,7 @@ static void pnv_chip_power10_class_init(ObjectClass=
 *klass, void *data)
     k->xscom_core_base =3D pnv_chip_power10_xscom_core_base;
     k->xscom_pcba =3D pnv_chip_power10_xscom_pcba;
     dc->desc =3D "PowerNV Chip POWER10";
+    k->num_pecs =3D PNV10_CHIP_MAX_PEC;
=20
     device_class_set_parent_realize(dc, pnv_chip_power10_realize,
                                     &k->parent_realize);
--=20
2.34.1


