Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45E53D8CB
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 01:12:57 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxcwz-00020B-21
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 19:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcv4-0008KT-2S
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcuw-0004zt-3L
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:56 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so14919998pju.1
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JEMAlLL3NGuLqFLBWL9oqhqscgsFoPyEqTMfa3vc+S8=;
 b=Frkdx98CZ1FcgCAuEcGM8FPan83brN4LI40wr4L98tOsknCXdceLM+a3M6FIxorhlV
 VQ0p7IICyQGHTrNKqKuUkgXfXeYzb0DEZLhguFNcBqvWLf9NwdS3xgrOtxtH5uWD/mXz
 UNJKRkpRYDxV6fgktP1DjD+29JA+wlsfd+Er0d915SRLACJF0hRCwrHJZeg0Y+ucYrru
 O0WZbrJHLiSbnvdUrzMNcH9lY27g7ScYfP+WhqSGl5yUQcIh4Dg5/Fv4b9lmWGZU603R
 NDs/xfKEPWSIWRpnMvXstoupVYeyZ/X6m2BEjKI+ZzOohDNVchcXAklJPKWFT2EAvL1s
 lEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEMAlLL3NGuLqFLBWL9oqhqscgsFoPyEqTMfa3vc+S8=;
 b=DI/fcSFP0qWkEBG4j3HpIFv21akbXQaFOUpLnsbyEzNJ3kJhjbo8fmQrVMGmVg2FvL
 z510Xm/qFOSmxVM3ZriHVldZaKoWEFSaF4DquGE0JBEDA6i6rAPDuAVakH50NR40zfRM
 N6fEWrWmeky5dabcVruGezH+Pq4p457yj9aoUrhPc6HVafj9eI6uDn+an8S3ej7zpygf
 5EgeQbmWIgGHMN3zQ8B2y2Uzh2Cso8kH5jJRS74nJ+nnaSB4lsX7fC5Wb1IKvs4ztSkW
 1iA0yc/0ctBr+eEU+HhN7B1xrPcZHWEm75P1rdzaYEHl6E4IUG8dwgudKQ+jzx0qYRPz
 N1jw==
X-Gm-Message-State: AOAM532+3e3k1SDOD19CUkI/wOqsiCsb3T8VX3EeFDitTou3MDJgpqAR
 VrAFouuppCt8A9YIpAT5GgTfCIMLdKlvbg==
X-Google-Smtp-Source: ABdhPJxG124SUmYzxT9QXZ1+Sxo8q1Ms9u/L3C19ywLvI9+7Y7Tg/aLk/xnQWkd6pJbKVAquhZEWdg==
X-Received: by 2002:a17:902:6505:b0:163:b040:829b with SMTP id
 b5-20020a170902650500b00163b040829bmr16631470plk.173.1654384208130; 
 Sat, 04 Jun 2022 16:10:08 -0700 (PDT)
Received: from bigtime.. ([2602:ae:1547:e101:250:b6ff:fe24:58ae])
 by smtp.gmail.com with ESMTPSA id
 184-20020a6302c1000000b003fcf1279c84sm5562151pgc.33.2022.06.04.16.10.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 16:10:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/riscv: Minimize the calls to decode_save_opc
Date: Sat,  4 Jun 2022 23:10:04 +0000
Message-Id: <20220604231004.49990-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604231004.49990-1-richard.henderson@linaro.org>
References: <20220604231004.49990-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

The set of instructions that require decode_save_opc for
unwinding is really fairly small -- only insns that can
raise ILLEGAL_INSN at runtime.  This includes CSR, anything
that uses a *new* fp rounding mode, and many privileged insns.

Since unwind info is stored as the difference from the
previous insn, storing a 0 for most insns minimizes the
size of the unwind info.

Booting a debian kernel image to the missing rootfs panic yields

- gen code size       22226819/1026886656
+ gen code size       21601907/1026886656

on 41k TranslationBlocks, a savings of 610kB or a bit less than 3%.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                       | 18 +++++++++---------
 target/riscv/insn_trans/trans_privileged.c.inc |  4 ++++
 target/riscv/insn_trans/trans_rvh.c.inc        |  2 ++
 target/riscv/insn_trans/trans_rvi.c.inc        |  2 ++
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6e4bbea1cd..b328a7b2ff 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -204,6 +204,13 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
 
+static void decode_save_opc(DisasContext *ctx)
+{
+    assert(ctx->insn_start != NULL);
+    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
+    ctx->insn_start = NULL;
+}
+
 static void gen_set_pc_imm(DisasContext *ctx, target_ulong dest)
 {
     if (get_xl(ctx) == MXL_RV32) {
@@ -633,6 +640,8 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
 
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
@@ -1011,13 +1020,6 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
-static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
-{
-    assert(ctx->insn_start != NULL);
-    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
-    ctx->insn_start = NULL;
-}
-
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /*
@@ -1034,7 +1036,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 
     /* Check for compressed insn */
     if (extract16(opcode, 0, 2) != 3) {
-        decode_save_opc(ctx, opcode);
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
@@ -1049,7 +1050,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         opcode32 = deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
-        decode_save_opc(ctx, opcode32);
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
 
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 53613682e8..46f96ad74d 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -75,6 +75,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
+        decode_save_opc(ctx);
         gen_helper_sret(cpu_pc, cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
@@ -90,6 +91,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_mret(cpu_pc, cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -102,6 +104,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     gen_helper_wfi(cpu_env);
     return true;
@@ -113,6 +116,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index cebcb3f8f6..4f8aecddc7 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -169,6 +169,7 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_gvma_tlb_flush(cpu_env);
     return true;
 #endif
@@ -179,6 +180,7 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
+    decode_save_opc(ctx);
     gen_helper_hyp_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index f1342f30f8..cf17458022 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -822,6 +822,8 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 
 static bool do_csr_post(DisasContext *ctx)
 {
+    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
+    decode_save_opc(ctx);
     /* We may have changed important cpu state -- exit to main loop. */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
-- 
2.34.1


