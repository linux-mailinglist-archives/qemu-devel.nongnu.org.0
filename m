Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51A3F1606
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:18:34 +0200 (CEST)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeC1-0005l1-4y
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzW-0006rD-RV
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:38 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzT-0000OK-Do
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:05:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so4276714pjb.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Nkzm7eBwwK6YNx3T/orn7JiGzqUz9K0xgscSXV8LIM=;
 b=kuoXe93AJOHMYR5z54TLBxnQJsiA4p3wpmjA6WXuVN9BPGvPZ+V4sOhjcJkD2EmdAp
 17P8/JJ9WAp+GrRfBv1NCF6bvsEpFJuVpX2SZY8Mpb4F2fVLaFnAaULM8JP0rVyk9qO3
 J6FWrfH4V8CwGdsZyyv8ZxiY6s4RYe7L07FpUpa6efTLG9rzp4Pb1xl8H4oxh9Jx944P
 ZQ2hLMM41iFJr7G3pFtdRrqNLHzk/XAlNaZCbZu5RIkljJ0SdI6ex2pr3uhM+Lpy2+3G
 +QWsHumJ8Cf35SkamhZQeJH9lIO3OcCwqMH0yfQMEqmzV0newJlYn/GSwP0YSKlAeMcf
 z3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Nkzm7eBwwK6YNx3T/orn7JiGzqUz9K0xgscSXV8LIM=;
 b=NjGEJ3xnvrPzWGqSiOBWl3LlgH5IU8xbwxEbL92/n1xhQ3CD8+sP7rAJdVvilT08y/
 wHVLn+exnEcXo5OxUeFgHdEzY+Gr5Tp9Jcjnjvk8FAYtflqlTy5dIoaYpcHEz0IfquZM
 pDjF4MtgPF23V8bPIPRQ5WnKyRK0xq6JNSWWdtQAlMlsiaZ8py9b+opUxScRcAmMV9kK
 I5K3z51IThIY/yEzw0ehZKAeWGDF7SeNrrSbxFSdg7REdXUhQLxlZOnb9Wx7UQE/EkRl
 +6hfTadlgjAjn2ssP/AezbjAY3ZmttyRH7Ziz5VE3QnAe9p/6Pt68RbDNob4O3KireB9
 fHqA==
X-Gm-Message-State: AOAM533cz8k8dY7GV0184dgfx4qYtsc5jdjtrZbAPIshJQqSIujDaV5l
 wlO4zNlk6xFErSK0SW9tN2Z/fsiqPd17Yg==
X-Google-Smtp-Source: ABdhPJw/DAii82o3tmgMzxjaUht9osjxbB3lPWsBc+0qeAEikr6guivHBinWxNVlQlgc7EzPryr1JQ==
X-Received: by 2002:a17:90a:10f:: with SMTP id
 b15mr12176762pjb.46.1629363934022; 
 Thu, 19 Aug 2021 02:05:34 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/21] target/riscv: Use {get,dest}_gpr for RVF
Date: Wed, 18 Aug 2021 23:04:59 -1000
Message-Id: <20210819090502.428068-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvf.c.inc | 146 ++++++++++++------------
 1 file changed, 70 insertions(+), 76 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index fb9f7f9c00..bddbd418d9 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -25,32 +25,43 @@
 
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
 {
+    TCGv_i64 dest;
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    dest = cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_TEUL);
+    gen_nanbox_s(dest, dest);
 
-    tcg_temp_free(t0);
     mark_fs_dirty(ctx);
     return true;
 }
 
 static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
 
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEUL);
 
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -271,12 +282,11 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -285,12 +295,11 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -300,17 +309,15 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
 
 #if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
+    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
 #else
-    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
+    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
 #endif
 
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
-
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -318,10 +325,11 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -329,10 +337,11 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -340,10 +349,11 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 {
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -352,13 +362,10 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-
-    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
-
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -367,15 +374,12 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -384,15 +388,12 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -402,15 +403,12 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
-    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -420,11 +418,11 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -434,11 +432,11 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -448,14 +446,12 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -465,13 +461,11 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
-- 
2.25.1


