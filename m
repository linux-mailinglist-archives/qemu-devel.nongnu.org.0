Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435B2442FE6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:10:19 +0100 (CET)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuUU-00051D-By
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4s-0000c0-3A
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4p-00063G-Cg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id c4so3427960wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+9Ove7K4hCPh9n5E0O/3HHiI+k3CmL9176x3r0RXoU=;
 b=GXlxGaFYrbGGH2+zMwF1Taomc0zBWkE2cD0WkCqPDNpGklwyssqk6SBnK9fw3sryZj
 BRcLc6s8cy95aXbOPsmonk5RIHHOKUW8c+SmvMvqTRMXzcEkBpKXSTz+2ZoeOXsYxgM9
 iTJILX+OYz+XyNNg5qj6mVB5ueT2eDpfDGZ+LVtLpT/vdgZ5Z3LFWM0cyVkTqCuT3S/a
 q5tyX37JUL7treunzJgRAhDsBhYuqNtT4tji5IaIiayoPogO++hhTnjLuePMfObH/5ej
 QkS7rf/tamh0mgXemru/pnwpjsLGkmX++0LBScr9pPnRBmIBuYZbbydmooN92oiRq6FO
 8zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z+9Ove7K4hCPh9n5E0O/3HHiI+k3CmL9176x3r0RXoU=;
 b=Ym+zA1S4iUj1M5pmOuxzHoScxCtPWZMn5jB8AHQ/A97KeGB9h9xi2z8VJqChK+Gchk
 3DzRi9gp+MFzhM8G//OYPG2CiLdL6DoiqoFf8sib/vVDE89HrDxRPRhJV/KRgUeY2R3T
 QV2iKtHxg8/txVsfzz9RnRvp9MSJeY6sXChX1wCkVaTeXRtTPr2fOICBd8264TWR0nGj
 GvbaGBhfvt5ztbocSTaA2i5ACiRfrETIDnMzIPpy5aptX7fj2V+Bd1HBbbjiLxv3YTeC
 KKhQ9CuoIjsHd3gfJ5GMcdG1mTJoqBKt/Ol+Bh41EPKQrt8yqRoAsvwpdQS7FfOkyM2I
 5B3Q==
X-Gm-Message-State: AOAM533mTXhYFY84oADWPMDfCdPhYNJttbW2l813XgDLcm7azMEVW6Uz
 ta2Zx1gFRetXeXq6dw+zt1BEuNRmc0w=
X-Google-Smtp-Source: ABdhPJxaNzXCkN2kRdY3hOJdU4kxb30VLXBtzuUNTIlXyeO2pCe6AnVAPpOzSQAI/0C124edtPp3HQ==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr39069065wrh.220.1635860624763; 
 Tue, 02 Nov 2021 06:43:44 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 6sm2606645wma.48.2021.11.02.06.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/41] target/mips: Convert MSA BIT instruction format to
 decodetree
Date: Tue,  2 Nov 2021 14:42:12 +0100
Message-Id: <20211102134240.3036524-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
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

Convert instructions with an immediate bit index and
data format df/m to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211028210843.2120802-11-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  19 ++++
 target/mips/tcg/msa_translate.c | 179 +++++++++++++++-----------------
 2 files changed, 101 insertions(+), 97 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index cd2b618684a..3d6c6faf688 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -16,6 +16,10 @@
 &msa_bz             df        wt sa
 &msa_ldi            df  wd       sa
 &msa_i              df  wd ws    sa
+&msa_bit            df  wd ws       m
+
+%bit_df             16:7 !function=bit_df
+%bit_m              16:7 !function=bit_m
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
@@ -23,6 +27,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
+@bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%bit_df m=%bit_m
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
@@ -48,5 +53,19 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   LDI               011110 110 .. ..........  ..... 000111  @ldi
 
+  SLLI              011110 000 ....... ..... .....  001001  @bit
+  SRAI              011110 001 ....... ..... .....  001001  @bit
+  SRLI              011110 010 ....... ..... .....  001001  @bit
+  BCLRI             011110 011 ....... ..... .....  001001  @bit
+  BSETI             011110 100 ....... ..... .....  001001  @bit
+  BNEGI             011110 101 ....... ..... .....  001001  @bit
+  BINSLI            011110 110 ....... ..... .....  001001  @bit
+  BINSRI            011110 111 ....... ..... .....  001001  @bit
+
+  SAT_S             011110 000 ....... ..... .....  001010  @bit
+  SAT_U             011110 001 ....... ..... .....  001010  @bit
+  SRARI             011110 010 ....... ..... .....  001010  @bit
+  SRLRI             011110 011 ....... ..... .....  001010  @bit
+
   MSA               011110 --------------------------
 }
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index c5211c4e057..9c1a24eb251 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -17,6 +17,9 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+static int bit_m(DisasContext *ctx, int x);
+static int bit_df(DisasContext *ctx, int x);
+
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
@@ -27,8 +30,6 @@ enum {
     OPC_MSA_I8_00   = 0x00 | OPC_MSA,
     OPC_MSA_I8_01   = 0x01 | OPC_MSA,
     OPC_MSA_I8_02   = 0x02 | OPC_MSA,
-    OPC_MSA_BIT_09  = 0x09 | OPC_MSA,
-    OPC_MSA_BIT_0A  = 0x0A | OPC_MSA,
     OPC_MSA_3R_0D   = 0x0D | OPC_MSA,
     OPC_MSA_3R_0E   = 0x0E | OPC_MSA,
     OPC_MSA_3R_0F   = 0x0F | OPC_MSA,
@@ -222,20 +223,6 @@ enum {
     OPC_MSUBR_Q_df  = (0xE << 22) | OPC_MSA_3RF_1C,
     OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
     OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
-
-    /* BIT instruction df(bits 22..16) = _B _H _W _D */
-    OPC_SLLI_df     = (0x0 << 23) | OPC_MSA_BIT_09,
-    OPC_SAT_S_df    = (0x0 << 23) | OPC_MSA_BIT_0A,
-    OPC_SRAI_df     = (0x1 << 23) | OPC_MSA_BIT_09,
-    OPC_SAT_U_df    = (0x1 << 23) | OPC_MSA_BIT_0A,
-    OPC_SRLI_df     = (0x2 << 23) | OPC_MSA_BIT_09,
-    OPC_SRARI_df    = (0x2 << 23) | OPC_MSA_BIT_0A,
-    OPC_BCLRI_df    = (0x3 << 23) | OPC_MSA_BIT_09,
-    OPC_SRLRI_df    = (0x3 << 23) | OPC_MSA_BIT_0A,
-    OPC_BSETI_df    = (0x4 << 23) | OPC_MSA_BIT_09,
-    OPC_BNEGI_df    = (0x5 << 23) | OPC_MSA_BIT_09,
-    OPC_BINSLI_df   = (0x6 << 23) | OPC_MSA_BIT_09,
-    OPC_BINSRI_df   = (0x7 << 23) | OPC_MSA_BIT_09,
 };
 
 static const char msaregnames[][6] = {
@@ -257,6 +244,59 @@ static const char msaregnames[][6] = {
     "w30.d0", "w30.d1", "w31.d0", "w31.d1",
 };
 
+/* Encoding of Operation Field (must be indexed by CPUMIPSMSADataFormat) */
+struct dfe {
+    int start;
+    int length;
+    uint32_t mask;
+};
+
+/*
+ * Extract immediate from df/{m,n} format (used by ELM & BIT instructions).
+ * Returns the immediate value, or -1 if the format does not match.
+ */
+static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
+{
+    for (unsigned i = 0; i < 4; i++) {
+        if (extract32(x, s->start, s->length) == s->mask) {
+            return extract32(x, 0, s->start);
+        }
+    }
+    return -1;
+}
+
+/*
+ * Extract DataField from df/{m,n} format (used by ELM & BIT instructions).
+ * Returns the DataField, or -1 if the format does not match.
+ */
+static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
+{
+    for (unsigned i = 0; i < 4; i++) {
+        if (extract32(x, s->start, s->length) == s->mask) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static const struct dfe df_bit[] = {
+    /* Table 3.28 BIT Instruction Format */
+    [DF_BYTE]   = {3, 4, 0b1110},
+    [DF_HALF]   = {4, 3, 0b110},
+    [DF_WORD]   = {5, 2, 0b10},
+    [DF_DOUBLE] = {6, 1, 0b0}
+};
+
+static int bit_m(DisasContext *ctx, int x)
+{
+    return df_extract_val(ctx, x, df_bit);
+}
+
+static int bit_df(DisasContext *ctx, int x)
+{
+    return df_extract_df(ctx, x, df_bit);
+}
+
 static TCGv_i64 msa_wr_d[64];
 
 void msa_translate_init(void)
@@ -492,90 +532,39 @@ static bool trans_LDI(DisasContext *ctx, arg_msa_ldi *a)
     return true;
 }
 
-static void gen_msa_bit(DisasContext *ctx)
+static bool trans_msa_bit(DisasContext *ctx, arg_msa_bit *a,
+                          gen_helper_piiii *gen_msa_bit)
 {
-#define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    uint8_t dfm = (ctx->opcode >> 16) & 0x7f;
-    uint32_t df = 0, m = 0;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 tdf;
-    TCGv_i32 tm;
-    TCGv_i32 twd;
-    TCGv_i32 tws;
-
-    if ((dfm & 0x40) == 0x00) {
-        m = dfm & 0x3f;
-        df = DF_DOUBLE;
-    } else if ((dfm & 0x60) == 0x40) {
-        m = dfm & 0x1f;
-        df = DF_WORD;
-    } else if ((dfm & 0x70) == 0x60) {
-        m = dfm & 0x0f;
-        df = DF_HALF;
-    } else if ((dfm & 0x78) == 0x70) {
-        m = dfm & 0x7;
-        df = DF_BYTE;
-    } else {
-        gen_reserved_instruction(ctx);
-        return;
+    if (a->df < 0) {
+        return false;
     }
 
-    tdf = tcg_const_i32(df);
-    tm  = tcg_const_i32(m);
-    twd = tcg_const_i32(wd);
-    tws = tcg_const_i32(ws);
-
-    switch (MASK_MSA_BIT(ctx->opcode)) {
-    case OPC_SLLI_df:
-        gen_helper_msa_slli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRAI_df:
-        gen_helper_msa_srai_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRLI_df:
-        gen_helper_msa_srli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BCLRI_df:
-        gen_helper_msa_bclri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BSETI_df:
-        gen_helper_msa_bseti_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BNEGI_df:
-        gen_helper_msa_bnegi_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BINSLI_df:
-        gen_helper_msa_binsli_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_BINSRI_df:
-        gen_helper_msa_binsri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SAT_S_df:
-        gen_helper_msa_sat_s_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SAT_U_df:
-        gen_helper_msa_sat_u_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRARI_df:
-        gen_helper_msa_srari_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    case OPC_SRLRI_df:
-        gen_helper_msa_srlri_df(cpu_env, tdf, twd, tws, tm);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(tdf);
-    tcg_temp_free_i32(tm);
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
+    gen_msa_bit(cpu_env,
+                tcg_constant_i32(a->df),
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws),
+                tcg_constant_i32(a->m));
+
+    return true;
 }
 
+TRANS(SLLI,     trans_msa_bit, gen_helper_msa_slli_df);
+TRANS(SRAI,     trans_msa_bit, gen_helper_msa_srai_df);
+TRANS(SRLI,     trans_msa_bit, gen_helper_msa_srli_df);
+TRANS(BCLRI,    trans_msa_bit, gen_helper_msa_bclri_df);
+TRANS(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
+TRANS(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
+TRANS(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
+TRANS(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
+TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
+TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -2120,10 +2109,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_I8_02:
         gen_msa_i8(ctx);
         break;
-    case OPC_MSA_BIT_09:
-    case OPC_MSA_BIT_0A:
-        gen_msa_bit(ctx);
-        break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
     case OPC_MSA_3R_0F:
-- 
2.31.1


