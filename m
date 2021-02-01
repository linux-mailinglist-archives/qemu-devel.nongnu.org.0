Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD26D30A51C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:13:18 +0100 (CET)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WCr-00041P-P8
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8z-00007M-Mm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:55644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8u-0005pn-O7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC839ACB0;
 Mon,  1 Feb 2021 10:09:10 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 09/23] cpu: move cc->do_interrupt to tcg_ops
Date: Mon,  1 Feb 2021 11:08:49 +0100
Message-Id: <20210201100903.17309-10-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h           |  4 ++--
 accel/tcg/cpu-exec.c            |  4 ++--
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  4 ++--
 target/arm/cpu_tcg.c            |  9 ++++-----
 target/avr/cpu.c                |  2 +-
 target/avr/helper.c             |  4 ++--
 target/cris/cpu.c               | 12 ++++++------
 target/cris/helper.c            |  4 ++--
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg/tcg-cpu.c       |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  4 ++--
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 27 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d7ffd585d7..fb8c3c17dc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -103,6 +103,8 @@ typedef struct TcgCpuOperations {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+    /** @do_interrupt: Callback for interrupt handling. */
+    void (*do_interrupt)(CPUState *cpu);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -127,7 +129,6 @@ typedef struct TcgCpuOperations {
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @do_interrupt: Callback for interrupt handling.
  * @do_unaligned_access: Callback for unaligned access handling, if
  * the target defines #TARGET_ALIGNED_ONLY.
  * @do_transaction_failed: Callback for handling failed memory transactions
@@ -197,7 +198,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    void (*do_interrupt)(CPUState *cpu);
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e7e54fd75d..633ee3ef9e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -547,7 +547,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->do_interrupt(cpu);
+        cc->tcg_ops.do_interrupt(cpu);
 #endif
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
@@ -556,7 +556,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_exception()) {
             CPUClass *cc = CPU_GET_CLASS(cpu);
             qemu_mutex_lock_iothread();
-            cc->do_interrupt(cpu);
+            cc->tcg_ops.do_interrupt(cpu);
             qemu_mutex_unlock_iothread();
             cpu->exception_index = -1;
 
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 9f36f824fd..66f1166672 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -217,7 +217,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
-    cc->do_interrupt = alpha_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = alpha_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = alpha_cpu_exec_interrupt;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 66ac210b0c..dfb2398392 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -590,7 +590,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cc->do_interrupt(cs);
+    cc->tcg_ops.do_interrupt(cs);
     return true;
 }
 
@@ -2261,7 +2261,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_interrupt = arm_cpu_do_interrupt;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
@@ -2286,6 +2285,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #if !defined(CONFIG_USER_ONLY)
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
+    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif
 }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f2e565166e..d9c160f1ac 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -34,7 +34,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cc->do_interrupt(cs);
+        cc->tcg_ops.do_interrupt(cs);
         ret = true;
     }
     return ret;
@@ -666,12 +666,11 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
+#ifdef CONFIG_TCG
+    cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 #ifndef CONFIG_USER_ONLY
-    cc->do_interrupt = arm_v7m_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
-
-#ifdef CONFIG_TCG
-    cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 #endif /* CONFIG_TCG */
 
     cc->gdb_core_xml_file = "arm-m-profile.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index d6e93049b4..476e645b37 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -198,7 +198,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = avr_cpu_class_by_name;
 
     cc->has_work = avr_cpu_has_work;
-    cc->do_interrupt = avr_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = avr_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = avr_cpu_exec_interrupt;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
diff --git a/target/avr/helper.c b/target/avr/helper.c
index d96d14372b..69d3b6181f 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -34,7 +34,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
-            cc->do_interrupt(cs);
+            cc->tcg_ops.do_interrupt(cs);
 
             cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
 
@@ -45,7 +45,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
             int index = ctz32(env->intsrc);
             cs->exception_index = EXCP_INT(index);
-            cc->do_interrupt(cs);
+            cc->tcg_ops.do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
             cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 9222717f3e..b65743e8ca 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -199,7 +199,7 @@ static void crisv8_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 8;
-    cc->do_interrupt = crisv10_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
     cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
@@ -210,7 +210,7 @@ static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 9;
-    cc->do_interrupt = crisv10_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
     cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
@@ -221,7 +221,7 @@ static void crisv10_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 10;
-    cc->do_interrupt = crisv10_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
     cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
@@ -232,7 +232,7 @@ static void crisv11_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 11;
-    cc->do_interrupt = crisv10_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
     cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
@@ -243,7 +243,7 @@ static void crisv17_cpu_class_init(ObjectClass *oc, void *data)
     CRISCPUClass *ccc = CRIS_CPU_CLASS(oc);
 
     ccc->vr = 17;
-    cc->do_interrupt = crisv10_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
     cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
@@ -268,7 +268,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
-    cc->do_interrupt = cris_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = cris_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = cris_cpu_exec_interrupt;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
diff --git a/target/cris/helper.c b/target/cris/helper.c
index ed45c3d9b7..1f4d6f7d45 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -299,7 +299,7 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         && (env->pregs[PR_CCS] & I_FLAG)
         && !env->locked_irq) {
         cs->exception_index = EXCP_IRQ;
-        cc->do_interrupt(cs);
+        cc->tcg_ops.do_interrupt(cs);
         ret = true;
     }
     if (interrupt_request & CPU_INTERRUPT_NMI) {
@@ -311,7 +311,7 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         }
         if ((env->pregs[PR_CCS] & m_flag_archval)) {
             cs->exception_index = EXCP_NMI;
-            cc->do_interrupt(cs);
+            cc->tcg_ops.do_interrupt(cs);
             ret = true;
         }
     }
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d5a25014e8..68233acf53 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -140,7 +140,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
-    cc->do_interrupt = hppa_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = hppa_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6c1ebbdcc6..4a53cd89e2 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -59,7 +59,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 
 void tcg_cpu_common_class_init(CPUClass *cc)
 {
-    cc->do_interrupt = x86_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = x86_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = x86_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = x86_cpu_synchronize_from_tb;
     cc->tcg_ops.cpu_exec_enter = x86_cpu_exec_enter;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index bbe1405e32..fb3761b749 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -222,7 +222,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = lm32_cpu_class_by_name;
     cc->has_work = lm32_cpu_has_work;
-    cc->do_interrupt = lm32_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = lm32_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = lm32_cpu_exec_interrupt;
     cc->dump_state = lm32_cpu_dump_state;
     cc->set_pc = lm32_cpu_set_pc;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index e38e4d5456..69093a621f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -465,7 +465,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-    cc->do_interrupt = m68k_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = m68k_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = m68k_cpu_exec_interrupt;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 3c09507069..c93e44b8e5 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -364,7 +364,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-    cc->do_interrupt = mb_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = mb_cpu_do_interrupt;
     cc->do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 63c0f3b94c..a88a138a8d 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -676,7 +676,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-    cc->do_interrupt = mips_cpu_do_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
@@ -690,10 +689,11 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = mips_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = mips_tcg_init;
+    cc->tcg_ops.do_interrupt = mips_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
-#endif
+#endif /* CONFIG_TCG */
 
     cc->gdb_num_core_regs = 73;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 1177d092c1..36bef4d357 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -107,7 +107,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = moxie_cpu_class_by_name;
 
     cc->has_work = moxie_cpu_has_work;
-    cc->do_interrupt = moxie_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = moxie_cpu_do_interrupt;
     cc->dump_state = moxie_cpu_dump_state;
     cc->set_pc = moxie_cpu_set_pc;
     cc->tcg_ops.tlb_fill = moxie_cpu_tlb_fill;
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 1384836de0..b5fe779ceb 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -221,7 +221,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-    cc->do_interrupt = nios2_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = nios2_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = nios2_cpu_exec_interrupt;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 9857bfde23..1a31f7564f 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -186,7 +186,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-    cc->do_interrupt = openrisc_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = openrisc_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9d813924ef..345b78fc3d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -593,7 +593,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-    cc->do_interrupt = riscv_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = riscv_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 77609728b8..e79f009cbd 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -186,7 +186,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-    cc->do_interrupt = rx_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = rx_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 8ade66178e..e6cf933594 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -496,7 +496,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
 #ifdef CONFIG_TCG
-    cc->do_interrupt = s390_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = s390_cpu_do_interrupt;
 #endif
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 1f6c687c3c..f69360fc16 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -219,7 +219,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-    cc->do_interrupt = superh_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = superh_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 19e90a414d..871b2a83c6 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -863,7 +863,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
-    cc->do_interrupt = sparc_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = sparc_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = sparc_cpu_exec_interrupt;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 75b3a4bae3..7d4ead4ef1 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -147,7 +147,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = tilegx_cpu_class_by_name;
     cc->has_work = tilegx_cpu_has_work;
-    cc->do_interrupt = tilegx_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = tilegx_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index a57d315d2f..e27ffc571a 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -131,7 +131,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = uc32_cpu_class_by_name;
     cc->has_work = uc32_cpu_has_work;
-    cc->do_interrupt = uc32_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = uc32_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = uc32_cpu_exec_interrupt;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index b6f13ceb32..3ff025f0fe 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -194,7 +194,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
-    cc->do_interrupt = xtensa_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = xtensa_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 1e0fc5ac3d..b16430a9d4 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,7 +10845,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = ppc_cpu_class_by_name;
     cc->has_work = ppc_cpu_has_work;
-    cc->do_interrupt = ppc_cpu_do_interrupt;
     cc->dump_state = ppc_cpu_dump_state;
     cc->dump_statistics = ppc_cpu_dump_statistics;
     cc->set_pc = ppc_cpu_set_pc;
@@ -10883,6 +10882,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = ppc_translate_init;
     cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
+    cc->tcg_ops.do_interrupt = ppc_cpu_do_interrupt;
     cc->tcg_ops.tlb_fill = ppc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
-- 
2.26.2


