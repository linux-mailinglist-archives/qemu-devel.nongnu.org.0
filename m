Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01111E7BD0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 13:30:16 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jedDL-0007UT-Nd
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 07:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <beata.michalska@linaro.org>)
 id 1jedCH-00063x-W4
 for qemu-devel@nongnu.org; Fri, 29 May 2020 07:29:10 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <beata.michalska@linaro.org>)
 id 1jedCH-0003Mp-3r
 for qemu-devel@nongnu.org; Fri, 29 May 2020 07:29:09 -0400
Received: by mail-wm1-x343.google.com with SMTP id r15so3015621wmh.5
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WUfOcXJAnXaTvHBUV4+ST9pVt8KDLof7ZLOxX713Sc4=;
 b=Ynv9dnVeopA7ES4scGTQNxzolvTDB9Yw+I4ft7wmVjAc5kl8VNjNk+BUNf2MA9mK9G
 rBI/zrGWW+Pv15D2HYXgrpjo5k+K3S28rE382G21D22NUc9nHcJn4lHie8oLX/KxZqdO
 LPg3MROzMR80tu6T6ze5BVgW1HJTcj8+P6FcezEmIrJE3eaH19PFI+V3dugYCi3mhmIm
 XyQ+da555XQwNUlkLuMSHLQvZsGrlHi0eqHwKv/N4T1jXzDCIKriRxp/vX8a/0AUQqYR
 wODD+jdxpIfFN8/WGLdvPizVdtv2w3/NNdEtO3zdi9j7e7RgeN1GdN2hUir5lCGlwAVW
 gJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WUfOcXJAnXaTvHBUV4+ST9pVt8KDLof7ZLOxX713Sc4=;
 b=YZn9acoveT7VzEMTpACX4N9IsplBvui54bKiaURfxyClhY3mJZzFrDEN1BnD4wGxYS
 EUrpq3Azs60nqAtaATU8BIOhi43d1nJ1+QBGWau9cgvi9UgutYuqevG9MnFflYatsyH3
 ymUZGus++6CB8yyoB3uQKVdmLNBouBEyT13aDL19qgshXC3Qa9iFfHg3JbzWFrgjRSho
 MgUr40wqxg31KgPqrcfb4qK3ZZfTIr/4+Uh+NC/q1DMz8jRhQuFabm7ZQqniQZoJBnar
 P481sO/Y3N8IzQA3nKPH2Q0xfbXJSSFfLwOq0Oy5+voJO60fHcjEdIIQkE54WtTq8+so
 4vRw==
X-Gm-Message-State: AOAM5321POhAX1hlji3roEXLg/liQ6jjIPzYYnBYEzZCLGrrceEdUyJF
 KNoTOPxrxhDso40spblj9mZCIEQxnyXUrw==
X-Google-Smtp-Source: ABdhPJz3Eyy2vrYCaoYDtbt2AeOxlH59cH+nZx9/BwTAyO+sDkn+siO2waJcggvPisEtHU9b5SEEow==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr8477723wmb.6.1590751747450;
 Fri, 29 May 2020 04:29:07 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-151-121-39.range86-151.btcentralplus.com. [86.151.121.39])
 by smtp.gmail.com with ESMTPSA id h188sm6449053wmh.2.2020.05.29.04.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 04:29:07 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] target/arm: kvm: Handle misconfigured dabt injection
Date: Fri, 29 May 2020 12:27:57 +0100
Message-Id: <20200529112757.32235-3-beata.michalska@linaro.org>
In-Reply-To: <20200529112757.32235-1-beata.michalska@linaro.org>
References: <20200529112757.32235-1-beata.michalska@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=beata.michalska@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Christoffer.Dall@arm.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Injecting external data abort through KVM might trigger
an issue on kernels that do not get updated to include the KVM fix.
For those and aarch32 guests, the injected abort gets misconfigured
to be an implementation defined exception. This leads to the guest
repeatedly re-running the faulting instruction.

Add support for handling that case.

[
  Fixed-by: 018f22f95e8a
	('KVM: arm: Fix DFSR setting for non-LPAE aarch32 guests')
  Fixed-by: 21aecdbd7f3a
	('KVM: arm: Make inject_abt32() inject an external abort instead')
]

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 target/arm/cpu.h     |  1 +
 target/arm/kvm.c     | 30 +++++++++++++++++++++++++++++-
 target/arm/kvm32.c   | 34 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 10 ++++++++++
 5 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3702f21..5ebfb72 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -571,6 +571,7 @@ typedef struct CPUARMState {
     } serror;
 
     uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
+    uint8_t ext_dabt_raised; /* Tracking/verifying injection of ext DABT */
 
     /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
     uint32_t irq_line_state;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index bf84224..ac73c67 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -721,7 +721,12 @@ int kvm_put_vcpu_events(ARMCPU *cpu)
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_VCPU_EVENTS, &events);
     if (ret) {
         error_report("failed to put vcpu events");
-    } else {
+    } else if (env->ext_dabt_pending) {
+        /*
+         * Mark that the external DABT has been injected,
+         * if one has been requested
+         */
+        env->ext_dabt_raised = env->ext_dabt_pending;
         /* Clear instantly if the call was successful */
         env->ext_dabt_pending = 0;
     }
@@ -755,6 +760,29 @@ int kvm_get_vcpu_events(ARMCPU *cpu)
 
 void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (unlikely(env->ext_dabt_raised)) {
+        /*
+         * Verifying that the ext DABT has been properly injected,
+         * otherwise risking indefinitely re-running the faulting instruction
+         * Covering a very narrow case for kernels 5.5..5.5.4
+         * when injected abort was misconfigured to be
+         * an IMPLEMENTATION DEFINED exception (for 32-bit EL1)
+         */
+        if (!arm_feature(env, ARM_FEATURE_AARCH64) &&
+            unlikely(!kvm_arm_verify_ext_dabt_pending(cs))) {
+
+            error_report("Data abort exception with no valid ISS generated by "
+                   "guest memory access. KVM unable to emulate faulting "
+                   "instruction. Failed to inject an external data abort "
+                   "into the guest.");
+            abort();
+       }
+       /* Clear the status */
+       env->ext_dabt_raised = 0;
+    }
 }
 
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 7b3a19e..0af46b4 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -559,3 +559,37 @@ void kvm_arm_pmu_init(CPUState *cs)
 {
     qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
 }
+
+#define ARM_REG_DFSR  ARM_CP15_REG32(0, 5, 0, 0)
+#define ARM_REG_TTBCR ARM_CP15_REG32(0, 2, 0, 2)
+/*
+ *DFSR:
+ *      TTBCR.EAE == 0
+ *          FS[4]   - DFSR[10]
+ *          FS[3:0] - DFSR[3:0]
+ *      TTBCR.EAE == 1
+ *          FS, bits [5:0]
+ */
+#define DFSR_FSC(lpae, v) \
+    ((lpae) ? ((v) & 0x3F) : (((v) >> 6) | ((v) & 0x1F)))
+
+#define DFSC_EXTABT(lpae) ((lpae) ? 0x10 : 0x08)
+
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+{
+    uint32_t dfsr_val;
+
+    if (!kvm_get_one_reg(cs, ARM_REG_DFSR, &dfsr_val)) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        CPUARMState *env = &cpu->env;
+        uint32_t ttbcr;
+        int lpae = 0;
+
+        if (!kvm_get_one_reg(cs, ARM_REG_TTBCR, &ttbcr)) {
+            lpae = arm_feature(env, ARM_FEATURE_LPAE) && (ttbcr & TTBCR_EAE);
+        }
+        /* The verification is based on FS filed of the DFSR reg only*/
+        return (DFSR_FSC(lpae, dfsr_val) == DFSC_EXTABT(lpae));
+    }
+    return false;
+}
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index f09ed9f..88cf10c 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1497,3 +1497,52 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 
     return false;
 }
+
+#define ARM64_REG_ESR_EL1 ARM64_SYS_REG(3, 0, 5, 2, 0)
+#define ARM64_REG_TCR_EL1 ARM64_SYS_REG(3, 0, 2, 0, 2)
+
+/*
+ * ESR_EL1
+ * ISS encoding
+ * AARCH64: DFSC,   bits [5:0]
+ * AARCH32:
+ *      TTBCR.EAE == 0
+ *          FS[4]   - DFSR[10]
+ *          FS[3:0] - DFSR[3:0]
+ *      TTBCR.EAE == 1
+ *          FS, bits [5:0]
+ */
+#define ESR_DFSC(aarch64, lpae, v)        \
+    ((aarch64 || (lpae)) ? ((v) & 0x3F)   \
+               : (((v) >> 6) | ((v) & 0x1F)))
+
+#define ESR_DFSC_EXTABT(aarch64, lpae) \
+    ((aarch64) ? 0x10 : (lpae) ? 0x10 : 0x8)
+
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
+{
+    uint64_t dfsr_val;
+
+    if (!kvm_get_one_reg(cs, ARM64_REG_ESR_EL1, &dfsr_val)) {
+        ARMCPU *cpu = ARM_CPU(cs);
+        CPUARMState *env = &cpu->env;
+        int aarch64_mode = arm_feature(env, ARM_FEATURE_AARCH64);
+        int lpae = 0;
+
+        if (!aarch64_mode) {
+            uint64_t ttbcr;
+
+            if (!kvm_get_one_reg(cs, ARM64_REG_TCR_EL1, &ttbcr)) {
+                lpae = arm_feature(env, ARM_FEATURE_LPAE)
+                        && (ttbcr & TTBCR_EAE);
+            }
+        }
+        /*
+         * The verification here is based on the DFSC bits
+         * of the ESR_EL1 reg only
+         */
+         return (ESR_DFSC(aarch64_mode, lpae, dfsr_val) ==
+                ESR_DFSC_EXTABT(aarch64_mode, lpae));
+    }
+    return false;
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index e939e51..bdb34f3 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -464,6 +464,16 @@ void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
 int kvm_arm_handle_dabt_nisv(CPUState *cs, uint64_t esr_iss,
                             uint64_t fault_ipa);
 /**
+ * kvm_arm_verify_ext_dabt_pending:
+ * @cs: CPUState
+ *
+ * Verify the fault status code wrt the Ext DABT injection
+ *
+ * Returns: true if the fault status code is as expected, false otherwise
+ */
+bool kvm_arm_verify_ext_dabt_pending(CPUState *cs);
+
+/**
  * its_class_name:
  *
  * Return the ITS class name to use depending on whether KVM acceleration
-- 
2.7.4


