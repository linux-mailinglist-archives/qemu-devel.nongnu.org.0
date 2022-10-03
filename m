Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD05F3779
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:08:11 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSfa-00014r-CE
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRok-00055o-RK; Mon, 03 Oct 2022 16:13:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoh-00010H-S7; Mon, 03 Oct 2022 16:13:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 439EC75A156;
 Mon,  3 Oct 2022 22:13:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24FE5746324; Mon,  3 Oct 2022 22:13:19 +0200 (CEST)
Message-Id: <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 05/13] mac_{old|new}world: Simplify cmdline_base calculation
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:19 +0200 (CEST)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


