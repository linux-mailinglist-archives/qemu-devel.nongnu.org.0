Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7993EF50D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 23:33:59 +0200 (CEST)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG6ic-0002tc-3x
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 17:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6To-00022m-9C
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tm-0001LD-AG
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 17:18:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id n5so1235833pjt.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WE6KUcvw6WH5aqC+O3Z+JfyzFtqYoqz6RBVibYz4rz0=;
 b=JozkpoRegI5Uy9dPFNUE4HxmybncFcSeMk/3Mx5yZBtxDWeDP9fQQyEpJZdCiJIbIg
 d0NzvzHrEs7GKzsONsSflx+QfMKDUcCoSzm2z4waYwE+ZcRY/lszG2xX/ANEw3pI8JEe
 fFGlOmwCash1TltIFZ+EX7VRH9sG1teUp8l++1s4NtzzxIfa/guHIvveZcNLAyPlpw4i
 PIDvh9fRBAbErtttMAXhwFFUeS3ImIPei2L3Zrrd4MGg+7uk9rZL4tJCAe7ZhpQja6U3
 HxYrQ4AmK9czuPp9WkDZ7PSOavaROq7ztIKNWNYzxx/NRSsLZCiKQhd4UMEz1ndLlcMX
 ONkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WE6KUcvw6WH5aqC+O3Z+JfyzFtqYoqz6RBVibYz4rz0=;
 b=M/yW5r7L82QXwPYT17d0KfajRYJ3d+/n9lYrU/houWew4QBqcqZ2bJSQgckLTDp0Jf
 XMLGhM9yZOcjRCZiLl6rRBDe7QYTo6zvOc7Ce9MzYv8yHwQUmqR54qaDXUKnc2SELgZC
 6Ay2EauhA8UE1go6+zVgEUmFISeh0W00/NQTbHrG8D4O4OjuseV8VLTlleAv4VuNKima
 Rxh078br+7ZUzr02uM38K5mLpHgP091wc2Ah/VJ3lhYuZkGIGEbSu3nfMcVjxWDtcoP/
 sXpgm8I0D1QqZlY+LwL2bXs42a7ziC9BA+rhWJ3ZE04ChcmGU7+ORYQh9GeliqxjkXri
 0GTA==
X-Gm-Message-State: AOAM533qJwTkz/VIHTSBEVM6MXm++s5O2EUVwq8uGlGMaTXoPHZXUYjf
 E6rPlP9lKiI+Pf4Za0VPpcTgf2Mw2Q2xXg==
X-Google-Smtp-Source: ABdhPJymrsS1w+gNX++ASuQMRQdPTqWedSCzPnoy9Q6F+glpvFD5rmR6MLJXiVJYuUjmSxbLxfiTtg==
X-Received: by 2002:a17:902:76cb:b029:12b:2fb8:7c35 with SMTP id
 j11-20020a17090276cbb029012b2fb87c35mr4280709plt.16.1629235116942; 
 Tue, 17 Aug 2021 14:18:36 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/21] target/riscv: Tidy trans_rvh.c.inc
Date: Tue, 17 Aug 2021 11:18:02 -1000
Message-Id: <20210817211803.283639-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exit early if check_access fails.
Split out do_hlv, do_hsv, do_hlvx subroutines.
Use dest_gpr, get_gpr in the new subroutines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |   1 +
 target/riscv/insn_trans/trans_rvh.c.inc | 266 +++++-------------------
 2 files changed, 57 insertions(+), 210 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f09f8d5faf..2cd921d51c 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -42,6 +42,7 @@
 &j    imm rd
 &r    rd rs1 rs2
 &r2   rd rs1
+&r2_s rs1 rs2
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 585eb1d87e..ecbf77ff9c 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -17,281 +17,139 @@
  */
 
 #ifndef CONFIG_USER_ONLY
-static void check_access(DisasContext *ctx) {
+static bool check_access(DisasContext *ctx)
+{
     if (!ctx->hlsx) {
         if (ctx->virt_enabled) {
             generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
         } else {
             generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
         }
+        return false;
     }
+    return true;
 }
 #endif
 
+static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    if (check_access(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+#endif
+}
+
 static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_SB);
 }
 
 static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESW);
 }
 
 static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_UB);
 }
 
 static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
+    return do_hlv(ctx, a, MO_TEUW);
+}
 
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
+static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
+{
+#ifdef CONFIG_USER_ONLY
     return false;
+#else
+    if (check_access(ctx)) {
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
+        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+        tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
+    }
+    return true;
 #endif
 }
 
 static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_SB);
 }
 
 static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESW);
 }
 
 static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 {
     REQUIRE_EXT(ctx, RVH);
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-    return true;
-#else
-    return false;
-#endif
+    return do_hsv(ctx, a, MO_TESL);
 }
 
 static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEUL);
 }
 
 static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
-
-#ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
-#else
-    return false;
-#endif
+    return do_hlv(ctx, a, MO_TEQ);
 }
 
 static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVH);
+    return do_hsv(ctx, a, MO_TEQ);
+}
 
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-    gen_get_gpr(ctx, dat, a->rs2);
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+static bool do_hlvx(DisasContext *ctx, arg_r2 *a,
+                    void (*func)(TCGv, TCGv_env, TCGv))
+{
+    if (check_access(ctx)) {
+        TCGv dest = dest_gpr(ctx, a->rd);
+        TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+        func(dest, cpu_env, addr);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
     return true;
-#else
-    return false;
-#endif
 }
+#endif
 
 static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_hu);
 #else
     return false;
 #endif
@@ -301,19 +159,7 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    check_access(ctx);
-
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
-    gen_set_gpr(ctx, a->rd, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    return true;
+    return do_hlvx(ctx, a, gen_helper_hyp_hlvx_wu);
 #else
     return false;
 #endif
-- 
2.25.1


