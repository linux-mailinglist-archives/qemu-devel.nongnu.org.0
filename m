Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D866D7996
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:20:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Fg-0002tD-JA; Wed, 05 Apr 2023 06:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0FH-0002Y0-W9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:20:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0FE-0003i2-3x
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:20:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id l27so35664303wrb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Byk5LNB9PsG7qsnBIJRRo9JOVccGApJy+cx27j4c9fU=;
 b=zy6RoKZl3HFi+Q0vtR3UwohHMiMsWOn2/ul3EQVzNnehPXDwziBD8kN5oz8YFLSGXj
 z/JbV/w7gRjJU5xeR6Z9EK4Q7ekBR7AroyEWwqox013ocsFMmdaA4ZWf2wIKs/m2o1XP
 +/We8oxS7dteLdYGU8FLDvQO4VX6Suu2gr/VvXj3kZJ2FFAYoGMXBduf7o4qkVPTQNmu
 0HhVtRaZCSFq9x8ZTK0MirJoKqdYOdV5BlEMLWbn5vWNkxftascntbFIYwA0uUlQwF/C
 2xBShpUeR7qjrBXuhSVb8YEJTUIHLJJZrHR3rxKsIkhUvcQpcNTzRCtk+oyEz9o0QBbV
 o/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Byk5LNB9PsG7qsnBIJRRo9JOVccGApJy+cx27j4c9fU=;
 b=m/C0sBgwUSgcgRjVgPQRQGae5knyyk6XFQ6GitHqJvnVTxbnz7YngYsHs1vCaLIYoB
 VW+nUHf3TmL7sgyFyu7sbi7TJTVi0dIP5E/bdOggABHIu3hxyys6WpR0tc9ytEqhOrJl
 vfg7LP0hmWLh1MMepmG94ARnU1VNy3Td5/plIIFG5hySTKsm/cqzYl2idoQ1zE0VStOt
 CBvR3e3oYyH+l7c7Y9N83lToATwHVJNCa1zE9trVreiYh/Z+SDjWGJVX/Gzp5FXp2pO+
 SVti5iz1s56IqAagbHe/Ujx8U5JTYvI8yzR5ML5JxMXTm/llRAx/mO0f2B3Vfilt0KU4
 O7Hg==
X-Gm-Message-State: AAQBX9f5E+XVADRmTHurEGax/HUb6Bm+5EK7CuESKrWzKyF5HaWpKmCP
 xJloXSH40OBb8sZsCRekd0fzIaXeKyzO9xkOqVA=
X-Google-Smtp-Source: AKy350ZkCRxUlRNTXX0kIqDAWFewpV/6tQ9nx8c+rFpbVyobQsMD1OzgOrzwPflhmrDI+QR50xCA9g==
X-Received: by 2002:a5d:42c1:0:b0:2cf:eeae:88c3 with SMTP id
 t1-20020a5d42c1000000b002cfeeae88c3mr3555848wrr.32.1680689998344; 
 Wed, 05 Apr 2023 03:19:58 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm14624762wru.65.2023.04.05.03.19.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 14/14] accel: Rename HVF struct hvf_vcpu_state -> struct
 AccelvCPUState
Date: Wed,  5 Apr 2023 12:18:11 +0200
Message-Id: <20230405101811.76663-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We want all accelerators to share the same opaque pointer in
CPUState.

Rename the 'hvf_vcpu_state' structure as 'AccelvCPUState'.

Use the generic 'accel' field of CPUState instead of 'hvf'.

Replace g_malloc0() by g_new0() for readability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h     |  3 --
 include/sysemu/hvf_int.h  |  2 +-
 accel/hvf/hvf-accel-ops.c | 16 ++++-----
 target/arm/hvf/hvf.c      | 70 +++++++++++++++++++--------------------
 4 files changed, 44 insertions(+), 47 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8d27861ed5..1dc5efe650 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -236,7 +236,6 @@ typedef struct SavedIOTLB {
 struct KVMState;
 struct kvm_run;
 struct AccelvCPUState;
-struct hvf_vcpu_state;
 
 /* work queue */
 
@@ -442,8 +441,6 @@ struct CPUState {
     /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
     bool prctl_unalign_sigbus;
 
-    struct hvf_vcpu_state *hvf;
-
     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
 };
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6545f7cd61..96ef51f4df 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -48,7 +48,7 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
-struct hvf_vcpu_state {
+struct AccelvCPUState {
     uint64_t fd;
     void *exit;
     bool vtimer_masked;
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..06ca1d59a4 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -363,19 +363,19 @@ type_init(hvf_type_init);
 
 static void hvf_vcpu_destroy(CPUState *cpu)
 {
-    hv_return_t ret = hv_vcpu_destroy(cpu->hvf->fd);
+    hv_return_t ret = hv_vcpu_destroy(cpu->accel->fd);
     assert_hvf_ok(ret);
 
     hvf_arch_vcpu_destroy(cpu);
-    g_free(cpu->hvf);
-    cpu->hvf = NULL;
+    g_free(cpu->accel);
+    cpu->accel = NULL;
 }
 
 static int hvf_init_vcpu(CPUState *cpu)
 {
     int r;
 
-    cpu->hvf = g_malloc0(sizeof(*cpu->hvf));
+    cpu->accel = g_new0(struct AccelvCPUState, 1);
 
     /* init cpu signals */
     struct sigaction sigact;
@@ -384,13 +384,13 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
-    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->accel->unblock_ipi_mask);
+    sigdelset(&cpu->accel->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
-    r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
+    r = hv_vcpu_create(&cpu->accel->fd, (hv_vcpu_exit_t **)&cpu->accel->exit, NULL);
 #else
-    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf->fd, HV_VCPU_DEFAULT);
+    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->accel->fd, HV_VCPU_DEFAULT);
 #endif
     cpu->vcpu_dirty = 1;
     assert_hvf_ok(r);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ad65603445..b85648b61c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -366,29 +366,29 @@ int hvf_get_registers(CPUState *cpu)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
-        ret = hv_vcpu_get_reg(cpu->hvf->fd, hvf_reg_match[i].reg, &val);
+        ret = hv_vcpu_get_reg(cpu->accel->fd, hvf_reg_match[i].reg, &val);
         *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
         assert_hvf_ok(ret);
     }
 
     for (i = 0; i < ARRAY_SIZE(hvf_fpreg_match); i++) {
-        ret = hv_vcpu_get_simd_fp_reg(cpu->hvf->fd, hvf_fpreg_match[i].reg,
+        ret = hv_vcpu_get_simd_fp_reg(cpu->accel->fd, hvf_fpreg_match[i].reg,
                                       &fpval);
         memcpy((void *)env + hvf_fpreg_match[i].offset, &fpval, sizeof(fpval));
         assert_hvf_ok(ret);
     }
 
     val = 0;
-    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPCR, &val);
+    ret = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_FPCR, &val);
     assert_hvf_ok(ret);
     vfp_set_fpcr(env, val);
 
     val = 0;
-    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_FPSR, &val);
+    ret = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_FPSR, &val);
     assert_hvf_ok(ret);
     vfp_set_fpsr(env, val);
 
-    ret = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_CPSR, &val);
+    ret = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_CPSR, &val);
     assert_hvf_ok(ret);
     pstate_write(env, val);
 
@@ -397,7 +397,7 @@ int hvf_get_registers(CPUState *cpu)
             continue;
         }
 
-        ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
+        ret = hv_vcpu_get_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, &val);
         assert_hvf_ok(ret);
 
         arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
@@ -420,24 +420,24 @@ int hvf_put_registers(CPUState *cpu)
 
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
         val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
-        ret = hv_vcpu_set_reg(cpu->hvf->fd, hvf_reg_match[i].reg, val);
+        ret = hv_vcpu_set_reg(cpu->accel->fd, hvf_reg_match[i].reg, val);
         assert_hvf_ok(ret);
     }
 
     for (i = 0; i < ARRAY_SIZE(hvf_fpreg_match); i++) {
         memcpy(&fpval, (void *)env + hvf_fpreg_match[i].offset, sizeof(fpval));
-        ret = hv_vcpu_set_simd_fp_reg(cpu->hvf->fd, hvf_fpreg_match[i].reg,
+        ret = hv_vcpu_set_simd_fp_reg(cpu->accel->fd, hvf_fpreg_match[i].reg,
                                       fpval);
         assert_hvf_ok(ret);
     }
 
-    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_FPCR, vfp_get_fpcr(env));
+    ret = hv_vcpu_set_reg(cpu->accel->fd, HV_REG_FPCR, vfp_get_fpcr(env));
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_FPSR, vfp_get_fpsr(env));
+    ret = hv_vcpu_set_reg(cpu->accel->fd, HV_REG_FPSR, vfp_get_fpsr(env));
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_CPSR, pstate_read(env));
+    ret = hv_vcpu_set_reg(cpu->accel->fd, HV_REG_CPSR, pstate_read(env));
     assert_hvf_ok(ret);
 
     aarch64_save_sp(env, arm_current_el(env));
@@ -449,11 +449,11 @@ int hvf_put_registers(CPUState *cpu)
         }
 
         val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
-        ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
+        ret = hv_vcpu_set_sys_reg(cpu->accel->fd, hvf_sreg_match[i].reg, val);
         assert_hvf_ok(ret);
     }
 
-    ret = hv_vcpu_set_vtimer_offset(cpu->hvf->fd, hvf_state->vtimer_offset);
+    ret = hv_vcpu_set_vtimer_offset(cpu->accel->fd, hvf_state->vtimer_offset);
     assert_hvf_ok(ret);
 
     return 0;
@@ -474,7 +474,7 @@ static void hvf_set_reg(CPUState *cpu, int rt, uint64_t val)
     flush_cpu_state(cpu);
 
     if (rt < 31) {
-        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_X0 + rt, val);
+        r = hv_vcpu_set_reg(cpu->accel->fd, HV_REG_X0 + rt, val);
         assert_hvf_ok(r);
     }
 }
@@ -487,7 +487,7 @@ static uint64_t hvf_get_reg(CPUState *cpu, int rt)
     flush_cpu_state(cpu);
 
     if (rt < 31) {
-        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_X0 + rt, &val);
+        r = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_X0 + rt, &val);
         assert_hvf_ok(r);
     }
 
@@ -629,22 +629,22 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     assert(write_cpustate_to_list(arm_cpu, false));
 
     /* Set CP_NO_RAW system registers on init */
-    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MIDR_EL1,
+    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_MIDR_EL1,
                               arm_cpu->midr);
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_MPIDR_EL1,
+    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_MPIDR_EL1,
                               arm_cpu->mp_affinity);
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
     assert_hvf_ok(ret);
     pfr |= env->gicv3state ? (1 << 24) : 0;
-    ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
+    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
     assert_hvf_ok(ret);
 
     /* We're limited to underlying hardware caps, override internal versions */
-    ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
+    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
                               &arm_cpu->isar.id_aa64mmfr0);
     assert_hvf_ok(ret);
 
@@ -654,7 +654,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     cpus_kick_thread(cpu);
-    hv_vcpus_exit(&cpu->hvf->fd, 1);
+    hv_vcpus_exit(&cpu->accel->fd, 1);
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
@@ -1191,13 +1191,13 @@ static int hvf_inject_interrupts(CPUState *cpu)
 {
     if (cpu->interrupt_request & CPU_INTERRUPT_FIQ) {
         trace_hvf_inject_fiq();
-        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_FIQ,
+        hv_vcpu_set_pending_interrupt(cpu->accel->fd, HV_INTERRUPT_TYPE_FIQ,
                                       true);
     }
 
     if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
         trace_hvf_inject_irq();
-        hv_vcpu_set_pending_interrupt(cpu->hvf->fd, HV_INTERRUPT_TYPE_IRQ,
+        hv_vcpu_set_pending_interrupt(cpu->accel->fd, HV_INTERRUPT_TYPE_IRQ,
                                       true);
     }
 
@@ -1231,7 +1231,7 @@ static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
      */
     qatomic_mb_set(&cpu->thread_kicked, false);
     qemu_mutex_unlock_iothread();
-    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    pselect(0, 0, 0, 0, ts, &cpu->accel->unblock_ipi_mask);
     qemu_mutex_lock_iothread();
 }
 
@@ -1252,7 +1252,7 @@ static void hvf_wfi(CPUState *cpu)
         return;
     }
 
-    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
     assert_hvf_ok(r);
 
     if (!(ctl & 1) || (ctl & 2)) {
@@ -1261,7 +1261,7 @@ static void hvf_wfi(CPUState *cpu)
         return;
     }
 
-    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
     assert_hvf_ok(r);
 
     ticks_to_sleep = cval - hvf_vtimer_val();
@@ -1294,12 +1294,12 @@ static void hvf_sync_vtimer(CPUState *cpu)
     uint64_t ctl;
     bool irq_state;
 
-    if (!cpu->hvf->vtimer_masked) {
+    if (!cpu->accel->vtimer_masked) {
         /* We will get notified on vtimer changes by hvf, nothing to do */
         return;
     }
 
-    r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
+    r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
     assert_hvf_ok(r);
 
     irq_state = (ctl & (TMR_CTL_ENABLE | TMR_CTL_IMASK | TMR_CTL_ISTATUS)) ==
@@ -1308,8 +1308,8 @@ static void hvf_sync_vtimer(CPUState *cpu)
 
     if (!irq_state) {
         /* Timer no longer asserting, we can unmask it */
-        hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);
-        cpu->hvf->vtimer_masked = false;
+        hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        cpu->accel->vtimer_masked = false;
     }
 }
 
@@ -1317,7 +1317,7 @@ int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
-    hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
+    hv_vcpu_exit_t *hvf_exit = cpu->accel->exit;
     hv_return_t r;
     bool advance_pc = false;
 
@@ -1332,7 +1332,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     flush_cpu_state(cpu);
 
     qemu_mutex_unlock_iothread();
-    assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
+    assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
@@ -1346,7 +1346,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case HV_EXIT_REASON_VTIMER_ACTIVATED:
         qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
-        cpu->hvf->vtimer_masked = true;
+        cpu->accel->vtimer_masked = true;
         return 0;
     case HV_EXIT_REASON_CANCELED:
         /* we got kicked, no exit to process */
@@ -1457,10 +1457,10 @@ int hvf_vcpu_exec(CPUState *cpu)
 
         flush_cpu_state(cpu);
 
-        r = hv_vcpu_get_reg(cpu->hvf->fd, HV_REG_PC, &pc);
+        r = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_PC, &pc);
         assert_hvf_ok(r);
         pc += 4;
-        r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
+        r = hv_vcpu_set_reg(cpu->accel->fd, HV_REG_PC, pc);
         assert_hvf_ok(r);
     }
 
-- 
2.38.1


