Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24E30A535
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:19:28 +0100 (CET)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WIp-0002sW-Dj
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9H-0000m3-Rt
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:55710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W98-0005qO-Fs
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A355FB009;
 Mon,  1 Feb 2021 10:09:13 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 14/23] cpu: move debug_check_watchpoint to tcg_ops
Date: Mon,  1 Feb 2021 11:08:54 +0100
Message-Id: <20210201100903.17309-15-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit 568496c0c0f1 ("cpu: Add callback to check architectural") and
commit 3826121d9298 ("target-arm: Implement checking of fired")
introduced an ARM-specific hack for cpu_check_watchpoint.

Make debug_check_watchpoint optional, and move it to tcg_ops.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/cpu.h | 9 ++++++---
 accel/tcg/user-exec.c | 3 ++-
 hw/core/cpu.c         | 9 ---------
 softmmu/physmem.c     | 4 ++--
 target/arm/cpu.c      | 4 ++--
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e0a1a8feb5..b3e65a8dc3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -139,6 +139,12 @@ typedef struct TcgCpuOperations {
      */
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
 
+    /**
+     * @debug_check_watchpoint: return true if the architectural
+     * watchpoint whose address has matched should really fire, used by ARM
+     */
+    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
+
 } TcgCpuOperations;
 
 /**
@@ -175,8 +181,6 @@ typedef struct TcgCpuOperations {
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
- * @debug_check_watchpoint: Callback: return true if the architectural
- *       watchpoint whose address has matched should really fire.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
@@ -230,7 +234,6 @@ struct CPUClass {
     int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
-    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
                             int cpuid, void *opaque);
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 5509dd53e9..9e6e188d19 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -187,7 +187,8 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
+    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type,
+                         MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 3d5bf9fe02..00330ba07d 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -186,14 +186,6 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_debug_check_watchpoint(CPUState *cpu, CPUWatchpoint *wp)
-{
-    /* If no extra check is required, QEMU watchpoint match can be considered
-     * as an architectural match.
-     */
-    return true;
-}
-
 static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
 {
     return target_words_bigendian();
@@ -415,7 +407,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
-    k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index c5cf9b839e..e85059f9c6 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -917,8 +917,8 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU &&
-                    !cc->debug_check_watchpoint(cpu, wp)) {
+                if (wp->flags & BP_CPU && cc->tcg_ops.debug_check_watchpoint &&
+                    !cc->tcg_ops.debug_check_watchpoint(cpu, wp)) {
                     wp->flags &= ~BP_WATCHPOINT_HIT;
                     continue;
                 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2a14431065..c9a66d3103 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2280,12 +2280,12 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
     cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
-    cc->debug_check_watchpoint = arm_debug_check_watchpoint;
 #if !defined(CONFIG_USER_ONLY)
+    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
     cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->tcg_ops.adjust_watchpoint_address = arm_adjust_watchpoint_address;
-    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
+    cc->tcg_ops.debug_check_watchpoint = arm_debug_check_watchpoint;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 }
-- 
2.26.2


