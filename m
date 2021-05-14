Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB3380CC6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:21:53 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZdQ-0003XO-QV
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVm-0005dl-Rc
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:58 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVl-0006zR-54
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:58 -0400
Received: by mail-qt1-x831.google.com with SMTP id j19so22404987qtp.7
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZCJZnOvUMNE0qy2IulksaCfOnCxApd0kxm0gx80hBSc=;
 b=Q1XR/5DxXgNAs3AqjraqMrqLh9uSYa6Irbe1bcDid18rapsxkI2+5G+g6+dS2VjPxp
 tCySs1DmdiOQ4HobyB2kKHhBqanIBV/MBEQiyOGuXs45A2hxY6e2onLRzMng90h02q7t
 HN86uVc03CWoLtaQarS7diyBniecYVseMisDrXDmeX8t1xoc1gJaMXIhP2rRJh36rX1x
 mAcogo35YjIuc+Ra7/Xv/vV3LLsSU4ppXjN0fW0X3m/R+mPU4HGM7tpbl/duoiLYqbJG
 Hf4fCuTRm5i6YDew+RLoySJRL0AND+TPzty74cGoxgwOZE2tfqRY2Fb+mC3YGuDPX5vP
 0tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZCJZnOvUMNE0qy2IulksaCfOnCxApd0kxm0gx80hBSc=;
 b=bok2ANP6dOs+bkTuq3SCPnoWEdq5q9eIu2ZEIAvWuwVwxxEjLOKRGPo7g06MqeZxsM
 6xt8fz6lg4+CKlf/0/PIuubn+/Pnq+B/1fnc3wKVnu+QWCpF5pP/3zeCvKvotHIcKvbv
 IJw3FuKv6Hd+hkVsbFjrN4GtdSM8piHWuMKGWfNTy09oYGvbQnUxNO1uS8S8HfthH4tX
 X/UxeBBNKgf2GE2Qc0pVRs7vOT6pLw4z4y6ChWT/dl5FthyYEOt9B0TjMMTEJmjVdkGc
 n+Rvi/dDq2uWvAOjGvhmFaM1sP0PuS/49w78kKv97hLap/qHZlbbjJcqtZwz1itQISsC
 e7WA==
X-Gm-Message-State: AOAM532sdoUvWrmy6W3uo0RyPSShqLG2AU9bYvSBqg+PvVilXjpp4LvW
 KMZTQinCVvTaZNTmI0tyGYZoK4pl/jKZOvbJC+c=
X-Google-Smtp-Source: ABdhPJw7RyKHMScbJfYaSKuI+yX31pwfYHNYHoGlPMRlfCXlJnmdDiWXizTfKOgNy118KCO3n49uMw==
X-Received: by 2002:a05:622a:138b:: with SMTP id
 o11mr42416234qtk.170.1621005236256; 
 Fri, 14 May 2021 08:13:56 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/50] target/i386: Assert LMA for x86_64 user-only
Date: Fri, 14 May 2021 10:13:05 -0500
Message-Id: <20210514151342.384376-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LMA is a pre-requisite for CODE64, so there is no way to disable it
for x86_64-linux-user, and there is no way to enable it for i386.

Since we're adding an accessor macro, pull the value directly out
of flags when we're not assuming a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e3907f9066..9c8a405694 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -99,7 +99,6 @@ typedef struct DisasContext {
 #endif
 
 #ifdef TARGET_X86_64
-    int lma;    /* long mode active */
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
@@ -164,10 +163,13 @@ typedef struct DisasContext {
 #endif
 #if !defined(TARGET_X86_64)
 #define CODE64(S) false
+#define LMA(S)    false
 #elif defined(CONFIG_USER_ONLY)
 #define CODE64(S) true
+#define LMA(S)    true
 #else
 #define CODE64(S) (((S)->flags & HF_CS64_MASK) != 0)
+#define LMA(S)    (((S)->flags & HF_LMA_MASK) != 0)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -7295,7 +7297,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
             /* condition codes are modified only in long mode */
-            if (s->lma) {
+            if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             /* TF handling for the sysret insn is different. The TF bit is
@@ -8503,6 +8505,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
     g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
+    g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
@@ -8521,9 +8524,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-#ifdef TARGET_X86_64
-    dc->lma = (flags >> HF_LMA_SHIFT) & 1;
-#endif
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
     /* Do not optimize repz jumps at all in icount mode, because
-- 
2.25.1


