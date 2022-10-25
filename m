Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472460D206
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:54:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN2m-0006X0-Ub; Tue, 25 Oct 2022 12:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2i-0006Th-IL; Tue, 25 Oct 2022 12:44:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1onN2g-0002Dr-Ot; Tue, 25 Oct 2022 12:44:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9C27675A151;
 Tue, 25 Oct 2022 18:44:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7CCF674632B; Tue, 25 Oct 2022 18:44:39 +0200 (CEST)
Message-Id: <01244597174bdc5f5610e2b4b5a71273a7bc8857.1666715145.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666715145.git.balaton@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v4 05/19] mac_{old|new}world: Simplify cmdline_base calculation
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 25 Oct 2022 18:44:39 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By slight reorganisation we can avoid an else branch and some code
duplication which makes it easier to follow the code.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 6 +++---
 hw/ppc/mac_oldworld.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 6bc3bd19be..73b01e8c6d 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -194,9 +194,11 @@ static void ppc_core99_init(MachineState *machine)
                          machine->kernel_filename);
             exit(1);
         }
+        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
+                                         KERNEL_GAP);
         /* load initrd */
         if (machine->initrd_filename) {
-            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
+            initrd_base = cmdline_base;
             initrd_size = load_image_targphys(machine->initrd_filename,
                                               initrd_base,
                                               machine->ram_size - initrd_base);
@@ -206,8 +208,6 @@ static void ppc_core99_init(MachineState *machine)
                 exit(1);
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
-        } else {
-            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index cb67e44081..b424729a39 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -168,10 +168,11 @@ static void ppc_heathrow_init(MachineState *machine)
                          machine->kernel_filename);
             exit(1);
         }
+        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
+                                         KERNEL_GAP);
         /* load initrd */
         if (machine->initrd_filename) {
-            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
-                                            KERNEL_GAP);
+            initrd_base = cmdline_base;
             initrd_size = load_image_targphys(machine->initrd_filename,
                                               initrd_base,
                                               machine->ram_size - initrd_base);
@@ -181,8 +182,6 @@ static void ppc_heathrow_init(MachineState *machine)
                 exit(1);
             }
             cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
-        } else {
-            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
         }
         ppc_boot_device = 'm';
     } else {
-- 
2.30.4


