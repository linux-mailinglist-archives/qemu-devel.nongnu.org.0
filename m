Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585C31E12A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:19:09 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUE0-0008LP-16
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMb-0001Lu-Pk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:57 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMa-0007eS-7Y
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:57 -0500
Received: by mail-pl1-x629.google.com with SMTP id r2so8026246plr.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=ZLdZVS51kAwmDH4cPjd+xNZnIyo8PIRrScTOEaPTgsJk0FucV2v8Cxu6ebICCTYSeU
 mpscy+3N1gnizzes8ajqTCV3r+bNbD39r1CQ1MWcX/CLrK/fdW8kyQLPjDdVdcLugjM1
 MB03WaZi34GgzUHtT8tzAMkN0ENQzHyY2zsRxLH7B9pw35skFPWttM3HjMKfCXMMS/FR
 dpLuM7n+liyK06ZLQ4uDbd/jE+i5+IMGPfn79WP9YR0W+0Oz/XNw/F5L029YZqOqd14D
 2bub2N50hpxAMDZWin0Ba3piP4LAKKnmfYxEKN9Y+yZjovoa1arusXZ0Adbk2Ba/k05+
 LjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fN3MzHzuWIrC3R6bdCZxAnV3xyNnPemffGo42IAOp8=;
 b=TPFZdp4rnFs1Bf8dQ2UGr0ZOhKhY21ma/ljrIfWtn5jWDsp15sRX+X0ucYtUdzoAI8
 G9tPLr/j9/P/hyHnIDecYbjgiBiWwCxuJX0nX+k9DNOAhOSR5kyoixCPPlxUsrE7ntsI
 IpExNX+sDqu/86xW33ddXBQvCeFI908aZS8jU6ySCozBPqvYn/Kl5RohyCNAcd1sxBPb
 XBJ44t1ByZ1RzDpdN8mRBJO/HyeW8NY5ZRB6NbOzR2KKY2Y4b6LxwOOscOT5jzpux2Kw
 SM/P+sE8z+Tt6ktHN4nY6XEeYEmetz7YuyLTRlw8fgINuh24ebc+cveoliWLoomyG+oX
 RkiQ==
X-Gm-Message-State: AOAM530ccqJnr8fPcLU2x1QsVzBIP5rfmq978Vg4+Fy8mRhAhmN11isV
 yW0XnMF2wNWzV6V8y9W/2eUWLdLxpJ1dXg==
X-Google-Smtp-Source: ABdhPJxgOyPSMgcrMakTahGZJed654EMl4d1AFPFsSxp3CUivrBFMtUR2U9sU1AeJyA5pC5jjGJ3XQ==
X-Received: by 2002:a17:90a:4dc1:: with SMTP id r1mr589123pjl.12.1613593435042; 
 Wed, 17 Feb 2021 12:23:55 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 49/71] tcg/tci: Split out tcg_out_op_rrrbb
Date: Wed, 17 Feb 2021 12:20:14 -0800
Message-Id: <20210217202036.1724901-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


