Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C443AF94C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:29:15 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTLu-0005mD-VD
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC5-0000t3-Ip
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:05 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC0-0005xY-VS
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:05 -0400
Received: by mail-pg1-x531.google.com with SMTP id h4so3871034pgp.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9DRzzMJ2NyGbyRHOk5FDpkj407KEfEqhUdHXH7B5Y3g=;
 b=bY97JD1puj46wEnElvvfPu56cQuF0CzJyc2eCEZLioJ8TryoJ3wrrhKvJWHw4iiqai
 s5qFJFV7asOaSs6H5ekpbcnv9T5pGBcB7lCHOtE2+cxY/1iBJr4sU0m9Bzf+AG46TOsZ
 Zg+vsKM1+oguuWUcwj1woMAXxxwKTCo8e68l78SiD4n1hQ40ekuOSHdavGIL6Xq5qRDb
 hitYIe7YOmLlscC1OiT1ZkLCPfpLDN7qgULVv2MWTQmWbwhpoEuDtVIqA0X69nXsHWwR
 CnPZoCBBTmaNv1j1fT+TMWgwAYdRGzABxLPEi48Bxk5ew+K10eDSUvc6d2bFDLHM47Qi
 L5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DRzzMJ2NyGbyRHOk5FDpkj407KEfEqhUdHXH7B5Y3g=;
 b=WJO34iwqmzHUXMJtZr6GQKLVRV+jsw3Ll3rpraz0al6/Pb8asNtdmdQMwX23YBleP3
 yNrqHGuPNh+SB2cFM95R3b238K0qMUO46lb1hpnFkALkEquYlIVhMHye1+mBOPci2cad
 AGB1j84nFid58z3pZZcFw0R2epiJgVfLjXMop0wiSxhMW1xPoB7sQ8xVm+AWWpFWZ+me
 SYr+p5YLw5eHx3W5MaFmq1Gz+fH/vK9l2AZEK/jI9oGz84/KQROpUMDN8AE8uPwndyAu
 PrImdpYQMBBR+5JtljWGzr8SRsjPQQMHJ/V2M8GGXFUdXZ2julEVzIhLVAjXf7fyvHKg
 XlGQ==
X-Gm-Message-State: AOAM530yKhetO9KtJjoE504UhWx1DZCZt4dbn+BXTAuhOTJ3ljAKjS0u
 451n5o35nbUl05mOUqSJUB3D19Q19mW78g==
X-Google-Smtp-Source: ABdhPJzso+wcKNWrhTlExUYe6pVFysCbEghrmyTfluvT8KQ9ysUsTiMf/tSfwpt5QIUyR0G+j2PADg==
X-Received: by 2002:a62:164b:0:b029:300:5576:3c77 with SMTP id
 72-20020a62164b0000b029030055763c77mr591672pfw.23.1624317539595; 
 Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/29] tcg/s390: Support bswap flags
Date: Mon, 21 Jun 2021 16:18:33 -0700
Message-Id: <20210621231849.1871164-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
easily provide the extension to 64-bits.  Drop the special case,
previously used, where the input is already zero-extended -- the
minor code size savings is not worth the complication.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 5fe073f09a..b82cf19f09 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1951,15 +1951,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
 
-    OP_32_64(bswap16):
-        /* The TCG bswap definition requires bits 0-47 already be zero.
-           Thus we don't need the G-type insns to implement bswap16_i64.  */
-        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
-        tcg_out_sh32(s, RS_SRL, args[0], TCG_REG_NONE, 16);
+    case INDEX_op_bswap16_i32:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh32(s, RS_SRA, a0, TCG_REG_NONE, 16);
+        } else {
+            tcg_out_sh32(s, RS_SRL, a0, TCG_REG_NONE, 16);
+        }
         break;
-    OP_32_64(bswap32):
+    case INDEX_op_bswap16_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVGR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh64(s, RSY_SRAG, a0, a0, TCG_REG_NONE, 48);
+        } else {
+            tcg_out_sh64(s, RSY_SRLG, a0, a0, TCG_REG_NONE, 48);
+        }
+        break;
+
+    case INDEX_op_bswap32_i32:
         tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
         break;
+    case INDEX_op_bswap32_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tgen_ext32s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tgen_ext32u(s, a0, a0);
+        }
+        break;
 
     case INDEX_op_add2_i32:
         if (const_args[4]) {
-- 
2.25.1


