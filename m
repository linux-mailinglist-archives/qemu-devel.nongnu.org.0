Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617E489C02
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:18:43 +0100 (CET)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wRV-00072N-6h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr8-0002T6-Gl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:08 -0500
Received: from [2a00:1450:4864:20::52a] (port=33570
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vr3-0000We-5Y
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:41:06 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b13so1096711edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uRrDZ9kqjrjMD+Elsmgxx2oG4MDa0ekRmY7IWCopn00=;
 b=FcyGYRHQSW3wZJqUgkH8WBVOpVxyZ5yNz4bWp5yShzgjn+g6pJT+XpK+d8jtdUPk6C
 MTxJMIwTOxNCXN7BuNP3gONaytR2dgJQUOaEhF/4YsDCmutwfHmbaZ7yMpMF2JoRoDuF
 a2lCvyhkeNOZWgwEh2U853KP9bsbRF+fTR7TdMRQJgs2avr3R4ggKN65gyDWB2wst0UH
 WspfscAWM61fcDXWoLFHodCkduyu+qN6fgtYwjUWej98s3RqbzAfgniUdiCQ+CDPFNJE
 1oapkqD/2rN+HU5W0QJl/mAfykdql94qvWzUeZdtakeQas9emdLa0uEGOoEcyY1mAnRQ
 /suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uRrDZ9kqjrjMD+Elsmgxx2oG4MDa0ekRmY7IWCopn00=;
 b=g/v/vyR2KjiivsLtRPumz1gDXc0BC4duU7vB7rGVlcsSdxZivL8EHAEvqTB3VJLJAV
 Y9w5Xr6HX1YNjqIC4HODU6JQ0+qtDqHmzIbkClPQ7dOIJ/ClK3baZHT0xoM6TtMHKiAA
 OD5STr2S4KjJh6rtM6f7PHtjUCIH7UIPHkSlufLuj2KZ9BSMEGewfY874YiBFRA9tZwZ
 oPn6cW925yCLCM+eHsSDxcmMlg8tJr5m/kJpiJd0Dyn3EOJCcSBaCa9FSClUBldNKmDH
 TGS4DpZqSmdLEJxsMlgzpiGa0YTrj1yRavG7WqK8/bKFZXHX4bHFodzZ8Nr+u1a8kAM7
 KTUw==
X-Gm-Message-State: AOAM533p5tViDSprpfdeeTUPeXL+u258LTfLxCVDfggY1x4+SHUa7Z6x
 6GhycPYNvgGydNbYYHN1eTcnKLaZQ1g=
X-Google-Smtp-Source: ABdhPJzAr/LdMsnZY8e7WZNjIkuO7HDqLkvXCHg4nH+3TFCa6a2NGGAQHFHpfjkf2M/LBwPPpPaOOg==
X-Received: by 2002:a17:907:94c7:: with SMTP id
 dn7mr59874ejc.470.1641825659858; 
 Mon, 10 Jan 2022 06:40:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] KVM: use KVM_{GET|SET}_SREGS2 when supported.
Date: Mon, 10 Jan 2022 15:40:29 +0100
Message-Id: <20220110144034.67410-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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



