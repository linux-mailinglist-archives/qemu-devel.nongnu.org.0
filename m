Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BD2CC5BD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:47:19 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkX9q-0007ek-ES
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7m-0005uQ-72
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:45:10 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7k-0002gP-Af
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:45:09 -0500
Received: by mail-ed1-x541.google.com with SMTP id cw27so1073132edb.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qmkrGEptEVCiJDUjarR/sRg1xwrhJu0233f4iQghuE=;
 b=VEEiKEGje4NdtnwGQCYst8TxXWK5/CVSc/ZzNsq1ZhVu7vMHzteTxzkAsI4OOFbiWX
 HjD9XbSrA2c7MR4No4cE4zLDR16YtHGwvQvhYUZteP0g+lkUyqDHLzmenKBixYwDUppG
 JJz+YClSRXfnHzEjP11OgGuQYdL20QtIYe6z4+Ov6Sg/V9Ix7xkN6py4bndZ+pPgLoxK
 2uvRAulzkg2yoNaxg1n1etRR26/kdzrJ14lnjsHQdf5g/T828CVaxQ2OPvf6TRJJ3hjV
 w71d0jIdBxSmVEXQIGuS7Sl3qTNuyQCuX/Wwxz6mEu7idkTzUTgxaMGxgOoSdvxeZr6S
 cVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0qmkrGEptEVCiJDUjarR/sRg1xwrhJu0233f4iQghuE=;
 b=JEWRR1LZ2d7+olEMgfL8b41UNsXUBpO8livJI9EIezEcHlFTF5Hti0uYuIS+P8U4ef
 N/6X3OIkVX51eUOiNtNy1UwkDdrMqWd8UWP70RNb7YtsZhKdEUE3gcKfUnbYYlmF78qd
 RrpUdi9PEc/8f6BolDJD0vMtEz86Z0XzLXaBeibOHIkE2GsDEKiVClICbPoANsVJpSlA
 br4QGGBrFZos/iCAvU/XIkqC5kBB/FLJHLGok6BBZZsRnS52wh8KhVkarHSlbGY9HJwK
 W+vrqN9CU4E5LrQXVmrZDCAcvxiYp0h3fCfaXnoqBeKSBk85oRUXkf63yFj8anWhGF70
 /O5Q==
X-Gm-Message-State: AOAM531QYeIh6f135ulYYvelpZwkD8YVclVBk9YcLMCinSDwZJV1bu9A
 Cw1ZnrU3qla2r0rdLv0zKDFAoetujj4=
X-Google-Smtp-Source: ABdhPJxb2Ob7W36UI/neEUTCqa00p170OxQsXQBj26kqOCh9An69Gf1sXgBnrt2+t71q44K8JynDPA==
X-Received: by 2002:a05:6402:134a:: with SMTP id
 y10mr1304889edw.144.1606934706666; 
 Wed, 02 Dec 2020 10:45:06 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d6sm422392ejy.114.2020.12.02.10.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:45:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] target/mips: Explode gen_msa_branch() as
 gen_msa_BxZ_V/BxZ()
Date: Wed,  2 Dec 2020 19:44:15 +0100
Message-Id: <20201202184415.1434484-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation of using the decodetree script, explode
gen_msa_branch() as following:

- OPC_BZ_V              -> BxZ_V(EQ)
- OPC_BNZ_V             -> BxZ_V(NE)
- OPC_BZ_[BHWD]         -> BxZ(false)
- OPC_BNZ_[BHWD]        -> BxZ(true)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 71 ++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 22 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5311e6ced62..8a35d4d0d03 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28744,49 +28744,76 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt)
     tcg_temp_free_i64(t1);
 }
 
+static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
+{
+    TCGv_i64 t0;
+
+    check_msa_access(ctx);
+
+    if (ctx->hflags & MIPS_HFLAG_BMASK) {
+        generate_exception_end(ctx, EXCP_RI);
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
+        generate_exception_end(ctx, EXCP_RI);
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
-        generate_exception_end(ctx, EXCP_RI);
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


