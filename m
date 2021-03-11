Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6733767D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:06:47 +0100 (CET)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMti-0006tU-B2
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUn-0003p6-6W
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUa-0006dA-K3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:00 -0500
Received: by mail-qk1-x734.google.com with SMTP id x10so20777340qkm.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=MTuNQ9gCeohA47mvBzZsQSGXrYhGucs931Q4ICP2ABA9h1qVtFMIeiq3yy8NaR9Pwa
 4p1d5UzhgFWaHWHMyU0EwunBaLa7BjwWjcRlTQZtpTYBcIajbwOG02+u1mvgACxs7Of5
 LdyFMHIQCtXIaFb4U0jrLmhxlXrQ32fypgF+va+KTwnIv3uWZ8bFquWfqxXEneSALOCD
 dlBpYR6W4KHmY9o5fDGoVbCBRGv9dUml7kAY69gk1H9J0FGpAPd09zhkwnqL/KUS1Jwu
 TLtfj5fqOcRWUQcFol3E3wycQ6vh/LPTe2VTZgIqxZlHRIX4CeaAq0uXC76rAM5JCuj4
 HtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=g0Zf4NJWnJZh4YYuhVECprgq7NMTalYLhJ9z0OpWU4srWptRsctlF2UlbuhiApiGaS
 qD03cz6mVvTQ7d2OGwnifwRJZcrf+RVq3FwD/0smntBlxji1QSIg+n5s/0+xCoYrD1Xy
 aUrwrSXtBoTa+5Uq7h/mVTck9faxNlf2OmbQ8adbvXeoi09MeAot37pR2xHGRFiE/L1M
 KH7dybSF7oCY93pZJ/wreTyA/3q1c9noiYPeIKovXRw2tZYBCnbw3JrkSTqXFv/sNfIw
 1IFPZ0Dw1e/BQHC2m2xNca1VfY0OdXXrDQdzB4bh/z/Pvtw8aEE17MLBqps3RM9rsBoy
 yiKg==
X-Gm-Message-State: AOAM530GzVbIkjWNtmVIcg3CEctGiM2wDrTIRNtSZtKSh7+2/Qkq5/+e
 kVk91TAHKvKW7GvCmaWtQXBUO/zMip3v/iS4
X-Google-Smtp-Source: ABdhPJw63t/lK1J5z99Oaz5zHCN6u3zNDyffo8nJ4xPPZD0CNZ6BfhGFiBPNwFQL5bQhYGh9w+dEvQ==
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr7562971qkk.83.1615473647471; 
 Thu, 11 Mar 2021 06:40:47 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 34/57] tcg/tci: Split out tcg_out_op_rrrbb
Date: Thu, 11 Mar 2021 08:39:35 -0600
Message-Id: <20210311143958.562625-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8eda159dde..6c743a8fbd 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,21 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, b3);
+    tcg_out8(s, b4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -538,7 +553,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_op_t(s, opc);
         {
             TCGArg pos = args[3], len = args[4];
             TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
@@ -546,13 +560,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
 
-            tcg_out_r(s, args[0]);
-            tcg_out_r(s, args[1]);
-            tcg_out_r(s, args[2]);
-            tcg_out8(s, pos);
-            tcg_out8(s, len);
+            tcg_out_op_rrrbb(s, opc, args[0], args[1], args[2], pos, len);
         }
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


