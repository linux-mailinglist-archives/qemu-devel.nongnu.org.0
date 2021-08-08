Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F463E3BFF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 19:34:48 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCmhD-0002Qg-I8
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 13:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdO-0005R9-Mb
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCmdL-0006fY-7S
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 13:30:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so9032wrr.9
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Ip7dNqBR9CCs37W148txuk2ntTuwtUF2p4pRZfBcEc=;
 b=POJXZoKM49dhjifHYhA54TernPftxyeGVFHAU3EfjFjRDzLg00rmvBZvSg01EK1N0X
 o5BoUYVhSUHiG9DMR3BVxkhUBIKpK8sZ8tZJePTa4z/sg3zkY25KgfSDgXVcSHPkRLXx
 q4MkNlUuaWulBOiWW1wYXrlfXUDqqPe/eTFlxICKTScrpptE7G46gC61FyAi1AhzFOWv
 TlYc5lWYoxADXHQtTHFpHJAxOtKhhyV/1JEwvKDzdQhsK/yyThqGwCiEfqVUSbNoTxeR
 xZ/2VR44i5W7WdHAdEXdo/rEDhOFfZrd52oXPdvtEFT4fFuVIfsYD/lcnrPlmPILV3Ap
 UP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Ip7dNqBR9CCs37W148txuk2ntTuwtUF2p4pRZfBcEc=;
 b=ljbLg9PUprZG46f62VR72sHHNzUuG4VVDFozRA5ri1cGCKFhioTUA64uDPCBzUpEfH
 3hvym3/83WkAAv3D+Tx6FfoOi5Mv5WeQdZA4EXDLtxozyhmMG/ADShUbwYOaQ8/dQiPC
 idRrUBfFGHl/r/pGLseEDEGWPNGkuCqGOCVTB/VNcsmDQTwrLjxt6rM9lSibH4Cky/Yb
 SuuwJ+Zr4XURHUlWBTVsU1soI10xZaaY5CEh+V9vtH1CkKT4C/igg2eoOaFG3wv95jxC
 8XIODre/KY6fhLTfFVItB1d6E7bAKIsq1or913h2LOqJBRFl+kfsA/ecMmyCRyRAkkXR
 5NMw==
X-Gm-Message-State: AOAM532DH2FoXAf/A69MbZTZiegm33AuLGH5X+7yuKbW0iaT/NuxmpPn
 o66c6L9YR1GjxjKc5f0u6o7NDCYsP3E=
X-Google-Smtp-Source: ABdhPJyIFEPwW3Hs9yxY4z5a1DYi+lrKoMTi8GP64+mayczuiAan5beEBxPlaFoYXvEYB4PFiNEoAQ==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr21125723wrx.110.1628443845785; 
 Sun, 08 Aug 2021 10:30:45 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d7sm16794868wrs.39.2021.08.08.10.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 10:30:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 5/7] target/mips: Convert Vr54xx MACC* opcodes to
 decodetree
Date: Sun,  8 Aug 2021 19:30:16 +0200
Message-Id: <20210808173018.90960-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808173018.90960-1-f4bug@amsat.org>
References: <20210808173018.90960-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MACC         Multiply, accumulate, and move LO
 * MACCHI       Multiply, accumulate, and move HI
 * MACCHIU      Unsigned multiply, accumulate, and move HI
 * MACCU        Unsigned multiply, accumulate, and move LO

Since all opcodes are generated using the same pattern, we
add the gen_helper_mult_acc_t typedef and MULT_ACC() macro
to remove boilerplate code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  9 ++++++++
 target/mips/tcg/translate.c        | 16 ---------------
 target/mips/tcg/vr54xx_translate.c | 33 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index f6b3e42c999..73778f101a5 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -6,3 +6,12 @@
 #
 # Reference: VR5432 Microprocessor User’s Manual
 #            (Document Number U13751EU5V0UM00)
+
+&r              rs rt rd
+
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r
+
+MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
+MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
+MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 34363639937..fd8ffadf06e 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -300,16 +300,12 @@ enum {
 enum {
     OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
     OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
-    OPC_VR54XX_MACC    = (0x05 << 6) | OPC_MULT,
-    OPC_VR54XX_MACCU   = (0x05 << 6) | OPC_MULTU,
     OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
     OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
     OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
     OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
     OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
     OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
-    OPC_VR54XX_MACCHI  = (0x0D << 6) | OPC_MULT,
-    OPC_VR54XX_MACCHIU = (0x0D << 6) | OPC_MULTU,
     OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
     OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
 };
@@ -3780,12 +3776,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSU:
         gen_helper_mulsu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACC:
-        gen_helper_macc(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCU:
-        gen_helper_maccu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSAC:
         gen_helper_msac(t0, cpu_env, t0, t1);
         break;
@@ -3804,12 +3794,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSHIU:
         gen_helper_mulshiu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACCHI:
-        gen_helper_macchi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCHIU:
-        gen_helper_macchiu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSACHI:
         gen_helper_msachi(t0, cpu_env, t0, t1);
         break;
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 13e58fdd8df..0e2d460c985 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -17,3 +17,36 @@
 
 /* Include the auto-generated decoder. */
 #include "decode-vr54xx.c.inc"
+
+/*
+ * Integer Multiply-Accumulate Instructions
+ *
+ * MACC         Multiply, accumulate, and move LO
+ * MACCHI       Multiply, accumulate, and move HI
+ * MACCHIU      Unsigned multiply, accumulate, and move HI
+ * MACCU        Unsigned multiply, accumulate, and move LO
+ */
+
+static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
+                           void (*gen_helper_mult_acc)(TCGv, TCGv_ptr, TCGv, TCGv))
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    gen_helper_mult_acc(t0, cpu_env, t0, t1);
+
+    gen_store_gpr(t0, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return false;
+}
+
+TRANS(MACC,     trans_mult_acc, gen_helper_macc);
+TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
+TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
+TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
-- 
2.31.1


