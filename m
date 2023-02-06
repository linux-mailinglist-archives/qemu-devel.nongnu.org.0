Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1068C9A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:39:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA6P-0002bG-Kl; Mon, 06 Feb 2023 17:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5q-00023R-Qx
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:36:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5n-0004QP-EF
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:36:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11921204wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Th29SQNs7/l87a43ReKMZy6K5gSwY95yoc+dQl25fFo=;
 b=UZLAGAHV9ptv26hSJWLRvMGmiMhBXL6bkMNNDsg5323vbcbLf0nTrFG6XCPkhlrB/J
 Wdarnnonw6ZDtTxnr/MspxQjknz9FFPRLMlPpHr12Yaz4YqLpfua9+wAVgQwrPvNIF0Z
 4iCbHG1Q4+0x0cl6enPYDrE8ZIVDsamW4q1qvfHUJfOsQmFev1X5cgB1+Ot2Onj2Hs+P
 CgbeWmCsP+SrCrtYCgG2Gj7HDsFrbPLaK0s99Lw3Wt5aA1/FRVuSQikzkc6NqsR1iNBp
 teuFWk2g41vIsI/FRkK28g3GLvwSsUh52H4BBUUa8qyBeHOffTfsaTZPpcae7HBgcqNG
 6r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Th29SQNs7/l87a43ReKMZy6K5gSwY95yoc+dQl25fFo=;
 b=xLlW6nsUPFjgzI5+66wRIaHG6nYZdPOgBcMAX614bQeToxHdqDWg38s/qhq+Pzwh7n
 zaj3Yq01DHpM/4GTLT5t6eFO/z4P8beDCnoCB8VCESpr78fFYguqmjj52ef39MFtpNZH
 UZ4XA53xM20gY4hcsjLyuCR4+KbhD4AtA8h4cmNQbXdqnwtbf8iLFRWerhFK7BK60ups
 zIskEuT7WMNZe9xJE9V7OdyZf3x/tf1V0r7+Y8rTP3wBijT4YnHkkpZv/RbWubHP9n27
 DAAWABdj+M9MYcZy8uHT9QxhMU5H6i3PeydRHn4Ru6i7MfTVrmBS0KPL8QR7JX9TEODY
 iRMg==
X-Gm-Message-State: AO0yUKXB3r0dztArQEu9GBn0pDrkoaPN6OCXphpeGryjudAQbwfC77yC
 0WgwrjmdxNlrAPsckKa8l4O6dmsE9JmHIJkl
X-Google-Smtp-Source: AK7set/n5mIn2hs9eZGp8K4QsjQ2pz2yz2KaubQUHuhod7yK/nd4WumjpzAcGfOYq9TynNozPB9g3Q==
X-Received: by 2002:a05:600c:160a:b0:3df:ffab:a391 with SMTP id
 m10-20020a05600c160a00b003dfffaba391mr1076324wmn.24.1675722966382; 
 Mon, 06 Feb 2023 14:36:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003dc59d6f2f8sm13238785wms.17.2023.02.06.14.36.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:36:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Date: Mon,  6 Feb 2023 23:35:02 +0100
Message-Id: <20230206223502.25122-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

While dozens of files include "cpu.h", only 3 files require
these NVIC helper declarations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 123 ++++++++++++++++++++++++++++++++++
 target/arm/cpu.c              |   4 +-
 target/arm/cpu.h              | 123 ----------------------------------
 target/arm/cpu_tcg.c          |   3 +
 target/arm/m_helper.c         |   3 +
 5 files changed, 132 insertions(+), 124 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 07f9c21a5f..1ca262fbf8 100644
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
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b3a2275b08..876ab8f3bf 100644
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
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a80819d8d..d623afe84a 100644
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
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ccde5080eb..df0c45e523 100644
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
index 25de64c43c..f94e87e728 100644
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
2.38.1


