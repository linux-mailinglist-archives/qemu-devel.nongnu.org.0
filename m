Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303E43D142
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:54:02 +0200 (CEST)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo3l-0003ZX-4L
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLd-0004JG-J9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLQ-0003yL-6S
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id d13so5569177wrf.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBiknKQuhfDEYQrYt1q9LI2OLCw/EZSt3fd0UGk9Wxo=;
 b=hF31FRUO9LfcZ0iKyYkvJ6lGypiOO6yYJDuUqD5Zyj3KtUVeFymIrUgmzFCJkfpqej
 qUkgGgkKWKUo3rR9Q28DPfWnYxyZyCkB5AELwyfAAb/SULepkb1RHJWm1hoq0mvuEICc
 /BMFkO0bOV2gRGANDANAHSRZbJ9EW0w33znD36uGQkfsBVoKSeSfaaeuW9NxZmMZm6Ep
 E2/wrRyqFRfZgr+VdRKlqnRE9O74xiQ7PjMNFuBTRgmuEokCJEdBrE0JN94kKIFHzd08
 UjbVzbXPqqjjY8KEVHXHsiTqTCxNPdy1MMpC0p2uRSRECW4XUhSlBCmvNpRVIUuQLFly
 5Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SBiknKQuhfDEYQrYt1q9LI2OLCw/EZSt3fd0UGk9Wxo=;
 b=JLLkw2L8sNXtUY9mK/g15cBmpcq6Q+9HJGCIAP2WGtOaCVPgZyhNQ8cOeG2EdVSJiF
 Zwk/qmg0kMMjIrQa5srX+ANSistyDMwpQBjVzE8ymnzLJJoyK/jVmfBg421Wpmv90J2S
 eqiWPkKBWYX92swgKL5JkZeXtrSiwrME/9V49VIGo9JCe/b3IFN9huCY0mgveyW+BTcz
 8bNzM7r65MU64TtX9ltRSTY71J3MAJJNGBFkn4YOuu+wptuAQvfCCsUaXhySdqfG1HUX
 5I+/IcXA2wiHeRSPoL+kQ1fv+ZRzA0CeSlbuCLb2qzAz+NKw1wwOs9oeCnbq3Xxw8ufs
 9rNA==
X-Gm-Message-State: AOAM530TQ7khEBuIV49DVui15QuAx/UeeAWv5CT/QjD1K/ZJvt4qH+LP
 JyOBjDpQZMGDWNELx7igly5z4ll40AE=
X-Google-Smtp-Source: ABdhPJy3W8i8a9+97ZAInCLuulVSfzjVngu5FXh6VgeYLnm23R/Ax9dDfce/cHYdpmUNCShBOw5OSQ==
X-Received: by 2002:a5d:6a91:: with SMTP id s17mr15225190wru.18.1635358090697; 
 Wed, 27 Oct 2021 11:08:10 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm3990173wmc.21.2021.10.27.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:08:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/32] target/mips: Convert MSA LDI opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:06 +0200
Message-Id: <20211027180730.1551932-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the LDI opcode (Immediate Load) to decodetree. Since it
overlaps with the generic MSA handler, use a decodetree overlap
group.

Since the 'data format' field is a constant value, use
tcg_constant_i32() instead of a TCG temporary.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- add &msa_ldi format
- !check_msa_enabled -> return true
- TCG timm is constant
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
index 0aaf441f359..46f5ba092e1 100644
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


