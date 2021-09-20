Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE24117C1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:06:02 +0200 (CEST)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKrp-000861-Ci
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9d-0002pG-JM
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9J-0000rK-1X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id w17so22054517wrv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZIUPMhDMQ6U8Anm6yxaUrry91lwAKw8+PAog2/UNjFg=;
 b=r/oQUH7s/DIP1XO6va9ggBG6PlHzcB1EEgkHZXBdRMhMpS9f+NjEb8/XnHJiFSmHLF
 vaQURQgMDa7lyTfTRr7VrKUtXZNOJwTzfjpJDIh7VUUD08EUrsBacq0KwOcC/a//PhmT
 Ubu6EmWfxTprP8Mrw2gKrW58czM8gZlcEwYGF9B3wK2gJEr8tM0/tGZzapFcoCCBcE5t
 kmz+9xqTA2aMCgCYRQazoTckxe/mcT6bPNbvjGe2kVmkPJEAptOOr93M2dMIW0PEvA1X
 UwPElO+Lp62nB5B6oS9LY9ydILwteZcpyo1rmcq36kIMTv0slKMtA6IQ8+sRpF3kZHxM
 wPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIUPMhDMQ6U8Anm6yxaUrry91lwAKw8+PAog2/UNjFg=;
 b=iX8sPYgRV76AlPaLerUggYwrTjQtVd1+rM9SCdZJHr8Yn3FZ+Qwnfno+NHkEiwJwuA
 P1KoG8KFj7HiUb581MXJQn++HwQi3MkdY3IXAFfEbFdp6az3jito/Zv6BwHXaMjskLDe
 d+gLuCK+mGCUbbg6QuK41/vJLFGpm3vr5QpWOyN6SEsmgrPPZnaQTnBU7gC+bYGMfEGC
 63j9wCQWdvnGLNg0nUTEpYgcK8rvSr8VrpCwrHQpjJM0aJ6hqGJurOPQlCpPiDy291uy
 fx3KXn7FZVstlV8GtROG1q4GUasNdQ0ZadjrbnNnIRV6cJUg2V1j3SQCmpK9lIwvfVYD
 E1uw==
X-Gm-Message-State: AOAM531FfX1rIQSVCZgc2o8gPnukpEXuos2zapA0lkHW7FV4aoc0SlJd
 OZ5kuI+fxO56OCEgqfxYjj9ZrDwaVXIvgg==
X-Google-Smtp-Source: ABdhPJxiMqZ/ARZyZKv3q3gPn4eNNpq3925VhdysmyUlNBY7FUzhQFHGonYFMivz2m6UmblwYSf1CQ==
X-Received: by 2002:adf:e507:: with SMTP id j7mr28970904wrm.103.1632147599717; 
 Mon, 20 Sep 2021 07:19:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] hvf: arm: Implement PSCI handling
Date: Mon, 20 Sep 2021 15:19:33 +0100
Message-Id: <20210920141947.5537-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

We need to handle PSCI calls. Most of the TCG code works for us,
but we can simplify it to only handle aa64 mode and we need to
handle SUSPEND differently.

This patch takes the TCG code as template and duplicates it in HVF.

To tell the guest that we support PSCI 0.2 now, update the check in
arm_cpu_initfn() as well.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-8-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c            |   4 +-
 target/arm/hvf/hvf.c        | 141 ++++++++++++++++++++++++++++++++++--
 target/arm/hvf/trace-events |   1 +
 3 files changed, 139 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1c02b92698b..641a8c2d3d3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1113,8 +1113,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (tcg_enabled() || hvf_enabled()) {
+        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
     }
 }
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 51b7250612f..996f93a69dc 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
+#include "arm-powerctl.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
 #include "trace/trace-target_arm_hvf.h"
@@ -48,6 +49,8 @@
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
+static void hvf_wfi(CPUState *cpu);
+
 typedef struct HVFVTimer {
     /* Vtimer value during migration and paused state */
     uint64_t vtimer_val;
@@ -603,6 +606,117 @@ static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
     arm_cpu_do_interrupt(cpu);
 }
 
+static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
+{
+    int32_t ret = arm_set_cpu_off(arm_cpu->mp_affinity);
+    assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
+}
+
+/*
+ * Handle a PSCI call.
+ *
+ * Returns 0 on success
+ *         -1 when the PSCI call is unknown,
+ */
+static bool hvf_handle_psci_call(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    uint64_t param[4] = {
+        env->xregs[0],
+        env->xregs[1],
+        env->xregs[2],
+        env->xregs[3]
+    };
+    uint64_t context_id, mpidr;
+    bool target_aarch64 = true;
+    CPUState *target_cpu_state;
+    ARMCPU *target_cpu;
+    target_ulong entry;
+    int target_el = 1;
+    int32_t ret = 0;
+
+    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
+                        arm_cpu->mp_affinity);
+
+    switch (param[0]) {
+    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+        ret = QEMU_PSCI_0_2_RET_VERSION_0_2;
+        break;
+    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+        ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
+        break;
+    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+        mpidr = param[1];
+
+        switch (param[2]) {
+        case 0:
+            target_cpu_state = arm_get_cpu_by_id(mpidr);
+            if (!target_cpu_state) {
+                ret = QEMU_PSCI_RET_INVALID_PARAMS;
+                break;
+            }
+            target_cpu = ARM_CPU(target_cpu_state);
+
+            ret = target_cpu->power_state;
+            break;
+        default:
+            /* Everything above affinity level 0 is always on. */
+            ret = 0;
+        }
+        break;
+    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        /*
+         * QEMU reset and shutdown are async requests, but PSCI
+         * mandates that we never return from the reset/shutdown
+         * call, so power the CPU off now so it doesn't execute
+         * anything further.
+         */
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN64_CPU_ON:
+        mpidr = param[1];
+        entry = param[2];
+        context_id = param[3];
+        ret = arm_set_cpu_on(mpidr, entry, context_id,
+                             target_el, target_aarch64);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_OFF:
+    case QEMU_PSCI_0_2_FN_CPU_OFF:
+        hvf_psci_cpu_off(arm_cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+        /* Affinity levels are not supported in QEMU */
+        if (param[1] & 0xfffe0000) {
+            ret = QEMU_PSCI_RET_INVALID_PARAMS;
+            break;
+        }
+        /* Powerdown is not supported, we always go into WFI */
+        env->xregs[0] = 0;
+        hvf_wfi(cpu);
+        break;
+    case QEMU_PSCI_0_1_FN_MIGRATE:
+    case QEMU_PSCI_0_2_FN_MIGRATE:
+        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
+        break;
+    default:
+        return false;
+    }
+
+    env->xregs[0] = ret;
+    return true;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -905,14 +1019,31 @@ int hvf_vcpu_exec(CPUState *cpu)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_hvc(env->xregs[0]);
-        /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
-        env->xregs[0] = -1;
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
+            if (!hvf_handle_psci_call(cpu)) {
+                trace_hvf_unknown_hvc(env->xregs[0]);
+                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
+                env->xregs[0] = -1;
+            }
+        } else {
+            trace_hvf_unknown_hvc(env->xregs[0]);
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        trace_hvf_unknown_smc(env->xregs[0]);
-        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+            advance_pc = true;
+
+            if (!hvf_handle_psci_call(cpu)) {
+                trace_hvf_unknown_smc(env->xregs[0]);
+                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
+                env->xregs[0] = -1;
+            }
+        } else {
+            trace_hvf_unknown_smc(env->xregs[0]);
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
         break;
     default:
         cpu_synchronize_state(cpu);
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index db40d54bb22..820e8e02979 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -8,3 +8,4 @@ hvf_sysreg_write(uint32_t reg, uint32_t op0, uint32_t op1, uint32_t crn, uint32_
 hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
+hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
-- 
2.20.1


