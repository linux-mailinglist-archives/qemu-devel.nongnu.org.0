Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A093C401C22
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:13:20 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNER5-0003Un-NE
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP0-0000VI-MZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEOy-0007Iq-RO
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id i6so9812764wrv.2
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQLhAUnm0nH7RIH9Cq6XhCgZ9K8x5CXMCZYhF+S82Lg=;
 b=gs49tWzVJGtPlly7cacAdV68a3iYFIHsvYPvHQd2EGpsX+BrSNR6zMDm0OANZ2kENF
 Ahj2Lf1gXNekAp5dADIalvPEmxY4n2u4tlGW12hm/QCPqV29XiRnVgbeyovUMhLa+voo
 xZrbAnllKYqWaZcLnQMLlHbOfCBt19buRkFNixZk0gZiJdBvU/4WwA0Yi/jut9nGcGFg
 h9O/UssSPkQvfbG2GMSNMIwRl4/XK/5GWu5fFqsmP20R6F26ALUzQ7DiIw5NTk5YMMP2
 28oJf6pxoF6A9greI6MNxJMAH8Z70FDsA5WFKbpcZRHYHsl7WTTvWFWzXDl00k+yHUrv
 TLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UQLhAUnm0nH7RIH9Cq6XhCgZ9K8x5CXMCZYhF+S82Lg=;
 b=TqiReTdO5zX9P03+H8LXuJj4NLviglDnEoBDltuv1FqxTnFUDrIuGE1hAd+NRDFMON
 LLg3en26E/EXzuVqJ6LKZvaBOCMN8PkFToFgRo1exTcrdr2UzhpPdLD5FSgv5R+WAP3Y
 7sIXodjuBDVV/emj3eM1R/dFJQs/WL7HsCzbLRUKwSVipmMJ9pg2HU20ySnTAvAQYwNX
 mLlFyuMWdKRw3eKgw/m1OcgNMme+A2epvwuuSqu8j9k8goTD/EsTWJgu+UISImRN2Wy5
 +WVQIvZPFTIEAGnAP/jo3HopsFSu0GYdVguF37+/6zEVpfsK8jTrkWLhR2ufwYW4FX2z
 WwFw==
X-Gm-Message-State: AOAM532OigP7+fiR4XvcEDDvO94s53IgIslD4HzyzfH4126YEgwKB6q/
 lG8l2F41bz3MzQKbWLRblRm9kc2N41Y=
X-Google-Smtp-Source: ABdhPJxSWu3fkMgj9BPxa6dlp6dqqRAwdOcDiAFdSUsc5F09r3oDAq1Wjve2NUQ23TOvb0TKBQ1ChQ==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr12825371wrp.223.1630933867531; 
 Mon, 06 Sep 2021 06:11:07 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] target/i386: Moved int_ctl into CPUX86State structure
Date: Mon,  6 Sep 2021 15:10:26 +0200
Message-Id: <20210906131059.55234-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

Moved int_ctl into the CPUX86State structure.  It removes some
unnecessary stores and loads, and prepares for tracking the vIRQ
state even when it is masked due to vGIF.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 slirp                                |  2 +-
 target/i386/cpu.c                    |  2 +-
 target/i386/cpu.h                    |  1 +
 target/i386/machine.c                | 22 ++++++++++++-
 target/i386/tcg/seg_helper.c         |  2 +-
 target/i386/tcg/sysemu/misc_helper.c |  4 +--
 target/i386/tcg/sysemu/svm_helper.c  | 48 +++++++++-------------------
 7 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/slirp b/slirp
index a88d9ace23..8f43a99191 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
+Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 86064ea1f9..ddc3b63cb8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5655,7 +5655,7 @@ static void x86_cpu_reset(DeviceState *dev)
     env->old_exception = -1;
 
     /* init to reset state */
-
+    env->int_ctl = 0;
     env->hflags2 |= HF2_GIF_MASK;
     env->hflags &= ~HF_GUEST_MASK;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c9c7350c76..e27a1aab99 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1577,6 +1577,7 @@ typedef struct CPUX86State {
     uint64_t nested_cr3;
     uint32_t nested_pg_mode;
     uint8_t v_tpr;
+    uint32_t int_ctl;
 
     /* KVM states, automatically cleared on reset */
     uint8_t nmi_injected;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index f6f094f1c9..f9ab161646 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -203,7 +203,7 @@ static int cpu_pre_save(void *opaque)
     X86CPU *cpu = opaque;
     CPUX86State *env = &cpu->env;
     int i;
-
+    env->v_tpr = env->int_ctl & V_TPR_MASK;
     /* FPU */
     env->fpus_vmstate = (env->fpus & ~0x3800) | (env->fpstt & 0x7) << 11;
     env->fptag_vmstate = 0;
@@ -1356,6 +1356,25 @@ static const VMStateDescription vmstate_svm_npt = {
     }
 };
 
+static bool svm_guest_needed(void *opaque)
+{
+    X86CPU *cpu = opaque;
+    CPUX86State *env = &cpu->env;
+
+    return tcg_enabled() && !env->int_ctl;
+}
+
+static const VMStateDescription vmstate_svm_guest = {
+    .name = "cpu/svm_guest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = svm_guest_needed,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT32(env.int_ctl, X86CPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 #ifndef TARGET_X86_64
 static bool intel_efer32_needed(void *opaque)
 {
@@ -1524,6 +1543,7 @@ const VMStateDescription vmstate_x86_cpu = {
         &vmstate_msr_intel_pt,
         &vmstate_msr_virt_ssbd,
         &vmstate_svm_npt,
+        &vmstate_svm_guest,
 #ifndef TARGET_X86_64
         &vmstate_efer32,
 #endif
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d..cef68b610a 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1166,7 +1166,6 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         break;
 #if !defined(CONFIG_USER_ONLY)
     case CPU_INTERRUPT_VIRQ:
-        /* FIXME: this should respect TPR */
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
         intno = x86_ldl_phys(cs, env->vm_vmcb
                              + offsetof(struct vmcb, control.int_vector));
@@ -1174,6 +1173,7 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
                       "Servicing virtual hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+        env->int_ctl &= ~V_IRQ_MASK;
         break;
 #endif
     }
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index e7a2ebde81..91b0fc916b 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -73,7 +73,7 @@ target_ulong helper_read_crN(CPUX86State *env, int reg)
         if (!(env->hflags2 & HF2_VINTR_MASK)) {
             val = cpu_get_apic_tpr(env_archcpu(env)->apic_state);
         } else {
-            val = env->v_tpr;
+            val = env->int_ctl & V_TPR_MASK;
         }
         break;
     }
@@ -121,7 +121,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
             cpu_set_apic_tpr(env_archcpu(env)->apic_state, t0);
             qemu_mutex_unlock_iothread();
         }
-        env->v_tpr = t0 & 0x0f;
+        env->int_ctl = (env->int_ctl & ~V_TPR_MASK) | (t0 & V_TPR_MASK);
         break;
     default:
         env->cr[reg] = t0;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 66c2c1e61f..24c58b6a38 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -76,14 +76,14 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
-static inline bool ctl_has_irq(uint32_t int_ctl)
+static inline bool ctl_has_irq(CPUX86State *env)
 {
     uint32_t int_prio;
     uint32_t tpr;
 
-    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
-    tpr = int_ctl & V_TPR_MASK;
-    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
+    tpr = env->int_ctl & V_TPR_MASK;
+    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
 static inline bool is_efer_invalid_state (CPUX86State *env)
@@ -121,13 +121,11 @@ static inline bool is_efer_invalid_state (CPUX86State *env)
     return false;
 }
 
-static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t *int_ctl)
+static inline bool virtual_gif_enabled(CPUX86State *env)
 {
     if (likely(env->hflags & HF_GUEST_MASK)) {
-        *int_ctl = x86_ldl_phys(env_cpu(env),
-                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
         return (env->features[FEAT_SVM] & CPUID_SVM_VGIF)
-                    && (*int_ctl & V_GIF_ENABLED_MASK);
+                    && (env->int_ctl & V_GIF_ENABLED_MASK);
     }
     return false;
 }
@@ -139,7 +137,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     target_ulong addr;
     uint64_t nested_ctl;
     uint32_t event_inj;
-    uint32_t int_ctl;
     uint32_t asid;
     uint64_t new_cr0;
     uint64_t new_cr3;
@@ -292,11 +289,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     cpu_x86_update_cr3(env, new_cr3);
     env->cr[2] = x86_ldq_phys(cs,
                           env->vm_vmcb + offsetof(struct vmcb, save.cr2));
-    int_ctl = x86_ldl_phys(cs,
+    env->int_ctl = x86_ldl_phys(cs,
                        env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
     env->hflags2 &= ~(HF2_HIF_MASK | HF2_VINTR_MASK);
-    if (int_ctl & V_INTR_MASKING_MASK) {
-        env->v_tpr = int_ctl & V_TPR_MASK;
+    if (env->int_ctl & V_INTR_MASKING_MASK) {
         env->hflags2 |= HF2_VINTR_MASK;
         if (env->eflags & IF_MASK) {
             env->hflags2 |= HF2_HIF_MASK;
@@ -362,7 +358,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
     env->hflags2 |= HF2_GIF_MASK;
 
-    if (ctl_has_irq(int_ctl)) {
+    if (ctl_has_irq(env)) {
         CPUState *cs = env_cpu(env);
 
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
@@ -522,11 +518,8 @@ void helper_stgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_STGI, 0, GETPC());
 
-    CPUState *cs = env_cpu(env);
-    uint32_t int_ctl;
-    if (virtual_gif_enabled(env, &int_ctl)) {
-        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
-                        int_ctl | V_GIF_MASK);
+    if (virtual_gif_enabled(env)) {
+        env->int_ctl |= V_GIF_MASK;
     } else {
         env->hflags2 |= HF2_GIF_MASK;
     }
@@ -536,11 +529,8 @@ void helper_clgi(CPUX86State *env)
 {
     cpu_svm_check_intercept_param(env, SVM_EXIT_CLGI, 0, GETPC());
 
-    CPUState *cs = env_cpu(env);
-    uint32_t int_ctl;
-    if (virtual_gif_enabled(env, &int_ctl)) {
-        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
-                        int_ctl & ~V_GIF_MASK);
+    if (virtual_gif_enabled(env)) {
+        env->int_ctl &= ~V_GIF_MASK;
     } else {
         env->hflags2 &= ~HF2_GIF_MASK;
     }
@@ -688,7 +678,6 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1,
 void do_vmexit(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    uint32_t int_ctl;
 
     if (env->hflags & HF_INHIBIT_IRQ_MASK) {
         x86_stl_phys(cs,
@@ -731,16 +720,8 @@ void do_vmexit(CPUX86State *env)
              env->vm_vmcb + offsetof(struct vmcb, save.cr3), env->cr[3]);
     x86_stq_phys(cs,
              env->vm_vmcb + offsetof(struct vmcb, save.cr4), env->cr[4]);
-
-    int_ctl = x86_ldl_phys(cs,
-                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
-    int_ctl &= ~(V_TPR_MASK | V_IRQ_MASK);
-    int_ctl |= env->v_tpr & V_TPR_MASK;
-    if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
-        int_ctl |= V_IRQ_MASK;
-    }
     x86_stl_phys(cs,
-             env->vm_vmcb + offsetof(struct vmcb, control.int_ctl), int_ctl);
+             env->vm_vmcb + offsetof(struct vmcb, control.int_ctl), env->int_ctl);
 
     x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.rflags),
              cpu_compute_eflags(env));
@@ -763,6 +744,7 @@ void do_vmexit(CPUX86State *env)
     env->intercept = 0;
     env->intercept_exceptions = 0;
     cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+    env->int_ctl = 0;
     env->tsc_offset = 0;
 
     env->gdt.base  = x86_ldq_phys(cs, env->vm_hsave + offsetof(struct vmcb,
-- 
2.31.1



