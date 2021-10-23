Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23C43859A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:51:56 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOvj-0007GQ-Pn
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsi-0004Ul-8E
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsg-0005KH-20
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 y132-20020a1c7d8a000000b0032ca5765d6cso3538256wmc.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRefdsaN3G9tHmzokFN7A+u5JQBRpdn2H5WuoRTRYAE=;
 b=Lf8wmN51TwkLtEWsiXUbfwrLq7Y6I2Y9LaGDjsEEg4jXedC5XBGs5/d5zyWBkRwjxA
 t16i8by9s8iB8rAelPSX9e4LWe5OTCjEjnjALUzz5Fpw2mXS2mBmM1svxrtlmPV5L+Ji
 XGKNs9FkPcFjLIJa+D8U3WdUHS4mOk5mbU7a1pVlf+RQsYwhWEdZI1P6BRjp5YAKVbtl
 a7AzyUurGCz+zdUjzQflesSDqAF0vBbs1b3PnDqPm/EJu/rrt6HhgRIombfPCHCqU7Ly
 AX5NpDH752LpWO8mgfkWLiANQzuaRU+qHH6c8zXQ+JYQp/FqsqZsuNBYTGPscMflM9AI
 C+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wRefdsaN3G9tHmzokFN7A+u5JQBRpdn2H5WuoRTRYAE=;
 b=kudYIBLU5QhZbrS2ssCW3/9b4tXCrOCyBcQpPz8V1ifobU5Np+Mkn/fdmzu2VH1vaY
 874wxQiJ0LfOtHlLE6WbY1NKOwNxxlqyeoeypvnIcYVfdfZ2w6dCags+E5HuqEh3gVqX
 gaI1sKTJ4Zsy8dTwcpIlX+ahM0abhg/aaBXlOXB/BHz+fVK4qiMMeFxPMowN7FCrvvIK
 fVYcQKj3yy+o4Z4+Qug58IajPIqcH2fyPyDHHWAJ93SyvMt2ZbWmiCKzpI/vo75OL35N
 bfxMvwIPRK/FBfd74fq8AiWObUPTpHGz0/wn4Ip9K+uFEECj99xNKQLk34l8hb1oCxEF
 m6vA==
X-Gm-Message-State: AOAM533XwVHnZpzIUdbRSHKME70vGD919kXl73nbYv8vNrOWlNRgWnaW
 f3k+V5ti7rAYWsAD0uilD4gjQ8Hro68=
X-Google-Smtp-Source: ABdhPJwL8EioIwyVPcVEk1382fIPF+/EVUxSDugNTQyac7r7ZRCSquikfWqERKdWKi0MSQkzP06deg==
X-Received: by 2002:a1c:1b50:: with SMTP id b77mr9541741wmb.0.1635025724568;
 Sat, 23 Oct 2021 14:48:44 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 89sm778166wrc.47.2021.10.23.14.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/33] target/mips: Convert MSA LDI opcode to decodetree
Date: Sat, 23 Oct 2021 23:47:38 +0200
Message-Id: <20211023214803.522078-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the LDI opcode (Immediate Load) to decodetree. Since it
overlaps with the generic MSA handler, use a decodetree overlap
group.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  8 +++++++-
 target/mips/tcg/msa_translate.c | 30 ++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index aa784cf12a9..86aa66f05b9 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -14,10 +14,12 @@
 &r                  rs rt rd sa
 
 &msa_bz             df       wt sa
+&msa_ldst           df wd ws    sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
 
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
index c2a48aecc46..3b0dfcca69d 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -70,7 +70,6 @@ enum {
     OPC_CLEI_S_df   = (0x4 << 23) | OPC_MSA_I5_07,
     OPC_MINI_U_df   = (0x5 << 23) | OPC_MSA_I5_06,
     OPC_CLEI_U_df   = (0x5 << 23) | OPC_MSA_I5_07,
-    OPC_LDI_df      = (0x6 << 23) | OPC_MSA_I5_07,
 
     /* I8 instruction */
     OPC_ANDI_B      = (0x0 << 24) | OPC_MSA_I8_00,
@@ -525,13 +524,6 @@ static void gen_msa_i5(DisasContext *ctx)
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
@@ -544,6 +536,28 @@ static void gen_msa_i5(DisasContext *ctx)
     tcg_temp_free_i32(timm);
 }
 
+static bool trans_LDI(DisasContext *ctx, arg_msa_ldst *a)
+{
+    TCGv_i32 tdf;
+    TCGv_i32 twd;
+    TCGv_i32 timm;
+
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
+
+    tdf = tcg_constant_i32(a->df);
+    twd = tcg_const_i32(a->wd);
+    timm = tcg_const_i32(a->sa);
+
+    gen_helper_msa_ldi_df(cpu_env, tdf, twd, timm);
+
+    tcg_temp_free_i32(twd);
+    tcg_temp_free_i32(timm);
+
+    return true;
+}
+
 static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-- 
2.31.1


