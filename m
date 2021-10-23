Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC414385B4
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:06:11 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP9W-0008PG-3o
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtB-0005eX-BV
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOt8-0005Xt-Vn
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a16so3567089wrh.12
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vu9D27+ookIEdUzntvIdVfMMkdX35lVhgz6M0Org7w=;
 b=D0lcjkuJd8IOslJHGXbV0wz3z6H++oHGGkkzXqYJLyP3rWfEVTjClCvmTJ/tc6jKHE
 JD4hSSYv+vbqFMG9nMQioqB4p31o6XMLHcMa2mQ8JjXyal34dkeQw4t6o/JvBjH0NrZW
 KXufS/vJ7V2ZVBaFghtqdHX+o7qM4CpJW8mExDMSCu/xm2Rpc08l0F+GYZlnqc4PHVsx
 N9MpkYtfC+MSc9lMLNiMwqmTP1gxhKgF4XVw+OjkpcHU+/PZqSzLv1UHn7ly+qHSqB26
 Qq5uQ+Z/JCcRu5IHWWaGDXEgeH+iIPcnaNFOJMZLK9k8y05ldYkZ6qTlVLylfIEvO1yF
 X37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9vu9D27+ookIEdUzntvIdVfMMkdX35lVhgz6M0Org7w=;
 b=LtRGoHku2EN8zs9zLWctgXY8ne/5rUCjtprgtdmf/sFq719cgCyt23MqEmCBl6tyxl
 mbS9XjSwC58/H2v4DKsp7TKyPa/e5uSsdEFnBAc3F34YHRSkYY00D9GUd9h7MdSh1GID
 mM8KOb21jlwA9+pVhvPwbpGLBzuNaPZXyMkKm+skvTAv63qFjFRNoLg2QYIJR/4eIqdz
 BEX4b0b4SoZo/DOtJEtFQ13jbpHg1m5o1Jf1TSZuOxGOM9Et468b7aNwlgQXnmHC4s/C
 tk/1gjOgStyKRXsmon/tLZCya3prgTxpvmocHDQORBKXY5vxErt88cN1UsReHWYe+J7m
 ZEZA==
X-Gm-Message-State: AOAM533AbbypptkjPGC4ZTLOrzex234ys67RAqgSbRRYQkgk22P2wK6M
 /AdlhA7I0/YhmCfq9qPRUhTI5mDKz80=
X-Google-Smtp-Source: ABdhPJxLWxguDyHgZJEwyqPeMVpkg0GjB2AMyRdmK+G38tZ4eMBlRNtDLFVJAqCcqsw3GRqDZIunQQ==
X-Received: by 2002:adf:a486:: with SMTP id g6mr10580590wrb.130.1635025753392; 
 Sat, 23 Oct 2021 14:49:13 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l1sm2403488wrb.73.2021.10.23.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/33] target/mips: Convert MSA I8 instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:44 +0200
Message-Id: <20211023214803.522078-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with an 8-bit immediate value and either
implicit data format or data format df to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 72 +++++++++------------------------
 2 files changed, 26 insertions(+), 54 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 6347468a709..3dd07dced57 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -23,6 +23,7 @@
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_ldst
+@i8                 ...... ..       sa:s8 ws:5 wd:5 ......  &msa_ldst df=0
 @bit                ...... ... df:7       ws:5 wd:5 ......  &msa_ldst sa=0
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
@@ -34,6 +35,13 @@ BZ                  010001 110 .. ..... ................    @bz
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
index 7cb078bfe92..2866687635d 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -24,9 +24,6 @@
 
 #define MASK_MSA_MINOR(op)          (MASK_OP_MAJOR(op) | (op & 0x3F))
 enum {
-    OPC_MSA_I8_00   = 0x00 | OPC_MSA,
-    OPC_MSA_I8_01   = 0x01 | OPC_MSA,
-    OPC_MSA_I8_02   = 0x02 | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -54,15 +51,6 @@ enum {
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
@@ -418,50 +406,31 @@ static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
     return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
-static void gen_msa_i8(DisasContext *ctx)
+static bool trans_msa_i8(DisasContext *ctx, arg_msa_ldst *a,
+                         void (*gen_msa_i8)(TCGv_ptr, TCGv_i32,
+                                            TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
-    uint8_t i8 = (ctx->opcode >> 16) & 0xff;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
+    TCGv_i32 timm = tcg_const_i32(a->sa);
 
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
-    }
+    gen_msa_i8(cpu_env, twd, tws, timm);
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(ti8);
+    tcg_temp_free_i32(timm);
+
+    return true;
 }
 
+TRANS_MSA(ANDI,     trans_msa_i8, gen_helper_msa_andi_b);
+TRANS_MSA(ORI,      trans_msa_i8, gen_helper_msa_ori_b);
+TRANS_MSA(NORI,     trans_msa_i8, gen_helper_msa_nori_b);
+TRANS_MSA(XORI,     trans_msa_i8, gen_helper_msa_xori_b);
+TRANS_MSA(BMNZI,    trans_msa_i8, gen_helper_msa_bmnzi_b);
+TRANS_MSA(BMZI,     trans_msa_i8, gen_helper_msa_bmzi_b);
+TRANS_MSA(BSELI,    trans_msa_i8, gen_helper_msa_bseli_b);
+
 static bool trans_SHF(DisasContext *ctx, arg_msa_ldst *a)
 {
     TCGv_i32 tdf;
@@ -2113,11 +2082,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


