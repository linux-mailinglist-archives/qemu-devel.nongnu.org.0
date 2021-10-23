Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A94385B1
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:03:32 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP6x-0004qH-Ik
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtK-0005lT-Im
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOtI-0005cU-E0
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so1393561wrg.5
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/82C/RXBbZohXXpaNVo8ZLMmjbXm87ApjflY1VkDUQk=;
 b=BEVg25QkA6rdIuVg01EQfEjTPtRpEMCXjI4pENF+vJA+FCSfEaefhLQlK1WO9YgYRA
 QyjgRuf3yU+OY1Hed5saAhJrMOsMeYF/3frmNr0X1U6MhIBk3X6E1QWWlBJQx+TyEJYH
 40e2YsDglyFXRneEzjiJOOwqX86VoDWcfVfkkFmRa3DthzTARA2tBFgkSN1RfEGiY7J7
 NllwkYhjwwJegkKQHB/K3/thIcI5AxwbqEZ7VVzYhInOyCeCspTbKm2gsLoMXnLG2TBh
 7FaTXkNRMkhNOpk09mIx93ssQROCs5Sgzhg7TK4otEHQroGVkB+LJVMmeN1R6Ac0VOpQ
 WfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/82C/RXBbZohXXpaNVo8ZLMmjbXm87ApjflY1VkDUQk=;
 b=099/mEDE29gts0B2OSOpVY2NNR7btpBeY5S5MENuQu5JkCYDUunK1oDfh5+dP6SU40
 +IIzw9Rd/VG2Zb0QlDzlLrnbmhRPT5QpVv3/aHQ6Mh3YUReTHjRavd8QdOjikowYs2rC
 1ZEiD7ZhuVulPCTqgq/VgGeqVzz2jYiGbOfewlhyYHfmCho3IE+lEOs6sE/GtC2s8Txs
 QuGLU3rBwWgjelZv4lRp15Dg73DahRIoD5fhhYOPoLOEnNw8GP+9XCdpMtAmZhZcb+2+
 PvIK9DBCeGCN5Ysk4aLu/g6KPYVNtDEQOANdMfov91Z7Jn4RZg1So96LVjDw/wDhPFHW
 r0KQ==
X-Gm-Message-State: AOAM5333hvk1u9Ar53IkjoZLTh6LJG10RPqZlljFmxrSTE7NpQqi0vtu
 AjAy7M2BXVORejhR9tkiMvFo6eYgBIc=
X-Google-Smtp-Source: ABdhPJyNG4bHsoQ341Cr1ArKRigh9JifdoRRKn2EjufebP5Ut6f0mDq1Y1h70IYzji1V+88M0tWB3w==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr1140036wrs.14.1635025763043;
 Sat, 23 Oct 2021 14:49:23 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 x8sm6726488wrw.6.2021.10.23.14.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/33] target/mips: Convert MSA 2RF instruction format to
 decodetree
Date: Sat, 23 Oct 2021 23:47:46 +0200
Message-Id: <20211023214803.522078-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

Convert 2-register floating-point operations to decodetree.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  19 ++++++
 target/mips/tcg/msa_translate.c | 109 ++++++++------------------------
 2 files changed, 46 insertions(+), 82 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 5fe6923ace5..2997bfa24e3 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -13,6 +13,7 @@
 
 &r                  rs rt rd sa
 
+&msa_r              df wd ws wt
 &msa_bz             df       wt sa
 &msa_ldst           df wd ws    sa
 
@@ -20,6 +21,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
@@ -74,6 +76,23 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FCLASS            011110 110010000 . ..... .....  011110  @2rf
+  FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
+  FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
+  FSQRT             011110 110010011 . ..... .....  011110  @2rf
+  FRSQRT            011110 110010100 . ..... .....  011110  @2rf
+  FRCP              011110 110010101 . ..... .....  011110  @2rf
+  FRINT             011110 110010110 . ..... .....  011110  @2rf
+  FLOG2             011110 110010111 . ..... .....  011110  @2rf
+  FEXUPL            011110 110011000 . ..... .....  011110  @2rf
+  FEXUPR            011110 110011001 . ..... .....  011110  @2rf
+  FFQL              011110 110011010 . ..... .....  011110  @2rf
+  FFQR              011110 110011011 . ..... .....  011110  @2rf
+  FTINT_S           011110 110011100 . ..... .....  011110  @2rf
+  FTINT_U           011110 110011101 . ..... .....  011110  @2rf
+  FFINT_S           011110 110011110 . ..... .....  011110  @2rf
+  FFINT_U           011110 110011111 . ..... .....  011110  @2rf
+
   LD                011110 .......... ..... .....   1000 .. @ldst
   ST                011110 .......... ..... .....   1001 .. @ldst
 
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 52af99636a4..c6a77381c0e 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -41,7 +41,7 @@ enum {
 };
 
 enum {
-    /* VEC/2R/2RF instruction */
+    /* VEC/2R instruction */
     OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
     OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
     OPC_NOR_V       = (0x02 << 21) | OPC_MSA_VEC,
@@ -51,7 +51,6 @@ enum {
     OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
 
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
-    OPC_MSA_2RF     = (0x19 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
     OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
@@ -59,24 +58,6 @@ enum {
     OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
     OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
 
-    /* 2RF instruction df(bit 16) = _w, _d */
-    OPC_FCLASS_df   = (0x00 << 17) | OPC_MSA_2RF,
-    OPC_FTRUNC_S_df = (0x01 << 17) | OPC_MSA_2RF,
-    OPC_FTRUNC_U_df = (0x02 << 17) | OPC_MSA_2RF,
-    OPC_FSQRT_df    = (0x03 << 17) | OPC_MSA_2RF,
-    OPC_FRSQRT_df   = (0x04 << 17) | OPC_MSA_2RF,
-    OPC_FRCP_df     = (0x05 << 17) | OPC_MSA_2RF,
-    OPC_FRINT_df    = (0x06 << 17) | OPC_MSA_2RF,
-    OPC_FLOG2_df    = (0x07 << 17) | OPC_MSA_2RF,
-    OPC_FEXUPL_df   = (0x08 << 17) | OPC_MSA_2RF,
-    OPC_FEXUPR_df   = (0x09 << 17) | OPC_MSA_2RF,
-    OPC_FFQL_df     = (0x0A << 17) | OPC_MSA_2RF,
-    OPC_FFQR_df     = (0x0B << 17) | OPC_MSA_2RF,
-    OPC_FTINT_S_df  = (0x0C << 17) | OPC_MSA_2RF,
-    OPC_FTINT_U_df  = (0x0D << 17) | OPC_MSA_2RF,
-    OPC_FFINT_S_df  = (0x0E << 17) | OPC_MSA_2RF,
-    OPC_FFINT_U_df  = (0x0F << 17) | OPC_MSA_2RF,
-
     /* 3R instruction df(bits 22..21) = _b, _h, _w, d */
     OPC_SLL_df      = (0x0 << 23) | OPC_MSA_3R_0D,
     OPC_ADDV_df     = (0x0 << 23) | OPC_MSA_3R_0E,
@@ -1932,73 +1913,40 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
-static void gen_msa_2rf(DisasContext *ctx)
+static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
+                          void (*gen_msa_2rf)(TCGv_ptr, TCGv_i32,
+                                              TCGv_i32, TCGv_i32))
 {
-#define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
-                            (op & (0xf << 17)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    uint8_t df = (ctx->opcode >> 16) & 0x1;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
+    TCGv_i32 twd = tcg_const_i32(a->wd);
+    TCGv_i32 tws = tcg_const_i32(a->ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + a->df);
 
-    switch (MASK_MSA_2RF(ctx->opcode)) {
-    case OPC_FCLASS_df:
-        gen_helper_msa_fclass_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FTRUNC_S_df:
-        gen_helper_msa_ftrunc_s_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FTRUNC_U_df:
-        gen_helper_msa_ftrunc_u_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FSQRT_df:
-        gen_helper_msa_fsqrt_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FRSQRT_df:
-        gen_helper_msa_frsqrt_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FRCP_df:
-        gen_helper_msa_frcp_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FRINT_df:
-        gen_helper_msa_frint_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FLOG2_df:
-        gen_helper_msa_flog2_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FEXUPL_df:
-        gen_helper_msa_fexupl_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FEXUPR_df:
-        gen_helper_msa_fexupr_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FFQL_df:
-        gen_helper_msa_ffql_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FFQR_df:
-        gen_helper_msa_ffqr_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FTINT_S_df:
-        gen_helper_msa_ftint_s_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FTINT_U_df:
-        gen_helper_msa_ftint_u_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FFINT_S_df:
-        gen_helper_msa_ffint_s_df(cpu_env, tdf, twd, tws);
-        break;
-    case OPC_FFINT_U_df:
-        gen_helper_msa_ffint_u_df(cpu_env, tdf, twd, tws);
-        break;
-    }
+    gen_msa_2rf(cpu_env, tdf, twd, tws);
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
+
+    return true;
 }
 
+TRANS_MSA(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
+TRANS_MSA(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
+TRANS_MSA(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS_MSA(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
+TRANS_MSA(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
+TRANS_MSA(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);
+TRANS_MSA(FRINT,    trans_msa_2rf, gen_helper_msa_frint_df);
+TRANS_MSA(FLOG2,    trans_msa_2rf, gen_helper_msa_flog2_df);
+TRANS_MSA(FEXUPL,   trans_msa_2rf, gen_helper_msa_fexupl_df);
+TRANS_MSA(FEXUPR,   trans_msa_2rf, gen_helper_msa_fexupr_df);
+TRANS_MSA(FFQL,     trans_msa_2rf, gen_helper_msa_ffql_df);
+TRANS_MSA(FFQR,     trans_msa_2rf, gen_helper_msa_ffqr_df);
+TRANS_MSA(FTINT_S,  trans_msa_2rf, gen_helper_msa_ftint_s_df);
+TRANS_MSA(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
+TRANS_MSA(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
+TRANS_MSA(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
+
 static void gen_msa_vec_v(DisasContext *ctx)
 {
 #define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
@@ -2057,9 +2005,6 @@ static void gen_msa_vec(DisasContext *ctx)
     case OPC_MSA_2R:
         gen_msa_2r(ctx);
         break;
-    case OPC_MSA_2RF:
-        gen_msa_2rf(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


