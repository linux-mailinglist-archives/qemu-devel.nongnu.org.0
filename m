Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03FB319F14
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:50:21 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXts-0007Ah-ON
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:50:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgp-0001L9-54
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:48782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgi-0006NS-W0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8863B029;
 Fri, 12 Feb 2021 12:36:29 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v18 15/15] i386: split off softmmu part of cpu.c
Date: Fri, 12 Feb 2021 13:36:22 +0100
Message-Id: <20210212123622.15834-16-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212123622.15834-1-cfontana@suse.de>
References: <20210212123622.15834-1-cfontana@suse.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/cpu-internal.h |  70 +++++++
 target/i386/cpu-softmmu.c  | 352 ++++++++++++++++++++++++++++++++++
 target/i386/cpu.c          | 383 +------------------------------------
 target/i386/meson.build    |   1 +
 4 files changed, 428 insertions(+), 378 deletions(-)
 create mode 100644 target/i386/cpu-internal.h
 create mode 100644 target/i386/cpu-softmmu.c

diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
new file mode 100644
index 0000000000..9ecadf593b
--- /dev/null
+++ b/target/i386/cpu-internal.h
@@ -0,0 +1,70 @@
+/*
+ * i386 CPU internal definitions to be shared between general and softmmu
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
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
+#ifndef I386_CPU_INTERNAL_H
+#define I386_CPU_INTERNAL_H
+
+typedef enum FeatureWordType {
+   CPUID_FEATURE_WORD,
+   MSR_FEATURE_WORD,
+} FeatureWordType;
+
+typedef struct FeatureWordInfo {
+    FeatureWordType type;
+    /* feature flags names are taken from "Intel Processor Identification and
+     * the CPUID Instruction" and AMD's "CPUID Specification".
+     * In cases of disagreement between feature naming conventions,
+     * aliases may be added.
+     */
+    const char *feat_names[64];
+    union {
+        /* If type==CPUID_FEATURE_WORD */
+        struct {
+            uint32_t eax;   /* Input EAX for CPUID */
+            bool needs_ecx; /* CPUID instruction uses ECX as input */
+            uint32_t ecx;   /* Input ECX value for CPUID */
+            int reg;        /* output register (R_* constant) */
+        } cpuid;
+        /* If type==MSR_FEATURE_WORD */
+        struct {
+            uint32_t index;
+        } msr;
+    };
+    uint64_t tcg_features; /* Feature flags supported by TCG */
+    uint64_t unmigratable_flags; /* Feature flags known to be unmigratable */
+    uint64_t migratable_flags; /* Feature flags known to be migratable */
+    /* Features that shouldn't be auto-enabled by "-cpu host" */
+    uint64_t no_autoenable_flags;
+} FeatureWordInfo;
+
+extern FeatureWordInfo feature_word_info[];
+
+void x86_cpu_expand_features(X86CPU *cpu, Error **errp);
+
+#ifndef CONFIG_USER_ONLY
+GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs);
+void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
+                                const char *name, void *opaque, Error **errp);
+
+void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
+void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
+void x86_cpu_machine_reset_cb(void *opaque);
+#endif /* CONFIG_USER_ONLY */
+
+#endif /* CPU_INTERNAL_H */
diff --git a/target/i386/cpu-softmmu.c b/target/i386/cpu-softmmu.c
new file mode 100644
index 0000000000..c824408e8e
--- /dev/null
+++ b/target/i386/cpu-softmmu.c
@@ -0,0 +1,352 @@
+/*
+ *  i386 CPUID helper functions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
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
+#include "sysemu/xen.h"
+#include "sysemu/whpx.h"
+#include "kvm/kvm_i386.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-run-state.h"
+#include "qapi/qmp/qdict.h"
+#include "qom/qom-qobject.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "hw/qdev-properties.h"
+
+#include "exec/address-spaces.h"
+#include "hw/i386/apic_internal.h"
+
+#include "cpu-internal.h"
+
+/* Return a QDict containing keys for all properties that can be included
+ * in static expansion of CPU models. All properties set by x86_cpu_load_model()
+ * must be included in the dictionary.
+ */
+static QDict *x86_cpu_static_props(void)
+{
+    FeatureWord w;
+    int i;
+    static const char *props[] = {
+        "min-level",
+        "min-xlevel",
+        "family",
+        "model",
+        "stepping",
+        "model-id",
+        "vendor",
+        "lmce",
+        NULL,
+    };
+    static QDict *d;
+
+    if (d) {
+        return d;
+    }
+
+    d = qdict_new();
+    for (i = 0; props[i]; i++) {
+        qdict_put_null(d, props[i]);
+    }
+
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        FeatureWordInfo *fi = &feature_word_info[w];
+        int bit;
+        for (bit = 0; bit < 64; bit++) {
+            if (!fi->feat_names[bit]) {
+                continue;
+            }
+            qdict_put_null(d, fi->feat_names[bit]);
+        }
+    }
+
+    return d;
+}
+
+/* Add an entry to @props dict, with the value for property. */
+static void x86_cpu_expand_prop(X86CPU *cpu, QDict *props, const char *prop)
+{
+    QObject *value = object_property_get_qobject(OBJECT(cpu), prop,
+                                                 &error_abort);
+
+    qdict_put_obj(props, prop, value);
+}
+
+/* Convert CPU model data from X86CPU object to a property dictionary
+ * that can recreate exactly the same CPU model.
+ */
+static void x86_cpu_to_dict(X86CPU *cpu, QDict *props)
+{
+    QDict *sprops = x86_cpu_static_props();
+    const QDictEntry *e;
+
+    for (e = qdict_first(sprops); e; e = qdict_next(sprops, e)) {
+        const char *prop = qdict_entry_key(e);
+        x86_cpu_expand_prop(cpu, props, prop);
+    }
+}
+
+/* Convert CPU model data from X86CPU object to a property dictionary
+ * that can recreate exactly the same CPU model, including every
+ * writeable QOM property.
+ */
+static void x86_cpu_to_dict_full(X86CPU *cpu, QDict *props)
+{
+    ObjectPropertyIterator iter;
+    ObjectProperty *prop;
+
+    object_property_iter_init(&iter, OBJECT(cpu));
+    while ((prop = object_property_iter_next(&iter))) {
+        /* skip read-only or write-only properties */
+        if (!prop->get || !prop->set) {
+            continue;
+        }
+
+        /* "hotplugged" is the only property that is configurable
+         * on the command-line but will be set differently on CPUs
+         * created using "-cpu ... -smp ..." and by CPUs created
+         * on the fly by x86_cpu_from_model() for querying. Skip it.
+         */
+        if (!strcmp(prop->name, "hotplugged")) {
+            continue;
+        }
+        x86_cpu_expand_prop(cpu, props, prop->name);
+    }
+}
+
+static void object_apply_props(Object *obj, QDict *props, Error **errp)
+{
+    const QDictEntry *prop;
+
+    for (prop = qdict_first(props); prop; prop = qdict_next(props, prop)) {
+        if (!object_property_set_qobject(obj, qdict_entry_key(prop),
+                                         qdict_entry_value(prop), errp)) {
+            break;
+        }
+    }
+}
+
+/* Create X86CPU object according to model+props specification */
+static X86CPU *x86_cpu_from_model(const char *model, QDict *props, Error **errp)
+{
+    X86CPU *xc = NULL;
+    X86CPUClass *xcc;
+    Error *err = NULL;
+
+    xcc = X86_CPU_CLASS(cpu_class_by_name(TYPE_X86_CPU, model));
+    if (xcc == NULL) {
+        error_setg(&err, "CPU model '%s' not found", model);
+        goto out;
+    }
+
+    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
+    if (props) {
+        object_apply_props(OBJECT(xc), props, &err);
+        if (err) {
+            goto out;
+        }
+    }
+
+    x86_cpu_expand_features(xc, &err);
+    if (err) {
+        goto out;
+    }
+
+out:
+    if (err) {
+        error_propagate(errp, err);
+        object_unref(OBJECT(xc));
+        xc = NULL;
+    }
+    return xc;
+}
+
+CpuModelExpansionInfo *
+qmp_query_cpu_model_expansion(CpuModelExpansionType type,
+                                                      CpuModelInfo *model,
+                                                      Error **errp)
+{
+    X86CPU *xc = NULL;
+    Error *err = NULL;
+    CpuModelExpansionInfo *ret = g_new0(CpuModelExpansionInfo, 1);
+    QDict *props = NULL;
+    const char *base_name;
+
+    xc = x86_cpu_from_model(model->name,
+                            model->has_props ?
+                                qobject_to(QDict, model->props) :
+                                NULL, &err);
+    if (err) {
+        goto out;
+    }
+
+    props = qdict_new();
+    ret->model = g_new0(CpuModelInfo, 1);
+    ret->model->props = QOBJECT(props);
+    ret->model->has_props = true;
+
+    switch (type) {
+    case CPU_MODEL_EXPANSION_TYPE_STATIC:
+        /* Static expansion will be based on "base" only */
+        base_name = "base";
+        x86_cpu_to_dict(xc, props);
+    break;
+    case CPU_MODEL_EXPANSION_TYPE_FULL:
+        /* As we don't return every single property, full expansion needs
+         * to keep the original model name+props, and add extra
+         * properties on top of that.
+         */
+        base_name = model->name;
+        x86_cpu_to_dict_full(xc, props);
+    break;
+    default:
+        error_setg(&err, "Unsupported expansion type");
+        goto out;
+    }
+
+    x86_cpu_to_dict(xc, props);
+
+    ret->model->name = g_strdup(base_name);
+
+out:
+    object_unref(OBJECT(xc));
+    if (err) {
+        error_propagate(errp, err);
+        qapi_free_CpuModelExpansionInfo(ret);
+        ret = NULL;
+    }
+    return ret;
+}
+
+void cpu_clear_apic_feature(CPUX86State *env)
+{
+    env->features[FEAT_1_EDX] &= ~CPUID_APIC;
+}
+
+bool cpu_is_bsp(X86CPU *cpu)
+{
+    return cpu_get_apic_base(cpu->apic_state) & MSR_IA32_APICBASE_BSP;
+}
+
+/* TODO: remove me, when reset over QOM tree is implemented */
+void x86_cpu_machine_reset_cb(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    cpu_reset(CPU(cpu));
+}
+
+APICCommonClass *apic_get_class(void)
+{
+    const char *apic_type = "apic";
+
+    /* TODO: in-kernel irqchip for hvf */
+    if (kvm_apic_in_kernel()) {
+        apic_type = "kvm-apic";
+    } else if (xen_enabled()) {
+        apic_type = "xen-apic";
+    } else if (whpx_apic_in_platform()) {
+        apic_type = "whpx-apic";
+    }
+
+    return APIC_COMMON_CLASS(object_class_by_name(apic_type));
+}
+
+void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
+{
+    APICCommonState *apic;
+    ObjectClass *apic_class = OBJECT_CLASS(apic_get_class());
+
+    cpu->apic_state = DEVICE(object_new_with_class(apic_class));
+
+    object_property_add_child(OBJECT(cpu), "lapic",
+                              OBJECT(cpu->apic_state));
+    object_unref(OBJECT(cpu->apic_state));
+
+    qdev_prop_set_uint32(cpu->apic_state, "id", cpu->apic_id);
+    /* TODO: convert to link<> */
+    apic = APIC_COMMON(cpu->apic_state);
+    apic->cpu = cpu;
+    apic->apicbase = APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE;
+}
+
+void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
+{
+    APICCommonState *apic;
+    static bool apic_mmio_map_once;
+
+    if (cpu->apic_state == NULL) {
+        return;
+    }
+    qdev_realize(DEVICE(cpu->apic_state), NULL, errp);
+
+    /* Map APIC MMIO area */
+    apic = APIC_COMMON(cpu->apic_state);
+    if (!apic_mmio_map_once) {
+        memory_region_add_subregion_overlap(get_system_memory(),
+                                            apic->apicbase &
+                                            MSR_IA32_APICBASE_BASE,
+                                            &apic->io_memory,
+                                            0x1000);
+        apic_mmio_map_once = true;
+     }
+}
+
+GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    GuestPanicInformation *panic_info = NULL;
+
+    if (env->features[FEAT_HYPERV_EDX] & HV_GUEST_CRASH_MSR_AVAILABLE) {
+        panic_info = g_malloc0(sizeof(GuestPanicInformation));
+
+        panic_info->type = GUEST_PANIC_INFORMATION_TYPE_HYPER_V;
+
+        assert(HV_CRASH_PARAMS >= 5);
+        panic_info->u.hyper_v.arg1 = env->msr_hv_crash_params[0];
+        panic_info->u.hyper_v.arg2 = env->msr_hv_crash_params[1];
+        panic_info->u.hyper_v.arg3 = env->msr_hv_crash_params[2];
+        panic_info->u.hyper_v.arg4 = env->msr_hv_crash_params[3];
+        panic_info->u.hyper_v.arg5 = env->msr_hv_crash_params[4];
+    }
+
+    return panic_info;
+}
+void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
+                                const char *name, void *opaque,
+                                Error **errp)
+{
+    CPUState *cs = CPU(obj);
+    GuestPanicInformation *panic_info;
+
+    if (!cs->crash_occurred) {
+        error_setg(errp, "No crash occured");
+        return;
+    }
+
+    panic_info = x86_cpu_get_crash_info(cs);
+    if (panic_info == NULL) {
+        error_setg(errp, "No crash information");
+        return;
+    }
+
+    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
+                                     errp);
+    qapi_free_GuestPanicInformation(panic_info);
+}
+
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8d2e1c3136..f9db351f1f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -20,35 +20,26 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
-#include "qemu/bitops.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
-#include "exec/exec-all.h"
-#include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
-#include "sysemu/xen.h"
-#include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
-#include "qemu/module.h"
 #include "qapi/qapi-visit-machine.h"
-#include "qapi/qapi-visit-run-state.h"
-#include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
-#include "qom/qom-qobject.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
-#include "hw/i386/apic_internal.h"
 #include "hw/boards.h"
 #endif
 
 #include "disas/capstone.h"
+#include "cpu-internal.h"
 
 /* Helpers for building CPUID[2] descriptors: */
 
@@ -663,40 +654,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_XSAVE_XSAVEC, CPUID_XSAVE_XSAVES */
 #define TCG_14_0_ECX_FEATURES 0
 
-typedef enum FeatureWordType {
-   CPUID_FEATURE_WORD,
-   MSR_FEATURE_WORD,
-} FeatureWordType;
-
-typedef struct FeatureWordInfo {
-    FeatureWordType type;
-    /* feature flags names are taken from "Intel Processor Identification and
-     * the CPUID Instruction" and AMD's "CPUID Specification".
-     * In cases of disagreement between feature naming conventions,
-     * aliases may be added.
-     */
-    const char *feat_names[64];
-    union {
-        /* If type==CPUID_FEATURE_WORD */
-        struct {
-            uint32_t eax;   /* Input EAX for CPUID */
-            bool needs_ecx; /* CPUID instruction uses ECX as input */
-            uint32_t ecx;   /* Input ECX value for CPUID */
-            int reg;        /* output register (R_* constant) */
-        } cpuid;
-        /* If type==MSR_FEATURE_WORD */
-        struct {
-            uint32_t index;
-        } msr;
-    };
-    uint64_t tcg_features; /* Feature flags supported by TCG */
-    uint64_t unmigratable_flags; /* Feature flags known to be unmigratable */
-    uint64_t migratable_flags; /* Feature flags known to be migratable */
-    /* Features that shouldn't be auto-enabled by "-cpu host" */
-    uint64_t no_autoenable_flags;
-} FeatureWordInfo;
-
-static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
+FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
     [FEAT_1_EDX] = {
         .type = CPUID_FEATURE_WORD,
         .feat_names = {
@@ -4633,7 +4591,6 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
     }
 }
 
-static void x86_cpu_expand_features(X86CPU *cpu, Error **errp);
 static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);
 
 /* Build a list with the name of all features on a feature word array */
@@ -5003,207 +4960,6 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     memset(&env->user_features, 0, sizeof(env->user_features));
 }
 
-#ifndef CONFIG_USER_ONLY
-/* Return a QDict containing keys for all properties that can be included
- * in static expansion of CPU models. All properties set by x86_cpu_load_model()
- * must be included in the dictionary.
- */
-static QDict *x86_cpu_static_props(void)
-{
-    FeatureWord w;
-    int i;
-    static const char *props[] = {
-        "min-level",
-        "min-xlevel",
-        "family",
-        "model",
-        "stepping",
-        "model-id",
-        "vendor",
-        "lmce",
-        NULL,
-    };
-    static QDict *d;
-
-    if (d) {
-        return d;
-    }
-
-    d = qdict_new();
-    for (i = 0; props[i]; i++) {
-        qdict_put_null(d, props[i]);
-    }
-
-    for (w = 0; w < FEATURE_WORDS; w++) {
-        FeatureWordInfo *fi = &feature_word_info[w];
-        int bit;
-        for (bit = 0; bit < 64; bit++) {
-            if (!fi->feat_names[bit]) {
-                continue;
-            }
-            qdict_put_null(d, fi->feat_names[bit]);
-        }
-    }
-
-    return d;
-}
-
-/* Add an entry to @props dict, with the value for property. */
-static void x86_cpu_expand_prop(X86CPU *cpu, QDict *props, const char *prop)
-{
-    QObject *value = object_property_get_qobject(OBJECT(cpu), prop,
-                                                 &error_abort);
-
-    qdict_put_obj(props, prop, value);
-}
-
-/* Convert CPU model data from X86CPU object to a property dictionary
- * that can recreate exactly the same CPU model.
- */
-static void x86_cpu_to_dict(X86CPU *cpu, QDict *props)
-{
-    QDict *sprops = x86_cpu_static_props();
-    const QDictEntry *e;
-
-    for (e = qdict_first(sprops); e; e = qdict_next(sprops, e)) {
-        const char *prop = qdict_entry_key(e);
-        x86_cpu_expand_prop(cpu, props, prop);
-    }
-}
-
-/* Convert CPU model data from X86CPU object to a property dictionary
- * that can recreate exactly the same CPU model, including every
- * writeable QOM property.
- */
-static void x86_cpu_to_dict_full(X86CPU *cpu, QDict *props)
-{
-    ObjectPropertyIterator iter;
-    ObjectProperty *prop;
-
-    object_property_iter_init(&iter, OBJECT(cpu));
-    while ((prop = object_property_iter_next(&iter))) {
-        /* skip read-only or write-only properties */
-        if (!prop->get || !prop->set) {
-            continue;
-        }
-
-        /* "hotplugged" is the only property that is configurable
-         * on the command-line but will be set differently on CPUs
-         * created using "-cpu ... -smp ..." and by CPUs created
-         * on the fly by x86_cpu_from_model() for querying. Skip it.
-         */
-        if (!strcmp(prop->name, "hotplugged")) {
-            continue;
-        }
-        x86_cpu_expand_prop(cpu, props, prop->name);
-    }
-}
-
-static void object_apply_props(Object *obj, QDict *props, Error **errp)
-{
-    const QDictEntry *prop;
-
-    for (prop = qdict_first(props); prop; prop = qdict_next(props, prop)) {
-        if (!object_property_set_qobject(obj, qdict_entry_key(prop),
-                                         qdict_entry_value(prop), errp)) {
-            break;
-        }
-    }
-}
-
-/* Create X86CPU object according to model+props specification */
-static X86CPU *x86_cpu_from_model(const char *model, QDict *props, Error **errp)
-{
-    X86CPU *xc = NULL;
-    X86CPUClass *xcc;
-    Error *err = NULL;
-
-    xcc = X86_CPU_CLASS(cpu_class_by_name(TYPE_X86_CPU, model));
-    if (xcc == NULL) {
-        error_setg(&err, "CPU model '%s' not found", model);
-        goto out;
-    }
-
-    xc = X86_CPU(object_new_with_class(OBJECT_CLASS(xcc)));
-    if (props) {
-        object_apply_props(OBJECT(xc), props, &err);
-        if (err) {
-            goto out;
-        }
-    }
-
-    x86_cpu_expand_features(xc, &err);
-    if (err) {
-        goto out;
-    }
-
-out:
-    if (err) {
-        error_propagate(errp, err);
-        object_unref(OBJECT(xc));
-        xc = NULL;
-    }
-    return xc;
-}
-
-CpuModelExpansionInfo *
-qmp_query_cpu_model_expansion(CpuModelExpansionType type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
-{
-    X86CPU *xc = NULL;
-    Error *err = NULL;
-    CpuModelExpansionInfo *ret = g_new0(CpuModelExpansionInfo, 1);
-    QDict *props = NULL;
-    const char *base_name;
-
-    xc = x86_cpu_from_model(model->name,
-                            model->has_props ?
-                                qobject_to(QDict, model->props) :
-                                NULL, &err);
-    if (err) {
-        goto out;
-    }
-
-    props = qdict_new();
-    ret->model = g_new0(CpuModelInfo, 1);
-    ret->model->props = QOBJECT(props);
-    ret->model->has_props = true;
-
-    switch (type) {
-    case CPU_MODEL_EXPANSION_TYPE_STATIC:
-        /* Static expansion will be based on "base" only */
-        base_name = "base";
-        x86_cpu_to_dict(xc, props);
-    break;
-    case CPU_MODEL_EXPANSION_TYPE_FULL:
-        /* As we don't return every single property, full expansion needs
-         * to keep the original model name+props, and add extra
-         * properties on top of that.
-         */
-        base_name = model->name;
-        x86_cpu_to_dict_full(xc, props);
-    break;
-    default:
-        error_setg(&err, "Unsupported expansion type");
-        goto out;
-    }
-
-    x86_cpu_to_dict(xc, props);
-
-    ret->model->name = g_strdup(base_name);
-
-out:
-    object_unref(OBJECT(xc));
-    if (err) {
-        error_propagate(errp, err);
-        qapi_free_CpuModelExpansionInfo(ret);
-        ret = NULL;
-    }
-    return ret;
-}
-#endif  /* !CONFIG_USER_ONLY */
-
 static gchar *x86_gdb_arch_name(CPUState *cs)
 {
 #ifdef TARGET_X86_64
@@ -5278,15 +5034,6 @@ static void x86_register_cpudef_types(X86CPUDefinition *def)
 
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
-void cpu_clear_apic_feature(CPUX86State *env)
-{
-    env->features[FEAT_1_EDX] &= ~CPUID_APIC;
-}
-
-#endif /* !CONFIG_USER_ONLY */
-
 void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                    uint32_t *eax, uint32_t *ebx,
                    uint32_t *ecx, uint32_t *edx)
@@ -5934,20 +5681,6 @@ static void x86_cpu_reset(DeviceState *dev)
 #endif
 }
 
-#ifndef CONFIG_USER_ONLY
-bool cpu_is_bsp(X86CPU *cpu)
-{
-    return cpu_get_apic_base(cpu->apic_state) & MSR_IA32_APICBASE_BSP;
-}
-
-/* TODO: remove me, when reset over QOM tree is implemented */
-static void x86_cpu_machine_reset_cb(void *opaque)
-{
-    X86CPU *cpu = opaque;
-    cpu_reset(CPU(cpu));
-}
-#endif
-
 static void mce_init(X86CPU *cpu)
 {
     CPUX86State *cenv = &cpu->env;
@@ -5965,68 +5698,6 @@ static void mce_init(X86CPU *cpu)
     }
 }
 
-#ifndef CONFIG_USER_ONLY
-APICCommonClass *apic_get_class(void)
-{
-    const char *apic_type = "apic";
-
-    /* TODO: in-kernel irqchip for hvf */
-    if (kvm_apic_in_kernel()) {
-        apic_type = "kvm-apic";
-    } else if (xen_enabled()) {
-        apic_type = "xen-apic";
-    } else if (whpx_apic_in_platform()) {
-        apic_type = "whpx-apic";
-    }
-
-    return APIC_COMMON_CLASS(object_class_by_name(apic_type));
-}
-
-static void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
-{
-    APICCommonState *apic;
-    ObjectClass *apic_class = OBJECT_CLASS(apic_get_class());
-
-    cpu->apic_state = DEVICE(object_new_with_class(apic_class));
-
-    object_property_add_child(OBJECT(cpu), "lapic",
-                              OBJECT(cpu->apic_state));
-    object_unref(OBJECT(cpu->apic_state));
-
-    qdev_prop_set_uint32(cpu->apic_state, "id", cpu->apic_id);
-    /* TODO: convert to link<> */
-    apic = APIC_COMMON(cpu->apic_state);
-    apic->cpu = cpu;
-    apic->apicbase = APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE;
-}
-
-static void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
-{
-    APICCommonState *apic;
-    static bool apic_mmio_map_once;
-
-    if (cpu->apic_state == NULL) {
-        return;
-    }
-    qdev_realize(DEVICE(cpu->apic_state), NULL, errp);
-
-    /* Map APIC MMIO area */
-    apic = APIC_COMMON(cpu->apic_state);
-    if (!apic_mmio_map_once) {
-        memory_region_add_subregion_overlap(get_system_memory(),
-                                            apic->apicbase &
-                                            MSR_IA32_APICBASE_BASE,
-                                            &apic->io_memory,
-                                            0x1000);
-        apic_mmio_map_once = true;
-     }
-}
-#else
-static void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
-{
-}
-#endif
-
 static void x86_cpu_adjust_level(X86CPU *cpu, uint32_t *min, uint32_t value)
 {
     if (*min < value) {
@@ -6130,7 +5801,7 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
 /* Expand CPU configuration data, based on configured features
  * and host/accelerator capabilities when appropriate.
  */
-static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
+void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
 {
     CPUX86State *env = &cpu->env;
     FeatureWord w;
@@ -6502,10 +6173,12 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
             ht_warned = true;
     }
 
+#ifndef CONFIG_USER_ONLY
     x86_cpu_apic_realize(cpu, &local_err);
     if (local_err != NULL) {
         goto out;
     }
+#endif /* !CONFIG_USER_ONLY */
     cpu_reset(cs);
 
     xcc->parent_realize(dev, &local_err);
@@ -6629,52 +6302,6 @@ static void x86_cpu_register_feature_bit_props(X86CPUClass *xcc,
     x86_cpu_register_bit_prop(xcc, name, w, bitnr);
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    GuestPanicInformation *panic_info = NULL;
-
-    if (env->features[FEAT_HYPERV_EDX] & HV_GUEST_CRASH_MSR_AVAILABLE) {
-        panic_info = g_malloc0(sizeof(GuestPanicInformation));
-
-        panic_info->type = GUEST_PANIC_INFORMATION_TYPE_HYPER_V;
-
-        assert(HV_CRASH_PARAMS >= 5);
-        panic_info->u.hyper_v.arg1 = env->msr_hv_crash_params[0];
-        panic_info->u.hyper_v.arg2 = env->msr_hv_crash_params[1];
-        panic_info->u.hyper_v.arg3 = env->msr_hv_crash_params[2];
-        panic_info->u.hyper_v.arg4 = env->msr_hv_crash_params[3];
-        panic_info->u.hyper_v.arg5 = env->msr_hv_crash_params[4];
-    }
-
-    return panic_info;
-}
-static void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
-                                       const char *name, void *opaque,
-                                       Error **errp)
-{
-    CPUState *cs = CPU(obj);
-    GuestPanicInformation *panic_info;
-
-    if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occured");
-        return;
-    }
-
-    panic_info = x86_cpu_get_crash_info(cs);
-    if (panic_info == NULL) {
-        error_setg(errp, "No crash information");
-        return;
-    }
-
-    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
-                                     errp);
-    qapi_free_GuestPanicInformation(panic_info);
-}
-#endif /* !CONFIG_USER_ONLY */
-
 static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
diff --git a/target/i386/meson.build b/target/i386/meson.build
index cac26a4581..c2c3cec884 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -18,6 +18,7 @@ i386_softmmu_ss.add(files(
   'arch_memory_mapping.c',
   'machine.c',
   'monitor.c',
+  'cpu-softmmu.c',
 ))
 i386_user_ss = ss.source_set()
 
-- 
2.26.2


