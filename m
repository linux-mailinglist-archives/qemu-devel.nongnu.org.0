Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC403BF331
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:59:37 +0200 (CEST)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IO8-0007tz-KN
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKm-0001st-6g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:19093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0007Lp-2J
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209461994"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209461994"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423769989"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:52 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 03/44] i386/kvm: Move architectural CPUID leaf
 generation to separarte helper
Date: Wed,  7 Jul 2021 17:54:33 -0700
Message-Id: <d5ee34f3ef17c4dd2cfbcf4edb8c622859e227eb.1625704980.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=isaku.yamahata@intel.com; helo=mga03.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Move the architectural (for lack of a better term) CPUID leaf generation
to a separate helper so that the generation code can be reused by TDX,
which needs to generate a canonical VM-scoped configuration.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/kvm.c      | 186 +++++++++++++++++++------------------
 target/i386/kvm/kvm_i386.h |   4 +
 2 files changed, 102 insertions(+), 88 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 04e4ec063f..0558e4b506 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1507,90 +1507,12 @@ static int hyperv_init_vcpu(X86CPU *cpu)
 
 static Error *invtsc_mig_blocker;
 
-#define KVM_MAX_CPUID_ENTRIES  100
-
-int kvm_arch_init_vcpu(CPUState *cs)
+uint32_t kvm_x86_arch_cpuid(CPUX86State *env, struct kvm_cpuid_entry2 *entries,
+                            uint32_t cpuid_i)
 {
-    struct {
-        struct kvm_cpuid2 cpuid;
-        struct kvm_cpuid_entry2 entries[KVM_MAX_CPUID_ENTRIES];
-    } cpuid_data;
-    /*
-     * The kernel defines these structs with padding fields so there
-     * should be no extra padding in our cpuid_data struct.
-     */
-    QEMU_BUILD_BUG_ON(sizeof(cpuid_data) !=
-                      sizeof(struct kvm_cpuid2) +
-                      sizeof(struct kvm_cpuid_entry2) * KVM_MAX_CPUID_ENTRIES);
-
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    uint32_t limit, i, j, cpuid_i;
+    uint32_t limit, i, j;
     uint32_t unused;
     struct kvm_cpuid_entry2 *c;
-    uint32_t signature[3];
-    int kvm_base = KVM_CPUID_SIGNATURE;
-    int max_nested_state_len;
-    int r;
-    Error *local_err = NULL;
-
-    memset(&cpuid_data, 0, sizeof(cpuid_data));
-
-    cpuid_i = 0;
-
-    r = kvm_arch_set_tsc_khz(cs);
-    if (r < 0) {
-        return r;
-    }
-
-    /* vcpu's TSC frequency is either specified by user, or following
-     * the value used by KVM if the former is not present. In the
-     * latter case, we query it from KVM and record in env->tsc_khz,
-     * so that vcpu's TSC frequency can be migrated later via this field.
-     */
-    if (!env->tsc_khz) {
-        r = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
-            kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
-            -ENOTSUP;
-        if (r > 0) {
-            env->tsc_khz = r;
-        }
-    }
-
-    env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
-
-    /* Paravirtualization CPUIDs */
-    hyperv_expand_features(cs, &local_err);
-    if (local_err) {
-        error_report_err(local_err);
-        return -ENOSYS;
-    }
-
-    if (hyperv_enabled(cpu)) {
-        r = hyperv_init_vcpu(cpu);
-        if (r) {
-            return r;
-        }
-
-        cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
-        kvm_base = KVM_CPUID_SIGNATURE_NEXT;
-        has_msr_hv_hypercall = true;
-    }
-
-    if (cpu->expose_kvm) {
-        memcpy(signature, "KVMKVMKVM\0\0\0", 12);
-        c = &cpuid_data.entries[cpuid_i++];
-        c->function = KVM_CPUID_SIGNATURE | kvm_base;
-        c->eax = KVM_CPUID_FEATURES | kvm_base;
-        c->ebx = signature[0];
-        c->ecx = signature[1];
-        c->edx = signature[2];
-
-        c = &cpuid_data.entries[cpuid_i++];
-        c->function = KVM_CPUID_FEATURES | kvm_base;
-        c->eax = env->features[FEAT_KVM];
-        c->edx = env->features[FEAT_KVM_HINTS];
-    }
 
     cpu_x86_cpuid(env, 0, 0, &limit, &unused, &unused, &unused);
 
@@ -1599,7 +1521,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             fprintf(stderr, "unsupported level value: 0x%x\n", limit);
             abort();
         }
-        c = &cpuid_data.entries[cpuid_i++];
+        c = &entries[cpuid_i++];
 
         switch (i) {
         case 2: {
@@ -1618,7 +1540,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                             "cpuid(eax:2):eax & 0xf = 0x%x\n", times);
                     abort();
                 }
-                c = &cpuid_data.entries[cpuid_i++];
+                c = &entries[cpuid_i++];
                 c->function = i;
                 c->flags = KVM_CPUID_FLAG_STATEFUL_FUNC;
                 cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
@@ -1664,7 +1586,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                             "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
                     abort();
                 }
-                c = &cpuid_data.entries[cpuid_i++];
+                c = &entries[cpuid_i++];
             }
             break;
         case 0x7:
@@ -1683,7 +1605,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                                 "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
                     abort();
                 }
-                c = &cpuid_data.entries[cpuid_i++];
+                c = &entries[cpuid_i++];
                 c->function = i;
                 c->index = j;
                 c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
@@ -1740,7 +1662,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
             fprintf(stderr, "unsupported xlevel value: 0x%x\n", limit);
             abort();
         }
-        c = &cpuid_data.entries[cpuid_i++];
+        c = &entries[cpuid_i++];
 
         switch (i) {
         case 0x8000001d:
@@ -1759,7 +1681,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                             "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
                     abort();
                 }
-                c = &cpuid_data.entries[cpuid_i++];
+                c = &entries[cpuid_i++];
             }
             break;
         default:
@@ -1786,7 +1708,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                 fprintf(stderr, "unsupported xlevel2 value: 0x%x\n", limit);
                 abort();
             }
-            c = &cpuid_data.entries[cpuid_i++];
+            c = &entries[cpuid_i++];
 
             c->function = i;
             c->flags = 0;
@@ -1794,6 +1716,94 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    return cpuid_i;
+}
+
+#define KVM_MAX_CPUID_ENTRIES  100
+
+int kvm_arch_init_vcpu(CPUState *cs)
+{
+    struct {
+        struct kvm_cpuid2 cpuid;
+        struct kvm_cpuid_entry2 entries[KVM_MAX_CPUID_ENTRIES];
+    } cpuid_data;
+    /*
+     * The kernel defines these structs with padding fields so there
+     * should be no extra padding in our cpuid_data struct.
+     */
+    QEMU_BUILD_BUG_ON(sizeof(cpuid_data) !=
+                      sizeof(struct kvm_cpuid2) +
+                      sizeof(struct kvm_cpuid_entry2) * KVM_MAX_CPUID_ENTRIES);
+
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint32_t cpuid_i;
+    struct kvm_cpuid_entry2 *c;
+    uint32_t signature[3];
+    int kvm_base = KVM_CPUID_SIGNATURE;
+    int max_nested_state_len;
+    int r;
+    Error *local_err = NULL;
+
+    memset(&cpuid_data, 0, sizeof(cpuid_data));
+
+    cpuid_i = 0;
+
+    r = kvm_arch_set_tsc_khz(cs);
+    if (r < 0) {
+        return r;
+    }
+
+    /* vcpu's TSC frequency is either specified by user, or following
+     * the value used by KVM if the former is not present. In the
+     * latter case, we query it from KVM and record in env->tsc_khz,
+     * so that vcpu's TSC frequency can be migrated later via this field.
+     */
+    if (!env->tsc_khz) {
+        r = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+            kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
+            -ENOTSUP;
+        if (r > 0) {
+            env->tsc_khz = r;
+        }
+    }
+
+    env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
+
+    /* Paravirtualization CPUIDs */
+    hyperv_expand_features(cs, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        return -ENOSYS;
+    }
+
+    if (hyperv_enabled(cpu)) {
+        r = hyperv_init_vcpu(cpu);
+        if (r) {
+            return r;
+        }
+
+        cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
+        kvm_base = KVM_CPUID_SIGNATURE_NEXT;
+        has_msr_hv_hypercall = true;
+    }
+
+    if (cpu->expose_kvm) {
+        memcpy(signature, "KVMKVMKVM\0\0\0", 12);
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = KVM_CPUID_SIGNATURE | kvm_base;
+        c->eax = KVM_CPUID_FEATURES | kvm_base;
+        c->ebx = signature[0];
+        c->ecx = signature[1];
+        c->edx = signature[2];
+
+        c = &cpuid_data.entries[cpuid_i++];
+        c->function = KVM_CPUID_FEATURES | kvm_base;
+        c->eax = env->features[FEAT_KVM];
+        c->edx = env->features[FEAT_KVM_HINTS];
+    }
+
+    cpuid_i = kvm_x86_arch_cpuid(env, cpuid_data.entries, cpuid_i);
     cpuid_data.cpuid.nent = cpuid_i;
 
     if (((env->cpuid_version >> 8)&0xF) >= 6
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index dc72508389..c9a92578b1 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -24,6 +24,10 @@
 #define kvm_ioapic_in_kernel() \
     (kvm_irqchip_in_kernel() && !kvm_irqchip_is_split())
 
+#define KVM_MAX_CPUID_ENTRIES  100
+uint32_t kvm_x86_arch_cpuid(CPUX86State *env, struct kvm_cpuid_entry2 *entries,
+                            uint32_t cpuid_i);
+
 #else
 
 #define kvm_pit_in_kernel()      0
-- 
2.25.1


