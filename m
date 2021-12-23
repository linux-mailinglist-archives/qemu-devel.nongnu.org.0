Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3AB47E2A9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:54:06 +0100 (CET)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mfd-00078C-CJ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:54:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdQ-0004LR-9y
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:48 -0500
Received: from [2a00:1450:4864:20::430] (port=44927
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0008QV-E9
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: by mail-wr1-x430.google.com with SMTP id t18so10895983wrg.11
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRrDZ9kqjrjMD+Elsmgxx2oG4MDa0ekRmY7IWCopn00=;
 b=nPws+ygo6Br1LV5Vzib1DQiJn/vf99M8ECuGzBwSuluHdPd1HG2xw5eea3JnCiuJPN
 gamfO3miEApsUmjWAHrJHhwKwzt8eJwlRf9KK81SzKxg6jIIwB3e3XcNIBPnAIkZa31a
 PvIiVpBhFL3ovrAzSpA6xVXf9errqhDENwF3qAMtdfXbsQ/WXqjQKAU0lt/IucBwrb0j
 dqG/GUjFsLJ3UZdQKyVC40RBgmiux+S0U3Mms7FxXKBt6ecpU7Z2m1iDKEFrnbKB0RfT
 vrX+wqVVnMuuR1YyBGbnCCXj1RcMkRG3+6VrQxa+IaHysnUvbDeFm/APUnNfLbqsfJbG
 C6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uRrDZ9kqjrjMD+Elsmgxx2oG4MDa0ekRmY7IWCopn00=;
 b=RORivFNnhhslh4n4zWXY4wJFj3LAcw5leoELtO/g7U4LVELDyawOLRMKNd5pyQnQH8
 9Ps0AfHK9a5fTnhNbYfYI1Zzek0U4uDOlUbPd89yJlldXAHgKHDkxn6epXwfa5jqMlzp
 0BzIQ4a5Y/uc1Am9cGUBJdVYnt9buiPycrjbU6q9gOwt+pFnWscDgNizC9Yi2aOLNMS0
 NXPI2QuBx0GTxnlwi2i2M+wxGdSdq4IdlPa1vt4M0MRoSBududV2sYWAVKkE/c6NyAn1
 avloQoo4UK6ASeZJlRn3N8vVPtQGkQYTyGVd/BmogeaQBjTc+hdsBMQiauahrcq2ehss
 eN9g==
X-Gm-Message-State: AOAM531cYNH13TesJUuFOLb3s2pTeKUiiYF9/RvCD8GEDq4ZucF0UsSB
 +B2J0h0KZOzO1cVtsT40Rj1vP/tgKlk=
X-Google-Smtp-Source: ABdhPJx0W7aZW+3z5WwTIIYglwx3u78VJa5WsjcQt1jD1BDbFc4zBvT9IEtDlcZJOD+6bHlJUOCSCA==
X-Received: by 2002:a05:6000:a:: with SMTP id
 h10mr1579484wrx.253.1640260304073; 
 Thu, 23 Dec 2021 03:51:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/15] KVM: use KVM_{GET|SET}_SREGS2 when supported.
Date: Thu, 23 Dec 2021 12:51:33 +0100
Message-Id: <20211223115134.579235-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This allows to make PDPTRs part of the migration
stream and thus not reload them after migration which
is against X86 spec.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20211101132300.192584-2-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h     |   3 ++
 target/i386/kvm/kvm.c | 108 +++++++++++++++++++++++++++++++++++++++++-
 target/i386/machine.c |  29 ++++++++++++
 3 files changed, 138 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 04f2b790c9..9911d7c871 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1455,6 +1455,9 @@ typedef struct CPUX86State {
     SegmentCache idt; /* only base and limit are used */
 
     target_ulong cr[5]; /* NOTE: cr1 is unused */
+
+    bool pdptrs_valid;
+    uint64_t pdptrs[4];
     int32_t a20_mask;
 
     BNDReg bnd_regs[4];
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 13f8e30c2a..d81745620b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -124,6 +124,7 @@ static uint32_t num_architectural_pmu_fixed_counters;
 static int has_xsave;
 static int has_xcrs;
 static int has_pit_state2;
+static int has_sregs2;
 static int has_exception_payload;
 
 static bool has_msr_mcg_ext_ctl;
@@ -2324,6 +2325,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     has_xsave = kvm_check_extension(s, KVM_CAP_XSAVE);
     has_xcrs = kvm_check_extension(s, KVM_CAP_XCRS);
     has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
+    has_sregs2 = kvm_check_extension(s, KVM_CAP_SREGS2) > 0;
 
     hv_vpindex_settable = kvm_check_extension(s, KVM_CAP_HYPERV_VP_INDEX);
 
@@ -2650,6 +2652,61 @@ static int kvm_put_sregs(X86CPU *cpu)
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
@@ -3330,6 +3387,53 @@ static int kvm_get_sregs(X86CPU *cpu)
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
@@ -4173,7 +4277,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
     assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
 
     /* must be before kvm_put_nested_state so that EFER.SVME is set */
-    ret = kvm_put_sregs(x86_cpu);
+    ret = has_sregs2 ? kvm_put_sregs2(x86_cpu) : kvm_put_sregs(x86_cpu);
     if (ret < 0) {
         return ret;
     }
@@ -4278,7 +4382,7 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret < 0) {
         goto out;
     }
-    ret = kvm_get_sregs(cpu);
+    ret = has_sregs2 ? kvm_get_sregs2(cpu) : kvm_get_sregs(cpu);
     if (ret < 0) {
         goto out;
     }
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 83c2b91529..6202f47793 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1451,6 +1451,34 @@ static const VMStateDescription vmstate_msr_intel_sgx = {
     .needed = intel_sgx_msrs_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64_ARRAY(env.msr_ia32_sgxlepubkeyhash, X86CPU, 4),
+                VMSTATE_END_OF_LIST()
+            }
+        };
+
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
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1593,6 +1621,7 @@ const VMStateDescription vmstate_x86_cpu = {
 #endif
         &vmstate_msr_tsx_ctrl,
         &vmstate_msr_intel_sgx,
+        &vmstate_pdptrs,
         NULL
     }
 };
-- 
2.33.1



