Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC543676C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:17:00 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdakU-0002Wq-Mf
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdacm-000333-Ir
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:09:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdack-0003IE-Bz
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:09:00 -0400
Received: by mail-pj1-x1034.google.com with SMTP id ls18so839696pjb.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqtsASlfOloSiXLW4HD9lgyRZbkJtv9iF/YUV61MIw8=;
 b=Pik/zmC1L+otS8BK1A3ys6/+HzT4Rz+MCkATjGDJln9bT0msoiMR3Z5Eke/oqYu2Or
 fsM29vdw4N2aueNhJUfZsqdxrwskVzr0X+TSpeKh7bT4Q0VpqhLJtwg3iAxrjRSsx/Xz
 RG3RDpS2VUru9w1zxU7Y5d6yCZvRPN9yVqfyMxX+Qewc5Fjv7OI4APJDUdeoBY7vkeZk
 7iXk/QLJW6UoVILc65VQTwgZ/DwR3KgriugOxvneDt36IeJpb1fyS3a6m+mR7YyERDLQ
 JbWQZAFMowo+GC7/knSOaHMcpeslOkW4v0w8lXENOtsbLfKeRUYDCjOEUytV+BI0wM8B
 EMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqtsASlfOloSiXLW4HD9lgyRZbkJtv9iF/YUV61MIw8=;
 b=7ETvt1tjDVfcRWfqRne7EUIV93vmuUEIPQr8DBUVftDjDWHkbuKE8pAeMEi1/czCno
 vIC3a2ll8VHnmI/AxEWUTX/ElbVcrFrViMrui2SgipAbDLfL82RwI6r42Xt1BC3l3u5I
 XIGKhe3Xdd6umw8GvsNGWYzK6bFQDFY0W+vxcNJN81685NKWUWwr1zyV0Jsyag2P3R2b
 4Sb95c6/J0x3PkpKyDTmpoU7ZQ4cZdCtmJ53Sz9kXuLK3WWv0ZBOwlomi8k3wkq5mgll
 AYGbUSapOqypEfyQ9uFBSLrjCauvr5oM6oQQ/tvkNGR99jvOGha0kAQnqQe+0vshSFeQ
 GNBw==
X-Gm-Message-State: AOAM533ZAT4w3qExUmTMgsbM1fXZejd1vAhObqNOcUyBAjQbmUAs5/GS
 p2a1agSb28QZ1HYs0z+2tlKtIg==
X-Google-Smtp-Source: ABdhPJxdXCCPQg0KPBtgmeJHBuRhhRTpsWnQTLHy7HCI7cRz+PcwKqHovK2zTThOrI34YBV2qMlTFA==
X-Received: by 2002:a17:90b:30d6:: with SMTP id
 hi22mr7887691pjb.4.1634832536898; 
 Thu, 21 Oct 2021 09:08:56 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id r13sm5752505pgv.21.2021.10.21.09.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:08:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v5 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
Date: Fri, 22 Oct 2021 00:08:45 +0800
Message-Id: <20211021160847.2748577-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021160847.2748577-1-frank.chang@sifive.com>
References: <20211021160847.2748577-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


