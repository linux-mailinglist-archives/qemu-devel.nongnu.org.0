Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E63F0C05
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:44:49 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRUW-0004Ex-4Z
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9t-0007Rg-W7
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:30 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9s-0002mh-3E
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:29 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so9645647pjr.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zEnfvNO0WJgcbZQiUdiKMgfrPKbnuzMC2k3Xg5uzt5E=;
 b=Eg+IafTHoX0mgwlvnaWtiDSQyFYLfWPYuHmHDR+OPB75hmpv2DrNkT7uta3VPyzChK
 wwzbfljlEshuaT7SM0LeiYrBgpderLubuPd0/G8H8xD9hYLHt+UjFCHhoKz7frXEc67+
 prjC8SJPukPgm6zd7An+WlhyH0GNoyOD2tNf+WZDERSpqlmpnHqUd5WfTbTE27LtjF5h
 ZlmjSExoYtuoRIT5sqvqDrsVQcMe4ob0cAXmFSfobJsbMfxfLWcXI//N6LpV4IL6+TCx
 wsjV/Jc/zEYHC5Vf2xoX9hyvjptifWXfItQ1gqV/V/dk/XI3/HbYxJaFv/47oDH9/p8O
 YkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zEnfvNO0WJgcbZQiUdiKMgfrPKbnuzMC2k3Xg5uzt5E=;
 b=hcJPZooSRBlQ4j199Xo69MA3zk3r8HkVjO7f6rZpJax3v2a3QQdE5f6F+T6UQLfNNy
 FPGoq+s7GVnzXYJ9py8AGUVRI5aTOKdktgnkwpKR5m23njHd4uVPjKzL5hkvL/FEeSpg
 MtbZq7QTsbdHi6wBS6X2VCpdfThGufSCMXpoplpw3M8IZQqX0Uue1gyPoDJAgWSs93wv
 8pwIWBqHacsIVlklRntAU3QBSwIyDIkF3DdhYK1S0YHLclqpl4FVhMbKHxrcQF5QvTFV
 zrrT50rX+BrDXYbd6jH70PM6PQ8I+ayw1dDHNlb/U7Y9DNQ4rWhVRAPcFDdM+nUynCvi
 Osqw==
X-Gm-Message-State: AOAM533RBiHIP5kAYZ3OEu+VaKUh2RYpkEk9+WBrvFfXwzH81Z1ul0vo
 j1bvWN3l3McIrCJ/a5qYk6AfCnL7DCP5cA==
X-Google-Smtp-Source: ABdhPJw8JHq5Q97IPM9W8HrL7QZ4p0fdngyTQOOsj1GBT4Wsi3nsM2wUDDyb2eAxZdcRgREE2UVkJA==
X-Received: by 2002:a17:902:e850:b0:12d:ac12:1019 with SMTP id
 t16-20020a170902e85000b0012dac121019mr8590355plg.36.1629314606865; 
 Wed, 18 Aug 2021 12:23:26 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 52/66] target/alpha: Reorg fp memory operations
Date: Wed, 18 Aug 2021 09:19:06 -1000
Message-Id: <20210818191920.390759-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in the context to each mini-helper, instead of an
incorrectly named "flags".  Separate gen_load_fp and
gen_store_fp, away from the integer helpers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 83 +++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 26 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index de6c0a8439..607b6c3da7 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -267,30 +267,47 @@ static inline DisasJumpType gen_invalid(DisasContext *ctx)
     return gen_excp(ctx, EXCP_OPCDEC, 0);
 }
 
-static inline void gen_qemu_ldf(TCGv t0, TCGv t1, int flags)
+static void gen_ldf(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, t1, flags, MO_LEUL);
-    gen_helper_memory_to_f(t0, tmp32);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    gen_helper_memory_to_f(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
 
-static inline void gen_qemu_ldg(TCGv t0, TCGv t1, int flags)
+static void gen_ldg(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
-    tcg_gen_qemu_ld_i64(tmp, t1, flags, MO_LEQ);
-    gen_helper_memory_to_g(t0, tmp);
+    tcg_gen_qemu_ld_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
+    gen_helper_memory_to_g(dest, tmp);
     tcg_temp_free(tmp);
 }
 
-static inline void gen_qemu_lds(TCGv t0, TCGv t1, int flags)
+static void gen_lds(DisasContext *ctx, TCGv dest, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    tcg_gen_qemu_ld_i32(tmp32, t1, flags, MO_LEUL);
-    gen_helper_memory_to_s(t0, tmp32);
+    tcg_gen_qemu_ld_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
+    gen_helper_memory_to_s(dest, tmp32);
     tcg_temp_free_i32(tmp32);
 }
 
+static void gen_ldt(DisasContext *ctx, TCGv dest, TCGv addr)
+{
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mem_idx, MO_LEQ);
+}
+
+static void gen_load_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
+                        void (*func)(DisasContext *, TCGv, TCGv))
+{
+    /* Loads to $f31 are prefetches, which we can treat as nops. */
+    if (likely(ra != 31)) {
+        TCGv addr = tcg_temp_new();
+        tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
+        func(ctx, cpu_fir[ra], addr);
+        tcg_temp_free(addr);
+    }
+}
+
 static inline void gen_qemu_ldl_l(TCGv t0, TCGv t1, int flags)
 {
     tcg_gen_qemu_ld_i64(t0, t1, flags, MO_LESL);
@@ -338,30 +355,44 @@ static inline void gen_load_mem(DisasContext *ctx,
     tcg_temp_free(tmp);
 }
 
-static inline void gen_qemu_stf(TCGv t0, TCGv t1, int flags)
+static void gen_stf(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    gen_helper_f_to_memory(tmp32, t0);
-    tcg_gen_qemu_st_i32(tmp32, t1, flags, MO_LEUL);
+    gen_helper_f_to_memory(tmp32, addr);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
     tcg_temp_free_i32(tmp32);
 }
 
-static inline void gen_qemu_stg(TCGv t0, TCGv t1, int flags)
+static void gen_stg(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv tmp = tcg_temp_new();
-    gen_helper_g_to_memory(tmp, t0);
-    tcg_gen_qemu_st_i64(tmp, t1, flags, MO_LEQ);
+    gen_helper_g_to_memory(tmp, src);
+    tcg_gen_qemu_st_i64(tmp, addr, ctx->mem_idx, MO_LEQ);
     tcg_temp_free(tmp);
 }
 
-static inline void gen_qemu_sts(TCGv t0, TCGv t1, int flags)
+static void gen_sts(DisasContext *ctx, TCGv src, TCGv addr)
 {
     TCGv_i32 tmp32 = tcg_temp_new_i32();
-    gen_helper_s_to_memory(tmp32, t0);
-    tcg_gen_qemu_st_i32(tmp32, t1, flags, MO_LEUL);
+    gen_helper_s_to_memory(tmp32, src);
+    tcg_gen_qemu_st_i32(tmp32, addr, ctx->mem_idx, MO_LEUL);
     tcg_temp_free_i32(tmp32);
 }
 
+static void gen_stt(DisasContext *ctx, TCGv src, TCGv addr)
+{
+    tcg_gen_qemu_st_i64(src, addr, ctx->mem_idx, MO_LEQ);
+}
+
+static void gen_store_fp(DisasContext *ctx, int ra, int rb, int32_t disp16,
+                         void (*func)(DisasContext *, TCGv, TCGv))
+{
+    TCGv addr = tcg_temp_new();
+    tcg_gen_addi_i64(addr, load_gpr(ctx, rb), disp16);
+    func(ctx, load_fpr(ctx, ra), addr);
+    tcg_temp_free(addr);
+}
+
 static inline void gen_store_mem(DisasContext *ctx,
                                  void (*tcg_gen_qemu_store)(TCGv t0, TCGv t1,
                                                             int flags),
@@ -2776,42 +2807,42 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
     case 0x20:
         /* LDF */
         REQUIRE_FEN;
-        gen_load_mem(ctx, &gen_qemu_ldf, ra, rb, disp16, 1, 0);
+        gen_load_fp(ctx, ra, rb, disp16, gen_ldf);
         break;
     case 0x21:
         /* LDG */
         REQUIRE_FEN;
-        gen_load_mem(ctx, &gen_qemu_ldg, ra, rb, disp16, 1, 0);
+        gen_load_fp(ctx, ra, rb, disp16, gen_ldg);
         break;
     case 0x22:
         /* LDS */
         REQUIRE_FEN;
-        gen_load_mem(ctx, &gen_qemu_lds, ra, rb, disp16, 1, 0);
+        gen_load_fp(ctx, ra, rb, disp16, gen_lds);
         break;
     case 0x23:
         /* LDT */
         REQUIRE_FEN;
-        gen_load_mem(ctx, &tcg_gen_qemu_ld64, ra, rb, disp16, 1, 0);
+        gen_load_fp(ctx, ra, rb, disp16, gen_ldt);
         break;
     case 0x24:
         /* STF */
         REQUIRE_FEN;
-        gen_store_mem(ctx, &gen_qemu_stf, ra, rb, disp16, 1, 0);
+        gen_store_fp(ctx, ra, rb, disp16, gen_stf);
         break;
     case 0x25:
         /* STG */
         REQUIRE_FEN;
-        gen_store_mem(ctx, &gen_qemu_stg, ra, rb, disp16, 1, 0);
+        gen_store_fp(ctx, ra, rb, disp16, gen_stg);
         break;
     case 0x26:
         /* STS */
         REQUIRE_FEN;
-        gen_store_mem(ctx, &gen_qemu_sts, ra, rb, disp16, 1, 0);
+        gen_store_fp(ctx, ra, rb, disp16, gen_sts);
         break;
     case 0x27:
         /* STT */
         REQUIRE_FEN;
-        gen_store_mem(ctx, &tcg_gen_qemu_st64, ra, rb, disp16, 1, 0);
+        gen_store_fp(ctx, ra, rb, disp16, gen_stt);
         break;
     case 0x28:
         /* LDL */
-- 
2.25.1


