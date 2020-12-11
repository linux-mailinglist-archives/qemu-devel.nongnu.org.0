Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82412D720C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 09:44:40 +0100 (CET)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kne2Z-00076Y-St
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 03:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kndqa-0008Hl-5k
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:32:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:35174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kndqR-00029g-JL
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:32:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35E7BB13A;
 Fri, 11 Dec 2020 08:31:56 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v11 15/25] cpu: Introduce TCGCpuOperations struct
Date: Fri, 11 Dec 2020 09:31:33 +0100
Message-Id: <20201211083143.14350-16-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211083143.14350-1-cfontana@suse.de>
References: <20201211083143.14350-1-cfontana@suse.de>
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
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Claudio Fontana <cfontana@suse.de>
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

[claudio: make the tcg code build for CONFIG_TCG only]

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h           |  9 ++++++++-
 include/hw/core/tcg-cpu-ops.h   | 25 +++++++++++++++++++++++++
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
 MAINTAINERS                     |  1 +
 target/ppc/translate_init.c.inc |  2 +-
 27 files changed, 67 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/core/tcg-cpu-ops.h

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3d92c967ff..c93b08a0fb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -76,6 +76,10 @@ typedef struct CPUWatchpoint CPUWatchpoint;
 
 struct TranslationBlock;
 
+#ifdef CONFIG_TCG
+#include "tcg-cpu-ops.h"
+#endif /* CONFIG_TCG */
+
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
@@ -221,12 +225,15 @@ struct CPUClass {
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
     vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
-    void (*tcg_initialize)(void);
 
     const char *deprecation_note;
     /* Keep non-pointer data at the end to minimize holes.  */
     int gdb_num_core_regs;
     bool gdb_stop_before_watchpoint;
+
+#ifdef CONFIG_TCG
+    TcgCpuOperations tcg_ops;
+#endif /* CONFIG_TCG */
 };
 
 /*
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
new file mode 100644
index 0000000000..4475ef0996
--- /dev/null
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -0,0 +1,25 @@
+/*
+ * TCG-Specific operations that are not meaningful for hardware accelerators
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef TCG_CPU_OPS_H
+#define TCG_CPU_OPS_H
+
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
+} TcgCpuOperations;
+
+#endif /* TCG_CPU_OPS_H */
diff --git a/cpu.c b/cpu.c
index 0be5dcb6f3..27ad096cc4 100644
--- a/cpu.c
+++ b/cpu.c
@@ -174,14 +174,18 @@ void cpu_exec_initfn(CPUState *cpu)
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
index 07492e9f9a..1fa9382a7c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2261,7 +2261,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = arm_translate_init;
+    cc->tcg_ops.initialize = arm_translate_init;
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d9c4ad5bf..94306a2aa0 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -206,7 +206,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
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
index 71b6aca45d..4c778966c2 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -153,7 +153,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->do_unaligned_access = hppa_cpu_do_unaligned_access;
     cc->disas_set_info = hppa_cpu_disas_set_info;
-    cc->tcg_initialize = hppa_translate_init;
+    cc->tcg_ops.initialize = hppa_translate_init;
 
     cc->gdb_num_core_regs = 128;
 }
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 628dd29fe7..1f2a3e881a 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -63,7 +63,7 @@ void tcg_cpu_common_class_init(CPUClass *cc)
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
index 72c545149e..b66d86c353 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -289,7 +289,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
-    cc->tcg_initialize = m68k_tcg_init;
+    cc->tcg_ops.initialize = m68k_tcg_init;
 
     cc->gdb_num_core_regs = 18;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 9b2482159d..bc10518fa3 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -335,7 +335,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 32 + 27;
 
     cc->disas_set_info = mb_disas_set_info;
-    cc->tcg_initialize = mb_tcg_init;
+    cc->tcg_ops.initialize = mb_tcg_init;
 }
 
 static const TypeInfo mb_cpu_type_info = {
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 76d50b00b4..bc48573763 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -249,7 +249,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
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
index 8f7011fcb9..29c9c6f634 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -205,7 +205,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
     cc->gdb_write_register = nios2_cpu_gdb_write_register;
     cc->gdb_num_core_regs = 49;
-    cc->tcg_initialize = nios2_tcg_init;
+    cc->tcg_ops.initialize = nios2_tcg_init;
 }
 
 static const TypeInfo nios2_cpu_type_info = {
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 5528c0918f..e442f4f97c 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -166,7 +166,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     dc->vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
-    cc->tcg_initialize = openrisc_translate_init;
+    cc->tcg_ops.initialize = openrisc_translate_init;
     cc->disas_set_info = openrisc_disas_set_info;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a0264fc6b..a52e0ce466 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,7 +562,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = riscv_translate_init;
+    cc->tcg_ops.initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
 #endif
     device_class_set_props(dc, riscv_cpu_properties);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 23ee17a701..a701a09b11 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -194,7 +194,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->get_phys_page_debug = rx_cpu_get_phys_page_debug;
     cc->disas_set_info = rx_cpu_disas_set_info;
-    cc->tcg_initialize = rx_translate_init;
+    cc->tcg_ops.initialize = rx_translate_init;
     cc->tlb_fill = rx_cpu_tlb_fill;
 
     cc->gdb_num_core_regs = 26;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b66718c44..697b94ff7b 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -512,7 +512,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
 #ifdef CONFIG_TCG
-    cc->tcg_initialize = s390x_translate_init;
+    cc->tcg_ops.initialize = s390x_translate_init;
     cc->tlb_fill = s390_cpu_tlb_fill;
 #endif
 
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 3c68021c56..bdc5c9d90b 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -231,7 +231,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
-    cc->tcg_initialize = sh4_translate_init;
+    cc->tcg_ops.initialize = sh4_translate_init;
 
     cc->gdb_num_core_regs = 59;
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 701e794eac..07e48b86d1 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -879,7 +879,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
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
index 2f2e5b029f..78b2925955 100644
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
 
diff --git a/MAINTAINERS b/MAINTAINERS
index f53f2678d8..d876f504a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1535,6 +1535,7 @@ F: qapi/machine.json
 F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
+F: include/hw/core/tcg-cpu-ops.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
 T: git https://github.com/ehabkost/qemu.git machine-next
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 78cc8f043b..9a6932b774 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10945,7 +10945,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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


