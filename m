Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A13D4686
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:59:54 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DVh-00034U-Rn
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQz-00033p-1o
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:05 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQx-0002u2-3h
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:00 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hq13so7221193ejc.7
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnmkHMYKQc2LFh1O1HKjyWYtXTQnY6m+i7KWJhDlxvw=;
 b=ETTuISH1/OtXlpgueraJkdngcu/9hOcX8gitQAbDwH/WmimB0yoedqKIa/0Cu8h2rg
 C30EiPU2wvDuI8yf+ELvOgdEdbsJ/JZ8kiHw1Xzv8NzMwvLcUv6mHBapxj9/I15EjUTo
 w4iCpiSDa6xhIXHO+GdnkrcWdQPTBdwGc6oGHYZCh4AQetliEJAMcJo0HJ0ZUyCHDhYp
 Z6MZG9wMLV1gZMnA1hsh8BUmA2I4syMPosKrIRATKTsLjo7d9oUQSK6jLZ1Gk5Bw0kJU
 dkP7H7m+r/7KQ+niEeO3kqyfD54/5tNF7luuMFYR3UXxcAugioTgEFaYV6o1GwXMRASf
 LR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dnmkHMYKQc2LFh1O1HKjyWYtXTQnY6m+i7KWJhDlxvw=;
 b=nIHThmq9OoNAgd8XaqPC58Hy1jYaeN2Zf+nC8QxIa8byot5+F/h9UI3a9lxnBBGCj7
 wEvZJFq0UZYhUXCwj6KfjaerwcK+NyWkCHvF+NrEKBu4N4lD3nvA4DFCtm4OoLvuKp1z
 E6mP8Dal93teV6rExiXuPMIw7k0Ju9QGY/LvD27n8OjmRjo5Gpkvhj8F0X1sXvF8bFsl
 0323DsG3jYv78BN13ShzK36QwR2tQwwTsVXuFl9RuS7OqGrwkyWRcdZXcPxLNgnxLxKz
 CgQ+8v3CiLQVuHhT8dAYsjDUWV/n5rMXGIBtkDXjF8YVUEVsPF5ut+xASylNhzqauUUq
 18AA==
X-Gm-Message-State: AOAM530J37yTn1lIoOCed6eXN2FYwLV5tkHiVnVyAV0N2Esv3MLdodEY
 R5IWjxtm4VyCo9KhWgcTNAa5uCl9XjPMvQ==
X-Google-Smtp-Source: ABdhPJwMtTVYyxVWCOLzoqRWWQInBj8u3445e/m53sdnwUcgrzuIAcrazBmbhza/veAgYCo7b4GRDg==
X-Received: by 2002:a17:906:4e85:: with SMTP id
 v5mr8178295eju.67.1627116897635; 
 Sat, 24 Jul 2021 01:54:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] i386: do not call cpudef-only models functions for max,
 host, base
Date: Sat, 24 Jul 2021 10:54:47 +0200
Message-Id: <20210724085453.16791-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Some cpu properties have to be set only for cpu models in builtin_x86_defs,
registered with x86_register_cpu_model_type, and not for
cpu models "base", "max", and the subclass "host".

These properties are the ones set by function x86_cpu_apply_props,
(also including kvm_default_props, tcg_default_props),
and the "vendor" property for the KVM and HVF accelerators.

After recent refactoring of cpu, which also affected these properties,
they were instead set unconditionally for all x86 cpus.

This has been detected as a bug with Nested on AMD with cpu "host",
as svm was not turned on by default, due to the wrongful setting of
kvm_default_props via x86_cpu_apply_props, which set svm to "off".

Rectify the bug introduced in commit "i386: split cpu accelerators"
and document the functions that are builtin_x86_defs-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c,"...)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/477
Message-Id: <20210723112921.12637-1-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c         |  19 ++++++-
 target/i386/host-cpu.c    |  13 +++--
 target/i386/kvm/kvm-cpu.c | 105 ++++++++++++++++++++------------------
 target/i386/tcg/tcg-cpu.c |  11 ++--
 4 files changed, 89 insertions(+), 59 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48b55ebd0a..edb97ebbbe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4919,6 +4919,9 @@ static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     return r;
 }
 
+/*
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ */
 void x86_cpu_apply_props(X86CPU *cpu, PropValue *props)
 {
     PropValue *pv;
@@ -4931,7 +4934,11 @@ void x86_cpu_apply_props(X86CPU *cpu, PropValue *props)
     }
 }
 
-/* Apply properties for the CPU model version specified in model */
+/*
+ * Apply properties for the CPU model version specified in model.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ */
+
 static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
 {
     const X86CPUVersionDefinition *vdef;
@@ -4960,7 +4967,9 @@ static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
     assert(vdef->version == version);
 }
 
-/* Load data from X86CPUDefinition into a X86CPU object
+/*
+ * Load data from X86CPUDefinition into a X86CPU object.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
 static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
 {
@@ -5051,6 +5060,12 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
     type_register(&ti);
 }
 
+
+/*
+ * register builtin_x86_defs;
+ * "max", "base" and subclasses ("host") are not registered here.
+ * See x86_cpu_register_types for all model registrations.
+ */
 static void x86_register_cpudef_types(const X86CPUDefinition *def)
 {
     X86CPUModel *m;
diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 4ea9e354ea..10f8aba86e 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -150,13 +150,16 @@ void host_cpu_vendor_fms(char *vendor, int *family, int *model, int *stepping)
 
 void host_cpu_instance_init(X86CPU *cpu)
 {
-    uint32_t ebx = 0, ecx = 0, edx = 0;
-    char vendor[CPUID_VENDOR_SZ + 1];
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
 
-    host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
-    x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
+    if (xcc->model) {
+        uint32_t ebx = 0, ecx = 0, edx = 0;
+        char vendor[CPUID_VENDOR_SZ + 1];
 
-    object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+        host_cpuid(0, 0, NULL, &ebx, &ecx, &edx);
+        x86_cpu_vendor_words2str(vendor, ebx, edx, ecx);
+        object_property_set_str(OBJECT(cpu), "vendor", vendor, &error_abort);
+    }
 }
 
 void host_cpu_max_instance_init(X86CPU *cpu)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index bbe817764d..d95028018e 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -52,47 +52,6 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
     return host_cpu_realizefn(cs, errp);
 }
 
-/*
- * KVM-specific features that are automatically added/removed
- * from all CPU models when KVM is enabled.
- *
- * NOTE: features can be enabled by default only if they were
- *       already available in the oldest kernel version supported
- *       by the KVM accelerator (see "OS requirements" section at
- *       docs/system/target-i386.rst)
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
-    /*
-     * It is valid to call this function only for properties that
-     * are already present in the kvm_default_props table.
-     */
-    assert(pv->prop);
-}
-
 static bool lmce_supported(void)
 {
     uint64_t mce_cap = 0;
@@ -150,22 +109,70 @@ static void kvm_cpu_xsave_init(void)
     }
 }
 
+/*
+ * KVM-specific features that are automatically added/removed
+ * from cpudef models when KVM is enabled.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ *
+ * NOTE: features can be enabled by default only if they were
+ *       already available in the oldest kernel version supported
+ *       by the KVM accelerator (see "OS requirements" section at
+ *       docs/system/target-i386.rst)
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
+/*
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ */
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
 static void kvm_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
 
     host_cpu_instance_init(cpu);
 
-    if (!kvm_irqchip_in_kernel()) {
-        x86_cpu_change_kvm_default("x2apic", "off");
-    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
-        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
+    if (xcc->model) {
+        /* only applies to builtin_x86_defs cpus */
+        if (!kvm_irqchip_in_kernel()) {
+            x86_cpu_change_kvm_default("x2apic", "off");
+        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
+        }
+
+        /* Special cases not set in the X86CPUDefinition structs: */
+        x86_cpu_apply_props(cpu, kvm_default_props);
     }
 
-    /* Special cases not set in the X86CPUDefinition structs: */
-
-    x86_cpu_apply_props(cpu, kvm_default_props);
-
     if (cpu->max_features) {
         kvm_cpu_max_instance_init(cpu);
     }
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 238e3a9395..93a79a5741 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -111,7 +111,8 @@ static void tcg_cpu_xsave_init(void)
 }
 
 /*
- * TCG-specific defaults that override all CPU models when using TCG
+ * TCG-specific defaults that override cpudef models when using TCG.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
 static PropValue tcg_default_props[] = {
     { "vme", "off" },
@@ -121,8 +122,12 @@ static PropValue tcg_default_props[] = {
 static void tcg_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-    /* Special cases not set in the X86CPUDefinition structs: */
-    x86_cpu_apply_props(cpu, tcg_default_props);
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
+
+    if (xcc->model) {
+        /* Special cases not set in the X86CPUDefinition structs: */
+        x86_cpu_apply_props(cpu, tcg_default_props);
+    }
 
     tcg_cpu_xsave_init();
 }
-- 
2.31.1



