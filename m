Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F0457280
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:11:33 +0100 (CET)
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6U8-0006nz-TN
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:11:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OA-0004on-NF
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:22 -0500
Received: from [2a00:1450:4864:20::42c] (port=44782
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O6-00047j-GK
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n29so18915389wra.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seshvYp4LY8Qi6+H+Y57DABJXL6G/4sEs202cPZYVR0=;
 b=fh0JjhnTfiLH3pMIjt0Wa/nL6p+oDIDyxwIlOyC9OIJIRg/r9eJbnjG0X+aGu0kt2H
 E6HEbwGhpZnJuZ+wmshY1SYWMvTPnhEwsr+pYEIKVAkQu/EDaCNPer4nQoPtPDD21mxB
 9hb+pMGpL+T5VARe9nDX4qu2w3ewArdvuW5YHyjxxYAoFBHuSU54QZEtDrI2rIAmOmmk
 mGC6gJeKzwBBqcv+PatOW3hF1i3Wme7oGHn2eCMBkCsppuDemKhO7uLh2dzIfm4Ccjzb
 XoABq34wqyOFs0zlQcSNVJoJ9xek3xv7K7VNmq3pKV+alpyYlV9J7mhQHacWEl6ScBOE
 /mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seshvYp4LY8Qi6+H+Y57DABJXL6G/4sEs202cPZYVR0=;
 b=jv2kuQ0O7Hl5JlByJ7Vx4jcjunebHLQEXtNuNjZB83NLXfG5lbSsLaQ3SwTfPlMPz6
 8vhk8jwoI9jfOAoFqt4ONK6we6zc0qnnxf0HkPyamNMVZCydn8Aw1dvH8LcfBu6gxDBn
 4HRttWO+kIPVDlmzfJLdg6JbJlAHhahklt7ZAkpPjR/tBCEnXH56olA25298udKV/MJ5
 un7Cd386MJxdnP/i6L+f5p6QnwzL6JTrNakbNM3tqoHj0307OF+npRmLoe1L+gA7wcLW
 tTXGX3q4yalLcQKLvyVq0E3dzneAld5wilUoVob7c1Pm/cHd8w6Ch2KOpgM9X3ohYFXX
 Dxew==
X-Gm-Message-State: AOAM533E/Ea6XSXzujy9Y7cexsFMCp5MpbXMdHZpUJJQ3usbvuqWLzJ0
 0ERiwvmG4ce0clhmNnfADWZfbqey7q85JERMbDY=
X-Google-Smtp-Source: ABdhPJyue1XdE6230Lb/e5n6DFfMcUHlWvmaK+LTrqMw/j7ia1dQJFbfPT51prXQkUYEgnYKGYNVMg==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr8835297wrd.420.1637337915897; 
 Fri, 19 Nov 2021 08:05:15 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/35] softfloat: Add flags specific to Inf / Inf and 0 / 0
Date: Fri, 19 Nov 2021 17:04:31 +0100
Message-Id: <20211119160502.17432-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has these flags, and it's easier to compute them here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h |  2 ++
 fpu/softfloat-parts.c.inc     | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 56b4cf7835..5a9671e564 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -154,6 +154,8 @@ enum {
     float_flag_output_denormal = 0x0040,
     float_flag_invalid_isi     = 0x0080,  /* inf - inf */
     float_flag_invalid_imz     = 0x0100,  /* inf * 0 */
+    float_flag_invalid_idi     = 0x0200,  /* inf / inf */
+    float_flag_invalid_zdz     = 0x0400,  /* 0 / 0 */
 };
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 3ed793347b..b8563cd2df 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -590,11 +590,13 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
     }
 
     /* 0/0 or Inf/Inf => NaN */
-    if (unlikely(ab_mask == float_cmask_zero) ||
-        unlikely(ab_mask == float_cmask_inf)) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(a, s);
-        return a;
+    if (unlikely(ab_mask == float_cmask_zero)) {
+        float_raise(float_flag_invalid | float_flag_invalid_zdz, s);
+        goto d_nan;
+    }
+    if (unlikely(ab_mask == float_cmask_inf)) {
+        float_raise(float_flag_invalid | float_flag_invalid_idi, s);
+        goto d_nan;
     }
 
     /* All the NaN cases */
@@ -625,6 +627,10 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
     float_raise(float_flag_divbyzero, s);
     a->cls = float_class_inf;
     return a;
+
+ d_nan:
+    parts_default_nan(a, s);
+    return a;
 }
 
 /*
-- 
2.25.1


