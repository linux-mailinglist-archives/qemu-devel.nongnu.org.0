Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B88751078F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:51:22 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQHR-0002zO-Hk
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPma-0002Zv-Kp
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:28 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmZ-0004Pf-0G
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:28 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so18710784pfb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8f+qzpvdgvny2fiqiDe7wZJGOpE02k47NFtBiJd8Y4=;
 b=j4lpQpYKJsrOYcVTMVMWT5kSaARuKEBBvutNWWdBhuSpPZAnbYKRVDDwA7P3jzRyjz
 fAUU+o8uU7eWWmbbusHF8uja9Qg400U3wRmd7gAYbth0my0s+VHW7lmcMebIdZtjrIHq
 aTrn+46lLe1hHU4x4WCdG/JGsvHsrE5tNdE+MrWsMVqw3kBOL+NaGTuNgU2feIOuNN95
 p9Uc9ubtKemusQimeqNd80nQbvE8goONGEjPRMwf1WR7ta9B4iQKYRZ3hKiiOQkhh3ON
 YMI4ctCBBFxBaTnnvFUc3yYx0QpLNDT5Vpr3Qj609ylZHLzaAcOMCrIeX+GdSSriRj1y
 31Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8f+qzpvdgvny2fiqiDe7wZJGOpE02k47NFtBiJd8Y4=;
 b=uhFtOr4qoRXfg2FVEYh68hDetokT/xf+iHEyJEIdArbG49p84bipwxFpNx3sbmagdZ
 kXuFgijEXrkqtCQB/ZKMAoAdvYJVGPFXqV9ajzJ8Fiasqw7L9g3rV0jCWAnFehwxoY+M
 blf4uzVMJYX6VDw9hlJLhONSvzOaQm/pXZ4l5hZrG6nunwjgyVzD0usYpiTS8qpAPzP9
 hJdZxfJnl5nyOiGxcsv0VNCxbMNR+x5jsPSu0NvWr5icKggfy6jS79kFGO1rm9jcVrSj
 9w0WxTi+VaxRxS4jIZmV+dGUawUIUEnem3zvML+tAR68mHRin5dDUGbRap+jNmAHcpQd
 pQ3w==
X-Gm-Message-State: AOAM531LHQSqYW0pdYRR/kS1q6fDhysByOIVh9APY4JQd3NARW3d6lVe
 JrcLH5/euzMtzds9Q98SGMKfYiMOWaGY+g==
X-Google-Smtp-Source: ABdhPJz7vjOtwTZcOcFuMsrtPwAVAC12V2xkoJQz6QaW5GQtpsaD1VEA0s9tu5OOOPQw4hXwQpoSqA==
X-Received: by 2002:a05:6a00:1695:b0:4f7:decc:506b with SMTP id
 k21-20020a056a00169500b004f7decc506bmr25598364pfc.7.1650997165638; 
 Tue, 26 Apr 2022 11:19:25 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/68] target/nios2: Do not create TCGv for control registers
Date: Tue, 26 Apr 2022 11:18:18 -0700
Message-Id: <20220426181907.103691-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to reference them often, and when we do it
is just as easy to load/store from cpu_env directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-20-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3694f2503b..6c739bfa5e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,7 +103,7 @@ typedef struct DisasContext {
     int               mem_idx;
 } DisasContext;
 
-static TCGv cpu_R[NUM_CORE_REGS];
+static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
 
 typedef struct Nios2Instruction {
@@ -394,7 +394,11 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_ESTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -420,7 +424,11 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_BSTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -463,6 +471,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
+    TCGv t1, t2;
 
     if (!gen_check_supervisor(dc)) {
         return;
@@ -482,10 +491,19 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
          * must perform the AND here, and anywhere else we need the
          * guest value of ipending.
          */
-        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        t1 = tcg_temp_new();
+        t2 = tcg_temp_new();
+        tcg_gen_ld_tl(t1, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IPENDING]));
+        tcg_gen_ld_tl(t2, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IENABLE]));
+        tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
+        tcg_temp_free(t1);
+        tcg_temp_free(t2);
         break;
     default:
-        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
+        tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 }
@@ -522,7 +540,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         dc->base.is_jmp = DISAS_UPDATE;
         /* fall through */
     default:
-        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
+        tcg_gen_st_tl(v, cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 #endif
@@ -910,7 +929,7 @@ void nios2_tcg_init(void)
 {
     int i;
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
+    for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
-- 
2.34.1


