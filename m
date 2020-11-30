Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7F2C7D00
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:50:43 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZH0-0003ww-8G
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ33-0001YR-Gg
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:57802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2s-0004qj-Kb
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:36:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63026AE38;
 Mon, 30 Nov 2020 02:35:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v7 21/22] cpu-exec: refactor realizefn for all targets
Date: Mon, 30 Nov 2020 03:35:34 +0100
Message-Id: <20201130023535.16689-22-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130023535.16689-1-cfontana@suse.de>
References: <20201130023535.16689-1-cfontana@suse.de>
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

cpu_exec_realizefn and cpu_exec_unrealizefn are
TCG-only stuff, related to accel/tcg/cpu-exec.c

Introduce cpu_accel_realize to call it (for tcg-only),
and to call the other accel-specific arch-specific
realize functions if any are registered.

The only part that is not TCG-specific is common code
that should go in common_cpu_ code (hw/core/cpu.c)
base realizefn and unrealizefn (cpu_list_add, cpu_list_remove).

calls to cpu_exec_realizefn need not happen in each target
target/XXX/cpu.c, these calls can be centralized,
as part of the acceleration cpu interface,

and the call to qemu_init_vcpu can also be done in the
common cpu code.

The target/XXX/cpu.c realizefn body is now:

void mycpu_realizefn(DeviceState *dev, Error **errp)
{
    /* ... */
    cpu_accel_realize(CPU_STATE(dev), errp);

    /* ... anything that needs done pre-qemu_vcpu_init */

    scc->parent_realize(dev, errp); /* does qemu_vcpu_init */

    /* ... anything that needs to be done after qemu_vcpu_init */
}

Note: better do some testing for all targets for this.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/tcg/cpu-exec.c            | 48 +++++++++++++++++++++++++++++
 cpu.c                           | 53 +++------------------------------
 hw/core/cpu.c                   | 22 ++++++++++++++
 include/exec/cpu-all.h          |  4 +++
 include/hw/core/cpu.h           | 12 ++++++++
 target/alpha/cpu.c              |  5 +---
 target/arm/cpu.c                |  6 ++--
 target/avr/cpu.c                |  5 ++--
 target/cris/cpu.c               |  4 +--
 target/hppa/cpu.c               |  3 +-
 target/i386/cpu.c               | 20 ++++---------
 target/lm32/cpu.c               |  5 +---
 target/m68k/cpu.c               |  4 +--
 target/microblaze/cpu.c         |  9 ++----
 target/mips/cpu.c               |  4 +--
 target/moxie/cpu.c              |  6 ++--
 target/nios2/cpu.c              |  6 ++--
 target/openrisc/cpu.c           |  6 ++--
 target/ppc/translate_init.c.inc |  7 ++---
 target/riscv/cpu.c              | 10 +++----
 target/rx/cpu.c                 | 10 +++----
 target/s390x/cpu.c              |  5 ++--
 target/sh4/cpu.c                |  4 +--
 target/sparc/cpu.c              |  6 ++--
 target/tilegx/cpu.c             |  4 +--
 target/tricore/cpu.c            |  4 +--
 target/unicore32/cpu.c          |  6 +---
 target/xtensa/cpu.c             |  4 +--
 28 files changed, 134 insertions(+), 148 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index bd4ff224ee..24cd18f81b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -40,6 +40,8 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "migration/vmstate.h"
+#include "sysemu/tcg.h"
 
 /* -icount align implementation. */
 
@@ -801,6 +803,52 @@ int cpu_exec(CPUState *cpu)
     return ret;
 }
 
+void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    static bool tcg_target_initialized;
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (tcg_enabled() && !tcg_target_initialized) {
+        tcg_target_initialized = true;
+        cc->tcg_ops.initialize();
+    }
+    tlb_init(cpu);
+
+    qemu_plugin_vcpu_init_hook(cpu);
+
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd == NULL);
+#else /* !CONFIG_USER_ONLY */
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
+    }
+    if (cc->vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
+    }
+
+    tcg_iommu_init_notifier_list(cpu);
+#endif /* CONFIG_USER_ONLY */
+}
+
+void cpu_exec_unrealizefn(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    tlb_destroy(cpu);
+
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd == NULL);
+#else
+    if (cc->vmsd != NULL) {
+        vmstate_unregister(NULL, cc->vmsd, cpu);
+    }
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
+    }
+    tcg_iommu_free_notifier_list(cpu);
+#endif
+}
+
 #ifndef CONFIG_USER_ONLY
 
 void dump_drift_info(void)
diff --git a/cpu.c b/cpu.c
index d02c2a17f1..a366c10181 100644
--- a/cpu.c
+++ b/cpu.c
@@ -124,26 +124,6 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_unrealizefn(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    tlb_destroy(cpu);
-    cpu_list_remove(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
-#else
-    if (cc->vmsd != NULL) {
-        vmstate_unregister(NULL, cc->vmsd, cpu);
-    }
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
-    }
-    tcg_iommu_free_notifier_list(cpu);
-#endif
-}
-
 Property cpu_common_props[] = {
 #ifndef CONFIG_USER_ONLY
     /* Create a memory property for softmmu CPU object,
@@ -159,6 +139,10 @@ Property cpu_common_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/*
+ * this code needs to be here instead of just in hw/core/cpu.c,
+ * because there we cannot really use CONFIG_USER_ONLY
+ */
 void cpu_exec_initfn(CPUState *cpu)
 {
     cpu->as = NULL;
@@ -171,35 +155,6 @@ void cpu_exec_initfn(CPUState *cpu)
 #endif
 }
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    static bool tcg_target_initialized;
-
-    cpu_list_add(cpu);
-
-    if (tcg_enabled() && !tcg_target_initialized) {
-        tcg_target_initialized = true;
-        cc->tcg_ops.initialize();
-    }
-    tlb_init(cpu);
-
-    qemu_plugin_vcpu_init_hook(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    assert(cc->vmsd == NULL);
-#else /* !CONFIG_USER_ONLY */
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
-    }
-    if (cc->vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
-    }
-
-    tcg_iommu_init_notifier_list(cpu);
-#endif
-}
-
 const char *parse_cpu_option(const char *cpu_option)
 {
     ObjectClass *oc;
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 994a12cb35..b1a495a383 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -238,6 +238,20 @@ void cpu_reset(CPUState *cpu)
     trace_guest_cpu_reset(cpu);
 }
 
+void cpu_accel_realize(CPUState *cpu, Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+#ifdef CONFIG_TCG
+    /* NB: errp parameter is (still?) unused in cpu_exec_realizefn */
+    cpu_exec_realizefn(cpu, errp);
+#endif /* CONFIG_TCG */
+
+    if (cc->accel_cpu_interface) {
+        cc->accel_cpu_interface->cpu_realizefn(cpu, errp);
+    }
+}
+
 static void cpu_common_reset(DeviceState *dev)
 {
     CPUState *cpu = CPU(dev);
@@ -314,6 +328,9 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
     CPUState *cpu = CPU(dev);
     Object *machine = qdev_get_machine();
 
+    cpu_list_add(cpu);
+    qemu_init_vcpu(cpu);
+
     /* qdev_get_machine() can return something that's not TYPE_MACHINE
      * if this is one of the user-only emulators; in that case there's
      * no need to check the ignore_memory_transaction_failures board flag.
@@ -342,8 +359,13 @@ static void cpu_common_unrealizefn(DeviceState *dev)
     CPUState *cpu = CPU(dev);
     /* NOTE: latest generic point before the cpu is fully unrealized */
     trace_fini_vcpu(cpu);
+
+#ifdef CONFIG_TCG
     qemu_plugin_vcpu_exit_hook(cpu);
     cpu_exec_unrealizefn(cpu);
+#endif /* CONFIG_TCG */
+
+    cpu_list_remove(cpu);
 }
 
 static void cpu_common_initfn(Object *obj)
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4b5408c341..ee9630da2b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -421,6 +421,10 @@ void dump_opcount_info(void);
 int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
                         void *ptr, target_ulong len, bool is_write);
 
+/*
+ * note: cpu_exec is TCG only, but we cannot wrap it in
+ * ifdef CONFIG_TCG currently due to header file mess.
+ */
 int cpu_exec(CPUState *cpu);
 
 /**
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9f00c6635b..403f614559 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -677,6 +677,12 @@ void cpu_list_remove(CPUState *cpu);
  */
 void cpu_reset(CPUState *cpu);
 
+/**
+ * cpu_accel_realize:
+ * @cpu: The CPU whose accel cpu interface is to be realized.
+ */
+void cpu_accel_realize(CPUState *cpu, Error **errp);
+
 /**
  * cpu_class_by_name:
  * @typename: The CPU base type.
@@ -1107,9 +1113,15 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 extern Property cpu_common_props[];
+
+/* $(top_srcdir)/cpu.c */
 void cpu_exec_initfn(CPUState *cpu);
+
+#ifdef CONFIG_TCG
+/* accel/tcg/cpu-exec.c */
 void cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
+#endif /* CONFIG_TCG */
 
 /**
  * target_words_bigendian:
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 0369d5a99c..477ac70224 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -56,18 +56,15 @@ static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 
 static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     AlphaCPUClass *acc = ALPHA_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-
     acc->parent_realize(dev, errp);
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1553d7b53c..6432af1842 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1396,7 +1396,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -1857,10 +1857,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     acc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 699055de7c..20f7713bc4 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -92,15 +92,14 @@ static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
     AVRCPUClass *mcc = AVR_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
 
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void avr_cpu_set_int(void *opaque, int irq, int level)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 9222717f3e..ad052c62fe 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -128,15 +128,13 @@ static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
     CRISCPUClass *ccc = CRIS_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     ccc->parent_realize(dev, errp);
 }
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e2d79f954e..2236053c68 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -93,13 +93,12 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
     HPPACPUClass *acc = HPPA_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
     acc->parent_realize(dev, errp);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 27fba3b003..485f3bc97b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6280,16 +6280,16 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
 
-    /* The accelerator realizefn needs to be called first. */
-    if (cc->accel_cpu_interface) {
-        cc->accel_cpu_interface->cpu_realizefn(cs, errp);
+    cpu_accel_realize(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
@@ -6405,13 +6405,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         env->cache_info_amd.l3_cache = &legacy_l3_cache;
     }
 
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
@@ -6426,8 +6419,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     mce_init(cpu);
 
-    qemu_init_vcpu(cs);
-
+    xcc->parent_realize(dev, &local_err);
     /*
      * Most Intel and certain AMD CPUs support hyperthreading. Even though QEMU
      * fixes this issue by adjusting CPUID_0000_0001_EBX and CPUID_8000_0008_ECX
@@ -6454,8 +6446,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     cpu_reset(cs);
 
-    xcc->parent_realize(dev, &local_err);
-
 out:
     if (local_err != NULL) {
         error_propagate(errp, local_err);
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index bbe1405e32..fa68cd7d61 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -126,16 +126,13 @@ static void lm32_cpu_realizefn(DeviceState *dev, Error **errp)
     LM32CPUClass *lcc = LM32_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
     cpu_reset(cs);
-
-    qemu_init_vcpu(cs);
-
     lcc->parent_realize(dev, errp);
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index bc109faa21..9f2cd492db 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -239,7 +239,7 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
 
     register_m68k_insns(&cpu->env);
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -248,8 +248,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
     m68k_cpu_init_gdb(cpu);
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     mcc->parent_realize(dev, errp);
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 6e660a27b8..03e317bf2e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -145,15 +145,14 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     MicroBlazeCPUClass *mcc = MICROBLAZE_CPU_GET_CLASS(dev);
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(dev);
     uint8_t version_code = 0;
     const char *version;
     int i = 0;
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -165,7 +164,7 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_init_vcpu(cs);
+    mcc->parent_realize(dev, errp);
 
     version = cpu->cfg.version ? cpu->cfg.version : DEFAULT_CPU_VERSION;
     for (i = 0; mb_cpu_lookup[i].name && version; i++) {
@@ -231,8 +230,6 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
     cpu->cfg.mmu_tlb_access = 3;
     cpu->cfg.mmu_zones = 16;
     cpu->cfg.addr_mask = MAKE_64BIT_MASK(0, cpu->cfg.addr_size);
-
-    mcc->parent_realize(dev, errp);
 }
 
 static void mb_cpu_initfn(Object *obj)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 02fae64ce7..dad6701b04 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -173,7 +173,7 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     mips_cp0_period_set(cpu);
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -182,8 +182,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
     cpu_mips_realize_env(&cpu->env);
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     mcc->parent_realize(dev, errp);
 }
 
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 1177d092c1..12234c32be 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -60,16 +60,14 @@ static void moxie_cpu_realizefn(DeviceState *dev, Error **errp)
     MoxieCPUClass *mcc = MOXIE_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void moxie_cpu_initfn(Object *obj)
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a96b74b00c..f5380f1935 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -86,16 +86,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     ncc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index e6d1c9764b..f247b3dec2 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -71,16 +71,14 @@ static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
     OpenRISCCPUClass *occ = OPENRISC_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     occ->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void openrisc_cpu_initfn(Object *obj)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e6426a96b5..66c18e54f8 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10093,14 +10093,14 @@ static int ppc_fixup_cpu(PowerPCCPU *cpu)
     return 0;
 }
 
-static void ppc_cpu_realize(DeviceState *dev, Error **errp)
+static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     PowerPCCPU *cpu = POWERPC_CPU(dev);
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -10143,7 +10143,6 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
     gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
                              pcc->gdb_num_sprs, "power-spr.xml", 0);
 #endif
-    qemu_init_vcpu(cs);
 
     pcc->parent_realize(dev, errp);
 
@@ -10894,7 +10893,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
     DeviceClass *dc = DEVICE_CLASS(oc);
 
-    device_class_set_parent_realize(dc, ppc_cpu_realize,
+    device_class_set_parent_realize(dc, ppc_cpu_realizefn,
                                     &pcc->parent_realize);
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 022b4271d4..fbc7cd8839 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -341,7 +341,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 #endif
 }
 
-static void riscv_cpu_realize(DeviceState *dev, Error **errp)
+static void riscv_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
@@ -352,7 +352,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -486,10 +486,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     mcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void riscv_cpu_init(Object *obj)
@@ -532,7 +530,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     CPUClass *cc = CPU_CLASS(c);
     DeviceClass *dc = DEVICE_CLASS(c);
 
-    device_class_set_parent_realize(dc, riscv_cpu_realize,
+    device_class_set_parent_realize(dc, riscv_cpu_realizefn,
                                     &mcc->parent_realize);
 
     device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_reset);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c815533223..0dc43506b0 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -105,22 +105,20 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-static void rx_cpu_realize(DeviceState *dev, Error **errp)
+static void rx_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     RXCPUClass *rcc = RX_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-    cpu_reset(cs);
-
     rcc->parent_realize(dev, errp);
+    cpu_reset(cs);
 }
 
 static void rx_cpu_set_irq(void *opaque, int no, int request)
@@ -178,7 +176,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     CPUClass *cc = CPU_CLASS(klass);
     RXCPUClass *rcc = RX_CPU_CLASS(klass);
 
-    device_class_set_parent_realize(dc, rx_cpu_realize,
+    device_class_set_parent_realize(dc, rx_cpu_realizefn,
                                     &rcc->parent_realize);
     device_class_set_parent_reset(dc, rx_cpu_reset,
                                   &rcc->parent_reset);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 04856076b3..9ff57e7692 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -223,7 +223,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     cs->cpu_index = cpu->env.core_id;
 #endif
 
-    cpu_exec_realizefn(cs, &err);
+    cpu_accel_realize(cs, &err);
     if (err != NULL) {
         goto out;
     }
@@ -232,8 +232,8 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
 #endif
     s390_cpu_gdb_init(cs);
-    qemu_init_vcpu(cs);
 
+    scc->parent_realize(dev, &err);
     /*
      * KVM requires the initial CPU reset ioctl to be executed on the target
      * CPU thread. CPU hotplug under single-threaded TCG will not work with
@@ -246,7 +246,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu_reset(cs);
     }
 
-    scc->parent_realize(dev, &err);
 out:
     error_propagate(errp, err);
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 7a9019edec..cb272783ff 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -178,15 +178,13 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
     SuperHCPUClass *scc = SUPERH_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     scc->parent_realize(dev, errp);
 }
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 760e0ea92c..e924468064 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -738,9 +738,9 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(dev);
-    Error *local_err = NULL;
     SPARCCPU *cpu = SPARC_CPU(dev);
     CPUSPARCState *env = &cpu->env;
+    Error *local_err = NULL;
 
 #if defined(CONFIG_USER_ONLY)
     if ((env->def.features & CPU_FEATURE_FLOAT)) {
@@ -762,14 +762,12 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     env->version |= env->def.nwindows - 1;
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
-    qemu_init_vcpu(cs);
-
     scc->parent_realize(dev, errp);
 }
 
diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
index 75b3a4bae3..d460070de8 100644
--- a/target/tilegx/cpu.c
+++ b/target/tilegx/cpu.c
@@ -86,15 +86,13 @@ static void tilegx_cpu_realizefn(DeviceState *dev, Error **errp)
     TileGXCPUClass *tcc = TILEGX_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     tcc->parent_realize(dev, errp);
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 89a14f81d7..147e1d1672 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -75,7 +75,7 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUTriCoreState *env = &cpu->env;
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -93,8 +93,6 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, TRICORE_FEATURE_13);
     }
     cpu_reset(cs);
-    qemu_init_vcpu(cs);
-
     tcc->parent_realize(dev, errp);
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index a57d315d2f..955b4875bc 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -84,18 +84,14 @@ static void uc32_any_cpu_initfn(Object *obj)
 
 static void uc32_cpu_realizefn(DeviceState *dev, Error **errp)
 {
-    CPUState *cs = CPU(dev);
     UniCore32CPUClass *ucc = UNICORE32_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(CPU(dev), &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
-
-    qemu_init_vcpu(cs);
-
     ucc->parent_realize(dev, errp);
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index b6f13ceb32..83ed0cb53d 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -145,7 +145,7 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
     xtensa_irq_init(&XTENSA_CPU(dev)->env);
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
+    cpu_accel_realize(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
@@ -153,8 +153,6 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
 
     cs->gdb_num_regs = xcc->config->gdb_regmap.num_regs;
 
-    qemu_init_vcpu(cs);
-
     xcc->parent_realize(dev, errp);
 }
 
-- 
2.26.2


