Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B03F51CE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:13:56 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGKR-0002s9-1T
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG37-0006xN-43
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:56:01 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2w-0003Ee-CZ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:56:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so17642796pgm.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HE6ZBvI9HHOGgRLaGbIJrlYpKtPkbe52/WMJg5LJPmc=;
 b=aIrlk+OOLcXBF9P4uKEYcoTopLM80qCKKyI3aaFdfYKX8KdU657JwSekZNuKBCoVLg
 BL5ai2ayJZxS4v+MM0nwJSxMZH3Mc+xGkTLtYFHGplhhLdTjblrSYpyjPcEFHzd5D0q8
 ujvxSRTdqM0j+gjTYSKqboyXIWntoem4Dtvi5CI/F733XDTwrBrxK3UV+p7TfKDUIe22
 09wWPY1gpK6dStaVMGtU4lNT+tD8i5yvxN9sEkQPc8uvOahVPANMMB7D++MUmS3pK6ga
 zw7iMjyanTESH9o1BLxurjF4LokvT4IexzdiDYde6x5x0gRKX6HH3xpa41xr79Z4vY/G
 irnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HE6ZBvI9HHOGgRLaGbIJrlYpKtPkbe52/WMJg5LJPmc=;
 b=rJ2qylJCOF4oRhjpcxq3OfLCs2PcIsHiA7GNkY0kJlF/U/jVfmCscnzFKihkJNZqsS
 ZFxiVTUZBGDEASmK+1Um6ESP0xvep+Eo7nak9u3WclQjYjFWKuYXMlDaKNW2u0jVQvx0
 yoStnT/CKcyC/h0pP6Qyg0zWeM3sh0qUManAgXkWYLgOpqQZvUvtPFT9J1QiaAGtMFVj
 ryHAojb9zIBmEHfQbn3F3OxS4m7m+mjid9j4O822H+aPqcaRpg7rE+FrbmNOlCZQd06/
 7CdbsyOrFtBHHa+QQdFWwj5c0ktHOq3o3kBaRywloA3HfGbC5LBD/35e801AyaPn31+o
 tAtg==
X-Gm-Message-State: AOAM533q1zHIUB2jj52s9G1uQj8S4ln7MV45jsfCKr0s1xCuuRYCH+jt
 2CBLgI61iLsJKWuwZp06gguyhElF49IXBA==
X-Google-Smtp-Source: ABdhPJwYmkBqNWCaxvxiOf0tkmBMsgYayNwJvMb7EdaTChpFMPe5ku0Igl42LhgL2DsZ/UCA2zDGWQ==
X-Received: by 2002:a62:f202:0:b0:3e1:6010:494e with SMTP id
 m2-20020a62f202000000b003e16010494emr34490944pfh.36.1629748546226; 
 Mon, 23 Aug 2021 12:55:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/24] target/riscv: Use {get,dest}_gpr for RVD
Date: Mon, 23 Aug 2021 12:55:27 -0700
Message-Id: <20210823195529.560295-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 target/riscv/insn_trans/trans_rvd.c.inc | 125 ++++++++++++------------
 1 file changed, 60 insertions(+), 65 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 11b9b3f90b..db9ae15755 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -20,30 +20,40 @@
 
 static bool trans_fld(DisasContext *ctx, arg_fld *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], addr, ctx->mem_idx, MO_TEQ);
 
     mark_fs_dirty(ctx);
-    tcg_temp_free(t0);
     return true;
 }
 
 static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
 {
+    TCGv addr;
+
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
 
-    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+    addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], addr, ctx->mem_idx, MO_TEQ);
 
-    tcg_temp_free(t0);
     return true;
 }
 
@@ -252,11 +262,10 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_feq_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -265,11 +274,10 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_flt_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -278,11 +286,10 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_helper_fle_d(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -291,10 +298,10 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_d(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -303,12 +310,11 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -317,12 +323,11 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    TCGv dest = dest_gpr(ctx, a->rd);
 
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -331,12 +336,10 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
     return true;
@@ -347,12 +350,10 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, src);
 
     mark_fs_dirty(ctx);
     return true;
@@ -364,11 +365,11 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_l_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -378,11 +379,11 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(ctx, a->rd, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_lu_d(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -406,12 +407,11 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_SIGN);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -422,12 +422,11 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
 
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
+    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
 
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
-    tcg_temp_free(t0);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, src);
+
     mark_fs_dirty(ctx);
     return true;
 }
@@ -439,11 +438,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
     REQUIRE_EXT(ctx, RVD);
 
 #ifdef TARGET_RISCV64
-    TCGv t0 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-
-    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
-    tcg_temp_free(t0);
+    tcg_gen_mov_tl(cpu_fpr[a->rd], get_gpr(ctx, a->rs1, EXT_NONE));
     mark_fs_dirty(ctx);
     return true;
 #else
-- 
2.25.1


