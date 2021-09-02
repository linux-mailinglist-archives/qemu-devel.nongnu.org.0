Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155033FEE9B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:24:47 +0200 (CEST)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmhy-0008NE-5z
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTd-0006iP-CH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:57 -0400
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:53767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLmTR-0001vv-Bn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 77F23295EFF;
 Thu,  2 Sep 2021 15:09:35 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 15:09:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d942538e-08bd-42be-aab0-46f35bbe3e08,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 07/20] ppc/pnv: Add POWER10 quads
Date: Thu, 2 Sep 2021 15:09:15 +0200
Message-ID: <20210902130928.528803-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902130928.528803-1-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: efb2f6b4-27bb-40de-a557-eca6093dcc5e
X-Ovh-Tracer-Id: 14775747428112436131
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

and use a pnv_chip_power10_quad_realize() helper to avoid code
duplication with P9. This still needs some refinements on the XSCOM
registers handling in PnvQuad.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 v2: rebased on previous changes adding 'quad-id'
 
 include/hw/ppc/pnv.h |  3 +++
 hw/ppc/pnv.c         | 50 +++++++++++++++++++++++++++++++++++---------
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index a299fbc7f25c..13495423283a 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -128,6 +128,9 @@ struct Pnv10Chip {
     Pnv9Psi      psi;
     PnvLpcController lpc;
     PnvOCC       occ;
+
+    uint32_t     nr_quads;
+    PnvQuad      *quads;
 };
 
 #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index a186df3fee41..5c342e313329 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1370,6 +1370,21 @@ static void pnv_chip_power9_instance_init(Object *obj)
     chip->num_phbs = pcc->num_phbs;
 }
 
+static void pnv_chip_quad_realize_one(PnvChip *chip, PnvQuad *eq,
+                                      PnvCore *pnv_core)
+{
+    char eq_name[32];
+    int core_id = CPU_CORE(pnv_core)->core_id;
+
+    snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
+    object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
+                                       sizeof(*eq), TYPE_PNV_QUAD,
+                                       &error_fatal, NULL);
+
+    object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal);
+    qdev_realize(DEVICE(eq), NULL, &error_fatal);
+}
+
 static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
 {
     PnvChip *chip = PNV_CHIP(chip9);
@@ -1379,18 +1394,9 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
     chip9->quads = g_new0(PnvQuad, chip9->nr_quads);
 
     for (i = 0; i < chip9->nr_quads; i++) {
-        char eq_name[32];
         PnvQuad *eq = &chip9->quads[i];
-        PnvCore *pnv_core = chip->cores[i * 4];
-        int core_id = CPU_CORE(pnv_core)->core_id;
-
-        snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
-        object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
-                                           sizeof(*eq), TYPE_PNV_QUAD,
-                                           &error_fatal, NULL);
 
-        object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal);
-        qdev_realize(DEVICE(eq), NULL, &error_fatal);
+        pnv_chip_quad_realize_one(chip, eq, chip->cores[i * 4]);
 
         pnv_xscom_add_subregion(chip, PNV9_XSCOM_EQ_BASE(eq->quad_id),
                                 &eq->xscom_regs);
@@ -1606,6 +1612,24 @@ static void pnv_chip_power10_instance_init(Object *obj)
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
 }
 
+static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
+{
+    PnvChip *chip = PNV_CHIP(chip10);
+    int i;
+
+    chip10->nr_quads = DIV_ROUND_UP(chip->nr_cores, 4);
+    chip10->quads = g_new0(PnvQuad, chip10->nr_quads);
+
+    for (i = 0; i < chip10->nr_quads; i++) {
+        PnvQuad *eq = &chip10->quads[i];
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
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
@@ -1627,6 +1651,12 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    pnv_chip_power10_quad_realize(chip10, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     /* XIVE2 interrupt controller (POWER10) */
     object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
                             PNV10_XIVE2_IC_BASE(chip), &error_fatal);
-- 
2.31.1


