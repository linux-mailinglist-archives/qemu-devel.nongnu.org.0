Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2340379C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:12:12 +0200 (CEST)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuYt-0003zQ-Lz
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRg-0006K1-PE
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:45 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRc-0002qE-6K
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so1121060wmq.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yGGcFCxa3DPzLBu/R2mPTHRKMWG0DNlo6ftGn6pELgQ=;
 b=HU2hAwzxirySmjCpkp7CXD7VoauGvEQJdF3TFmNVT0hIHpy5db61qzduqeQa7/nyoe
 4JErJOKzfjDzcpK6wLFENm30tdOMXOGM/aeMYoT6HDORrl9EVcaX25OnR4myZADo+hAj
 0ju6VvCBo1pcQDsXKlqr4TDtv2g/1g4cTLljHXICkGGpgbD7pkLpxsnI2Ljxj9qw74Et
 QE52ynAx6AKXNYJUXq9JVsvsKJ0210qqmk++6920EmPWZPIQCxNRMR0IoSjbiYqZafPt
 7knI4wvoULD5ysB7ggYk9GuHUWoyLwMViXb36M5FwprAR2iqU4+3dYxM/ACUS08klYHV
 d4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yGGcFCxa3DPzLBu/R2mPTHRKMWG0DNlo6ftGn6pELgQ=;
 b=W93kHC0rdh8QFmMv9z6B8DVi8gIzj9wWOwf1zFVV+kK3SYsogMEP8TuxPNCXWgIqYC
 RYx5UD/7Xbv8PJWY3ODeewnpTY2bxcJq+BCz9l97zggbXNbZUp/1TW+cGzRWBjeJzkB1
 TpqH+nFz8+rWqKJRZNs9lyqRhVawPzERiTT4FtmDQnJGc1fvKwr1zVUnrjiK49//aS/7
 z/toVr3QWNZJ3D1a1I0xefFcUNhyzoPMYKzj/8iC+qVXsbfFge3JGMZ2SlC5+8h6+3sL
 TLthvlyOnfvBZDxPMGTEWuPhbbUTrZtk/e/j73Kl2BODycK5uGWOnT0/9199Xo1W+k7v
 v9wg==
X-Gm-Message-State: AOAM531NunMvGVpP4mrfe530CKlFX/t1uc89ZLLuFTDdSxdidOQx2Qsu
 /8SUh900fSdVw4qcK3pSNhwVSGtSYMY=
X-Google-Smtp-Source: ABdhPJxzXpwzpQfqGWYEJygIqY/zpnw9dHrVHFwBB85SBFSkYm3/Xoewp8+Tg3UTeNV55KBfM5KvSA==
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr2673259wmn.136.1631095478828; 
 Wed, 08 Sep 2021 03:04:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 04/43] target/i386: Moved int_ctl into CPUX86State structure
Date: Wed,  8 Sep 2021 12:03:47 +0200
Message-Id: <20210908100426.264356-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
 target/i386/cpu.c                    |  2 +-
 target/i386/cpu.h                    |  1 +
 target/i386/machine.c                | 22 ++++++++++++-
 target/i386/tcg/seg_helper.c         |  2 +-
 target/i386/tcg/sysemu/misc_helper.c |  4 +--
 target/i386/tcg/sysemu/svm_helper.c  | 48 +++++++++-------------------
 6 files changed, 41 insertions(+), 38 deletions(-)

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
index aafc2eb696..3dfe630d7e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1578,6 +1578,7 @@ typedef struct CPUX86State {
     uint64_t nested_cr3;
     uint32_t nested_pg_mode;
     uint8_t v_tpr;
+    uint32_t int_ctl;
 
     /* KVM states, automatically cleared on reset */
     uint8_t nmi_injected;
diff --git a/target/i386/machine.c b/target/i386/machine.c
index f6f094f1c9..b0943118d1 100644
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
+    return tcg_enabled() && env->int_ctl;
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



