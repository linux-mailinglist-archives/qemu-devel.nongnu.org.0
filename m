Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E943F0987
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:47:46 +0200 (CEST)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOjB-0001ig-LV
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfO-0004Cq-EC
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfM-0004F7-MK
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g138so2012712wmg.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMYYt4B6oY1Eiz/WyQSJSJd0kDXrXr2MuSZmhyLpRn4=;
 b=DCWj1wrmSZocRggT62FN7hs+vMRZUVPET5VzeH3V2787lQtn6nCWySP2iMfQxikBBe
 sCVKhxBCiTJuR/E0cK8ERG8ytDMg8Qcic0fPrwhRkzXMbc9dTX9cYhyURysbxWcdwYVb
 43RqtnexNGIAMCrehWMJQ9b2Hrbrbof/sXkY4II62zg8onP4bbTLBEv48MY/RQNK0lfp
 6PTPYyLaXGHZ4nKZCxY6ZWcm4vX1jDsgwwjkXSv9oL2CpzGVgJVhtMz9rVGQdMvztu3h
 eQ2czyWtxjyfgSuVzHa3Vri6isbRQ0ga2squ/4rrzedISDDYiqLBiD4wGbY4sTuOFDIU
 aFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UMYYt4B6oY1Eiz/WyQSJSJd0kDXrXr2MuSZmhyLpRn4=;
 b=cQkmQzcdCaUlkTMFjEc5IMMZo08GGosyjmSao7FVCWe8EQetMUsflJoOGiippPEXmf
 wWbQiVMUbnC92tSNmLIy162JqlU8slbrJvffmKC6NQHLA4Vso8zaSSgjZjFfSBKQsP5Q
 YJ0NUHiREPLeOjcAU8iGAHG7GNibAa/abrgS4s2aDqQEpv4PufedRXGCCoR3PqmQAX5A
 k53G3UQkZs3uhVVNcLNfp49qoebinE9P9phIWk2roDh4YaZgG4xCobzItMD2LByEWZ69
 qw9R1PbxqW4gaziYRppA4Kb9qOnpmKU9snhpn2ZtXe5S8OyGXfRc/vyMKlLGaNTXdwFu
 REQw==
X-Gm-Message-State: AOAM532DeX7tN1e2QX2A1Z0pVw6Eooox8oIK6W9I9cSh9Qnyhxz+WktO
 rQiNuqRX0kBl9KdHbP4nmexmZlOoXV0=
X-Google-Smtp-Source: ABdhPJxrdjSZzWF2TF7EHbotO6qIs+x/0h8kvOsIRIqdHcyhfXiuAOEFseioIHrzldrg5PDop0a02w==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr8864029wmd.33.1629305027088; 
 Wed, 18 Aug 2021 09:43:47 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m7sm5296848wmq.29.2021.08.18.09.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
Date: Wed, 18 Aug 2021 18:43:21 +0200
Message-Id: <20210818164321.2474534-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818164321.2474534-1-f4bug@amsat.org>
References: <20210818164321.2474534-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the inlined cpu_is_bigendian() function in "translate.h".

Replace the TARGET_WORDS_BIGENDIAN #ifdef'ry by calls to
cpu_is_bigendian().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


