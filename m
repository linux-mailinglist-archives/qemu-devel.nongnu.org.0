Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407A30EA68
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:49:04 +0100 (CET)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uhb-0003Zy-2C
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk3-0006KK-KG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjr-0004D4-SP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:29 -0500
Received: by mail-pf1-x430.google.com with SMTP id o20so1092524pfu.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=s8yxaLTQnVhmH3/rLDV9uofiHQ/uf7eLHl21/p/OXNY8oD0ZiDeMInUT9iEU08AreP
 KbH/eR57tLwL1uFCJ1IUFHf6nF+QePpu72rXdWKpOEjukLBsT2EMI1IWe+BESkSQipyf
 6KX4R5uZh5fN6OAMp9XholEwjpUPyDN8Z1JoInSSKl65uqcVol3S33t/sxlW12+cTRfD
 epvo3V3uV27BKaKjWunt6ELMTb6ayNnRXRQ6f/CaZ6S/6ZjAxCEPCH6Noo+YfkyP8PI4
 DApvMcKWey13TcJQWixgPyk5f1HKBndfIww+PJ4C6b0wFB5ac6a2nlBZAEc/JNlGgSwQ
 PB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=oiv7ledgBwsg0+14YXMjhLvjc/ky2M6YLgBXgiau2c2mvYLveAT4xtIKWcnaCguOdV
 WTn+7vVQFYIvfJMzsKfm4BWOAqmZn4IDjfTGHTs5If976QQfa2aowZ8JCGNSSYA3/S5g
 9siOb5iZs+aSZ68ZHlPU2FifWfdn5cmVDuOlcPmz98ZbJs58DEyMtZCSitPhxeusVCvP
 kWqCZ6ukkU4Vyw+dJ74kNQQp/jZlF6W8mJonvePg089EepS8sCzyR5m65s/2NIi5z0yL
 qmNyRqK6UudZv5tCUUhWubrJg4aVIYQODossCEinM39Jj3PGoVDO04SvO2Zlcq7+uIlX
 zZ1w==
X-Gm-Message-State: AOAM533RM6DHnFB9LDZPOeyuxPoKzejnAVjbF22RoM//VUqqQtT1N1in
 K3Nl5wlsYyAbnm/hzpwwD3Kqoi8McPbp3LoO
X-Google-Smtp-Source: ABdhPJw9EOOAr2JwRw8wE+tO0yRlDYA5coFQIK2LPWLtSyxTYE4ukCh1bjsKc1Weu5jdE5ygA4kG2w==
X-Received: by 2002:a65:6aba:: with SMTP id x26mr6403330pgu.125.1612403237776; 
 Wed, 03 Feb 2021 17:47:17 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 73/93] tcg/tci: Split out tcg_out_op_rrrrrc
Date: Wed,  3 Feb 2021 15:44:49 -1000
Message-Id: <20210204014509.882821-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 5848779208..8eda159dde 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,25 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGCond c5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out8(s, c5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -473,15 +492,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
-        /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out8(s, args[5]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrc(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
 #endif
 
-- 
2.25.1


