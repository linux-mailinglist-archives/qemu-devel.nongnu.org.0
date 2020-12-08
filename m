Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43EE2D3491
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:58:25 +0100 (CET)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmk40-0000F7-OI
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmizD-0001ZO-Or
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:24 -0500
Received: from mx2.suse.de ([195.135.220.15]:44160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiz7-0000zs-93
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3701BADCA;
 Tue,  8 Dec 2020 19:49:04 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v9 23/32] cpu: move cc->do_interrupt to tcg_ops
Date: Tue,  8 Dec 2020 20:48:30 +0100
Message-Id: <20201208194839.31305-24-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
References: <20201208194839.31305-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/tcg/cpu-exec.c            |  4 ++--
 include/hw/core/cpu.h           |  2 --
 include/hw/core/tcg-cpu-ops.h   |  3 +++
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  6 ++++--
 target/arm/cpu_tcg.c            |  9 ++++-----
 target/avr/cpu.c                |  2 +-
 target/avr/helper.c             |  4 ++--
 target/cris/cpu.c               | 12 ++++++------
 target/cris/helper.c            |  4 ++--
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg-cpu.c           |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  6 ++++--
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
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 28 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 343ae427a0..68ccaa76f8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -517,7 +517,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->do_interrupt(cpu);
+        cc->tcg_ops.do_interrupt(cpu);
 #endif
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
@@ -526,7 +526,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_exception()) {
             CPUClass *cc = CPU_GET_CLASS(cpu);
             qemu_mutex_lock_iothread();
-            cc->do_interrupt(cpu);
+            cc->tcg_ops.do_interrupt(cpu);
             qemu_mutex_unlock_iothread();
             cpu->exception_index = -1;
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index f438abb785..b178549d48 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -87,7 +87,6 @@ struct TranslationBlock;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @do_interrupt: Callback for interrupt handling.
  * @do_unaligned_access: Callback for unaligned access handling, if
  * the target defines #TARGET_ALIGNED_ONLY.
  * @do_transaction_failed: Callback for handling failed memory transactions
@@ -157,7 +156,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    void (*do_interrupt)(CPUState *cpu);
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index dbbc64418c..6b9b72e785 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -37,6 +37,9 @@ typedef struct TcgCpuOperations {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+    /** @do_interrupt: Callback for interrupt handling. */
+    void (*do_interrupt)(CPUState *cpu);
+
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 0369d5a99c..fde5825ebc 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -217,7 +217,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
-    cc->do_interrupt = alpha_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = alpha_cpu_do_interrupt;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 20cbfaea51..826cf8351b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -535,6 +535,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
+#ifdef CONFIG_TCG
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -584,9 +585,10 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cc->do_interrupt(cs);
+    cc->tcg_ops.do_interrupt(cs);
     return true;
 }
+#endif /* CONFIG_TCG */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
@@ -2244,7 +2246,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_interrupt = arm_cpu_do_interrupt;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
@@ -2269,6 +2270,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #if !defined(CONFIG_USER_ONLY)
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
+    cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif
 }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index a6538d3a96..e64f18a5ee 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -33,7 +33,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cc->do_interrupt(cs);
+        cc->tcg_ops.do_interrupt(cs);
         ret = true;
     }
     return ret;
@@ -624,12 +624,11 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifndef CONFIG_USER_ONLY
-    cc->do_interrupt = arm_v7m_cpu_do_interrupt;
-#endif
-
 #ifdef CONFIG_TCG
     cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+#ifndef CONFIG_USER_ONLY
+    cc->tcg_ops.do_interrupt = arm_v7m_cpu_do_interrupt;
+#endif
 #endif /* CONFIG_TCG */
 
     cc->gdb_core_xml_file = "arm-m-profile.xml";
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 699055de7c..5a5ae68444 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -197,7 +197,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
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
index e2d79f954e..cce6ae6213 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -139,7 +139,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
-    cc->do_interrupt = hppa_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = hppa_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
diff --git a/target/i386/tcg-cpu.c b/target/i386/tcg-cpu.c
index 38ed8bf6d3..d2dd521612 100644
--- a/target/i386/tcg-cpu.c
+++ b/target/i386/tcg-cpu.c
@@ -58,7 +58,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
 
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
index bc109faa21..3e84de772c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -277,7 +277,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
-    cc->do_interrupt = m68k_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = m68k_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = m68k_cpu_exec_interrupt;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 6e660a27b8..4f95248b2e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -317,7 +317,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
-    cc->do_interrupt = mb_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = mb_cpu_do_interrupt;
     cc->do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1f7573d319..dd5fb78e6c 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -234,7 +234,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-    cc->do_interrupt = mips_cpu_do_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
@@ -251,7 +250,10 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
-#endif
+#ifndef CONFIG_USER_ONLY
+    cc->tcg_ops.do_interrupt = mips_cpu_do_interrupt;
+#endif /* CONFIG_USER_ONLY */
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
index a96b74b00c..2b959f0e49 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -192,7 +192,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
-    cc->do_interrupt = nios2_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = nios2_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = nios2_cpu_exec_interrupt;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index e6d1c9764b..27105c5c09 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -154,7 +154,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-    cc->do_interrupt = openrisc_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = openrisc_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e83000b2fb..0471da0d08 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10908,7 +10908,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     pcc->parent_parse_features = cc->parse_features;
     cc->parse_features = ppc_cpu_parse_featurestr;
     cc->has_work = ppc_cpu_has_work;
-    cc->do_interrupt = ppc_cpu_do_interrupt;
     cc->dump_state = ppc_cpu_dump_state;
     cc->dump_statistics = ppc_cpu_dump_statistics;
     cc->set_pc = ppc_cpu_set_pc;
@@ -10946,6 +10945,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = ppc_translate_init;
     cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
+    cc->tcg_ops.do_interrupt = ppc_cpu_do_interrupt;
     cc->tcg_ops.tlb_fill = ppc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 31a43f7bfb..6a815569cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -539,7 +539,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
-    cc->do_interrupt = riscv_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = riscv_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c815533223..dc7d1c3c57 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -185,7 +185,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-    cc->do_interrupt = rx_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = rx_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 04856076b3..b838bd61a4 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -493,7 +493,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
 #ifdef CONFIG_TCG
-    cc->do_interrupt = s390_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = s390_cpu_do_interrupt;
 #endif
     cc->dump_state = s390_cpu_dump_state;
     cc->set_pc = s390_cpu_set_pc;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 7a9019edec..ff835d4bc1 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -218,7 +218,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
-    cc->do_interrupt = superh_cpu_do_interrupt;
+    cc->tcg_ops.do_interrupt = superh_cpu_do_interrupt;
     cc->tcg_ops.cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 760e0ea92c..3f23aa5962 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -861,7 +861,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
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
-- 
2.26.2


