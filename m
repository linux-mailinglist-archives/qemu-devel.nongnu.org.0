Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6E3F0CFF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:54:04 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSZX-0007nC-QX
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRv-0000KQ-JQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGSRs-00085s-Dw
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:46:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id o2so3572458pgr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2YMEXY5lcm5x3Zkh5+yyZ4R7hiwANUr2YGFQ8Zw8JOk=;
 b=laZDXteSC8GahKqs6HYAOXy33sxArIhKXE2jbzTC81dOtxq63XD1HilxO2C9OQNCqz
 o9Hw6/wXwLIFfQDLnPVxUzNTs79mNTkUhX49s20PhO0C/cN8X5Hc1nuY0YIq7wD8ufyz
 +ICzvqG+C1jZ1aq+bRV562mamGwy6kCfEY93zd64W+FYIO+am9ywWxFUvrmErQ5SLOZ2
 fGRedR56l+W/6XgnoZ7K5zK+ZHa/gIO98k1JFVCcYOPhOzqq+4hmHA0554MEn2YjNrxP
 X3FswubOwAR84MOb0W7jbBby988epfYOKiOmKnA4gLubs2sVP1dFUmsZTsn5qa7T8tpX
 Oq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2YMEXY5lcm5x3Zkh5+yyZ4R7hiwANUr2YGFQ8Zw8JOk=;
 b=BvffYK9ASApX7p8+jLrau3A+Apr57ebP7fqSk9K5G7DjJGEyEy/wTgQvd2W6wU4Axq
 n8dXBTilTR0S+73+61dpdbftSxk7OVk9e2LQf0pB3KpdiwtqdwQS6/fBtUAYJtODBJlg
 nNQ4wTjbNEnIRz+uxULpgOOZV9T9y174O0a/R78yPOPkevE/JIvHOLJXXrO4ULMBRzVH
 Mu18s2XcnHyRkZRdz4cLciwAlDIKlfAghZ5IhKNJiyS6Lx/AMpRiX8svq/ZwfMEuUBUG
 9km2OUJWnpzf92gaMI/+0XAuVYw8eWKGzmnHfavMY5Pxu7ZNwq08Xhui63M5avvGEbAy
 W1HQ==
X-Gm-Message-State: AOAM532QkrXQPo5nXJXIOF625q1y5uvfmRB1ddQtZdVam+IBT8j43QDM
 Xifv5n+XOLfVTh6I0XGV+daUhxLC9z+Y+Q==
X-Google-Smtp-Source: ABdhPJy5kwWRQbgEdbAU5AUAKIFAd3FxC8bnCAX+IJYQm6+48RHDHxIFVzokKzD04eC/ew8hoj/8eg==
X-Received: by 2002:a65:4682:: with SMTP id h2mr10819779pgr.409.1629319567229; 
 Wed, 18 Aug 2021 13:46:07 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id 143sm739815pfz.13.2021.08.18.13.46.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:46:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] tcg/sparc: Introduce tcg_out_mov_delay
Date: Wed, 18 Aug 2021 10:45:57 -1000
Message-Id: <20210818204602.394771-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818204602.394771-1-richard.henderson@linaro.org>
References: <20210818204602.394771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version of tcg_out_mov is emits a nop to fill the
delay slot if the move is not required.

The only current use, for INDEX_op_goto_ptr, will always
require the move but properly documents the delay slot.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index f2bd213449..9dd32ef95e 100644
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


