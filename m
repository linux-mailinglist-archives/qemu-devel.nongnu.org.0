Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C66FA1CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 10:01:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmK-0007zv-Gf; Mon, 08 May 2023 03:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmG-0007xx-T1; Mon, 08 May 2023 03:59:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmD-00016x-81; Mon, 08 May 2023 03:59:24 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDFy4n0wz4x4D;
 Mon,  8 May 2023 17:59:18 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDFv587vz4whj;
 Mon,  8 May 2023 17:59:15 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH 03/12] aspeed: Use the boot_rom region of the fby35 machine
Date: Mon,  8 May 2023 09:58:50 +0200
Message-Id: <20230508075859.3326566-4-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This change completes commits 5aa281d757 ("aspeed: Introduce a
spi_boot region under the SoC") and 8b744a6a47 ("aspeed: Add a
boot_rom overlap region in the SoC spi_boot container") which
introduced a spi_boot container at the SoC level to map the boot rom
region as an overlap.

It also fixes a Coverity report (CID 1508061) for a memory leak
warning when the QEMU process exits by using an bmc_boot_rom
MemoryRegion available at the machine level.

Cc: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index f4600c290b..f2ff6c1abf 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -70,8 +70,6 @@ static void fby35_bmc_write_boot_rom(DriveInfo *dinfo, MemoryRegion *mr,
 
 static void fby35_bmc_init(Fby35State *s)
 {
-    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
-
     object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
 
     memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
@@ -95,18 +93,21 @@ static void fby35_bmc_init(Fby35State *s)
     aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
 
     /* Install first FMC flash content as a boot rom. */
-    if (drive0) {
-        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
-        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
-        uint64_t size = memory_region_size(&fl->mmio);
-
-        if (!s->mmio_exec) {
-            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
-                                   size, &error_abort);
-            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-                                        boot_rom);
-            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
-                                     size, &error_abort);
+    if (!s->mmio_exec) {
+        DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);
+
+        if (mtd0) {
+            AspeedSoCState *bmc = &s->bmc;
+            uint64_t rom_size = memory_region_size(&bmc->spi_boot);
+
+            memory_region_init_rom(&s->bmc_boot_rom, NULL, "aspeed.boot_rom",
+                                   rom_size, &error_abort);
+            memory_region_add_subregion_overlap(&bmc->spi_boot_container, 0,
+                                                &s->bmc_boot_rom, 1);
+
+            fby35_bmc_write_boot_rom(mtd0, &s->bmc_boot_rom,
+                                     FBY35_BMC_FIRMWARE_ADDR,
+                                     rom_size, &error_abort);
         }
     }
 }
-- 
2.40.0


