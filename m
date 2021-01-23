Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A227301539
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 13:37:32 +0100 (CET)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3IAV-0007Wy-IZ
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 07:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Hxp-0003E0-U4
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:24:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:59314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l3Hxn-00073t-GT
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 07:24:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79B10AF2B;
 Sat, 23 Jan 2021 12:24:09 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v13 10/22] cpu: move cc->transaction_failed to tcg_ops
Date: Sat, 23 Jan 2021 13:23:47 +0100
Message-Id: <20210123122359.4147-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123122359.4147-1-cfontana@suse.de>
References: <20210123122359.4147-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[claudio: replaced !CONFIG_USER_ONLY with CONFIG_SOFTMMU in cpu.h]

this is working around a dangerous issue of different parts of the code
seeing the struct TcgCpuOperations as different, because common_ss
sources never see target configuration macros like CONFIG_USER_ONLY.

We will keep conditional parts of the struct at the end,
so that no other fields' starting addresses can be screwed up by
different views of the struct.

This will be further improved in a later patch, where we change
the CPUClass struct member into a forward declared pointer.

code in hw/core/cpu.c and include/hw/core/cpu.h, as well as
other code outside of target, in headers, contains other uses of
CONFIG_USER_ONLY, and they are potential issues.

CONFIG_USER_ONLY should be poisoned, and in general one must be
always wary of using CONFIG_ macros in common_ss code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/cpu.h     | 32 ++++++++++++++++++++++----------
 hw/mips/jazz.c            |  9 +++++++--
 target/alpha/cpu.c        |  2 +-
 target/arm/cpu.c          |  4 ++--
 target/m68k/cpu.c         |  2 +-
 target/microblaze/cpu.c   |  2 +-
 target/mips/cpu.c         |  4 +++-
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  2 +-
 target/sparc/cpu.c        |  2 +-
 target/xtensa/cpu.c       |  2 +-
 target/xtensa/helper.c    |  4 ++--
 12 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8fcdd55494..fbd8a9e5c7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -121,6 +121,20 @@ typedef struct TcgCpuOperations {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
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
+
+#endif /* CONFIG_SOFTMMU */
+#endif /* NEED_CPU_H */
+
 } TcgCpuOperations;
 #endif /* CONFIG_TCG */
 
@@ -133,8 +147,6 @@ typedef struct TcgCpuOperations {
  * @has_work: Callback for checking if there is work to do.
  * @do_unaligned_access: Callback for unaligned access handling, if
  * the target defines #TARGET_ALIGNED_ONLY.
- * @do_transaction_failed: Callback for handling failed memory transactions
- * (ie bus faults or external aborts; not MMU faults)
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
  * runtime configurable endianness is currently big-endian. Non-configurable
  * CPUs can use the default implementation of this method. This method should
@@ -203,10 +215,6 @@ struct CPUClass {
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
-    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
-                                  unsigned size, MMUAccessType access_type,
-                                  int mmu_idx, MemTxAttrs attrs,
-                                  MemTxResult response, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -893,6 +901,7 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
     cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
 
+#ifdef CONFIG_TCG
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
@@ -902,12 +911,15 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
-        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
-                                  mmu_idx, attrs, response, retaddr);
+    if (!cpu->ignore_memory_transaction_failures &&
+        cc->tcg_ops.do_transaction_failed) {
+        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size,
+                                          access_type, mmu_idx, attrs,
+                                          response, retaddr);
     }
 }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* CONFIG_SOFTMMU */
 
 #endif /* NEED_CPU_H */
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index f9442731dd..46c71a0ac8 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -116,6 +116,8 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE_MAX 0x7e000
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
+
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
@@ -137,6 +139,7 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
                                   mmu_idx, attrs, response, retaddr);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
@@ -205,8 +208,10 @@ static void mips_jazz_init(MachineState *machine,
      * memory region that catches all memory accesses, as we do on Malta.
      */
     cc = CPU_GET_CLASS(cpu);
-    real_do_transaction_failed = cc->do_transaction_failed;
-    cc->do_transaction_failed = mips_jazz_do_transaction_failed;
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
+    real_do_transaction_failed = cc->tcg_ops.do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = mips_jazz_do_transaction_failed;
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
     /* allocate RAM */
     memory_region_add_subregion(address_space, 0, machine->ram);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 66f1166672..a1696bebeb 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -225,7 +225,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = alpha_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = alpha_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = alpha_cpu_do_transaction_failed;
     cc->do_unaligned_access = alpha_cpu_do_unaligned_access;
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dfb2398392..bd1882944c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2283,11 +2283,11 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
 #if !defined(CONFIG_USER_ONLY)
-    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
     cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
-#endif
+#endif /* CONFIG_TCG */
 }
 
 #ifdef CONFIG_KVM
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 69093a621f..e68b933c84 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -473,7 +473,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = m68k_cpu_tlb_fill;
 #if defined(CONFIG_SOFTMMU)
-    cc->do_transaction_failed = m68k_cpu_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = m68k_cpu_transaction_failed;
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_m68k_cpu;
 #endif
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index b0b133b5be..4770c44aac 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -328,7 +328,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = mb_cpu_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = mb_cpu_transaction_failed;
     cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index a88a138a8d..ed2a7664e9 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -681,7 +681,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
     cc->do_unaligned_access = mips_cpu_do_unaligned_access;
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
@@ -693,6 +692,9 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
+    cc->tcg_ops.do_transaction_failed = mips_cpu_do_transaction_failed;
+#endif /* CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
     cc->gdb_num_core_regs = 73;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 345b78fc3d..9a23af9a9d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,7 +609,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = riscv_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f8350f5f78..2f43939fb6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -671,7 +671,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     env->badaddr = addr;
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 871b2a83c6..8d6d7c1f83 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -875,7 +875,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = sparc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = sparc_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = sparc_cpu_do_transaction_failed;
     cc->do_unaligned_access = sparc_cpu_do_unaligned_access;
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 3ff025f0fe..fc52fde696 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -205,7 +205,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = xtensa_cpu_do_unaligned_access;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
-    cc->do_transaction_failed = xtensa_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
     cc->tcg_ops.debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 05e2b7f70a..eeffee297d 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -261,7 +261,7 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
-#else
+#else /* !CONFIG_USER_ONLY */
 
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
                                     vaddr addr, MMUAccessType access_type,
@@ -337,4 +337,4 @@ void xtensa_runstall(CPUXtensaState *env, bool runstall)
         qemu_cpu_kick(cpu);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
-- 
2.26.2


