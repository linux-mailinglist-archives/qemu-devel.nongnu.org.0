Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9D2D71F8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 09:40:44 +0100 (CET)
Received: from localhost ([::1]:53266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kndyg-0001FU-B6
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 03:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kndqe-0008MA-2h
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:32:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:34984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kndqO-00028Y-CV
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:32:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 969F1B05C;
 Fri, 11 Dec 2020 08:31:52 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v11 10/25] i386: move TCG cpu class initialization out of
 helper.c
Date: Fri, 11 Dec 2020 09:31:28 +0100
Message-Id: <20201211083143.14350-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211083143.14350-1-cfontana@suse.de>
References: <20201211083143.14350-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
---
 target/i386/cpu.h             |  97 ++---------------------------
 target/i386/tcg/helper-tcg.h  | 112 ++++++++++++++++++++++++++++++++++
 target/i386/tcg/tcg-cpu.h     |  15 +++++
 target/i386/cpu.c             |  33 ++++------
 target/i386/helper.c          |  23 -------
 target/i386/tcg/bpt_helper.c  |   1 +
 target/i386/tcg/cc_helper.c   |   1 +
 target/i386/tcg/excp_helper.c |   1 +
 target/i386/tcg/fpu_helper.c  |  33 +++++-----
 target/i386/tcg/int_helper.c  |   1 +
 target/i386/tcg/mem_helper.c  |   1 +
 target/i386/tcg/misc_helper.c |   1 +
 target/i386/tcg/mpx_helper.c  |   1 +
 target/i386/tcg/seg_helper.c  |   1 +
 target/i386/tcg/smm_helper.c  |   2 +
 target/i386/tcg/svm_helper.c  |   1 +
 target/i386/tcg/tcg-cpu.c     |  71 +++++++++++++++++++++
 target/i386/tcg/translate.c   |   1 +
 target/i386/tcg/meson.build   |   1 +
 19 files changed, 244 insertions(+), 153 deletions(-)
 create mode 100644 target/i386/tcg/helper-tcg.h
 create mode 100644 target/i386/tcg/tcg-cpu.h
 create mode 100644 target/i386/tcg/tcg-cpu.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d6ed45c5d7..a0d64613dc 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -31,9 +31,6 @@
 
 #define KVM_HAVE_MCE_INJECTION 1
 
-/* Maximum instruction code size */
-#define TARGET_MAX_INSN_SIZE 16
-
 /* support for self modifying code even if the modified instruction is
    close to the modifying instruction */
 #define TARGET_HAS_PRECISE_SMC
@@ -1037,6 +1034,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
  * using this information. Condition codes are not generated if they
  * are only needed for conditional branches.
  */
+
+#define CC_DST  (env->cc_dst)
+#define CC_SRC  (env->cc_src)
+#define CC_SRC2 (env->cc_src2)
+#define CC_OP   (env->cc_op)
+
 typedef enum {
     CC_OP_DYNAMIC, /* must use dynamic code to get cc_op */
     CC_OP_EFLAGS,  /* all cc are explicitly computed, CC_SRC = flags */
@@ -1765,12 +1768,6 @@ struct X86CPU {
 extern VMStateDescription vmstate_x86_cpu;
 #endif
 
-/**
- * x86_cpu_do_interrupt:
- * @cpu: vCPU the interrupt is to be handled by.
- */
-void x86_cpu_do_interrupt(CPUState *cpu);
-bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
 
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -1793,9 +1790,6 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-void x86_cpu_exec_enter(CPUState *cpu);
-void x86_cpu_exec_exit(CPUState *cpu);
-
 void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
@@ -1920,9 +1914,6 @@ void host_cpuid(uint32_t function, uint32_t count,
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
 
 /* helper.c */
-bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
 
 #ifndef CONFIG_USER_ONLY
@@ -1947,8 +1938,6 @@ void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val);
 #endif
 
-void breakpoint_handler(CPUState *cs);
-
 /* will be suppressed */
 void cpu_x86_update_cr0(CPUX86State *env, uint32_t new_cr0);
 void cpu_x86_update_cr3(CPUX86State *env, target_ulong new_cr3);
@@ -1958,16 +1947,6 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
 /* hw/pc.c */
 uint64_t cpu_get_tsc(CPUX86State *env);
 
-/* XXX: This value should match the one returned by CPUID
- * and in exec.c */
-# if defined(TARGET_X86_64)
-# define TCG_PHYS_ADDR_BITS 40
-# else
-# define TCG_PHYS_ADDR_BITS 36
-# endif
-
-#define PHYS_ADDR_MASK MAKE_64BIT_MASK(0, TCG_PHYS_ADDR_BITS)
-
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_X86_CPU
@@ -1999,30 +1978,6 @@ static inline int cpu_mmu_index_kernel(CPUX86State *env)
         ? MMU_KNOSMAP_IDX : MMU_KSMAP_IDX;
 }
 
-#define CC_DST  (env->cc_dst)
-#define CC_SRC  (env->cc_src)
-#define CC_SRC2 (env->cc_src2)
-#define CC_OP   (env->cc_op)
-
-/* n must be a constant to be efficient */
-static inline target_long lshift(target_long x, int n)
-{
-    if (n >= 0) {
-        return x << n;
-    } else {
-        return x >> (-n);
-    }
-}
-
-/* float macros */
-#define FT0    (env->ft0)
-#define ST0    (env->fpregs[env->fpstt].d)
-#define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
-#define ST1    ST(1)
-
-/* translate.c */
-void tcg_x86_init(void);
-
 typedef CPUX86State CPUArchState;
 typedef X86CPU ArchCPU;
 
@@ -2052,19 +2007,6 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
                         uint64_t status, uint64_t mcg_status, uint64_t addr,
                         uint64_t misc, int flags);
 
-/* excp_helper.c */
-void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index);
-void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_index,
-                                      uintptr_t retaddr);
-void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_index,
-                                       int error_code);
-void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_index,
-                                          int error_code, uintptr_t retaddr);
-void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_int,
-                                   int error_code, int next_eip_addend);
-
-/* cc_helper.c */
-extern const uint8_t parity_table[256];
 uint32_t cpu_cc_compute_all(CPUX86State *env1, int op);
 
 static inline uint32_t cpu_compute_eflags(CPUX86State *env)
@@ -2076,18 +2018,6 @@ static inline uint32_t cpu_compute_eflags(CPUX86State *env)
     return eflags;
 }
 
-/* NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
- * after generating a call to a helper that uses this.
- */
-static inline void cpu_load_eflags(CPUX86State *env, int eflags,
-                                   int update_mask)
-{
-    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
-    CC_OP = CC_OP_EFLAGS;
-    env->df = 1 - (2 * ((eflags >> 10) & 1));
-    env->eflags = (env->eflags & ~update_mask) |
-        (eflags & update_mask) | 0x2;
-}
 
 /* load efer and update the corresponding hflags. XXX: do consistency
    checks with cpuid bits? */
@@ -2176,16 +2106,6 @@ void helper_lock_init(void);
 /* svm_helper.c */
 void cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                                    uint64_t param, uintptr_t retaddr);
-void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
-                              uint64_t exit_info_1, uintptr_t retaddr);
-void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1);
-
-/* seg_helper.c */
-void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
-
-/* smm_helper.c */
-void do_smm_enter(X86CPU *cpu);
-
 /* apic.c */
 void cpu_report_tpr_access(CPUX86State *env, TPRAccess access);
 void apic_handle_tpr_access_report(DeviceState *d, target_ulong ip,
@@ -2224,11 +2144,6 @@ typedef int X86CPUVersion;
  */
 void x86_cpu_set_default_version(X86CPUVersion version);
 
-/* Return name of 32-bit register, from a R_* constant */
-const char *get_register_name_32(unsigned int reg);
-
-void enable_compat_apic_id_mode(void);
-
 #define APIC_DEFAULT_ADDRESS 0xfee00000
 #define APIC_SPACE_SIZE      0x100000
 
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
new file mode 100644
index 0000000000..57b4391a7d
--- /dev/null
+++ b/target/i386/tcg/helper-tcg.h
@@ -0,0 +1,112 @@
+/*
+ * TCG specific prototypes for helpers
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef I386_HELPER_TCG_H
+#define I386_HELPER_TCG_H
+
+#include "exec/exec-all.h"
+
+/* Maximum instruction code size */
+#define TARGET_MAX_INSN_SIZE 16
+
+/*
+ * XXX: This value should match the one returned by CPUID
+ * and in exec.c
+ */
+# if defined(TARGET_X86_64)
+# define TCG_PHYS_ADDR_BITS 40
+# else
+# define TCG_PHYS_ADDR_BITS 36
+# endif
+
+#define PHYS_ADDR_MASK MAKE_64BIT_MASK(0, TCG_PHYS_ADDR_BITS)
+
+/**
+ * x86_cpu_do_interrupt:
+ * @cpu: vCPU the interrupt is to be handled by.
+ */
+void x86_cpu_do_interrupt(CPUState *cpu);
+bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
+/* helper.c */
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+
+void breakpoint_handler(CPUState *cs);
+
+/* n must be a constant to be efficient */
+static inline target_long lshift(target_long x, int n)
+{
+    if (n >= 0) {
+        return x << n;
+    } else {
+        return x >> (-n);
+    }
+}
+
+/* float macros */
+#define FT0    (env->ft0)
+#define ST0    (env->fpregs[env->fpstt].d)
+#define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
+#define ST1    ST(1)
+
+/* translate.c */
+void tcg_x86_init(void);
+
+/* excp_helper.c */
+void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index);
+void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_index,
+                                      uintptr_t retaddr);
+void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_index,
+                                       int error_code);
+void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_index,
+                                          int error_code, uintptr_t retaddr);
+void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_int,
+                                   int error_code, int next_eip_addend);
+
+/* cc_helper.c */
+extern const uint8_t parity_table[256];
+
+/*
+ * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
+ * after generating a call to a helper that uses this.
+ */
+static inline void cpu_load_eflags(CPUX86State *env, int eflags,
+                                   int update_mask)
+{
+    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
+    CC_OP = CC_OP_EFLAGS;
+    env->df = 1 - (2 * ((eflags >> 10) & 1));
+    env->eflags = (env->eflags & ~update_mask) |
+        (eflags & update_mask) | 0x2;
+}
+
+/* svm_helper.c */
+void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
+                              uint64_t exit_info_1, uintptr_t retaddr);
+void do_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1);
+
+/* seg_helper.c */
+void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
+
+/* smm_helper.c */
+void do_smm_enter(X86CPU *cpu);
+
+#endif /* I386_HELPER_TCG_H */
diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
new file mode 100644
index 0000000000..81f02e562e
--- /dev/null
+++ b/target/i386/tcg/tcg-cpu.h
@@ -0,0 +1,15 @@
+/*
+ * i386 TCG CPU class initialization
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TCG_CPU_H
+#define TCG_CPU_H
+
+void tcg_cpu_common_class_init(CPUClass *cc);
+
+#endif /* TCG_CPU_H */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b9bd249c8f..f0aa6d1841 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -24,6 +24,8 @@
 #include "qemu/qemu-print.h"
 
 #include "cpu.h"
+#include "tcg/tcg-cpu.h"
+#include "tcg/helper-tcg.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
@@ -1495,7 +1497,8 @@ static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
            cpu->env.features[FEAT_XSAVE_COMP_LO];
 }
 
-const char *get_register_name_32(unsigned int reg)
+/* Return name of 32-bit register, from a R_* constant */
+static const char *get_register_name_32(unsigned int reg)
 {
     if (reg >= CPU_NB_REGS32) {
         return NULL;
@@ -7012,13 +7015,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.eip = value;
 }
 
-static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
-{
-    X86CPU *cpu = X86_CPU(cs);
-
-    cpu->env.eip = tb->pc - tb->cs_base;
-}
-
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -7252,17 +7248,18 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
+
 #ifdef CONFIG_TCG
-    cc->do_interrupt = x86_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
-#endif
+    tcg_cpu_common_class_init(cc);
+#endif /* CONFIG_TCG */
+
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
-    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
+
 #ifndef CONFIG_USER_ONLY
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
@@ -7273,7 +7270,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->vmsd = &vmstate_x86_cpu;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
@@ -7281,15 +7279,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
     cc->gdb_num_core_regs = 50;
-#endif
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    cc->debug_excp_handler = breakpoint_handler;
-#endif
-    cc->cpu_exec_enter = x86_cpu_exec_enter;
-    cc->cpu_exec_exit = x86_cpu_exec_exit;
-#ifdef CONFIG_TCG
-    cc->tcg_initialize = tcg_x86_init;
-    cc->tlb_fill = x86_cpu_tlb_fill;
 #endif
     cc->disas_set_info = x86_disas_set_info;
 
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 6e7e0f507c..6bb0c53182 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -24,10 +24,8 @@
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
 #include "monitor/monitor.h"
-#include "hw/i386/apic_internal.h"
 #endif
 
 void cpu_sync_bndcs_hflags(CPUX86State *env)
@@ -572,27 +570,6 @@ void do_cpu_sipi(X86CPU *cpu)
 }
 #endif
 
-/* Frob eflags into and out of the CPU temporary format.  */
-
-void x86_cpu_exec_enter(CPUState *cs)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-
-    CC_SRC = env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
-    env->df = 1 - (2 * ((env->eflags >> 10) & 1));
-    CC_OP = CC_OP_EFLAGS;
-    env->eflags &= ~(DF_MASK | CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
-}
-
-void x86_cpu_exec_exit(CPUState *cs)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-
-    env->eflags = cpu_compute_eflags(env);
-}
-
 #ifndef CONFIG_USER_ONLY
 uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
 {
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
index e6cc2921e2..979230ac12 100644
--- a/target/i386/tcg/bpt_helper.c
+++ b/target/i386/tcg/bpt_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "helper-tcg.h"
 
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index 924dd3cd57..cc7ea9e8b9 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
+#include "helper-tcg.h"
 
 const uint8_t parity_table[256] = {
     CC_P, 0, 0, CC_P, 0, CC_P, CC_P, 0,
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index 191471749f..a0f44431fe 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "sysemu/runstate.h"
 #include "exec/helper-proto.h"
+#include "helper-tcg.h"
 
 void helper_raise_interrupt(CPUX86State *env, int intno, int next_eip_addend)
 {
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 03b35443a6..13f31b6ac7 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -26,6 +26,7 @@
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
+#include "helper-tcg.h"
 
 #ifdef CONFIG_SOFTMMU
 #include "hw/irq.h"
@@ -2986,23 +2987,21 @@ void update_mxcsr_status(CPUX86State *env)
 
 void update_mxcsr_from_sse_status(CPUX86State *env)
 {
-    if (tcg_enabled()) {
-        uint8_t flags = get_float_exception_flags(&env->sse_status);
-        /*
-         * The MXCSR denormal flag has opposite semantics to
-         * float_flag_input_denormal (the softfloat code sets that flag
-         * only when flushing input denormals to zero, but SSE sets it
-         * only when not flushing them to zero), so is not converted
-         * here.
-         */
-        env->mxcsr |= ((flags & float_flag_invalid ? FPUS_IE : 0) |
-                       (flags & float_flag_divbyzero ? FPUS_ZE : 0) |
-                       (flags & float_flag_overflow ? FPUS_OE : 0) |
-                       (flags & float_flag_underflow ? FPUS_UE : 0) |
-                       (flags & float_flag_inexact ? FPUS_PE : 0) |
-                       (flags & float_flag_output_denormal ? FPUS_UE | FPUS_PE :
-                        0));
-    }
+    uint8_t flags = get_float_exception_flags(&env->sse_status);
+    /*
+     * The MXCSR denormal flag has opposite semantics to
+     * float_flag_input_denormal (the softfloat code sets that flag
+     * only when flushing input denormals to zero, but SSE sets it
+     * only when not flushing them to zero), so is not converted
+     * here.
+     */
+    env->mxcsr |= ((flags & float_flag_invalid ? FPUS_IE : 0) |
+                   (flags & float_flag_divbyzero ? FPUS_ZE : 0) |
+                   (flags & float_flag_overflow ? FPUS_OE : 0) |
+                   (flags & float_flag_underflow ? FPUS_UE : 0) |
+                   (flags & float_flag_inexact ? FPUS_PE : 0) |
+                   (flags & float_flag_output_denormal ? FPUS_UE | FPUS_PE :
+                    0));
 }
 
 void helper_update_mxcsr(CPUX86State *env)
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 4f89436b53..87fa7280ee 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "helper-tcg.h"
 
 //#define DEBUG_MULDIV
 
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 21ca3e3e88..e5cd2de1bf 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "tcg/tcg.h"
+#include "helper-tcg.h"
 
 void helper_cmpxchg8b_unlocked(CPUX86State *env, target_ulong a0)
 {
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index ae259d9145..c99370e5e3 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
+#include "helper-tcg.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
diff --git a/target/i386/tcg/mpx_helper.c b/target/i386/tcg/mpx_helper.c
index fd966174b4..22423eedcd 100644
--- a/target/i386/tcg/mpx_helper.c
+++ b/target/i386/tcg/mpx_helper.c
@@ -22,6 +22,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "helper-tcg.h"
 
 
 void helper_bndck(CPUX86State *env, uint32_t fail)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 09b6554660..ed3e04a187 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -25,6 +25,7 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
+#include "helper-tcg.h"
 
 //#define DEBUG_PCALL
 
diff --git a/target/i386/tcg/smm_helper.c b/target/i386/tcg/smm_helper.c
index d20e8edfdf..62d027abd3 100644
--- a/target/i386/tcg/smm_helper.c
+++ b/target/i386/tcg/smm_helper.c
@@ -22,6 +22,8 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/log.h"
+#include "helper-tcg.h"
+
 
 /* SMM support */
 
diff --git a/target/i386/tcg/svm_helper.c b/target/i386/tcg/svm_helper.c
index 38931586e5..097bb9b83d 100644
--- a/target/i386/tcg/svm_helper.c
+++ b/target/i386/tcg/svm_helper.c
@@ -22,6 +22,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "helper-tcg.h"
 
 /* Secure Virtual Machine helpers */
 
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
new file mode 100644
index 0000000000..628dd29fe7
--- /dev/null
+++ b/target/i386/tcg/tcg-cpu.c
@@ -0,0 +1,71 @@
+/*
+ * i386 TCG cpu class initialization
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg-cpu.h"
+#include "exec/exec-all.h"
+#include "sysemu/runstate.h"
+#include "helper-tcg.h"
+
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/i386/apic.h"
+#endif
+
+/* Frob eflags into and out of the CPU temporary format.  */
+
+static void x86_cpu_exec_enter(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    CC_SRC = env->eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
+    env->df = 1 - (2 * ((env->eflags >> 10) & 1));
+    CC_OP = CC_OP_EFLAGS;
+    env->eflags &= ~(DF_MASK | CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
+}
+
+static void x86_cpu_exec_exit(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->eflags = cpu_compute_eflags(env);
+}
+
+static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    cpu->env.eip = tb->pc - tb->cs_base;
+}
+
+void tcg_cpu_common_class_init(CPUClass *cc)
+{
+    cc->do_interrupt = x86_cpu_do_interrupt;
+    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
+    cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
+    cc->cpu_exec_enter = x86_cpu_exec_enter;
+    cc->cpu_exec_exit = x86_cpu_exec_exit;
+    cc->tcg_initialize = tcg_x86_init;
+    cc->tlb_fill = x86_cpu_tlb_fill;
+#ifndef CONFIG_USER_ONLY
+    cc->debug_excp_handler = breakpoint_handler;
+#endif
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4c57307e42..5988ea0289 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -28,6 +28,7 @@
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
+#include "helper-tcg.h"
 
 #include "trace-tcg.h"
 #include "exec/log.h"
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index 02794226c2..6a1a73cdbf 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -10,4 +10,5 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'seg_helper.c',
   'smm_helper.c',
   'svm_helper.c',
+  'tcg-cpu.c',
   'translate.c'), if_false: files('tcg-stub.c'))
-- 
2.26.2


