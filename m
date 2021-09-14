Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF3740B44B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:14:51 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQB58-0003IK-Tl
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAjS-00019N-VU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1mQAjQ-0002rF-OR
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 11:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMnmF36NpJLencIN47ewkXJeydFagF9FlbQ/WeXOPb4=;
 b=QAcjf9AbirT4CmtTEFgzrgMTUzv+SO3hSCnop+lHUJ32a+bfIKmP0rv/WdlT25YQZ4dmCz
 wvAxahDbgY7johDgCl1RJNq9TtZ5irj4n77+h2dh8NfueWT0mepssmpFzEcTtAL0j2nXXx
 GikLTOU5IBWOLJlW24BdFhevG+rD2IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-8L-mLjYTNSC_eRnVO5Q7LA-1; Tue, 14 Sep 2021 11:52:21 -0400
X-MC-Unique: 8L-mLjYTNSC_eRnVO5Q7LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB861006AA1;
 Tue, 14 Sep 2021 15:52:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CAB5D9D3;
 Tue, 14 Sep 2021 15:52:18 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] KVM: use KVM_{GET|SET}_SREGS2 when supported.
Date: Tue, 14 Sep 2021 18:52:12 +0300
Message-Id: <20210914155214.105415-2-mlevitsk@redhat.com>
In-Reply-To: <20210914155214.105415-1-mlevitsk@redhat.com>
References: <20210914155214.105415-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to make PDPTRs part of the migration
stream and thus not reload them after migration which
is against X86 spec.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 accel/kvm/kvm-all.c   |   5 ++
 include/sysemu/kvm.h  |   4 ++
 target/i386/cpu.h     |   3 ++
 target/i386/kvm/kvm.c | 107 +++++++++++++++++++++++++++++++++++++++++-
 target/i386/machine.c |  30 ++++++++++++
 5 files changed, 147 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..6b187e9c96 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -163,6 +163,7 @@ bool kvm_msi_via_irqfd_allowed;
 bool kvm_gsi_routing_allowed;
 bool kvm_gsi_direct_mapping;
 bool kvm_allowed;
+bool kvm_sregs2;
 bool kvm_readonly_mem_allowed;
 bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
@@ -2554,6 +2555,10 @@ static int kvm_init(MachineState *ms)
     kvm_ioeventfd_any_length_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
 
+
+    kvm_sregs2 =
+        (kvm_check_extension(s, KVM_CAP_SREGS2) > 0);
+
     kvm_state = s;
 
     ret = kvm_arch_init(ms, s);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..b3d4538c55 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -32,6 +32,7 @@
 #ifdef CONFIG_KVM_IS_POSSIBLE
 
 extern bool kvm_allowed;
+extern bool kvm_sregs2;
 extern bool kvm_kernel_irqchip;
 extern bool kvm_split_irqchip;
 extern bool kvm_async_interrupts_allowed;
@@ -139,6 +140,9 @@ extern bool kvm_msi_use_devid;
  */
 #define kvm_gsi_direct_mapping() (kvm_gsi_direct_mapping)
 
+
+#define kvm_supports_sregs2() (kvm_sregs2)
+
 /**
  * kvm_readonly_mem_enabled:
  *
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 71ae3141c3..9adae12426 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1436,6 +1436,9 @@ typedef struct CPUX86State {
     SegmentCache idt; /* only base and limit are used */
 
     target_ulong cr[5]; /* NOTE: cr1 is unused */
+
+    bool pdptrs_valid;
+    uint64_t pdptrs[4];
     int32_t a20_mask;
 
     BNDReg bnd_regs[4];
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 500d2e0e68..841b3b98f7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2587,6 +2587,61 @@ static int kvm_put_sregs(X86CPU *cpu)
     return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_SREGS, &sregs);
 }
 
+static int kvm_put_sregs2(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct kvm_sregs2 sregs;
+    int i;
+
+    sregs.flags = 0;
+
+    if ((env->eflags & VM_MASK)) {
+        set_v8086_seg(&sregs.cs, &env->segs[R_CS]);
+        set_v8086_seg(&sregs.ds, &env->segs[R_DS]);
+        set_v8086_seg(&sregs.es, &env->segs[R_ES]);
+        set_v8086_seg(&sregs.fs, &env->segs[R_FS]);
+        set_v8086_seg(&sregs.gs, &env->segs[R_GS]);
+        set_v8086_seg(&sregs.ss, &env->segs[R_SS]);
+    } else {
+        set_seg(&sregs.cs, &env->segs[R_CS]);
+        set_seg(&sregs.ds, &env->segs[R_DS]);
+        set_seg(&sregs.es, &env->segs[R_ES]);
+        set_seg(&sregs.fs, &env->segs[R_FS]);
+        set_seg(&sregs.gs, &env->segs[R_GS]);
+        set_seg(&sregs.ss, &env->segs[R_SS]);
+    }
+
+    set_seg(&sregs.tr, &env->tr);
+    set_seg(&sregs.ldt, &env->ldt);
+
+    sregs.idt.limit = env->idt.limit;
+    sregs.idt.base = env->idt.base;
+    memset(sregs.idt.padding, 0, sizeof sregs.idt.padding);
+    sregs.gdt.limit = env->gdt.limit;
+    sregs.gdt.base = env->gdt.base;
+    memset(sregs.gdt.padding, 0, sizeof sregs.gdt.padding);
+
+    sregs.cr0 = env->cr[0];
+    sregs.cr2 = env->cr[2];
+    sregs.cr3 = env->cr[3];
+    sregs.cr4 = env->cr[4];
+
+    sregs.cr8 = cpu_get_apic_tpr(cpu->apic_state);
+    sregs.apic_base = cpu_get_apic_base(cpu->apic_state);
+
+    sregs.efer = env->efer;
+
+    if (env->pdptrs_valid) {
+        for (i = 0; i < 4; i++) {
+            sregs.pdptrs[i] = env->pdptrs[i];
+        }
+        sregs.flags |= KVM_SREGS2_FLAGS_PDPTRS_VALID;
+    }
+
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_SREGS2, &sregs);
+}
+
+
 static void kvm_msr_buf_reset(X86CPU *cpu)
 {
     memset(cpu->kvm_msr_buf, 0, MSR_BUF_SIZE);
@@ -3252,6 +3307,53 @@ static int kvm_get_sregs(X86CPU *cpu)
     return 0;
 }
 
+static int kvm_get_sregs2(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct kvm_sregs2 sregs;
+    int i, ret;
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_SREGS2, &sregs);
+    if (ret < 0) {
+        return ret;
+    }
+
+    get_seg(&env->segs[R_CS], &sregs.cs);
+    get_seg(&env->segs[R_DS], &sregs.ds);
+    get_seg(&env->segs[R_ES], &sregs.es);
+    get_seg(&env->segs[R_FS], &sregs.fs);
+    get_seg(&env->segs[R_GS], &sregs.gs);
+    get_seg(&env->segs[R_SS], &sregs.ss);
+
+    get_seg(&env->tr, &sregs.tr);
+    get_seg(&env->ldt, &sregs.ldt);
+
+    env->idt.limit = sregs.idt.limit;
+    env->idt.base = sregs.idt.base;
+    env->gdt.limit = sregs.gdt.limit;
+    env->gdt.base = sregs.gdt.base;
+
+    env->cr[0] = sregs.cr0;
+    env->cr[2] = sregs.cr2;
+    env->cr[3] = sregs.cr3;
+    env->cr[4] = sregs.cr4;
+
+    env->efer = sregs.efer;
+
+    env->pdptrs_valid = sregs.flags & KVM_SREGS2_FLAGS_PDPTRS_VALID;
+
+    if (env->pdptrs_valid) {
+        for (i = 0; i < 4; i++) {
+            env->pdptrs[i] = sregs.pdptrs[i];
+        }
+    }
+
+    /* changes to apic base and cr8/tpr are read back via kvm_arch_post_run */
+    x86_update_hflags(env);
+
+    return 0;
+}
+
 static int kvm_get_msrs(X86CPU *cpu)
 {
     CPUX86State *env = &cpu->env;
@@ -4077,7 +4179,8 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
-    ret = kvm_put_sregs(x86_cpu);
+    ret = kvm_supports_sregs2() ? kvm_put_sregs2(x86_cpu) :
+                                  kvm_put_sregs(x86_cpu);
     if (ret < 0) {
         return ret;
     }
@@ -4182,7 +4285,7 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret < 0) {
         goto out;
     }
-    ret = kvm_get_sregs(cpu);
+    ret = kvm_supports_sregs2() ? kvm_get_sregs2(cpu) : kvm_get_sregs(cpu);
     if (ret < 0) {
         goto out;
     }
diff --git a/target/i386/machine.c b/target/i386/machine.c
index b0943118d1..154666e7c0 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1415,6 +1415,35 @@ static const VMStateDescription vmstate_msr_tsx_ctrl = {
     }
 };
 
+static bool pdptrs_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+    return env->pdptrs_valid;
+}
+
+static int pdptrs_post_load(void *opaque, int version_id)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+    env->pdptrs_valid = true;
+    return 0;
+}
+
+
+static const VMStateDescription vmstate_pdptrs = {
+    .name = "cpu/pdptrs",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pdptrs_needed,
+    .post_load = pdptrs_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.pdptrs, X86CPU, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+
 const VMStateDescription vmstate_x86_cpu = {
     .name = "cpu",
     .version_id = 12,
@@ -1551,6 +1580,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_nested_state,
 #endif
         &vmstate_msr_tsx_ctrl,
+        &vmstate_pdptrs,
         NULL
     }
 };
-- 
2.26.3


