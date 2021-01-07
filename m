Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B52EE8D3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:36:57 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdto-0001JH-3G
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdk5-0003GD-9C
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdk1-0006DV-Ne
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id 91so7129633wrj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAJNbn2BbAaev8vAtWe0g+lbpxYHDjLc2DhiH9wBBYA=;
 b=IsMM9sYb0osTtqOwV004HCtHqwZnJxLCcuymKn9d10Y/qUNr3dAt4sq75d2rtatyxq
 SpRmcetokXI/DabI/Lv/fXnemrR90gVFbIFnKNlkPKB967/tP5eorFZqWsEtv90QfJv5
 faQSMDf94aZqRWv3lyXg/mrokK7Wp0Ehi1M44XI5mu9Hb0IYbPK7iOeaiSr3qP4AgPGp
 jXYhX+sjuRF/d4nD3L2Xmp4oLhiiDc6adBDC8dutI2wnMvNtNirUfVq5nXBmOBbOofrA
 CC/L/yjO9srhl8WB4Ya0fEpAAYv7hIt7oelLhrQbeZyjLwA15RRNnlD8a1gjnYqw2EmX
 OcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TAJNbn2BbAaev8vAtWe0g+lbpxYHDjLc2DhiH9wBBYA=;
 b=rUuzIGz7UEJWxS5OYVf+GX5xNudoxYK4BfLZiIjjbQ+c5QYK8dwb+frmAqbn0+8xrO
 IEXxpWDvdcDZ0gtjIksgFpDtNMNU0VAbzVTqPpowK1GZONp6K6sD99uWx/CoyN3eb7F4
 6nsiU6gfS8VpnTNYuhxjfixI2f6fWQIPtU5Xm0XOeK8NRHY3VGhfqrYcqpItzQmfSybC
 g9jBDONOel0M1qKJuvvg2ZPTXyWNZE/ripkcPUKZNql++0IyCUf07E9QA7ewSL2xXFt6
 8DOuVMuMz+S8cpyiEJ02lNb/fBLwGWEIH5uxBWjk1BLTMKFWu9qgClICue3y6jzxiIuY
 XIsw==
X-Gm-Message-State: AOAM531bzMY3ES2IOIPxenLXrSQx4eR8vvc3Kjzv/ctzOTyjrfFc4MOR
 M1Hw5KV79Rr584Zzah6Vq8y6WFcdcls=
X-Google-Smtp-Source: ABdhPJwY0HPV3lgS9e/0aRYZQN/VGQFKpVtCKmCbNNmLnINx/LTY348Lja+Zhea7D8VbG8YD+FdgUQ==
X-Received: by 2002:adf:a1d5:: with SMTP id v21mr703246wrv.24.1610058408097;
 Thu, 07 Jan 2021 14:26:48 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h3sm9681113wmm.4.2021.01.07.14.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/66] target/mips: Explode gen_msa_branch() as
 gen_msa_BxZ_V/BxZ()
Date: Thu,  7 Jan 2021 23:22:32 +0100
Message-Id: <20210107222253.20382-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

In preparation of using the decodetree script, explode
gen_msa_branch() as following:

- OPC_BZ_V              -> BxZ_V(EQ)
- OPC_BNZ_V             -> BxZ_V(NE)
- OPC_BZ_[BHWD]         -> BxZ(false)
- OPC_BNZ_[BHWD]        -> BxZ(true)

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-10-f4bug@amsat.org>
---
 target/mips/translate.c | 71 ++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 22 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 18cebe26bde..0e7b2abe8bb 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28615,49 +28615,76 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_temp_free_i64(t1);
 }
 
+static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
+{
+    TCGv_i64 t0;
+
+    check_msa_access(ctx);
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+    t0 = tcg_temp_new_i64();
+    tcg_gen_or_i64(t0, msa_wr_d[wt << 1], msa_wr_d[(wt << 1) + 1]);
+    tcg_gen_setcondi_i64(cond, t0, t0, 0);
+    tcg_gen_trunc_i64_tl(bcond, t0);
+    tcg_temp_free_i64(t0);
+
+    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+
+    ctx->hflags |= MIPS_HFLAG_BC;
+    ctx->hflags |= MIPS_HFLAG_BDS32;
+
+    return true;
+}
+
+static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
+{
+    check_msa_access(ctx);
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        gen_reserved_instruction(ctx);
+        return true;
+    }
+
+    gen_check_zero_element(bcond, df, wt);
+    if (if_not) {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
+    }
+
+    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->hflags |= MIPS_HFLAG_BC;
+    ctx->hflags |= MIPS_HFLAG_BDS32;
+
+    return true;
+}
+
 static void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
     int64_t s16 = (int16_t)ctx->opcode;
 
-    check_msa_access(ctx);
-
-    if (ctx->hflags & MIPS_HFLAG_BMASK) {
-        gen_reserved_instruction(ctx);
-        return;
-    }
     switch (op1) {
     case OPC_BZ_V:
     case OPC_BNZ_V:
-        {
-            TCGv_i64 t0 = tcg_temp_new_i64();
-            tcg_gen_or_i64(t0, msa_wr_d[wt << 1], msa_wr_d[(wt << 1) + 1]);
-            tcg_gen_setcondi_i64((op1 == OPC_BZ_V) ?
-                    TCG_COND_EQ : TCG_COND_NE, t0, t0, 0);
-            tcg_gen_trunc_i64_tl(bcond, t0);
-            tcg_temp_free_i64(t0);
-        }
+        gen_msa_BxZ_V(ctx, wt, s16, (op1 == OPC_BZ_V) ?
+                                    TCG_COND_EQ : TCG_COND_NE);
         break;
     case OPC_BZ_B:
     case OPC_BZ_H:
     case OPC_BZ_W:
     case OPC_BZ_D:
-        gen_check_zero_element(bcond, df, wt);
+        gen_msa_BxZ(ctx, df, wt, s16, false);
         break;
     case OPC_BNZ_B:
     case OPC_BNZ_H:
     case OPC_BNZ_W:
     case OPC_BNZ_D:
-        gen_check_zero_element(bcond, df, wt);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
+        gen_msa_BxZ(ctx, df, wt, s16, true);
         break;
     }
-
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
-
-    ctx->hflags |= MIPS_HFLAG_BC;
-    ctx->hflags |= MIPS_HFLAG_BDS32;
 }
 
 static void gen_msa_i8(DisasContext *ctx)
-- 
2.26.2


