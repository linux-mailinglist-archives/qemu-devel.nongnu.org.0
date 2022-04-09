Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B34FA0A9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:26:21 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyvk-0002la-Sc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydy-0008WU-Ub
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydx-0003V3-1N
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so11160552pjk.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ift/JdXJdiUN1/9UO2Y1HJ2r6G0V4xUYKPjDXLj7jTI=;
 b=Lm2AKhZtyXLF8PyBlGCGNV3tUkzaBj0canAptmRvTyzjZ6wNWGD6Q4yuJaoYmfXl/K
 XB498e48LfRfhqmAeD9sqzZ3/8tYxE1Ndqh20Y75ddyFoeDFvl0NMK6B9qaCywjRYDcw
 avPv3/QhijmZev6ETcRfxuquy5hJAJK5HbZMsRbttaafLeTjDM/dbHfnyvenH1L103wX
 f1CCQZ84v+mnvniI+0yE+lZ8kMNzt0qGFy//ShLZ0fXUbaVCv+YPxUYS5AMh+yn3IdVy
 vIAl4Zd5CxkonhPZuKoIxNHTGRhApIN79XXcoPdrelWHhLXdzrHxV/o8H4fwx/nrExwg
 aDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ift/JdXJdiUN1/9UO2Y1HJ2r6G0V4xUYKPjDXLj7jTI=;
 b=CR+q5D0BdH7cy5LlRJ86pYGs12WsCgQeaeYl48qYLZqgqNqFIhUqKa+1+zLkCMiXx4
 XkVC7uom+LfGPb5thgmZzIsozWQ/RkRTItx6DRjcpXPk3wNyul21qGXuq3u3oU61sGV+
 l6EfyYQPKkPo6E2HWRAC9CWjMtroQrWMC9FBJGqYVSLNoOVF6fD64JBFNJN7ORRIyrux
 73ExhnDjqefONRYPYm46u6J4T1kQ+lsgmKK7EZQYrSe3Tlf2Idg0sVLdQPxnhn3EqddE
 GvDPmdZkB3BUApE+0zGw+gNs/nPimOJeUO3D/EpkGiT7SGm333gIv2WwXvz11MERWplq
 rRgg==
X-Gm-Message-State: AOAM532fEbWG/AUfUn7dJwyL1iTQjGgSdkwDSxBDHl0eAis8V00jArbk
 MTpQ/+5szb++oS7q87KH/kPr7aBZuh7Y6g==
X-Google-Smtp-Source: ABdhPJwHHiJi2igKkF/rd9dVfYZAaPlif4hEvvdmPWtEMNnKBNSG997dffm89im0JozPWcsGnNuPjg==
X-Received: by 2002:a17:90b:4c44:b0:1c7:1326:ec90 with SMTP id
 np4-20020a17090b4c4400b001c71326ec90mr24350025pjb.87.1649462875452; 
 Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/16] target/arm: Implement virtual SError exceptions
Date: Fri,  8 Apr 2022 17:07:39 -0700
Message-Id: <20220409000742.293691-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Virtual SError exceptions are raised by setting HCR_EL2.VSE,
and are routed to EL1 just like other virtual exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  2 ++
 target/arm/internals.h |  8 ++++++++
 target/arm/syndrome.h  |  5 +++++
 target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 29 ++++++++++++++++++++++++++++-
 5 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 66becc47f2..eb8cb738b5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -55,6 +55,7 @@
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 #define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
+#define EXCP_VSERR          24
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
@@ -88,6 +89,7 @@ enum {
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
 #define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
+#define CPU_INTERRUPT_VSERR CPU_INTERRUPT_TGT_INT_0
 
 /* The usual mapping for an AArch64 system register to its AArch32
  * counterpart is for the 32 bit world to have access to the lower
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 596fd53619..25ff9628f6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -935,6 +935,14 @@ void arm_cpu_update_virq(ARMCPU *cpu);
  */
 void arm_cpu_update_vfiq(ARMCPU *cpu);
 
+/**
+ * arm_cpu_update_vserr: Update CPU_INTERRUPT_VSERR bit
+ *
+ * Update the CPU_INTERRUPT_VSERR bit in cs->interrupt_request,
+ * following a change to the HCR_EL2.VSE bit.
+ */
+void arm_cpu_update_vserr(ARMCPU *cpu);
+
 /**
  * arm_mmu_idx_el:
  * @env: The cpu environment
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 8cde8e7243..0cb26dde7d 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -287,4 +287,9 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_serror(uint32_t extra)
+{
+    return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
+}
+
 #endif /* TARGET_ARM_SYNDROME_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d815d3a397..1a1b1612a8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -84,7 +84,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     return (cpu->power_state != PSCI_OFF)
         && cs->interrupt_request &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
-         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
+         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
          | CPU_INTERRUPT_EXITTB);
 }
 
@@ -508,6 +508,12 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
             return false;
         }
         return !(env->daif & PSTATE_I);
+    case EXCP_VSERR:
+        if (!(hcr_el2 & HCR_AMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_A);
     default:
         g_assert_not_reached();
     }
@@ -629,6 +635,17 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             goto found;
         }
     }
+    if (interrupt_request & CPU_INTERRUPT_VSERR) {
+        excp_idx = EXCP_VSERR;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            /* Taking a virtual abort clears HCR_EL2.VSE */
+            env->cp15.hcr_el2 &= ~HCR_VSE;
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+            goto found;
+        }
+    }
     return false;
 
  found:
@@ -681,6 +698,25 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     }
 }
 
+void arm_cpu_update_vserr(ARMCPU *cpu)
+{
+    /*
+     * Update the interrupt level for VSERR, which is the HCR_EL2.VSE bit.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    bool new_state = env->cp15.hcr_el2 & HCR_VSE;
+
+    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VSERR) != 0)) {
+        if (new_state) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VSERR);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VSERR);
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2f6b02af7e..bd1c8e01cb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1873,7 +1873,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    /* External aborts are not possible in QEMU so A bit is always clear */
+    if (hcr_el2 & HCR_AMO) {
+        if (cs->interrupt_request & CPU_INTERRUPT_VSERR) {
+            ret |= CPSR_A;
+        }
+    }
+
     return ret;
 }
 
@@ -5338,6 +5343,7 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     g_assert(qemu_mutex_iothread_locked());
     arm_cpu_update_virq(cpu);
     arm_cpu_update_vfiq(cpu);
+    arm_cpu_update_vserr(cpu);
 }
 
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -9529,6 +9535,7 @@ void arm_log_exception(CPUState *cs)
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
             [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+            [EXCP_VSERR] = "Virtual SERR",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -10041,6 +10048,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         mask = CPSR_A | CPSR_I | CPSR_F;
         offset = 4;
         break;
+    case EXCP_VSERR:
+        {
+            /* Construct the SError syndrome from AET and ExT fields. */
+            ARMMMUFaultInfo fi = { .type = ARMFault_AsyncExternal, };
+            env->exception.fsr = arm_fi_to_sfsc(&fi);
+            env->exception.fsr |= env->cp15.vsesr_el2 & 0xd000;
+            A32_BANKED_CURRENT_REG_SET(env, dfsr, env->exception.fsr);
+
+            new_mode = ARM_CPU_MODE_ABT;
+            addr = 0x10;
+            mask = CPSR_A | CPSR_I;
+            offset = 8;
+        }
+        break;
     case EXCP_SMC:
         new_mode = ARM_CPU_MODE_MON;
         addr = 0x08;
@@ -10261,6 +10282,12 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_VFIQ:
         addr += 0x100;
         break;
+    case EXCP_VSERR:
+        addr += 0x180;
+        /* Construct the SError syndrome from IDS and ISS fields. */
+        env->exception.syndrome = syn_serror(env->cp15.vsesr_el2 & 0x1ffffff);
+        env->cp15.esr_el[new_el] = env->exception.syndrome;
+        break;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
     }
-- 
2.25.1


