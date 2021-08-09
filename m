Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B793E46FA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:57:03 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5m2-00055e-Lf
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5ba-0000bH-W8; Mon, 09 Aug 2021 09:46:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mD5bX-00010T-9c; Mon, 09 Aug 2021 09:46:14 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179DZSRM040914; Mon, 9 Aug 2021 09:46:04 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa78t9j10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 09:46:04 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179CxIW5029162;
 Mon, 9 Aug 2021 13:46:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht8v2t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 13:46:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 179DgqhS29884742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 13:42:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A93E04C059;
 Mon,  9 Aug 2021 13:45:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A1644C064;
 Mon,  9 Aug 2021 13:45:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  9 Aug 2021 13:45:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.114])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9496F220032;
 Mon,  9 Aug 2021 15:45:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 14/26] ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
Date: Mon,  9 Aug 2021 15:45:35 +0200
Message-Id: <20210809134547.689560-15-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4KYxVIwBmEMn-jEzNlNJ5mAdSUhBZuJ_
X-Proofpoint-GUID: 4KYxVIwBmEMn-jEzNlNJ5mAdSUhBZuJ_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=899
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1034
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090101
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB4 and PHB5 are very similar. Use the PHB4 models with some minor
adjustements in a subclass for P10.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 11 ++++
 include/hw/ppc/pnv.h           |  3 ++
 include/hw/ppc/pnv_xscom.h     |  6 +++
 hw/pci-host/pnv_phb4_pec.c     | 44 ++++++++++++++++
 hw/ppc/pnv.c                   | 95 +++++++++++++++++++++++++++++++++-
 5 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb=
4.h
index 27556ae53425..78ae74349299 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -221,4 +221,15 @@ struct PnvPhb4PecClass {
     int stk_compat_size;
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
index 13495423283a..f44b9947d00e 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -131,6 +131,9 @@ struct Pnv10Chip {
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
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 741ddc90ed8d..ab13311ef4c7 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -584,9 +584,53 @@ static const TypeInfo pnv_pec_stk_type_info =3D {
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
     type_register_static(&pnv_pec_stk_type_info);
 }
=20
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f670d97c5f91..125466023148 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -706,9 +706,17 @@ static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *b=
mc, uint32_t irq)
 static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
+    int i, j;
=20
     pnv_xive2_pic_print_info(&chip10->xive, mon);
     pnv_psi_pic_print_info(&chip10->psi, mon);
+
+    for (i =3D 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        PnvPhb4PecState *pec =3D &chip10->pecs[i];
+        for (j =3D 0; j < pec->num_stacks; j++) {
+            pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
+        }
+    }
 }
=20
 /* Always give the first 1GB to chip 0 else we won't boot */
@@ -1595,7 +1603,10 @@ static void pnv_chip_power9_class_init(ObjectClass=
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
@@ -1603,8 +1614,17 @@ static void pnv_chip_power10_instance_init(Object =
*obj)
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
-}
=20
+    for (i =3D 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
+                                TYPE_PNV_PHB5_PEC);
+    }
+
+    /*
+     * Number of PHBs is the chip default
+     */
+    chip->num_phbs =3D pcc->num_phbs;
+}
=20
 static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **err=
p)
 {
@@ -1633,6 +1653,71 @@ static void pnv_chip_power10_quad_realize(Pnv10Chi=
p *chip10, Error **errp)
     }
 }
=20
+static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
+{
+    Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
+    int i, j;
+    int phb_id =3D 0;
+
+    for (i =3D 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        PnvPhb4PecState *pec =3D &chip10->pecs[i];
+        PnvPhb4PecClass *pecc =3D PNV_PHB4_PEC_GET_CLASS(pec);
+        uint32_t pec_nest_base;
+        uint32_t pec_pci_base;
+
+        object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
+        /*
+         * PEC0 -> 3 stacks
+         * PEC1 -> 3 stacks
+         */
+        object_property_set_int(OBJECT(pec), "num-stacks", 3,
+                                &error_fatal);
+        object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
+                                &error_fatal);
+        object_property_set_link(OBJECT(pec), "system-memory",
+                                 OBJECT(get_system_memory()), &error_abo=
rt);
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
+
+        for (j =3D 0; j < pec->num_stacks && phb_id < chip->num_phbs;
+             j++, phb_id++) {
+            PnvPhb4PecStack *stack =3D &pec->stacks[j];
+            Object *obj =3D OBJECT(&stack->phb);
+
+            object_property_set_int(obj, "index", phb_id, &error_fatal);
+            object_property_set_int(obj, "chip-id", chip->chip_id,
+                                    &error_fatal);
+            object_property_set_int(obj, "version", PNV_PHB5_VERSION,
+                                    &error_fatal);
+            object_property_set_int(obj,  "device-id", PNV_PHB5_DEVICE_I=
D,
+                                    &error_fatal);
+            object_property_set_link(obj, "stack", OBJECT(stack), &error=
_abort);
+            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
+                return;
+            }
+
+            /* Populate the XSCOM address space. */
+            pnv_xscom_add_subregion(chip,
+                                   pec_nest_base + 0x40 * (stack->stack_=
no + 1),
+                                   &stack->nest_regs_mr);
+            pnv_xscom_add_subregion(chip,
+                                    pec_pci_base + 0x40 * (stack->stack_=
no + 1),
+                                    &stack->pci_regs_mr);
+            pnv_xscom_add_subregion(chip,
+                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_ST=
K0 +
+                                    0x40 * stack->stack_no,
+                                    &stack->phb_regs_mr);
+        }
+    }
+}
+
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
@@ -1711,6 +1796,13 @@ static void pnv_chip_power10_realize(DeviceState *=
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
@@ -1737,6 +1829,7 @@ static void pnv_chip_power10_class_init(ObjectClass=
 *klass, void *data)
     k->xscom_core_base =3D pnv_chip_power10_xscom_core_base;
     k->xscom_pcba =3D pnv_chip_power10_xscom_pcba;
     dc->desc =3D "PowerNV Chip POWER10";
+    k->num_phbs =3D 6;
=20
     device_class_set_parent_realize(dc, pnv_chip_power10_realize,
                                     &k->parent_realize);
--=20
2.31.1


