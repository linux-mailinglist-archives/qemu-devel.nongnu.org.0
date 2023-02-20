Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6F69D712
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYo-0004XP-Tc; Mon, 20 Feb 2023 18:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYj-0004T0-7A
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:01 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYh-0000Qk-7U
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:00 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 ei9-20020a17090ae54900b002349a303ca5so2877639pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3y/FFraIBsrnZDMo6qHECYIBj1ugEm+zw6wnTUMfbE=;
 b=mxQDkBOfFwdPkteMkuHJBNcH5ZhRHkLd6u/0Sa34cJsBW4eJApwzGrcV5pHqC0FWsy
 Nuxvkvd/5T4ETncOVzCMXNEsHG/EuacIkWjZ6Vjjy5wKz9EYDj0KJmhdwnedhEJlLLf2
 RhecQwZ4RdKkI4hwZKBfiAYhoyTFZzYs5WBBCg2ocCPkg6BbNu9LurrGpuXjv3Ix+pMh
 B+iaz+51fhxPTPBVufpYDugvQHjPzQJ1YUdrs+Qiz3WFtn/W+R9Rqdi2dobrOU4lvl1f
 P9wOnlra4B5GJa6tlmiz+o49zpOnZG3WbqGKbU/xywhmMCTaH5xzxWE9fvDTiClsBL0T
 Rhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3y/FFraIBsrnZDMo6qHECYIBj1ugEm+zw6wnTUMfbE=;
 b=q1014vV7/6xcfvoGyVZCbjkKn1sQP2cKsDuFzTON2jHg7Bo/rKmDKqHeh3OMFB1x2p
 IaiHpAMqxifViN1YhzuherFPGwWdecnJZDATby2OqafbInIT4TqtjKGp+IyGKvrNvPa2
 vSQlsRoA7EBjcaDzt5v25W9GMvY4pelJWJ2t83Q5kSw6W/+ZGxnmd36L8Gh2k4w8aXYN
 UMxkJtXPDDdbg2wAbq18IpR0f8u96Kf2ZnnKKzgg7453skZ2ZMn09p6T67RStczrViPd
 +Mj4kSQt5ceRCjLcX0U1zdCgM45favn7yWIBpCoxOL3uDXr4zXSpnZZsnwQKvYUbPUaG
 KCgw==
X-Gm-Message-State: AO0yUKXYZNzCXmYchRwigDFnPL8Olay0WwISoJKxaHsBHgnGDw/2v90t
 RXyzBMlXBjKZSn7rQ9eyuHsedYpU9WuMSrvYT0E=
X-Google-Smtp-Source: AK7set/w3v0e+FBnlXj5rqZSoCglWR5MEUKKmFBhm8Mhp2/R7l0n1OruelWFYOzRCe9PmGfbXTlZXQ==
X-Received: by 2002:a17:903:11d1:b0:19b:3b4:3af5 with SMTP id
 q17-20020a17090311d100b0019b03b43af5mr5917488plh.34.1676935618273; 
 Mon, 20 Feb 2023 15:26:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 18/21] target/arm: Implement GPC exceptions
Date: Mon, 20 Feb 2023 13:26:23 -1000
Message-Id: <20230220232626.429947-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Handle GPC Fault types in arm_deliver_fault, reporting as
either a GPC exception at EL3, or falling through to insn
or data aborts at various exception levels.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        |  1 +
 target/arm/internals.h  | 27 ++++++++++++
 target/arm/helper.c     |  5 +++
 target/arm/tlb_helper.c | 96 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4bafe8340e..faafb63520 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -57,6 +57,7 @@
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
 #define EXCP_VSERR          24
+#define EXCP_GPC            25   /* v9 Granule Protection Check Fault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 759b70c646..5e88649fea 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -352,14 +352,27 @@ typedef enum ARMFaultType {
     ARMFault_ICacheMaint,
     ARMFault_QEMU_NSCExec, /* v8M: NS executing in S&NSC memory */
     ARMFault_QEMU_SFault, /* v8M: SecureFault INVTRAN, INVEP or AUVIOL */
+    ARMFault_GPCFOnWalk,
+    ARMFault_GPCFOnOutput,
 } ARMFaultType;
 
+typedef enum ARMGPCF {
+    GPCF_None,
+    GPCF_AddressSize,
+    GPCF_Walk,
+    GPCF_EABT,
+    GPCF_Fail,
+} ARMGPCF;
+
 /**
  * ARMMMUFaultInfo: Information describing an ARM MMU Fault
  * @type: Type of fault
+ * @gpcf: Subtype of ARMFault_GPCFOn{Walk,Output}.
  * @level: Table walk level (for translation, access flag and permission faults)
  * @domain: Domain of the fault address (for non-LPAE CPUs only)
  * @s2addr: Address that caused a fault at stage 2
+ * @paddr: physical address that caused a fault for gpc
+ * @paddr_space: physical address space that caused a fault for gpc
  * @stage2: True if we faulted at stage 2
  * @s1ptw: True if we faulted at stage 2 while doing a stage 1 page-table walk
  * @s1ns: True if we faulted on a non-secure IPA while in secure state
@@ -368,7 +381,10 @@ typedef enum ARMFaultType {
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 struct ARMMMUFaultInfo {
     ARMFaultType type;
+    ARMGPCF gpcf;
     target_ulong s2addr;
+    target_ulong paddr;
+    ARMSecuritySpace paddr_space;
     int level;
     int domain;
     bool stage2;
@@ -542,6 +558,17 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_Exclusive:
         fsc = 0x35;
         break;
+    case ARMFault_GPCFOnWalk:
+        assert(fi->level >= -1 && fi->level <= 3);
+        if (fi->level < 0) {
+            fsc = 0b100011;
+        } else {
+            fsc = 0b100100 | fi->level;
+        }
+        break;
+    case ARMFault_GPCFOnOutput:
+        fsc = 0b101000;
+        break;
     default:
         /* Other faults can't occur in a context that requires a
          * long-format status code.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 13af812215..5dc3329f0c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10235,6 +10235,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
             [EXCP_VSERR] = "Virtual SERR",
+            [EXCP_GPC] = "Granule Protection Check",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -10963,6 +10964,10 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
 
     switch (cs->exception_index) {
+    case EXCP_GPC:
+        qemu_log_mask(CPU_LOG_INT, "...with MFAR 0x%" PRIx64 "\n",
+                      env->cp15.mfar_el3);
+        /* fall through */
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
         /*
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 60abcbebe6..aa03d3f8dc 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -109,17 +109,106 @@ static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMUFaultInfo *fi,
     return fsr;
 }
 
+static bool report_as_gpc_exception(ARMCPU *cpu, int current_el,
+                                    ARMMMUFaultInfo *fi)
+{
+    bool ret;
+
+    switch (fi->gpcf) {
+    case GPCF_None:
+        return false;
+    case GPCF_AddressSize:
+    case GPCF_Walk:
+    case GPCF_EABT:
+        /* R_PYTGX: GPT faults are reported as GPC. */
+        ret = true;
+        break;
+    case GPCF_Fail:
+        /*
+         * R_BLYPM: A GPF at EL3 is reported as insn or data abort.
+         * R_VBZMW, R_LXHQR: A GPF at EL[0-2] is reported as a GPC
+         * if SCR_EL3.GPF is set, otherwise an insn or data abort.
+         */
+        ret = (cpu->env.cp15.scr_el3 & SCR_GPF) && current_el != 3;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    assert(cpu_isar_feature(aa64_rme, cpu));
+    assert(fi->type == ARMFault_GPCFOnWalk ||
+           fi->type == ARMFault_GPCFOnOutput);
+    if (fi->gpcf == GPCF_AddressSize) {
+        assert(fi->level == 0);
+    } else {
+        assert(fi->level >= 0 && fi->level <= 1);
+    }
+
+    return ret;
+}
+
+static unsigned encode_gpcsc(ARMMMUFaultInfo *fi)
+{
+    static uint8_t const gpcsc[] = {
+        [GPCF_AddressSize] = 0b000000,
+        [GPCF_Walk]        = 0b000100,
+        [GPCF_Fail]        = 0b001100,
+        [GPCF_EABT]        = 0b010100,
+    };
+
+    /* Note that we've validated fi->gpcf and fi->level above. */
+    return gpcsc[fi->gpcf] | fi->level;
+}
+
 static G_NORETURN
 void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
                        MMUAccessType access_type,
                        int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
-    int target_el;
+    int target_el = exception_target_el(env);
+    int current_el = arm_current_el(env);
     bool same_el;
     uint32_t syn, exc, fsr, fsc;
 
-    target_el = exception_target_el(env);
+    if (report_as_gpc_exception(cpu, current_el, fi)) {
+        target_el = 3;
+
+        fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
+
+        syn = syn_gpc(fi->stage2 && fi->type == ARMFault_GPCFOnWalk,
+                      access_type == MMU_INST_FETCH,
+                      encode_gpcsc(fi), 0, fi->s1ptw,
+                      access_type == MMU_DATA_STORE, fsc);
+
+        env->cp15.mfar_el3 = fi->paddr;
+        switch (fi->paddr_space) {
+        case ARMSS_Secure:
+            break;
+        case ARMSS_NonSecure:
+            env->cp15.mfar_el3 |= R_MFAR_NS_MASK;
+            break;
+        case ARMSS_Root:
+            env->cp15.mfar_el3 |= R_MFAR_NSE_MASK;
+            break;
+        case ARMSS_Realm:
+            env->cp15.mfar_el3 |= R_MFAR_NSE_MASK | R_MFAR_NS_MASK;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        exc = EXCP_GPC;
+        goto do_raise;
+    }
+
+    /* If SCR_EL3.GPF is unset, GPF may still be routed to EL2. */
+    if (fi->gpcf == GPCF_Fail && target_el < 2) {
+        if (arm_hcr_el2_eff(env) & HCR_GPF) {
+            target_el = 2;
+        }
+    }
+
     if (fi->stage2) {
         target_el = 2;
         env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
@@ -127,8 +216,8 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
             env->cp15.hpfar_el2 |= HPFAR_NS;
         }
     }
-    same_el = (arm_current_el(env) == target_el);
 
+    same_el = current_el == target_el;
     fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
 
     if (access_type == MMU_INST_FETCH) {
@@ -146,6 +235,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         exc = EXCP_DATA_ABORT;
     }
 
+ do_raise:
     env->exception.vaddress = addr;
     env->exception.fsr = fsr;
     raise_exception(env, exc, syn, target_el);
-- 
2.34.1


