Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D9630EA5F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:46:10 +0100 (CET)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uen-0006Pn-Rg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk4-0006N3-Om
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:32 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjx-0004Du-I5
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:32 -0500
Received: by mail-pj1-x1036.google.com with SMTP id g15so828987pjd.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=Ugn8vqTq9pUv2FIREqDAdqAA71cRKBD8wQwrUvhzriLyjxlGy8g+/Xfrk5HkPbnufX
 ykOSdnX8fEyfoXs7go09ihErRvqLmlKWAHBBJUv9lILjjzHKAiyDhbZeAapFK1clImOG
 cKeqRP5qc+MemAOk8SsbeUZk7kgWNXgXo8r5eO9racLfNj0s2CZw8DzwTy5t16GVYDSQ
 AprwODb7RqwMYGRt68KiZeUx1cquPslHUdjyhhZBWcDsvGgk0HcCqebT5QMZCZlKFoJQ
 MnuZjixiGc6hYxJPwydsXVeoYXeiCvx9LIFhGLY34QEmKiP1YI66h09v2/wYH05hIUkc
 cKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RltB6tJRO1PShAvoUlO75Uo0j450X071u7i11eDg0EU=;
 b=re3zWeEILzYmUx0nlEWEtnFEJSFyL2SF4xvrjw1YeVOF/iA39CFTi4cXFvdadnZoOm
 sz2EDqmWwfX+FYWwj2V5m96DR6Go7nq2xPDbXCDjUYdvU6m5Fi/eEr4Zsv12Ax4lXbnt
 /AHwkpoboYknq5ttVUYSCInNzcbymxMnp7uTP1Bpl8QWkrRLPGnbottu0XVZU8L0Jm8E
 BZPml4rRDE/WgkrUsKiZctKgB0HjIMsgzer0v4jJIY8KwJWigQD4Of/0cXMM9eLXnZPZ
 qS4PFJ+2lYzubsfF3A+A3nXezBQAR0JlPwGtMrPW9QFzjmJAcTwXuwMYlz9mkjEFoecC
 srdQ==
X-Gm-Message-State: AOAM531Mwmg3cRuROI3f+oQQD32F/X07xNiebgnYvUcso3t9obcMie3j
 Vmx4KQLaX6IhjESSXmI6zlbqFSMzStZqf5tJ
X-Google-Smtp-Source: ABdhPJwxBW+RntQULOTXk5lKE/G5ANDOZwT59JouYd6fYAs3RceBKlRel4HRzIcQ3vCz4V+Ing2dDQ==
X-Received: by 2002:a17:90a:4096:: with SMTP id
 l22mr4327050pjg.34.1612403244089; 
 Wed, 03 Feb 2021 17:47:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 77/93] tcg/tci: Split out tcg_out_op_rrrr
Date: Wed,  3 Feb 2021 15:44:53 -1000
Message-Id: <20210204014509.882821-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
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
index f7595fbd65..c2bbd85130 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -385,6 +385,20 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -632,12 +646,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 #endif
 
-- 
2.25.1


