Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA150B5CF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:59:42 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhr0n-0006fG-DB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAG-0005UH-RT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAF-0002uS-38
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so10279489wrg.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HIzaTyax7/dChL1AhyXtTDs+LrJvN7HbLgBA7vTKI7g=;
 b=viCv7oilKeYVF3fhng/AiCWzKd1ICm4GTvOxTq3pEWT7+fBHYUtPcAiwRQzjKOwv1V
 r/3ihHxwgJ7RPTRh9vpUvie807bFEs8anub7F9HFPry036QQvCIRAyWcPMmKw21uZSka
 mChaERItIPwMxKpU3n7PLLuOD6eCxw28jeWu/kL3dVVpE4SdcnTB6WI7XbTcrXI9OvFE
 9joRl73CbwxBG894jP/wBWC4ghjsmt2+8E8vSxiJq7QdIXndHxd0fQcJ4pI3fBFicgYG
 A+iXOzttlRdlYo1lUUBtCYKv0Opihak/xdJMsNm9RHAnx/FnJ+XqRD24LyUmek8T3L+m
 GOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HIzaTyax7/dChL1AhyXtTDs+LrJvN7HbLgBA7vTKI7g=;
 b=hHFpX54YoYQD8QVup1MJu04kl4zZSLH2IBhvI6CXajU/tCEJklZpzmNZOoMfiXGInx
 X/qUkSHmwZsXLZXy0tVecKNo6R99AKXVHQQPdZgYdm6aBXPYrqX+O6U7q4yexwTfOwlO
 yCFiwxI9ExDMqmYFbYMEPNw9jJB/Hp8OjBj4T0fUWm+pDuvVTF5Q5+RDxXSPsxV8Vm60
 4RG5DBmc2u4PuCFBLPDugEyUxcjQ8bBT2sLtU4Pj82j1WwgLZPkhKud5UozBEQV1vCup
 xRARr4KuRz6w0cVb24xCtQ2dAO+2Zo04qf0fisGEoFGl+kKUborX3lDzlA7Nbv9Q7TTg
 go9g==
X-Gm-Message-State: AOAM533+hBitcPrVyHVd99Vfh/64N2514prclRybSOPvqgCrHiK6rof+
 /51fH710ADLPfgKzpIJBPbAiC2j/UwSn2g==
X-Google-Smtp-Source: ABdhPJzgn9auCYsCxjPfJT8H2ns4IepYOnR7fI6ik3BNMYcYVo79nL2ZKF8h2tEwl0KPJiYpiSu1ww==
X-Received: by 2002:adf:c547:0:b0:207:9abc:cfa1 with SMTP id
 s7-20020adfc547000000b002079abccfa1mr3000657wrf.390.1650621921127; 
 Fri, 22 Apr 2022 03:05:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/61] target/arm: Change CPUArchState.thumb to bool
Date: Fri, 22 Apr 2022 11:04:20 +0100
Message-Id: <20220422100432.2288247-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Bool is a more appropriate type for this value.
Adjust the assignments to use true/false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h          | 2 +-
 linux-user/arm/cpu_loop.c | 2 +-
 target/arm/cpu.c          | 2 +-
 target/arm/m_helper.c     | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31e46709277..d2a34f6ea8a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -260,6 +260,7 @@ typedef struct CPUArchState {
      */
     uint32_t pstate;
     bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
+    bool thumb;   /* True if CPU is in thumb mode; cpsr[5] */
 
     /* Cached TBFLAGS state.  See below for which bits are included.  */
     CPUARMTBFlags hflags;
@@ -286,7 +287,6 @@ typedef struct CPUArchState {
     uint32_t ZF; /* Z set if zero.  */
     uint32_t QF; /* 0 or 1 */
     uint32_t GE; /* cpsr[19:16] */
-    uint32_t thumb; /* cpsr[5]. 0 = arm mode, 1 = thumb mode. */
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
     uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
     uint64_t daif; /* exception masks, in the bits they are in PSTATE */
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 3268e5f1f1f..d950409d5b0 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -230,7 +230,7 @@ do_kernel_trap(CPUARMState *env)
     /* Jump back to the caller.  */
     addr = env->regs[14];
     if (addr & 1) {
-        env->thumb = 1;
+        env->thumb = true;
         addr &= ~1;
     }
     env->regs[15] = addr;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7e9f7d146df..e3f82152035 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -51,7 +51,7 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 
     if (is_a64(env)) {
         env->pc = value;
-        env->thumb = 0;
+        env->thumb = false;
     } else {
         env->regs[15] = value & ~1;
         env->thumb = value & 1;
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index b7a0fe01141..a740c3e160f 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -564,7 +564,7 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
         env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     }
     switch_v7m_security_state(env, dest & 1);
-    env->thumb = 1;
+    env->thumb = true;
     env->regs[15] = dest & ~1;
     arm_rebuild_hflags(env);
 }
@@ -590,7 +590,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
          * except that the low bit doesn't indicate Thumb/not.
          */
         env->regs[14] = nextinst;
-        env->thumb = 1;
+        env->thumb = true;
         env->regs[15] = dest & ~1;
         return;
     }
@@ -626,7 +626,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     }
     env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, 0);
-    env->thumb = 1;
+    env->thumb = true;
     env->regs[15] = dest;
     arm_rebuild_hflags(env);
 }
-- 
2.25.1


