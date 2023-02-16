Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DE699B05
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:15:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnI-000891-9G; Thu, 16 Feb 2023 12:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnG-00086P-0h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnD-0007qH-Jz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id l2so2593751wry.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CnzN2GsIWldMGo1Fxbr7+H5dNxnuKYX80l1WIoduxfk=;
 b=fjApAMicxtC6nPFMP1rUiyXSeFNP/xDHBhCsSUNOg7EA9pY3j5lSSMldKQfkYuVAwe
 VffWsrjz+3pbx7uFFDbkhHMy4pS1dolo3OJWKad+iUnB4gm9Xg2DejXgvdrqTeX8cYVz
 BBNmfjsiak7cU2pf6QQW2JTHcQ1agAHreo5Fz2adUCQeBnZgRARTXdXy1abHqfjdjv7S
 nD1wqY9ioqpjyjyh22J+YsWDiDKObZU2jw+wLLzv1SIOp8MzTnt+zVHx4EempJa7daoA
 RwktSMlkUPCC3u29Z9T0B6HUYJwvuw6m2LYF1gEGNn3lBI0b5UgAYBokiE5B9U7Q7skq
 M6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnzN2GsIWldMGo1Fxbr7+H5dNxnuKYX80l1WIoduxfk=;
 b=lqO096yE1CSWTfJWjnmOWd+puTI3urd8Gz+drN/gBY0dp6tbrvfl5NA/2GkYt46w8A
 GYWYdtpDKhbbUGu9BfKammdzcW0q3qpq/aE9pOxXfHt2Mn4am+WgfBkl9legVKNQuUc0
 zH3+f8BtEnVjUXDESfyMJ5Mp7lWGxWHr66lKfEsYPxk8N9A35w75bPicNFWFBesfSFpd
 iMVAC416IzPzMSKwKL/62tZT4v8xk+pKLUUvbAeWF0cTRREnzty6ekSEX1IMwNpHV++G
 PKkDA9GRfOw/G6wVEpVsK36ItH/NKTnVfwv7WHwAMy8h8SZZ9RW0Ntm81BTP6Od6mgLb
 DelA==
X-Gm-Message-State: AO0yUKXqrGVuc/b2w4eXT21V9A3rGFzsOh3mbhZWt0saRQYzHVO6Rx9+
 0j2tx0t5OArAiHKC1IPrit+qrxdnR69FQG9P
X-Google-Smtp-Source: AK7set/1ovl5bgRxseuGfmD6mxodBWUzRj48RNjiqkWGv9lMlzcx5+NUCHqpYMDDHeb6rSD/PQ8zTQ==
X-Received: by 2002:adf:ee51:0:b0:2bd:f5bd:5482 with SMTP id
 w17-20020adfee51000000b002bdf5bd5482mr4862021wro.28.1676567493848; 
 Thu, 16 Feb 2023 09:11:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] target/arm: Store CPUARMState::nvic as NVICState*
Date: Thu, 16 Feb 2023 17:11:03 +0000
Message-Id: <20230216171123.2518285-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

There is no point in using a void pointer to access the NVIC.
Use the real type to avoid casting it while debugging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230206223502.25122-11-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 46 ++++++++++++++++++++++---------------------
 hw/intc/armv7m_nvic.c | 38 ++++++++++++-----------------------
 target/arm/cpu.c      |  1 +
 target/arm/m_helper.c |  2 +-
 4 files changed, 39 insertions(+), 48 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 01f9566a1b4..9a80819d8d9 100644
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
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c3..e54553283f4 100644
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
index 5f63316dbf2..b3a2275b087 100644
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
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index b4964dca8a8..25de64c43c9 100644
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
2.34.1


