Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5403C1E92
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:43:58 +0200 (CEST)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iMn-0006YY-Um
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i61-0006WS-Vk
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:38 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5j-0001XR-WF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:37 -0400
Received: by mail-pg1-x529.google.com with SMTP id v7so8709266pgl.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 21:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HbbkfJ+bykUVMcUtfXP5XxX4C861myEUuDfLalAZI0=;
 b=bA2CT54Lu4kcSuld9DUdIeLYl7mM/2c9emyxQ3OUo5dtYApfa9ev2OGiqsMktR2YTO
 QOt3vUKJAbOtGYCjSqtgVMa0Q6xpYEIqeOJ1xXFz7Tho+BLtzVSxLx60u0OqNNjjwy6/
 DcA2UQ5kwVDIUpao3tIadXCXuBPbUOfKSYDh4InrfASe7iMclS879Qt9YGpDst+Xw9sB
 iFMioM2exSM+UMHpeFawzBwNic7T70twU1FWUPHZBxblRHLjyHilsF34O9zh8PYG/2Iz
 ta7S2IV+sT1mrMgbKU/xOSDjgpZc3dv3PfyTrp3LuZpj6yAHVz1JOaGwN7+EL0ximckI
 1VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HbbkfJ+bykUVMcUtfXP5XxX4C861myEUuDfLalAZI0=;
 b=g0YY9EflMpMcX+jSoTYAsynn487zyvC4v+i9IYix/36JjjA+Enc9m3kHxnz42g6ijy
 hUD19umN8fJvwO2iU4yNruDPgyNPe+HtdmLMrJvHV6xhR+Nd3CRjDGR1AGTRTzE3TDk0
 T0sf9HIwvN+f8onsAsDvVANv7eb7/Yc24GUpkokVxjMvJq+RWe2r5nu/7NbRCD933tg6
 H+5rhHwyFYjBNsEZvjDurptLAKdEDc3nPnD26Hjd4DS72E6WDr378OfGbsNh3KUMpDA2
 2nMg6dx6zNTdK3eNoQ36xpX3NzDaGJ0zitMywuTUQdIAUvF66oC7bO4h/ln2vzlB/QK2
 CjrA==
X-Gm-Message-State: AOAM532Z3crqdx5cI+Kh4lx/YtJ7+qlLkF1rnzDCjEwEiWWe43gJzxM1
 CRBQ+8bNtvZAcaC0UpYVD4RauvxSZD9T+g==
X-Google-Smtp-Source: ABdhPJye2O4F6nSkGVy67hgN6lR4mVGRGMNUfJK/6ODwvJ8ARHrQ4OQejLMA2znjXXmgyUbO1aaxvQ==
X-Received: by 2002:a65:5186:: with SMTP id h6mr35499502pgq.62.1625804777586; 
 Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] target/riscv: Use gpr_{src,dst} for RVD
Date: Thu,  8 Jul 2021 21:26:04 -0700
Message-Id: <20210709042608.883256-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvd.c.inc | 116 +++++++++---------------
 1 file changed, 44 insertions(+), 72 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 7e45538ae0..9bb15fdc12 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -22,14 +22,22 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -37,13 +45,21 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_temp_free(t0);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
@@ -252,11 +268,8 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_feq_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -265,11 +278,8 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_flt_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -278,11 +288,8 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fle_d(gpr_dst(ctx, a->rd), cpu_env,
+                     cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
     return true;
 }
 
@@ -291,10 +298,7 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fclass_d(gpr_dst(ctx, a->rd), cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -303,12 +307,8 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_w_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -317,12 +317,8 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_helper_fcvt_wu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -331,12 +327,8 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
     return true;
@@ -347,12 +339,8 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
 
     mark_fs_dirty(ctx);
     return true;
@@ -364,11 +352,8 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -378,11 +363,8 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_d(gpr_dst(ctx, a->rd), cpu_env, cpu_fpr[a->rs1]);
     return true;
 }
 
@@ -406,12 +388,9 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -422,12 +401,9 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, gpr_src(ctx, a->rs1));
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -439,11 +415,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     REQUIRE_EXT(ctx, RVD);
 
 #ifdef TARGET_RISCV64
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl(cpu_fpr[a->rd], gpr_src(ctx, a->rs1));
     mark_fs_dirty(ctx);
     return true;
 #else
-- 
2.25.1


