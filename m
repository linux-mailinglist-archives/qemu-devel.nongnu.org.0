Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D543D151
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:59:02 +0200 (CEST)
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo8b-0008SU-B2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnM7-0005Ew-MX
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnM5-00045X-Ox
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id m42so3413342wms.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKwnuWLcuKqNFC7d+bWmwrI+vVvjtG9qW9ni7RSXaew=;
 b=Gtt5K0PYm5L3jNZDuuk8HaPqYvbU4O92q7Stv+lkrlB+aRoB3mI0uf5eroV1unRQ/Y
 mRu48Q2G/9eAU9m0AP7MngWqJ9DWCqiYLgkQvv1k7u7rcwLni43YyPNFovdivStu9lx5
 feuvByoedNedhJATahBaT0UA0rG13iIDu5b+mpoatbqV/haumOFB7Y/ViHetYqHm3/tc
 V8hs/b7xoJn24Q3oMhvHbOuqOMRGdEBIk4tX9di6cYrq8Dpxcs70qEGhVAUaymekSz+q
 SfxILtDyiiPdZgV4jomg81F3O02kbDGRSZMUmP2fLWUEQ0873AkKkDzChECHnUg9k0tu
 TQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TKwnuWLcuKqNFC7d+bWmwrI+vVvjtG9qW9ni7RSXaew=;
 b=7eYxgH0W0pEHuw21XZXM/h1oHQEC8OmTc8JQTXtROiiCQVEkhoPXVF7oPgulmcNcpN
 zbOvJrOBgy13/n7/gKYSJde+WdCK/X9Ahpd6fr37q4E+OIImAIuNdfQrfMg79IHi+YtK
 U72gShmhIjaeJmcrQqdNUMetuC52mVPNJhysZXQgZ2P754QdPitviZifdZQSgH1shd/k
 pt455Oc5GPO53zPolsgbCrPy0kIIRF85whia+kPzxo0tV3SsPbj0IvxZeasuA9ndkwST
 Ipg7bNhOxi0kXCQJNOPyD8W7e3tgaM5yxK5E0z2uEUq4E04ATq50wAsAZ69A4L4Q/lyU
 4EFg==
X-Gm-Message-State: AOAM5304QV6QCRRbuUQV8PUO+gEuKxPjFjVqgANF7+/Sh4aFuA1F7fQ5
 UnpWlRX+hDJdPyXGcXhIVeJIpBRiMrU=
X-Google-Smtp-Source: ABdhPJw3ankVxrhArGb9Ecus3ErBQu4mvkIbS/aEmfiW1EgbrQs1If5ckqnNWqPHGE+ioYN1LpC5kQ==
X-Received: by 2002:a05:600c:796:: with SMTP id
 z22mr4886501wmo.188.1635358132307; 
 Wed, 27 Oct 2021 11:08:52 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm4248824wmc.47.2021.10.27.11.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/32] target/mips: Convert MSA VEC instruction format to
 decodetree
Date: Wed, 27 Oct 2021 20:07:15 +0200
Message-Id: <20211027180730.1551932-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register instructions with implicit data formats
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 ++++
 target/mips/tcg/msa_translate.c | 84 ++++++---------------------------
 2 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index a92763af451..c9cc1529c8e 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -28,6 +28,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_ldst
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... df:1 ws:5 wd:5 ......  &msa_r wt=0
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
@@ -84,6 +85,13 @@ BNZ                 010001 111 .. ..... ................    @bz
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
index bff998356ac..c7168608d42 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -40,19 +40,9 @@ enum {
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
@@ -1888,67 +1878,24 @@ TRANS_MSA(FTINT_U,  trans_msa_2rf, gen_helper_msa_ftint_u_df);
 TRANS_MSA(FFINT_S,  trans_msa_2rf, gen_helper_msa_ffint_s_df);
 TRANS_MSA(FFINT_U,  trans_msa_2rf, gen_helper_msa_ffint_u_df);
 
-static void gen_msa_vec_v(DisasContext *ctx)
+static bool trans_msa_vec(DisasContext *ctx, arg_msa_r *a,
+                          gen_helper_piii *gen_msa_vec)
 {
-#define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
+    gen_msa_vec(cpu_env,
+                tcg_constant_i32(a->wd),
+                tcg_constant_i32(a->ws),
+                tcg_constant_i32(a->wt));
 
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
+    return true;
 }
 
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
+TRANS_MSA(AND_V,    trans_msa_vec, gen_helper_msa_and_v);
+TRANS_MSA(OR_V,     trans_msa_vec, gen_helper_msa_or_v);
+TRANS_MSA(NOR_V,    trans_msa_vec, gen_helper_msa_nor_v);
+TRANS_MSA(XOR_V,    trans_msa_vec, gen_helper_msa_xor_v);
+TRANS_MSA(BMNZ_V,   trans_msa_vec, gen_helper_msa_bmnz_v);
+TRANS_MSA(BMZ_V,    trans_msa_vec, gen_helper_msa_bmz_v);
+TRANS_MSA(BSEL_V,   trans_msa_vec, gen_helper_msa_bsel_v);
 
 static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
@@ -1978,9 +1925,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


