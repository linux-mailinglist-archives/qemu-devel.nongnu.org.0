Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446C34F700
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 04:53:16 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRQyo-0004W8-V7
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 22:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1lRQxg-0003zW-1h; Tue, 30 Mar 2021 22:52:04 -0400
Received: from ozlabs.ru ([107.174.27.60]:58200)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1lRQxc-0004QH-Pr; Tue, 30 Mar 2021 22:52:03 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 67D10AE8002D;
 Tue, 30 Mar 2021 22:51:25 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] spapr: Rename RTAS_MAX_ADDR to FDT_MAX_ADDR
Date: Wed, 31 Mar 2021 13:51:23 +1100
Message-Id: <20210331025123.29310-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SLOF instantiates RTAS since
744a928ccee9 ("spapr: Stop providing RTAS blob")
so the max address applies to the FDT only.

This renames the macro and fixes up the comment.

This should not cause any behavioral change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 73a06df3b1b1..1e18a0a62839 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -100,7 +100,7 @@
  *
  * We load our kernel at 4M, leaving space for SLOF initial image
  */
-#define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
+#define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
 #define FW_MAX_SIZE             0x400000
 #define FW_FILE_NAME            "slof.bin"
 #define FW_OVERHEAD             0x2800000
@@ -1617,11 +1617,11 @@ static void spapr_machine_reset(MachineState *machine)
     spapr_clear_pending_events(spapr);
 
     /*
-     * We place the device tree and RTAS just below either the top of the RMA,
+     * We place the device tree just below either the top of the RMA,
      * or just below 2GB, whichever is lower, so that it can be
      * processed with 32-bit real mode code if necessary
      */
-    fdt_addr = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
+    fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
 
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
 
@@ -2694,7 +2694,7 @@ static void spapr_machine_init(MachineState *machine)
     spapr->rma_size = spapr_rma_size(spapr, &error_fatal);
 
     /* Setup a load limit for the ramdisk leaving room for SLOF and FDT */
-    load_limit = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FW_OVERHEAD;
+    load_limit = MIN(spapr->rma_size, FDT_MAX_ADDR) - FW_OVERHEAD;
 
     /*
      * VSMT must be set in order to be able to compute VCPU ids, ie to
-- 
2.17.1


