Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5650A77E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:54:34 +0200 (CEST)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb0j-0001aX-Jk
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeN-0000BC-Om
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:27 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeM-0002vj-09
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:27 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so5630936pfm.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZwRb4fahw0JrRJgExptSGtesafOl/Y4v5cGBspLojo=;
 b=ZukOyKXkcZPv8qAGcMpDacqwgxIt/XNeWefE9cAj1EW+Se44FoIX9JMBAOAI/kpvOd
 UOry7JHFCaaascd5hTs8svfDHRHofEiSCDijq5KR/yAlny+oU4GCwvTH+pS6j+7K8MgH
 2yOVHG4aXOQeijHfx7oRVp7WdlJKAa9RBL0ya6Jxpa7cLzOVXmOqCycZx8oSGdpxAseW
 iwym+KjKLvch3PuTD4uHWOQPjjyFyqmQhkiXV2aVoxiKa5cjnBmr9VSm0lYJJzwHsFHS
 KLycWhGvj67jy/QvOUKIHaIkUOwk48e9TwRZo3XO/t02Uuuz2iAsI3TP46d5Xx61+el9
 B/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZwRb4fahw0JrRJgExptSGtesafOl/Y4v5cGBspLojo=;
 b=XW4TBotjFnGi0TTlCvhnUFoDDowqiJnGSF/PkgY0GMjN5V7AGAX6z/TaMbyhXSYWcZ
 BYX9c09GILy2RHU+0qv+3+qhwDLGAuVIXHIz0560grZC1ZR9wSfh7I/Oll75dbRqD8AA
 Km7h6HHpsGdXgZSnNe6YsnfZ1iOOzehF2E3SNMeL0afzViC7TAgnxuSB/JgStbIZgYtN
 YWFkIuYGAMy9Y2SYRbJq3ViUaQZBtoPcdeky3k9XhH1kz/Qzu6ZjLfFVCODdbxaqaYGJ
 nQEJHpdVc9yjADTC/ZG5e6IRYFlb77M41zP0ugb+H0Cl8+rx/F+utfsHxceMNbCx8DnU
 xLiQ==
X-Gm-Message-State: AOAM530bARJ4vZFarkRfZyC2m760JEr92RJwGJpyIs23TCS6vsjEvoxG
 VchkefnPLQWDVj0nB1tAQvHqUYjzyKtWfCTn
X-Google-Smtp-Source: ABdhPJxc5e9YSQmDw5NNDSQM0+s8ocrxzoZgjV4xfftVWw2w1ib8PxG67wKksgS74f+avtnKfW2DMQ==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id
 q16-20020a056a00089000b004f6686ea8a9mr661596pfj.83.1650562283473; 
 Thu, 21 Apr 2022 10:31:23 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] target/rx: Store PSW.U in tb->flags
Date: Thu, 21 Apr 2022 10:31:09 -0700
Message-Id: <20220421173114.48357-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With this, we don't need movcond to determine
which stack pointer is current.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20220417165130.695085-3-richard.henderson@linaro.org>
---
 target/rx/cpu.h       |  1 +
 target/rx/translate.c | 42 +++++++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 1c267f83bf..5655dffeff 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -149,6 +149,7 @@ static inline void cpu_get_tb_cpu_state(CPURXState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
     *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
+    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
 }
 
 static inline int cpu_mmu_index(CPURXState *env, bool ifetch)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index c9db16553b..df7a8e5153 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -311,9 +311,8 @@ static void psw_cond(DisasCompare *dc, uint32_t cond)
     }
 }
 
-static void move_from_cr(TCGv ret, int cr, uint32_t pc)
+static void move_from_cr(DisasContext *ctx, TCGv ret, int cr, uint32_t pc)
 {
-    TCGv z = tcg_const_i32(0);
     switch (cr) {
     case 0:     /* PSW */
         gen_helper_pack_psw(ret, cpu_env);
@@ -322,8 +321,11 @@ static void move_from_cr(TCGv ret, int cr, uint32_t pc)
         tcg_gen_movi_i32(ret, pc);
         break;
     case 2:     /* USP */
-        tcg_gen_movcond_i32(TCG_COND_NE, ret,
-                            cpu_psw_u, z, cpu_sp, cpu_usp);
+        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+            tcg_gen_mov_i32(ret, cpu_sp);
+        } else {
+            tcg_gen_mov_i32(ret, cpu_usp);
+        }
         break;
     case 3:     /* FPSW */
         tcg_gen_mov_i32(ret, cpu_fpsw);
@@ -335,8 +337,11 @@ static void move_from_cr(TCGv ret, int cr, uint32_t pc)
         tcg_gen_mov_i32(ret, cpu_bpc);
         break;
     case 10:    /* ISP */
-        tcg_gen_movcond_i32(TCG_COND_EQ, ret,
-                            cpu_psw_u, z, cpu_sp, cpu_isp);
+        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+            tcg_gen_mov_i32(ret, cpu_isp);
+        } else {
+            tcg_gen_mov_i32(ret, cpu_sp);
+        }
         break;
     case 11:    /* FINTV */
         tcg_gen_mov_i32(ret, cpu_fintv);
@@ -350,28 +355,27 @@ static void move_from_cr(TCGv ret, int cr, uint32_t pc)
         tcg_gen_movi_i32(ret, 0);
         break;
     }
-    tcg_temp_free(z);
 }
 
 static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
 {
-    TCGv z;
     if (cr >= 8 && !is_privileged(ctx, 0)) {
         /* Some control registers can only be written in privileged mode. */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "disallow control register write %s", rx_crname(cr));
         return;
     }
-    z = tcg_const_i32(0);
     switch (cr) {
     case 0:     /* PSW */
         gen_helper_set_psw(cpu_env, val);
         break;
     /* case 1: to PC not supported */
     case 2:     /* USP */
-        tcg_gen_mov_i32(cpu_usp, val);
-        tcg_gen_movcond_i32(TCG_COND_NE, cpu_sp,
-                            cpu_psw_u, z,  cpu_usp, cpu_sp);
+        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+            tcg_gen_mov_i32(cpu_sp, val);
+        } else {
+            tcg_gen_mov_i32(cpu_usp, val);
+        }
         break;
     case 3:     /* FPSW */
         gen_helper_set_fpsw(cpu_env, val);
@@ -383,10 +387,11 @@ static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
         tcg_gen_mov_i32(cpu_bpc, val);
         break;
     case 10:    /* ISP */
-        tcg_gen_mov_i32(cpu_isp, val);
-        /* if PSW.U is 0, copy isp to r0 */
-        tcg_gen_movcond_i32(TCG_COND_EQ, cpu_sp,
-                            cpu_psw_u, z,  cpu_isp, cpu_sp);
+        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+            tcg_gen_mov_i32(cpu_isp, val);
+        } else {
+            tcg_gen_mov_i32(cpu_sp, val);
+        }
         break;
     case 11:    /* FINTV */
         tcg_gen_mov_i32(cpu_fintv, val);
@@ -399,7 +404,6 @@ static void move_to_cr(DisasContext *ctx, TCGv val, int cr)
                       "Unimplement control register %d", cr);
         break;
     }
-    tcg_temp_free(z);
 }
 
 static void push(TCGv val)
@@ -683,7 +687,7 @@ static bool trans_PUSHC(DisasContext *ctx, arg_PUSHC *a)
 {
     TCGv val;
     val = tcg_temp_new();
-    move_from_cr(val, a->cr, ctx->pc);
+    move_from_cr(ctx, val, a->cr, ctx->pc);
     push(val);
     tcg_temp_free(val);
     return true;
@@ -2221,7 +2225,7 @@ static bool trans_MVTC_r(DisasContext *ctx, arg_MVTC_r *a)
 /* mvfc rs, rd */
 static bool trans_MVFC(DisasContext *ctx, arg_MVFC *a)
 {
-    move_from_cr(cpu_regs[a->rd], a->cr, ctx->pc);
+    move_from_cr(ctx, cpu_regs[a->rd], a->cr, ctx->pc);
     return true;
 }
 
-- 
2.34.1


