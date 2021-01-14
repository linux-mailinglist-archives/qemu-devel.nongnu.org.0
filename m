Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A92F6600
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:34:51 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05aE-0006ja-K2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05N1-0003vZ-JI
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mr-0000So-Rn
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:21:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c5so6383688wrp.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEincqfGa/TgGAVYBGuETQrXzL0T4zqUXQp6/H1D7D0=;
 b=SzqIMWc6tvMx8/j5DDilLfITvcnsSxX+ULg8s/tcg3U3fnhk5W+NNlIrE23EF6xWIX
 8/hlFhrsZfs344ieye8NzC2tusEu++takF1cFAdVFVkMAWb4mbQX12CpPrH8Yh6749bO
 RG24vwZ4Y0KCk+T540WQwX1OvnUzZ20Uw33hde+skqCufH0iX8uSfw06vJAOi3Bp/kHz
 oG1d/1Ar0Nwjm4DjNn9lxRjU9D57WNbNriv6/HCTjtFxbCeFNfXUAMQmvpqkaDSDyBq9
 iHk6qgxlyyjnfvlqLDOV8jWvUix4ZkiBuDOVnJKhsbHbA6aOVVddcmTEcMgqdPMR0gv5
 z+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hEincqfGa/TgGAVYBGuETQrXzL0T4zqUXQp6/H1D7D0=;
 b=N+MlysAPiM0YD8evXz+JCpKaxPXINaR4uVuigfQTkC14ze4GPTOr0tOwmZC4HdIqfa
 tvHR9qBolN1r8+o8w36gm9xWVWoCoXlLN+yDcXW5sPODIOYsv9ibtc6Y7vhNQsC588c7
 K0XOOuvOcZ1lT9EB+G1+0GfhpPqfGVNcpGKINKCCIGZNAJsoY4ClgpH4CrImVcvIU4w1
 y7Uhnf0frlOshRZwVjQmrc0+4OFf+ODY1lQqr0O1r+OBrQwAdxoxwb2QBHf3CVUCpfso
 noqUbyZPqef0TfZdYHHgyvMh6raI5VzWf8fz9qTHot3fhQotpLD7ozng7J9B5mTiWTvC
 q4jA==
X-Gm-Message-State: AOAM533xLz9x3UIz43FZbe9dwfxfBz2SRrrY65YSutjUroOnDxIrNmpu
 YawkB8GUgpk/5XuayfEdkTCscdQjg6A=
X-Google-Smtp-Source: ABdhPJzaaHDrQz4wT5/57wJpGEkhzaN+7Pevyy1MNhrWV3D5B75PygybAp4RL8SSBE4qEep9Br9ySg==
X-Received: by 2002:adf:8184:: with SMTP id 4mr9065659wra.63.1610641260283;
 Thu, 14 Jan 2021 08:21:00 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o13sm12865722wrh.88.2021.01.14.08.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 53/69] target/mips: Use decode_ase_msa() generated from
 decodetree
Date: Thu, 14 Jan 2021 17:20:07 +0100
Message-Id: <20210114162016.2901557-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we can decode the MSA ASE with decode_ase_msa(),
use it and remove the previous code, now unreachable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-21-f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/translate.h     | 12 ------------
 target/mips/msa_translate.c | 29 +----------------------------
 target/mips/translate.c     | 32 ++++++++++----------------------
 3 files changed, 11 insertions(+), 62 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index b61ae79d431..9b38f82ecd9 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -82,8 +82,6 @@ enum {
     OPC_BC1      = (0x08 << 21) | OPC_CP1, /* bc */
     OPC_BC1ANY2  = (0x09 << 21) | OPC_CP1,
     OPC_BC1ANY4  = (0x0A << 21) | OPC_CP1,
-    OPC_BZ_V     = (0x0B << 21) | OPC_CP1,
-    OPC_BNZ_V    = (0x0F << 21) | OPC_CP1,
     OPC_S_FMT    = (FMT_S << 21) | OPC_CP1,
     OPC_D_FMT    = (FMT_D << 21) | OPC_CP1,
     OPC_E_FMT    = (FMT_E << 21) | OPC_CP1,
@@ -93,14 +91,6 @@ enum {
     OPC_PS_FMT   = (FMT_PS << 21) | OPC_CP1,
     OPC_BC1EQZ   = (0x09 << 21) | OPC_CP1,
     OPC_BC1NEZ   = (0x0D << 21) | OPC_CP1,
-    OPC_BZ_B     = (0x18 << 21) | OPC_CP1,
-    OPC_BZ_H     = (0x19 << 21) | OPC_CP1,
-    OPC_BZ_W     = (0x1A << 21) | OPC_CP1,
-    OPC_BZ_D     = (0x1B << 21) | OPC_CP1,
-    OPC_BNZ_B    = (0x1C << 21) | OPC_CP1,
-    OPC_BNZ_H    = (0x1D << 21) | OPC_CP1,
-    OPC_BNZ_W    = (0x1E << 21) | OPC_CP1,
-    OPC_BNZ_D    = (0x1F << 21) | OPC_CP1,
 };
 
 #define MASK_CP1_FUNC(op)           (MASK_CP1(op) | (op & 0x3F))
@@ -174,8 +164,6 @@ extern TCGv bcond;
 
 /* MSA */
 void msa_translate_init(void);
-void gen_msa(DisasContext *ctx);
-void gen_msa_branch(DisasContext *ctx, uint32_t op1);
 
 /* decodetree generated */
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
diff --git a/target/mips/msa_translate.c b/target/mips/msa_translate.c
index 5efb0a1fc8a..8a48f889aa2 100644
--- a/target/mips/msa_translate.c
+++ b/target/mips/msa_translate.c
@@ -412,33 +412,6 @@ static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
     return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
 }
 
-void gen_msa_branch(DisasContext *ctx, uint32_t op1)
-{
-    uint8_t df = (ctx->opcode >> 21) & 0x3;
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    int64_t s16 = (int16_t)ctx->opcode;
-
-    switch (op1) {
-    case OPC_BZ_V:
-    case OPC_BNZ_V:
-        gen_msa_BxZ_V(ctx, wt, s16, (op1 == OPC_BZ_V) ?
-                                    TCG_COND_EQ : TCG_COND_NE);
-        break;
-    case OPC_BZ_B:
-    case OPC_BZ_H:
-    case OPC_BZ_W:
-    case OPC_BZ_D:
-        gen_msa_BxZ(ctx, df, wt, s16, false);
-        break;
-    case OPC_BNZ_B:
-    case OPC_BNZ_H:
-    case OPC_BNZ_W:
-    case OPC_BNZ_D:
-        gen_msa_BxZ(ctx, df, wt, s16, true);
-        break;
-    }
-}
-
 static void gen_msa_i8(DisasContext *ctx)
 {
 #define MASK_MSA_I8(op)    (MASK_MSA_MINOR(op) | (op & (0x03 << 24)))
@@ -2188,7 +2161,7 @@ static void gen_msa_vec(DisasContext *ctx)
     }
 }
 
-void gen_msa(DisasContext *ctx)
+static void gen_msa(DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index da5d5559160..6b59358b390 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -6,6 +6,7 @@
  *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
  *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
  *  Copyright (c) 2012 Jia Liu & Dongxue Zhang (MIPS ASE DSP support)
+ *  Copyright (c) 2020 Philippe Mathieu-Daudé
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -135,8 +136,6 @@ enum {
     OPC_JIALC    = (0x3E << 26),
     /* MDMX ASE specific */
     OPC_MDMX     = (0x1E << 26),
-    /* MSA ASE, same as MDMX */
-    OPC_MSA      = OPC_MDMX,
     /* Cache and prefetch */
     OPC_CACHE    = (0x2F << 26),
     OPC_PREF     = (0x33 << 26),
@@ -28827,21 +28826,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         }
-        case OPC_BZ_V:
-        case OPC_BNZ_V:
-        case OPC_BZ_B:
-        case OPC_BZ_H:
-        case OPC_BZ_W:
-        case OPC_BZ_D:
-        case OPC_BNZ_B:
-        case OPC_BNZ_H:
-        case OPC_BNZ_W:
-        case OPC_BNZ_D:
-            if (ase_msa_available(env)) {
-                gen_msa_branch(ctx, op1);
-                break;
-            }
-            /* fall through */
         default:
             MIPS_INVAL("cp1");
             gen_reserved_instruction(ctx);
@@ -29023,16 +29007,13 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             gen_compute_branch(ctx, op, 4, rs, rt, offset, 4);
         }
         break;
-    case OPC_MSA: /* OPC_MDMX */
+    case OPC_MDMX: /* MMI_OPC_LQ */
         if (ctx->insn_flags & INSN_R5900) {
 #if defined(TARGET_MIPS64)
-            gen_mmi_lq(env, ctx);    /* MMI_OPC_LQ */
+            gen_mmi_lq(env, ctx);
 #endif
         } else {
             /* MDMX: Not implemented. */
-            if (ase_msa_available(env)) {
-                gen_msa(ctx);
-            }
         }
         break;
     case OPC_PCREL:
@@ -29065,6 +29046,13 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         gen_set_label(l1);
     }
 
+    /* Transition to the auto-generated decoder.  */
+
+    /* ISA extensions */
+    if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
+        return;
+    }
+
     if (decode_opc_legacy(env, ctx)) {
         return;
     }
-- 
2.26.2


