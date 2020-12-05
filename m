Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC32CFC14
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:38:41 +0100 (CET)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klaa0-0005zd-H9
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaDy-0000y9-Ed
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:48750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaDt-0000Dx-Qn
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90A6DAE05;
 Sat,  5 Dec 2020 16:15:38 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v8 19/27] cpu: Move tlb_fill to tcg_ops
Date: Sat,  5 Dec 2020 17:15:10 +0100
Message-Id: <20201205161518.14365-20-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201205161518.14365-1-cfontana@suse.de>
References: <20201205161518.14365-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
[claudio: wrapped in CONFIG_TCG]
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/tcg/cputlb.c              |  6 +++---
 accel/tcg/user-exec.c           |  6 +++---
 include/hw/core/cpu.h           |  9 ---------
 include/hw/core/tcg-cpu-ops.h   | 12 ++++++++++++
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg-cpu.c           |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/tricore/cpu.c            |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 27 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 42ab79c1a5..2dc71b5528 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1286,7 +1286,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
      * This is not a probe, so only valid return is success; failure
      * should result in exception + longjmp to the cpu loop.
      */
-    ok = cc->tlb_fill(cpu, addr, size, access_type, mmu_idx, false, retaddr);
+    ok = cc->tcg_ops.tlb_fill(cpu, addr, size, access_type, mmu_idx, false, retaddr);
     assert(ok);
 }
 
@@ -1557,8 +1557,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
             CPUState *cs = env_cpu(env);
             CPUClass *cc = CPU_GET_CLASS(cs);
 
-            if (!cc->tlb_fill(cs, addr, fault_size, access_type,
-                              mmu_idx, nonfault, retaddr)) {
+            if (!cc->tcg_ops.tlb_fill(cs, addr, fault_size, access_type,
+                                      mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 return TLB_INVALID_MASK;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..7f53992251 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -186,7 +186,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
     clear_helper_retaddr();
 
     cc = CPU_GET_CLASS(cpu);
-    cc->tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
+    cc->tcg_ops.tlb_fill(cpu, address, 0, access_type, MMU_USER_IDX, false, pc);
     g_assert_not_reached();
 }
 
@@ -216,8 +216,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
         } else {
             CPUState *cpu = env_cpu(env);
             CPUClass *cc = CPU_GET_CLASS(cpu);
-            cc->tlb_fill(cpu, addr, fault_size, access_type,
-                         MMU_USER_IDX, false, ra);
+            cc->tcg_ops.tlb_fill(cpu, addr, fault_size, access_type,
+                                 MMU_USER_IDX, false, ra);
             g_assert_not_reached();
         }
     }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 52142e9094..c82ef261c6 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -110,12 +110,6 @@ struct TranslationBlock;
  *       If the target behaviour here is anything other than "set
  *       the PC register to the value passed in" then the target must
  *       also implement the synchronize_from_tb hook.
- * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
- *       address fault.  For system mode, if the access is valid, call
- *       tlb_set_page and return true; if the access is invalid, and
- *       probe is true, return false; otherwise raise an exception and
- *       do not return.  For user-only mode, always raise an exception
- *       and do not return.
  * @get_phys_page_debug: Callback for obtaining a physical address.
  * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
  *       associated memory transaction attributes to use for the access.
@@ -183,9 +177,6 @@ struct CPUClass {
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
-    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index e12f32919b..2ea94acca0 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -37,6 +37,18 @@ typedef struct TcgCpuOperations {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
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
 } TcgCpuOperations;
 
 #endif /* TCG_CPU_OPS_H */
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4f206c154d..0369d5a99c 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -222,7 +222,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
-    cc->tlb_fill = alpha_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = alpha_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_transaction_failed = alpha_cpu_do_transaction_failed;
     cc->do_unaligned_access = alpha_cpu_do_unaligned_access;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 470b7b48c3..0dac097367 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,7 +2262,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.initialize = arm_translate_init;
     cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
-    cc->tlb_fill = arm_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 277b00dbfc..699055de7c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -203,7 +203,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->tlb_fill = avr_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = avr_cpu_tlb_fill;
     cc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->tcg_ops.initialize = avr_cpu_tcg_init;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 7489fc20c8..9222717f3e 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -274,7 +274,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
     cc->gdb_write_register = cris_cpu_gdb_write_register;
-    cc->tlb_fill = cris_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = cris_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_cris_cpu;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 61444753f2..e2d79f954e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -146,7 +146,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
-    cc->tlb_fill = hppa_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = hppa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_hppa_cpu;
diff --git a/target/i386/tcg-cpu.c b/target/i386/tcg-cpu.c
index 5e0f2a2fae..8606dd6a3e 100644
--- a/target/i386/tcg-cpu.c
+++ b/target/i386/tcg-cpu.c
@@ -64,7 +64,7 @@ void tcg_cpu_common_class_init(CPUClass *cc)
     cc->tcg_ops.cpu_exec_enter = x86_cpu_exec_enter;
     cc->tcg_ops.cpu_exec_exit = x86_cpu_exec_exit;
     cc->tcg_ops.initialize = tcg_x86_init;
-    cc->tlb_fill = x86_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->debug_excp_handler = breakpoint_handler;
 #endif
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index eea2d3e515..76dc728858 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -228,7 +228,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = lm32_cpu_set_pc;
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
     cc->gdb_write_register = lm32_cpu_gdb_write_register;
-    cc->tlb_fill = lm32_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = lm32_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_lm32_cpu;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c0fa517fc3..bc109faa21 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -283,7 +283,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
-    cc->tlb_fill = m68k_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = m68k_cpu_tlb_fill;
 #if defined(CONFIG_SOFTMMU)
     cc->do_transaction_failed = m68k_cpu_transaction_failed;
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 833d7f2d59..6e660a27b8 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -325,7 +325,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = mb_cpu_synchronize_from_tb;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
     cc->gdb_write_register = mb_cpu_gdb_write_register;
-    cc->tlb_fill = mb_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_transaction_failed = mb_cpu_transaction_failed;
     cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 344ee402fc..1f7573d319 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -250,7 +250,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.initialize = mips_tcg_init;
     cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
-    cc->tlb_fill = mips_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
 #endif
 
     cc->gdb_num_core_regs = 73;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 224cfc8361..1177d092c1 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -110,7 +110,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = moxie_cpu_do_interrupt;
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
-    cc->tlb_fill = moxie_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = moxie_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_moxie_cpu;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 9eeb01fb5b..a96b74b00c 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -197,7 +197,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-    cc->tlb_fill = nios2_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = nios2_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = nios2_cpu_do_unaligned_access;
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index df8a41f956..e6d1c9764b 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -160,7 +160,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
-    cc->tlb_fill = openrisc_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = openrisc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_openrisc_cpu;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e0edbac999..e83000b2fb 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10946,7 +10946,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = ppc_translate_init;
     cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
-    cc->tlb_fill = ppc_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = ppc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
     cc->tcg_ops.cpu_exec_exit = ppc_cpu_exec_exit;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 97dbe1a08c..022b4271d4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -563,7 +563,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = riscv_translate_init;
-    cc->tlb_fill = riscv_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = riscv_cpu_tlb_fill;
 #endif
     device_class_set_props(dc, riscv_cpu_properties);
 }
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 3ba93590d2..c815533223 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -195,7 +195,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
     cc->tcg_ops.initialize = rx_translate_init;
-    cc->tlb_fill = rx_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = rx_cpu_tlb_fill;
 
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index add2f4b21f..6cd2b30192 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -513,7 +513,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = s390_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = s390x_translate_init;
-    cc->tlb_fill = s390_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = s390_cpu_tlb_fill;
 #endif
 
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 0574194cd0..7a9019edec 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -225,7 +225,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = superh_cpu_synchronize_from_tb;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
-    cc->tlb_fill = superh_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = superh_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = superh_cpu_do_unaligned_access;
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index c559f15e14..760e0ea92c 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -871,7 +871,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.synchronize_from_tb = sparc_cpu_synchronize_from_tb;
     cc->gdb_read_register = sparc_cpu_gdb_read_register;
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
-    cc->tlb_fill = sparc_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = sparc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_transaction_failed = sparc_cpu_do_transaction_failed;
     cc->do_unaligned_access = sparc_cpu_do_unaligned_access;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 4c6176d26e..75b3a4bae3 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -151,7 +151,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
-    cc->tlb_fill = tilegx_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = tilegx_cpu_tlb_fill;
     cc->gdb_num_core_regs = 0;
     cc->tcg_ops.initialize = tilegx_tcg_init;
 }
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 5edf96c600..89a14f81d7 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -165,7 +165,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.synchronize_from_tb = tricore_cpu_synchronize_from_tb;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
     cc->tcg_ops.initialize = tricore_tcg_init;
-    cc->tlb_fill = tricore_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = tricore_cpu_tlb_fill;
 }
 
 #define DEFINE_TRICORE_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 84c3419989..a57d315d2f 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -135,7 +135,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.cpu_exec_interrupt = uc32_cpu_exec_interrupt;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
-    cc->tlb_fill = uc32_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = uc32_cpu_tlb_fill;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
     cc->tcg_ops.initialize = uc32_translate_init;
     dc->vmsd = &vmstate_uc32_cpu;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 42a5e4ebe8..e764dbeb73 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -201,7 +201,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
     cc->gdb_write_register = xtensa_cpu_gdb_write_register;
     cc->gdb_stop_before_watchpoint = true;
-    cc->tlb_fill = xtensa_cpu_tlb_fill;
+    cc->tcg_ops.tlb_fill = xtensa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = xtensa_cpu_do_unaligned_access;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
-- 
2.26.2


