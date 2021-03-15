Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48833C977
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:39:06 +0100 (CET)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvrd-0001is-UF
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLvqS-0001GF-NK
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:37:52 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLvqQ-0004PY-Te
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:37:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x16so6486802wrn.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8kjF7cpyYa4xnbMW3L3fyQa9LkcB1fz6I8q6DcPdWU=;
 b=rPqzB1VhTYPC2PZCQ1eXCEKK4e+7wEi+gc3PWYShbjuwZc5QIrJCMryEw+CEbcBI/J
 750HaGQhUKP4mrbA8n/cK3gZYfhZYptZ1mjhWY6krih7qP1qUQVzIjskXrzP92C7gtd+
 DDckCqyUu1ehA2saRjMjLgrf8Nc779cxLE879Zt76FI4fK8jkRim9NVjTgHBKTvgBDx2
 JMk8+WdxX+ZQckTvBL5rCCt4iblPy0+KAKO1oiS2qDr8X932c96amy7XrO3bUdtj1cnI
 8whevz8xdwluajVzFxb0wSM0ggaH8Rmxz1/cBhdgwTJ1/291aYci6UKLkoOiCVnakyqE
 Wwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=p8kjF7cpyYa4xnbMW3L3fyQa9LkcB1fz6I8q6DcPdWU=;
 b=h5ZlS+nAkJQK9kyp6fjfACUPa9zegseMu46dCg0WHlUO6RZuGo6wSNo2BXDCbUlM+c
 QmBc+MftoreqRh9WxYf8zTZROiqTtZVQBLV7DFOYvkBKyQwO8D1z20BJYXwzdpPESgOX
 LwbJK70fuO4Dl9undLSiEoue9HyMT8x81NDTnb5muhTqY38+YIc7lPYVEGst2Y5LIXmy
 b3IJxZK6QIbk3eOk/D8DFS1YN4BtodXsEkX9JizaPXLF84gYCDPBkmDam2u4SPjvMImz
 BkITHVTwXJH3Hc+H/1UgyJoDalen4mbxz7DK34bNoduKsKM1dN1/tCbXh2GDawoKnLMa
 4fJA==
X-Gm-Message-State: AOAM530kKDpETvItDaSKg4JJc8ScudJU6Vxy27JiE0OjZkmJsLfnxPw+
 kegZeLwUUFezqs88KeaRuF2SG0JHoo3zwg==
X-Google-Smtp-Source: ABdhPJx/6joA7yUY3Dcnhd0gsDEgmVH55BIKGke3pA/cdxDkkvfIBxUUIZNDUiZER9vwC9Pd8SPE1Q==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr1724543wrx.356.1615847867637; 
 Mon, 15 Mar 2021 15:37:47 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm1006701wmc.17.2021.03.15.15.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:37:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips/mxu: Rewrite D16MIN / D16MAX opcodes
Date: Mon, 15 Mar 2021 23:37:45 +0100
Message-Id: <20210315223745.2953548-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
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
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reported (CID 1450831) an array overrun in
gen_mxu_D16MAX_D16MIN():

  1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
  ....
  1112         if (opc == OPC_MXU_D16MAX) {
  1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
  1114         } else {
  1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
  1116         }

>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
    index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
    (which evaluates to 4294967295).

Because we check if 'XRa == 0' then access 'XRa - 1' in array.

I figured it could be easier to rewrite this function to something
simpler rather than trying to understand it.

Cc: Craig Janeczek <jancraig@amazon.com>
Fixes: bb84cbf3850 ("target/mips: MXU: Add handlers for max/min instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mxu_translate.c | 116 ++++++++++++------------------------
 1 file changed, 38 insertions(+), 78 deletions(-)

diff --git a/target/mips/mxu_translate.c b/target/mips/mxu_translate.c
index afc008eeeef..8673a0139d4 100644
--- a/target/mips/mxu_translate.c
+++ b/target/mips/mxu_translate.c
@@ -1086,89 +1086,49 @@ static void gen_mxu_S32MAX_S32MIN(DisasContext *ctx)
 static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
 {
     uint32_t pad, opc, XRc, XRb, XRa;
+    TCGv_i32 b, c, bs, cs;
+    TCGCond cond;
 
     pad = extract32(ctx->opcode, 21, 5);
-    opc = extract32(ctx->opcode, 18, 3);
-    XRc = extract32(ctx->opcode, 14, 4);
-    XRb = extract32(ctx->opcode, 10, 4);
-    XRa = extract32(ctx->opcode,  6, 4);
-
     if (unlikely(pad != 0)) {
         /* opcode padding incorrect -> do nothing */
-    } else if (unlikely(XRc == 0)) {
-        /* destination is zero register -> do nothing */
-    } else if (unlikely((XRb == 0) && (XRa == 0))) {
-        /* both operands zero registers -> just set destination to zero */
-        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
-    } else if (unlikely((XRb == 0) || (XRa == 0))) {
-        /* exactly one operand is zero register - find which one is not...*/
-        uint32_t XRx = XRb ? XRb : XRc;
-        /* ...and do half-word-wise max/min with one operand 0 */
-        TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
-
-        /* the left half-word first */
-        tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
-        if (opc == OPC_MXU_D16MAX) {
-            tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
-        } else {
-            tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
-        }
-
-        /* the right half-word */
-        tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0x0000FFFF);
-        /* move half-words to the leftmost position */
-        tcg_gen_shli_i32(t0, t0, 16);
-        /* t0 will be max/min of t0 and t1 */
-        if (opc == OPC_MXU_D16MAX) {
-            tcg_gen_smax_i32(t0, t0, t1);
-        } else {
-            tcg_gen_smin_i32(t0, t0, t1);
-        }
-        /* return resulting half-words to its original position */
-        tcg_gen_shri_i32(t0, t0, 16);
-        /* finally update the destination */
-        tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
-    } else if (unlikely(XRb == XRc)) {
-        /* both operands same -> just set destination to one of them */
-        tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
-    } else {
-        /* the most general case */
-        TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_temp_new();
-
-        /* the left half-word first */
-        tcg_gen_andi_i32(t0, mxu_gpr[XRb - 1], 0xFFFF0000);
-        tcg_gen_andi_i32(t1, mxu_gpr[XRc - 1], 0xFFFF0000);
-        if (opc == OPC_MXU_D16MAX) {
-            tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
-        } else {
-            tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
-        }
-
-        /* the right half-word */
-        tcg_gen_andi_i32(t0, mxu_gpr[XRb - 1], 0x0000FFFF);
-        tcg_gen_andi_i32(t1, mxu_gpr[XRc - 1], 0x0000FFFF);
-        /* move half-words to the leftmost position */
-        tcg_gen_shli_i32(t0, t0, 16);
-        tcg_gen_shli_i32(t1, t1, 16);
-        /* t0 will be max/min of t0 and t1 */
-        if (opc == OPC_MXU_D16MAX) {
-            tcg_gen_smax_i32(t0, t0, t1);
-        } else {
-            tcg_gen_smin_i32(t0, t0, t1);
-        }
-        /* return resulting half-words to its original position */
-        tcg_gen_shri_i32(t0, t0, 16);
-        /* finally update the destination */
-        tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
+        return;
     }
+
+    XRa = extract32(ctx->opcode,  6, 4);
+    if (unlikely(XRa == 0)) {
+        /* destination is zero register -> do nothing */
+        return;
+    }
+    b = tcg_temp_new();
+    c = tcg_temp_new();
+    bs = tcg_temp_new();
+    cs = tcg_temp_new();
+
+    opc = extract32(ctx->opcode, 18, 3);
+    cond = (opc == OPC_MXU_D16MAX) ? TCG_COND_GT : TCG_COND_LE;
+
+    XRb = extract32(ctx->opcode, 10, 4);
+    XRc = extract32(ctx->opcode, 14, 4);
+    gen_load_mxu_gpr(b, XRb);
+    gen_load_mxu_gpr(c, XRc);
+
+    /* short0 */
+    tcg_gen_sextract_i32(bs, b, 0, 16);
+    tcg_gen_sextract_i32(cs, c, 0, 16);
+    tcg_gen_movcond_i32(cond, mxu_gpr[XRa - 1], bs, cs, bs, cs);
+
+    /* short1 */
+    tcg_gen_sextract_i32(bs, b, 16, 16);
+    tcg_gen_sextract_i32(cs, c, 16, 16);
+    tcg_gen_movcond_i32(cond, b, bs, cs, bs, cs);
+
+    tcg_gen_deposit_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], b, 16, 16);
+
+    tcg_temp_free(cs);
+    tcg_temp_free(bs);
+    tcg_temp_free(c);
+    tcg_temp_free(b);
 }
 
 /*
-- 
2.26.2


