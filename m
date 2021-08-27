Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C03F94FE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:20:13 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW9i-0004rp-PQ
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW08-00012C-34; Fri, 27 Aug 2021 03:10:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59439 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW06-0007Ui-52; Fri, 27 Aug 2021 03:10:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ4z79z9sX3; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=oJqkuxymkVFuxT6RyacrO6nsJ3uNWjw7gEQDdmzwreo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o7ooeA1pah/4x0zxntOE3N5TpHxRUHOLEqaTzrq7FHpcy4PwuMdqSrCU0vF/HjNVW
 JjKfcFGrh2cQAIFjcoomXwKxVT41VQYUvff8NWjh863GdDEpq7ZDAY/Np6AV+8j8AZ
 GQFZ+NotTBshsgpsiToN/a1gPQGfk7c/oc38H7QY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/18] ppc/pnv: Use a simple incrementing index for the chip-id
Date: Fri, 27 Aug 2021 17:09:38 +1000
Message-Id: <20210827070946.219970-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

When the QEMU PowerNV machine was introduced, multi chip support
modeled a two socket system with dual chip modules as found on some P8
Tuleta systems (8286-42A). But this is hardly used and not relevant
for QEMU. Use a simple index instead.

With this change, we can now increase the max socket number to 16 as
found on high end systems.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-5-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c         | 11 ++++++-----
 include/hw/ppc/pnv.h | 33 +++++++--------------------------
 2 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index b122251d1a..025f01c557 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -809,9 +809,10 @@ static void pnv_init(MachineState *machine)
      * TODO: should we decide on how many chips we can create based
      * on #cores and Venice vs. Murano vs. Naples chip type etc...,
      */
-    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 4) {
+    if (!is_power_of_2(pnv->num_chips) || pnv->num_chips > 16) {
         error_report("invalid number of chips: '%d'", pnv->num_chips);
-        error_printf("Try '-smp sockets=N'. Valid values are : 1, 2 or 4.\n");
+        error_printf(
+            "Try '-smp sockets=N'. Valid values are : 1, 2, 4, 8 and 16.\n");
         exit(1);
     }
 
@@ -819,6 +820,7 @@ static void pnv_init(MachineState *machine)
     for (i = 0; i < pnv->num_chips; i++) {
         char chip_name[32];
         Object *chip = OBJECT(qdev_new(chip_typename));
+        int chip_id = i;
 
         pnv->chips[i] = PNV_CHIP(chip);
 
@@ -831,10 +833,9 @@ static void pnv_init(MachineState *machine)
                                     &error_fatal);
         }
 
-        snprintf(chip_name, sizeof(chip_name), "chip[%d]", PNV_CHIP_HWID(i));
+        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
-        object_property_set_int(chip, "chip-id", PNV_CHIP_HWID(i),
-                                &error_fatal);
+        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
         object_property_set_int(chip, "nr-cores", machine->smp.cores,
                                 &error_fatal);
         object_property_set_int(chip, "nr-threads", machine->smp.threads,
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 3fec7c87d8..aa08d79d24 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -174,25 +174,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER9,
 DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
                          TYPE_PNV_CHIP_POWER10)
 
-/*
- * This generates a HW chip id depending on an index, as found on a
- * two socket system with dual chip modules :
- *
- *    0x0, 0x1, 0x10, 0x11
- *
- * 4 chips should be the maximum
- *
- * TODO: use a machine property to define the chip ids
- */
-#define PNV_CHIP_HWID(i) ((((i) & 0x3e) << 3) | ((i) & 0x1))
-
-/*
- * Converts back a HW chip id to an index. This is useful to calculate
- * the MMIO addresses of some controllers which depend on the chip id.
- */
-#define PNV_CHIP_INDEX(chip)                                    \
-    (((chip)->chip_id >> 2) * 2 + ((chip)->chip_id & 0x3))
-
 PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
 
 #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
@@ -256,11 +237,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
 #define PNV_OCC_COMMON_AREA_BASE    0x7fff800000ull
 #define PNV_OCC_SENSOR_BASE(chip)   (PNV_OCC_COMMON_AREA_BASE + \
-    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
 
 #define PNV_HOMER_SIZE              0x0000000000400000ull
 #define PNV_HOMER_BASE(chip)                                            \
-    (0x7ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV_HOMER_SIZE)
+    (0x7ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV_HOMER_SIZE)
 
 
 /*
@@ -279,16 +260,16 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
  */
 #define PNV_ICP_SIZE         0x0000000000100000ull
 #define PNV_ICP_BASE(chip)                                              \
-    (0x0003ffff80000000ull + (uint64_t) PNV_CHIP_INDEX(chip) * PNV_ICP_SIZE)
+    (0x0003ffff80000000ull + (uint64_t) (chip)->chip_id * PNV_ICP_SIZE)
 
 
 #define PNV_PSIHB_SIZE       0x0000000000100000ull
 #define PNV_PSIHB_BASE(chip) \
-    (0x0003fffe80000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * PNV_PSIHB_SIZE)
+    (0x0003fffe80000000ull + (uint64_t)(chip)->chip_id * PNV_PSIHB_SIZE)
 
 #define PNV_PSIHB_FSP_SIZE   0x0000000100000000ull
 #define PNV_PSIHB_FSP_BASE(chip) \
-    (0x0003ffe000000000ull + (uint64_t)PNV_CHIP_INDEX(chip) * \
+    (0x0003ffe000000000ull + (uint64_t)(chip)->chip_id * \
      PNV_PSIHB_FSP_SIZE)
 
 /*
@@ -324,11 +305,11 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV9_OCC_COMMON_AREA_SIZE    0x0000000000800000ull
 #define PNV9_OCC_COMMON_AREA_BASE    0x203fff800000ull
 #define PNV9_OCC_SENSOR_BASE(chip)   (PNV9_OCC_COMMON_AREA_BASE +       \
-    PNV_OCC_SENSOR_DATA_BLOCK_BASE(PNV_CHIP_INDEX(chip)))
+    PNV_OCC_SENSOR_DATA_BLOCK_BASE((chip)->chip_id))
 
 #define PNV9_HOMER_SIZE              0x0000000000400000ull
 #define PNV9_HOMER_BASE(chip)                                           \
-    (0x203ffd800000ull + ((uint64_t)PNV_CHIP_INDEX(chip)) * PNV9_HOMER_SIZE)
+    (0x203ffd800000ull + ((uint64_t)(chip)->chip_id) * PNV9_HOMER_SIZE)
 
 /*
  * POWER10 MMIO base addresses - 16TB stride per chip
-- 
2.31.1


