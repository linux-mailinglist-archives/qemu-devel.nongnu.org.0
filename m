Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC259442FCC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:08:03 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuSJ-0007Ti-0E
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5N-0001dy-Ro
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5L-000674-GS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id t30so8559872wra.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITK2jAKvKvh2aGzj1uYLx351dgZJw7ejqPzY8bO8NZY=;
 b=ci17iVaYK2XvvuPEYq1vLOK21LudqxnYQTP1/CsCugU7g3GQIw7nNeErCtfVbnLDFE
 5cU9D/J9gWnqWnpimYQL15ghaJe21FpQf6AN4OBKXSSSmddEaudLzuEDwOFnw30DFbEJ
 BGR8XLnD1mwENOqN1YZm8AzKpmmcrhabfrtagZtRbUzy49uzbnl9LfhrGS6KZroXD1NV
 nFFQSTmUpwGXRIHlpGAIyBWlYLjZJGu+ZXW/88lW09k8NAdRNBJokewZLSIUnCsJJL8W
 P1ziBBWOxitYYRO8O+hqgxSOZRMDYk4fS8rnRHbdX7+xUQLKlcC1VESaGN1ZMwsCVD3e
 hVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ITK2jAKvKvh2aGzj1uYLx351dgZJw7ejqPzY8bO8NZY=;
 b=xrcsCgjE/GQk6rQl8B90ttShVECJC1L5Ir73b48g20WCmozOJIAQJE0UPahPv+W0tN
 8ggiC3vYU7nYhYLxzMXC+8ZU32geqbezNmJDrkJVsCfwbCCwAP4zZ/SnkPZgajY9kz2b
 yl9HBVEh1WAs/46ZS6YF2fNjUh+gaA6sARmBjqCI5u8103VJxMlZCxSXZv9mikWl1OnT
 IQH2ckhNOn54BDZ7F7Vqf23O2oWZrnZXdsi6DumUxJ6NelZvTzl5Seijr9xQ2XVTNrSF
 rG6HdoktKUoDymySFlg7qv5PDDuXzcvrbkAGJCt9pPhlUtkmISFs/g47yO6BHhn9iwa2
 gndg==
X-Gm-Message-State: AOAM531LmloVNmzIGdpWGsCh7xuFyYiLtm9FIjHuAC3l0p9nTkvQ6NCT
 N/RDWNETxfuDdc4xo4EuVcskgMY6ipE=
X-Google-Smtp-Source: ABdhPJyYqC2zC3R7c/rj/45vkENLjiyOOrJagYXSEr0dqOfO7IpbK+fKMEOMfUhvyeDA7LnlaqWhNA==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr47703211wri.60.1635860658032; 
 Tue, 02 Nov 2021 06:44:18 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o2sm17709609wrg.1.2021.11.02.06.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/41] target/mips: Convert MSA VEC instruction format to
 decodetree
Date: Tue,  2 Nov 2021 14:42:19 +0100
Message-Id: <20211102134240.3036524-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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

Convert 3-register instructions with implicit data formats
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-18-f4bug@amsat.org>
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
index c6e38281a64..45a6b60d547 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -45,19 +45,9 @@ enum {
     OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
     OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
     OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
-    OPC_MSA_VEC     = 0x1E | OPC_MSA,
 };
 
 enum {
-    /* VEC instruction */
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
@@ -517,6 +507,29 @@ TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
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
@@ -1899,68 +1912,6 @@ TRANS(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
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
@@ -1989,9 +1940,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


