Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53D3D3983
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:32:05 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6tPQ-0005Xe-Bq
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6tMv-0003Zm-O7
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:29:30 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6tMq-000281-KO
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:29:29 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48ADA21E29;
 Fri, 23 Jul 2021 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627039763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hLEV1q7Zp9Rw43Am7wFNZwBQD0B34B6HuRlsfq8IUiQ=;
 b=aMhfz+qYeBzvdEWETEJsbLv0F+59Wvuzqmkq5Fazcj/sLKJiwsStDFg3PkM4b2FMmjO4Ey
 ytyTy2+le9eOwcJDq4K1FFLRE1E+gJuiI9QGxC3jiwv7TPjze/N6wTseN8xpRZe9wHnMzW
 Q8cPhVxoqFjNSrreAYpP/YZHJ5/nuS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627039763;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hLEV1q7Zp9Rw43Am7wFNZwBQD0B34B6HuRlsfq8IUiQ=;
 b=EeY1bNmmM4s0nEqjvZIoqZ5lV9tAJhWoqp5NsIhFpxpkl4BSc3I0WpG+8YO1rtD0MqcKmj
 rJH2A4fHuLzHFYDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F211F13E02;
 Fri, 23 Jul 2021 11:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NxDvOBKo+mCgHAAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 11:29:22 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-6.1 v2] i386: do not call cpudef-only models functions for
 max, host, base
Date: Fri, 23 Jul 2021 13:29:21 +0200
Message-Id: <20210723112921.12637-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
@@ -150,21 +109,69 @@ static void kvm_cpu_xsave_init(void)
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
-    }
-
-    /* Special cases not set in the X86CPUDefinition structs: */
+    if (xcc->model) {
+        /* only applies to builtin_x86_defs cpus */
+        if (!kvm_irqchip_in_kernel()) {
+            x86_cpu_change_kvm_default("x2apic", "off");
+        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
+        }
 
-    x86_cpu_apply_props(cpu, kvm_default_props);
+        /* Special cases not set in the X86CPUDefinition structs: */
+        x86_cpu_apply_props(cpu, kvm_default_props);
+    }
 
     if (cpu->max_features) {
         kvm_cpu_max_instance_init(cpu);
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e96ec9bbcc..e86bc93384 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -99,7 +99,8 @@ static void tcg_cpu_xsave_init(void)
 }
 
 /*
- * TCG-specific defaults that override all CPU models when using TCG
+ * TCG-specific defaults that override cpudef models when using TCG.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
  */
 static PropValue tcg_default_props[] = {
     { "vme", "off" },
@@ -109,8 +110,12 @@ static PropValue tcg_default_props[] = {
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
2.26.2


