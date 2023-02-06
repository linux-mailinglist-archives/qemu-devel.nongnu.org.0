Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD6468BCA8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0Rk-0000e1-Lf; Mon, 06 Feb 2023 07:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Rf-0000Vj-Eb
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:03 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Rc-0005og-Tf
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:18:03 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so10142398wrz.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPKeeXf/qfQjoYgn7xRgNGOMBlz5IgFTpgVgpA92h0k=;
 b=U4/N7ra/Bq4fdhYnLEf5mU2pvl37+y+ESzQwqPyAJNTITUWNwc6jRXn+FWmQjl1C5R
 rNf5I9hAFnoKRzoW/9TO8VFCt160uGjE0sxNQQAjA/itt0QxJou9c1cS0DXIDgx8SvBv
 2Dcttr+QQIecEss4nKFaomQayX3O+OddvNsVrG4lDtSCFf0HorlawJLkkCqLgAOtA+6x
 SPWk6J16Fw6AW9ZaOYzHX3tv4tjXEybojTaIfCtFWPRFvDdYN+vb4Kiiv9KTi71ZpxQQ
 JZzMnya7YB+5Zrk7lsrvBg1++wTrIJAdv5Oh9nXMpK/qrsvlAM0818MT/9c2wbUzYClj
 A2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPKeeXf/qfQjoYgn7xRgNGOMBlz5IgFTpgVgpA92h0k=;
 b=7pWKiurTzI2GnUHCLjuCt8e+H27S7BFFUNApR8gE5VwnRKKnYp6mHAqLoiPbpjEgAY
 1GR62dt0+R5vPMBxr0XoMj2yB3cnTooSrp54yz+CXPyKUSz7BT5SB92sfIiEECeM9+DL
 kNnsSYodDW43Ow+1BKqKy/bpE2Unmar9UQ8IA/1qkx1VadPd7/1I019TfloMSDnIJxrR
 LVPJ0EjGN/R4aF7U/gG4s/kTEY+8tf+TW2ihQAWz4K1piOgynMep5aSfXpr0ieqqlB7B
 cwkBaialjwcl2UXUwJiX+P9vD6g2vd5zOHyfeu/Ayt8QE9cLK48cFCkOPtNPVAKCSpZF
 6htg==
X-Gm-Message-State: AO0yUKVgStK2tKo0E5rjHUBrA1ErEIrVGQ2b7KBahzE3wrP0AkZzKEbZ
 w3lsGE7vMNBtOV1N6eHqkXnFDhyCaSaughS0
X-Google-Smtp-Source: AK7set+ooDYS5hN66ldLVl3zlSiJSeLI5wm4edUa+t4j2mgbNe2accjIWfiOKMec3ZbjhkIabx5ddg==
X-Received: by 2002:adf:db01:0:b0:2c3:b47c:a0d9 with SMTP id
 s1-20020adfdb01000000b002c3b47ca0d9mr15377753wri.50.1675685879869; 
 Mon, 06 Feb 2023 04:17:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b002c3e94cb757sm2591019wrw.117.2023.02.06.04.17.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/9] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Date: Mon,  6 Feb 2023 13:17:12 +0100
Message-Id: <20230206121714.85084-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
index 683e186599..a6543c2153 100644
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
index f73d3f2264..4dcb594a6b 100644
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


