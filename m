Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0543F1A6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:28:33 +0200 (CEST)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCwq-0007Ns-3i
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeO-0007RB-Hy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeM-0004yz-4o
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 207-20020a1c04d8000000b0033123de3425so197988wme.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44+0BdbNYoS9vGV6dypVqoCubvCqjI18YnDpGXWrlyU=;
 b=TQXbW6DVkKsBX+zAaEepO5Su9U0DFbqUXz1AfhJCyefcYdn0e7agqJOC+xic6quS19
 4F3I0I2qiJx7vb8Re8/3ZdiJW6du4Bq8aLvl8SuLIu7IxItpovF2pMK25xYOJ4HRvC5a
 4J+28B8G+3ktgTDZrQPqEsVjQmCoGDmo0C0+X0SA6fT+Ri2ucBFs+frIcL9/6NYjVCvM
 qk8+fisp6AXx9bJ/46cmlKMyJ8gHybOXEsmEL5djC7I4W0svaimqZDE5Sa6yUYghWs35
 jDBkGv5bb6CTn65mXryb69r5YmnuE3El5itHqoh9y4j1BOa6c+B56+M4sQD+Gjzvide0
 3ZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=44+0BdbNYoS9vGV6dypVqoCubvCqjI18YnDpGXWrlyU=;
 b=F9tJguN5zU8ET05mByw0/vu47dEwUtcDTJCYZ1wR8yTUZixTKEQwt1WI+gE3svpnoW
 3apx1ZFMMDzYAHnSWKuCBLTGeanvuxql7D6/VmWvN3M6RKUUjRANLpWCqZREPu0562zI
 Kzz9Kt39qY/jhOuN3ob7fO++GYI20PFYVH30R6rmBy5HX1xgad6zkMVbL+S4GEY9Drp8
 Mv4FTOfEHjTizQvJOiUimsVKHBEuxQO9Xst4J3gScLrduXTbBEftiLzmEUTHBvb4+7iP
 TuLVx+KIR3OtDoVFKdQzT4od2zCKsBIsNYUqgbbnUoy+aDv7Bt76tL2iIL9kjSUwiqBd
 RXPw==
X-Gm-Message-State: AOAM5338k5Vv1TV+IdLrmwbpPjVJi5AaaCkecTZmxncFRgCumcPPDuej
 Kk5uH4jdoSm1a9+Z9BPhJmNgIlvWgS4=
X-Google-Smtp-Source: ABdhPJx1ZK+BYAlwHH8ZJlzTvjDeVWRyWBtPkGq69dCHynDGtfw0Ye6fvPgw+hO34VgQ7K93hydEEw==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr7006142wmj.34.1635455364540; 
 Thu, 28 Oct 2021 14:09:24 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o11sm6221125wry.0.2021.10.28.14.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/32] target/mips: Convert MSA LDI opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:19 +0200
Message-Id: <20211028210843.2120802-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the LDI opcode (Immediate Load) to decodetree. Since it
overlaps with the generic MSA handler, use a decodetree overlap
group.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211027180730.1551932-6-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 +++++++-
 target/mips/tcg/msa_translate.c | 22 ++++++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 56419a24eb9..bdfe5a24cb3 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -14,10 +14,12 @@
 &r                  rs rt rd sa
 
 &msa_bz             df        wt sa
+&msa_ldi            df  wd       sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldi
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
@@ -27,4 +29,8 @@ BNZ_V               010001 01111  ..... ................    @bz_v
 BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
-MSA                 011110 --------------------------
+{
+  LDI               011110 110 .. ..........  ..... 000111  @ldi
+
+  MSA               011110 --------------------------
+}
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e1d90fbde25..ff78359597f 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -70,7 +70,6 @@ enum {
     OPC_CLEI_S_df   = (0x4 << 23) | OPC_MSA_I5_07,
     OPC_MINI_U_df   = (0x5 << 23) | OPC_MSA_I5_06,
     OPC_CLEI_U_df   = (0x5 << 23) | OPC_MSA_I5_07,
-    OPC_LDI_df      = (0x6 << 23) | OPC_MSA_I5_07,
 
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
@@ -513,13 +512,6 @@ static void gen_msa_i5(DisasContext *ctx)
     case OPC_CLEI_U_df:
         gen_helper_msa_clei_u_df(cpu_env, tdf, twd, tws, timm);
         break;
-    case OPC_LDI_df:
-        {
-            int32_t s10 = sextract32(ctx->opcode, 11, 10);
-            tcg_gen_movi_i32(timm, s10);
-            gen_helper_msa_ldi_df(cpu_env, tdf, twd, timm);
-        }
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -532,6 +524,20 @@ static void gen_msa_i5(DisasContext *ctx)
     tcg_temp_free_i32(timm);
 }
 
+static bool trans_LDI(DisasContext *ctx, arg_msa_ldi *a)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_ldi_df(cpu_env,
+                          tcg_constant_i32(a->df),
+                          tcg_constant_i32(a->wd),
+                          tcg_constant_i32(a->sa));
+
+    return true;
+}
+
 static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-- 
2.31.1


