Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A73F953C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:37:43 +0200 (CEST)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWQi-0001eX-U6
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW06-00010D-7w; Fri, 27 Aug 2021 03:10:06 -0400
Received: from ozlabs.org ([203.11.71.1]:43297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW03-0007SS-B2; Fri, 27 Aug 2021 03:10:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ4JzYz9sXN; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=XVPxj0/btkA4Ln6DiLGWnRetjNEmPuBnsoCR5+DWPDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BEjsndPpa4nHVaAFw3ZUDurpLKrDIviYRexQmLyrMWCOw1VFgzXeLLELf2dcT58hA
 UZm3Dxf7baZp3gW1Uyd/o+8JPtO29muZEMHxX9R6ilwGBO9wdLY+KKLKfkiBHuZlI8
 qZWRZ4C1xgLaF7+8nEZaDfrKNwDjtWR/eEVYyk50=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/18] ppc/pnv: Distribute RAM among the chips
Date: Fri, 27 Aug 2021 17:09:39 +1000
Message-Id: <20210827070946.219970-12-david@gibson.dropbear.id.au>
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

But always give the first 1GB to chip 0 as skiboot requires it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809134547.689560-6-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 025f01c557..2f5358b70c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -710,6 +710,23 @@ static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
     pnv_psi_pic_print_info(&chip10->psi, mon);
 }
 
+/* Always give the first 1GB to chip 0 else we won't boot */
+static uint64_t pnv_chip_get_ram_size(PnvMachineState *pnv, int chip_id)
+{
+    MachineState *machine = MACHINE(pnv);
+    uint64_t ram_per_chip;
+
+    assert(machine->ram_size >= 1 * GiB);
+
+    ram_per_chip = machine->ram_size / pnv->num_chips;
+    if (ram_per_chip >= 1 * GiB) {
+        return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
+    }
+
+    ram_per_chip = (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1);
+    return chip_id == 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
+}
+
 static void pnv_init(MachineState *machine)
 {
     const char *bios_name = machine->firmware ?: FW_FILE_NAME;
@@ -717,6 +734,7 @@ static void pnv_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     char *fw_filename;
     long fw_size;
+    uint64_t chip_ram_start = 0;
     int i;
     char *chip_typename;
     DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
@@ -821,17 +839,16 @@ static void pnv_init(MachineState *machine)
         char chip_name[32];
         Object *chip = OBJECT(qdev_new(chip_typename));
         int chip_id = i;
+        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, chip_id);
 
         pnv->chips[i] = PNV_CHIP(chip);
 
-        /*
-         * TODO: put all the memory in one node on chip 0 until we find a
-         * way to specify different ranges for each chip
-         */
-        if (i == 0) {
-            object_property_set_int(chip, "ram-size", machine->ram_size,
-                                    &error_fatal);
-        }
+        /* Distribute RAM among the chips  */
+        object_property_set_int(chip, "ram-start", chip_ram_start,
+                                &error_fatal);
+        object_property_set_int(chip, "ram-size", chip_ram_size,
+                                &error_fatal);
+        chip_ram_start += chip_ram_size;
 
         snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
-- 
2.31.1


