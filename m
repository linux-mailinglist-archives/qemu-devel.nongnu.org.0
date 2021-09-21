Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52921412BC1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:29:54 +0200 (CEST)
Received: from localhost ([::1]:43820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVXd-0005Ux-Ca
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTf-0005et-TV
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTc-0006IB-7D
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:47 -0400
Received: by mail-pl1-x636.google.com with SMTP id bb10so12369032plb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdcS/QGFTvc6ZKaUfNXcEO6hRsowcjhW++K3hiiKcz0=;
 b=qYCIdRpZD5bLyZ/GEl//0zGQATUB/YWch1QuVh60GMir7zYSHTgFOO2SikZZC1jkr0
 iOUN6r9d3Y8KDud6ZmV9j3DEbvDayTqNdWVDl0h1PnOIuCtrAG2p/r0btO6FSPae9kys
 r1IThSTI2GHFBG/ePk4wYl5qGzhAsxW7yoPuzuHMF669UHCjfC+JKupS4aTO9vKOgm9m
 lUziIF8ryVHgZUnjCKjkFIZmRBAKJiSSFh5U9IX9ySipvT47Yceu6AJGPnyoS3NGmXYi
 Gph89n1TQ9KK9o8SImgCQ9oNqVoHNhjg0HAjA9dgE/GYFlzvNfw2eBRGE+n3i3h2SrkE
 HXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdcS/QGFTvc6ZKaUfNXcEO6hRsowcjhW++K3hiiKcz0=;
 b=vvzZQQU9gIpeIOVFtTTxigTN227Z8KBsmaEfT/XLDKEJWKUHnZvU0iKFKAf/ILEzbO
 JXlgLsXOEcl6o0gSvYAnLey0FUSBFs/PvcgIIWGilhc0a0bitSKIa4YdlRpiYxWYLXf9
 Je7B/sqlfCBL4c7XJNIBJL0DDGEoEj7SsLRB14KrTQeaRFHL3pSImAsrnBnci73zblTv
 nnJghy1pS3xFaD0lnqMzPWNzRtWJJJQ/BUFklRk+XkJ+nISceB7aPOx3WpDNNbEsihPy
 chTNxmXlCY7vF+UspLZAFxZLWZJDHUbNVhnh6IiXofrmfLz3cvThzcnY/nHQhOVVr9wi
 FR+Q==
X-Gm-Message-State: AOAM530Zi0VKaEZ9DyBGQusTR4w5uS0pNVNGdOefy70Hz7IcdX19WBDH
 8lQNIoKvFYmw+sdsbFOuligW+yUjwvLZtQ==
X-Google-Smtp-Source: ABdhPJzd4qMVr665LJ0LQPuFn6goS4Y3rX/tYlOMH5ujr3VTJIHsOYaT+f7HVtYU2Afg06G7JKMldw==
X-Received: by 2002:a17:902:e88d:b0:13b:8ed2:9f42 with SMTP id
 w13-20020a170902e88d00b0013b8ed29f42mr25118460plg.67.1632191142015; 
 Mon, 20 Sep 2021 19:25:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] tcg/sparc: Introduce tcg_out_mov_delay
Date: Mon, 20 Sep 2021 19:25:32 -0700
Message-Id: <20210921022534.365291-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version of tcg_out_mov is emits a nop to fill the
delay slot if the move is not required.

The only current use, for INDEX_op_goto_ptr, will always
require the move but properly documents the delay slot.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 1763253edd..9720d76abd 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -362,6 +362,11 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
 }
 
+static void tcg_out_nop(TCGContext *s)
+{
+    tcg_out32(s, NOP);
+}
+
 static void tcg_out_arith(TCGContext *s, TCGReg rd, TCGReg rs1,
                           TCGReg rs2, int op)
 {
@@ -389,6 +394,15 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
+static void tcg_out_mov_delay(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    if (ret != arg) {
+        tcg_out_arith(s, ret, arg, TCG_REG_G0, ARITH_OR);
+    } else {
+        tcg_out_nop(s);
+    }
+}
+
 static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
 {
     tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
@@ -551,11 +565,6 @@ static void tcg_out_div32(TCGContext *s, TCGReg rd, TCGReg rs1,
                    uns ? ARITH_UDIV : ARITH_SDIV);
 }
 
-static void tcg_out_nop(TCGContext *s)
-{
-    tcg_out32(s, NOP);
-}
-
 static const uint8_t tcg_cond_to_bcond[] = {
     [TCG_COND_EQ] = COND_E,
     [TCG_COND_NE] = COND_NE,
@@ -1349,7 +1358,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_ptr:
         tcg_out_arithi(s, TCG_REG_G0, a0, 0, JMPL);
         if (USE_REG_TB) {
-            tcg_out_arith(s, TCG_REG_TB, a0, TCG_REG_G0, ARITH_OR);
+            tcg_out_mov_delay(s, TCG_REG_TB, a0);
         } else {
             tcg_out_nop(s);
         }
-- 
2.25.1


