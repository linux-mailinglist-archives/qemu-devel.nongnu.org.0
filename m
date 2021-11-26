Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350645ED55
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:04:33 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZxv-00029I-Ag
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:04:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnm-0003OR-TS
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:02 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZng-0007SU-Fj
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.228])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5D6122036B;
 Fri, 26 Nov 2021 11:53:55 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069b16146a-7077-4eaa-bd1a-0691aa3c675b,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 06/18] ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge
Date: Fri, 26 Nov 2021 12:53:37 +0100
Message-ID: <20211126115349.2737605-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 21bc228f-6869-481f-9375-ad8522173ef4
X-Ovh-Tracer-Id: 14615025217625951084
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PHB4 and PHB5 are very similar. Use the PHB4 models with some minor
adjustements in a subclass for P10.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/pci-host/pnv_phb4.h | 11 ++++
 include/hw/ppc/pnv.h           |  3 ++
 include/hw/ppc/pnv_xscom.h     |  6 +++
 hw/pci-host/pnv_phb4_pec.c     | 44 ++++++++++++++++
 hw/ppc/pnv.c                   | 94 ++++++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 27556ae53425..78ae74349299 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -221,4 +221,15 @@ struct PnvPhb4PecClass {
     int stk_compat_size;
 };
 
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
 
     uint32_t     nr_quads;
     PnvQuad      *quads;
+
+#define PNV10_CHIP_MAX_PEC 2
+    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
 };
 
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 151df15378d1..75db33d46af6 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -137,6 +137,12 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
 
+#define PNV10_XSCOM_PEC_NEST_BASE  0x3011800 /* index goes downwards ... */
+#define PNV10_XSCOM_PEC_NEST_SIZE  0x100
+
+#define PNV10_XSCOM_PEC_PCI_BASE   0x8010800 /* index goes upwards ... */
+#define PNV10_XSCOM_PEC_PCI_SIZE   0x200
+
 void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
 int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
                  uint64_t xscom_base, uint64_t xscom_size,
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 741ddc90ed8d..ab13311ef4c7 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -584,9 +584,53 @@ static const TypeInfo pnv_pec_stk_type_info = {
     }
 };
 
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
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_CLASS(klass);
+    static const char compat[] = "ibm,power10-pbcq";
+    static const char stk_compat[] = "ibm,power10-phb-stack";
+
+    pecc->xscom_nest_base = pnv_phb5_pec_xscom_nest_base;
+    pecc->xscom_pci_base  = pnv_phb5_pec_xscom_pci_base;
+    pecc->xscom_nest_size = PNV10_XSCOM_PEC_NEST_SIZE;
+    pecc->xscom_pci_size  = PNV10_XSCOM_PEC_PCI_SIZE;
+    pecc->compat = compat;
+    pecc->compat_size = sizeof(compat);
+    pecc->stk_compat = stk_compat;
+    pecc->stk_compat_size = sizeof(stk_compat);
+}
+
+static const TypeInfo pnv_phb5_pec_type_info = {
+    .name          = TYPE_PNV_PHB5_PEC,
+    .parent        = TYPE_PNV_PHB4_PEC,
+    .instance_size = sizeof(PnvPhb4PecState),
+    .class_init    = pnv_phb5_pec_class_init,
+    .class_size    = sizeof(PnvPhb4PecClass),
+    .interfaces    = (InterfaceInfo[]) {
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
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5c342e313329..0de3027b7122 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -706,9 +706,17 @@ static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
 static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv10Chip *chip10 = PNV10_CHIP(chip);
+    int i, j;
 
     pnv_xive2_pic_print_info(&chip10->xive, mon);
     pnv_psi_pic_print_info(&chip10->psi, mon);
+
+    for (i = 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        PnvPhb4PecState *pec = &chip10->pecs[i];
+        for (j = 0; j < pec->num_stacks; j++) {
+            pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
+        }
+    }
 }
 
 /* Always give the first 1GB to chip 0 else we won't boot */
@@ -1602,7 +1610,10 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
 
 static void pnv_chip_power10_instance_init(Object *obj)
 {
+    PnvChip *chip = PNV_CHIP(obj);
     Pnv10Chip *chip10 = PNV10_CHIP(obj);
+    PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
+    int i;
 
     object_initialize_child(obj, "xive", &chip10->xive, TYPE_PNV_XIVE2);
     object_property_add_alias(obj, "xive-fabric", OBJECT(&chip10->xive),
@@ -1610,6 +1621,16 @@ static void pnv_chip_power10_instance_init(Object *obj)
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
+
+    for (i = 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
+                                TYPE_PNV_PHB5_PEC);
+    }
+
+    /*
+     * Number of PHBs is the chip default
+     */
+    chip->num_phbs = pcc->num_phbs;
 }
 
 static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
@@ -1630,6 +1651,71 @@ static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
     }
 }
 
+static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
+{
+    Pnv10Chip *chip10 = PNV10_CHIP(chip);
+    int i, j;
+    int phb_id = 0;
+
+    for (i = 0; i < PNV10_CHIP_MAX_PEC; i++) {
+        PnvPhb4PecState *pec = &chip10->pecs[i];
+        PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
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
+                                 OBJECT(get_system_memory()), &error_abort);
+        if (!qdev_realize(DEVICE(pec), NULL, errp)) {
+            return;
+        }
+
+        pec_nest_base = pecc->xscom_nest_base(pec);
+        pec_pci_base = pecc->xscom_pci_base(pec);
+
+        pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
+        pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
+
+        for (j = 0; j < pec->num_stacks && phb_id < chip->num_phbs;
+             j++, phb_id++) {
+            PnvPhb4PecStack *stack = &pec->stacks[j];
+            Object *obj = OBJECT(&stack->phb);
+
+            object_property_set_int(obj, "index", phb_id, &error_fatal);
+            object_property_set_int(obj, "chip-id", chip->chip_id,
+                                    &error_fatal);
+            object_property_set_int(obj, "version", PNV_PHB5_VERSION,
+                                    &error_fatal);
+            object_property_set_int(obj,  "device-id", PNV_PHB5_DEVICE_ID,
+                                    &error_fatal);
+            object_property_set_link(obj, "stack", OBJECT(stack), &error_abort);
+            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
+                return;
+            }
+
+            /* Populate the XSCOM address space. */
+            pnv_xscom_add_subregion(chip,
+                                   pec_nest_base + 0x40 * (stack->stack_no + 1),
+                                   &stack->nest_regs_mr);
+            pnv_xscom_add_subregion(chip,
+                                    pec_pci_base + 0x40 * (stack->stack_no + 1),
+                                    &stack->pci_regs_mr);
+            pnv_xscom_add_subregion(chip,
+                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                                    0x40 * stack->stack_no,
+                                    &stack->phb_regs_mr);
+        }
+    }
+}
+
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
 {
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
@@ -1708,6 +1794,13 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
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
 
 static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
@@ -1734,6 +1827,7 @@ static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
     k->xscom_core_base = pnv_chip_power10_xscom_core_base;
     k->xscom_pcba = pnv_chip_power10_xscom_pcba;
     dc->desc = "PowerNV Chip POWER10";
+    k->num_phbs = 6;
 
     device_class_set_parent_realize(dc, pnv_chip_power10_realize,
                                     &k->parent_realize);
-- 
2.31.1


