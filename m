Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D532B9EF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:37:15 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWN0-0001ue-LD
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA3-00075b-7h
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA0-0000pQ-5F
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXx5h3VcKt3jyYHreeQ9XypRywwHhdUIoUdDoXKimZQ=;
 b=VWV63ZSp7Pr7EFFipXpuj0OYEk9KinntWhuKB/DuW1DiRdV6T1Jop6mFxJEhHrF3ki09s8
 Lrzeaa0RqIngMVoohuXvhYkZnQAQkHs5A1j7/Y8irOMV6+BJhY9XjqvhgDO6AbW8NJtAjn
 zickyxf2aMs5qLnt1+5gE0SZnmqonAE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-cwuluIR7MXa8rWrzDaqbZw-1; Wed, 03 Mar 2021 13:23:46 -0500
X-MC-Unique: cwuluIR7MXa8rWrzDaqbZw-1
Received: by mail-wr1-f70.google.com with SMTP id h30so13182861wrh.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXx5h3VcKt3jyYHreeQ9XypRywwHhdUIoUdDoXKimZQ=;
 b=SOwiZtPUPnskySzX+xWnor1N1xR/4xBBqliDfO//FIr0/U5Z/qg4n0X18SUquduOrN
 PXcx/na+F/So2ArjqQ86lHmJrmunKcbjM8t2ZIWf6zSjrojhc7fa6BvpRjuwDkq4qEMr
 ClwehxiDW3IxdteSlHZDzoOOGGEwKX3hdz+iiQThW0jnHExOBvwoedu6QhETHCtyZc+j
 jak4FkSg/z5XYfva9by3hcLaqHTByXjzw0fhR8DVDZAVyrsiIG+NOmzMznJQz1cdlY5l
 bfFVI7cu24HKfvB8JL9OxI3zqMnpSgEFUclzp5XDr/hPv42hWc0c8lDECJaeqddmq5it
 4FZw==
X-Gm-Message-State: AOAM531CvO17NkNB7nouHHLE7A3+vqczunJG5vhe8P87v6CabnbroNMg
 VdpFKfyI8zXS1hVJhEU6HoY1WxOedlkh/QaPo7+FLomdVFlKzqXtPDpTFiwnVnIuSiLeMjSTnKr
 IBM0Q7237lp98/mGRZe1T5lpeIXWdAH/7zSJmQZssPOspYVyiNGyNOkU1ivnio4jM
X-Received: by 2002:a5d:4e8d:: with SMTP id e13mr11323862wru.251.1614795824534; 
 Wed, 03 Mar 2021 10:23:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5L+10FIf3QeWzSQV6AYajM/q7zSMfTeBTooczz/vv8P1higtN4db/j7T3frNNlnlTxAINCg==
X-Received: by 2002:a5d:4e8d:: with SMTP id e13mr11323824wru.251.1614795824304; 
 Wed, 03 Mar 2021 10:23:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm6902297wme.22.2021.03.03.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/19] accel/kvm: Use kvm_vcpu_state() when possible
Date: Wed,  3 Mar 2021 19:22:12 +0100
Message-Id: <20210303182219.1631042-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to move the kvm_state field out of CPUState in few
commits, replace the CPUState->kvm_state dereference by a call to
kvm_vcpu_state().

Patch created mechanically using:

  $ sed -i 's/cpu->kvm_state/kvm_vcpu_state(cpu)/' \
        -i 's/cs->kvm_state/kvm_vcpu_state(cs)/' \
        -i 's/c->kvm_state/kvm_vcpu_state(c)/' $(git grep -l kvm_state)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/kvm/kvm-all.c   | 10 +++++-----
 target/arm/kvm.c      |  2 +-
 target/arm/kvm64.c    | 12 ++++++------
 target/i386/kvm/kvm.c | 34 +++++++++++++++++-----------------
 target/ppc/kvm.c      | 16 ++++++++--------
 5 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b787d590a9a..8259e89bbaf 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2760,7 +2760,7 @@ struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
 {
     struct kvm_sw_breakpoint *bp;
 
-    QTAILQ_FOREACH(bp, &cpu->kvm_state->kvm_sw_breakpoints, entry) {
+    QTAILQ_FOREACH(bp, &kvm_vcpu_state(cpu)->kvm_sw_breakpoints, entry) {
         if (bp->pc == pc) {
             return bp;
         }
@@ -2770,7 +2770,7 @@ struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
 
 int kvm_sw_breakpoints_active(CPUState *cpu)
 {
-    return !QTAILQ_EMPTY(&cpu->kvm_state->kvm_sw_breakpoints);
+    return !QTAILQ_EMPTY(&kvm_vcpu_state(cpu)->kvm_sw_breakpoints);
 }
 
 struct kvm_set_guest_debug_data {
@@ -2825,7 +2825,7 @@ int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
             return err;
         }
 
-        QTAILQ_INSERT_HEAD(&cpu->kvm_state->kvm_sw_breakpoints, bp, entry);
+        QTAILQ_INSERT_HEAD(&kvm_vcpu_state(cpu)->kvm_sw_breakpoints, bp, entry);
     } else {
         err = kvm_arch_insert_hw_breakpoint(addr, len, type);
         if (err) {
@@ -2864,7 +2864,7 @@ int kvm_remove_breakpoint(CPUState *cpu, target_ulong addr,
             return err;
         }
 
-        QTAILQ_REMOVE(&cpu->kvm_state->kvm_sw_breakpoints, bp, entry);
+        QTAILQ_REMOVE(&kvm_vcpu_state(cpu)->kvm_sw_breakpoints, bp, entry);
         g_free(bp);
     } else {
         err = kvm_arch_remove_hw_breakpoint(addr, len, type);
@@ -2885,7 +2885,7 @@ int kvm_remove_breakpoint(CPUState *cpu, target_ulong addr,
 void kvm_remove_all_breakpoints(CPUState *cpu)
 {
     struct kvm_sw_breakpoint *bp, *next;
-    KVMState *s = cpu->kvm_state;
+    KVMState *s = kvm_vcpu_state(cpu);
     CPUState *tmpcpu;
 
     QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 00e124c8123..ed7c4e4815c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -61,7 +61,7 @@ int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
 
 void kvm_arm_init_serror_injection(CPUState *cs)
 {
-    cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
+    cap_has_inject_serror_esr = kvm_check_extension(kvm_vcpu_state(cs),
                                     KVM_CAP_ARM_INJECT_SERROR_ESR);
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db94..c15df0cb1b7 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -85,14 +85,14 @@ GArray *hw_breakpoints, *hw_watchpoints;
  */
 static void kvm_arm_init_debug(CPUState *cs)
 {
-    have_guest_debug = kvm_check_extension(cs->kvm_state,
+    have_guest_debug = kvm_check_extension(kvm_vcpu_state(cs),
                                            KVM_CAP_SET_GUEST_DEBUG);
 
-    max_hw_wps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(cs->kvm_state, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
     return;
@@ -837,14 +837,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+    if (kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_ARM_PSCI_0_2)) {
         cpu->psci_version = 2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
+    if (!kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_ARM_PMU_V3)) {
         cpu->has_pmu = false;
     }
     if (cpu->has_pmu) {
@@ -1411,7 +1411,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
             object_property_get_bool(obj, "ras", NULL)) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
-            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
+            kvm_physical_memory_addr_from_host(kvm_vcpu_state(c), addr, &paddr)) {
             kvm_hwpoison_page_add(ram_addr);
             /*
              * If this is a BUS_MCEERR_AR, we know we have been called
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0b5755e42b8..b2facf4f7c1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -583,7 +583,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
     if ((env->mcg_cap & MCG_SER_P) && addr) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
-            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
+            kvm_physical_memory_addr_from_host(kvm_vcpu_state(c), addr, &paddr)) {
             kvm_hwpoison_page_add(ram_addr);
             kvm_mce_inject(cpu, paddr, code);
 
@@ -715,7 +715,7 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
 static bool hyperv_enabled(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    return kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0 &&
+    return kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_HYPERV) > 0 &&
         ((cpu->hyperv_spinlock_attempts != HYPERV_SPINLOCK_NEVER_NOTIFY) ||
          cpu->hyperv_features || cpu->hyperv_passthrough);
 }
@@ -747,13 +747,13 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
         return 0;
     }
 
-    cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+    cur_freq = kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_GET_TSC_KHZ) ?
                kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) : -ENOTSUP;
 
     /*
      * If TSC scaling is supported, attempt to set TSC frequency.
      */
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_TSC_CONTROL)) {
+    if (kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_TSC_CONTROL)) {
         set_ioctl = true;
     }
 
@@ -773,9 +773,9 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
         /* When KVM_SET_TSC_KHZ fails, it's an error only if the current
          * TSC frequency doesn't match the one we want.
          */
-        cur_freq = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
-                   kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
-                   -ENOTSUP;
+        cur_freq = kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_GET_TSC_KHZ)
+                   ? kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ)
+                   : -ENOTSUP;
         if (cur_freq <= 0 || cur_freq != env->tsc_khz) {
             warn_report("TSC frequency mismatch between "
                         "VM (%" PRId64 " kHz) and host (%d kHz), "
@@ -994,7 +994,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
     entry_recomm->function = HV_CPUID_ENLIGHTMENT_INFO;
     entry_recomm->ebx = cpu->hyperv_spinlock_attempts;
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV) > 0) {
+    if (kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_HYPERV) > 0) {
         entry_feat->eax |= HV_HYPERCALL_AVAILABLE;
         entry_feat->eax |= HV_APIC_ACCESS_AVAILABLE;
         entry_feat->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
@@ -1002,7 +1002,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
         entry_recomm->eax |= HV_APIC_ACCESS_RECOMMENDED;
     }
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_TIME) > 0) {
+    if (kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_HYPERV_TIME) > 0) {
         entry_feat->eax |= HV_TIME_REF_COUNT_AVAILABLE;
         entry_feat->eax |= HV_REFERENCE_TSC_AVAILABLE;
     }
@@ -1036,7 +1036,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
         unsigned int cap = cpu->hyperv_synic_kvm_only ?
             KVM_CAP_HYPERV_SYNIC : KVM_CAP_HYPERV_SYNIC2;
 
-        if (kvm_check_extension(cs->kvm_state, cap) > 0) {
+        if (kvm_check_extension(kvm_vcpu_state(cs), cap) > 0) {
             entry_feat->eax |= HV_SYNIC_AVAILABLE;
         }
     }
@@ -1045,18 +1045,18 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid_legacy(CPUState *cs)
         entry_feat->eax |= HV_SYNTIMERS_AVAILABLE;
     }
 
-    if (kvm_check_extension(cs->kvm_state,
+    if (kvm_check_extension(kvm_vcpu_state(cs),
                             KVM_CAP_HYPERV_TLBFLUSH) > 0) {
         entry_recomm->eax |= HV_REMOTE_TLB_FLUSH_RECOMMENDED;
         entry_recomm->eax |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
     }
 
-    if (kvm_check_extension(cs->kvm_state,
+    if (kvm_check_extension(kvm_vcpu_state(cs),
                             KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
         entry_recomm->eax |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
     }
 
-    if (kvm_check_extension(cs->kvm_state,
+    if (kvm_check_extension(kvm_vcpu_state(cs),
                             KVM_CAP_HYPERV_SEND_IPI) > 0) {
         entry_recomm->eax |= HV_CLUSTER_IPI_RECOMMENDED;
         entry_recomm->eax |= HV_EX_PROCESSOR_MASKS_RECOMMENDED;
@@ -1200,7 +1200,7 @@ static int hyperv_handle_properties(CPUState *cs,
         }
     }
 
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_HYPERV_CPUID) > 0) {
+    if (kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_HYPERV_CPUID) > 0) {
         cpuid = get_supported_hv_cpuid(cs);
     } else {
         cpuid = get_supported_hv_cpuid_legacy(cs);
@@ -1504,7 +1504,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
      * so that vcpu's TSC frequency can be migrated later via this field.
      */
     if (!env->tsc_khz) {
-        r = kvm_check_extension(cs->kvm_state, KVM_CAP_GET_TSC_KHZ) ?
+        r = kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_GET_TSC_KHZ) ?
             kvm_vcpu_ioctl(cs, KVM_GET_TSC_KHZ) :
             -ENOTSUP;
         if (r > 0) {
@@ -1746,12 +1746,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (((env->cpuid_version >> 8)&0xF) >= 6
         && (env->features[FEAT_1_EDX] & (CPUID_MCE | CPUID_MCA)) ==
            (CPUID_MCE | CPUID_MCA)
-        && kvm_check_extension(cs->kvm_state, KVM_CAP_MCE) > 0) {
+        && kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_MCE) > 0) {
         uint64_t mcg_cap, unsupported_caps;
         int banks;
         int ret;
 
-        ret = kvm_get_mce_cap_supported(cs->kvm_state, &mcg_cap, &banks);
+        ret = kvm_get_mce_cap_supported(kvm_vcpu_state(cs), &mcg_cap, &banks);
         if (ret < 0) {
             fprintf(stderr, "kvm_get_mce_cap_supported: %s", strerror(-ret));
             return ret;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 298c1f882c6..d9a8f019a74 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -205,7 +205,7 @@ static int kvm_booke206_tlb_init(PowerPCCPU *cpu)
     int ret, i;
 
     if (!kvm_enabled() ||
-        !kvm_check_extension(cs->kvm_state, KVM_CAP_SW_TLB)) {
+        !kvm_check_extension(kvm_vcpu_state(cs), KVM_CAP_SW_TLB)) {
         return 0;
     }
 
@@ -303,7 +303,7 @@ target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
         flags |= KVM_PPC_MMUV3_GTSE;
     }
     cfg.flags = flags;
-    ret = kvm_vm_ioctl(cs->kvm_state, KVM_PPC_CONFIGURE_V3_MMU, &cfg);
+    ret = kvm_vm_ioctl(kvm_vcpu_state(cs), KVM_PPC_CONFIGURE_V3_MMU, &cfg);
     switch (ret) {
     case 0:
         return H_SUCCESS;
@@ -483,7 +483,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         ret = kvm_booke206_tlb_init(cpu);
         break;
     case POWERPC_MMU_2_07:
-        if (!cap_htm && !kvmppc_is_pr(cs->kvm_state)) {
+        if (!cap_htm && !kvmppc_is_pr(kvm_vcpu_state(cs))) {
             /*
              * KVM-HV has transactional memory on POWER8 also without
              * the KVM_CAP_PPC_HTM extension, so enable it here
@@ -1947,8 +1947,8 @@ static int kvmppc_get_pvinfo(CPUPPCState *env, struct kvm_ppc_pvinfo *pvinfo)
 {
     CPUState *cs = env_cpu(env);
 
-    if (kvm_vm_check_extension(cs->kvm_state, KVM_CAP_PPC_GET_PVINFO) &&
-        !kvm_vm_ioctl(cs->kvm_state, KVM_PPC_GET_PVINFO, pvinfo)) {
+    if (kvm_vm_check_extension(kvm_vcpu_state(cs), KVM_CAP_PPC_GET_PVINFO) &&
+        !kvm_vm_ioctl(kvm_vcpu_state(cs), KVM_PPC_GET_PVINFO, pvinfo)) {
         return 0;
     }
 
@@ -2864,7 +2864,7 @@ int kvmppc_resize_hpt_prepare(PowerPCCPU *cpu, target_ulong flags, int shift)
         return -ENOSYS;
     }
 
-    return kvm_vm_ioctl(cs->kvm_state, KVM_PPC_RESIZE_HPT_PREPARE, &rhpt);
+    return kvm_vm_ioctl(kvm_vcpu_state(cs), KVM_PPC_RESIZE_HPT_PREPARE, &rhpt);
 }
 
 int kvmppc_resize_hpt_commit(PowerPCCPU *cpu, target_ulong flags, int shift)
@@ -2879,7 +2879,7 @@ int kvmppc_resize_hpt_commit(PowerPCCPU *cpu, target_ulong flags, int shift)
         return -ENOSYS;
     }
 
-    return kvm_vm_ioctl(cs->kvm_state, KVM_PPC_RESIZE_HPT_COMMIT, &rhpt);
+    return kvm_vm_ioctl(kvm_vcpu_state(cs), KVM_PPC_RESIZE_HPT_COMMIT, &rhpt);
 }
 
 /*
@@ -2909,7 +2909,7 @@ bool kvmppc_pvr_workaround_required(PowerPCCPU *cpu)
         return false;
     }
 
-    return !kvmppc_is_pr(cs->kvm_state);
+    return !kvmppc_is_pr(kvm_vcpu_state(cs));
 }
 
 void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigned int online)
-- 
2.26.2


