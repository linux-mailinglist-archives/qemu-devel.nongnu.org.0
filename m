Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32E6AB3DD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:45:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyxN-0000qg-9v; Sun, 05 Mar 2023 19:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyx1-0000YV-9L
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:42 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYywx-0007E8-Fa
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:38 -0500
Received: by mail-pg1-x52f.google.com with SMTP id d10so4528760pgt.12
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNvQrfS+0eakfNbAWA5HLC8WozWUcIxZIzfYvhnwHQw=;
 b=hlnO0q0Goj7n56UJMJu0q4F8uu6TyHh5lEJrK1f6ecY+Ojo5gPIDezjm031JTnEecq
 wBx0dAkDaRd8sVUDXDi+7XO0ybHZC90Ap++GV5NkGZFN+/qGE3Y+JukqUp3HXINJRYuZ
 8i2JppTCFyhgKF+39U/C/UPumHrAWp5H5lQA7FF2paxY8fR1PdK1Nw3GY/1M/wSHpTGt
 zgUyPwtSRC6ZiM/Qxx6rH15gb43wfSsxRDkwe1TBznbsl/lKlCD8kjqk7IKgluRqHxqu
 klIyfounwj/A+GKkksIJrzOrJjw++dB0vytH48SQ2Rzs4v4TqYo+OOdxlXWE9C74pPXN
 eL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNvQrfS+0eakfNbAWA5HLC8WozWUcIxZIzfYvhnwHQw=;
 b=ChqYbPWEwwLyEOFidtkWAqTeR6TDUh8itCSbjfSiPQB83oXkoXR+TBO32T0hLj6shS
 PVDOsauln2qzTK44ItRsfXTKD2dTSZYZB7QZ8nG3vCMhyywiYLm6XbuTqwcrFx5gna37
 UIWii4rQD7DSt+KAb8ujW2AYhfh7oysoPVKWEJ5dfqnznR01MB5jhmfxAaFVaKkwPpcR
 ShTTpQ08Jd91KNLVnke9I5BpbnF+NlPlPDEJDcULkaR1j2Pis7G7VVyZ6esM66Nlng3j
 fvmv8fscbbSgaEuqp4b5vK1b5vSYIut90CyxTtKvGGd1dvzYXLHUoCBOhSCyMB7ghLuZ
 a68g==
X-Gm-Message-State: AO0yUKXlMZ//QO8ZyjQo129JRDSyv0vGV6aBQuf0woGgEbjR5227Yo6y
 hWnpwLtJSdzBEMCZ3jKZhzKnjfK4jTWUP71FKXpv7w==
X-Google-Smtp-Source: AK7set9QjjeRAYelLgXxitfmWc6cBw2N2aIai/Zqe879d03V9EeMpEXADlVF7je4OYPn+wVyTHhRdg==
X-Received: by 2002:a62:1ad4:0:b0:5cf:4755:66d9 with SMTP id
 a203-20020a621ad4000000b005cf475566d9mr6473508pfa.24.1678063413834; 
 Sun, 05 Mar 2023 16:43:33 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Song Gao <gaosong@loongson.cn>
Subject: [PULL 42/84] target/loongarch: Drop tcg_temp_free
Date: Sun,  5 Mar 2023 16:39:12 -0800
Message-Id: <20230306003954.1866998-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_arith.c.inc | 12 -------
 .../loongarch/insn_trans/trans_atomic.c.inc   |  3 --
 target/loongarch/insn_trans/trans_bit.c.inc   | 12 -------
 target/loongarch/insn_trans/trans_fcmp.c.inc  |  3 --
 .../loongarch/insn_trans/trans_fmemory.c.inc  | 20 ++---------
 target/loongarch/insn_trans/trans_fmov.c.inc  |  6 ----
 .../loongarch/insn_trans/trans_memory.c.inc   | 34 +++----------------
 .../insn_trans/trans_privileged.c.inc         |  4 ---
 target/loongarch/insn_trans/trans_shift.c.inc | 11 ------
 9 files changed, 6 insertions(+), 99 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_arith.c.inc b/target/loongarch/insn_trans/trans_arith.c.inc
index 8e45eadbc8..43d6cf261d 100644
--- a/target/loongarch/insn_trans/trans_arith.c.inc
+++ b/target/loongarch/insn_trans/trans_arith.c.inc
@@ -100,14 +100,12 @@ static void gen_mulh_d(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_muls2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void gen_mulh_du(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv discard = tcg_temp_new();
     tcg_gen_mulu2_tl(discard, dest, src1, src2);
-    tcg_temp_free(discard);
 }
 
 static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
@@ -129,9 +127,6 @@ static void prep_divisor_d(TCGv ret, TCGv src1, TCGv src2)
     tcg_gen_and_tl(ret, ret, t0);
     tcg_gen_or_tl(ret, ret, t1);
     tcg_gen_movcond_tl(TCG_COND_NE, ret, ret, zero, ret, src2);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void prep_divisor_du(TCGv ret, TCGv src2)
@@ -152,7 +147,6 @@ static void gen_div_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
@@ -160,7 +154,6 @@ static void gen_rem_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_d(t0, src1, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
@@ -168,7 +161,6 @@ static void gen_div_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_divu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
@@ -176,7 +168,6 @@ static void gen_rem_du(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     prep_divisor_du(t0, src2);
     tcg_gen_remu_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
@@ -185,7 +176,6 @@ static void gen_div_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for div_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_div_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
@@ -194,7 +184,6 @@ static void gen_rem_w(TCGv dest, TCGv src1, TCGv src2)
     /* We need not check for integer overflow for rem_w. */
     prep_divisor_du(t0, src2);
     tcg_gen_rem_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
@@ -202,7 +191,6 @@ static void gen_alsl(TCGv dest, TCGv src1, TCGv src2, target_long sa)
     TCGv t0 = tcg_temp_new();
     tcg_gen_shli_tl(t0, src1, sa);
     tcg_gen_add_tl(dest, t0, src2);
-    tcg_temp_free(t0);
 }
 
 static bool trans_lu32i_d(DisasContext *ctx, arg_lu32i_d *a)
diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
index 6763c1c301..612709f2a7 100644
--- a/target/loongarch/insn_trans/trans_atomic.c.inc
+++ b/target/loongarch/insn_trans/trans_atomic.c.inc
@@ -14,7 +14,6 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
     tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -43,8 +42,6 @@ static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
     tcg_gen_setcond_tl(TCG_COND_EQ, dest, t0, cpu_llval);
     gen_set_label(done);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(t0);
-    tcg_temp_free(val);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index b01e4aeb23..25b4d7858b 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -122,9 +122,6 @@ static void gen_revb_2h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revb_4h(TCGv dest, TCGv src1)
@@ -138,9 +135,6 @@ static void gen_revb_4h(TCGv dest, TCGv src1)
     tcg_gen_and_tl(t1, src1, mask);
     tcg_gen_shli_tl(t1, t1, 8);
     tcg_gen_or_tl(dest, t0, t1);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_revh_2w(TCGv dest, TCGv src1)
@@ -154,9 +148,6 @@ static void gen_revh_2w(TCGv dest, TCGv src1)
     tcg_gen_and_i64(t0, t0, mask);
     tcg_gen_shli_i64(t1, t1, 16);
     tcg_gen_or_i64(dest, t1, t0);
-
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static void gen_revh_d(TCGv dest, TCGv src1)
@@ -171,9 +162,6 @@ static void gen_revh_d(TCGv dest, TCGv src1)
     tcg_gen_shli_tl(t0, t0, 16);
     tcg_gen_or_tl(t0, t0, t1);
     tcg_gen_rotri_tl(dest, t0, 32);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
diff --git a/target/loongarch/insn_trans/trans_fcmp.c.inc b/target/loongarch/insn_trans/trans_fcmp.c.inc
index 2ccf646ccb..3b0da2b9f4 100644
--- a/target/loongarch/insn_trans/trans_fcmp.c.inc
+++ b/target/loongarch/insn_trans/trans_fcmp.c.inc
@@ -38,7 +38,6 @@ static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-    tcg_temp_free(var);
     return true;
 }
 
@@ -57,7 +56,5 @@ static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)
     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk], tcg_constant_i32(flags));
 
     tcg_gen_st8_tl(var, cpu_env, offsetof(CPULoongArchState, cf[a->cd]));
-
-    tcg_temp_free(var);
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmemory.c.inc b/target/loongarch/insn_trans/trans_fmemory.c.inc
index 3025a1d3e9..0d11843873 100644
--- a/target/loongarch/insn_trans/trans_fmemory.c.inc
+++ b/target/loongarch/insn_trans/trans_fmemory.c.inc
@@ -13,12 +13,11 @@ static void maybe_nanbox_load(TCGv freg, MemOp mop)
 static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
@@ -26,31 +25,22 @@ static bool gen_fload_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
 
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
 static bool gen_fstore_i(DisasContext *ctx, arg_fr_i *a, MemOp mop)
 {
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     CHECK_FPE;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
     return true;
 }
 
@@ -66,7 +56,6 @@ static bool gen_floadx(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -82,7 +71,6 @@ static bool gen_fstorex(DisasContext *ctx, arg_frr *a, MemOp mop)
     addr = tcg_temp_new();
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -100,7 +88,6 @@ static bool gen_fload_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -117,7 +104,6 @@ static bool gen_fstore_gt(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtgt_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -135,7 +121,6 @@ static bool gen_fload_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
     maybe_nanbox_load(cpu_fpr[a->fd], mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -152,7 +137,6 @@ static bool gen_fstore_le(DisasContext *ctx, arg_frr *a, MemOp mop)
     gen_helper_asrtle_d(cpu_env, src1, src2);
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(cpu_fpr[a->fd], addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_fmov.c.inc b/target/loongarch/insn_trans/trans_fmov.c.inc
index 8e5106db4e..069c941665 100644
--- a/target/loongarch/insn_trans/trans_fmov.c.inc
+++ b/target/loongarch/insn_trans/trans_fmov.c.inc
@@ -18,7 +18,6 @@ static bool trans_fsel(DisasContext *ctx, arg_fsel *a)
     tcg_gen_ld8u_tl(cond, cpu_env, offsetof(CPULoongArchState, cf[a->ca]));
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_fpr[a->fd], cond, zero,
                        cpu_fpr[a->fj], cpu_fpr[a->fk]);
-    tcg_temp_free(cond);
 
     return true;
 }
@@ -82,9 +81,6 @@ static bool trans_movgr2fcsr(DisasContext *ctx, arg_movgr2fcsr *a)
         tcg_gen_andi_i32(fcsr0, fcsr0, ~mask);
         tcg_gen_or_i32(fcsr0, fcsr0, temp);
         tcg_gen_st_i32(fcsr0, cpu_env, offsetof(CPULoongArchState, fcsr0));
-
-        tcg_temp_free_i32(temp);
-        tcg_temp_free_i32(fcsr0);
     }
 
     /*
@@ -134,7 +130,6 @@ static bool trans_movfr2cf(DisasContext *ctx, arg_movfr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_fpr[a->fj], 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
@@ -157,7 +152,6 @@ static bool trans_movgr2cf(DisasContext *ctx, arg_movgr2cf *a)
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, gpr_src(ctx, a->rj, EXT_NONE), 0x1);
     tcg_gen_st8_tl(t0, cpu_env, offsetof(CPULoongArchState, cf[a->cd & 0x7]));
-    tcg_temp_free(t0);
 
     return true;
 }
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
index d5eb31147c..75cfdf59ad 100644
--- a/target/loongarch/insn_trans/trans_memory.c.inc
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -7,21 +7,15 @@ static bool gen_load(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -29,20 +23,14 @@ static bool gen_store(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -56,7 +44,6 @@ static bool gen_loadx(DisasContext *ctx, arg_rrr *a, MemOp mop)
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -70,7 +57,6 @@ static bool gen_storex(DisasContext *ctx, arg_rrr *a, MemOp mop)
 
     tcg_gen_add_tl(addr, src1, src2);
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-    tcg_temp_free(addr);
 
     return true;
 }
@@ -146,21 +132,15 @@ static bool gen_ldptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, mop);
     gen_set_gpr(a->rd, dest, EXT_NONE);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
@@ -168,20 +148,14 @@ static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 {
     TCGv data = gpr_src(ctx, a->rd, EXT_NONE);
     TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
-    TCGv temp = NULL;
 
     if (a->imm) {
-        temp = tcg_temp_new();
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
     tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, mop);
-
-    if (temp) {
-        tcg_temp_free(temp);
-    }
-
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 56f4c45e09..5a04352b01 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -291,10 +291,6 @@ static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
         tcg_gen_st_tl(newv, cpu_env, csr->offset);
     }
     gen_set_gpr(a->rd, oldv, EXT_NONE);
-
-    tcg_temp_free(temp);
-    tcg_temp_free(newv);
-    tcg_temp_free(oldv);
     return true;
 }
 
diff --git a/target/loongarch/insn_trans/trans_shift.c.inc b/target/loongarch/insn_trans/trans_shift.c.inc
index 5260af2337..bf5428a2ba 100644
--- a/target/loongarch/insn_trans/trans_shift.c.inc
+++ b/target/loongarch/insn_trans/trans_shift.c.inc
@@ -8,7 +8,6 @@ static void gen_sll_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
@@ -16,7 +15,6 @@ static void gen_srl_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
@@ -24,7 +22,6 @@ static void gen_sra_w(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x1f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
@@ -32,7 +29,6 @@ static void gen_sll_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shl_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
@@ -40,7 +36,6 @@ static void gen_srl_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_shr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
@@ -48,7 +43,6 @@ static void gen_sra_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_sar_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
@@ -64,10 +58,6 @@ static void gen_rotr_w(TCGv dest, TCGv src1, TCGv src2)
 
     tcg_gen_rotr_i32(t1, t1, t2);
     tcg_gen_ext_i32_tl(dest, t1);
-
-    tcg_temp_free_i32(t1);
-    tcg_temp_free_i32(t2);
-    tcg_temp_free(t0);
 }
 
 static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
@@ -75,7 +65,6 @@ static void gen_rotr_d(TCGv dest, TCGv src1, TCGv src2)
     TCGv t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, src2, 0x3f);
     tcg_gen_rotr_tl(dest, src1, t0);
-    tcg_temp_free(t0);
 }
 
 static bool trans_srai_w(DisasContext *ctx, arg_srai_w *a)
-- 
2.34.1


