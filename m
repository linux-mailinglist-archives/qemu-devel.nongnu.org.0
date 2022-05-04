Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864CC5197B9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:00:01 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm8zQ-0005oK-Cc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1nm8vK-00041Z-8g; Wed, 04 May 2022 02:55:46 -0400
Received: from ozlabs.ru ([107.174.27.60]:35066)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1nm8vH-0008VX-NQ; Wed, 04 May 2022 02:55:45 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 30DD580511;
 Wed,  4 May 2022 02:55:38 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH qemu] spapr: Use address from elf parser for kernel address
Date: Wed,  4 May 2022 16:55:36 +1000
Message-Id: <20220504065536.3534488-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.

QEMU loads the kernel at 0x400000 by default which works most of
the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
(position independent code). This works for a little endian zImage too.

However a big endian zImage is compiled without -pie, is 32bit, linked to
0x4000000 so current QEMU ends up loading it at
0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.

This uses the kernel address returned from load_elf().
If the default kernel_addr is used, there is no change in behavior (as
translate_kernel_address() takes care of this), which is:
LE/BE vmlinux and LE zImage boot, BE zImage does not.
If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
prints a warning and BE zImage boots.

Note #1: SLOF (x-vof=off) still cannot boot a big endian zImage as
SLOF enables MSR_SF for everything loaded by QEMU and this leads to early
crash of 32bit zImage.

Note #2: BE/LE vmlinux images set MSR_SF in early boot so these just work;
a LE zImage restores MSR_SF after every CI call and we are lucky enough
not to crash before the first CI call.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

We could probably change SLOF to always clear MSR_SF before jumping to
the kernel but this is 1) SLOF fix 2) not quite sure if it brings
lots of value.


I really wish I had this when tested this fix:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220406070038.3704604-1-aik@ozlabs.ru/

---
 hw/ppc/spapr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a4372ba1891e..89f18f6564bd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2971,14 +2971,16 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     if (kernel_filename) {
+        uint64_t loaded_addr = 0;
+
         spapr->kernel_size = load_elf(kernel_filename, NULL,
                                       translate_kernel_address, spapr,
-                                      NULL, NULL, NULL, NULL, 1,
+                                      NULL, &loaded_addr, NULL, NULL, 1,
                                       PPC_ELF_MACHINE, 0, 0);
         if (spapr->kernel_size == ELF_LOAD_WRONG_ENDIAN) {
             spapr->kernel_size = load_elf(kernel_filename, NULL,
                                           translate_kernel_address, spapr,
-                                          NULL, NULL, NULL, NULL, 0,
+                                          NULL, &loaded_addr, NULL, NULL, 0,
                                           PPC_ELF_MACHINE, 0, 0);
             spapr->kernel_le = spapr->kernel_size > 0;
         }
@@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
             exit(1);
         }
 
+        if (spapr->kernel_addr != loaded_addr) {
+            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
+                        spapr->kernel_addr, loaded_addr);
+            spapr->kernel_addr = loaded_addr;
+        }
+
         /* load initrd */
         if (initrd_filename) {
             /* Try to locate the initrd in the gap between the kernel
-- 
2.30.2


