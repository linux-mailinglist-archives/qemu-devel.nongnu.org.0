Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092513FEECC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:37:40 +0200 (CEST)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmuR-0007WM-1I
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTe-0006lq-9i
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:58 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:58421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTR-0001wD-Fp
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 54D4C295F31;
 Thu,  2 Sep 2021 15:09:36 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045a2634fa-b711-461f-8bd3-00574141f9bc,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 09/20] ppc/pnv: Add a HOMER model to POWER10
Date: Thu, 2 Sep 2021 15:09:17 +0200
Message-ID: <20210902130928.528803-10-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9c08529a-1be9-4d9e-995e-94e9057fd6d6
X-Ovh-Tracer-Id: 14775747428900572067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h       | 10 ++++++
 include/hw/ppc/pnv_homer.h |  3 ++
 include/hw/ppc/pnv_xscom.h |  3 ++
 hw/ppc/pnv.c               | 20 ++++++++++++
 hw/ppc/pnv_homer.c         | 64 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index f44b9947d00e..3ea2d798eed1 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -128,6 +128,7 @@ struct Pnv10Chip {
     Pnv9Psi      psi;
     PnvLpcController lpc;
     PnvOCC       occ;
+    PnvHomer     homer;
 
     uint32_t     nr_quads;
     PnvQuad      *quads;
@@ -358,4 +359,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV10_XIVE2_END_SIZE        0x0000020000000000ull
 #define PNV10_XIVE2_END_BASE(chip)  PNV10_CHIP_BASE(chip, 0x0006060000000000ull)
 
+#define PNV10_OCC_COMMON_AREA_SIZE  0x0000000000800000ull
+#define PNV10_OCC_COMMON_AREA_BASE  0x300fff800000ull
+#define PNV10_OCC_SENSOR_BASE(chip) (PNV10_OCC_COMMON_AREA_BASE +       \
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
+
+#define PNV10_HOMER_SIZE              0x0000000000400000ull
+#define PNV10_HOMER_BASE(chip)                                           \
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
 
 struct PnvHomer {
     DeviceState parent;
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 75db33d46af6..7c7440de0c40 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -134,6 +134,9 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_OCC_BASE       PNV9_XSCOM_OCC_BASE
 #define PNV10_XSCOM_OCC_SIZE       PNV9_XSCOM_OCC_SIZE
 
+#define PNV10_XSCOM_PBA_BASE       0x01010CDA
+#define PNV10_XSCOM_PBA_SIZE       0x40
+
 #define PNV10_XSCOM_XIVE2_BASE     0x2010800
 #define PNV10_XSCOM_XIVE2_SIZE     0x400
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0de3027b7122..d510d2e1d917 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1621,6 +1621,7 @@ static void pnv_chip_power10_instance_init(Object *obj)
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
+    object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOMER);
 
     for (i = 0; i < PNV10_CHIP_MAX_PEC; i++) {
         object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
@@ -1795,6 +1796,25 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
     pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
                             &chip10->occ.xscom_regs);
 
+    /* OCC SRAM model */
+    memory_region_add_subregion(get_system_memory(),
+                                PNV10_OCC_SENSOR_BASE(chip),
+                                &chip10->occ.sram_regs);
+
+    /* HOMER */
+    object_property_set_link(OBJECT(&chip10->homer), "chip", OBJECT(chip),
+                             &error_abort);
+    if (!qdev_realize(DEVICE(&chip10->homer), NULL, errp)) {
+        return;
+    }
+    /* Homer Xscom region */
+    pnv_xscom_add_subregion(chip, PNV10_XSCOM_PBA_BASE,
+                            &chip10->homer.pba_regs);
+
+    /* Homer mmio region */
+    memory_region_add_subregion(get_system_memory(), PNV10_HOMER_BASE(chip),
+                                &chip10->homer.regs);
+
     /* PHBs */
     pnv_chip_power10_phb_realize(chip, &local_err);
     if (local_err) {
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index 9a262629b73a..ea73919e54ca 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -332,6 +332,69 @@ static const TypeInfo pnv_homer_power9_type_info = {
     .class_init    = pnv_homer_power9_class_init,
 };
 
+static uint64_t pnv_homer_power10_pba_read(void *opaque, hwaddr addr,
+                                          unsigned size)
+{
+    PnvHomer *homer = PNV_HOMER(opaque);
+    PnvChip *chip = homer->chip;
+    uint32_t reg = addr >> 3;
+    uint64_t val = 0;
+
+    switch (reg) {
+    case PBA_BAR0:
+        val = PNV10_HOMER_BASE(chip);
+        break;
+    case PBA_BARMASK0: /* P10 homer region mask */
+        val = (PNV10_HOMER_SIZE - 1) & 0x300000;
+        break;
+    case PBA_BAR2: /* P10 occ common area */
+        val = PNV10_OCC_COMMON_AREA_BASE;
+        break;
+    case PBA_BARMASK2: /* P10 occ common area size */
+        val = (PNV10_OCC_COMMON_AREA_SIZE - 1) & 0x700000;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "PBA: read to unimplemented register: Ox%"
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
+static const MemoryRegionOps pnv_homer_power10_pba_ops = {
+    .read = pnv_homer_power10_pba_read,
+    .write = pnv_homer_power10_pba_write,
+    .valid.min_access_size = 8,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void pnv_homer_power10_class_init(ObjectClass *klass, void *data)
+{
+    PnvHomerClass *homer = PNV_HOMER_CLASS(klass);
+
+    homer->pba_size = PNV10_XSCOM_PBA_SIZE;
+    homer->pba_ops = &pnv_homer_power10_pba_ops;
+    homer->homer_size = PNV10_HOMER_SIZE;
+    homer->homer_ops = &pnv_power9_homer_ops; /* TODO */
+    homer->core_max_base = PNV9_CORE_MAX_BASE;
+}
+
+static const TypeInfo pnv_homer_power10_type_info = {
+    .name          = TYPE_PNV10_HOMER,
+    .parent        = TYPE_PNV_HOMER,
+    .instance_size = sizeof(PnvHomer),
+    .class_init    = pnv_homer_power10_class_init,
+};
+
 static void pnv_homer_realize(DeviceState *dev, Error **errp)
 {
     PnvHomer *homer = PNV_HOMER(dev);
@@ -377,6 +440,7 @@ static void pnv_homer_register_types(void)
     type_register_static(&pnv_homer_type_info);
     type_register_static(&pnv_homer_power8_type_info);
     type_register_static(&pnv_homer_power9_type_info);
+    type_register_static(&pnv_homer_power10_type_info);
 }
 
 type_init(pnv_homer_register_types);
-- 
2.31.1


