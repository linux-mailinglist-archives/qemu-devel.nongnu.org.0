Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D430A551
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:29:48 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WSn-0004Wx-Oi
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9L-0000sA-Ov
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:55848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9A-0005rL-Qs
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BBA1B164;
 Mon,  1 Feb 2021 10:09:16 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 19/23] i386: split cpu accelerators from cpu.c,
 using AccelCPUClass
Date: Mon,  1 Feb 2021 11:08:59 +0100
Message-Id: <20210201100903.17309-20-cfontana@suse.de>
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
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

i386 is the first user of AccelCPUClass, allowing to split
cpu.c into:

cpu.c            cpuid and common x86 cpu functionality
host-cpu.c       host x86 cpu functions and "host" cpu type
kvm/kvm-cpu.c    KVM x86 AccelCPUClass
hvf/hvf-cpu.c    HVF x86 AccelCPUClass
tcg/tcg-cpu.c    TCG x86 AccelCPUClass

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/cpu.h           |  20 +-
 target/i386/host-cpu.h      |  19 ++
 target/i386/kvm/kvm-cpu.h   |  41 ++++
 target/i386/tcg/tcg-cpu.h   |  15 --
 hw/i386/pc_piix.c           |   1 +
 target/i386/cpu.c           | 390 ++++--------------------------------
 target/i386/host-cpu.c      | 201 +++++++++++++++++++
 target/i386/hvf/hvf-cpu.c   |  65 ++++++
 target/i386/kvm/kvm-cpu.c   | 151 ++++++++++++++
 target/i386/kvm/kvm.c       |   3 +-
 target/i386/tcg/tcg-cpu.c   | 113 ++++++++++-
 MAINTAINERS                 |   2 +-
 target/i386/hvf/meson.build |   1 +
 target/i386/kvm/meson.build |   7 +-
 target/i386/meson.build     |   6 +-
 15 files changed, 648 insertions(+), 387 deletions(-)
 create mode 100644 target/i386/host-cpu.h
 create mode 100644 target/i386/kvm/kvm-cpu.h
 delete mode 100644 target/i386/tcg/tcg-cpu.h
 create mode 100644 target/i386/host-cpu.c
 create mode 100644 target/i386/hvf/hvf-cpu.c
 create mode 100644 target/i386/kvm/kvm-cpu.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..5616d2b665 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1909,13 +1909,20 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
 /* cpu.c */
+void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
+                              uint32_t vendor2, uint32_t vendor3);
+typedef struct PropValue {
+    const char *prop, *value;
+} PropValue;
+void x86_cpu_apply_props(X86CPU *cpu, PropValue *props);
+
+/* cpu.c other functions (cpuid) */
 void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx);
 void cpu_clear_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
-void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
@@ -2120,17 +2127,6 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access);
 void apic_handle_tpr_access_report(DeviceState *d, target_ulong ip,
                                    TPRAccess access);
 
-
-/* Change the value of a KVM-specific default
- *
- * If value is NULL, no default will be set and the original
- * value from the CPU model table will be kept.
- *
- * It is valid to call this function only for properties that
- * are already present in the kvm_default_props table.
- */
-void x86_cpu_change_kvm_default(const char *prop, const char *value);
-
 /* Special values for X86CPUVersion: */
 
 /* Resolve to latest CPU version */
diff --git a/target/i386/host-cpu.h b/target/i386/host-cpu.h
new file mode 100644
index 0000000000..b47bc0943f
--- /dev/null
+++ b/target/i386/host-cpu.h
@@ -0,0 +1,19 @@
+/*
+ * x86 host CPU type initialization and host CPU functions
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HOST_CPU_H
+#define HOST_CPU_H
+
+void host_cpu_instance_init(X86CPU *cpu);
+void host_cpu_max_instance_init(X86CPU *cpu);
+void host_cpu_realizefn(CPUState *cs, Error **errp);
+
+void host_cpu_vendor_fms(char *vendor, int *family, int *model, int *stepping);
+
+#endif /* HOST_CPU_H */
diff --git a/target/i386/kvm/kvm-cpu.h b/target/i386/kvm/kvm-cpu.h
new file mode 100644
index 0000000000..e858ca21e5
--- /dev/null
+++ b/target/i386/kvm/kvm-cpu.h
@@ -0,0 +1,41 @@
+/*
+ * i386 KVM CPU type and functions
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
+#ifndef KVM_CPU_H
+#define KVM_CPU_H
+
+#ifdef CONFIG_KVM
+/*
+ * Change the value of a KVM-specific default
+ *
+ * If value is NULL, no default will be set and the original
+ * value from the CPU model table will be kept.
+ *
+ * It is valid to call this function only for properties that
+ * are already present in the kvm_default_props table.
+ */
+void x86_cpu_change_kvm_default(const char *prop, const char *value);
+
+#else /* !CONFIG_KVM */
+
+#define x86_cpu_change_kvm_default(a, b)
+
+#endif /* CONFIG_KVM */
+
+#endif /* KVM_CPU_H */
diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
deleted file mode 100644
index 81f02e562e..0000000000
--- a/target/i386/tcg/tcg-cpu.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * i386 TCG CPU class initialization
- *
- * Copyright 2020 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TCG_CPU_H
-#define TCG_CPU_H
-
-void tcg_cpu_common_class_init(CPUClass *cc);
-
-#endif /* TCG_CPU_H */
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6188c3e97e..3abcb425bb 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -64,6 +64,7 @@
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/i386/acpi-build.h"
+#include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae89024d36..632dd93921 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -22,38 +22,25 @@
 #include "qemu/cutils.h"
 #include "qemu/bitops.h"
 #include "qemu/qemu-print.h"
-
 #include "cpu.h"
-#include "tcg/tcg-cpu.h"
 #include "tcg/helper-tcg.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
-#include "sysemu/cpus.h"
+#include "hw/core/accel-cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
-
-#include "qemu/error-report.h"
 #include "qemu/module.h"
-#include "qemu/option.h"
-#include "qemu/config-file.h"
-#include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-#include "qapi/visitor.h"
 #include "qom/qom-qobject.h"
-#include "sysemu/arch_init.h"
 #include "qapi/qapi-commands-machine-target.h"
-
 #include "standard-headers/asm-x86/kvm_para.h"
-
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
@@ -595,8 +582,8 @@ static CPUCacheInfo legacy_l3_cache = {
 #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
 #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
 
-static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
-                                     uint32_t vendor2, uint32_t vendor3)
+void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
+                              uint32_t vendor2, uint32_t vendor3)
 {
     int i;
     for (i = 0; i < 4; i++) {
@@ -1589,25 +1576,6 @@ void host_cpuid(uint32_t function, uint32_t count,
         *edx = vec[3];
 }
 
-void host_vendor_fms(char *vendor, int *family, int *model, int *stepping)
-{
-    uint32_t eax, ebx, ecx, edx;
-
-    host_cpuid(0x0, 0, &eax, &ebx, &ecx, &edx);
-    x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
-
-    host_cpuid(0x1, 0, &eax, &ebx, &ecx, &edx);
-    if (family) {
-        *family = ((eax >> 8) & 0x0F) + ((eax >> 20) & 0xFF);
-    }
-    if (model) {
-        *model = ((eax >> 4) & 0x0F) | ((eax & 0xF0000) >> 12);
-    }
-    if (stepping) {
-        *stepping = eax & 0x0F;
-    }
-}
-
 /* CPU class name definitions: */
 
 /* Return type name for a given CPU model name
@@ -1632,10 +1600,6 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
                      strlen(class_name) - strlen(X86_CPU_TYPE_SUFFIX));
 }
 
-typedef struct PropValue {
-    const char *prop, *value;
-} PropValue;
-
 typedef struct X86CPUVersionDefinition {
     X86CPUVersion version;
     const char *alias;
@@ -4132,32 +4096,6 @@ static X86CPUDefinition builtin_x86_defs[] = {
     },
 };
 
-/* KVM-specific features that are automatically added/removed
- * from all CPU models when KVM is enabled.
- */
-static PropValue kvm_default_props[] = {
-    { "kvmclock", "on" },
-    { "kvm-nopiodelay", "on" },
-    { "kvm-asyncpf", "on" },
-    { "kvm-steal-time", "on" },
-    { "kvm-pv-eoi", "on" },
-    { "kvmclock-stable-bit", "on" },
-    { "x2apic", "on" },
-    { "kvm-msi-ext-dest-id", "off" },
-    { "acpi", "off" },
-    { "monitor", "off" },
-    { "svm", "off" },
-    { NULL, NULL },
-};
-
-/* TCG-specific defaults that override all CPU models when using TCG
- */
-static PropValue tcg_default_props[] = {
-    { "vme", "off" },
-    { NULL, NULL },
-};
-
-
 /*
  * We resolve CPU model aliases using -v1 when using "-machine
  * none", but this is just for compatibility while libvirt isn't
@@ -4199,61 +4137,6 @@ static X86CPUVersion x86_cpu_model_resolve_version(const X86CPUModel *model)
     return v;
 }
 
-void x86_cpu_change_kvm_default(const char *prop, const char *value)
-{
-    PropValue *pv;
-    for (pv = kvm_default_props; pv->prop; pv++) {
-        if (!strcmp(pv->prop, prop)) {
-            pv->value = value;
-            break;
-        }
-    }
-
-    /* It is valid to call this function only for properties that
-     * are already present in the kvm_default_props table.
-     */
-    assert(pv->prop);
-}
-
-static bool lmce_supported(void)
-{
-    uint64_t mce_cap = 0;
-
-#ifdef CONFIG_KVM
-    if (kvm_ioctl(kvm_state, KVM_X86_GET_MCE_CAP_SUPPORTED, &mce_cap) < 0) {
-        return false;
-    }
-#endif
-
-    return !!(mce_cap & MCG_LMCE_P);
-}
-
-#define CPUID_MODEL_ID_SZ 48
-
-/**
- * cpu_x86_fill_model_id:
- * Get CPUID model ID string from host CPU.
- *
- * @str should have at least CPUID_MODEL_ID_SZ bytes
- *
- * The function does NOT add a null terminator to the string
- * automatically.
- */
-static int cpu_x86_fill_model_id(char *str)
-{
-    uint32_t eax = 0, ebx = 0, ecx = 0, edx = 0;
-    int i;
-
-    for (i = 0; i < 3; i++) {
-        host_cpuid(0x80000002 + i, 0, &eax, &ebx, &ecx, &edx);
-        memcpy(str + i * 16 +  0, &eax, 4);
-        memcpy(str + i * 16 +  4, &ebx, 4);
-        memcpy(str + i * 16 +  8, &ecx, 4);
-        memcpy(str + i * 16 + 12, &edx, 4);
-    }
-    return 0;
-}
-
 static Property max_x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("migratable", X86CPU, migratable, true),
     DEFINE_PROP_BOOL("host-cache-info", X86CPU, cache_info_passthrough, false),
@@ -4276,62 +4159,25 @@ static void max_x86_cpu_class_init(ObjectClass *oc, void *data)
 static void max_x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
-    CPUX86State *env = &cpu->env;
-    KVMState *s = kvm_state;
 
     /* We can't fill the features array here because we don't know yet if
      * "migratable" is true or false.
      */
     cpu->max_features = true;
-
-    if (accel_uses_host_cpuid()) {
-        char vendor[CPUID_VENDOR_SZ + 1] = { 0 };
-        char model_id[CPUID_MODEL_ID_SZ + 1] = { 0 };
-        int family, model, stepping;
-
-        host_vendor_fms(vendor, &family, &model, &stepping);
-        cpu_x86_fill_model_id(model_id);
-
-        object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
-        object_property_set_int(OBJECT(cpu), "family", family, &error_abort);
-        object_property_set_int(OBJECT(cpu), "model", model, &error_abort);
-        object_property_set_int(OBJECT(cpu), "stepping", stepping,
-                                &error_abort);
-        object_property_set_str(OBJECT(cpu), "model-id", model_id,
-                                &error_abort);
-
-        if (kvm_enabled()) {
-            env->cpuid_min_level =
-                kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
-            env->cpuid_min_xlevel =
-                kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
-            env->cpuid_min_xlevel2 =
-                kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
-        } else {
-            env->cpuid_min_level =
-                hvf_get_supported_cpuid(0x0, 0, R_EAX);
-            env->cpuid_min_xlevel =
-                hvf_get_supported_cpuid(0x80000000, 0, R_EAX);
-            env->cpuid_min_xlevel2 =
-                hvf_get_supported_cpuid(0xC0000000, 0, R_EAX);
-        }
-
-        if (lmce_supported()) {
-            object_property_set_bool(OBJECT(cpu), "lmce", true, &error_abort);
-        }
-        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true, &error_abort);
-    } else {
-        object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
-                                &error_abort);
-        object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
-        object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
-        object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
-        object_property_set_str(OBJECT(cpu), "model-id",
-                                "QEMU TCG CPU version " QEMU_HW_VERSION,
-                                &error_abort);
-    }
-
     object_property_set_bool(OBJECT(cpu), "pmu", true, &error_abort);
+
+    /*
+     * these defaults are used for TCG and all other accelerators
+     * besides KVM and HVF, which overwrite these values
+     */
+    object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
+                            &error_abort);
+    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
+    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
+    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
+    object_property_set_str(OBJECT(cpu), "model-id",
+                            "QEMU TCG CPU version " QEMU_HW_VERSION,
+                            &error_abort);
 }
 
 static const TypeInfo max_x86_cpu_type_info = {
@@ -4341,31 +4187,6 @@ static const TypeInfo max_x86_cpu_type_info = {
     .class_init = max_x86_cpu_class_init,
 };
 
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void host_x86_cpu_class_init(ObjectClass *oc, void *data)
-{
-    X86CPUClass *xcc = X86_CPU_CLASS(oc);
-
-    xcc->host_cpuid_required = true;
-    xcc->ordering = 8;
-
-#if defined(CONFIG_KVM)
-    xcc->model_description =
-        "KVM processor with all supported host features ";
-#elif defined(CONFIG_HVF)
-    xcc->model_description =
-        "HVF processor with all supported host features ";
-#endif
-}
-
-static const TypeInfo host_x86_cpu_type_info = {
-    .name = X86_CPU_TYPE_NAME("host"),
-    .parent = X86_CPU_TYPE_NAME("max"),
-    .class_init = host_x86_cpu_class_init,
-};
-
-#endif
-
 static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
 {
     assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
@@ -5079,7 +4900,7 @@ static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     return r;
 }
 
-static void x86_cpu_apply_props(X86CPU *cpu, PropValue *props)
+void x86_cpu_apply_props(X86CPU *cpu, PropValue *props)
 {
     PropValue *pv;
     for (pv = props; pv->prop; pv++) {
@@ -5126,8 +4947,6 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
 {
     X86CPUDefinition *def = model->cpudef;
     CPUX86State *env = &cpu->env;
-    const char *vendor;
-    char host_vendor[CPUID_VENDOR_SZ + 1];
     FeatureWord w;
 
     /*NOTE: any property set by this function should be returned by
@@ -5154,20 +4973,6 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     /* legacy-cache defaults to 'off' if CPU model provides cache info */
     cpu->legacy_cache = !def->cache_info;
 
-    /* Special cases not set in the X86CPUDefinition structs: */
-    /* TODO: in-kernel irqchip for hvf */
-    if (kvm_enabled()) {
-        if (!kvm_irqchip_in_kernel()) {
-            x86_cpu_change_kvm_default("x2apic", "off");
-        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
-            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
-        }
-
-        x86_cpu_apply_props(cpu, kvm_default_props);
-    } else if (tcg_enabled()) {
-        x86_cpu_apply_props(cpu, tcg_default_props);
-    }
-
     env->features[FEAT_1_ECX] |= CPUID_EXT_HYPERVISOR;
 
     /* sysenter isn't supported in compatibility mode on AMD,
@@ -5177,15 +4982,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
      * KVM's sysenter/syscall emulation in compatibility mode and
      * when doing cross vendor migration
      */
-    vendor = def->vendor;
-    if (accel_uses_host_cpuid()) {
-        uint32_t  ebx = 0, ecx = 0, edx = 0;
-        host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
-        x86_cpu_vendor_words2str(host_vendor, ebx, edx, ecx);
-        vendor = host_vendor;
-    }
 
-    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+    /*
+     * vendor property is set here but then overloaded with the
+     * host cpu vendor for KVM and HVF.
+     */
+    object_property_set_str(OBJECT(cpu), "vendor", def->vendor, &error_abort);
 
     x86_cpu_apply_version_props(cpu, model);
 
@@ -6215,53 +6017,12 @@ static void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
         apic_mmio_map_once = true;
      }
 }
-
-static void x86_cpu_machine_done(Notifier *n, void *unused)
-{
-    X86CPU *cpu = container_of(n, X86CPU, machine_done);
-    MemoryRegion *smram =
-        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
-
-    if (smram) {
-        cpu->smram = g_new(MemoryRegion, 1);
-        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 4 * GiB);
-        memory_region_set_enabled(cpu->smram, true);
-        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->smram, 1);
-    }
-}
 #else
 static void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
 {
 }
 #endif
 
-/* Note: Only safe for use on x86(-64) hosts */
-static uint32_t x86_host_phys_bits(void)
-{
-    uint32_t eax;
-    uint32_t host_phys_bits;
-
-    host_cpuid(0x80000000, 0, &eax, NULL, NULL, NULL);
-    if (eax >= 0x80000008) {
-        host_cpuid(0x80000008, 0, &eax, NULL, NULL, NULL);
-        /* Note: According to AMD doc 25481 rev 2.34 they have a field
-         * at 23:16 that can specify a maximum physical address bits for
-         * the guest that can override this value; but I've not seen
-         * anything with that set.
-         */
-        host_phys_bits = eax & 0xff;
-    } else {
-        /* It's an odd 64 bit machine that doesn't have the leaf for
-         * physical address bits; fall back to 36 that's most older
-         * Intel.
-         */
-        host_phys_bits = 36;
-    }
-
-    return host_phys_bits;
-}
-
 static void x86_cpu_adjust_level(X86CPU *cpu, uint32_t *min, uint32_t value)
 {
     if (*min < value) {
@@ -6573,33 +6334,22 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    CPUClass *cc = CPU_GET_CLASS(cs);
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
 
-    if (xcc->host_cpuid_required) {
-        if (!accel_uses_host_cpuid()) {
-            g_autofree char *name = x86_cpu_class_get_model_name(xcc);
-            error_setg(&local_err, "CPU model '%s' requires KVM", name);
-            goto out;
-        }
+    /* The accelerator realizefn needs to be called first. */
+    if (cc->accel_cpu) {
+        cc->accel_cpu->cpu_realizefn(cs, errp);
     }
 
-    if (cpu->max_features && accel_uses_host_cpuid()) {
-        if (enable_cpu_pm) {
-            host_cpuid(5, 0, &cpu->mwait.eax, &cpu->mwait.ebx,
-                       &cpu->mwait.ecx, &cpu->mwait.edx);
-            env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
-            if (kvm_enabled() && kvm_has_waitpkg()) {
-                env->features[FEAT_7_0_ECX] |= CPUID_7_0_ECX_WAITPKG;
-            }
-        }
-        if (kvm_enabled() && cpu->ucode_rev == 0) {
-            cpu->ucode_rev = kvm_arch_get_supported_msr_feature(kvm_state,
-                                                                MSR_IA32_UCODE_REV);
-        }
+    if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
+        g_autofree char *name = x86_cpu_class_get_model_name(xcc);
+        error_setg(&local_err, "CPU model '%s' requires KVM or HVF", name);
+        goto out;
     }
 
     if (cpu->ucode_rev == 0) {
@@ -6651,39 +6401,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
      * consumer AMD devices but nothing else.
      */
     if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
-        if (accel_uses_host_cpuid()) {
-            uint32_t host_phys_bits = x86_host_phys_bits();
-            static bool warned;
-
-            /* Print a warning if the user set it to a value that's not the
-             * host value.
-             */
-            if (cpu->phys_bits != host_phys_bits && cpu->phys_bits != 0 &&
-                !warned) {
-                warn_report("Host physical bits (%u)"
-                            " does not match phys-bits property (%u)",
-                            host_phys_bits, cpu->phys_bits);
-                warned = true;
-            }
-
-            if (cpu->host_phys_bits) {
-                /* The user asked for us to use the host physical bits */
-                cpu->phys_bits = host_phys_bits;
-                if (cpu->host_phys_bits_limit &&
-                    cpu->phys_bits > cpu->host_phys_bits_limit) {
-                    cpu->phys_bits = cpu->host_phys_bits_limit;
-                }
-            }
-
-            if (cpu->phys_bits &&
-                (cpu->phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
-                cpu->phys_bits < 32)) {
-                error_setg(errp, "phys-bits should be between 32 and %u "
-                                 " (but is %u)",
-                                 TARGET_PHYS_ADDR_SPACE_BITS, cpu->phys_bits);
-                return;
-            }
-        } else {
+        if (!accel_uses_host_cpuid()) {
             if (cpu->phys_bits && cpu->phys_bits != TCG_PHYS_ADDR_BITS) {
                 error_setg(errp, "TCG only supports phys-bits=%u",
                                   TCG_PHYS_ADDR_BITS);
@@ -6691,8 +6409,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
             }
         }
         /* 0 means it was not explicitly set by the user (or by machine
-         * compat_props or by the host code above). In this case, the default
-         * is the value used by TCG (40).
+         * compat_props or by the host code in host-cpu.c).
+         * In this case, the default is the value used by TCG (40).
          */
         if (cpu->phys_bits == 0) {
             cpu->phys_bits = TCG_PHYS_ADDR_BITS;
@@ -6764,33 +6482,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     mce_init(cpu);
 
-#ifndef CONFIG_USER_ONLY
-    if (tcg_enabled()) {
-        cpu->cpu_as_mem = g_new(MemoryRegion, 1);
-        cpu->cpu_as_root = g_new(MemoryRegion, 1);
-
-        /* Outer container... */
-        memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
-        memory_region_set_enabled(cpu->cpu_as_root, true);
-
-        /* ... with two regions inside: normal system memory with low
-         * priority, and...
-         */
-        memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
-                                 get_system_memory(), 0, ~0ull);
-        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
-        memory_region_set_enabled(cpu->cpu_as_mem, true);
-
-        cs->num_ases = 2;
-        cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
-        cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
-
-        /* ... SMRAM with higher priority, linked from /machine/smram.  */
-        cpu->machine_done.notify = x86_cpu_machine_done;
-        qemu_add_machine_init_done_notifier(&cpu->machine_done);
-    }
-#endif
-
     qemu_init_vcpu(cs);
 
     /*
@@ -6990,6 +6681,8 @@ static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
+    CPUClass *cc = CPU_CLASS(xcc);
+
     CPUX86State *env = &cpu->env;
 
     env->nr_dies = 1;
@@ -7037,6 +6730,11 @@ static void x86_cpu_initfn(Object *obj)
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
+
+    /* if required, do the accelerator-specific cpu initialization */
+    if (cc->accel_cpu) {
+        cc->accel_cpu->cpu_instance_init(CPU(obj));
+    }
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
@@ -7294,11 +6992,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
     cc->has_work = x86_cpu_has_work;
-
-#ifdef CONFIG_TCG
-    tcg_cpu_common_class_init(cc);
-#endif /* CONFIG_TCG */
-
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
@@ -7409,9 +7102,6 @@ static void x86_cpu_register_types(void)
     }
     type_register_static(&max_x86_cpu_type_info);
     type_register_static(&x86_base_cpu_type_info);
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_x86_cpu_type_info);
-#endif
 }
 
 type_init(x86_cpu_register_types)
diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
new file mode 100644
index 0000000000..9cfe56ce41
--- /dev/null
+++ b/target/i386/host-cpu.c
@@ -0,0 +1,201 @@
+/*
+ * x86 host CPU functions, and "host" cpu type initialization
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "host-cpu.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+
+/* Note: Only safe for use on x86(-64) hosts */
+static uint32_t host_cpu_phys_bits(void)
+{
+    uint32_t eax;
+    uint32_t host_phys_bits;
+
+    host_cpuid(0x80000000, 0, &eax, NULL, NULL, NULL);
+    if (eax >= 0x80000008) {
+        host_cpuid(0x80000008, 0, &eax, NULL, NULL, NULL);
+        /*
+         * Note: According to AMD doc 25481 rev 2.34 they have a field
+         * at 23:16 that can specify a maximum physical address bits for
+         * the guest that can override this value; but I've not seen
+         * anything with that set.
+         */
+        host_phys_bits = eax & 0xff;
+    } else {
+        /*
+         * It's an odd 64 bit machine that doesn't have the leaf for
+         * physical address bits; fall back to 36 that's most older
+         * Intel.
+         */
+        host_phys_bits = 36;
+    }
+
+    return host_phys_bits;
+}
+
+static void host_cpu_enable_cpu_pm(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+
+    host_cpuid(5, 0, &cpu->mwait.eax, &cpu->mwait.ebx,
+               &cpu->mwait.ecx, &cpu->mwait.edx);
+    env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
+}
+
+static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
+{
+    uint32_t host_phys_bits = host_cpu_phys_bits();
+    uint32_t phys_bits = cpu->phys_bits;
+    static bool warned;
+
+    /*
+     * Print a warning if the user set it to a value that's not the
+     * host value.
+     */
+    if (phys_bits != host_phys_bits && phys_bits != 0 &&
+        !warned) {
+        warn_report("Host physical bits (%u)"
+                    " does not match phys-bits property (%u)",
+                    host_phys_bits, phys_bits);
+        warned = true;
+    }
+
+    if (cpu->host_phys_bits) {
+        /* The user asked for us to use the host physical bits */
+        phys_bits = host_phys_bits;
+        if (cpu->host_phys_bits_limit &&
+            phys_bits > cpu->host_phys_bits_limit) {
+            phys_bits = cpu->host_phys_bits_limit;
+        }
+    }
+
+    if (phys_bits &&
+        (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
+         phys_bits < 32)) {
+        error_setg(errp, "phys-bits should be between 32 and %u "
+                   " (but is %u)",
+                   TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
+    }
+
+    return phys_bits;
+}
+
+void host_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    if (cpu->max_features && enable_cpu_pm) {
+        host_cpu_enable_cpu_pm(cpu);
+    }
+    if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
+        cpu->phys_bits = host_cpu_adjust_phys_bits(cpu, errp);
+    }
+}
+
+#define CPUID_MODEL_ID_SZ 48
+/**
+ * cpu_x86_fill_model_id:
+ * Get CPUID model ID string from host CPU.
+ *
+ * @str should have at least CPUID_MODEL_ID_SZ bytes
+ *
+ * The function does NOT add a null terminator to the string
+ * automatically.
+ */
+static int host_cpu_fill_model_id(char *str)
+{
+    uint32_t eax = 0, ebx = 0, ecx = 0, edx = 0;
+    int i;
+
+    for (i = 0; i < 3; i++) {
+        host_cpuid(0x80000002 + i, 0, &eax, &ebx, &ecx, &edx);
+        memcpy(str + i * 16 +  0, &eax, 4);
+        memcpy(str + i * 16 +  4, &ebx, 4);
+        memcpy(str + i * 16 +  8, &ecx, 4);
+        memcpy(str + i * 16 + 12, &edx, 4);
+    }
+    return 0;
+}
+
+void host_cpu_vendor_fms(char *vendor, int *family, int *model, int *stepping)
+{
+    uint32_t eax, ebx, ecx, edx;
+
+    host_cpuid(0x0, 0, &eax, &ebx, &ecx, &edx);
+    x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
+
+    host_cpuid(0x1, 0, &eax, &ebx, &ecx, &edx);
+    if (family) {
+        *family = ((eax >> 8) & 0x0F) + ((eax >> 20) & 0xFF);
+    }
+    if (model) {
+        *model = ((eax >> 4) & 0x0F) | ((eax & 0xF0000) >> 12);
+    }
+    if (stepping) {
+        *stepping = eax & 0x0F;
+    }
+}
+
+void host_cpu_instance_init(X86CPU *cpu)
+{
+    uint32_t ebx = 0, ecx = 0, edx = 0;
+    char vendor[CPUID_VENDOR_SZ + 1];
+
+    host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
+    x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
+
+    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+}
+
+void host_cpu_max_instance_init(X86CPU *cpu)
+{
+    char vendor[CPUID_VENDOR_SZ + 1] = { 0 };
+    char model_id[CPUID_MODEL_ID_SZ + 1] = { 0 };
+    int family, model, stepping;
+
+    /* Use max host physical address bits if -cpu max option is applied */
+    object_property_set_bool(OBJECT(cpu), "host-phys-bits", true, &error_abort);
+
+    host_cpu_vendor_fms(vendor, &family, &model, &stepping);
+    host_cpu_fill_model_id(model_id);
+
+    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+    object_property_set_int(OBJECT(cpu), "family", family, &error_abort);
+    object_property_set_int(OBJECT(cpu), "model", model, &error_abort);
+    object_property_set_int(OBJECT(cpu), "stepping", stepping,
+                            &error_abort);
+    object_property_set_str(OBJECT(cpu), "model-id", model_id,
+                            &error_abort);
+}
+
+static void host_cpu_class_init(ObjectClass *oc, void *data)
+{
+    X86CPUClass *xcc = X86_CPU_CLASS(oc);
+
+    xcc->host_cpuid_required = true;
+    xcc->ordering = 8;
+    xcc->model_description =
+        g_strdup_printf("processor with all supported host features ");
+}
+
+static const TypeInfo host_cpu_type_info = {
+    .name = X86_CPU_TYPE_NAME("host"),
+    .parent = X86_CPU_TYPE_NAME("max"),
+    .class_init = host_cpu_class_init,
+};
+
+static void host_cpu_type_init(void)
+{
+    type_register_static(&host_cpu_type_info);
+}
+
+type_init(host_cpu_type_init);
diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
new file mode 100644
index 0000000000..f0933fd1b2
--- /dev/null
+++ b/target/i386/hvf/hvf-cpu.c
@@ -0,0 +1,65 @@
+/*
+ * x86 HVF CPU type initialization
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "host-cpu.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/boards.h"
+#include "sysemu/hvf.h"
+#include "hw/core/accel-cpu.h"
+
+static void hvf_cpu_max_instance_init(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+
+    host_cpu_max_instance_init(cpu);
+
+    env->cpuid_min_level =
+        hvf_get_supported_cpuid(0x0, 0, R_EAX);
+    env->cpuid_min_xlevel =
+        hvf_get_supported_cpuid(0x80000000, 0, R_EAX);
+    env->cpuid_min_xlevel2 =
+        hvf_get_supported_cpuid(0xC0000000, 0, R_EAX);
+}
+
+static void hvf_cpu_instance_init(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    host_cpu_instance_init(cpu);
+
+    /* Special cases not set in the X86CPUDefinition structs: */
+    /* TODO: in-kernel irqchip for hvf */
+
+    if (cpu->max_features) {
+        hvf_cpu_max_instance_init(cpu);
+    }
+}
+
+static void hvf_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = host_cpu_realizefn;
+    acc->cpu_instance_init = hvf_cpu_instance_init;
+};
+static const TypeInfo hvf_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("hvf"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = hvf_cpu_accel_class_init,
+    .abstract = true,
+};
+static void hvf_cpu_accel_register_types(void)
+{
+    type_register_static(&hvf_cpu_accel_type_info);
+}
+type_init(hvf_cpu_accel_register_types);
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
new file mode 100644
index 0000000000..c23bbe6c50
--- /dev/null
+++ b/target/i386/kvm/kvm-cpu.c
@@ -0,0 +1,151 @@
+/*
+ * x86 KVM CPU type initialization
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "host-cpu.h"
+#include "kvm-cpu.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/boards.h"
+
+#include "kvm_i386.h"
+#include "hw/core/accel-cpu.h"
+
+static void kvm_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    /*
+     * The realize order is important, since x86_cpu_realize() checks if
+     * nothing else has been set by the user (or by accelerators) in
+     * cpu->ucode_rev and cpu->phys_bits.
+     *
+     * realize order:
+     * kvm_cpu -> host_cpu -> x86_cpu
+     */
+    if (cpu->max_features) {
+        if (enable_cpu_pm && kvm_has_waitpkg()) {
+            env->features[FEAT_7_0_ECX] |= CPUID_7_0_ECX_WAITPKG;
+        }
+        if (cpu->ucode_rev == 0) {
+            cpu->ucode_rev =
+                kvm_arch_get_supported_msr_feature(kvm_state,
+                                                   MSR_IA32_UCODE_REV);
+        }
+    }
+    host_cpu_realizefn(cs, errp);
+}
+
+/*
+ * KVM-specific features that are automatically added/removed
+ * from all CPU models when KVM is enabled.
+ */
+static PropValue kvm_default_props[] = {
+    { "kvmclock", "on" },
+    { "kvm-nopiodelay", "on" },
+    { "kvm-asyncpf", "on" },
+    { "kvm-steal-time", "on" },
+    { "kvm-pv-eoi", "on" },
+    { "kvmclock-stable-bit", "on" },
+    { "x2apic", "on" },
+    { "kvm-msi-ext-dest-id", "off" },
+    { "acpi", "off" },
+    { "monitor", "off" },
+    { "svm", "off" },
+    { NULL, NULL },
+};
+
+void x86_cpu_change_kvm_default(const char *prop, const char *value)
+{
+    PropValue *pv;
+    for (pv = kvm_default_props; pv->prop; pv++) {
+        if (!strcmp(pv->prop, prop)) {
+            pv->value = value;
+            break;
+        }
+    }
+
+    /*
+     * It is valid to call this function only for properties that
+     * are already present in the kvm_default_props table.
+     */
+    assert(pv->prop);
+}
+
+static bool lmce_supported(void)
+{
+    uint64_t mce_cap = 0;
+
+    if (kvm_ioctl(kvm_state, KVM_X86_GET_MCE_CAP_SUPPORTED, &mce_cap) < 0) {
+        return false;
+    }
+    return !!(mce_cap & MCG_LMCE_P);
+}
+
+static void kvm_cpu_max_instance_init(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    KVMState *s = kvm_state;
+
+    host_cpu_max_instance_init(cpu);
+
+    if (lmce_supported()) {
+        object_property_set_bool(OBJECT(cpu), "lmce", true, &error_abort);
+    }
+
+    env->cpuid_min_level =
+        kvm_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
+    env->cpuid_min_xlevel =
+        kvm_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
+    env->cpuid_min_xlevel2 =
+        kvm_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
+}
+
+static void kvm_cpu_instance_init(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    host_cpu_instance_init(cpu);
+
+    if (!kvm_irqchip_in_kernel()) {
+        x86_cpu_change_kvm_default("x2apic", "off");
+    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
+    }
+
+    /* Special cases not set in the X86CPUDefinition structs: */
+
+    x86_cpu_apply_props(cpu, kvm_default_props);
+
+    if (cpu->max_features) {
+        kvm_cpu_max_instance_init(cpu);
+    }
+}
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = kvm_cpu_realizefn;
+    acc->cpu_instance_init = kvm_cpu_instance_init;
+}
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+type_init(kvm_cpu_accel_register_types);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc1ee052d..052de11915 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -22,6 +22,7 @@
 #include "standard-headers/asm-x86/kvm_para.h"
 
 #include "cpu.h"
+#include "host-cpu.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm_int.h"
@@ -285,7 +286,7 @@ static bool host_tsx_broken(void)
     int family, model, stepping;\
     char vendor[CPUID_VENDOR_SZ + 1];
 
-    host_vendor_fms(vendor, &family, &model, &stepping);
+    host_cpu_vendor_fms(vendor, &family, &model, &stepping);
 
     /* Check if we are running on a Haswell host known to have broken TSX */
     return !strcmp(vendor, CPUID_VENDOR_INTEL) &&
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 1e125d2175..1d3d6d1c6a 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -19,13 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "tcg-cpu.h"
-#include "exec/exec-all.h"
-#include "sysemu/runstate.h"
 #include "helper-tcg.h"
+#include "qemu/accel.h"
+#include "hw/core/accel-cpu.h"
 
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/i386/apic.h"
+#ifndef CONFIG_USER_ONLY
+#include "sysemu/sysemu.h"
+#include "qemu/units.h"
+#include "exec/address-spaces.h"
 #endif
 
 /* Frob eflags into and out of the CPU temporary format.  */
@@ -72,7 +73,107 @@ static struct TCGCPUOps x86_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-void tcg_cpu_common_class_init(CPUClass *cc)
+static void tcg_cpu_class_init(CPUClass *cc)
 {
     cc->tcg_ops = &x86_tcg_ops;
 }
+
+#ifndef CONFIG_USER_ONLY
+
+static void x86_cpu_machine_done(Notifier *n, void *unused)
+{
+    X86CPU *cpu = container_of(n, X86CPU, machine_done);
+    MemoryRegion *smram =
+        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
+
+    if (smram) {
+        cpu->smram = g_new(MemoryRegion, 1);
+        memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
+                                 smram, 0, 4 * GiB);
+        memory_region_set_enabled(cpu->smram, true);
+        memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
+                                            cpu->smram, 1);
+    }
+}
+
+static void tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(cs);
+
+    /*
+     * The realize order is important, since x86_cpu_realize() checks if
+     * nothing else has been set by the user (or by accelerators) in
+     * cpu->ucode_rev and cpu->phys_bits, and the memory regions
+     * initialized here are needed for the vcpu initialization.
+     *
+     * realize order:
+     * tcg_cpu -> host_cpu -> x86_cpu
+     */
+    cpu->cpu_as_mem = g_new(MemoryRegion, 1);
+    cpu->cpu_as_root = g_new(MemoryRegion, 1);
+
+    /* Outer container... */
+    memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
+    memory_region_set_enabled(cpu->cpu_as_root, true);
+
+    /*
+     * ... with two regions inside: normal system memory with low
+     * priority, and...
+     */
+    memory_region_init_alias(cpu->cpu_as_mem, OBJECT(cpu), "memory",
+                             get_system_memory(), 0, ~0ull);
+    memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
+    memory_region_set_enabled(cpu->cpu_as_mem, true);
+
+    cs->num_ases = 2;
+    cpu_address_space_init(cs, 0, "cpu-memory", cs->memory);
+    cpu_address_space_init(cs, 1, "cpu-smm", cpu->cpu_as_root);
+
+    /* ... SMRAM with higher priority, linked from /machine/smram.  */
+    cpu->machine_done.notify = x86_cpu_machine_done;
+    qemu_add_machine_init_done_notifier(&cpu->machine_done);
+}
+
+#else /* CONFIG_USER_ONLY */
+
+static void tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+}
+
+#endif /* !CONFIG_USER_ONLY */
+
+/*
+ * TCG-specific defaults that override all CPU models when using TCG
+ */
+static PropValue tcg_default_props[] = {
+    { "vme", "off" },
+    { NULL, NULL },
+};
+
+static void tcg_cpu_instance_init(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    /* Special cases not set in the X86CPUDefinition structs: */
+    x86_cpu_apply_props(cpu, tcg_default_props);
+}
+
+static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = tcg_cpu_realizefn;
+    acc->cpu_class_init = tcg_cpu_class_init;
+    acc->cpu_instance_init = tcg_cpu_instance_init;
+}
+static const TypeInfo tcg_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = tcg_cpu_accel_class_init,
+    .abstract = true,
+};
+static void tcg_cpu_accel_register_types(void)
+{
+    type_register_static(&tcg_cpu_accel_type_info);
+}
+type_init(tcg_cpu_accel_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index b1b64acd05..dab59395d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -340,7 +340,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
 M: Richard Henderson <richard.henderson@linaro.org>
 M: Eduardo Habkost <ehabkost@redhat.com>
 S: Maintained
-F: target/i386/
+F: target/i386/tcg/
 F: tests/tcg/i386/
 F: tests/tcg/x86_64/
 F: hw/i386/
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index e9eb5a5da8..d253d5fd10 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -10,4 +10,5 @@ i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'x86_mmu.c',
   'x86_task.c',
   'x86hvf.c',
+  'hvf-cpu.c',
 ))
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 1d66559187..0a533411ca 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,3 +1,8 @@
 i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
+
+i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c',
+  'kvm-cpu.c',
+))
+
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
diff --git a/target/i386/meson.build b/target/i386/meson.build
index c4bf20b319..fd24479590 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,11 @@ i386_ss.add(files(
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c', 'sev.c'), if_false: files('sev-stub.c'))
+
+# x86 cpu type
+i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
+i386_ss.add(when: 'CONFIG_HVF', if_true: files('host-cpu.c'))
 
 i386_softmmu_ss = ss.source_set()
 i386_softmmu_ss.add(files(
-- 
2.26.2


