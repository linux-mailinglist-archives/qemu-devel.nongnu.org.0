Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6243D094
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:20:57 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnXk-0005Bg-NQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLf-0004JK-FT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLd-00040y-P4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o14so5554795wra.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rXLHxxRogsnp6IIzjRu1XhVnNOs7SF+xybpEobk/Vg=;
 b=ANMfmBJjxO88sfWrzq26iILIEFCYf+PB4PQhEMWufk8kK7xxuY5XuVIsMvySiMr5DP
 qunmFA5CimbCuNmBr1QAKUnpboV6QhKSoHatUIaGu95qwPEy6bXc2REH8NWyNu5AjfVh
 Iqir2HApiuXxf2Tas3K+DXqEatlaZ5oJ9rhoK69eXDjapWGfOHq8stHjyg32LzvWPD3T
 DdN74hZm7LU+P2VMH7c5d0KGvGgsnwlLn02Uo1AG2hYU4BBp5WlQis0PUKOKl5KybCmI
 lyK5ET4DhY2+uhnQMfDFaeTNH4WOZokHHrGkSwM1Ig/3alf6jjLIn6B4YUjzC+iJ/21c
 QyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2rXLHxxRogsnp6IIzjRu1XhVnNOs7SF+xybpEobk/Vg=;
 b=UJlIuOcbb5VWfENJtW+vmeJstGBJ0UEdiJOiliYyEXbpkAGRrCAXXTKiZhkU5F0eFG
 ajvfx8yFv34zk6pIpLBr5ZwiMkiDHbNR+j6vjjpGyd93QVeg1W4qS8vq1BB18fv03vYS
 5TmP6lVP67IFsZ9mgBb+iJksEbafe12PUBNdsJYuosIvRuG8QTDiUiX0PDpIIGex/1D6
 pSt7P6f8pMUAZEbPuyOHmJV6KbeLQodzX3fUuWCmqQDKYCe1b7zSXV3/OsuFjkA0Aexn
 dDKJnaXmDYfYoo6IAXvTXk3VBwPTW0788q4HxJMsTkhTrQ+n4dZ/FQAA9Ib8Zk3Hg38G
 2S/w==
X-Gm-Message-State: AOAM532XwNF8SHtI0UkylAH2ZN8DeA/RY/8oZUaSW4PQVYRmUZzgl8wz
 bXmtAfTBiiOUkgKmpmuMiRM3CIoicYs=
X-Google-Smtp-Source: ABdhPJwxW5HT+WILrrZeCiXws1C71+50tuKZ4zd+jNCFYjkrNghFsm6vXUyN+z89R1y82SwZt5dutw==
X-Received: by 2002:a5d:63cd:: with SMTP id c13mr40450230wrw.224.1635358104325; 
 Wed, 27 Oct 2021 11:08:24 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s13sm4247815wmc.47.2021.10.27.11.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/32] target/mips: Convert MSA SHF opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:09 +0200
Message-Id: <20211027180730.1551932-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Convert the SHF opcode (Immediate Set Shuffle Elements) to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- add &msa_i8 format
- !check_msa_enabled -> return true
- TCG timm is constant
---
 target/mips/tcg/msa.decode      |  4 ++++
 target/mips/tcg/msa_translate.c | 37 ++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index c4699b9d4b7..7a4d7549258 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -16,6 +16,7 @@
 &msa_bz             df        wt sa
 &msa_ldi            df  wd       sa
 &msa_i5             df  wd ws    sa
+&msa_i8             df  wd ws    sa
 &msa_bit            df  wd ws       m
 
 %dfm_df             16:7 !function=msa_bit_df
@@ -26,6 +27,7 @@
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i5
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i5
+@i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i8
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 @bit                ...... ... .......    ws:5 wd:5 ......  &msa_bit df=%dfm_df m=%dfm_m
 
@@ -38,6 +40,8 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  SHF               011110 .. ........ ..... .....  000010  @i8_df
+
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
   SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
   MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 175254c1e47..76c40dc7126 100644
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
@@ -477,20 +474,6 @@ static void gen_msa_i8(DisasContext *ctx)
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
@@ -502,6 +485,26 @@ static void gen_msa_i8(DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
+static bool trans_SHF(DisasContext *ctx, arg_msa_i8 *a)
+{
+    if (a->df == DF_DOUBLE) {
+        gen_reserved_instruction(ctx);
+        return true;
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
 static bool trans_msa_i5(DisasContext *ctx, arg_msa_i5 *a,
                          gen_helper_piiii *gen_msa_i5)
 {
-- 
2.31.1


