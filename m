Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5D72CFC22
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:44:39 +0100 (CET)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klafm-0004ng-Ta
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaE2-00012E-8d
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:48714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1klaDt-0000Cj-0V
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:15:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A16E7ADE1;
 Sat,  5 Dec 2020 16:15:37 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v8 18/27] cpu: Move cpu_exec_* to tcg_ops
Date: Sat,  5 Dec 2020 17:15:09 +0100
Message-Id: <20201205161518.14365-19-cfontana@suse.de>
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
 accel/tcg/cpu-exec.c            | 12 ++++++------
 include/hw/core/cpu.h           |  6 ------
 include/hw/core/tcg-cpu-ops.h   |  9 +++++++++
 target/alpha/cpu.c              |  3 ++-
 target/arm/cpu.c                |  2 +-
 target/arm/cpu64.c              |  5 ++++-
 target/arm/cpu_tcg.c            |  5 ++++-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               |  2 +-
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg-cpu.c           |  6 +++---
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/ppc/translate_init.c.inc | 10 +++++-----
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 26 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 776415d47e..edb349835e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -240,8 +240,8 @@ static void cpu_exec_enter(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->cpu_exec_enter) {
-        cc->cpu_exec_enter(cpu);
+    if (cc->tcg_ops.cpu_exec_enter) {
+        cc->tcg_ops.cpu_exec_enter(cpu);
     }
 }
 
@@ -249,8 +249,8 @@ static void cpu_exec_exit(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->cpu_exec_exit) {
-        cc->cpu_exec_exit(cpu);
+    if (cc->tcg_ops.cpu_exec_exit) {
+        cc->tcg_ops.cpu_exec_exit(cpu);
     }
 }
 
@@ -625,8 +625,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
-            if (cc->cpu_exec_interrupt &&
-                cc->cpu_exec_interrupt(cpu, interrupt_request)) {
+            if (cc->tcg_ops.cpu_exec_interrupt &&
+                cc->tcg_ops.cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
                     replay_interrupt();
                 }
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 83007d262c..52142e9094 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -146,9 +146,6 @@ struct TranslationBlock;
  * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
  *   gdb stub. Returns a pointer to the XML contents for the specified XML file
  *   or NULL if the CPU doesn't have a dynamically generated content for it.
- * @cpu_exec_enter: Callback for cpu_exec preparation.
- * @cpu_exec_exit: Callback for cpu_exec cleanup.
- * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
  * @disas_set_info: Setup architecture specific components of disassembly info
  * @adjust_watchpoint_address: Perform a target-specific adjustment to an
  * address before attempting to match it against watchpoints.
@@ -211,9 +208,6 @@ struct CPUClass {
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
-    void (*cpu_exec_enter)(CPUState *cpu);
-    void (*cpu_exec_exit)(CPUState *cpu);
-    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 109291ac52..e12f32919b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -10,6 +10,9 @@
 #ifndef TCG_CPU_OPS_H
 #define TCG_CPU_OPS_H
 
+/**
+ * struct TcgCpuOperations: TCG operations specific to a CPU class
+ */
 typedef struct TcgCpuOperations {
     /**
      * @initialize: Initalize TCG state
@@ -28,6 +31,12 @@ typedef struct TcgCpuOperations {
      * @set_pc(tb->pc).
      */
     void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
+    /** @cpu_exec_enter: Callback for cpu_exec preparation */
+    void (*cpu_exec_enter)(CPUState *cpu);
+    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
+    void (*cpu_exec_exit)(CPUState *cpu);
+    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
 } TcgCpuOperations;
 
 #endif /* TCG_CPU_OPS_H */
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index d66f0351a9..4f206c154d 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,7 +218,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
     cc->do_interrupt = alpha_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = alpha_cpu_exec_interrupt;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
@@ -234,6 +233,8 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.initialize = alpha_translate_init;
 
     cc->gdb_num_core_regs = 67;
+
+    cc->tcg_ops.cpu_exec_interrupt = alpha_cpu_exec_interrupt;
 }
 
 #define DEFINE_ALPHA_CPU_TYPE(base_type, cpu_model, initfn) \
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2f9e27c248..470b7b48c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2239,7 +2239,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
-    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
@@ -2261,6 +2260,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = arm_translate_init;
+    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082f..ebc53c8bdc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -784,7 +784,10 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-    cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
+#ifdef CONFIG_TCG
+    cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
+#endif /* CONFIG_TCG */
+
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 34;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 0013e25412..a6538d3a96 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -628,7 +628,10 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
-    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+#ifdef CONFIG_TCG
+    cc->tcg_ops.cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
+#endif /* CONFIG_TCG */
+
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index f753c15768..277b00dbfc 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -198,7 +198,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->has_work = avr_cpu_has_work;
     cc->do_interrupt = avr_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = avr_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = avr_cpu_exec_interrupt;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 4328f8e6c9..7489fc20c8 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -269,7 +269,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = cris_cpu_class_by_name;
     cc->has_work = cris_cpu_has_work;
     cc->do_interrupt = cris_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = cris_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = cris_cpu_exec_interrupt;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 12a09e93ae..61444753f2 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -140,7 +140,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = hppa_cpu_class_by_name;
     cc->has_work = hppa_cpu_has_work;
     cc->do_interrupt = hppa_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = hppa_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = hppa_cpu_exec_interrupt;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = hppa_cpu_synchronize_from_tb;
diff --git a/target/i386/tcg-cpu.c b/target/i386/tcg-cpu.c
index d1414e2970..5e0f2a2fae 100644
--- a/target/i386/tcg-cpu.c
+++ b/target/i386/tcg-cpu.c
@@ -59,10 +59,10 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
 void tcg_cpu_common_class_init(CPUClass *cc)
 {
     cc->do_interrupt = x86_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = x86_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = x86_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = x86_cpu_synchronize_from_tb;
-    cc->cpu_exec_enter = x86_cpu_exec_enter;
-    cc->cpu_exec_exit = x86_cpu_exec_exit;
+    cc->tcg_ops.cpu_exec_enter = x86_cpu_exec_enter;
+    cc->tcg_ops.cpu_exec_exit = x86_cpu_exec_exit;
     cc->tcg_ops.initialize = tcg_x86_init;
     cc->tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index ef795b81a4..eea2d3e515 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -223,7 +223,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = lm32_cpu_class_by_name;
     cc->has_work = lm32_cpu_has_work;
     cc->do_interrupt = lm32_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = lm32_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = lm32_cpu_exec_interrupt;
     cc->dump_state = lm32_cpu_dump_state;
     cc->set_pc = lm32_cpu_set_pc;
     cc->gdb_read_register = lm32_cpu_gdb_read_register;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b66d86c353..c0fa517fc3 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -278,7 +278,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = m68k_cpu_class_by_name;
     cc->has_work = m68k_cpu_has_work;
     cc->do_interrupt = m68k_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = m68k_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = m68k_cpu_exec_interrupt;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 97d94d9c27..833d7f2d59 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -319,7 +319,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = mb_cpu_has_work;
     cc->do_interrupt = mb_cpu_do_interrupt;
     cc->do_unaligned_access = mb_cpu_do_unaligned_access;
-    cc->cpu_exec_interrupt = mb_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = mb_cpu_synchronize_from_tb;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 71c488f3dd..344ee402fc 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -235,7 +235,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
     cc->do_interrupt = mips_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
@@ -249,6 +248,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = mips_cpu_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = mips_tcg_init;
+    cc->tcg_ops.cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = mips_cpu_synchronize_from_tb;
     cc->tlb_fill = mips_cpu_tlb_fill;
 #endif
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 29c9c6f634..9eeb01fb5b 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -193,7 +193,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = nios2_cpu_class_by_name;
     cc->has_work = nios2_cpu_has_work;
     cc->do_interrupt = nios2_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = nios2_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = nios2_cpu_exec_interrupt;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index e442f4f97c..df8a41f956 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -155,7 +155,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
     cc->do_interrupt = openrisc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = openrisc_cpu_exec_interrupt;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9a6932b774..e0edbac999 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10909,7 +10909,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->parse_features = ppc_cpu_parse_featurestr;
     cc->has_work = ppc_cpu_has_work;
     cc->do_interrupt = ppc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = ppc_cpu_exec_interrupt;
     cc->dump_state = ppc_cpu_dump_state;
     cc->dump_statistics = ppc_cpu_dump_statistics;
     cc->set_pc = ppc_cpu_set_pc;
@@ -10946,12 +10945,13 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 #ifdef CONFIG_TCG
     cc->tcg_ops.initialize = ppc_translate_init;
+    cc->tcg_ops.cpu_exec_interrupt = ppc_cpu_exec_interrupt;
     cc->tlb_fill = ppc_cpu_tlb_fill;
-#endif
 #ifndef CONFIG_USER_ONLY
-    cc->cpu_exec_enter = ppc_cpu_exec_enter;
-    cc->cpu_exec_exit = ppc_cpu_exec_exit;
-#endif
+    cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
+    cc->tcg_ops.cpu_exec_exit = ppc_cpu_exec_exit;
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
 
     cc->disas_set_info = ppc_disas_set_info;
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index de44e323ae..97dbe1a08c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -540,7 +540,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
     cc->do_interrupt = riscv_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = riscv_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = riscv_cpu_exec_interrupt;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = riscv_cpu_synchronize_from_tb;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index d03c4e0b05..3ba93590d2 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -186,7 +186,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
     cc->do_interrupt = rx_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = rx_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = rx_cpu_exec_interrupt;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = rx_cpu_synchronize_from_tb;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 697b94ff7b..add2f4b21f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -505,7 +505,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
-    cc->cpu_exec_interrupt = s390_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
     cc->debug_excp_handler = s390x_cpu_debug_excp_handler;
     cc->do_unaligned_access = s390x_cpu_do_unaligned_access;
 #endif
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index a33025b5c8..0574194cd0 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -219,7 +219,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
     cc->do_interrupt = superh_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = superh_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = superh_cpu_exec_interrupt;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->tcg_ops.synchronize_from_tb = superh_cpu_synchronize_from_tb;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index baf6c5b587..c559f15e14 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -862,7 +862,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->parse_features = sparc_cpu_parse_features;
     cc->has_work = sparc_cpu_has_work;
     cc->do_interrupt = sparc_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = sparc_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = sparc_cpu_exec_interrupt;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index cd24d0eb9d..4c6176d26e 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -148,7 +148,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = tilegx_cpu_class_by_name;
     cc->has_work = tilegx_cpu_has_work;
     cc->do_interrupt = tilegx_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = tilegx_cpu_exec_interrupt;
     cc->dump_state = tilegx_cpu_dump_state;
     cc->set_pc = tilegx_cpu_set_pc;
     cc->tlb_fill = tilegx_cpu_tlb_fill;
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 226bf4226e..84c3419989 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -132,7 +132,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = uc32_cpu_class_by_name;
     cc->has_work = uc32_cpu_has_work;
     cc->do_interrupt = uc32_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = uc32_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = uc32_cpu_exec_interrupt;
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->tlb_fill = uc32_cpu_tlb_fill;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 5a6f5bf88b..42a5e4ebe8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -195,7 +195,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = xtensa_cpu_class_by_name;
     cc->has_work = xtensa_cpu_has_work;
     cc->do_interrupt = xtensa_cpu_do_interrupt;
-    cc->cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
+    cc->tcg_ops.cpu_exec_interrupt = xtensa_cpu_exec_interrupt;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.26.2


