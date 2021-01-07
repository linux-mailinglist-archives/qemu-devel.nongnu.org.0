Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F62EE94E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:54:15 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeAY-0000gH-Qg
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjE-00021f-Mv
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjC-0005sg-OA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id r4so6805594wmh.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RlmjZD/A3T2fr0JUoH85vuwC1Fo52rRxQmVB1QjBz9E=;
 b=SBMuA4EtFqwEkxXdKSMPXgSAj5wO/ro1U0KG3liHYmdnBG8jNhHd3jQFjxQMVPmtuQ
 djha6PXbWdgHLoBYZZp0NTWSPTsV+dVZb9mQvq1lc2Id0/jLLwWoqu4OlN93PI3Qt9B7
 +aHRMKklepcEu/z3bOSwAd2zZWXM4frr5tPFC9ISQC+ikKfTuaBSzmlFPXiEA+emzwux
 C4g1kt2Eu1Zb9rAmUGwnh62YQUShiUMouxwhGtycXrW0rMK2Wtxyspcm+12W4/5NnvCJ
 af3Bqe9WZ2CCR0Cw3QDw72F2W4BQv1wF5AxgZP17OzkknmMt90a4UqO5+UyA4Zc1L9JZ
 dLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RlmjZD/A3T2fr0JUoH85vuwC1Fo52rRxQmVB1QjBz9E=;
 b=Y20VxWBMpx91qSVvG00bCmtnqCYp+GaTmauP82gzkcLrMfipS3uplJ4fcNuJZhJQcy
 dPb67hMC61N0m1cXbsyNcM44MWhNnoE6e/zAoYYPzVKHRKI+8fd+6m8V8jiJHHFL1YmB
 x+/lOnbWWrzR0VXobSchfBj+YhyPd90b/tr2+Z/Uv7ZUIzOJeBgHegWRlWDrAIfcCvdW
 MGqOw/M4yESsL3+bjDfvHN2RT9iDRgF/PXn8WpOK5dkCONulJ7eQjNslUUYYM+Ll1fUY
 dLAcIKw7b/SeChocoAYb+F3v1dQDmHyI5/qo8/dNUqC3BIvleffI08OyEyOKwRvpmkDJ
 jXsA==
X-Gm-Message-State: AOAM5325M0ijookuoDaNaNCCM4hJHVYLS4HIGiqY8nG54MgXcWmE9KZ/
 aNjhhaUDmHqlWT6wKZmTEUnEmT1hDt0=
X-Google-Smtp-Source: ABdhPJwoJVLzZ/qFA+Cy7r9W3UMAsAZQYt1Z3j0t6hvrmnMMZTF2r3KKkM6n6BLOL4rOpv3nSHSgnw==
X-Received: by 2002:a1c:5410:: with SMTP id i16mr543118wmb.30.1610058357273;
 Thu, 07 Jan 2021 14:25:57 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z3sm11193357wrn.59.2021.01.07.14.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/66] target/mips/translate: Extract decode_opc_legacy() from
 decode_opc()
Date: Thu,  7 Jan 2021 23:22:22 +0100
Message-Id: <20210107222253.20382-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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
 target/mips/translate.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 39b57794b36..7d2120dd51c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -30518,30 +30518,13 @@ static void gen_msa(CPUMIPSState *env, DisasContext *ctx)
 
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
@@ -31269,8 +31252,32 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     default:            /* Invalid */
         MIPS_INVAL("major opcode");
+        return false;
+    }
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
+    if (!decode_opc_legacy(env, ctx)) {
         gen_reserved_instruction(ctx);
-        break;
     }
 }
 
-- 
2.26.2


