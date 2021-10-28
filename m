Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E9A43F18B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:21:53 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCqO-0004ep-3H
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfE-0000iK-Bs
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCf4-00065N-0D
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id 192so5450796wme.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/XIOlzqQF8iXXuQpQbaTcPWV8ppeq9raGvH0jf38P5g=;
 b=H3bjSGn1918aO3esCMklf4NdLm106T9ZIcQ39yfZ5fiEvynCxd5H0tY0LFagWz+2pa
 OuMdpjHC9bM21SJO9mjv1F6BoxeyygjYNT2Jwso/I55nvR8GnR4dads/kDZoZGuHW+7j
 uPD6x8QxR5yTNiMTXtHqSPXhVisGFHowjQW1lllY0gQdRUIcKorjzHconNONlk2//GYT
 gINijASduJ/x6zYCu122QRasXed3+E1KgcAIneCwmv3ha8aL2wdpH+qYqllI5MWpAPnH
 OHnGqMtK4v+ESgi0/3l4EXf/DHpDbVwXjcBTHQcWkfnQ8vQqUkwmIDIU10gngQRbo9xR
 TuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/XIOlzqQF8iXXuQpQbaTcPWV8ppeq9raGvH0jf38P5g=;
 b=vFS24he4rCG7PuUOW8nJAvvd5zJ40gvzDRurDEdsl3nzlThJ02Wuw+On5iib1Zb177
 eno2dUqAGbof7bn6BLmi0fuyLEQFn9JJhWZwpK+sD/eq11/KVy3uPRcXE+gQ0n19aD3p
 Jw7e+pF3bYZaCiTBDAU3mX8yubV4YqyNkGMpM69x7GRadwyc92j2KhMMIT2YFZGS6cqW
 XCS6p0rF4TL3PLDH1q2x3HPV9IjqPbu93k/YVWtKUmyaVcGndErO0aNo0FNn6VEqW8BI
 DVmB5fRfIxMAv1Y/tFMwxhzcDtDPyeU5oqMyqwXK9gSX92l5V+BNw0bCc77UistMOIC+
 eBpw==
X-Gm-Message-State: AOAM532+3HYCbsS6ZX6P/wUi57seo/m0CUvTg1QNI8FMLkpk9RM/Y9XA
 ZPaBnFjaj8zx59n4UkfYnUJPLSg0ecQ=
X-Google-Smtp-Source: ABdhPJxEANAr98lTjUi9TEr7pplUwNU78qpAfbb5BiFfFE29/hjvdmfPbPYrNFZ/2pbJV4mOaU+60A==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr15208458wmh.19.1635455408321; 
 Thu, 28 Oct 2021 14:10:08 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f133sm1469210wmf.31.2021.10.28.14.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/32] target/mips: Convert MSA VEC instruction format to
 decodetree
Date: Thu, 28 Oct 2021 23:08:28 +0200
Message-Id: <20211028210843.2120802-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register instructions with implicit data formats
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Do not add trans_msa_vec(), directly use trans_msa_3r()
---
 target/mips/tcg/msa.decode      |  8 +++
 target/mips/tcg/msa_translate.c | 98 ++++++++-------------------------
 2 files changed, 31 insertions(+), 75 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index b6ac80560f6..afcb868aade 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -27,6 +27,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
@@ -83,6 +84,13 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  AND_V             011110 00000 ..... ..... .....  011110  @vec
+  OR_V              011110 00001 ..... ..... .....  011110  @vec
+  NOR_V             011110 00010 ..... ..... .....  011110  @vec
+  XOR_V             011110 00011 ..... ..... .....  011110  @vec
+  BMNZ_V            011110 00100 ..... ..... .....  011110  @vec
+  BMZ_V             011110 00101 ..... ..... .....  011110  @vec
+  BSEL_V            011110 00110 ..... ..... .....  011110  @vec
   FILL              011110 11000000 .. ..... .....  011110  @2r
   PCNT              011110 11000001 .. ..... .....  011110  @2r
   NLOC              011110 11000010 .. ..... .....  011110  @2r
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index f0077f7e54c..f063a08631c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -45,19 +45,9 @@ enum {
     OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
     OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
     OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
-    OPC_MSA_VEC     = 0x1E | OPC_MSA,
 };
 
 enum {
-    /* VEC/2R instruction */
-    OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
-    OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
-    OPC_NOR_V       = (0x02 << 21) | OPC_MSA_VEC,
-    OPC_XOR_V       = (0x03 << 21) | OPC_MSA_VEC,
-    OPC_BMNZ_V      = (0x04 << 21) | OPC_MSA_VEC,
-    OPC_BMZ_V       = (0x05 << 21) | OPC_MSA_VEC,
-    OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
-
     /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
     OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
     OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
@@ -515,6 +505,29 @@ TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
 
+static bool trans_msa_3r(DisasContext *ctx, arg_msa_r *a,
+                         gen_helper_piii *gen_msa_3r)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_msa_3r(cpu_env,
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->wt));
+
+    return true;
+}
+
+TRANS(AND_V,            trans_msa_3r,   gen_helper_msa_and_v);
+TRANS(OR_V,             trans_msa_3r,   gen_helper_msa_or_v);
+TRANS(NOR_V,            trans_msa_3r,   gen_helper_msa_nor_v);
+TRANS(XOR_V,            trans_msa_3r,   gen_helper_msa_xor_v);
+TRANS(BMNZ_V,           trans_msa_3r,   gen_helper_msa_bmnz_v);
+TRANS(BMZ_V,            trans_msa_3r,   gen_helper_msa_bmz_v);
+TRANS(BSEL_V,           trans_msa_3r,   gen_helper_msa_bsel_v);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -1897,68 +1910,6 @@ TRANS(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
 TRANS(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
 TRANS(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
-static void gen_msa_vec_v(DisasContext *ctx)
-{
-#define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
-
-    switch (MASK_MSA_VEC(ctx->opcode)) {
-    case OPC_AND_V:
-        gen_helper_msa_and_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_OR_V:
-        gen_helper_msa_or_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_NOR_V:
-        gen_helper_msa_nor_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_XOR_V:
-        gen_helper_msa_xor_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BMNZ_V:
-        gen_helper_msa_bmnz_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BMZ_V:
-        gen_helper_msa_bmz_v(cpu_env, twd, tws, twt);
-        break;
-    case OPC_BSEL_V:
-        gen_helper_msa_bsel_v(cpu_env, twd, tws, twt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
-}
-
-static void gen_msa_vec(DisasContext *ctx)
-{
-    switch (MASK_MSA_VEC(ctx->opcode)) {
-    case OPC_AND_V:
-    case OPC_OR_V:
-    case OPC_NOR_V:
-    case OPC_XOR_V:
-    case OPC_BMNZ_V:
-    case OPC_BMZ_V:
-    case OPC_BSEL_V:
-        gen_msa_vec_v(ctx);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
@@ -1987,9 +1938,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_3RF_1C:
         gen_msa_3rf(ctx);
         break;
-    case OPC_MSA_VEC:
-        gen_msa_vec(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


