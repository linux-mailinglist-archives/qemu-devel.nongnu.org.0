Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3243D10D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:49:49 +0200 (CEST)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnzf-0005xY-IJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLb-0004IG-OO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLZ-0003zL-G2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so3103938wma.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1v7uzqdYtUNSUQ86iF16IiRd4CiUgCPYBCiS+YToBmY=;
 b=WOgBnm9ZdwUk34fl+WPyB6XGJCWBVcXZrUWZv1yoYRq8JmfEp7+YiDPlR47b4lB8qk
 YPq80RVMNC13NmtlogPEyWOS7ZDLEMeQ0YWpn706GavflV17n/JVPsSmdghQPy3H+smT
 QKYGrsQhopkTCU0TchcGgTJQZgbuwYJNG36/x4qtnqOptyg/JTpUHY4Mw6Iz2CQwZ2FL
 YSRovHSYH5SmqmLV5VKGpYzR8+cO8i479komUPC7tPF0qyELVd5nEvuB1JKyho4CLpMy
 PpBKZJGtKDU89BwtEPzo+oZl3Cu6XCv6azAiCeGy7JUchTqqPvUckVVqGy0hPx3/z5MB
 Lx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1v7uzqdYtUNSUQ86iF16IiRd4CiUgCPYBCiS+YToBmY=;
 b=MemrnAPKx39RHqr4gjwfP9iCPmvSNDfnfR50n1MTM1rtQyw7LUGhqIX30rGyiHUOru
 7lU+82Q790l5RAz8cg5A/GcrS6zMEmUfjZBrxX3i8Gl3KVuRCkW1tOx9hezDqr8G5Y2B
 CVyFwLqv1ZzgxEpXJrPvH0pXVJBe0RRYDYSLL8ETAgVxbATrgzR1TKOc/olkCq7scYTO
 stcxNM7h8YG9HTFJTzcwe8qWthovWcHpEZ7CDWc323+R1cCupg/gVdU1sbF8PNoiL3x7
 JEoSyQUpKndCZFmZsJObtUViWVlyFxAqnbRRjliacsh5IOWPgkF5am2Hj9xEKZQPpTGP
 gDlw==
X-Gm-Message-State: AOAM530Lxap6228x4P48vD6Xr8oxRWjPeiHMCaPtm6C4vkxc9JNkuR7r
 1suI980YGAAJ0eUrnniTh3ZdM9J0484=
X-Google-Smtp-Source: ABdhPJw/jTp8DQ5cmGz7j0OmrLarCEOp17FIkmdYtJ6FJVkrtZ6EWk8+WpqPTO7Ii8xIUScOgWh0iw==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr7213273wmj.40.1635358099758; 
 Wed, 27 Oct 2021 11:08:19 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m35sm5812583wms.2.2021.10.27.11.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/32] target/mips: Convert MSA BIT instruction format to
 decodetree
Date: Wed, 27 Oct 2021 20:07:08 +0200
Message-Id: <20211027180730.1551932-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert instructions with an immediate bit index and
data format df/m to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- dfm field in decodetree format
- index array by CPUMIPSMSADataFormat to avoid dup
- TCG tm is constant
---
 target/mips/tcg/msa.decode      |  19 ++++
 target/mips/tcg/msa_translate.c | 177 ++++++++++++++------------------
 2 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 115e90b4fce..c4699b9d4b7 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -16,6 +16,10 @@
 &msa_bz             df        wt sa
 &msa_ldi            df  wd       sa
 &msa_i5             df  wd ws    sa
+&msa_bit            df  wd ws       m
+
+%dfm_df             16:7 !function=msa_bit_df
+%dfm_m              16:7 !function=msa_bit_m
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
@@ -23,6 +27,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
+@bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%dfm_df m=%dfm_m
 
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
index ca70c38c866..175254c1e47 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -17,6 +17,9 @@
 #include "fpu_helper.h"
 #include "internal.h"
 
+static int msa_bit_m(DisasContext *ctx, int x);
+static int msa_bit_df(DisasContext *ctx, int x);
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
+static int msa_df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
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
+static int msa_df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
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
+static int msa_bit_m(DisasContext *ctx, int x)
+{
+    return msa_df_extract_val(ctx, x, df_bit);
+}
+
+static int msa_bit_df(DisasContext *ctx, int x)
+{
+    return msa_df_extract_df(ctx, x, df_bit);
+}
+
 static TCGv_i64 msa_wr_d[64];
 
 void msa_translate_init(void)
@@ -500,90 +540,35 @@ static bool trans_LDI(DisasContext *ctx, arg_msa_ldi *a)
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
+    gen_msa_bit(cpu_env,
+                tcg_constant_i32(a->df),
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws),
+                tcg_constant_i32(a->m));
 
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
-    }
-
-    tcg_temp_free_i32(tdf);
-    tcg_temp_free_i32(tm);
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
+    return true;
 }
 
+TRANS_MSA(SLLI,     trans_msa_bit, gen_helper_msa_slli_df);
+TRANS_MSA(SRAI,     trans_msa_bit, gen_helper_msa_srai_df);
+TRANS_MSA(SRLI,     trans_msa_bit, gen_helper_msa_srli_df);
+TRANS_MSA(BCLRI,    trans_msa_bit, gen_helper_msa_bclri_df);
+TRANS_MSA(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
+TRANS_MSA(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
+TRANS_MSA(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
+TRANS_MSA(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
+TRANS_MSA(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS_MSA(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS_MSA(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
+TRANS_MSA(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
+
 static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
@@ -2128,10 +2113,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


