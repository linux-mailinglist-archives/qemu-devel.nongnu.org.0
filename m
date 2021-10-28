Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353643F17C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:18:30 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCn7-0000Ex-Li
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeh-0008Bn-Ph
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCef-0005hi-PL
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id 71so4728366wma.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9X5774Ks6jqZNIGwg4GiyAz9jZPX2vzwLlsxZr1XRaU=;
 b=dxP9ttypF+ClLPw4ffD/R71pHafzIlxZHjE0HOKaLJP0MS4n/24ZQFfo1YhZHdG3qs
 rzfDeh/NBPt9JqAlZ5jxmQ2vPFVhXeC54O8AWKv4BuFkxiz4QJJvyxb7eETCSTEebIAN
 xC2t3UVYpCCNtAjSHapSl+clHRu3sDvadECSf0AM29a/riXEMcLpTd2TLDcXYEWyCq1H
 moI6zvs+bm/p7CbH6t6NfwG1gYz9m4pkPCAIEUaoH88R7XUKVC4s48SW6QTocrRL4aZ+
 9Qz57sz+Owa4zXWE420dmMTREu/oFuuU6dQrSnpeg0wQtDwTgS2B7DGBvdsjL8Fz1dsp
 P4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9X5774Ks6jqZNIGwg4GiyAz9jZPX2vzwLlsxZr1XRaU=;
 b=LNGh7LQlf8FPST5g5UzlkzVcaCJxpLCfMZJZHZj0iGf/aYG7NCtLcNAlti3DmXvgHV
 9FUlymbX/RDfkirqksCLYmdF0GzXauFG5wPdeHOeuklvcb9wmaYW9KsN6mqJQSErpgmB
 fRoOkaZB1AXqswbvr/y02p21gvoCR29/IkfAHU4aCx+RXThXIqPCfABJk7177FphKtwc
 jvep0j5pArfY5vo1eFiB+r5dhRGJxkuO3CWWPcpToWKe7+lQbLQxsDEF0akCmeuk1CxX
 cciC0uNvyslzU3bld0/r9mdKOG0ALERWoWf9MbAFCl+jkLseQEgo9gJ3huM1trwpBYVn
 oHHA==
X-Gm-Message-State: AOAM530E41tEmBK9sp8lpoSrm5IHQ2MjzyFsA3HVXMVQ4I2ffZo/DtrM
 pdC7OCXnx2g1GF9jlTpRB+N+boZwzSI=
X-Google-Smtp-Source: ABdhPJzMONfHLfTv5JCaWft2M2YRk0MGO80Udc+Oe4chErzEzSI/DHzMon22WF2ZkaYriMfdKfCMSA==
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr204961wme.160.1635455384212; 
 Thu, 28 Oct 2021 14:09:44 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p11sm8178667wmi.0.2021.10.28.14.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/32] target/mips: Convert MSA I8 instruction format to
 decodetree
Date: Thu, 28 Oct 2021 23:08:23 +0200
Message-Id: <20211028210843.2120802-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Convert instructions with an 8-bit immediate value and either
implicit data format or data format df to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Renamed &msa_i8 -> &msa_i
- Remove TRANS_MSA(), call check_msa_enabled in trans_X()
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 75 +++++++++------------------------
 2 files changed, 27 insertions(+), 56 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 8e887f54ad5..24847599a05 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -27,6 +27,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
+@i8                 ...... ..       sa:s8 ws:5 wd:5 ......  &msa_i df=0
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 @bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%bit_df m=%bit_m
 
@@ -39,6 +40,13 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  ANDI              011110 00 ........ ..... .....  000000  @i8
+  ORI               011110 01 ........ ..... .....  000000  @i8
+  NORI              011110 10 ........ ..... .....  000000  @i8
+  XORI              011110 11 ........ ..... .....  000000  @i8
+  BMNZI             011110 00 ........ ..... .....  000001  @i8
+  BMZI              011110 01 ........ ..... .....  000001  @i8
+  BSELI             011110 10 ........ ..... .....  000001  @i8
   SHF               011110 .. ........ ..... .....  000010  @i8_df
 
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index c776735f7c6..8fc02bd5e24 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -27,9 +27,6 @@ static int bit_df(DisasContext *ctx, int x);
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
 enum {
-    OPC_MSA_I8_00   = 0x00 | OPC_MSA,
-    OPC_MSA_I8_01   = 0x01 | OPC_MSA,
-    OPC_MSA_I8_02   = 0x02 | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -57,15 +54,6 @@ enum {
 };
 
 enum {
-    /* I8 instruction */
-    OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
-    OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
-    OPC_ORI_B       = (0x1 << 24) | OPC_MSA_I8_00,
-    OPC_BMZI_B      = (0x1 << 24) | OPC_MSA_I8_01,
-    OPC_NORI_B      = (0x2 << 24) | OPC_MSA_I8_00,
-    OPC_BSELI_B     = (0x2 << 24) | OPC_MSA_I8_01,
-    OPC_XORI_B      = (0x3 << 24) | OPC_MSA_I8_00,
-
     /* VEC/2R/2RF instruction */
     OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
     OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
@@ -334,6 +322,7 @@ static inline bool check_msa_enabled(DisasContext *ctx)
     return true;
 }
 
+typedef void gen_helper_piii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void gen_helper_piiii(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32);
 
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
@@ -427,50 +416,29 @@ static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
     return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
-static void gen_msa_i8(DisasContext *ctx)
+static bool trans_msa_i8(DisasContext *ctx, arg_msa_i *a,
+                         gen_helper_piii *gen_msa_i8)
 {
-#define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
-    uint8_t i8 = (ctx->opcode >> 16) & 0xff;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 ti8 = tcg_const_i32(i8);
-
-    switch (MASK_MSA_I8(ctx->opcode)) {
-    case OPC_ANDI_B:
-        gen_helper_msa_andi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_ORI_B:
-        gen_helper_msa_ori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_NORI_B:
-        gen_helper_msa_nori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_XORI_B:
-        gen_helper_msa_xori_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMNZI_B:
-        gen_helper_msa_bmnzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BMZI_B:
-        gen_helper_msa_bmzi_b(cpu_env, twd, tws, ti8);
-        break;
-    case OPC_BSELI_B:
-        gen_helper_msa_bseli_b(cpu_env, twd, tws, ti8);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(ti8);
+    gen_msa_i8(cpu_env,
+               tcg_constant_i32(a->wd),
+               tcg_constant_i32(a->ws),
+               tcg_constant_i32(a->sa));
+
+    return true;
 }
 
+TRANS(ANDI,     trans_msa_i8, gen_helper_msa_andi_b);
+TRANS(ORI,      trans_msa_i8, gen_helper_msa_ori_b);
+TRANS(NORI,     trans_msa_i8, gen_helper_msa_nori_b);
+TRANS(XORI,     trans_msa_i8, gen_helper_msa_xori_b);
+TRANS(BMNZI,    trans_msa_i8, gen_helper_msa_bmnzi_b);
+TRANS(BMZI,     trans_msa_i8, gen_helper_msa_bmzi_b);
+TRANS(BSELI,    trans_msa_i8, gen_helper_msa_bseli_b);
+
 static bool trans_SHF(DisasContext *ctx, arg_msa_i *a)
 {
     if (a->df == DF_DOUBLE) {
@@ -2104,11 +2072,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     }
 
     switch (MASK_MSA_MINOR(opcode)) {
-    case OPC_MSA_I8_00:
-    case OPC_MSA_I8_01:
-    case OPC_MSA_I8_02:
-        gen_msa_i8(ctx);
-        break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
     case OPC_MSA_3R_0F:
-- 
2.31.1


