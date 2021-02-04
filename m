Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E830F94F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:16:16 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iEp-0001wo-Ep
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7hg0-0000gf-8M
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:53798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7hft-0004X3-Go
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 708B6AF13;
 Thu,  4 Feb 2021 16:39:53 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v16 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h,
 keep a pointer in CPUClass
Date: Thu,  4 Feb 2021 17:39:23 +0100
Message-Id: <20210204163931.7358-16-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204163931.7358-1-cfontana@suse.de>
References: <20210204163931.7358-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

we cannot in principle make the TCG Operations field definitions
conditional on CONFIG_TCG in code that is included by both common_ss
and specific_ss modules.

Therefore, what we can do safely to restrict the TCG fields to TCG-only
builds, is to move all tcg cpu operations into a separate header file,
which is only included by TCG, target-specific code.

This leaves just a NULL pointer in the cpu.h for the non-TCG builds.

This also tidies up the code in all targets a bit, having all TCG cpu
operations neatly contained by a dedicated data struct.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/cpu.h           | 103 ++------------------------------
 include/hw/core/tcg-cpu-ops.h   |  97 ++++++++++++++++++++++++++++++
 target/arm/internals.h          |   6 ++
 accel/tcg/cpu-exec.c            |  27 +++++----
 accel/tcg/cputlb.c              |  35 +++++++++--
 accel/tcg/user-exec.c           |   9 +--
 hw/mips/jazz.c                  |   7 ++-
 softmmu/physmem.c               |  13 ++--
 target/alpha/cpu.c              |  21 +++++--
 target/arm/cpu.c                |  41 ++++++++-----
 target/arm/cpu64.c              |   7 +--
 target/arm/cpu_tcg.c            |  28 +++++++--
 target/avr/cpu.c                |  19 ++++--
 target/avr/helper.c             |   5 +-
 target/cris/cpu.c               |  43 ++++++++-----
 target/cris/helper.c            |   5 +-
 target/hppa/cpu.c               |  22 ++++---
 target/i386/tcg/tcg-cpu.c       |  28 +++++----
 target/lm32/cpu.c               |  19 ++++--
 target/m68k/cpu.c               |  19 ++++--
 target/microblaze/cpu.c         |  25 +++++---
 target/mips/cpu.c               |  36 +++++++----
 target/moxie/cpu.c              |  15 ++++-
 target/nios2/cpu.c              |  18 ++++--
 target/openrisc/cpu.c           |  17 ++++--
 target/riscv/cpu.c              |  23 ++++---
 target/rx/cpu.c                 |  20 +++++--
 target/s390x/cpu.c              |  33 ++++++----
 target/sh4/cpu.c                |  21 +++++--
 target/sparc/cpu.c              |  25 +++++---
 target/tilegx/cpu.c             |  17 ++++--
 target/tricore/cpu.c            |  12 +++-
 target/unicore32/cpu.c          |  17 ++++--
 target/xtensa/cpu.c             |  23 ++++---
 target/ppc/translate_init.c.inc |  33 ++++++----
 MAINTAINERS                     |   1 +
 36 files changed, 583 insertions(+), 307 deletions(-)
 create mode 100644 include/hw/core/tcg-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e76a49754d..4f6c6b18c9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -76,78 +76,8 @@ typedef struct CPUWatchpoint CPUWatchpoint;
 
 struct TranslationBlock;
 
-/**
- * struct TcgCpuOperations: TCG operations specific to a CPU class
- */
-typedef struct TcgCpuOperations {
-    /**
-     * @initialize: Initalize TCG state
-     *
-     * Called when the first CPU is realized.
-     */
-    void (*initialize)(void);
-    /**
-     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
-     *
-     * This is called when we abandon execution of a TB before starting it,
-     * and must set all parts of the CPU state which the previous TB in the
-     * chain may not have updated.
-     * By default, when this is NULL, a call is made to @set_pc(tb->pc).
-     *
-     * If more state needs to be restored, the target must implement a
-     * function to restore all the state, and register it here.
-     */
-    void (*synchronize_from_tb)(CPUState *cpu,
-                                const struct TranslationBlock *tb);
-    /** @cpu_exec_enter: Callback for cpu_exec preparation */
-    void (*cpu_exec_enter)(CPUState *cpu);
-    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
-    void (*cpu_exec_exit)(CPUState *cpu);
-    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
-    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
-    /** @do_interrupt: Callback for interrupt handling. */
-    void (*do_interrupt)(CPUState *cpu);
-    /**
-     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
-     *
-     * For system mode, if the access is valid, call tlb_set_page
-     * and return true; if the access is invalid, and probe is
-     * true, return false; otherwise raise an exception and do
-     * not return.  For user-only mode, always raise an exception
-     * and do not return.
-     */
-    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
-    /** @debug_excp_handler: Callback for handling debug exceptions */
-    void (*debug_excp_handler)(CPUState *cpu);
-
-    /**
-     * @do_transaction_failed: Callback for handling failed memory transactions
-     * (ie bus faults or external aborts; not MMU faults)
-     */
-    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
-                                  unsigned size, MMUAccessType access_type,
-                                  int mmu_idx, MemTxAttrs attrs,
-                                  MemTxResult response, uintptr_t retaddr);
-    /**
-     * @do_unaligned_access: Callback for unaligned access handling
-     */
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
-    /**
-     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
-     */
-    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
-
-    /**
-     * @debug_check_watchpoint: return true if the architectural
-     * watchpoint whose address has matched should really fire, used by ARM
-     */
-    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
-
-} TcgCpuOperations;
+/* see tcg-cpu-ops.h */
+struct TCGCPUOps;
 
 /**
  * CPUClass:
@@ -258,7 +188,8 @@ struct CPUClass {
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
 
-    TcgCpuOperations tcg_ops;
+    /* when TCG is not available, this pointer is NULL */
+    struct TCGCPUOps *tcg_ops;
 };
 
 /*
@@ -889,32 +820,6 @@ CPUState *cpu_by_arch_id(int64_t id);
 
 void cpu_interrupt(CPUState *cpu, int mask);
 
-static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                        MMUAccessType access_type,
-                                        int mmu_idx, uintptr_t retaddr)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops.do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
-}
-
-static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
-                                          vaddr addr, unsigned size,
-                                          MMUAccessType access_type,
-                                          int mmu_idx, MemTxAttrs attrs,
-                                          MemTxResult response,
-                                          uintptr_t retaddr)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cpu->ignore_memory_transaction_failures &&
-        cc->tcg_ops.do_transaction_failed) {
-        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size,
-                                          access_type, mmu_idx, attrs,
-                                          response, retaddr);
-    }
-}
-
 /**
  * cpu_set_pc:
  * @cpu: The CPU to set the program counter for.
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
new file mode 100644
index 0000000000..ccc97d1894
--- /dev/null
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -0,0 +1,97 @@
+/*
+ * TCG CPU-specific operations
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TCG_CPU_OPS_H
+#define TCG_CPU_OPS_H
+
+#include "hw/core/cpu.h"
+
+struct TCGCPUOps {
+    /**
+     * @initialize: Initalize TCG state
+     *
+     * Called when the first CPU is realized.
+     */
+    void (*initialize)(void);
+    /**
+     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBlock
+     *
+     * This is called when we abandon execution of a TB before starting it,
+     * and must set all parts of the CPU state which the previous TB in the
+     * chain may not have updated.
+     * By default, when this is NULL, a call is made to @set_pc(tb->pc).
+     *
+     * If more state needs to be restored, the target must implement a
+     * function to restore all the state, and register it here.
+     */
+    void (*synchronize_from_tb)(CPUState *cpu,
+                                const struct TranslationBlock *tb);
+    /** @cpu_exec_enter: Callback for cpu_exec preparation */
+    void (*cpu_exec_enter)(CPUState *cpu);
+    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
+    void (*cpu_exec_exit)(CPUState *cpu);
+    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+    /**
+     * @do_interrupt: Callback for interrupt handling.
+     *
+     * note that this is in general SOFTMMU only, but it actually isn't
+     * because of an x86 hack (accel/tcg/cpu-exec.c), so we cannot put it
+     * in the SOFTMMU section in general.
+     */
+    void (*do_interrupt)(CPUState *cpu);
+    /**
+     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
+     *
+     * For system mode, if the access is valid, call tlb_set_page
+     * and return true; if the access is invalid, and probe is
+     * true, return false; otherwise raise an exception and do
+     * not return.  For user-only mode, always raise an exception
+     * and do not return.
+     */
+    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
+                     MMUAccessType access_type, int mmu_idx,
+                     bool probe, uintptr_t retaddr);
+    /** @debug_excp_handler: Callback for handling debug exceptions */
+    void (*debug_excp_handler)(CPUState *cpu);
+
+#ifdef NEED_CPU_H
+#ifdef CONFIG_SOFTMMU
+    /**
+     * @do_transaction_failed: Callback for handling failed memory transactions
+     * (ie bus faults or external aborts; not MMU faults)
+     */
+    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
+                                  unsigned size, MMUAccessType access_type,
+                                  int mmu_idx, MemTxAttrs attrs,
+                                  MemTxResult response, uintptr_t retaddr);
+    /**
+     * @do_unaligned_access: Callback for unaligned access handling
+     */
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr);
+
+    /**
+     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
+     */
+    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
+
+    /**
+     * @debug_check_watchpoint: return true if the architectural
+     * watchpoint whose address has matched should really fire, used by ARM
+     */
+    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
+
+#endif /* CONFIG_SOFTMMU */
+#endif /* NEED_CPU_H */
+
+};
+
+#endif /* TCG_CPU_OPS_H */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 853fa88fd6..448982dd2f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -171,6 +171,12 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
+#ifdef CONFIG_TCG
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const struct TranslationBlock *tb);
+#endif /* CONFIG_TCG */
+
+
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 633ee3ef9e..d9ef69121c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
@@ -213,8 +214,8 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
                                TARGET_FMT_lx "] %s\n",
                                last_tb->tc.ptr, last_tb->pc,
                                lookup_symbol(last_tb->pc));
-        if (cc->tcg_ops.synchronize_from_tb) {
-            cc->tcg_ops.synchronize_from_tb(cpu, last_tb);
+        if (cc->tcg_ops->synchronize_from_tb) {
+            cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
             assert(cc->set_pc);
             cc->set_pc(cpu, last_tb->pc);
@@ -262,8 +263,8 @@ static void cpu_exec_enter(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->tcg_ops.cpu_exec_enter) {
-        cc->tcg_ops.cpu_exec_enter(cpu);
+    if (cc->tcg_ops->cpu_exec_enter) {
+        cc->tcg_ops->cpu_exec_enter(cpu);
     }
 }
 
@@ -271,8 +272,8 @@ static void cpu_exec_exit(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->tcg_ops.cpu_exec_exit) {
-        cc->tcg_ops.cpu_exec_exit(cpu);
+    if (cc->tcg_ops->cpu_exec_exit) {
+        cc->tcg_ops->cpu_exec_exit(cpu);
     }
 }
 
@@ -512,8 +513,8 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
         }
     }
 
-    if (cc->tcg_ops.debug_excp_handler) {
-        cc->tcg_ops.debug_excp_handler(cpu);
+    if (cc->tcg_ops->debug_excp_handler) {
+        cc->tcg_ops->debug_excp_handler(cpu);
     }
 }
 
@@ -547,7 +548,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->tcg_ops.do_interrupt(cpu);
+        cc->tcg_ops->do_interrupt(cpu);
 #endif
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
@@ -556,7 +557,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_exception()) {
             CPUClass *cc = CPU_GET_CLASS(cpu);
             qemu_mutex_lock_iothread();
-            cc->tcg_ops.do_interrupt(cpu);
+            cc->tcg_ops->do_interrupt(cpu);
             qemu_mutex_unlock_iothread();
             cpu->exception_index = -1;
 
@@ -655,8 +656,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
-            if (cc->tcg_ops.cpu_exec_interrupt &&
-                cc->tcg_ops.cpu_exec_interrupt(cpu, interrupt_request)) {
+            if (cc->tcg_ops->cpu_exec_interrupt &&
+                cc->tcg_ops->cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
                     replay_interrupt();
                 }
@@ -834,7 +835,7 @@ void tcg_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (!tcg_target_initialized) {
-        cc->tcg_ops.initialize();
+        cc->tcg_ops->initialize();
         tcg_target_initialized = true;
     }
     tlb_init(cpu);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b7717803b8..8a7b779270 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
@@ -1305,11 +1306,37 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
      * This is not a probe, so only valid return is success; failure
      * should result in exception + longjmp to the cpu loop.
      */
-    ok = cc->tcg_ops.tlb_fill(cpu, addr, size,
-                              access_type, mmu_idx, false, retaddr);
+    ok = cc->tcg_ops->tlb_fill(cpu, addr, size,
+                               access_type, mmu_idx, false, retaddr);
     assert(ok);
 }
 
+static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                                        MMUAccessType access_type,
+                                        int mmu_idx, uintptr_t retaddr)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+}
+
+static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
+                                          vaddr addr, unsigned size,
+                                          MMUAccessType access_type,
+                                          int mmu_idx, MemTxAttrs attrs,
+                                          MemTxResult response,
+                                          uintptr_t retaddr)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cpu->ignore_memory_transaction_failures &&
+        cc->tcg_ops->do_transaction_failed) {
+        cc->tcg_ops->do_transaction_failed(cpu, physaddr, addr, size,
+                                           access_type, mmu_idx, attrs,
+                                           response, retaddr);
+    }
+}
+
 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                          int mmu_idx, target_ulong addr, uintptr_t retaddr,
                          MMUAccessType access_type, MemOp op)
@@ -1577,8 +1604,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
             CPUState *cs = env_cpu(env);
             CPUClass *cc = CPU_GET_CLASS(cs);
 
-            if (!cc->tcg_ops.tlb_fill(cs, addr, fault_size, access_type,
-                                      mmu_idx, nonfault, retaddr)) {
+            if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
+                                       mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 return TLB_INVALID_MASK;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 9e6e188d19..0b6f56ca40 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
@@ -187,8 +188,8 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type,
-                         MMU_USER_IDX, false, pc);
+    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
+                          MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
 
@@ -218,8 +219,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
         } else {
             CPUState *cpu = env_cpu(env);
             CPUClass *cc = CPU_GET_CLASS(cpu);
-            cc->tcg_ops.tlb_fill(cpu, addr, fault_size, access_type,
-                                 MMU_USER_IDX, false, ra);
+            cc->tcg_ops->tlb_fill(cpu, addr, fault_size, access_type,
+                                  MMU_USER_IDX, false, ra);
             g_assert_not_reached();
         }
     }
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 46c71a0ac8..83c8086062 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -53,6 +53,9 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
 
 enum jazz_model_e {
     JAZZ_MAGNUM,
@@ -209,8 +212,8 @@ static void mips_jazz_init(MachineState *machine,
      */
     cc = CPU_GET_CLASS(cpu);
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    real_do_transaction_failed = cc->tcg_ops.do_transaction_failed;
-    cc->tcg_ops.do_transaction_failed = mips_jazz_do_transaction_failed;
+    real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
+    cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
     /* allocate RAM */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9e64cf7adf..243c3097d3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -24,6 +24,11 @@
 #include "qemu/cutils.h"
 #include "qemu/cacheflush.h"
 #include "cpu.h"
+
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
+
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
 #include "hw/qdev-core.h"
@@ -894,9 +899,9 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         return;
     }
 
-    if (cc->tcg_ops.adjust_watchpoint_address) {
+    if (cc->tcg_ops->adjust_watchpoint_address) {
         /* this is currently used only by ARM BE32 */
-        addr = cc->tcg_ops.adjust_watchpoint_address(cpu, addr, len);
+        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
     }
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
         if (watchpoint_address_matches(wp, addr, len)
@@ -917,8 +922,8 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
             wp->hitaddr = MAX(addr, wp->vaddr);
             wp->hitattrs = attrs;
             if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU && cc->tcg_ops.debug_check_watchpoint &&
-                    !cc->tcg_ops.debug_check_watchpoint(cpu, wp)) {
+                if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
+                    !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
                     wp->flags &= ~BP_WATCHPOINT_HIT;
                     continue;
                 }
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 0710298e5a..27192b62e2 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -206,6 +206,20 @@ static void alpha_cpu_initfn(Object *obj)
 #endif
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps alpha_tcg_ops = {
+    .initialize = alpha_translate_init,
+    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
+    .tlb_fill = alpha_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = alpha_cpu_do_interrupt,
+    .do_transaction_failed = alpha_cpu_do_transaction_failed,
+    .do_unaligned_access = alpha_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -217,22 +231,17 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
-    cc->tcg_ops.do_interrupt = alpha_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = alpha_cpu_exec_interrupt;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = alpha_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_transaction_failed = alpha_cpu_do_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = alpha_cpu_do_unaligned_access;
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
-    cc->tcg_ops.initialize = alpha_translate_init;
 
+    cc->tcg_ops = &alpha_tcg_ops;
     cc->gdb_num_core_regs = 67;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c9a66d3103..8ddb2556f8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -26,6 +26,9 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "cpu.h"
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
@@ -55,8 +58,8 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 }
 
 #ifdef CONFIG_TCG
-static void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                        const TranslationBlock *tb)
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const TranslationBlock *tb)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -590,7 +593,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cc->tcg_ops.do_interrupt(cs);
+    cc->tcg_ops->do_interrupt(cs);
     return true;
 }
 
@@ -2242,6 +2245,24 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
     return g_strdup("arm");
 }
 
+#ifdef CONFIG_TCG
+static struct TCGCPUOps arm_tcg_ops = {
+    .initialize = arm_translate_init,
+    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
+    .tlb_fill = arm_cpu_tlb_fill,
+    .debug_excp_handler = arm_debug_excp_handler,
+
+#if !defined(CONFIG_USER_ONLY)
+    .do_interrupt = arm_cpu_do_interrupt,
+    .do_transaction_failed = arm_cpu_do_transaction_failed,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
+    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
+    .debug_check_watchpoint = arm_debug_check_watchpoint,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2274,19 +2295,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
+
 #ifdef CONFIG_TCG
-    cc->tcg_ops.initialize = arm_translate_init;
-    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
-    cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
-    cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
-    cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
-#if !defined(CONFIG_USER_ONLY)
-    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
-    cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
-    cc->tcg_ops.adjust_watchpoint_address = arm_adjust_watchpoint_address;
-    cc->tcg_ops.debug_check_watchpoint = arm_debug_check_watchpoint;
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
+    cc->tcg_ops = &arm_tcg_ops;
 #endif /* CONFIG_TCG */
 }
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index a9a1cdb871..10c5118176 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,6 +21,9 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
 #include "qemu/module.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
@@ -805,10 +808,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-#ifdef CONFIG_TCG
-    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
-#endif /* CONFIG_TCG */
-
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 34;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d9c160f1ac..c29b434c60 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -10,6 +10,9 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
 #include "internals.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
@@ -34,7 +37,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cc->tcg_ops.do_interrupt(cs);
+        cc->tcg_ops->do_interrupt(cs);
         ret = true;
     }
     return ret;
@@ -660,6 +663,24 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
+#ifdef CONFIG_TCG
+static struct TCGCPUOps arm_v7m_tcg_ops = {
+    .initialize = arm_translate_init,
+    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
+    .tlb_fill = arm_cpu_tlb_fill,
+    .debug_excp_handler = arm_debug_excp_handler,
+
+#if !defined(CONFIG_USER_ONLY)
+    .do_interrupt = arm_v7m_cpu_do_interrupt,
+    .do_transaction_failed = arm_cpu_do_transaction_failed,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
+    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
+    .debug_check_watchpoint = arm_debug_check_watchpoint,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -667,10 +688,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
 #ifdef CONFIG_TCG
-    cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
-#ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_interrupt = arm_v7m_cpu_do_interrupt;
-#endif
+    cc->tcg_ops = &arm_v7m_tcg_ops;
 #endif /* CONFIG_TCG */
 
     cc->gdb_core_xml_file = "arm-m-profile.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 476e645b37..fa0f8e0e80 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -184,6 +184,19 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps avr_tcg_ops = {
+    .initialize = avr_cpu_tcg_init,
+    .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = avr_cpu_exec_interrupt,
+    .tlb_fill = avr_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = avr_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void avr_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -198,21 +211,17 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = avr_cpu_class_by_name;
 
     cc->has_work = avr_cpu_has_work;
-    cc->tcg_ops.do_interrupt = avr_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = avr_cpu_exec_interrupt;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->tcg_ops.tlb_fill = avr_cpu_tlb_fill;
     cc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
-    cc->tcg_ops.initialize = avr_cpu_tcg_init;
-    cc->tcg_ops.synchronize_from_tb = avr_cpu_synchronize_from_tb;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
+    cc->tcg_ops = &avr_tcg_ops;
 }
 
 /*
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 69d3b6181f..65880b9928 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
@@ -34,7 +35,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
-            cc->tcg_ops.do_interrupt(cs);
+            cc->tcg_ops->do_interrupt(cs);
 
             cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
 
@@ -45,7 +46,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
             int index = ctz32(env->intsrc);
             cs->exception_index = EXCP_INT(index);
-            cc->tcg_ops.do_interrupt(cs);
+            cc->tcg_ops->do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
             cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index b65743e8ca..ed983380fc 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -193,15 +193,36 @@ static void cris_cpu_initfn(Object *obj)
 #endif
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps crisv10_tcg_ops = {
+    .initialize = cris_initialize_crisv10_tcg,
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
+    .tlb_fill = cris_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = crisv10_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static struct TCGCPUOps crisv32_tcg_ops = {
+    .initialize = cris_initialize_tcg,
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
+    .tlb_fill = cris_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = cris_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void crisv8_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 8;
-    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops = &crisv10_tcg_ops;
 }
 
 static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
@@ -210,9 +231,8 @@ static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 9;
-    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops = &crisv10_tcg_ops;
 }
 
 static void crisv10_cpu_class_init(ObjectClass *oc, void *data)
@@ -221,9 +241,8 @@ static void crisv10_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 10;
-    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops = &crisv10_tcg_ops;
 }
 
 static void crisv11_cpu_class_init(ObjectClass *oc, void *data)
@@ -232,9 +251,8 @@ static void crisv11_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 11;
-    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops = &crisv10_tcg_ops;
 }
 
 static void crisv17_cpu_class_init(ObjectClass *oc, void *data)
@@ -243,16 +261,17 @@ static void crisv17_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 17;
-    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops = &crisv10_tcg_ops;
 }
 
 static void crisv32_cpu_class_init(ObjectClass *oc, void *data)
 {
+    CPUClass *cc = CPU_CLASS(oc);
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 32;
+    cc->tcg_ops = &crisv32_tcg_ops;
 }
 
 static void cris_cpu_class_init(ObjectClass *oc, void *data)
@@ -268,13 +287,10 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
-    cc->tcg_ops.do_interrupt = cris_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = cris_cpu_exec_interrupt;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = cris_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
@@ -284,7 +300,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 
     cc->disas_set_info = cris_disas_set_info;
-    cc->tcg_ops.initialize = cris_initialize_tcg;
 }
 
 #define DEFINE_CRIS_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 1f4d6f7d45..7e3bb58fe1 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "mmu.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
@@ -299,7 +300,7 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         && (env->pregs[PR_CCS] & I_FLAG)
         && !env->locked_irq) {
         cs->exception_index = EXCP_IRQ;
-        cc->tcg_ops.do_interrupt(cs);
+        cc->tcg_ops->do_interrupt(cs);
         ret = true;
     }
     if (interrupt_request & CPU_INTERRUPT_NMI) {
@@ -311,7 +312,7 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         }
         if ((env->pregs[PR_CCS] & m_flag_archval)) {
             cs->exception_index = EXCP_NMI;
-            cc->tcg_ops.do_interrupt(cs);
+            cc->tcg_ops->do_interrupt(cs);
             ret = true;
         }
     }
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index fd7f849a1c..d8fad52d1f 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -131,6 +131,20 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_HPPA_CPU);
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps hppa_tcg_ops = {
+    .initialize = hppa_translate_init,
+    .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
+    .tlb_fill = hppa_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = hppa_cpu_do_interrupt,
+    .do_unaligned_access = hppa_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -142,23 +156,17 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
-    cc->tcg_ops.do_interrupt = hppa_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = hppa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
-    cc->tcg_ops.do_unaligned_access = hppa_cpu_do_unaligned_access;
     dc->vmsd = &vmstate_hppa_cpu;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
-    cc->tcg_ops.initialize = hppa_translate_init;
-
     cc->gdb_num_core_regs = 128;
+    cc->tcg_ops = &hppa_tcg_ops;
 }
 
 static const TypeInfo hppa_cpu_type_info = {
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 4a53cd89e2..1e125d2175 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -57,16 +57,22 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.eip = tb->pc - tb->cs_base;
 }
 
-void tcg_cpu_common_class_init(CPUClass *cc)
-{
-    cc->tcg_ops.do_interrupt = x86_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = x86_cpu_exec_interrupt;
-    cc->tcg_ops.synchronize_from_tb = x86_cpu_synchronize_from_tb;
-    cc->tcg_ops.cpu_exec_enter = x86_cpu_exec_enter;
-    cc->tcg_ops.cpu_exec_exit = x86_cpu_exec_exit;
-    cc->tcg_ops.initialize = tcg_x86_init;
-    cc->tcg_ops.tlb_fill = x86_cpu_tlb_fill;
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps x86_tcg_ops = {
+    .initialize = tcg_x86_init,
+    .synchronize_from_tb = x86_cpu_synchronize_from_tb,
+    .cpu_exec_enter = x86_cpu_exec_enter,
+    .cpu_exec_exit = x86_cpu_exec_exit,
+    .cpu_exec_interrupt = x86_cpu_exec_interrupt,
+    .do_interrupt = x86_cpu_do_interrupt,
+    .tlb_fill = x86_cpu_tlb_fill,
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.debug_excp_handler = breakpoint_handler;
-#endif
+    .debug_excp_handler = breakpoint_handler,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+void tcg_cpu_common_class_init(CPUClass *cc)
+{
+    cc->tcg_ops = &x86_tcg_ops;
 }
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index fb3761b749..c23d72874c 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -210,6 +210,19 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps lm32_tcg_ops = {
+    .initialize = lm32_translate_init,
+    .cpu_exec_interrupt = lm32_cpu_exec_interrupt,
+    .tlb_fill = lm32_cpu_tlb_fill,
+    .debug_excp_handler = lm32_debug_excp_handler,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = lm32_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 {
     LM32CPUClass *lcc = LM32_CPU_CLASS(oc);
@@ -222,22 +235,18 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = lm32_cpu_class_by_name;
     cc->has_work = lm32_cpu_has_work;
-    cc->tcg_ops.do_interrupt = lm32_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = lm32_cpu_exec_interrupt;
     cc->dump_state = lm32_cpu_dump_state;
     cc->set_pc = lm32_cpu_set_pc;
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = lm32_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_lm32_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
-    cc->tcg_ops.debug_excp_handler = lm32_debug_excp_handler;
     cc->disas_set_info = lm32_cpu_disas_set_info;
-    cc->tcg_ops.initialize = lm32_translate_init;
+    cc->tcg_ops = &lm32_tcg_ops;
 }
 
 #define DEFINE_LM32_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index e68b933c84..c6fde8132b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -453,6 +453,19 @@ static const VMStateDescription vmstate_m68k_cpu = {
 };
 #endif
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps m68k_tcg_ops = {
+    .initialize = m68k_tcg_init,
+    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
+    .tlb_fill = m68k_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = m68k_cpu_do_interrupt,
+    .do_transaction_failed = m68k_cpu_transaction_failed,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void m68k_cpu_class_init(ObjectClass *c, void *data)
 {
     M68kCPUClass *mcc = M68K_CPU_CLASS(c);
@@ -465,22 +478,18 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-    cc->tcg_ops.do_interrupt = m68k_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = m68k_cpu_exec_interrupt;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = m68k_cpu_tlb_fill;
 #if defined(CONFIG_SOFTMMU)
-    cc->tcg_ops.do_transaction_failed = m68k_cpu_transaction_failed;
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
-    cc->tcg_ops.initialize = m68k_tcg_init;
 
     cc->gdb_num_core_regs = 18;
+    cc->tcg_ops = &m68k_tcg_ops;
 }
 
 static void m68k_cpu_class_init_cf_core(ObjectClass *c, void *data)
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 6678310f51..433ba20203 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -352,6 +352,21 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(TYPE_MICROBLAZE_CPU);
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps mb_tcg_ops = {
+    .initialize = mb_tcg_init,
+    .synchronize_from_tb = mb_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
+    .tlb_fill = mb_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = mb_cpu_do_interrupt,
+    .do_transaction_failed = mb_cpu_transaction_failed,
+    .do_unaligned_access = mb_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void mb_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -364,17 +379,13 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-    cc->tcg_ops.do_interrupt = mb_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
+
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = mb_cpu_synchronize_from_tb;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = mb_cpu_tlb_fill;
+
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_transaction_failed = mb_cpu_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
@@ -382,7 +393,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 32 + 27;
 
     cc->disas_set_info = mb_disas_set_info;
-    cc->tcg_ops.initialize = mb_tcg_init;
+    cc->tcg_ops = &mb_tcg_ops;
 }
 
 static const TypeInfo mb_cpu_type_info = {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1e93e295cc..ad163ead62 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -663,6 +663,26 @@ static Property mips_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+/*
+ * NB: cannot be const, as some elements are changed for specific
+ * mips hardware (see hw/mips/jazz.c).
+ */
+static struct TCGCPUOps mips_tcg_ops = {
+    .initialize = mips_tcg_init,
+    .synchronize_from_tb = mips_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
+    .tlb_fill = mips_cpu_tlb_fill,
+
+#if !defined(CONFIG_USER_ONLY)
+    .do_interrupt = mips_cpu_do_interrupt,
+    .do_transaction_failed = mips_cpu_do_transaction_failed,
+    .do_unaligned_access = mips_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void mips_cpu_class_init(ObjectClass *c, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
@@ -685,21 +705,11 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->vmsd = &vmstate_mips_cpu;
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
-#ifdef CONFIG_TCG
-    cc->tcg_ops.initialize = mips_tcg_init;
-    cc->tcg_ops.do_interrupt = mips_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
-    cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
-    cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
-#ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_transaction_failed = mips_cpu_do_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = mips_cpu_do_unaligned_access;
-
-#endif /* CONFIG_USER_ONLY */
-#endif /* CONFIG_TCG */
-
     cc->gdb_num_core_regs = 73;
     cc->gdb_stop_before_watchpoint = true;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &mips_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 static const TypeInfo mips_cpu_type_info = {
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 36bef4d357..83bec34d36 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -94,6 +94,17 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps moxie_tcg_ops = {
+    .initialize = moxie_translate_init,
+    .tlb_fill = moxie_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = moxie_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void moxie_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -107,16 +118,14 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = moxie_cpu_class_by_name;
 
     cc->has_work = moxie_cpu_has_work;
-    cc->tcg_ops.do_interrupt = moxie_cpu_do_interrupt;
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
-    cc->tcg_ops.tlb_fill = moxie_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
-    cc->tcg_ops.initialize = moxie_translate_init;
+    cc->tcg_ops = &moxie_tcg_ops;
 }
 
 static void moxielite_initfn(Object *obj)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index c43aa3d4c4..e9c9fc3a38 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -207,6 +207,18 @@ static Property nios2_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps nios2_tcg_ops = {
+    .initialize = nios2_tcg_init,
+    .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
+    .tlb_fill = nios2_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = nios2_cpu_do_interrupt,
+    .do_unaligned_access = nios2_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
 
 static void nios2_cpu_class_init(ObjectClass *oc, void *data)
 {
@@ -221,20 +233,16 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-    cc->tcg_ops.do_interrupt = nios2_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = nios2_cpu_exec_interrupt;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-    cc->tcg_ops.tlb_fill = nios2_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_unaligned_access = nios2_cpu_do_unaligned_access;
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 49;
-    cc->tcg_ops.initialize = nios2_tcg_init;
+    cc->tcg_ops = &nios2_tcg_ops;
 }
 
 static const TypeInfo nios2_cpu_type_info = {
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 1a31f7564f..2c64842f46 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -174,6 +174,18 @@ static void openrisc_any_initfn(Object *obj)
                       | (IMMUCFGR_NTS & (ctz32(TLB_SIZE) << 2));
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps openrisc_tcg_ops = {
+    .initialize = openrisc_translate_init,
+    .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
+    .tlb_fill = openrisc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = openrisc_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 {
     OpenRISCCPUClass *occ = OPENRISC_CPU_CLASS(oc);
@@ -186,20 +198,17 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-    cc->tcg_ops.do_interrupt = openrisc_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = openrisc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
-    cc->tcg_ops.initialize = openrisc_translate_init;
     cc->disas_set_info = openrisc_disas_set_info;
+    cc->tcg_ops = &openrisc_tcg_ops;
 }
 
 /* Sort alphabetically by type name, except for "any". */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e85fd58b6..16f1a34238 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -580,6 +580,21 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     return NULL;
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps riscv_tcg_ops = {
+    .initialize = riscv_translate_init,
+    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
+    .tlb_fill = riscv_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = riscv_cpu_do_interrupt,
+    .do_transaction_failed = riscv_cpu_do_transaction_failed,
+    .do_unaligned_access = riscv_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -593,11 +608,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-    cc->tcg_ops.do_interrupt = riscv_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = riscv_cpu_synchronize_from_tb;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 33;
@@ -609,16 +621,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_transaction_failed = riscv_cpu_do_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-    cc->tcg_ops.initialize = riscv_translate_init;
-    cc->tcg_ops.tlb_fill = riscv_cpu_tlb_fill;
+    cc->tcg_ops = &riscv_tcg_ops;
 
     device_class_set_props(dc, riscv_cpu_properties);
 }
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index e79f009cbd..7ac6618b26 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -173,6 +173,19 @@ static void rx_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps rx_tcg_ops = {
+    .initialize = rx_translate_init,
+    .synchronize_from_tb = rx_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
+    .tlb_fill = rx_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = rx_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void rx_cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -186,20 +199,17 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-    cc->tcg_ops.do_interrupt = rx_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = rx_cpu_synchronize_from_tb;
+
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
-    cc->tcg_ops.initialize = rx_translate_init;
-    cc->tcg_ops.tlb_fill = rx_cpu_tlb_fill;
 
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
+    cc->tcg_ops = &rx_tcg_ops;
 }
 
 static const TypeInfo rx_cpu_info = {
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index a723ede8d1..d35eb39a1b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -477,6 +477,22 @@ static void s390_cpu_reset_full(DeviceState *dev)
     return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
 }
 
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps s390_tcg_ops = {
+    .initialize = s390x_translate_init,
+    .tlb_fill = s390_cpu_tlb_fill,
+
+#if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = s390_cpu_exec_interrupt,
+    .do_interrupt = s390_cpu_do_interrupt,
+    .debug_excp_handler = s390x_cpu_debug_excp_handler,
+    .do_unaligned_access = s390x_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void s390_cpu_class_init(ObjectClass *oc, void *data)
 {
     S390CPUClass *scc = S390_CPU_CLASS(oc);
@@ -495,9 +511,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
-#ifdef CONFIG_TCG
-    cc->tcg_ops.do_interrupt = s390_cpu_do_interrupt;
-#endif
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
@@ -507,23 +520,17 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_s390_cpu;
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
-#ifdef CONFIG_TCG
-    cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
-    cc->tcg_ops.debug_excp_handler = s390x_cpu_debug_excp_handler;
-    cc->tcg_ops.do_unaligned_access = s390x_cpu_do_unaligned_access;
-#endif
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-#ifdef CONFIG_TCG
-    cc->tcg_ops.initialize = s390x_translate_init;
-    cc->tcg_ops.tlb_fill = s390_cpu_tlb_fill;
-#endif
-
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 
     s390_cpu_model_class_register_props(oc);
+
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &s390_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 static const TypeInfo s390_cpu_type_info = {
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 292152b562..a78d283bc8 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -206,6 +206,20 @@ static const VMStateDescription vmstate_sh_cpu = {
     .unmigratable = 1,
 };
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps superh_tcg_ops = {
+    .initialize = sh4_translate_init,
+    .synchronize_from_tb = superh_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
+    .tlb_fill = superh_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = superh_cpu_do_interrupt,
+    .do_unaligned_access = superh_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void superh_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -219,24 +233,19 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-    cc->tcg_ops.do_interrupt = superh_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = superh_cpu_synchronize_from_tb;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = superh_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_unaligned_access = superh_cpu_do_unaligned_access;
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
-    cc->tcg_ops.initialize = sh4_translate_init;
 
     cc->gdb_num_core_regs = 59;
 
     dc->vmsd = &vmstate_sh_cpu;
+    cc->tcg_ops = &superh_tcg_ops;
 }
 
 #define DEFINE_SUPERH_CPU_TYPE(type_name, cinit, initfn) \
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1b785f60df..aece2c7dc8 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -848,6 +848,23 @@ static Property sparc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps sparc_tcg_ops = {
+    .initialize = sparc_tcg_init,
+    .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
+    .tlb_fill = sparc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = sparc_cpu_do_interrupt,
+    .do_transaction_failed = sparc_cpu_do_transaction_failed,
+    .do_unaligned_access = sparc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
@@ -863,31 +880,25 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
-    cc->tcg_ops.do_interrupt = sparc_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = sparc_cpu_exec_interrupt;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
 #endif
     cc->set_pc = sparc_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = sparc_cpu_synchronize_from_tb;
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
-    cc->tcg_ops.tlb_fill = sparc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_transaction_failed = sparc_cpu_do_transaction_failed;
-    cc->tcg_ops.do_unaligned_access = sparc_cpu_do_unaligned_access;
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
-    cc->tcg_ops.initialize = sparc_tcg_init;
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
     cc->gdb_num_core_regs = 86;
 #else
     cc->gdb_num_core_regs = 72;
 #endif
+    cc->tcg_ops = &sparc_tcg_ops;
 }
 
 static const TypeInfo sparc_cpu_type_info = {
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 7d4ead4ef1..d969c2f133 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -134,6 +134,18 @@ static bool tilegx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps tilegx_tcg_ops = {
+    .initialize = tilegx_tcg_init,
+    .cpu_exec_interrupt = tilegx_cpu_exec_interrupt,
+    .tlb_fill = tilegx_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = tilegx_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -147,13 +159,10 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = tilegx_cpu_class_by_name;
     cc->has_work = tilegx_cpu_has_work;
-    cc->tcg_ops.do_interrupt = tilegx_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
-    cc->tcg_ops.tlb_fill = tilegx_cpu_tlb_fill;
     cc->gdb_num_core_regs = 0;
-    cc->tcg_ops.initialize = tilegx_tcg_init;
+    cc->tcg_ops = &tilegx_tcg_ops;
 }
 
 static const TypeInfo tilegx_cpu_type_info = {
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 9b21b640e2..0b1e139bcb 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -142,6 +142,14 @@ static void tc27x_initfn(Object *obj)
     set_feature(&cpu->env, TRICORE_FEATURE_161);
 }
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps tricore_tcg_ops = {
+    .initialize = tricore_tcg_init,
+    .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
+    .tlb_fill = tricore_cpu_tlb_fill,
+};
+
 static void tricore_cpu_class_init(ObjectClass *c, void *data)
 {
     TriCoreCPUClass *mcc = TRICORE_CPU_CLASS(c);
@@ -162,10 +170,8 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
-    cc->tcg_ops.synchronize_from_tb = tricore_cpu_synchronize_from_tb;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
-    cc->tcg_ops.initialize = tricore_tcg_init;
-    cc->tcg_ops.tlb_fill = tricore_cpu_tlb_fill;
+    cc->tcg_ops = &tricore_tcg_ops;
 }
 
 #define DEFINE_TRICORE_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index e27ffc571a..0258884f84 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -120,6 +120,18 @@ static const VMStateDescription vmstate_uc32_cpu = {
     .unmigratable = 1,
 };
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps uc32_tcg_ops = {
+    .initialize = uc32_translate_init,
+    .cpu_exec_interrupt = uc32_cpu_exec_interrupt,
+    .tlb_fill = uc32_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = uc32_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void uc32_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -131,14 +143,11 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = uc32_cpu_class_by_name;
     cc->has_work = uc32_cpu_has_work;
-    cc->tcg_ops.do_interrupt = uc32_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = uc32_cpu_exec_interrupt;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
-    cc->tcg_ops.tlb_fill = uc32_cpu_tlb_fill;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    cc->tcg_ops.initialize = uc32_translate_init;
     dc->vmsd = &vmstate_uc32_cpu;
+    cc->tcg_ops = &uc32_tcg_ops;
 }
 
 #define DEFINE_UNICORE32_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 4b6381569f..e2b2c7a71c 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -181,6 +181,21 @@ static const VMStateDescription vmstate_xtensa_cpu = {
     .unmigratable = 1,
 };
 
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps xtensa_tcg_ops = {
+    .initialize = xtensa_translate_init,
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
+    .tlb_fill = xtensa_cpu_tlb_fill,
+    .debug_excp_handler = xtensa_breakpoint_handler,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = xtensa_cpu_do_interrupt,
+    .do_transaction_failed = xtensa_cpu_do_transaction_failed,
+    .do_unaligned_access = xtensa_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
 static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -194,23 +209,17 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-    cc->tcg_ops.do_interrupt = xtensa_cpu_do_interrupt;
-    cc->tcg_ops.cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
-    cc->tcg_ops.tlb_fill = xtensa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.do_unaligned_access = xtensa_cpu_do_unaligned_access;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
-    cc->tcg_ops.do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
-    cc->tcg_ops.debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    cc->tcg_ops.initialize = xtensa_translate_init;
     dc->vmsd = &vmstate_xtensa_cpu;
+    cc->tcg_ops = &xtensa_tcg_ops;
 }
 
 static const TypeInfo xtensa_cpu_type_info = {
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 27ab243c6e..9867d0a6e4 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10827,6 +10827,23 @@ static Property ppc_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+#ifdef CONFIG_TCG
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps ppc_tcg_ops = {
+  .initialize = ppc_translate_init,
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+  .tlb_fill = ppc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+  .do_interrupt = ppc_cpu_do_interrupt,
+  .cpu_exec_enter = ppc_cpu_exec_enter,
+  .cpu_exec_exit = ppc_cpu_exec_exit,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+#endif /* CONFIG_TCG */
+
 static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
@@ -10878,21 +10895,13 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
-#ifdef CONFIG_TCG
-    cc->tcg_ops.initialize = ppc_translate_init;
-    cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
-    cc->tcg_ops.do_interrupt = ppc_cpu_do_interrupt;
-    cc->tcg_ops.tlb_fill = ppc_cpu_tlb_fill;
-#ifndef CONFIG_USER_ONLY
-    cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
-    cc->tcg_ops.cpu_exec_exit = ppc_cpu_exec_exit;
-    cc->tcg_ops.do_unaligned_access = ppc_cpu_do_unaligned_access;
-#endif /* !CONFIG_USER_ONLY */
-#endif /* CONFIG_TCG */
-
     cc->disas_set_info = ppc_disas_set_info;
 
     dc->fw_name = "PowerPC,UNKNOWN";
+
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &ppc_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 static const TypeInfo ppc_cpu_type_info = {
diff --git a/MAINTAINERS b/MAINTAINERS
index 00626941f1..c8559b34d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -129,6 +129,7 @@ F: include/exec/helper*.h
 F: include/exec/tb-hash.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
+F: include/hw/core/tcg-cpu-ops.h
 
 FPU emulation
 M: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.26.2


