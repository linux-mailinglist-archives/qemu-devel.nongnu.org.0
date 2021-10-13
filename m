Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45AF42B337
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:15:52 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUk4-0004Lq-Ps
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI5-000525-1G
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUI1-0005D8-UM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:48 -0400
Received: by mail-pl1-x630.google.com with SMTP id 21so785554plo.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O7p/UQX85gsSrL9h3Ho/u9/oHHasfkLJHADwG/5kd8Q=;
 b=fHs3XehzsGDqCr8ErW7D8aaZ0wYaIj2GHZaxrSkfE5rfa9uGZg6SC24C/3Hbx+rtt4
 hzWnKUaOirUFhwuJLD/sOSupqsZrLsTUawW+p4xEZ2MJFtxTneQnbtR+Kz5hqkQp9W0u
 YrA+CAm/QDzkjJawmh6tWRJA7CaBrGHc3DITt6XFax8IqkHtJylLpzFN6tEDaTZHipSe
 C+Ec3fFy/DgZsUqG1BfCXT3OKP27kRGolA/Rug5KMroY1AGLyNO7JD8fdjvasjQHnF1f
 CdafEchjdu01eY+abVzPqjPcCHSIMWM+3Pv+8CIjJQZLE6Bw9Ct9Ex02q2hNr7NXy8kX
 DKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7p/UQX85gsSrL9h3Ho/u9/oHHasfkLJHADwG/5kd8Q=;
 b=rmWYlyBAGmj3rn92QlW3Fiiwxle3SIdTNN6dc+z8g+ipejp21xus4IJO2GCwTVgIS6
 vHUJHm9qDsKYmO3NYyo5Pvzas4GaZ55Z/ypqMcDQMv6JWKUKZB2FA5uH3izZRDjPf+EM
 2iOOV73PRSQMubRSCofHzBRYXaxyh72LoDmLiD+zRB6a1wJspYYwX0MFYT8n0Uy8xiFh
 E/jMiEx/NDEHPDVwp3NhvQG1qLj+a0Igo89BzQdM78IqZ6kNKM1oF30XVAohRaBZeqpA
 bFPpkx2dm5If3pSVk/hgC6rCz/bd15yFLeSvPhaT0v+JSWwmEBWOCHiGKp2RtghrXrY9
 mALA==
X-Gm-Message-State: AOAM531/byOzD1OvZgi85iLrNNJp4NFVXS8GZCOjbHdgvxcSoU2yuf70
 z3HYjPBDfFwAFRginePO2BjeI8DHmj82lg==
X-Google-Smtp-Source: ABdhPJzy9VXqZ9OFAjLyvXVY3MgWrKkOimg8nnNx84fprgiP1krU9+yftt0BvgXSpazAmQHKnL+Myg==
X-Received: by 2002:a17:90a:c081:: with SMTP id
 o1mr10645683pjs.24.1634093204660; 
 Tue, 12 Oct 2021 19:46:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 35/48] target/alpha: Reorg fp memory operations
Date: Tue, 12 Oct 2021 19:45:54 -0700
Message-Id: <20211013024607.731881-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index b034206688..bfdd485508 100644
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


