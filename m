Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F932F65F5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:30:26 +0100 (CET)
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05Vw-0002O7-Mx
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Mj-0003bO-0l
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05Md-0000P8-3R
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:48 -0500
Received: by mail-wm1-x333.google.com with SMTP id i63so5032185wma.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnbQPb0XjiBSHLb9SRYObkA1cyhmzHvI9I6VzcXNaK8=;
 b=SxVQk0Yg0wcrVMH/r3ss++e8v7cSsjisIqQrFCPF4tJ7DmuFj40b1LtHyoa46e92Rg
 Qqh0J79xj4uSrw8QMVTb+Tvk4++mk8BM3jncFDMbvLF1h4YfD0iLFuenF8qKgnbxa6Wf
 weldZ4PnvgrVuCJ2eD7/qObOvHFosrHmOHmm2EKXuhSgmQrajcmX4xgOCAlPBLs0sWI/
 zZ9J8cgXutsuW8ri1WSx6JVySn3vhooKrl7Wh5kP08kGETEZlrI3JGSNkUJNq3J/1cg1
 ezV3jiAIPYD9YXHFPbRVFTu9X/1ncY7ygX2fCZgrs32e5/IhfBvQABq2nz0gi9qOdVqi
 nZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cnbQPb0XjiBSHLb9SRYObkA1cyhmzHvI9I6VzcXNaK8=;
 b=aQR8rmsvK8dBDba0rPYVJjTS1FMpX4rvZIFGFD/ETW9PqNG3ZZosXqhKxP9L64qATK
 My/KbYKcGnvkcXaWoYmDXMdDv4LlHknAsS7CPt1u+DcN05YickpkitSSeFkKXB5aFFF4
 D4Wn1Gkwxu/ftuEq21qbdeemtwiEV480BJ55Rnw98VcBUpoOjxOfbr++1jZOP9ncFZYo
 wnkjwOTEO2G2OUJukrCbdztE0ngKIkZFXcvyw2v0BEVBVFCC8eP9pLZ3WlJMOJ5Le/Xd
 QrfJ89nk5hGAA5T2YPQ8ETEpPiDWCtlvvhvauvXb1a9Mma6FaattdLfKQnjF+W2bnNKy
 1O6Q==
X-Gm-Message-State: AOAM5324L/cAtCW/0XoIRJlQC3tj/Gu45S1iJVcsA8c8dMx1Hi5J/vnx
 Sp2QGsSPTg9LT9KdEmkOO1mJMbcUPNc=
X-Google-Smtp-Source: ABdhPJw4/WTHRM1A7uZfkAtZCpMKRj0kba/H1H3qk6uF9v5bxw8FF2uOzP1dyDU6t5kQb5I08eIO3w==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr4786355wmk.29.1610641245508;
 Thu, 14 Jan 2021 08:20:45 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s13sm9018724wmj.28.2021.01.14.08.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 35/69] target/mips/translate: Extract decode_opc_legacy()
 from decode_opc()
Date: Thu, 14 Jan 2021 17:20:04 +0100
Message-Id: <20210114162016.2901557-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

As we will slowly move to decodetree generated decoders,
extract the legacy decoding from decode_opc(), so new
decoders are added in decode_opc() while old code is
removed from decode_opc_legacy().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-2-f4bug@amsat.org>
---
 target/mips/translate.c | 49 ++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4c400ec0b3c..d4d5d294f34 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -30517,30 +30517,13 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 
 }
 
-static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
+static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 {
     int32_t offset;
     int rs, rt, rd, sa;
     uint32_t op, op1;
     int16_t imm;
 
-    /* make sure instructions are on a word boundary */
-    if (ctx->base.pc_next & 0x3) {
-        env->CP0_BadVAddr = ctx->base.pc_next;
-        generate_exception_err(ctx, EXCP_AdEL, EXCP_INST_NOTAVAIL);
-        return;
-    }
-
-    /* Handle blikely not taken case */
-    if ((ctx->hflags & MIPS_HFLAG_BMASK_BASE) == MIPS_HFLAG_BL) {
-        TCGLabel *l1 = gen_new_label();
-
-        tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
-        tcg_gen_movi_i32(hflags, ctx->hflags & ~MIPS_HFLAG_BMASK);
-        gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
-        gen_set_label(l1);
-    }
-
     op = MASK_OP_MAJOR(ctx->opcode);
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
@@ -31268,9 +31251,35 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("major opcode");
-        gen_reserved_instruction(ctx);
-        break;
+        return false;
     }
+    return true;
+}
+
+static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
+{
+    /* make sure instructions are on a word boundary */
+    if (ctx->base.pc_next & 0x3) {
+        env->CP0_BadVAddr = ctx->base.pc_next;
+        generate_exception_err(ctx, EXCP_AdEL, EXCP_INST_NOTAVAIL);
+        return;
+    }
+
+    /* Handle blikely not taken case */
+    if ((ctx->hflags & MIPS_HFLAG_BMASK_BASE) == MIPS_HFLAG_BL) {
+        TCGLabel *l1 = gen_new_label();
+
+        tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
+        tcg_gen_movi_i32(hflags, ctx->hflags & ~MIPS_HFLAG_BMASK);
+        gen_goto_tb(ctx, 1, ctx->base.pc_next + 4);
+        gen_set_label(l1);
+    }
+
+    if (decode_opc_legacy(env, ctx)) {
+        return;
+    }
+
+    gen_reserved_instruction(ctx);
 }
 
 static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.26.2


