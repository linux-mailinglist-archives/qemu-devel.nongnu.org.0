Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37B544303D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:22:58 +0100 (CET)
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhugj-0005GB-SF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6J-0004eV-IS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6H-0006Ki-L5
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id d13so33400229wrf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rHZaBWEEW+7a68nLLkWFu30mkgdivQFeUDplAmDWZU=;
 b=fa+8apDxxvoDqszJQTf/rav9DFVyqYIRWCHzyMBLhoblac2ti7v7v9z2yogOxyLqFr
 TmHioWGAY+CJ9Hu6yUSzXgqhNAlGye2Y6nhWOEi1aZZmpAeHIw1n8iIqyD7C/zL8nPGt
 9jU0Ip4rVZuXxt6/LXNs80tQr70o4UOtDZa6YWw/iiqFvZGS6VfJz0Kj5GmtAMWcvYII
 oHUjBKQEJMf68MY0q5JlKLMEE6sdCSZQ3wMlsoi3Fe5z69HyyIZJTfQRGjVUdGczeuHt
 KJ8lNXzNl2NcorBjHZznQnkid181wEKgJsFEKXER4u5o6MWAlY4rgGRCzl+vlNuljZjH
 ZMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+rHZaBWEEW+7a68nLLkWFu30mkgdivQFeUDplAmDWZU=;
 b=ABhuUYQUsW0OwAzesAEbs3x6Qs/5aOfdFmWKsRSVxmMYrQ3vf7J+4ND8kwnLreaFzt
 v8XuQHi9h3M7om1PbMgZqQ1AjZnqutkxIX4ToNNc2xTupqjvqPZJ1r2Vo789gPfO+Z5A
 7sQz6f07iQyUj/26U0pc+O1LNH/hNqAXRvcgwjbvF4VyvCwJxPM+FfAewwTyS5+cBquI
 /dyGJXwdww+6fEMzp5njzGDP4Vt6hEA9hsupOgXoEYeDzaDBQNhfvqYFkdP9Vbxcjlwq
 APdz42JgE1YJeFiFmO1sC7oNRXRYxJi8qTIleGMHzGTDJDZOUHhEk5uix3ViR5t9Ig6U
 AqBw==
X-Gm-Message-State: AOAM532SoMwYAzjWjMQ4a+w6/uUl886wk9jBCI9CYzcrnqOsLUlTyS56
 gYG2P9HuDO/j/zS6/bezr1YYxNg6A/8=
X-Google-Smtp-Source: ABdhPJyQGK1+TNNqiHTyFmdt1b9R4keO05MVCSs/XfUa+4664lMyOMVvcrrBtxmCEnENnZOpBF3Nhg==
X-Received: by 2002:adf:959a:: with SMTP id p26mr46426802wrp.342.1635860716043; 
 Tue, 02 Nov 2021 06:45:16 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 n66sm2715401wmn.2.2021.11.02.06.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/41] target/mips: Convert CTCMSA opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:31 +0100
Message-Id: <20211102134240.3036524-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CTCMSA (Copy To Control MSA register) opcode
to decodetree. Since it overlaps with the SLDI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-30-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  5 ++-
 target/mips/tcg/msa_translate.c | 69 ++++++---------------------------
 2 files changed, 16 insertions(+), 58 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index de8153a89bf..a4c7cceb15f 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -167,7 +167,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_S            011110 110.. ..... ..... .....  010101  @3r
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
-  SLDI              011110 0000 ...... ..... .....  011001  @elm_df
+  {
+    CTCMSA          011110 0000111110  ..... .....  011001  @elm
+    SLDI            011110 0000 ...... ..... .....  011001  @elm_df
+  }
   {
     CFCMSA          011110 0001111110  ..... .....  011001  @elm
     SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 764b33741aa..c054a05f8ba 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -35,18 +35,6 @@ static inline int plus_2(DisasContext *s, int x)
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
-#define OPC_MSA (0x1E << 26)
-
-#define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
-enum {
-    OPC_MSA_ELM     = 0x19 | OPC_MSA,
-};
-
-enum {
-    /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
-    OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-};
-
 static const char msaregnames[][6] = {
     "w0.d0",  "w0.d1",  "w1.d0",  "w1.d1",
     "w2.d0",  "w2.d1",  "w3.d0",  "w3.d1",
@@ -544,27 +532,22 @@ static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
     return true;
 }
 
-static void gen_msa_elm_3e(DisasContext *ctx)
+static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
 {
-#define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
-    uint8_t source = (ctx->opcode >> 11) & 0x1f;
-    uint8_t dest = (ctx->opcode >> 6) & 0x1f;
-    TCGv telm = tcg_temp_new();
-    TCGv_i32 tdt = tcg_const_i32(dest);
+    TCGv telm;
 
-    switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
-    case OPC_CTCMSA:
-        gen_load_gpr(telm, source);
-        gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
+    telm = tcg_temp_new();
+
+    gen_load_gpr(telm, a->ws);
+    gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
+
     tcg_temp_free(telm);
-    tcg_temp_free_i32(tdt);
+
+    return true;
 }
 
 static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
@@ -669,20 +652,6 @@ static bool trans_INSERT(DisasContext *ctx, arg_msa_elm_df *a)
     return trans_msa_elm_fn(ctx, a, gen_msa_insert);
 }
 
-static void gen_msa_elm(DisasContext *ctx)
-{
-    uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
-
-    if (dfn == 0x3E) {
-        /* CTCMSA */
-        gen_msa_elm_3e(ctx);
-        return;
-    } else {
-        gen_reserved_instruction(ctx);
-        return;
-    }
-}
-
 TRANS(FCAF,     trans_msa_3rf, gen_helper_msa_fcaf_df);
 TRANS(FCUN,     trans_msa_3rf, gen_helper_msa_fcun_df);
 TRANS(FCEQ,     trans_msa_3rf, gen_helper_msa_fceq_df);
@@ -796,21 +765,7 @@ TRANS(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
-    uint32_t opcode = ctx->opcode;
-
-    if (!check_msa_enabled(ctx)) {
-        return true;
-    }
-
-    switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_ELM:
-        gen_msa_elm(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
+    gen_reserved_instruction(ctx);
 
     return true;
 }
-- 
2.31.1


