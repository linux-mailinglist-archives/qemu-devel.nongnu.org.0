Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2E3F0DCA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:59:22 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTaj-0002Iy-GL
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTXI-00046M-Vl
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTXF-0000El-Ui
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id x10so5736725wrt.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plLQHcycn8l88ybhBeU+6VWeQ95kgaH1lepgJR3+i98=;
 b=rEhhu+YpjyGiXej0YnpGBmBsr1LYM3NubkpuESDE7bvNCuPsc+efNW6tBFiFE61Iq7
 TRwMdCm7UkwgNtgc6Cb0jpdLnoXgniH2RjnOMOj5QfMquIvCAlalfiPtGtO4Spv7BlnQ
 EisMZwD4aDYhHY5/6wVSVhoYVwHQljAvrWVIdjGZNZHW+zHMxodWIvMKmN8Zve1cvh24
 15cF2dCIDOQkYcMQjp9G+UrY3o1SR7vB4ZX1BU3X+eCk2vl90CRR5uZVJgvIWzSdprDH
 Yddj5/wydy/HQlh16WFlMixjzWF3MiW9Jir6aWPpe89OHnKVkRnyet9NqEfqg6/1JxiN
 yKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=plLQHcycn8l88ybhBeU+6VWeQ95kgaH1lepgJR3+i98=;
 b=jYeaXY6gIYHU+Fa75nqe3LDm5D+LSG0Zso60dOiEnIx4NC2iF05JAG7OME6sBRytX1
 SNfTPAEqMTlbI2i8momwkv0Vrk//AAbRGsyFNBO+Eh+COAXTriZEMWdK/FfVtJUTGtix
 WfHVJlPsMVlaDObfpcPwwKV3fZzZNB7RnqUDTovyAnm6uAicYfoB1m6220m8Ov5DBBEF
 oGowVBeX/YGgR7FmoZOCQqLySNE3LO7CD2bsMmibO0C7wkjXVWug/eQOpf+o25if4zD2
 v4hBkG0EEQegUHTyeSP5+ele26Rc0eN4SgNlkojU1DJiok2Ejn8vE/CswXIRWlJ2M6Pi
 NfFA==
X-Gm-Message-State: AOAM530y5MbKZ0Zw0BjYLrngMDYqLzMIiGganj4wd/yqYyB/srf9fYD2
 cDn0esf6rX0DnDTe/Qr4FYYqexKsemU=
X-Google-Smtp-Source: ABdhPJw++Cp1vH0i1aiIQGFxwiHfBdJFf7R/znNPfq85bE5JnMmE4cjjXqMs7u31/3BgWkXO1Quu0A==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr12811613wru.80.1629323744489; 
 Wed, 18 Aug 2021 14:55:44 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r10sm1000599wrp.28.2021.08.18.14.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
Date: Wed, 18 Aug 2021 23:55:17 +0200
Message-Id: <20210818215517.2560994-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
References: <20210818215517.2560994-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the inlined cpu_is_bigendian() function in "translate.h".

Replace the TARGET_WORDS_BIGENDIAN #ifdef'ry by calls to
cpu_is_bigendian().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818164321.2474534-6-f4bug@amsat.org>
---
 target/mips/tcg/translate.h              |  5 ++
 target/mips/tcg/translate.c              | 70 ++++++++++++------------
 target/mips/tcg/nanomips_translate.c.inc | 20 +++----
 3 files changed, 50 insertions(+), 45 deletions(-)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 9d325c836aa..dfb1552c2fc 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -212,4 +212,9 @@ bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
 
+static inline bool cpu_is_bigendian(DisasContext *ctx)
+{
+    return extract32(ctx->CP0_Config0, CP0C0_BE, 1);
+}
+
 #endif
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 572104e2cc2..f182e64643d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2093,9 +2093,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
          */
         tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
         tcg_gen_andi_tl(t1, t0, 7);
-#ifndef TARGET_WORDS_BIGENDIAN
-        tcg_gen_xori_tl(t1, t1, 7);
-#endif
+        if (!cpu_is_bigendian(ctx)) {
+            tcg_gen_xori_tl(t1, t1, 7);
+        }
         tcg_gen_shli_tl(t1, t1, 3);
         tcg_gen_andi_tl(t0, t0, ~7);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ);
@@ -2117,9 +2117,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
          */
         tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
         tcg_gen_andi_tl(t1, t0, 7);
-#ifdef TARGET_WORDS_BIGENDIAN
-        tcg_gen_xori_tl(t1, t1, 7);
-#endif
+        if (cpu_is_bigendian(ctx)) {
+            tcg_gen_xori_tl(t1, t1, 7);
+        }
         tcg_gen_shli_tl(t1, t1, 3);
         tcg_gen_andi_tl(t0, t0, ~7);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEQ);
@@ -2198,9 +2198,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
          */
         tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
         tcg_gen_andi_tl(t1, t0, 3);
-#ifndef TARGET_WORDS_BIGENDIAN
-        tcg_gen_xori_tl(t1, t1, 3);
-#endif
+        if (!cpu_is_bigendian(ctx)) {
+            tcg_gen_xori_tl(t1, t1, 3);
+        }
         tcg_gen_shli_tl(t1, t1, 3);
         tcg_gen_andi_tl(t0, t0, ~3);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
@@ -2226,9 +2226,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
          */
         tcg_gen_qemu_ld_tl(t1, t0, mem_idx, MO_UB);
         tcg_gen_andi_tl(t1, t0, 3);
-#ifdef TARGET_WORDS_BIGENDIAN
-        tcg_gen_xori_tl(t1, t1, 3);
-#endif
+        if (cpu_is_bigendian(ctx)) {
+            tcg_gen_xori_tl(t1, t1, 3);
+        }
         tcg_gen_shli_tl(t1, t1, 3);
         tcg_gen_andi_tl(t0, t0, ~3);
         tcg_gen_qemu_ld_tl(t0, t0, mem_idx, MO_TEUL);
@@ -4445,9 +4445,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             t1 = tcg_temp_new();
             tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
             tcg_gen_andi_tl(t1, t0, 3);
-#ifndef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 3);
-#endif
+            if (!cpu_is_bigendian(ctx)) {
+                tcg_gen_xori_tl(t1, t1, 3);
+            }
             tcg_gen_shli_tl(t1, t1, 3);
             tcg_gen_andi_tl(t0, t0, ~3);
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
@@ -4475,9 +4475,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             t1 = tcg_temp_new();
             tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
             tcg_gen_andi_tl(t1, t0, 3);
-#ifdef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 3);
-#endif
+            if (cpu_is_bigendian(ctx)) {
+                tcg_gen_xori_tl(t1, t1, 3);
+            }
             tcg_gen_shli_tl(t1, t1, 3);
             tcg_gen_andi_tl(t0, t0, ~3);
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEUL);
@@ -4507,9 +4507,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             t1 = tcg_temp_new();
             tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
             tcg_gen_andi_tl(t1, t0, 7);
-#ifndef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 7);
-#endif
+            if (!cpu_is_bigendian(ctx)) {
+                tcg_gen_xori_tl(t1, t1, 7);
+            }
             tcg_gen_shli_tl(t1, t1, 3);
             tcg_gen_andi_tl(t0, t0, ~7);
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
@@ -4529,9 +4529,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
             t1 = tcg_temp_new();
             tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_UB);
             tcg_gen_andi_tl(t1, t0, 7);
-#ifdef TARGET_WORDS_BIGENDIAN
-            tcg_gen_xori_tl(t1, t1, 7);
-#endif
+            if (cpu_is_bigendian(ctx)) {
+                tcg_gen_xori_tl(t1, t1, 7);
+            }
             tcg_gen_shli_tl(t1, t1, 3);
             tcg_gen_andi_tl(t0, t0, ~7);
             tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ);
@@ -11464,17 +11464,17 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
             gen_set_label(l1);
             tcg_gen_brcondi_tl(TCG_COND_NE, t0, 4, l2);
             tcg_temp_free(t0);
-#ifdef TARGET_WORDS_BIGENDIAN
-            gen_load_fpr32(ctx, fp, fs);
-            gen_load_fpr32h(ctx, fph, ft);
-            gen_store_fpr32h(ctx, fp, fd);
-            gen_store_fpr32(ctx, fph, fd);
-#else
-            gen_load_fpr32h(ctx, fph, fs);
-            gen_load_fpr32(ctx, fp, ft);
-            gen_store_fpr32(ctx, fph, fd);
-            gen_store_fpr32h(ctx, fp, fd);
-#endif
+            if (cpu_is_bigendian(ctx)) {
+                gen_load_fpr32(ctx, fp, fs);
+                gen_load_fpr32h(ctx, fph, ft);
+                gen_store_fpr32h(ctx, fp, fd);
+                gen_store_fpr32(ctx, fph, fd);
+            } else {
+                gen_load_fpr32h(ctx, fph, fs);
+                gen_load_fpr32(ctx, fp, ft);
+                gen_store_fpr32(ctx, fph, fd);
+                gen_store_fpr32h(ctx, fp, fd);
+            }
             gen_set_label(l2);
             tcg_temp_free_i32(fp);
             tcg_temp_free_i32(fph);
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 09e64a69480..a66ae267963 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -999,11 +999,11 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
 
     gen_base_offset_addr(ctx, taddr, base, offset);
     tcg_gen_qemu_ld64(tval, taddr, ctx->mem_idx);
-#ifdef TARGET_WORDS_BIGENDIAN
-    tcg_gen_extr_i64_tl(tmp2, tmp1, tval);
-#else
-    tcg_gen_extr_i64_tl(tmp1, tmp2, tval);
-#endif
+    if (cpu_is_bigendian(ctx)) {
+        tcg_gen_extr_i64_tl(tmp2, tmp1, tval);
+    } else {
+        tcg_gen_extr_i64_tl(tmp1, tmp2, tval);
+    }
     gen_store_gpr(tmp1, reg1);
     tcg_temp_free(tmp1);
     gen_store_gpr(tmp2, reg2);
@@ -1035,11 +1035,11 @@ static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
     gen_load_gpr(tmp1, reg1);
     gen_load_gpr(tmp2, reg2);
 
-#ifdef TARGET_WORDS_BIGENDIAN
-    tcg_gen_concat_tl_i64(tval, tmp2, tmp1);
-#else
-    tcg_gen_concat_tl_i64(tval, tmp1, tmp2);
-#endif
+    if (cpu_is_bigendian(ctx)) {
+        tcg_gen_concat_tl_i64(tval, tmp2, tmp1);
+    } else {
+        tcg_gen_concat_tl_i64(tval, tmp1, tmp2);
+    }
 
     tcg_gen_ld_i64(llval, cpu_env, offsetof(CPUMIPSState, llval_wp));
     tcg_gen_atomic_cmpxchg_i64(val, taddr, llval, tval,
-- 
2.31.1


