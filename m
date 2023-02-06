Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB27068C99F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA6S-0002fC-2k; Mon, 06 Feb 2023 17:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5k-0001zm-Vo
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:36:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5i-0004Rt-N1
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:36:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so11896551wrj.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXew3WIFLBzNY/R9haO5NzeKd4QdCH/e2ycwfYhObHY=;
 b=ak9v7YHiTVxHsNVl/iltQSCcCrfGeA0snuyBoVt1ceiEmzMt6x9/ky6GwlPPOu3u7I
 7z8L/lF4IKks9maHYWw/SP/HIeZDTbpqNFsT4nb5hwGbJizpuQkTqMqAigzq6D3yUenw
 C/z2GhPSD6t3uqZKapWbCC4qKsYdPAAELv/6Zavq+qAAbs76EVdp9HjZ8qMJmIsG+/WI
 IcdELmUcuTS9S895mgR3OUxYPMRHCLugx1G4gMFi1OSaOIkG3JNtdNpvZsEdbFxzI8Bk
 hqpGDylnVCzkxOrAKtEbUOEyGtbNYQyPy4igb/U9OR9cApqApb+fUwHy71DMx1s63jOf
 NmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXew3WIFLBzNY/R9haO5NzeKd4QdCH/e2ycwfYhObHY=;
 b=5mgObfFjuoolAoQM41ED+4CwJVB0lUKQFXNk9y1ur8dRr3B+mrO2TlbsfPMOBi1aSu
 aBg0jDF4FVh2lTbEOrSz5QwShhRpcDukfJSMuQqTB6lIyhwCVXD9ucjO8vTvCA0Ca2uY
 iWXZvh+OSGKiemcZC1FWN4PeSsbfFyXRBOhw8dFxx82Gj80jeoZyQEqWNKXiM46NmKNG
 L3IVyW8pn9BWYD4RbTxLrHdK+kZoLr6ZfQGfOmjZDW1Nu4de8uCcJp0miSM3sSwgTC6s
 GGDQGsla6azCKDBfcGaixKq2MPDOSwZzmyuytX1T4khFZkx3DihZ8Of2z7fZbYg4WFn1
 DWOQ==
X-Gm-Message-State: AO0yUKVaRXWZgVeXRkfj4ZTUl2TMbnixIYCa4W02DM6Vf1WQmBgDwNJU
 gmZQu+iOhNa52+CHKKl3Yui1CBjYmq99Yibp
X-Google-Smtp-Source: AK7set8DAo/U6HdemeZiZB0x2iJDAizL3/kBR/gG6E61+1rgbbhLuQwcTJ20rPLtTmL2DTyxpVaQsw==
X-Received: by 2002:a5d:47cc:0:b0:2c3:be89:7c2a with SMTP id
 o12-20020a5d47cc000000b002c3be897c2amr13614132wrc.13.1675722959101; 
 Mon, 06 Feb 2023 14:35:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfdb91000000b002bdd96d88b4sm9937430wri.75.2023.02.06.14.35.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/11] target/arm: Store CPUARMState::nvic as NVICState*
Date: Mon,  6 Feb 2023 23:35:01 +0100
Message-Id: <20230206223502.25122-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There is no point in using a void pointer to access the NVIC.
Use the real type to avoid casting it while debugging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/armv7m_nvic.c | 38 ++++++++++++-----------------------
 target/arm/cpu.c      |  1 +
 target/arm/cpu.h      | 46 ++++++++++++++++++++++---------------------
 target/arm/m_helper.c |  2 +-
 4 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..e54553283f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -389,7 +389,7 @@ static inline int nvic_exec_prio(NVICState *s)
     return MIN(running, s->exception_prio);
 }
 
-bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
 {
     /* Return true if the requested execution priority is negative
      * for the specified security state, ie that security state
@@ -399,8 +399,6 @@ bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
      * mean we don't allow FAULTMASK_NS to actually make the execution
      * priority negative). Compare pseudocode IsReqExcPriNeg().
      */
-    NVICState *s = opaque;
-
     if (s->cpu->env.v7m.faultmask[secure]) {
         return true;
     }
@@ -418,17 +416,13 @@ bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
     return false;
 }
 
-bool armv7m_nvic_can_take_pending_exception(void *opaque)
+bool armv7m_nvic_can_take_pending_exception(NVICState *s)
 {
-    NVICState *s = opaque;
-
     return nvic_exec_prio(s) > nvic_pending_prio(s);
 }
 
-int armv7m_nvic_raw_execution_priority(void *opaque)
+int armv7m_nvic_raw_execution_priority(NVICState *s)
 {
-    NVICState *s = opaque;
-
     return s->exception_prio;
 }
 
@@ -506,9 +500,8 @@ static void nvic_irq_update(NVICState *s)
  * if @secure is true and @irq does not specify one of the fixed set
  * of architecturally banked exceptions.
  */
-static void armv7m_nvic_clear_pending(void *opaque, int irq, bool secure)
+static void armv7m_nvic_clear_pending(NVICState *s, int irq, bool secure)
 {
-    NVICState *s = (NVICState *)opaque;
     VecInfo *vec;
 
     assert(irq > ARMV7M_EXCP_RESET && irq < s->num_irq);
@@ -666,17 +659,17 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
     }
 }
 
-void armv7m_nvic_set_pending(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure)
 {
-    do_armv7m_nvic_set_pending(opaque, irq, secure, false);
+    do_armv7m_nvic_set_pending(s, irq, secure, false);
 }
 
-void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure)
 {
-    do_armv7m_nvic_set_pending(opaque, irq, secure, true);
+    do_armv7m_nvic_set_pending(s, irq, secure, true);
 }
 
-void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure)
 {
     /*
      * Pend an exception during lazy FP stacking. This differs
@@ -684,7 +677,6 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
      * whether we should escalate depends on the saved context
      * in the FPCCR register, not on the current state of the CPU/NVIC.
      */
-    NVICState *s = (NVICState *)opaque;
     bool banked = exc_is_banked(irq);
     VecInfo *vec;
     bool targets_secure;
@@ -773,9 +765,8 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
 }
 
 /* Make pending IRQ active.  */
-void armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(NVICState *s)
 {
-    NVICState *s = (NVICState *)opaque;
     CPUARMState *env = &s->cpu->env;
     const int pending = s->vectpending;
     const int running = nvic_exec_prio(s);
@@ -814,10 +805,9 @@ static bool vectpending_targets_secure(NVICState *s)
         exc_targets_secure(s, s->vectpending);
 }
 
-void armv7m_nvic_get_pending_irq_info(void *opaque,
+void armv7m_nvic_get_pending_irq_info(NVICState *s,
                                       int *pirq, bool *ptargets_secure)
 {
-    NVICState *s = (NVICState *)opaque;
     const int pending = s->vectpending;
     bool targets_secure;
 
@@ -831,9 +821,8 @@ void armv7m_nvic_get_pending_irq_info(void *opaque,
     *pirq = pending;
 }
 
-int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure)
 {
-    NVICState *s = (NVICState *)opaque;
     VecInfo *vec = NULL;
     int ret = 0;
 
@@ -915,7 +904,7 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
     return ret;
 }
 
-bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure)
 {
     /*
      * Return whether an exception is "ready", i.e. it is enabled and is
@@ -926,7 +915,6 @@ bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
      * for non-banked exceptions secure is always false; for banked exceptions
      * it indicates which of the exceptions is required.
      */
-    NVICState *s = (NVICState *)opaque;
     bool banked = exc_is_banked(irq);
     VecInfo *vec;
     int running = nvic_exec_prio(s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..b3a2275b08 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -36,6 +36,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/intc/armv7m_nvic.h"
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 01f9566a1b..9a80819d8d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -227,6 +227,8 @@ typedef struct CPUARMTBFlags {
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 
+typedef struct NVICState NVICState;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -768,7 +770,7 @@ typedef struct CPUArchState {
     } sau;
 
 #if !defined(CONFIG_USER_ONLY)
-    void *nvic;
+    NVICState *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
@@ -2559,16 +2561,16 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 
 /* Interface between CPU and Interrupt controller.  */
 #ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_can_take_pending_exception(void *opaque);
+bool armv7m_nvic_can_take_pending_exception(NVICState *s);
 #else
-static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
+static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
 {
     return true;
 }
 #endif
 /**
  * armv7m_nvic_set_pending: mark the specified exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2578,10 +2580,10 @@ static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
  * if @secure is true and @irq does not specify one of the fixed set
  * of architecturally banked exceptions.
  */
-void armv7m_nvic_set_pending(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_set_pending_derived: mark this derived exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2591,10 +2593,10 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure);
  * exceptions (exceptions generated in the course of trying to take
  * a different exception).
  */
-void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2603,11 +2605,11 @@ void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure);
  * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
  * generated in the course of lazy stacking of FP registers.
  */
-void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_get_pending_irq_info: return highest priority pending
  *    exception, and whether it targets Secure state
- * @opaque: the NVIC
+ * @s: the NVIC
  * @pirq: set to pending exception number
  * @ptargets_secure: set to whether pending exception targets Secure
  *
@@ -2617,20 +2619,20 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure);
  * to true if the current highest priority pending exception should
  * be taken to Secure state, false for NS.
  */
-void armv7m_nvic_get_pending_irq_info(void *opaque, int *pirq,
+void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
                                       bool *ptargets_secure);
 /**
  * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
- * @opaque: the NVIC
+ * @s: the NVIC
  *
  * Move the current highest priority pending exception from the pending
  * state to the active state, and update v7m.exception to indicate that
  * it is the exception currently being handled.
  */
-void armv7m_nvic_acknowledge_irq(void *opaque);
+void armv7m_nvic_acknowledge_irq(NVICState *s);
 /**
  * armv7m_nvic_complete_irq: complete specified interrupt or exception
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to complete
  * @secure: true if this exception was secure
  *
@@ -2639,10 +2641,10 @@ void armv7m_nvic_acknowledge_irq(void *opaque);
  *           0 if there is still an irq active after this one was completed
  * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
  */
-int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure);
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2653,28 +2655,28 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure);
  * interrupt the current execution priority. This controls whether the
  * RDY bit for it in the FPCCR is set.
  */
-bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure);
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_raw_execution_priority: return the raw execution priority
- * @opaque: the NVIC
+ * @s: the NVIC
  *
  * Returns: the raw execution priority as defined by the v8M architecture.
  * This is the execution priority minus the effects of AIRCR.PRIS,
  * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
  * (v8M ARM ARM I_PKLD.)
  */
-int armv7m_nvic_raw_execution_priority(void *opaque);
+int armv7m_nvic_raw_execution_priority(NVICState *s);
 /**
  * armv7m_nvic_neg_prio_requested: return true if the requested execution
  * priority is negative for the specified security state.
- * @opaque: the NVIC
+ * @s: the NVIC
  * @secure: the security state to test
  * This corresponds to the pseudocode IsReqExecPriNeg().
  */
 #ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure);
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
 #else
-static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
 {
     return false;
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index b4964dca8a..25de64c43c 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1015,7 +1015,7 @@ static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
      * that we will need later in order to do lazy FP reg stacking.
      */
     bool is_secure = env->v7m.secure;
-    void *nvic = env->nvic;
+    NVICState *nvic = env->nvic;
     /*
      * Some bits are unbanked and live always in fpccr[M_REG_S]; some bits
      * are banked and we want to update the bit in the bank for the
-- 
2.38.1


