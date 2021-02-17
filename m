Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF30431E11B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:16:06 +0100 (CET)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUB3-0004FQ-QA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMb-0001LH-G4
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMY-0007eJ-WE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:57 -0500
Received: by mail-pl1-x631.google.com with SMTP id f8so6449428plg.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=q7cKT6OxTrpZSsoYOU/LRNJ8BKlZ5FGXjNtyFBA55FT1zGZtTQkwdU+5i4cgiOoDi3
 AC5NGfLid6no1tYiyaHZPyrejCJPdBVE8ovyfPwplrfCNzM7LIRlPH4xzX624frUQ0h4
 YA6T7utKPz1Iyc6M8UGE/SOMb2q0Wyu3yPyh7dCZAgUx9clZUX+tCVcSsB/nfOb7hYX/
 tB4CNg49thvBNoAxLlH4Qgdd6b6nM3r54tqZwcUW7cL1T0VbJFaTe2DO80Lqn1oIb7dG
 h8JNXCYMrhLxq9BT109oTn44HexyQpQZQK89ruFbLb/C49Mi2ZKFthCJWSmbKo+CXej/
 dDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=NipQ7fg8Nce/E3hJ9127Z4SuQO1cFXuQEbmp23ci/Y14oGCpnatXQpYFpP5oy9iKA+
 y0ZQMsGMMlQS0p/P/dtFEj4mgLQRwqJOGC6/8wVBoAW2/oWoMvCXirYEuCnCLzmkUiWx
 13cc8DAIlTrKlcP+3q3wKkXEkcg70FxEZtSMBZhMSTWgWrfl7/YZPnNaJOB/MS0Q49eJ
 a5qlb3MYh830ZASevSCciuyJGfz5YIow2hOeJn8WFEAdr2MX3Sm/f/g9YAjERJ2MSrrx
 7+L63E8MxHkcNNbuvIhJXeH4UuBThU4cfC99a3PVzTmlWYloEDkzPeRV4DT24UIgGs7d
 Az8A==
X-Gm-Message-State: AOAM533WfvKqkxpRDxM8UmJqCJJ+LIHkx+Rqrsz6URvHVuHZLzYBeYvh
 3KZZPCZVVAmV3sKedBhPT0n+4OJyQ0QewA==
X-Google-Smtp-Source: ABdhPJztybbFaltWu6Vd3fjshphmg2kMIPldfM5q8ME8s2DwlPg6Y7MdSSA2ZtkXbl7E/zUKMPGjqg==
X-Received: by 2002:a17:902:ecc7:b029:e3:920d:f394 with SMTP id
 a7-20020a170902ecc7b02900e3920df394mr952280plh.35.1613593433756; 
 Wed, 17 Feb 2021 12:23:53 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 48/71] tcg/tci: Split out tcg_out_op_rrrrrc
Date: Wed, 17 Feb 2021 12:20:13 -0800
Message-Id: <20210217202036.1724901-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


