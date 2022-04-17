Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C8504880
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:56:34 +0200 (CEST)
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng8CP-000454-R5
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87c-0005k5-Eq
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:36 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng87a-00047U-MZ
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:51:36 -0400
Received: by mail-pl1-x631.google.com with SMTP id j8so10660201pll.11
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naR2eFj1gZQAaPBt5KmEgyX1GlThDsKfICGoukXVXDw=;
 b=AevFL9O3ff2ZVoT+xg9gRaIx4Y6nHbODJW+eHZKIyEIjq4bL84zkaCnbPl/DJ6PqC/
 KiC3YgRpH2UIxNmhAi01E8gpbb21WvWYhD81nnVE0CBha6Oqr/w1mzjFfjJP6TUhlbjQ
 c6KaxMkXlsEDo+U6Ao7HZxGIwxdzDxBJp/8GNqNRlQVDNCnhbYfEE3QNZdkgmMnHw3bz
 5+Xr7iAnmxUSiUbG2aP+n1dVFpUrtqqaqCf33VliECOSfsEet4mu8oWnzasd914jkJym
 Pua1EFhtVqnb8Peuycyf0HeMrzxts7IzqbU94wf43sx9uWZZUeN0FaH9MT9Ux7XzFFtD
 3Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naR2eFj1gZQAaPBt5KmEgyX1GlThDsKfICGoukXVXDw=;
 b=EpIshP0xUR5Qx0mRkrptCzZyZdNzTY+pjoAuMxEk0A/s0KKxvGrzdLqrBEeTO57/4U
 EYr6Kh9PRYuDRhpGYMifhMFog+9aiWTnx5hSj8/Yrx4oTFmDTQy2lhWn6gzrHVGUVFvP
 7+vIkyTA1GrissbV6fIFpR9eJHFBGV+aE12j7xsyJRbJRJ7s7UOYrOsP9JxV98edfvv+
 KMR/l3wNg/uy3QfN3IwrY0OHUeTrntl3MnX0FPT0YVm+bq09BmBMBd/rRvl35aum37ky
 PrAWxVfmruZkpfLXYqtOI0mZcHH+S/4aDr/UDVflIp/eZQN968K7Zmq8+ZgvmqYtGXVC
 gOcw==
X-Gm-Message-State: AOAM531EO/fWRHvIL3HOoyGa5SeKZ61v+dmmLo0PC26E3hq/XWbqnQug
 PePKjANcjX/rjnBEdDjLAVA/2Z7ulfW6Sw==
X-Google-Smtp-Source: ABdhPJw9mcyFOzpc7dDXFIZB4yf9YB1GmC4mDuK20zPLNVLiOWOwfY2bDO2h7JPpfpjPtdGKWB5MIQ==
X-Received: by 2002:a17:902:ccd1:b0:154:359:7e17 with SMTP id
 z17-20020a170902ccd100b0015403597e17mr7718430ple.42.1650214293404; 
 Sun, 17 Apr 2022 09:51:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 f3-20020a17090aa78300b001ca7dfab2e4sm10395396pjq.25.2022.04.17.09.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 09:51:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/rx: Store PSW.U in tb->flags
Date: Sun, 17 Apr 2022 09:51:28 -0700
Message-Id: <20220417165130.695085-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417165130.695085-1-richard.henderson@linaro.org>
References: <20220417165130.695085-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: i@yvt.jp, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With this, we don't need movcond to determine
which stack pointer is current.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.h       |  1 +
 target/rx/translate.c | 42 +++++++++++++++++++++++-------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index b4abd90ccd..5e285401e8 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -148,6 +148,7 @@ static inline void cpu_get_tb_cpu_state(CPURXState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
     *flags = FIELD_DP32(0, PSW, PM, env->psw_pm);
+    *flags = FIELD_DP32(*flags, PSW, U, env->psw_u);
 }
 
 static inline int cpu_mmu_index(CPURXState *env, bool ifetch)
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 785cbd948e..586342eae7 100644
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
2.25.1


