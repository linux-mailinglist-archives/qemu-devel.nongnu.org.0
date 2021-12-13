Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642C472DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:47:07 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlfW-00021V-9H
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:47:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO8-0008GH-7T
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:08 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:56201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlO1-0000JM-BR
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:29:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2773A2164A;
 Mon, 13 Dec 2021 13:28:50 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 14:28:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f94e4152-b6ea-4644-9af1-cd74d6fa2988,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 07/19] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Date: Mon, 13 Dec 2021 14:28:18 +0100
Message-ID: <20211213132830.108372-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213132830.108372-1-clg@kaod.org>
References: <20211213132830.108372-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4c5fe693-e006-41ee-a05d-88428e8585da
X-Ovh-Tracer-Id: 5373357308946189094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER9 processor comes with 3 PHB4 PEC (PCI Express Controller) and
each PEC can have several PHBs :

  * PEC0 provides 1 PHB  (PHB0)
  * PEC1 provides 2 PHBs (PHB1 and PHB2)
  * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)

A num_pecs class attribute represents better the logic units of the
POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
This will ease adding support for user created devices.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ppc/pnv.h |  2 ++
 hw/ppc/pnv.c         | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index aa08d79d24de..c781525277db 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -53,6 +53,7 @@ struct PnvChip {
     PnvCore      **cores;
 
     uint32_t     num_phbs;
+    uint32_t     num_pecs;
 
     MemoryRegion xscom_mmio;
     MemoryRegion xscom;
@@ -136,6 +137,7 @@ struct PnvChipClass {
     uint64_t     chip_cfam_id;
     uint64_t     cores_mask;
     uint32_t     num_phbs;
+    uint32_t     num_pecs;
 
     DeviceRealize parent_realize;
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index cbc3f8ed62f7..cafe7aec9aab 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -667,7 +667,7 @@ static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
     pnv_xive_pic_print_info(&chip9->xive, mon);
     pnv_psi_pic_print_info(&chip9->psi, mon);
 
-    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
         for (j = 0; j < pec->num_stacks; j++) {
             pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
@@ -1344,15 +1344,13 @@ static void pnv_chip_power9_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
 
-    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    /* Number of PECs is the chip default */
+    chip->num_pecs = pcc->num_pecs;
+
+    for (i = 0; i < chip->num_pecs; i++) {
         object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
                                 TYPE_PNV_PHB4_PEC);
     }
-
-    /*
-     * Number of PHBs is the chip default
-     */
-    chip->num_phbs = pcc->num_phbs;
 }
 
 static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
@@ -1388,7 +1386,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
     int i, j;
     int phb_id = 0;
 
-    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
+    for (i = 0; i < chip->num_pecs; i++) {
         PnvPhb4PecState *pec = &chip9->pecs[i];
         PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
         uint32_t pec_nest_base;
@@ -1416,8 +1414,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
         pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
         pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
 
-        for (j = 0; j < pec->num_stacks && phb_id < chip->num_phbs;
-             j++, phb_id++) {
+        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
             PnvPhb4PecStack *stack = &pec->stacks[j];
             Object *obj = OBJECT(&stack->phb);
 
@@ -1573,7 +1570,7 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
     k->xscom_core_base = pnv_chip_power9_xscom_core_base;
     k->xscom_pcba = pnv_chip_power9_xscom_pcba;
     dc->desc = "PowerNV Chip POWER9";
-    k->num_phbs = 6;
+    k->num_pecs = PNV9_CHIP_MAX_PEC;
 
     device_class_set_parent_realize(dc, pnv_chip_power9_realize,
                                     &k->parent_realize);
-- 
2.31.1


