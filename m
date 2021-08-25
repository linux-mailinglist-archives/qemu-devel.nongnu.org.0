Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B63F75CB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:20:29 +0200 (CEST)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIspQ-0001Uo-8v
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZy-00038X-9Z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZs-0002xw-JK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id g135so5659802wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oYhzaZUURzfrDTcroBAA5i/YZ8QE6/uSOX7tjzBaBZY=;
 b=rhLv9g6dKVbij5hQBlahIyC79+sFra4185bN3ZYxVi2JIJEWxDgrGg1tKZAONx1vEq
 AgCF5sM2S8tnOWh/Q7Fetq8FBrNHKYbWxnZHM0zhj7HyOEFwwltKdnqVfvaAfIlWq3RO
 SeNvDZ5opwir96k60pmDL4ZYCP1pVsuPh+tnZnw9Baffp+3S0/VBrq/qZjrBTDS20RoJ
 7qmsdVO5oMDvcHJ5cmR4pGd/98IGjF94CcUtqgyRGPHbzXimfCLsz6CO8TjSZlaMCvlc
 ehPwPmTSQFWKZFRFuyeBXirCWHw8TpRaUpD0LhE7Op1jHPNq4ZBZqoQ8p6IEXZEUhyj2
 EgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oYhzaZUURzfrDTcroBAA5i/YZ8QE6/uSOX7tjzBaBZY=;
 b=inLu5wqe2kHEQfATkvTD58nvidG7S+jJ8bkdmZ62yjzc+9TxabGC48oJmJ9t6rlQaK
 YGB/TGxw9g1RKwa7N9w/t5Pyqec7qSSMnjbQwXXu72QOfMXNRxJSHPWtu5nbtxFi+7Yh
 sx0AAuWDohNTOraZFOFTx15CteWxmYFOG+5L1251PCjP1TIIrDCeYC8rYRYgkFg2+Ez5
 2siRoaD44nT4vPnHunqRC7diSOkX10zdzYiGcCuko0/7kdXfoj0uwlLnEuWwLybGyE+/
 VE7aMF+LjS6qqBbbppiy6nreW/QjDDRYManHDtJx9rED8cTMi654L/vKbdOQ5w2RoHEE
 GbDA==
X-Gm-Message-State: AOAM532jmnmzWNeneUJGy+bedk16wyVPqOs1PSx6o+sxTwwCdqwjVnz7
 KNuNhj+c5bTk1ucJkrV29Fq7OgYqqEM=
X-Google-Smtp-Source: ABdhPJycEEqrDEPL9ejIRhHtZ3vn4GwkFe3DRz0393/m6c5M82qFdBfN4yygugmINGmOc0BBtkrelQ==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr549111wmh.186.1629896663127; 
 Wed, 25 Aug 2021 06:04:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n4sm5570793wro.81.2021.08.25.06.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:04:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
Date: Wed, 25 Aug 2021 15:02:11 +0200
Message-Id: <20210825130211.1542338-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 4b4fa2c207e..6111493651f 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -224,4 +224,9 @@ bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
 
+static inline bool cpu_is_bigendian(DisasContext *ctx)
+{
+    return extract32(ctx->CP0_Config0, CP0C0_BE, 1);
+}
+
 #endif
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index ac97f5f6f0f..6f4a9a839c2 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2048,9 +2048,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
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
@@ -2072,9 +2072,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
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
@@ -2153,9 +2153,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
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
@@ -2181,9 +2181,9 @@ static void gen_ld(DisasContext *ctx, uint32_t opc,
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
@@ -4400,9 +4400,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
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
@@ -4430,9 +4430,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
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
@@ -4462,9 +4462,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
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
@@ -4484,9 +4484,9 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
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
@@ -11409,17 +11409,17 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
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


