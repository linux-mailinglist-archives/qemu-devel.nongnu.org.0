Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5E4C0B9B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 06:19:50 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMk44-0001H4-AH
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 00:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMk2S-0000Zm-El
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 00:18:08 -0500
Received: from sysprogs.com ([45.79.83.98]:50388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@sysprogs.com>) id 1nMk2Q-0007me-7K
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 00:18:08 -0500
Received: from sys2 (unknown [174.1.100.17])
 by sysprogs.com (Postfix) with ESMTPSA id C0EFE11A357;
 Wed, 23 Feb 2022 05:18:02 +0000 (UTC)
From: "Ivan Shcherbakov" <ivan@sysprogs.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/3] whpx: Fixed incorrect CR8/TPR synchronization
Date: Tue, 22 Feb 2022 21:18:00 -0800
Message-ID: <010b01d82874$bb4ef160$31ecd420$@sysprogs.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdgodJjQ62o5CDAySZ+bPykfbXU2Lg==
Content-Language: en-us
Received-SPF: pass client-ip=45.79.83.98; envelope-from=ivan@sysprogs.com;
 helo=sysprogs.com
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
Cc: armbru@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the following error triggered when stopping and resuming a 64-bit
Linux kernel via gdb:

qemu-system-x86_64.exe: WHPX: Failed to set virtual processor context,
hr=c0350005

The previous logic for synchronizing the values did not take into account
that the lower 4 bits of
the CR8 register, containing the priority level, mapped to bits 7:4 of the
APIC.TPR register
(see section 10.8.6.1 of Volume 3 of Intel 64 and IA-32 Architectures
Software Developer's Manual).
The caused WHvSetVirtualProcessorRegisters() to fail with an error,
effectively preventing GDB from
changing the guest context.

Signed-off-by: Ivan Shcherbakov <ivan@sysprogs.com>
---
 target/i386/whpx/whpx-all.c | 49 +++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index edd4fafbdf..8a8b5d55d1 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,6 +256,28 @@ static int whpx_set_tsc(CPUState *cpu)
     return 0;
 }
 
+/*
+ * The CR8 register in the CPU is mapped to the TPR register of the APIC,
+ * however, they use a slightly different encoding. Specifically:
+ *
+ *     APIC.TPR[bits 7:4] = CR8[bits 3:0]
+ *
+ * This mechanism is described in section 10.8.6.1 of Volume 3 of Intel 64
+ * and IA-32 Architectures Software Developer's Manual.
+ *
+ * The functions below translate the value of CR8 to TPR and vice versa.
+ */
+
+static uint64_t whpx_apic_tpr_to_cr8(uint64_t tpr)
+{
+    return tpr >> 4;
+}
+
+static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
+{
+    return cr8 << 4;
+}
+
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
@@ -284,7 +306,7 @@ static void whpx_set_registers(CPUState *cpu, int level)
     v86 = (env->eflags & VM_MASK);
     r86 = !(env->cr[0] & CR0_PE_MASK);
 
-    vcpu->tpr = cpu_get_apic_tpr(x86_cpu->apic_state);
+    vcpu->tpr =
whpx_apic_tpr_to_cr8(cpu_get_apic_tpr(x86_cpu->apic_state));
     vcpu->apic_base = cpu_get_apic_base(x86_cpu->apic_state);
 
     idx = 0;
@@ -475,6 +497,17 @@ static void whpx_get_registers(CPUState *cpu)
                      hr);
     }
 
+    if (whpx_apic_in_platform()) {
+        /*
+         * Fetch the TPR value from the emulated APIC. It may get
overwritten
+         * below with the value from CR8 returned by
+         * WHvGetVirtualProcessorRegisters().
+         */
+        whpx_apic_get(x86_cpu->apic_state);
+        vcpu->tpr = whpx_apic_tpr_to_cr8(
+            cpu_get_apic_tpr(x86_cpu->apic_state));
+    }
+
     idx = 0;
 
     /* Indexes for first 16 registers match between HV and QEMU definitions
*/
@@ -521,8 +554,12 @@ static void whpx_get_registers(CPUState *cpu)
     assert(whpx_register_names[idx] == WHvX64RegisterCr8);
     tpr = vcxt.values[idx++].Reg64;
     if (tpr != vcpu->tpr) {
+        /*
+         * TPR value stored in the CR8 register doesn't match the one
fetched
+         * from the emulated APIC. Override the latter with the former.
+         */
         vcpu->tpr = tpr;
-        cpu_set_apic_tpr(x86_cpu->apic_state, tpr);
+        cpu_set_apic_tpr(x86_cpu->apic_state, whpx_cr8_to_apic_tpr(tpr));
     }
 
     /* 8 Debug Registers - Skipped */
@@ -600,10 +637,6 @@ static void whpx_get_registers(CPUState *cpu)
 
     assert(idx == RTL_NUMBER_OF(whpx_register_names));
 
-    if (whpx_apic_in_platform()) {
-        whpx_apic_get(x86_cpu->apic_state);
-    }
-
     x86_update_hflags(env);
 
     return;
@@ -865,7 +898,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
      }
 
     /* Sync the TPR to the CR8 if was modified during the intercept */
-    tpr = cpu_get_apic_tpr(x86_cpu->apic_state);
+    tpr = whpx_apic_tpr_to_cr8(cpu_get_apic_tpr(x86_cpu->apic_state));
     if (tpr != vcpu->tpr) {
         vcpu->tpr = tpr;
         reg_values[reg_count].Reg64 = tpr;
@@ -914,7 +947,7 @@ static void whpx_vcpu_post_run(CPUState *cpu)
     if (vcpu->tpr != tpr) {
         vcpu->tpr = tpr;
         qemu_mutex_lock_iothread();
-        cpu_set_apic_tpr(x86_cpu->apic_state, vcpu->tpr);
+        cpu_set_apic_tpr(x86_cpu->apic_state,
whpx_cr8_to_apic_tpr(vcpu->tpr));
         qemu_mutex_unlock_iothread();
     }
 
-- 
2.29.2.windows.3



