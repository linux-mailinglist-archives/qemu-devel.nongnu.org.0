Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D933762E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:52:20 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMfj-00005J-LR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUm-0003oO-7B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUZ-0006d3-VD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:53 -0500
Received: by mail-qk1-x72a.google.com with SMTP id l4so20794749qkl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=y/gUPpn4vimjc2E7/K+dN0nE1udC8cRm6EGyfIxzuryRHsda469ir55wkTnnba/oGL
 gNOoVJMb7I84kWaP0BJUEHkQcT67QT1Ix2UV7ngMx1ZGo4KjB+2EKj9cZnfRX+NA1roq
 VSMDG5okvcD7mGoLSw5Q+vjoYhzkCuzloBkneSVovu2I0OtYYk6Abekx4fx45B+u2ZzM
 4V4oB+Jpd1uVliIP/m4izPFFGVGsIWTvmOVTPAkBqxINGnjXOZEMpd3IfOSlWYnxLzJ+
 EZ3DB/G937c5SDNOSZF1QFJTl0AXplJytoeWhoYvxro5vigCpA7a+5VvhQFAXxzMLQC+
 hROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8+oxGont/+bDGkQ3AaEp3aS+SzJCnRbYSKjy2ImL7Q=;
 b=kRAiYMDMatG5LPBr5rFjTTIqATcF3sS2Se1RtDik7jqsBCMP01cTz1ro9h+C5Wd11P
 ORMo7KmvODoLYMCnOEICMyjoa+dTqg4Zic03dlbSv4J0ObTEXbX7wzLXaB4c7q89o0jE
 wZ5NMecnBK/UzDgipBqcKlE+McxUM7WBRqWejl1Yc20YjXxkZyJk/FWHD7pBjfgM2Hvo
 3p1Ji6qx5KrkT13IaN6TiNu0uoc/sB7A3iVu7jwVEwwblS2KafI4gIGjLXcAxAYJ+sGX
 LHJN0Zj5PG/KKA7rVu+gki/lKySFK5TNolXgRX5taRyyVuOtDBLGTXC+ePEku2HZd0qE
 cWIw==
X-Gm-Message-State: AOAM533+QL9ffhVLdMp54RTKX62jt9Lki5ZfP8LHS4ALJP48IfSx+mo4
 znO5NyaFXaSWTpQMWGjNdSml7/Snkq7vf3la
X-Google-Smtp-Source: ABdhPJyAed47mFVT0Ej3XnjA5Eq2Q9kZeXfJz+rSAiUQiekBzmLjJ1O1wW0NVgF1NLmwgCXWlgYVnA==
X-Received: by 2002:a37:886:: with SMTP id 128mr8220909qki.430.1615473646231; 
 Thu, 11 Mar 2021 06:40:46 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 33/57] tcg/tci: Split out tcg_out_op_rrrrrc
Date: Thu, 11 Mar 2021 08:39:34 -0600
Message-Id: <20210311143958.562625-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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


