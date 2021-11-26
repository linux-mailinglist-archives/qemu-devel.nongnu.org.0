Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D8945ED2F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 12:57:23 +0100 (CET)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqZr0-0007Uk-DF
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 06:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZnl-0003Nw-95
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:02 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:40039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqZng-0007SK-7b
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 06:54:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CF83C22449;
 Fri, 26 Nov 2021 11:53:54 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 12:53:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00647682893-e44a-4181-bc85-bab942868ce8,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v3 05/18] ppc/pnv: Add POWER10 quads
Date: Fri, 26 Nov 2021 12:53:36 +0100
Message-ID: <20211126115349.2737605-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211126115349.2737605-1-clg@kaod.org>
References: <20211126115349.2737605-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1ba6ce8e-9a76-4bb9-bd1d-6943cb396fb1
X-Ovh-Tracer-Id: 14614743744237767532
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
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

and use a pnv_chip_power10_quad_realize() helper to avoid code
duplication with P9. This still needs some refinements on the XSCOM
registers handling in PnvQuad.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
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


