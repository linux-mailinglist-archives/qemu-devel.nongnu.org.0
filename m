Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91C2DB6FA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:13:17 +0100 (CET)
Received: from localhost ([::1]:45650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJVM-00074k-GC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHd-00044x-Lf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:05 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHb-0003qj-Vu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:05 -0500
Received: by mail-ed1-x544.google.com with SMTP id i24so22780543edj.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zf2zjw7Ua1MQ7xeHvN/Qv9OOVErWs8JxWytfST3iqs=;
 b=bd8VrEaOY0lIeveVRZ5st0UbMIrjDDKj5N77Igo82/CrIopTSTXJQGm0XpqALfBkK5
 /c41Zd/4YVXlvBzpsa2yJGHme7YxKnYlj8DofH8CMCAvEKRMhLGnF+JuvnjTOPv6X0lv
 weWYEhpEjGEW4NztIO8KQkrOj/3gskyV7UCqhACkcHWUYKZCFNGzIjLTfLDyaEViPkG/
 FTiiTwXTRCoMZxls8ENq3f3pKZuVYdpXwZl2l7bFglkBT9JeQms2fZxEOxdfWHn/0eyE
 0LC4QCHPKb+IU54G8iKN5i2C9LO64KIcmW98dI19HHl3a5i4nilPpusJ7iay1JmSs2iN
 RC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5zf2zjw7Ua1MQ7xeHvN/Qv9OOVErWs8JxWytfST3iqs=;
 b=WEFoDlSoBKDPEiwaDeVjtnXoz4k9dMrIRpxrDs4w8xfuImnDQQEytIc3/+PC4UYH+P
 0s68lh3eUzs9+B/oNfoTpFcdUnn/90dFveK6YWKgcQTHS3MVKSP0myziieMHlylSDxqY
 SSfyDCLrbKgzPpMi45boU1tDbE4eBIMihZ+Kl/06UUnpB9I/62nPwUEts/s+CAhxSjQg
 RoFIX4O1gFzbGYvBEj93xPEYNsgQ7vmzhwkyyiwNT20WesFFWZWpXKVZW1d3nlKrrI22
 bAYN6X3iFXIt2255k5TYfc1C1qWDAdIDaoePwNkZIsGEJoUk+CEVCuq5baNCHaib2ngC
 Kddw==
X-Gm-Message-State: AOAM532Es/pbHO3LeRlIDTgjIAGQQ8Uo2l27ToRGHTrfKh+kbI5DIZKU
 /CBro4o3IADxyhDhGktQsPmECO+Xtf9dyQ==
X-Google-Smtp-Source: ABdhPJzBXm9mLOTp9OQrBSWtUIaVLcn9f6UKQfa9eXf4LHOuRxZvnMSKdoWoiYQhVbL8L3orffphXg==
X-Received: by 2002:a50:955b:: with SMTP id v27mr30892887eda.324.1608073142693; 
 Tue, 15 Dec 2020 14:59:02 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d3sm15992825edt.32.2020.12.15.14.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] target/mips: Remove CPUMIPSState* argument from
 gen_msa*() methods
Date: Tue, 15 Dec 2020 23:57:44 +0100
Message-Id: <20201215225757.764263-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gen_msa*() methods don't use the "CPUMIPSState *env"
argument. Remove it to simplify.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 57 ++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2dc7b446e9a..a3618a3beb2 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28615,7 +28615,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_temp_free_i64(t1);
 }
 
-static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
+static void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -28660,7 +28660,7 @@ static void gen_msa_branch(CPUMIPSState *env, DisasContext *ctx, uint32_t op1)
     ctx->hflags |= MIPS_HFLAG_BDS32;
 }
 
-static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_i8(DisasContext *ctx)
 {
 #define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
     uint8_t i8 = (ctx->opcode >> 16) & 0xff;
@@ -28718,7 +28718,7 @@ static void gen_msa_i8(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(ti8);
 }
 
-static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_i5(DisasContext *ctx)
 {
 #define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -28791,7 +28791,7 @@ static void gen_msa_i5(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(timm);
 }
 
-static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_bit(DisasContext *ctx)
 {
 #define MASK_MSA_BIT(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t dfm = (ctx->opcode >> 16) & 0x7f;
@@ -28875,7 +28875,7 @@ static void gen_msa_bit(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
-static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_3r(DisasContext *ctx)
 {
 #define MASK_MSA_3R(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
     uint8_t df = (ctx->opcode >> 21) & 0x3;
@@ -29857,7 +29857,7 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
     uint8_t source = (ctx->opcode >> 11) & 0x1f;
@@ -29889,8 +29889,7 @@ static void gen_msa_elm_3e(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tsr);
 }
 
-static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
-        uint32_t n)
+static void gen_msa_elm_df(DisasContext *ctx, uint32_t df, uint32_t n)
 {
 #define MASK_MSA_ELM(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
@@ -30000,7 +29999,7 @@ static void gen_msa_elm_df(CPUMIPSState *env, DisasContext *ctx, uint32_t df,
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_elm(DisasContext *ctx)
 {
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
     uint32_t df = 0, n = 0;
@@ -30019,17 +30018,17 @@ static void gen_msa_elm(CPUMIPSState *env, DisasContext *ctx)
         df = DF_DOUBLE;
     } else if (dfn == 0x3E) {
         /* CTCMSA, CFCMSA, MOVE.V */
-        gen_msa_elm_3e(env, ctx);
+        gen_msa_elm_3e(ctx);
         return;
     } else {
         gen_reserved_instruction(ctx);
         return;
     }
 
-    gen_msa_elm_df(env, ctx, df, n);
+    gen_msa_elm_df(ctx, df, n);
 }
 
-static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_3rf(DisasContext *ctx)
 {
 #define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
     uint8_t df = (ctx->opcode >> 21) & 0x1;
@@ -30187,7 +30186,7 @@ static void gen_msa_3rf(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_2r(DisasContext *ctx)
 {
 #define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0x7 << 18)))
@@ -30271,7 +30270,7 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_2rf(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_2rf(DisasContext *ctx)
 {
 #define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0xf << 17)))
@@ -30342,7 +30341,7 @@ static void gen_msa_2rf(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(tdf);
 }
 
-static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_vec_v(DisasContext *ctx)
 {
 #define MASK_MSA_VEC(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)))
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -30385,7 +30384,7 @@ static void gen_msa_vec_v(CPUMIPSState *env, DisasContext *ctx)
     tcg_temp_free_i32(twt);
 }
 
-static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa_vec(DisasContext *ctx)
 {
     switch (MASK_MSA_VEC(ctx->opcode)) {
     case OPC_AND_V:
@@ -30395,13 +30394,13 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
     case OPC_BMNZ_V:
     case OPC_BMZ_V:
     case OPC_BSEL_V:
-        gen_msa_vec_v(env, ctx);
+        gen_msa_vec_v(ctx);
         break;
     case OPC_MSA_2R:
-        gen_msa_2r(env, ctx);
+        gen_msa_2r(ctx);
         break;
     case OPC_MSA_2RF:
-        gen_msa_2rf(env, ctx);
+        gen_msa_2rf(ctx);
         break;
     default:
         MIPS_INVAL("MSA instruction");
@@ -30410,7 +30409,7 @@ static void gen_msa_vec(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
+static void gen_msa(DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
 
@@ -30420,15 +30419,15 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MSA_I8_00:
     case OPC_MSA_I8_01:
     case OPC_MSA_I8_02:
-        gen_msa_i8(env, ctx);
+        gen_msa_i8(ctx);
         break;
     case OPC_MSA_I5_06:
     case OPC_MSA_I5_07:
-        gen_msa_i5(env, ctx);
+        gen_msa_i5(ctx);
         break;
     case OPC_MSA_BIT_09:
     case OPC_MSA_BIT_0A:
-        gen_msa_bit(env, ctx);
+        gen_msa_bit(ctx);
         break;
     case OPC_MSA_3R_0D:
     case OPC_MSA_3R_0E:
@@ -30439,18 +30438,18 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
     case OPC_MSA_3R_13:
     case OPC_MSA_3R_14:
     case OPC_MSA_3R_15:
-        gen_msa_3r(env, ctx);
+        gen_msa_3r(ctx);
         break;
     case OPC_MSA_ELM:
-        gen_msa_elm(env, ctx);
+        gen_msa_elm(ctx);
         break;
     case OPC_MSA_3RF_1A:
     case OPC_MSA_3RF_1B:
     case OPC_MSA_3RF_1C:
-        gen_msa_3rf(env, ctx);
+        gen_msa_3rf(ctx);
         break;
     case OPC_MSA_VEC:
-        gen_msa_vec(env, ctx);
+        gen_msa_vec(ctx);
         break;
     case OPC_LD_B:
     case OPC_LD_H:
@@ -31044,7 +31043,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_BNZ_W:
         case OPC_BNZ_D:
             if (ase_msa_available(env)) {
-                gen_msa_branch(env, ctx, op1);
+                gen_msa_branch(ctx, op1);
                 break;
             }
         default:
@@ -31236,7 +31235,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         } else {
             /* MDMX: Not implemented. */
             if (ase_msa_available(env)) {
-                gen_msa(env, ctx);
+                gen_msa(ctx);
             }
         }
         break;
-- 
2.26.2


