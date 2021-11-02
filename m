Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D78A442FF8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:13:39 +0100 (CET)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuXi-0003HL-5N
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4v-0000p5-6v
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4t-00063j-0M
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d24so2818067wra.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipjpFsMVBwISznamvW72G3eAUzuzbTQFyEPgUOroDE0=;
 b=fvIOkjENbuBv/6tUBDs2Q7772a4ImEcSzaJU5xI4w5hNGyyRqhMs9tY4MP9QGWSYlu
 rLxt6jtd0VsDngiPMe63JUs0ulHRVtxwB+Nj0IshvdF41geFZ32XTprrfL+6rFnbxGas
 AAhBdtjKfaJoi2rKAYSu9Ze3in95JD7+8SuakSjC0U+5EPi50vn5uiPuGBcgqzShw+Fd
 XbuURIfgIcu/6jWwUdpQO7Gu1uFFmKWxBc2LU4a6rCn1p84wDJDlaz7hEnkqcswFigOy
 T4K1HRcnVaJNLxAmb/vyYdtwwakgFG95GYc+Kh8j681Eez57HIgY3QOJZCtpZMcNwsFR
 W6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ipjpFsMVBwISznamvW72G3eAUzuzbTQFyEPgUOroDE0=;
 b=qMTlSWmGe1cmswIA+Bl+qkEjRjtfbmXrye/VzlqLz5TiOVFRcgFK9ZYpU7xxCUiF/R
 2gl75Om0V84GCcL2AGAu/aOTcf690BINR4I+3Oikf9PQjJonzRX1IyZtM2fhcZfZ0Juf
 u/v5C6XMQeH563EWTDa8hunuy5q4ZRZR89WmMJmCrAkzjS2AzY0kJlDPudKkGpWHATvI
 YlGNEzsSf7aRysoVezW80woGuInKa3y66vWW+igX3C92fIBsCk/6iFT8/kQzw3y63loJ
 /oum7S416JjjHHLAmFmJiXBA4TZ2Urysj+0q/JQp6JP1WqxEnlz4IaeEcst2Y6eCWANE
 XlFQ==
X-Gm-Message-State: AOAM5311cYTGxR8gSrZzoo6XxDPWe3Nc3KDvj9sMxdkPlDonksMgnskZ
 ZobbpsFP5R0Y2SecsV+r9owkeM7mj7A=
X-Google-Smtp-Source: ABdhPJwkI7pIEaAYsv6ZHWGjOmUNNgRhBeNYQTz2K3ExM6yXphxQ0MCRXpmpx41NQcRaqSEzia7oBQ==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr48068418wrx.137.1635860629616; 
 Tue, 02 Nov 2021 06:43:49 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 e12sm1803969wrq.20.2021.11.02.06.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/41] target/mips: Convert MSA SHF opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:13 +0100
Message-Id: <20211102134240.3036524-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

Convert the SHF opcode (Immediate Set Shuffle Elements) to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-12-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 +++
 target/mips/tcg/msa_translate.c | 36 +++++++++++++++++----------------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 3d6c6faf688..8e887f54ad5 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -26,6 +26,7 @@
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
+@i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 @bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%bit_df m=%bit_m
 
@@ -38,6 +39,8 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  SHF               011110 .. ........ ..... .....  000010  @i8_df
+
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
   SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
   MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 9c1a24eb251..1b1d88ac646 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -60,13 +60,10 @@ enum {
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
     OPC_BMNZI_B     = (0x0 << 24) | OPC_MSA_I8_01,
-    OPC_SHF_B       = (0x0 << 24) | OPC_MSA_I8_02,
     OPC_ORI_B       = (0x1 << 24) | OPC_MSA_I8_00,
     OPC_BMZI_B      = (0x1 << 24) | OPC_MSA_I8_01,
-    OPC_SHF_H       = (0x1 << 24) | OPC_MSA_I8_02,
     OPC_NORI_B      = (0x2 << 24) | OPC_MSA_I8_00,
     OPC_BSELI_B     = (0x2 << 24) | OPC_MSA_I8_01,
-    OPC_SHF_W       = (0x2 << 24) | OPC_MSA_I8_02,
     OPC_XORI_B      = (0x3 << 24) | OPC_MSA_I8_00,
 
     /* VEC/2R/2RF instruction */
@@ -465,20 +462,6 @@ static void gen_msa_i8(DisasContext *ctx)
     case OPC_BSELI_B:
         gen_helper_msa_bseli_b(cpu_env, twd, tws, ti8);
         break;
-    case OPC_SHF_B:
-    case OPC_SHF_H:
-    case OPC_SHF_W:
-        {
-            uint8_t df = (ctx->opcode >> 24) & 0x3;
-            if (df == DF_DOUBLE) {
-                gen_reserved_instruction(ctx);
-            } else {
-                TCGv_i32 tdf = tcg_const_i32(df);
-                gen_helper_msa_shf_df(cpu_env, tdf, twd, tws, ti8);
-                tcg_temp_free_i32(tdf);
-            }
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -490,6 +473,25 @@ static void gen_msa_i8(DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
+static bool trans_SHF(DisasContext *ctx, arg_msa_i *a)
+{
+    if (a->df == DF_DOUBLE) {
+        return false;
+    }
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_shf_df(cpu_env,
+                          tcg_constant_i32(a->df),
+                          tcg_constant_i32(a->wd),
+                          tcg_constant_i32(a->ws),
+                          tcg_constant_i32(a->sa));
+
+    return true;
+}
+
 static bool trans_msa_i5(DisasContext *ctx, arg_msa_i *a,
                          gen_helper_piiii *gen_msa_i5)
 {
-- 
2.31.1


