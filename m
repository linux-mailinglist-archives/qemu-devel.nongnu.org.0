Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D876B43F195
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:24:52 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCtH-0001Px-V7
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCee-00085L-U9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCea-0005bB-Sm
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 71so4728184wma.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PExG9RCnAPkhHb9SbipevnS6f+s2SY7jDeSqJu3yl6M=;
 b=mjA7VjjwyJ534FQ/JHEgOdHIYNOxVOL/mNW4JevD7cMkWKhsL4PwOp7QRTQa8ucxdS
 5O174Jiuu1sp5wcwAVIkEs/CC8K8KqIrzYee7eHoahLkQt3hP+8b79Hpiyoei26+OxCL
 4FbpDNspslJHGFEnaUpHyO3/dRgtWJ2wzrjnfIcDH5ob0QlmEy1jab9Avl0JBU7x1Azv
 SvZTKkdI+t1Q9jkMml/8FnRAbDiQS873/3CcEX7AVK9VBR2/b+nOLLTyBoApTBYKPwqR
 Lvs7gZykZz2lnYCjdYOXexmxxiRYweuDjuvmnCeHtvJIsNSVYs3u0d3l+N0RsLPTI5B3
 bs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PExG9RCnAPkhHb9SbipevnS6f+s2SY7jDeSqJu3yl6M=;
 b=lQYIlKQsZLW90fWeWKmin4jasRirgXsXs9a7GLoqh6RhPx9rdEY1r87M0UeugDIXZ2
 VNP7keQJto24xsLJ6TGygmry9oUg0ZvIU3wKaYO5xzQAMUqUh6a1BRCGV1SSHuliP7zi
 /ydZ9usPkA5FzRiefZ2SRDB/5yburWL6FpszRuGXXxlOHfcyJhQemqSt5AggmTndyyYX
 KzvMmtbsDtu6IEjxcA+qViVR1Os1YoHYKEdvONboTF/8giZmN9ruqvsIG2EkGTBINOMn
 xhW+xxFydO94pxXH6H3bQlKqLHBzCwpw/rRzQJ4HRXShzyuYYYiaEzDrOL4Q2sKIXmec
 3oWQ==
X-Gm-Message-State: AOAM531VYEasSWnqHvFtrKeqf/8KC7BPdflA1NwKpXrYXcCPtE6llYsx
 in/fdqXDlJCnas70h6xy6tiuD6ZTzKE=
X-Google-Smtp-Source: ABdhPJwFogotv684FwWzDhuoPUjUVBNn7KzwQ3QTnlZ7RwwRVKKIbj2hnpXvjGW+/2aVgGERboOm5g==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr15457170wmb.57.1635455379232; 
 Thu, 28 Oct 2021 14:09:39 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n9sm3728728wmq.6.2021.10.28.14.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/32] target/mips: Convert MSA SHF opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:22 +0200
Message-Id: <20211028210843.2120802-12-f4bug@amsat.org>
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

Convert the SHF opcode (Immediate Set Shuffle Elements) to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Renamed &msa_i8 -> &msa_i
- Remove TRANS_MSA(), call check_msa_enabled in trans_X()
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
index cd86d6cc5c0..c776735f7c6 100644
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
@@ -463,20 +460,6 @@ static void gen_msa_i8(DisasContext *ctx)
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
@@ -488,6 +471,25 @@ static void gen_msa_i8(DisasContext *ctx)
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


