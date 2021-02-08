Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797331293C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:17:01 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8x2q-00014a-Hp
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSS-0002Um-H0
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSQ-00067o-QT
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:24 -0500
Received: by mail-pj1-x1036.google.com with SMTP id nm1so7404915pjb.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=kwL9jfvkVVzinCWqxz1Fba+rriKLCzyyngLg2EWfvqiBt7RyeeYHj4na1K8bnsub48
 JnALOSHFYgverRL+/NCyxL850XJksxaG/1bti9qNQMTCOtSCcOVPTusMpCVRuVE+vDzy
 +hFf16XFU/gGajr+aKyQjAi7T+iAvydAvfwG9xsJd0OrPgzxW1//3YSB1klWZdR2CWlY
 ejzR/t7ApG6OlOjrS/YK+/OyVeYMmDzaY8nChBeJ03xM3THtG39eYSfMsafHZyignG3W
 U0KSDfBxxdoBeKUR/OkGuzEyX6sTJudjxi76zyOpQsuXw4Fi1meYQ2Aw32poMj6pSi+s
 xxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=UxU80KdcPktZyZHffbmiPTl45N6IG2LjxSb7DFmiL9SeZJmRXulDyqqHmvUuDVQyXt
 UbkbWUGl+1GWuQ5Aj5waH5ElAiE6/cBWkfR3CF8Yr9iA/tT7wAhGlxYPFkcy4c8xD+GX
 9uIHhLNJKqBSGbDoQVQNNZFvCCfJ9gxj1DNXTFK1s5rkVQACrPjMCY5N4BFZE8kScPFw
 QLheru1KzuIQaRMfz6dD656XuEudwVh64Jnpo2FO1VvP/FJska+0IViEa65uFMNnMxys
 laC8G9BKqwefjO7IvSvyms28CTy8CFRLLSGkD31WElcvyZI6xPqSLu3zJ/V37NwSgjT7
 KX2w==
X-Gm-Message-State: AOAM5313GLJC2thDBatDGhuaPCqu2LSYwgQOAFs1AutU4DoLV91rcvOZ
 ++ME1ovu6OCBz4ezIHhl9FJjOHJ3AGn5Ag==
X-Google-Smtp-Source: ABdhPJwahYaIlHqPMXg7epoCvVoXUa0UIEwQT/kJ+q+d0pUD3LLk0Ydef6yoVWJNCjlthGvBlkwYqA==
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr14605951pja.41.1612751961481; 
 Sun, 07 Feb 2021 18:39:21 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 47/70] tcg/tci: Split out tcg_out_op_rrrc
Date: Sun,  7 Feb 2021 18:37:29 -0800
Message-Id: <20210208023752.270606-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 546424c2bd..5848779208 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, c3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -454,12 +468,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(setcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


