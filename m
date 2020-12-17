Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1E2DD8F4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:00:16 +0100 (CET)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyVb-0005R7-Ev
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIZ-0006U2-Kt
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpyIV-0001zA-O6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608230801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tt+WDU5Zy8m/1yGc96DuAU5Q6F3sgEOlFeyh8x1uO3Q=;
 b=Fdbxud7uY+Ycsl1ITLzi1+VtpN7NJB8aGnNGoBdBjX2pLk+DlJeyiVbq6MC+F3xwSsBJit
 e+eGAeYAXJAAOu5Tqmmrn+aMI0/l4XSrm49BvtdePE2rjC8U1ZVBT7/IzzPUA7TyD07/ro
 3naU3r4YcRLBoCgt2fsTqCU+k69kpvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-DK-AAtMrM9yUUoU5UNBWGQ-1; Thu, 17 Dec 2020 13:46:39 -0500
X-MC-Unique: DK-AAtMrM9yUUoU5UNBWGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A90801B15;
 Thu, 17 Dec 2020 18:46:38 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A8885F9C8;
 Thu, 17 Dec 2020 18:46:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/17] i386: move TCG cpu class initialization to tcg/
Date: Thu, 17 Dec 2020 13:46:15 -0500
Message-Id: <20201217184620.3945917-13-ehabkost@redhat.com>
In-Reply-To: <20201217184620.3945917-1-ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

to do this, we need to take code out of cpu.c and helper.c,
and also move some prototypes from cpu.h, for code that is
needed in tcg/xxx_helper.c, and which in turn is part of the
callbacks registered by the class initialization.

Therefore, do some shuffling of the parts of cpu.h that
are only relevant for tcg/, and put them in tcg/helper-tcg.h

For FT0 and similar macros, put them in tcg/fpu-helper.c
since they are used only there.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201212155530.23098-8-cfontana@suse.de>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h             |  86 ---------------------------
 target/i386/tcg/helper-tcg.h  | 106 ++++++++++++++++++++++++++++++++++
 target/i386/tcg/tcg-cpu.h     |  15 +++++
 target/i386/cpu.c             |  33 ++++-------
 target/i386/helper.c          |  23 --------
 target/i386/tcg/bpt_helper.c  |   1 +
 target/i386/tcg/cc_helper.c   |   1 +
 target/i386/tcg/excp_helper.c |   1 +
 target/i386/tcg/fpu_helper.c  |  39 +++++++------
 target/i386/tcg/int_helper.c  |   1 +
 target/i386/tcg/mem_helper.c  |   1 +
 target/i386/tcg/meson.build   |   1 +
 target/i386/tcg/misc_helper.c |   1 +
 target/i386/tcg/mpx_helper.c  |   1 +
 target/i386/tcg/seg_helper.c  |   1 +
 target/i386/tcg/smm_helper.c  |   2 +
 target/i386/tcg/svm_helper.c  |   1 +
 target/i386/tcg/tcg-cpu.c     |  71 +++++++++++++++++++++++
 target/i386/tcg/translate.c   |   1 +
 19 files changed, 238 insertions(+), 148 deletions(-)
 create mode 100644 target/i386/tcg/helper-tcg.h
 create mode 100644 target/i386/tcg/tcg-cpu.h
 create mode 100644 target/i386/tcg/tcg-cpu.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9b2ced97ea..af130512e2 100644
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
@@ -1775,12 +1772,6 @@ struct X86CPU {
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
@@ -1803,9 +1794,6 @@ hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
 int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
-void x86_cpu_exec_enter(CPUState *cpu);
-void x86_cpu_exec_exit(CPUState *cpu);
-
 void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
@@ -1930,9 +1918,6 @@ void host_cpuid(uint32_t function, uint32_t count,
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
 
 /* helper.c */
-bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
 
 #ifndef CONFIG_USER_ONLY
@@ -1957,8 +1942,6 @@ void x86_stl_phys(CPUState *cs, hwaddr addr, uint32_t val);
 void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val);
 #endif
 
-void breakpoint_handler(CPUState *cs);
-
 /* will be suppressed */
 void cpu_x86_update_cr0(CPUX86State *env, uint32_t new_cr0);
 void cpu_x86_update_cr3(CPUX86State *env, target_ulong new_cr3);
@@ -1968,16 +1951,6 @@ void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
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
@@ -2014,25 +1987,6 @@ static inline int cpu_mmu_index_kernel(CPUX86State *env)
 #define CC_SRC2 (env->cc_src2)
 #define CC_OP   (env->cc_op)
 
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
 
@@ -2062,19 +2016,6 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
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
@@ -2086,18 +2027,6 @@ static inline uint32_t cpu_compute_eflags(CPUX86State *env)
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
@@ -2186,16 +2115,6 @@ void helper_lock_init(void);
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
@@ -2234,11 +2153,6 @@ typedef int X86CPUVersion;
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
index 0000000000..148edf49a3
--- /dev/null
+++ b/target/i386/tcg/helper-tcg.h
@@ -0,0 +1,106 @@
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
index 608e9cacf9..0d20e156f2 100644
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
@@ -1521,7 +1523,8 @@ static inline uint64_t x86_cpu_xsave_components(X86CPU *cpu)
            cpu->env.features[FEAT_XSAVE_COMP_LO];
 }
 
-const char *get_register_name_32(unsigned int reg)
+/* Return name of 32-bit register, from a R_* constant */
+static const char *get_register_name_32(unsigned int reg)
 {
     if (reg >= CPU_NB_REGS32) {
         return NULL;
@@ -7068,13 +7071,6 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr value)
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
@@ -7309,17 +7305,18 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
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
@@ -7330,7 +7327,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->write_elf32_note = x86_cpu_write_elf32_note;
     cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->vmsd = &vmstate_x86_cpu;
-#endif
+#endif /* !CONFIG_USER_ONLY */
+
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
@@ -7338,15 +7336,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
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
index 03b35443a6..60ed93520a 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -26,11 +26,18 @@
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
+#include "helper-tcg.h"
 
 #ifdef CONFIG_SOFTMMU
 #include "hw/irq.h"
 #endif
 
+/* float macros */
+#define FT0    (env->ft0)
+#define ST0    (env->fpregs[env->fpstt].d)
+#define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
+#define ST1    ST(1)
+
 #define FPU_RC_MASK         0xc00
 #define FPU_RC_NEAR         0x000
 #define FPU_RC_DOWN         0x400
@@ -2986,23 +2993,21 @@ void update_mxcsr_status(CPUX86State *env)
 
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
index e6ffa1f018..1255efe7e0 100644
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
index e8f5f5803a..750f75c257 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -28,6 +28,7 @@
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
+#include "helper-tcg.h"
 
 #include "trace-tcg.h"
 #include "exec/log.h"
-- 
2.28.0


