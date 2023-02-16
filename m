Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E05699AED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnJ-0008As-2R; Thu, 16 Feb 2023 12:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnG-00087Q-Li
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnE-0007qT-9R
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:38 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2223096wmo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tXfXmDot3+4aOQdI7+3EydZikM4l3EQWrj5B9UX3O4Y=;
 b=EfJ3yEGrlRIpOXqP0q2qfTfHh64KdMlkAS3m/aB22dMO6n0JMy0c3RLEineTJE4BrT
 jU8/BHS6lJ05mIrZIpGyd1zoLdeJdk4A+kdm7QHCgqF75D6NJvCtgVs3awF+6qpiWm0l
 GK6H/hWtaJDVDYybZV3Xw9/GhNCmlDrbjxc3TTQkBdydztMUA/5DuZvufVwXMQHfQnPD
 BPclNbFo+F6GW9kFaKvnINnHMK066l/NrF3nBeA+ZacZpcyKdpmoVfnNx3Rq8tJUU74c
 J1hxpYf46amISv1m/OotpmN/hXKbOE7/lMH94VxOYNL5SGAlytLbk6eUcO+1MZomGcrx
 Gq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tXfXmDot3+4aOQdI7+3EydZikM4l3EQWrj5B9UX3O4Y=;
 b=EYqTNpfxkxJDSOgwqpFziLkqD0bcDX2zymBjeZlNIqxBz0jpdAiV21/kdXjoIuQrFC
 7dU33Go3X0fgzWSGsq4pbiUPq8TmhO79rZVKnSVbcBm69no7B1JTraMq0cJQDSCMPCM1
 ya8TfHlyL5aV0UwW94JdylJYWr794JWDDLwz17hW4CF8sbbEDycOrWJTzmSUae65lgTI
 9sdYGsMBDI5H688NezZMk+t6N2d0i8LFqobsw7e3TKm2h5X5eLamtTQ/eF1NnaAzua9k
 XwwVsuha9ENZ+wrie5cP5nMGiWzyfRwlKsIgUiXDgRf1WI1FwF7egcV9FKGz+gVdedgU
 atIQ==
X-Gm-Message-State: AO0yUKW2U7NOdmDayVhk02pLJx7zbRfrEdjuKiEAYfbxFRZ9WSA3HYpy
 F3pOviv0Zo3KnnWtj25pL7d3BE62XuLPiDis
X-Google-Smtp-Source: AK7set9iH9hWM4mn7BNuN2cJDIwfPXwpagpbzykNzRrRlmBXZFNS/6mAFCtNnP83ZzDpc0dGIQK+mA==
X-Received: by 2002:a05:600c:188a:b0:3e2:918:ecd4 with SMTP id
 x10-20020a05600c188a00b003e20918ecd4mr3354590wmp.37.1676567494733; 
 Thu, 16 Feb 2023 09:11:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Date: Thu, 16 Feb 2023 17:11:04 +0000
Message-Id: <20230216171123.2518285-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

While dozens of files include "cpu.h", only 3 files require
these NVIC helper declarations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230206223502.25122-12-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 123 ++++++++++++++++++++++++++++++++++
 target/arm/cpu.h              | 123 ----------------------------------
 target/arm/cpu.c              |   4 +-
 target/arm/cpu_tcg.c          |   3 +
 target/arm/m_helper.c         |   3 +
 5 files changed, 132 insertions(+), 124 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 07f9c21a5f3..1ca262fbf82 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -83,4 +83,127 @@ struct NVICState {
     qemu_irq sysresetreq;
 };
 
+/* Interface between CPU and Interrupt controller.  */
+/**
+ * armv7m_nvic_set_pending: mark the specified exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Marks the specified exception as pending. Note that we will assert()
+ * if @secure is true and @irq does not specify one of the fixed set
+ * of architecturally banked exceptions.
+ */
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_set_pending_derived: mark this derived exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Similar to armv7m_nvic_set_pending(), but specifically for derived
+ * exceptions (exceptions generated in the course of trying to take
+ * a different exception).
+ */
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
+ * generated in the course of lazy stacking of FP registers.
+ */
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_get_pending_irq_info: return highest priority pending
+ *    exception, and whether it targets Secure state
+ * @s: the NVIC
+ * @pirq: set to pending exception number
+ * @ptargets_secure: set to whether pending exception targets Secure
+ *
+ * This function writes the number of the highest priority pending
+ * exception (the one which would be made active by
+ * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
+ * to true if the current highest priority pending exception should
+ * be taken to Secure state, false for NS.
+ */
+void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
+                                      bool *ptargets_secure);
+/**
+ * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
+ * @s: the NVIC
+ *
+ * Move the current highest priority pending exception from the pending
+ * state to the active state, and update v7m.exception to indicate that
+ * it is the exception currently being handled.
+ */
+void armv7m_nvic_acknowledge_irq(NVICState *s);
+/**
+ * armv7m_nvic_complete_irq: complete specified interrupt or exception
+ * @s: the NVIC
+ * @irq: the exception number to complete
+ * @secure: true if this exception was secure
+ *
+ * Returns: -1 if the irq was not active
+ *           1 if completing this irq brought us back to base (no active irqs)
+ *           0 if there is still an irq active after this one was completed
+ * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
+ */
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Return whether an exception is "ready", i.e. whether the exception is
+ * enabled and is configured at a priority which would allow it to
+ * interrupt the current execution priority. This controls whether the
+ * RDY bit for it in the FPCCR is set.
+ */
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_raw_execution_priority: return the raw execution priority
+ * @s: the NVIC
+ *
+ * Returns: the raw execution priority as defined by the v8M architecture.
+ * This is the execution priority minus the effects of AIRCR.PRIS,
+ * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
+ * (v8M ARM ARM I_PKLD.)
+ */
+int armv7m_nvic_raw_execution_priority(NVICState *s);
+/**
+ * armv7m_nvic_neg_prio_requested: return true if the requested execution
+ * priority is negative for the specified security state.
+ * @s: the NVIC
+ * @secure: the security state to test
+ * This corresponds to the pseudocode IsReqExecPriNeg().
+ */
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
+#else
+static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
+{
+    return false;
+}
+#endif
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_can_take_pending_exception(NVICState *s);
+#else
+static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
+{
+    return true;
+}
+#endif
+
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a80819d8d9..d623afe84af 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2559,129 +2559,6 @@ void arm_cpu_list(void);
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
-/* Interface between CPU and Interrupt controller.  */
-#ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_can_take_pending_exception(NVICState *s);
-#else
-static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
-{
-    return true;
-}
-#endif
-/**
- * armv7m_nvic_set_pending: mark the specified exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Marks the specified exception as pending. Note that we will assert()
- * if @secure is true and @irq does not specify one of the fixed set
- * of architecturally banked exceptions.
- */
-void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_set_pending_derived: mark this derived exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Similar to armv7m_nvic_set_pending(), but specifically for derived
- * exceptions (exceptions generated in the course of trying to take
- * a different exception).
- */
-void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
- * generated in the course of lazy stacking of FP registers.
- */
-void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_get_pending_irq_info: return highest priority pending
- *    exception, and whether it targets Secure state
- * @s: the NVIC
- * @pirq: set to pending exception number
- * @ptargets_secure: set to whether pending exception targets Secure
- *
- * This function writes the number of the highest priority pending
- * exception (the one which would be made active by
- * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
- * to true if the current highest priority pending exception should
- * be taken to Secure state, false for NS.
- */
-void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
-                                      bool *ptargets_secure);
-/**
- * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
- * @s: the NVIC
- *
- * Move the current highest priority pending exception from the pending
- * state to the active state, and update v7m.exception to indicate that
- * it is the exception currently being handled.
- */
-void armv7m_nvic_acknowledge_irq(NVICState *s);
-/**
- * armv7m_nvic_complete_irq: complete specified interrupt or exception
- * @s: the NVIC
- * @irq: the exception number to complete
- * @secure: true if this exception was secure
- *
- * Returns: -1 if the irq was not active
- *           1 if completing this irq brought us back to base (no active irqs)
- *           0 if there is still an irq active after this one was completed
- * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
- */
-int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Return whether an exception is "ready", i.e. whether the exception is
- * enabled and is configured at a priority which would allow it to
- * interrupt the current execution priority. This controls whether the
- * RDY bit for it in the FPCCR is set.
- */
-bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_raw_execution_priority: return the raw execution priority
- * @s: the NVIC
- *
- * Returns: the raw execution priority as defined by the v8M architecture.
- * This is the execution priority minus the effects of AIRCR.PRIS,
- * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
- * (v8M ARM ARM I_PKLD.)
- */
-int armv7m_nvic_raw_execution_priority(NVICState *s);
-/**
- * armv7m_nvic_neg_prio_requested: return true if the requested execution
- * priority is negative for the specified security state.
- * @s: the NVIC
- * @secure: the security state to test
- * This corresponds to the pseudocode IsReqExecPriNeg().
- */
-#ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
-#else
-static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
-{
-    return false;
-}
-#endif
-
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
  * which are passed to define_arm_cp_regs().
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b3a2275b087..876ab8f3bf8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -36,8 +36,10 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ccde5080eb7..df0c45e523b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,9 @@
 #include "hw/boards.h"
 #endif
 #include "cpregs.h"
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#include "hw/intc/armv7m_nvic.h"
+#endif
 
 
 /* Share AArch32 -cpu max features with AArch64. */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 25de64c43c9..f94e87e7289 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -18,6 +18,9 @@
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/armv7m_nvic.h"
+#endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
-- 
2.34.1


