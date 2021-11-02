Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F7443015
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:16:25 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuaO-0001XL-CS
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5A-0001VG-AL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu57-00065q-KB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c4so3429383wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37CQJH1M7mLS2C9WYzcFC/BbmOyawPZjqzGXIWjjpAA=;
 b=EYM1M6wqAgpwSwapnkFnwh6zA6aUlaJk2LrffekmNTAjSAiTRs3sGR4ajyHEHwZXpl
 CKSJhjuqKQVAsKNJafHeIYA0NaICAHPnp4nZ53OvOW3RLoSXCbcGSs8HNee/Fi6yPmhQ
 JThdK7NF1/LW3EGIpS3rcV7kDtE4T57q59gZ7rjCzsqo/eeHI+2FKMoT8f2nSBE0W91G
 Ep5H+yswk/cgv7+IAOffLm3AcvSSIdIQS6GCZ5AkzNohRSj2mIqRAASgfftvwEHHtbM/
 HQ4U982DAuSIZIWiiV8fB12DWawyi8iKXrXkE4zEomelxOWXO9Kmjt98msau/VSsd5+4
 fTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=37CQJH1M7mLS2C9WYzcFC/BbmOyawPZjqzGXIWjjpAA=;
 b=B7uWZ7ob/g5AigShOITbmx5Mil3PIjGIvkYqfOo2BnCafw2DXm3WZeUlQAs+uT0M00
 W1tdqeuMkfG1nSUPvClmLX59BJX/1kD2m+FEg7ejrouQOdCIr996vDz9Zx6QphsuuBix
 UR90w72y7Uj+hmZlwzj3n9fxmT8BYiC7F8h/HaQIJWwV6SUWF4LmtXUdOMcDkDSLBRqo
 11tnpX+AcW82wPtOeU6K/a/h+EnVQD3zwv1fQSSUJR+NAPfdJgpDuU2llOGGvo75oT/X
 tE+YmGqlhCtFrx7P6osBO9ShiU/n8e+XCjzuTGggskvD7cxTkpD83wdYFe1tZukudFfV
 +urw==
X-Gm-Message-State: AOAM530ZPrdbVgjW4Yiy599n8aGsy/LdrmXwzKgzYqADtpGIs/pwARrz
 8WvXV7+ZJ8XkFAxEbwUUTtWyhQip83w=
X-Google-Smtp-Source: ABdhPJwTyZQdWvITQGfuQNlOWHWupw3kcjLRKH4piHjRvXI4eBSSyC6JfWxagt70uuIEZko/SxmvqQ==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr25116662wrx.292.1635860643952; 
 Tue, 02 Nov 2021 06:44:03 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 m125sm2584374wmm.39.2021.11.02.06.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/41] target/mips: Convert MSA 2RF instruction format to
 decodetree
Date: Tue,  2 Nov 2021 14:42:16 +0100
Message-Id: <20211102134240.3036524-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Convert 2-register floating-point operations to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-15-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  20 ++++++
 target/mips/tcg/msa_translate.c | 118 +++++++++-----------------------
 2 files changed, 53 insertions(+), 85 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 0aeb83d5c5b..33288b50355 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -13,6 +13,7 @@
 
 &r                  rs rt rd sa
 
+&msa_r              df  wd ws wt
 &msa_bz             df        wt sa
 &msa_ldi            df  wd       sa
 &msa_i              df  wd ws    sa
@@ -20,11 +21,13 @@
 
 %bit_df             16:7 !function=bit_df
 %bit_m              16:7 !function=bit_m
+%2r_df_w            16:1 !function=plus_2
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
@@ -79,6 +82,23 @@ BNZ                 010001 111 .. ..... ................    @bz
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
index 2a7fb925b07..704273dfd2f 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -20,6 +20,11 @@
 static int bit_m(DisasContext *ctx, int x);
 static int bit_df(DisasContext *ctx, int x);
 
+static inline int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
 /* Include the auto-generated decoder.  */
 #include "decode-msa.c.inc"
 
@@ -44,7 +49,7 @@ enum {
 };
 
 enum {
-    /* VEC/2R/2RF instruction */
+    /* VEC/2R instruction */
     OPC_AND_V       = (0x00 << 21) | OPC_MSA_VEC,
     OPC_OR_V        = (0x01 << 21) | OPC_MSA_VEC,
     OPC_NOR_V       = (0x02 << 21) | OPC_MSA_VEC,
@@ -54,7 +59,6 @@ enum {
     OPC_BSEL_V      = (0x06 << 21) | OPC_MSA_VEC,
 
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
-    OPC_MSA_2RF     = (0x19 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
     OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
@@ -62,24 +66,6 @@ enum {
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
@@ -1930,73 +1916,38 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
-static void gen_msa_2rf(DisasContext *ctx)
+static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
+                          gen_helper_piii *gen_msa_2rf)
 {
-#define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
-                            (op & (0xf << 17)))
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    uint8_t df = (ctx->opcode >> 16) & 0x1;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
-
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
+    if (!check_msa_enabled(ctx)) {
+        return true;
     }
 
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
+    gen_msa_2rf(cpu_env,
+                tcg_constant_i32(a->df),
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws));
+
+    return true;
 }
 
+TRANS(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
+TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
+TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
+TRANS(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
+TRANS(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);
+TRANS(FRINT,    trans_msa_2rf, gen_helper_msa_frint_df);
+TRANS(FLOG2,    trans_msa_2rf, gen_helper_msa_flog2_df);
+TRANS(FEXUPL,   trans_msa_2rf, gen_helper_msa_fexupl_df);
+TRANS(FEXUPR,   trans_msa_2rf, gen_helper_msa_fexupr_df);
+TRANS(FFQL,     trans_msa_2rf, gen_helper_msa_ffql_df);
+TRANS(FFQR,     trans_msa_2rf, gen_helper_msa_ffqr_df);
+TRANS(FTINT_S,  trans_msa_2rf, gen_helper_msa_ftint_s_df);
+TRANS(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
+TRANS(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
+TRANS(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
+
 static void gen_msa_vec_v(DisasContext *ctx)
 {
 #define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
@@ -2055,9 +2006,6 @@ static void gen_msa_vec(DisasContext *ctx)
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


