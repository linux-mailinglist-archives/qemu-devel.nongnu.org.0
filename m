Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFB45EDA0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:11:00 +0100 (CET)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa4B-0004TZ-US
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnj-0003NR-IL
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:00 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:40375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnf-0007S2-Kb
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:53:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 462EF1FE11;
 Fri, 26 Nov 2021 11:53:54 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a58d055d-b5f0-4023-a8fd-fc83386813fc,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 04/18] ppc/pnv: Add a OCC model for POWER10
Date: Fri, 26 Nov 2021 12:53:35 +0100
Message-ID: <20211126115349.2737605-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 21eb8bcb-3c44-4f6a-92f3-131760968dbe
X-Ovh-Tracer-Id: 14614743744534842220
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

Our OCC model is very mininal and POWER10 can simply reuse the OCC
model we introduced for POWER9.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h       |  1 +
 include/hw/ppc/pnv_occ.h   |  2 ++
 include/hw/ppc/pnv_xscom.h |  3 +++
 hw/ppc/pnv.c               | 10 ++++++++++
 hw/ppc/pnv_occ.c           | 16 ++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index b773b09f9f8e..a299fbc7f25c 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -127,6 +127,7 @@ struct Pnv10Chip {
     PnvXive2     xive;
     Pnv9Psi      psi;
     PnvLpcController lpc;
+    PnvOCC       occ;
 };
 
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
 
 #define PNV_OCC_SENSOR_DATA_BLOCK_OFFSET 0x00580000
 #define PNV_OCC_SENSOR_DATA_BLOCK_SIZE   0x00025800
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 188da874a4b0..151df15378d1 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -131,6 +131,9 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
 #define PNV10_XSCOM_PSIHB_SIZE     0x100
 
+#define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
+#define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
+
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 4ec51e9157fd..a186df3fee41 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1603,6 +1603,7 @@ static void pnv_chip_power10_instance_init(Object *obj)
                               "xive-fabric");
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
+    object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
 }
 
 static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
@@ -1668,6 +1669,15 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     chip->fw_mr = &chip10->lpc.isa_fw;
     chip->dt_isa_nodename = g_strdup_printf("/lpcm-opb@%" PRIx64 "/lpc@0",
                                             (uint64_t) PNV10_LPCM_BASE(chip));
+
+    /* Create the simplified OCC model */
+    object_property_set_link(OBJECT(&chip10->occ), "psi", OBJECT(&chip10->psi),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&chip10->occ), NULL, errp)) {
+        return;
+    }
+    pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
+                            &chip10->occ.xscom_regs);
 }
 
 static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 5a716c256edc..4ed66f5e1fcc 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -236,7 +236,9 @@ static const MemoryRegionOps pnv_occ_power9_xscom_ops = {
 static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
 {
     PnvOCCClass *poc = PNV_OCC_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->desc = "PowerNV OCC Controller (POWER9)";
     poc->xscom_size = PNV9_XSCOM_OCC_SIZE;
     poc->xscom_ops = &pnv_occ_power9_xscom_ops;
     poc->psi_irq = PSIHB9_IRQ_OCC;
@@ -249,6 +251,19 @@ static const TypeInfo pnv_occ_power9_type_info = {
     .class_init    = pnv_occ_power9_class_init,
 };
 
+static void pnv_occ_power10_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "PowerNV OCC Controller (POWER10)";
+}
+
+static const TypeInfo pnv_occ_power10_type_info = {
+    .name          = TYPE_PNV10_OCC,
+    .parent        = TYPE_PNV9_OCC,
+    .class_init    = pnv_occ_power10_class_init,
+};
+
 static void pnv_occ_realize(DeviceState *dev, Error **errp)
 {
     PnvOCC *occ = PNV_OCC(dev);
@@ -297,6 +312,7 @@ static void pnv_occ_register_types(void)
     type_register_static(&pnv_occ_type_info);
     type_register_static(&pnv_occ_power8_type_info);
     type_register_static(&pnv_occ_power9_type_info);
+    type_register_static(&pnv_occ_power10_type_info);
 }
 
 type_init(pnv_occ_register_types);
-- 
2.31.1


