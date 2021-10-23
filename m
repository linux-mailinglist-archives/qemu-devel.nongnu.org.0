Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B84385AC
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 00:00:04 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP3b-0007WF-Mg
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 18:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOt6-0005M9-85
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOt3-0005Vw-UD
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:49:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k7so179468wrd.13
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mg99jYEYPFU2NQRL9WBrBN9xN6wlefBcRoYkXCdFQxc=;
 b=QXb3Vks6GSLMXMelnDNSuZ2HBCFxm1tlsQo0MyXmWfw9uweWrt9BvAQEAD9PPFMz4j
 VRX8yVFCypgQ6ijZnRoBdwSjS6aD+/gG4OTgFQRLGA79hezp0TXfWXNS/Qq3TZQ3J88T
 mdlw0Fls+WGgYs36hOXMZ2MjRCQovWzOxlwiQPsFtgR9QyxbxonVysYKrJi61BJxcwlO
 2v2B9TWMXH7etPPfA9DcU55Ww9QgSwmE4bT/RwT3LedzEX3MLYjO1xSO6ISOB/z0jhAb
 YhlTccR/ypgccYLLr+lxoPZOHyc7YZGsg2mpjfkbLdirvtrHz7TZen/vhMgirB0P4azh
 hD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mg99jYEYPFU2NQRL9WBrBN9xN6wlefBcRoYkXCdFQxc=;
 b=mRenbmkGULaTM0Qc0EGYJaj6Wxi1KFYQRuvXA12JOkB35+a/ECeMfMgbHTMmtySwvg
 BEWmOp3q8eQeCTayjOZmGSVZXoZfQdOyoYk6bcRWeOMYM3MEo6nkXPm+43/xu3SgKcvC
 Z9nOcyakbH92J3F4UOgEgN5q+pgDeZy3qepc7jVOP7e4AnWDF77QwomIghcipz2r6JFC
 i0bccWOYlGiKtM175HVc4/3IJBTeTntXsD4q3XNeQBa3hEkmahOM9zia26KZwvatqk3t
 6/P3PnXUZFiShSIeAYLXmPZz2153s0yEYGLdPt9yJL5ybs9S7JpIeGZ/6hyB8PotbFBi
 DaeQ==
X-Gm-Message-State: AOAM533YreDDqealyH8Sct6I+K1GP/+7TylQtmoGnHVOmtgPhWe/0yTI
 y9y69/JaasIaGvezEBgLEgp4GExt24o=
X-Google-Smtp-Source: ABdhPJzEVebXzGTA7nALnW601D90ykUbN7bh5yARJPoSJYrAPl0t5jnjWc+mDdWvtErSMst3ecy5zg==
X-Received: by 2002:a5d:5915:: with SMTP id v21mr10649362wrd.270.1635025748535; 
 Sat, 23 Oct 2021 14:49:08 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i11sm5151354wmg.46.2021.10.23.14.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:49:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/33] target/mips: Convert MSA SHF opcode to decodetree
Date: Sat, 23 Oct 2021 23:47:43 +0200
Message-Id: <20211023214803.522078-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

Convert the SHF opcode (Immediate Set Shuffle Elements) to decodetree.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  3 +++
 target/mips/tcg/msa_translate.c | 47 +++++++++++++++++++++------------
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 91d71ff560c..6347468a709 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -22,6 +22,7 @@
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_ldst
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_ldst
 @ldi                ...... ... df:2 sa:s10     wd:5 ......  &msa_ldst ws=0
+@i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_ldst
 @bit                ...... ... df:7       ws:5 wd:5 ......  &msa_ldst sa=0
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
@@ -33,6 +34,8 @@ BZ                  010001 110 .. ..... ................    @bz
 BNZ                 010001 111 .. ..... ................    @bz
 
 {
+  SHF               011110 .. ........ ..... .....  000010  @i8_df
+
   ADDVI             011110 000 .. ..... ..... ..... 000110  @u5
   SUBVI             011110 001 .. ..... ..... ..... 000110  @u5
   MAXI_S            011110 010 .. ..... ..... ..... 000110  @s5
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 10bbe25172a..7cb078bfe92 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -57,13 +57,10 @@ enum {
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
@@ -454,20 +451,6 @@ static void gen_msa_i8(DisasContext *ctx)
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
@@ -479,6 +462,36 @@ static void gen_msa_i8(DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
+static bool trans_SHF(DisasContext *ctx, arg_msa_ldst *a)
+{
+    TCGv_i32 tdf;
+    TCGv_i32 twd;
+    TCGv_i32 tws;
+    TCGv_i32 timm;
+
+    if (a->df == DF_DOUBLE) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
+
+    tdf = tcg_constant_i32(a->df);
+    twd = tcg_const_i32(a->wd);
+    tws = tcg_const_i32(a->ws);
+    timm = tcg_const_i32(a->sa);
+
+    gen_helper_msa_shf_df(cpu_env, tdf, twd, tws, timm);
+
+    tcg_temp_free_i32(tws);
+    tcg_temp_free_i32(twd);
+    tcg_temp_free_i32(timm);
+
+    return true;
+}
+
 static bool trans_msa_i5(DisasContext *ctx, arg_msa_ldst *a,
                          void (*gen_msa_i5)(TCGv_ptr, TCGv_i32, TCGv_i32,
                                             TCGv_i32, TCGv_i32))
-- 
2.31.1


