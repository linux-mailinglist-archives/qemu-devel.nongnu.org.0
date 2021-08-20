Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D084D3F2DF5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:23:00 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5QB-0007FK-HA
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jp-00056n-Gd
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jl-0000qJ-3n
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so9257372wme.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5/EnPCmrp8IsJ2zg5wZB6Xm+ZN3x7hv8UneTSh2shM=;
 b=KhGrH6UKyJKYQGmaOa5bv1xTIXD2LqNQrExF2fto5JvYe+DervQUDij4hHSyavLBnP
 gUsrUC5lpHAYRK6C2jaBHiHQJsoI0eNjDqPpoX9B6cT4bWrLAsSnF5G0tUfrVCd1lgwU
 wes51qnuj1EegGa5ygIgjeHzpeh74jPsZStJcXu7xsSQwsoClW8Qe4yY5U3IwDfUlWOB
 bY1AvYKLkIGFIfF316NjliYX0vEUxr1RIX47DOqdYYM8Bz1Jggx+66GiMNRQkWVEALdh
 5nChkLQuBtzG4FbDlXJYLmHhoJTbDCTCfbti/kD2fbzSDqlmCtE8ogRsnbPlXtYJCzKn
 OEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5/EnPCmrp8IsJ2zg5wZB6Xm+ZN3x7hv8UneTSh2shM=;
 b=s+BiyiYfFdXg1T4fXJfumuIuqEHXFjPXuVho8gfuiA0akuH/aU8g3BYJ4JWt4w5zff
 UZoCnOVn+Jj6ckaWKImoD9R5CMmj6m7jlR/uohNmzplArQO1ctLdVnXhHj14XgbAF/mz
 FEU3Pdg030wuZy0Pun0BGo1cwMrvfzv/k28eo+41w0gVq/uT/6Zq3t9/n2RB6tb0pDP3
 xfdeyG+HiE1Ls2SrguvyvjMPZj0Vnd4dl4JyZW/sUAF1vyP3xphpqZLZHdBDAZbS7y60
 5OZGi59xdTNjEo4vcbl7MaxHLQy56nv1Mmtm5mVi6vDPO1k090T0ufwYiVtC6XN6sS78
 Ed/A==
X-Gm-Message-State: AOAM530gdpgxdTXIvdcHVD8Sm+8qYNStc94/f0I15llV4s50PebHVGWg
 I5qkgSY6xeLeGN467U0KNI4l5bXkq00IuA==
X-Google-Smtp-Source: ABdhPJxcgvDhCyYrbT8DKUH0BL5aWft4eYgfwsdNa7WLqe8MQVJGHsiUy7bE4yWoa4jsNqDUnluVAg==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr4146793wmd.33.1629468978692; 
 Fri, 20 Aug 2021 07:16:18 -0700 (PDT)
Received: from laral.fritz.box
 (dslb-088-066-221-248.088.066.pools.vodafone-ip.de. [88.66.221.248])
 by smtp.gmail.com with ESMTPSA id a133sm10578968wme.5.2021.08.20.07.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 07:16:18 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/i386: Moved int_ctl into CPUX86State structure
Date: Fri, 20 Aug 2021 16:15:55 +0200
Message-Id: <20210820141558.9031-2-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820141558.9031-1-laramglazier@gmail.com>
References: <20210820141558.9031-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved int_ctl into the CPUX86State structure to remove some
unnecessary stores and loads.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
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
index ada7b49d8e..5dcdab3b80 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5647,7 +5647,7 @@ static void x86_cpu_reset(DeviceState *dev)
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
index f6f094f1c9..013ca6837f 100644
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
+    return !env->int_ctl;
+}
+
+static const VMStateDescription vmstate_svm_guest = {
+    .name = "cpu/svn_guest",
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
index 989af1b7f2..9ef2454779 100644
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
     }
@@ -521,11 +517,8 @@ void helper_stgi(CPUX86State *env)
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
@@ -535,11 +528,8 @@ void helper_clgi(CPUX86State *env)
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
@@ -687,7 +677,6 @@ void cpu_vmexit(CPUX86State *env, uint32_t exit_code, uint64_t exit_info_1,
 void do_vmexit(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
-    uint32_t int_ctl;
 
     if (env->hflags & HF_INHIBIT_IRQ_MASK) {
         x86_stl_phys(cs,
@@ -730,16 +719,8 @@ void do_vmexit(CPUX86State *env)
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
@@ -762,6 +743,7 @@ void do_vmexit(CPUX86State *env)
     env->intercept = 0;
     env->intercept_exceptions = 0;
     cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
+    env->int_ctl = 0;
     env->tsc_offset = 0;
 
     env->gdt.base  = x86_ldq_phys(cs, env->vm_hsave + offsetof(struct vmcb,
-- 
2.25.1


