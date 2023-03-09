Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643C6B2E73
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeE-0001VC-4K; Thu, 09 Mar 2023 15:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000Xb-94
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdc-0002J4-BP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id n6so3234118plf.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYOK1tP9iyztDvCRsGRcjogDRAezK6YA91P6lIu6P1M=;
 b=umXN2vxuacdKT4ovoDBGc1Sh4v6OfswIt2c/FP+e28uleMlbJuVFxrDyp4nog3PzOZ
 oDPEC6r7JsiDXfFxniFYpPisQD0fzV/KvOVPaKaQchk/lalsmKkkGwfOoSJsawdq3uL+
 iXPZCMv2YCkEnMyJwiF8Av+JkZ9y3hb+0gxw8T4tdx5GnDHcOE/qUq/MpFQMYUOX8DKy
 2CwZcQ0mhUX0K+IV7go9qnh8gjszIiSJphu01CcH9/f+CkHzewocgx3isDk/w9k76Pox
 1F04i5Kgus7mNWKl6Ld3tahYRUgQyhItKfPtA7FObuecrRCHsRsmNcJ81Kh5MSi6wmCr
 1zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYOK1tP9iyztDvCRsGRcjogDRAezK6YA91P6lIu6P1M=;
 b=gha6kBonxIHz7rdfNpgXSTOxqLMsnxkOJv4Uma32Hy6dPhAXrTn+rOcKTj9R3gjZ4G
 asgcnZnZyLwTeYeb6+CVZU1mAK/Mw7dZ/PUSU3yyvenM8+Eya5swItlnIIegRkgryOQA
 qDY4NwbKWepp+UXCMKCXax3Wg+WF3ABhICTQNkXT1GYyyZlr9GjjSaLxQ1Sok2f035eq
 xFM14kuXur7fw2MqiOWp9DWk3FOTPYf7bswCuTQ0VtpZvtktld87swXrSj7+vdzZf9E6
 Z360ZSY7nl/MttL1tZ2j7+mZ/WPyqDnCGkt+J3ALAAbIF94VsY7gU9bjRw/i3hnmcIC3
 tyCg==
X-Gm-Message-State: AO0yUKXBEYPP1ljiOcrx0CmUA/60X4exto5egWWoVIgG2cXQ7zgeCQ9h
 FJycaF640UyczIxiOyfWLnWxTZbQ4JM5z6Vwu6A=
X-Google-Smtp-Source: AK7set9bPKtoDdlBowgE6s5kkwtY4cWP/kCpLWuOwYymtclaEs3IyMisXkhKtAIUx0D7GbsyuqwSTw==
X-Received: by 2002:a05:6a20:12d1:b0:cd:fc47:ddbf with SMTP id
 v17-20020a056a2012d100b000cdfc47ddbfmr25260852pzg.47.1678392798482; 
 Thu, 09 Mar 2023 12:13:18 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 88/91] target/ppc: Avoid tcg_const_* in translate.c
Date: Thu,  9 Mar 2023 12:05:47 -0800
Message-Id: <20230309200550.3878088-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 142 +++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 70 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7ec940b7d8..9d05357d03 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -263,8 +263,8 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     gen_update_nip(ctx, ctx->cia);
-    t0 = tcg_const_i32(excp);
-    t1 = tcg_const_i32(error);
+    t0 = tcg_constant_i32(excp);
+    t1 = tcg_constant_i32(error);
     gen_helper_raise_exception_err(cpu_env, t0, t1);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -278,7 +278,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     gen_update_nip(ctx, ctx->cia);
-    t0 = tcg_const_i32(excp);
+    t0 = tcg_constant_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -289,7 +289,7 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     TCGv_i32 t0;
 
     gen_update_nip(ctx, nip);
-    t0 = tcg_const_i32(excp);
+    t0 = tcg_constant_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -386,7 +386,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
 static void spr_load_dump_spr(int sprn)
 {
 #ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_load_dump_spr(cpu_env, t0);
 #endif
 }
@@ -400,7 +400,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn)
 static void spr_store_dump_spr(int sprn)
 {
 #ifdef PPC_DUMP_SPR_ACCESSES
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_store_dump_spr(cpu_env, t0);
 #endif
 }
@@ -672,25 +672,25 @@ void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0U) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_IBAT0U) / 2);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4U) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_IBAT4U) / 2) + 4);
     gen_helper_store_ibatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_IBAT0L) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_IBAT0L) / 2);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_IBAT4L) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_IBAT4L) / 2) + 4);
     gen_helper_store_ibatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
@@ -712,25 +712,25 @@ void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0U) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_DBAT0U) / 2);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4U) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_DBAT4U) / 2) + 4);
     gen_helper_store_dbatu(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32((sprn - SPR_DBAT0L) / 2);
+    TCGv_i32 t0 = tcg_constant_i32((sprn - SPR_DBAT0L) / 2);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
 void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(((sprn - SPR_DBAT4L) / 2) + 4);
+    TCGv_i32 t0 = tcg_constant_i32(((sprn - SPR_DBAT4L) / 2) + 4);
     gen_helper_store_dbatl(cpu_env, t0, cpu_gpr[gprn]);
 }
 
@@ -1040,13 +1040,15 @@ void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv_i32 t0 = tcg_const_i32(sprn);
+    TCGv_i32 t0 = tcg_constant_i32(sprn);
     gen_helper_booke_setpid(cpu_env, t0, cpu_gpr[gprn]);
 }
+
 void spr_write_eplc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_eplc(cpu_env, cpu_gpr[gprn]);
 }
+
 void spr_write_epsc(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_booke_set_epsc(cpu_env, cpu_gpr[gprn]);
@@ -1080,9 +1082,9 @@ void spr_read_mas73(DisasContext *ctx, int gprn, int sprn)
 static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
                                     int bit, int sprn, int cause)
 {
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
+    TCGv_i32 t1 = tcg_constant_i32(bit);
+    TCGv_i32 t2 = tcg_constant_i32(sprn);
+    TCGv_i32 t3 = tcg_constant_i32(cause);
 
     gen_helper_fscr_facility_check(cpu_env, t1, t2, t3);
 }
@@ -1090,9 +1092,9 @@ static void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
 static void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
                                    int bit, int sprn, int cause)
 {
-    TCGv_i32 t1 = tcg_const_i32(bit);
-    TCGv_i32 t2 = tcg_const_i32(sprn);
-    TCGv_i32 t3 = tcg_const_i32(cause);
+    TCGv_i32 t1 = tcg_constant_i32(bit);
+    TCGv_i32 t2 = tcg_constant_i32(sprn);
+    TCGv_i32 t3 = tcg_constant_i32(cause);
 
     gen_helper_msr_facility_check(cpu_env, t1, t2, t3);
 }
@@ -1388,7 +1390,7 @@ static inline void gen_op_cmp(TCGv arg0, TCGv arg1, int s, int crf)
 
 static inline void gen_op_cmpi(TCGv arg0, target_ulong arg1, int s, int crf)
 {
-    TCGv t0 = tcg_const_tl(arg1);
+    TCGv t0 = tcg_constant_tl(arg1);
     gen_op_cmp(arg0, t0, s, crf);
 }
 
@@ -1409,7 +1411,7 @@ static inline void gen_op_cmp32(TCGv arg0, TCGv arg1, int s, int crf)
 
 static inline void gen_op_cmpi32(TCGv arg0, target_ulong arg1, int s, int crf)
 {
-    TCGv t0 = tcg_const_tl(arg1);
+    TCGv t0 = tcg_constant_tl(arg1);
     gen_op_cmp32(arg0, t0, s, crf);
 }
 
@@ -1476,7 +1478,7 @@ static void gen_isel(DisasContext *ctx)
     tcg_gen_extu_i32_tl(t0, cpu_crf[bi >> 2]);
     tcg_gen_andi_tl(t0, t0, mask);
 
-    zr = tcg_const_tl(0);
+    zr = tcg_constant_tl(0);
     tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr[rD(ctx->opcode)], t0, zr,
                        rA(ctx->opcode) ? cpu_gpr[rA(ctx->opcode)] : zr,
                        cpu_gpr[rB(ctx->opcode)]);
@@ -1568,7 +1570,7 @@ static inline void gen_op_arith_add(DisasContext *ctx, TCGv ret, TCGv arg1,
                 tcg_gen_mov_tl(ca32, ca);
             }
         } else {
-            TCGv zero = tcg_const_tl(0);
+            TCGv zero = tcg_constant_tl(0);
             if (add_ca) {
                 tcg_gen_add2_tl(t0, ca, arg1, zero, ca, zero);
                 tcg_gen_add2_tl(t0, ca, t0, ca, arg2, zero);
@@ -1609,7 +1611,7 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
                                 add_ca, compute_ca, compute_ov)               \
 static void glue(gen_, name)(DisasContext *ctx)                               \
 {                                                                             \
-    TCGv t0 = tcg_const_tl(const_val);                                        \
+    TCGv t0 = tcg_constant_tl(const_val);                                     \
     gen_op_arith_add(ctx, cpu_gpr[rD(ctx->opcode)],                           \
                      cpu_gpr[rA(ctx->opcode)], t0,                            \
                      ca, glue(ca, 32),                                        \
@@ -1636,7 +1638,7 @@ GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
 /* addic  addic.*/
 static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
 {
-    TCGv c = tcg_const_tl(SIMM(ctx->opcode));
+    TCGv c = tcg_constant_tl(SIMM(ctx->opcode));
     gen_op_arith_add(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                      c, cpu_ca, cpu_ca32, 0, 1, 0, compute_rc0);
 }
@@ -1709,7 +1711,7 @@ GEN_INT_ARITH_DIVW(divwo, 0x1F, 1, 1);
 #define GEN_DIVE(name, hlpr, compute_ov)                                      \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-    TCGv_i32 t0 = tcg_const_i32(compute_ov);                                  \
+    TCGv_i32 t0 = tcg_constant_i32(compute_ov);                               \
     gen_helper_##hlpr(cpu_gpr[rD(ctx->opcode)], cpu_env,                      \
                      cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0); \
     if (unlikely(Rc(ctx->opcode) != 0)) {                                     \
@@ -1802,8 +1804,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
         tcg_gen_rem_i32(t3, t0, t1);
         tcg_gen_ext_i32_tl(ret, t3);
     } else {
-        TCGv_i32 t2 = tcg_const_i32(1);
-        TCGv_i32 t3 = tcg_const_i32(0);
+        TCGv_i32 t2 = tcg_constant_i32(1);
+        TCGv_i32 t3 = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
         tcg_gen_remu_i32(t3, t0, t1);
         tcg_gen_extu_i32_tl(ret, t3);
@@ -1842,8 +1844,8 @@ static inline void gen_op_arith_modd(DisasContext *ctx, TCGv ret, TCGv arg1,
         tcg_gen_movcond_i64(TCG_COND_NE, t1, t2, t3, t2, t1);
         tcg_gen_rem_i64(ret, t0, t1);
     } else {
-        TCGv_i64 t2 = tcg_const_i64(1);
-        TCGv_i64 t3 = tcg_const_i64(0);
+        TCGv_i64 t2 = tcg_constant_i64(1);
+        TCGv_i64 t3 = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_EQ, t1, t1, t3, t2, t1);
         tcg_gen_remu_i64(ret, t0, t1);
     }
@@ -2038,7 +2040,7 @@ static inline void gen_op_arith_subf(DisasContext *ctx, TCGv ret, TCGv arg1,
         } else if (add_ca) {
             TCGv zero, inv1 = tcg_temp_new();
             tcg_gen_not_tl(inv1, arg1);
-            zero = tcg_const_tl(0);
+            zero = tcg_constant_tl(0);
             tcg_gen_add2_tl(t0, cpu_ca, arg2, zero, cpu_ca, zero);
             tcg_gen_add2_tl(t0, cpu_ca, t0, cpu_ca, inv1, zero);
             gen_op_arith_compute_ca32(ctx, t0, inv1, arg2, cpu_ca32, 0);
@@ -2083,7 +2085,7 @@ static void glue(gen_, name)(DisasContext *ctx)                               \
                                 add_ca, compute_ca, compute_ov)               \
 static void glue(gen_, name)(DisasContext *ctx)                               \
 {                                                                             \
-    TCGv t0 = tcg_const_tl(const_val);                                        \
+    TCGv t0 = tcg_constant_tl(const_val);                                     \
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)],                          \
                       cpu_gpr[rA(ctx->opcode)], t0,                           \
                       add_ca, compute_ca, compute_ov, Rc(ctx->opcode));       \
@@ -2107,7 +2109,7 @@ GEN_INT_ARITH_SUBF_CONST(subfzeo, 0x16, 0, 1, 1, 1)
 /* subfic */
 static void gen_subfic(DisasContext *ctx)
 {
-    TCGv c = tcg_const_tl(SIMM(ctx->opcode));
+    TCGv c = tcg_constant_tl(SIMM(ctx->opcode));
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                       c, 0, 1, 0, 0);
 }
@@ -2115,7 +2117,7 @@ static void gen_subfic(DisasContext *ctx)
 /* neg neg. nego nego. */
 static inline void gen_op_arith_neg(DisasContext *ctx, bool compute_ov)
 {
-    TCGv zero = tcg_const_tl(0);
+    TCGv zero = tcg_constant_tl(0);
     gen_op_arith_subf(ctx, cpu_gpr[rD(ctx->opcode)], cpu_gpr[rA(ctx->opcode)],
                       zero, 0, 0, compute_ov, Rc(ctx->opcode));
 }
@@ -2214,7 +2216,7 @@ GEN_LOGICAL2(nor, tcg_gen_nor_tl, 0x03, PPC_INTEGER);
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 static void gen_pause(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(0);
+    TCGv_i32 t0 = tcg_constant_i32(0);
     tcg_gen_st_i32(t0, cpu_env,
                    -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
 
@@ -3256,7 +3258,7 @@ static void gen_lmw(DisasContext *ctx)
     }
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
-    t1 = tcg_const_i32(rD(ctx->opcode));
+    t1 = tcg_constant_i32(rD(ctx->opcode));
     gen_addr_imm_index(ctx, t0, 0);
     gen_helper_lmw(cpu_env, t0, t1);
 }
@@ -3273,7 +3275,7 @@ static void gen_stmw(DisasContext *ctx)
     }
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
-    t1 = tcg_const_i32(rS(ctx->opcode));
+    t1 = tcg_constant_i32(rS(ctx->opcode));
     gen_addr_imm_index(ctx, t0, 0);
     gen_helper_stmw(cpu_env, t0, t1);
 }
@@ -3311,8 +3313,8 @@ static void gen_lswi(DisasContext *ctx)
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
     gen_addr_register(ctx, t0);
-    t1 = tcg_const_i32(nb);
-    t2 = tcg_const_i32(start);
+    t1 = tcg_constant_i32(nb);
+    t2 = tcg_constant_i32(start);
     gen_helper_lsw(cpu_env, t0, t1, t2);
 }
 
@@ -3329,9 +3331,9 @@ static void gen_lswx(DisasContext *ctx)
     gen_set_access_type(ctx, ACCESS_INT);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
-    t1 = tcg_const_i32(rD(ctx->opcode));
-    t2 = tcg_const_i32(rA(ctx->opcode));
-    t3 = tcg_const_i32(rB(ctx->opcode));
+    t1 = tcg_constant_i32(rD(ctx->opcode));
+    t2 = tcg_constant_i32(rA(ctx->opcode));
+    t3 = tcg_constant_i32(rB(ctx->opcode));
     gen_helper_lswx(cpu_env, t0, t1, t2, t3);
 }
 
@@ -3352,8 +3354,8 @@ static void gen_stswi(DisasContext *ctx)
     if (nb == 0) {
         nb = 32;
     }
-    t1 = tcg_const_i32(nb);
-    t2 = tcg_const_i32(rS(ctx->opcode));
+    t1 = tcg_constant_i32(nb);
+    t2 = tcg_constant_i32(rS(ctx->opcode));
     gen_helper_stsw(cpu_env, t0, t1, t2);
 }
 
@@ -3373,7 +3375,7 @@ static void gen_stswx(DisasContext *ctx)
     t1 = tcg_temp_new_i32();
     tcg_gen_trunc_tl_i32(t1, cpu_xer);
     tcg_gen_andi_i32(t1, t1, 0x7F);
-    t2 = tcg_const_i32(rS(ctx->opcode));
+    t2 = tcg_constant_i32(rS(ctx->opcode));
     gen_helper_stsw(cpu_env, t0, t1, t2);
 }
 
@@ -3943,7 +3945,7 @@ static void gen_wait(DisasContext *ctx)
      * to occur.
      */
     if (wc == 0) {
-        TCGv_i32 t0 = tcg_const_i32(1);
+        TCGv_i32 t0 = tcg_constant_i32(1);
         tcg_gen_st_i32(t0, cpu_env,
                        -offsetof(PowerPCCPU, env) + offsetof(CPUState, halted));
         /* Stop translation, as the CPU is supposed to sleep from now */
@@ -3989,7 +3991,7 @@ static void gen_doze(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_DOZE);
+    t = tcg_constant_i32(PPC_PM_DOZE);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4004,7 +4006,7 @@ static void gen_nap(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_NAP);
+    t = tcg_constant_i32(PPC_PM_NAP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4019,7 +4021,7 @@ static void gen_stop(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_STOP);
+    t = tcg_constant_i32(PPC_PM_STOP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4034,7 +4036,7 @@ static void gen_sleep(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_SLEEP);
+    t = tcg_constant_i32(PPC_PM_SLEEP);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4049,7 +4051,7 @@ static void gen_rvwinkle(DisasContext *ctx)
     TCGv_i32 t;
 
     CHK_HV(ctx);
-    t = tcg_const_i32(PPC_PM_RVWINKLE);
+    t = tcg_constant_i32(PPC_PM_RVWINKLE);
     gen_helper_pminsn(cpu_env, t);
     /* Stop translation, as the CPU is supposed to sleep from now */
     gen_exception_nip(ctx, EXCP_HLT, ctx->base.pc_next);
@@ -4506,7 +4508,7 @@ static void gen_tw(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
                   t0);
 }
@@ -4520,8 +4522,8 @@ static void gen_twi(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_tl(SIMM(ctx->opcode));
-    t1 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_tl(SIMM(ctx->opcode));
+    t1 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_tw(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
 }
 
@@ -4534,7 +4536,7 @@ static void gen_td(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
                   t0);
 }
@@ -4548,8 +4550,8 @@ static void gen_tdi(DisasContext *ctx)
     if (check_unconditional_trap(ctx)) {
         return;
     }
-    t0 = tcg_const_tl(SIMM(ctx->opcode));
-    t1 = tcg_const_i32(TO(ctx->opcode));
+    t0 = tcg_constant_tl(SIMM(ctx->opcode));
+    t1 = tcg_constant_i32(TO(ctx->opcode));
     gen_helper_td(cpu_env, cpu_gpr[rA(ctx->opcode)], t0, t1);
 }
 #endif
@@ -5026,7 +5028,7 @@ static void gen_dcbz(DisasContext *ctx)
 
     gen_set_access_type(ctx, ACCESS_CACHE);
     tcgv_addr = tcg_temp_new();
-    tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
+    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
     gen_addr_reg_index(ctx, tcgv_addr);
     gen_helper_dcbz(cpu_env, tcgv_addr, tcgv_op);
 }
@@ -5039,7 +5041,7 @@ static void gen_dcbzep(DisasContext *ctx)
 
     gen_set_access_type(ctx, ACCESS_CACHE);
     tcgv_addr = tcg_temp_new();
-    tcgv_op = tcg_const_i32(ctx->opcode & 0x03FF000);
+    tcgv_op = tcg_constant_i32(ctx->opcode & 0x03FF000);
     gen_addr_reg_index(ctx, tcgv_addr);
     gen_helper_dcbzep(cpu_env, tcgv_addr, tcgv_op);
 }
@@ -5114,7 +5116,7 @@ static void gen_mfsr(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5143,7 +5145,7 @@ static void gen_mtsr(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5175,7 +5177,7 @@ static void gen_mfsr_64b(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5204,7 +5206,7 @@ static void gen_mtsr_64b(DisasContext *ctx)
     TCGv t0;
 
     CHK_SV(ctx);
-    t0 = tcg_const_tl(SR(ctx->opcode));
+    t0 = tcg_constant_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5558,7 +5560,7 @@ static void gen_mfdcr(DisasContext *ctx)
     TCGv dcrn;
 
     CHK_SV(ctx);
-    dcrn = tcg_const_tl(SPR(ctx->opcode));
+    dcrn = tcg_constant_tl(SPR(ctx->opcode));
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env, dcrn);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5572,7 +5574,7 @@ static void gen_mtdcr(DisasContext *ctx)
     TCGv dcrn;
 
     CHK_SV(ctx);
-    dcrn = tcg_const_tl(SPR(ctx->opcode));
+    dcrn = tcg_constant_tl(SPR(ctx->opcode));
     gen_helper_store_dcr(cpu_env, dcrn, cpu_gpr[rS(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5793,7 +5795,7 @@ static void gen_tlbre_440(DisasContext *ctx)
     case 1:
     case 2:
         {
-            TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
+            TCGv_i32 t0 = tcg_constant_i32(rB(ctx->opcode));
             gen_helper_440_tlbre(cpu_gpr[rD(ctx->opcode)], cpu_env,
                                  t0, cpu_gpr[rA(ctx->opcode)]);
         }
@@ -5839,7 +5841,7 @@ static void gen_tlbwe_440(DisasContext *ctx)
     case 1:
     case 2:
         {
-            TCGv_i32 t0 = tcg_const_i32(rB(ctx->opcode));
+            TCGv_i32 t0 = tcg_constant_i32(rB(ctx->opcode));
             gen_helper_440_tlbwe(cpu_env, t0, cpu_gpr[rA(ctx->opcode)],
                                  cpu_gpr[rS(ctx->opcode)]);
         }
@@ -5981,7 +5983,7 @@ static void gen_wrteei(DisasContext *ctx)
 /* dlmzb */
 static void gen_dlmzb(DisasContext *ctx)
 {
-    TCGv_i32 t0 = tcg_const_i32(Rc(ctx->opcode));
+    TCGv_i32 t0 = tcg_constant_i32(Rc(ctx->opcode));
     gen_helper_dlmzb(cpu_gpr[rA(ctx->opcode)], cpu_env,
                      cpu_gpr[rS(ctx->opcode)], cpu_gpr[rB(ctx->opcode)], t0);
 }
-- 
2.34.1


