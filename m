Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42930A514
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:12:02 +0100 (CET)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WBd-0001vP-JW
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8s-0008Sl-4z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:55312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W8p-0005mb-Fl
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1240EACB0;
 Mon,  1 Feb 2021 10:09:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 01/23] cpu: Introduce TCGCpuOperations struct
Date: Mon,  1 Feb 2021 11:08:41 +0100
Message-Id: <20210201100903.17309-2-cfontana@suse.de>
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
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

The TCG-specific CPU methods will be moved to a separate struct,
to make it easier to move accel-specific code outside generic CPU
code in the future.  Start by moving tcg_initialize().

The new CPUClass.tcg_opts field may eventually become a pointer,
but keep it an embedded struct for now, to make code conversion
easier.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

[claudio: move TCGCpuOperations inside include/hw/core/cpu.h]
---
 include/hw/core/cpu.h           | 16 +++++++++++++++-
 cpu.c                           |  6 +++++-
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/avr/cpu.c                |  2 +-
 target/cris/cpu.c               | 12 ++++++------
 target/hppa/cpu.c               |  2 +-
 target/i386/tcg/tcg-cpu.c       |  2 +-
 target/lm32/cpu.c               |  2 +-
 target/m68k/cpu.c               |  2 +-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  2 +-
 target/moxie/cpu.c              |  2 +-
 target/nios2/cpu.c              |  2 +-
 target/openrisc/cpu.c           |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/rx/cpu.c                 |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/tilegx/cpu.c             |  2 +-
 target/tricore/cpu.c            |  2 +-
 target/unicore32/cpu.c          |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 25 files changed, 48 insertions(+), 30 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 140fa32a5e..26b89fd7a4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -76,6 +76,19 @@ typedef struct CPUWatchpoint CPUWatchpoint;
 
 struct TranslationBlock;
 
+/**
+ * struct TcgCpuOperations: TCG operations specific to a CPU class
+ */
+typedef struct TcgCpuOperations {
+    /**
+     * @initialize: Initalize TCG state
+     *
+     * Called when the first CPU is realized.
+     */
+    void (*initialize)(void);
+
+} TcgCpuOperations;
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -222,12 +235,13 @@ struct CPUClass {
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
-    void (*tcg_initialize)(void);
 
     const char *deprecation_note;
     /* Keep non-pointer data at the end to minimize holes.  */
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
+
+    TcgCpuOperations tcg_ops;
 };
 
 /*
diff --git a/cpu.c b/cpu.c
index 0b245cda2e..79a2bf12b3 100644
--- a/cpu.c
+++ b/cpu.c
@@ -159,14 +159,18 @@ void cpu_exec_initfn(CPUState *cpu)
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
+#ifdef CONFIG_TCG
     static bool tcg_target_initialized;
+#endif /* CONFIG_TCG */
 
     cpu_list_add(cpu);
 
+#ifdef CONFIG_TCG
     if (tcg_enabled() && !tcg_target_initialized) {
         tcg_target_initialized = true;
-        cc->tcg_initialize();
+        cc->tcg_ops.initialize();
     }
+#endif /* CONFIG_TCG */
     tlb_init(cpu);
 
     qemu_plugin_vcpu_init_hook(cpu);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index b3fd6643e8..d66f0351a9 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -231,7 +231,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     dc->vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
-    cc->tcg_initialize = alpha_translate_init;
+    cc->tcg_ops.initialize = alpha_translate_init;
 
     cc->gdb_num_core_regs = 67;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141..fa4d4ba4eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2276,7 +2276,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = arm_translate_init;
+    cc->tcg_ops.initialize = arm_translate_init;
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 6f3d5a9e4a..fb66695fbb 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -207,7 +207,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->tlb_fill = avr_cpu_tlb_fill;
     cc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
-    cc->tcg_initialize = avr_cpu_tcg_init;
+    cc->tcg_ops.initialize = avr_cpu_tcg_init;
     cc->synchronize_from_tb = avr_cpu_synchronize_from_tb;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index cff6b9eabf..4328f8e6c9 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -201,7 +201,7 @@ static void crisv8_cpu_class_init(ObjectClass *oc, void *data)
     ccc->vr = 8;
     cc->do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
 
 static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
@@ -212,7 +212,7 @@ static void crisv9_cpu_class_init(ObjectClass *oc, void *data)
     ccc->vr = 9;
     cc->do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
 
 static void crisv10_cpu_class_init(ObjectClass *oc, void *data)
@@ -223,7 +223,7 @@ static void crisv10_cpu_class_init(ObjectClass *oc, void *data)
     ccc->vr = 10;
     cc->do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
 
 static void crisv11_cpu_class_init(ObjectClass *oc, void *data)
@@ -234,7 +234,7 @@ static void crisv11_cpu_class_init(ObjectClass *oc, void *data)
     ccc->vr = 11;
     cc->do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
 
 static void crisv17_cpu_class_init(ObjectClass *oc, void *data)
@@ -245,7 +245,7 @@ static void crisv17_cpu_class_init(ObjectClass *oc, void *data)
     ccc->vr = 17;
     cc->do_interrupt = crisv10_cpu_do_interrupt;
     cc->gdb_read_register = crisv10_cpu_gdb_read_register;
-    cc->tcg_initialize = cris_initialize_crisv10_tcg;
+    cc->tcg_ops.initialize = cris_initialize_crisv10_tcg;
 }
 
 static void crisv32_cpu_class_init(ObjectClass *oc, void *data)
@@ -284,7 +284,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 
     cc->disas_set_info = cris_disas_set_info;
-    cc->tcg_initialize = cris_initialize_tcg;
+    cc->tcg_ops.initialize = cris_initialize_tcg;
 }
 
 #define DEFINE_CRIS_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e28f047d10..80e3081631 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -154,7 +154,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->do_unaligned_access = hppa_cpu_do_unaligned_access;
     cc->disas_set_info = hppa_cpu_disas_set_info;
-    cc->tcg_initialize = hppa_translate_init;
+    cc->tcg_ops.initialize = hppa_translate_init;
 
     cc->gdb_num_core_regs = 128;
 }
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 4fa013720e..d90502a0cc 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -64,7 +64,7 @@ void tcg_cpu_common_class_init(CPUClass *cc)
     cc->synchronize_from_tb = x86_cpu_synchronize_from_tb;
     cc->cpu_exec_enter = x86_cpu_exec_enter;
     cc->cpu_exec_exit = x86_cpu_exec_exit;
-    cc->tcg_initialize = tcg_x86_init;
+    cc->tcg_ops.initialize = tcg_x86_init;
     cc->tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->debug_excp_handler = breakpoint_handler;
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c50ad5fa15..ef795b81a4 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -237,7 +237,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->debug_excp_handler = lm32_debug_excp_handler;
     cc->disas_set_info = lm32_cpu_disas_set_info;
-    cc->tcg_initialize = lm32_translate_init;
+    cc->tcg_ops.initialize = lm32_translate_init;
 }
 
 #define DEFINE_LM32_CPU_TYPE(cpu_model, initfn) \
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index b811a0bdde..3604ece49b 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -478,7 +478,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     dc->vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
-    cc->tcg_initialize = m68k_tcg_init;
+    cc->tcg_ops.initialize = m68k_tcg_init;
 
     cc->gdb_num_core_regs = 18;
 }
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index d5e8bfe11f..f2978ca726 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -382,7 +382,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 32 + 27;
 
     cc->disas_set_info = mb_disas_set_info;
-    cc->tcg_initialize = mb_tcg_init;
+    cc->tcg_ops.initialize = mb_tcg_init;
 }
 
 static const TypeInfo mb_cpu_type_info = {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4c4548233c..b96c3d5969 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -689,7 +689,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = mips_cpu_disas_set_info;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = mips_tcg_init;
+    cc->tcg_ops.initialize = mips_tcg_init;
     cc->tlb_fill = mips_cpu_tlb_fill;
 #endif
 
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 6e0443ccb7..224cfc8361 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -116,7 +116,7 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_moxie_cpu;
 #endif
     cc->disas_set_info = moxie_cpu_disas_set_info;
-    cc->tcg_initialize = moxie_translate_init;
+    cc->tcg_ops.initialize = moxie_translate_init;
 }
 
 static void moxielite_initfn(Object *obj)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 58688e1623..c28eb05ef0 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -234,7 +234,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 49;
-    cc->tcg_initialize = nios2_tcg_init;
+    cc->tcg_ops.initialize = nios2_tcg_init;
 }
 
 static const TypeInfo nios2_cpu_type_info = {
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b0bdfbe4fe..a957f59e2e 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -198,7 +198,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     dc->vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
-    cc->tcg_initialize = openrisc_translate_init;
+    cc->tcg_ops.initialize = openrisc_translate_init;
     cc->disas_set_info = openrisc_disas_set_info;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 27788021eb..567f6790a9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -618,7 +618,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = riscv_translate_init;
+    cc->tcg_ops.initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
 #endif
     device_class_set_props(dc, riscv_cpu_properties);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 2bb14144a7..cdcab49c8a 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -195,7 +195,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
-    cc->tcg_initialize = rx_translate_init;
+    cc->tcg_ops.initialize = rx_translate_init;
     cc->tlb_fill = rx_cpu_tlb_fill;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7da70afbf2..890781e74c 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -515,7 +515,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = s390x_translate_init;
+    cc->tcg_ops.initialize = s390x_translate_init;
     cc->tlb_fill = s390_cpu_tlb_fill;
 #endif
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 1e0f05a15b..b86753cda5 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -232,7 +232,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
-    cc->tcg_initialize = sh4_translate_init;
+    cc->tcg_ops.initialize = sh4_translate_init;
 
     cc->gdb_num_core_regs = 59;
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 6f14e370ed..3ab71e9d00 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -881,7 +881,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->vmsd = &vmstate_sparc_cpu;
 #endif
     cc->disas_set_info = cpu_sparc_disas_set_info;
-    cc->tcg_initialize = sparc_tcg_init;
+    cc->tcg_ops.initialize = sparc_tcg_init;
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
     cc->gdb_num_core_regs = 86;
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 1fee87c094..cd24d0eb9d 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -153,7 +153,7 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = tilegx_cpu_set_pc;
     cc->tlb_fill = tilegx_cpu_tlb_fill;
     cc->gdb_num_core_regs = 0;
-    cc->tcg_initialize = tilegx_tcg_init;
+    cc->tcg_ops.initialize = tilegx_tcg_init;
 }
 
 static const TypeInfo tilegx_cpu_type_info = {
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 4bff1d4718..bf135af40f 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -164,7 +164,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->set_pc = tricore_cpu_set_pc;
     cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
     cc->get_phys_page_debug = tricore_cpu_get_phys_page_debug;
-    cc->tcg_initialize = tricore_tcg_init;
+    cc->tcg_ops.initialize = tricore_tcg_init;
     cc->tlb_fill = tricore_cpu_tlb_fill;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index b27fb9689f..226bf4226e 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -137,7 +137,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = uc32_cpu_set_pc;
     cc->tlb_fill = uc32_cpu_tlb_fill;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    cc->tcg_initialize = uc32_translate_init;
+    cc->tcg_ops.initialize = uc32_translate_init;
     dc->vmsd = &vmstate_uc32_cpu;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 88a32268a1..5a6f5bf88b 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -209,7 +209,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    cc->tcg_initialize = xtensa_translate_init;
+    cc->tcg_ops.initialize = xtensa_translate_init;
     dc->vmsd = &vmstate_xtensa_cpu;
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 3c05a17343..189f27cd1c 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10878,7 +10878,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = ppc_translate_init;
+    cc->tcg_ops.initialize = ppc_translate_init;
     cc->tlb_fill = ppc_cpu_tlb_fill;
 #endif
 #ifndef CONFIG_USER_ONLY
-- 
2.26.2


