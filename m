Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6856B430160
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 10:59:28 +0200 (CEST)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfXL-00082V-IP
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 04:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSq-00043R-1o
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSl-0005Hw-UI
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y7so10433896pfg.8
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zX44k9et39w3BQJWACWYFy5wj4chbeMyt7CGSlm/nCw=;
 b=PRXeabGcWtdKBfq6aElqQyWhZ+0UO/C6tClY9RL+jqBi3EPjpKFl6ClactgFSC7cYM
 FsqA4etAIe4Ax8FEEdKg0cs4+tvlb+LUexJ/QjjiDHuYx2UeM/8oNUQzbbv1u7q/6djQ
 4R2P3fQQP6swd6TdUzyrftimkxzG27Ppdg6zhqGNNz4f604IqrJ/XY18lz4jyE3qzbW6
 yhD5RYnfQrpLWybjYemGxWW2BCwop6ksypWic9CAokmPEJGFbc0NrB1DUHfakfXcuxqd
 CjoeN/WUzN/GnS1Vo3tcbQrgb5d524QoBfv+8resp2pOayTfAtdAtH+2+bxi+qPwjdTV
 G9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zX44k9et39w3BQJWACWYFy5wj4chbeMyt7CGSlm/nCw=;
 b=6XXRJfya7hyi1fCXpmmPqB1F0GqHj555zSkHiHlfM5uywBk1I2J3H8XED4VC4MM5X4
 o1LWTJuQIdktsI9wXcdmF+hpqR3kVLWDylvxdZuJ6/vx6sLakm54EdjbbiJ9L1n/3XuV
 1bF/tQxvKlQsI+04veuLgdNiA+BTM4Bis6H+Hd7xeKAp3hN17lUwzzAZETpNGRKps9It
 So57TEIyM0rjNmnmegJS5hk/4uRRwZRXfFQIPPNVwxsdaYtfVFAKb3T7asQ7cXGrTJ4W
 0LGtwT/M9OmHpJc/yYSx3a4h1wQWn4g5MnOd0xnk/QAJtz6of1rfjF3ZTC9fEkYT+dzL
 ZEow==
X-Gm-Message-State: AOAM532CG3va6rMKtFR23KQb3hd6ujxBO0/b21/l0CJjYbwS6kYDklxm
 V5eCpdlopqLR550mali5m+gNvn1HaQDVnCJU
X-Google-Smtp-Source: ABdhPJxnanfMfkWLuGUYGAmeyO8VRPS55Ihd4SpdyIkSJ6ptrDDY7Wr7YzXtOb3SF8ijeA6RwzL/KA==
X-Received: by 2002:a62:17d3:0:b0:44c:6022:9428 with SMTP id
 202-20020a6217d3000000b0044c60229428mr16549960pfx.65.1634374477742; 
 Sat, 16 Oct 2021 01:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id p3sm7028691pfb.205.2021.10.16.01.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:54:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
Date: Sat, 16 Oct 2021 16:54:26 +0800
Message-Id: <20211016085428.3001501-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016085428.3001501-1-frank.chang@sifive.com>
References: <20211016085428.3001501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chih-Min Chao <chihmin.chao@sifive.com>

For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,

  The original logic:
    Return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan.

  The alternative path:
    Set invalid flag if ft1 == sNaN || ft2 == sNaN.
    Return NaN only if ft1 == NaN && ft2 == NaN.

The IEEE 754 spec allows both implementation and some architecture such
as riscv choose different defintions in two spec versions.
(riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
 alternative)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
 fpu/softfloat.c           | 19 +++++++++++++------
 include/fpu/softfloat.h   | 10 ++++++++++
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index dddee92d6ee..41d4b17e419 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1219,14 +1219,35 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
 
     if (unlikely(ab_mask & float_cmask_anynan)) {
         /*
-         * For minnum/maxnum, if one operand is a QNaN, and the other
+         * For minNum/maxNum (IEEE 754-2008)
+         * or minimumNumber/maximumNumber (IEEE 754-2019),
+         * if one operand is a QNaN, and the other
          * operand is numerical, then return numerical argument.
          */
-        if ((flags & minmax_isnum)
+        if ((flags & (minmax_isnum | minmax_isnumber))
             && !(ab_mask & float_cmask_snan)
             && (ab_mask & ~float_cmask_qnan)) {
             return is_nan(a->cls) ? b : a;
         }
+
+        /*
+         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
+         * are removed and replaced with minimum, minimumNumber, maximum
+         * and maximumNumber.
+         * minimumNumber/maximumNumber behavior for SNaN is changed to:
+         *   If both operands are NaNs, a QNaN is returned.
+         *   If either operand is a SNaN,
+         *   an invalid operation exception is signaled,
+         *   but unless both operands are NaNs,
+         *   the SNaN is otherwise ignored and not converted to a QNaN.
+         */
+        if ((flags & minmax_isnumber)
+            && (ab_mask & float_cmask_snan)
+            && (ab_mask & ~float_cmask_anynan)) {
+            float_raise(float_flag_invalid, s);
+            return is_nan(a->cls) ? b : a;
+        }
+
         return parts_pick_nan(a, b, s);
     }
 
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6e769f990c2..9a28720d82a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -436,6 +436,11 @@ enum {
     minmax_isnum = 2,
     /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
     minmax_ismag = 4,
+    /*
+     * Set for the IEEE 754-2019 minimumNumber() and maximumNumber()
+     * operations.
+     */
+    minmax_isnumber = 8,
 };
 
 /* Simple helpers for checking if, or what kind of, NaN we have */
@@ -3927,12 +3932,14 @@ static float128 float128_minmax(float128 a, float128 b,
     { return type##_minmax(a, b, s, flags); }
 
 #define MINMAX_2(type) \
-    MINMAX_1(type, max, 0)                                      \
-    MINMAX_1(type, maxnum, minmax_isnum)                        \
-    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
-    MINMAX_1(type, min, minmax_ismin)                           \
-    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
-    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
+    MINMAX_1(type, max, 0)                                                \
+    MINMAX_1(type, maxnum, minmax_isnum)                                  \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)                \
+    MINMAX_1(type, maximum_number, minmax_isnumber)                       \
+    MINMAX_1(type, min, minmax_ismin)                                     \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)                   \
+    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag) \
+    MINMAX_1(type, minimum_number, minmax_ismin | minmax_isnumber)        \
 
 MINMAX_2(float16)
 MINMAX_2(bfloat16)
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ec7dca09606..a249991e612 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -243,6 +243,8 @@ float16 float16_minnum(float16, float16, float_status *status);
 float16 float16_maxnum(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
+float16 float16_minimum_number(float16, float16, float_status *status);
+float16 float16_maximum_number(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
 FloatRelation float16_compare(float16, float16, float_status *status);
 FloatRelation float16_compare_quiet(float16, float16, float_status *status);
@@ -422,6 +424,8 @@ bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_minimum_number(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_maximum_number(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
 FloatRelation bfloat16_compare(bfloat16, bfloat16, float_status *status);
 FloatRelation bfloat16_compare_quiet(bfloat16, bfloat16, float_status *status);
@@ -589,6 +593,8 @@ float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
+float32 float32_minimum_number(float32, float32, float_status *status);
+float32 float32_maximum_number(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
 bool float32_is_signaling_nan(float32, float_status *status);
 float32 float32_silence_nan(float32, float_status *status);
@@ -778,6 +784,8 @@ float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
+float64 float64_minimum_number(float64, float64, float_status *status);
+float64 float64_maximum_number(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
 bool float64_is_signaling_nan(float64, float_status *status);
 float64 float64_silence_nan(float64, float_status *status);
@@ -1210,6 +1218,8 @@ float128 float128_minnum(float128, float128, float_status *status);
 float128 float128_maxnum(float128, float128, float_status *status);
 float128 float128_minnummag(float128, float128, float_status *status);
 float128 float128_maxnummag(float128, float128, float_status *status);
+float128 float128_minimum_number(float128, float128, float_status *status);
+float128 float128_maximum_number(float128, float128, float_status *status);
 bool float128_is_quiet_nan(float128, float_status *status);
 bool float128_is_signaling_nan(float128, float_status *status);
 float128 float128_silence_nan(float128, float_status *status);
-- 
2.25.1


