Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75FF39260B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:20:53 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7Vs-00075W-PM
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PQ-0001Yz-TA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:14 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PO-0007Bs-8w
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:12 -0400
Received: by mail-pg1-x534.google.com with SMTP id i5so2759353pgm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=prrVCPPqFq5mBd19RF3H8SGsVxMT7ZBmHrhUofi0h9k=;
 b=nvO+VL5TdeV4l/lVsc5SVfS6lED5u+mQiXi5Cl/f5Zy81rUQ7erxRU0sM5Yvs0wSk4
 uuWuhBBNvUWfdL8NDajxnf2HdcxIyz5L1MLgHu1TPOSVKA6XJLmcqrmd4oCG0F5jMoak
 4OfiAAkXk9cmrUgYGcLwOtQXeX6DC/7kvpyWxfHx923UPVAvSlp1E7zPmwKHNbs4t903
 oFfKKCGFoO/T0uWlsamz1gzkkec19aZm7Mx4jyz8MwiXDAKQvkm2Rj895aj4ON20RsZS
 /7H+OuLP0Gl/RW2RFFDEQgvNpzZvdRauFyifrNXSn12FXLBXtt94kstH44dqJaA4Il0c
 DdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prrVCPPqFq5mBd19RF3H8SGsVxMT7ZBmHrhUofi0h9k=;
 b=MVsBmxPkJlciCYzfIzn2VVdMQfS2wiu5+lDlAGf2gTl3RT5JcMEvdFdxgsLh166eON
 EuAo+CdzbdwS4k2MKytEYC85UqfVm8flN8lC9SqQhySyoY82c4prjl7C7z6VmpZAWZpB
 u7GBoQMU45iz34s84NS5XfKP5UWomras/HAk/8e0S/V41ZQAYbxBzuDA0jKlj9eDPVxt
 RQ+1TRys9ovvTYDiQYLROKK+Xx1RfIYt/fMLn3c5nr+hvwKO5qY3plJCkfZ/snMrxa95
 Ol3r9hSEA2/yYWuANzYCgF7O1gei7wY86BfEE2Xv+S4HJ6O1etaYR1TJxcaYx/aFZ89U
 iCGw==
X-Gm-Message-State: AOAM532e8e4vyracev6Z+LXaUMt+/RtCHkR5xfVrnF/jLN+7n70c7GI/
 UjQlVgGqQ/iUEyJMzKwjcxY0Y6DGLWugVw==
X-Google-Smtp-Source: ABdhPJyfLy3N+pVrFmSVt2TqeW00bbVy+Ro4M8oLatImKnoMwbjoUSds5h+FGvnwr5nJMj/y/KVZMA==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr1885959pgl.190.1622088848899; 
 Wed, 26 May 2021 21:14:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] softfloat: Introduce float_flag_result_denormal
Date: Wed, 26 May 2021 21:13:58 -0700
Message-Id: <20210527041405.391567-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a new exception flag for reporting output denormals
that are not flushed to zero.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 3 ++-
 fpu/softfloat-parts.c.inc     | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 174100e50e..83632aa09f 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -151,6 +151,7 @@ enum {
     float_flag_inorm_denormal  = 0x0020,  /* denormal input, normalized */
     float_flag_iflush_denormal = 0x0040,  /* denormal input, flushed to zero */
     float_flag_oflush_denormal = 0x0080,  /* denormal result, flushed to zero */
+    float_flag_result_denormal = 0x0100,  /* denormal result, not flushed */
 };
 
 /*
@@ -170,8 +171,8 @@ typedef enum __attribute__((__packed__)) {
  */
 
 typedef struct float_status {
+    uint16_t float_exception_flags;
     FloatRoundMode float_rounding_mode;
-    uint8_t     float_exception_flags;
     FloatX80RoundPrec floatx80_rounding_precision;
     bool tininess_before_rounding;
     /* should denormalised results go to zero and set the inexact flag? */
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 16d4425419..a21fcec3e5 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -276,8 +276,12 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
         if (is_tiny && (flags & float_flag_inexact)) {
             flags |= float_flag_underflow;
         }
-        if (exp == 0 && frac_eqz(p)) {
-            p->cls = float_class_zero;
+        if (exp == 0) {
+            if (frac_eqz(p)) {
+                p->cls = float_class_zero;
+            } else {
+                flags |= float_flag_result_denormal;
+            }
         }
     }
     p->exp = exp;
-- 
2.25.1


