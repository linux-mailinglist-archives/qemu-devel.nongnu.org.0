Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1342E8B5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:12:56 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGSd-0005du-IW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRc-0004WO-0n
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:11:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRY-0001qO-5X
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:11:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id w14so5758379pll.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1dzdQt6RGRlpojPozE1ubvGZgEhFPMxtksE+j35cvI=;
 b=OuDcZtRytp0F3fl19Z87Ui09GFam6tc7K6L3YryZNOrASbwtxEtVWaULokiIiUVhJA
 xEOxFw1ABOvWYk+vVS+BT/mPPKGFVCG0e2PP2daghWsyNnx7VvLTL/KHU3GcCos/bmx8
 GIxMMR3g7dqZ9nmzfDG/fW5eK980Lybhoc8v/MexDHskOof292Py+XTxyz+Idq41+GXJ
 vvI80LrTNJbLm3wduq83sN99/wcHN/6XfYT3r0+oyPL6niSku0JYSq3OGg3GCkhDOE7X
 2FuM7Hf9gCFz46erWZhUJMlTZVDE66FGTm76kxuZrpKkunUz+CEmhwiS37mG32HBwTnw
 GA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1dzdQt6RGRlpojPozE1ubvGZgEhFPMxtksE+j35cvI=;
 b=3FUSw42CNGfBnMu6I4iDXoy20wMJAGYgmB13DuXLM2txrkj32gS5jmPPDEp+xDIQ1t
 g0ERUEb+o3ALPm3HWE0V64Y9yOEglDX+4E8KCEGWGnYZVniG/va+8f8nibp6CyVMNRKj
 pYy57BOjIMAMmaHvyU+irRm+3aNi7eT5QhYXYpNtN5cofv5aUHsDV77tpvkjHY6VkFP+
 7E3HwmlRmoqbo23dQDJP2aJKp8cLt0g2AD5kBR0rTFeVqTRED4GG8QL2R1Ijs3vbaNT3
 Ex0VT67NdZ8+ub9EC71nOknJ8qu7hoAYs0ZXk5b1qUkjnXLmxIzeh5xHPkCCE8AW1L3q
 vbrA==
X-Gm-Message-State: AOAM531qIqvSq55E34KwWSsXCBevEJyx1N/9NDO1hkODOdO6kenGjodJ
 c4/6n1UkGUvL5TtgOIVLnUXtIkqPnsBCpw==
X-Google-Smtp-Source: ABdhPJxJ+4f8dJ9h0ZSmiYIfw+JzABRGIT5QUGciEu1wqURVFHa00X9hkrwDa/Tovidq9CTwZ14LKA==
X-Received: by 2002:a17:902:968a:b0:133:e2c5:4908 with SMTP id
 n10-20020a170902968a00b00133e2c54908mr9437826plp.2.1634278305880; 
 Thu, 14 Oct 2021 23:11:45 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k14sm4211373pji.45.2021.10.14.23.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:11:45 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
Date: Fri, 15 Oct 2021 14:11:32 +0800
Message-Id: <20211015061138.3766862-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
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
 fpu/softfloat-parts.c.inc | 19 +++++++++++++++++++
 fpu/softfloat.c           | 18 +++++++++++++-----
 include/fpu/softfloat.h   | 10 ++++++++++
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index dddee92d6ee..a8d74624f5a 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1227,6 +1227,25 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
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
+        if (!(~flags & (minmax_isnum | minmax_snan_noprop))
+            && (ab_mask & float_cmask_snan)
+            && (ab_mask & ~float_cmask_anynan)) {
+            float_raise(float_flag_invalid, s);
+            return is_nan(a->cls) ? b : a;
+        }
+
         return parts_pick_nan(a, b, s);
     }
 
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6e769f990c2..eee65e9934c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -436,6 +436,11 @@ enum {
     minmax_isnum = 2,
     /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
     minmax_ismag = 4,
+    /*
+     * Set for the IEEE 754-2019 minimumNumber() maximumNumber() operations,
+     * without sNaN propagation.
+     */
+    minmax_snan_noprop = 8,
 };
 
 /* Simple helpers for checking if, or what kind of, NaN we have */
@@ -3927,11 +3932,14 @@ static float128 float128_minmax(float128 a, float128 b,
     { return type##_minmax(a, b, s, flags); }
 
 #define MINMAX_2(type) \
-    MINMAX_1(type, max, 0)                                      \
-    MINMAX_1(type, maxnum, minmax_isnum)                        \
-    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
-    MINMAX_1(type, min, minmax_ismin)                           \
-    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
+    MINMAX_1(type, max, 0)                                           \
+    MINMAX_1(type, maxnum, minmax_isnum)                             \
+    MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_noprop) \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)           \
+    MINMAX_1(type, min, minmax_ismin)                                \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)              \
+    MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |      \
+                                  minmax_snan_noprop)                \
     MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
 
 MINMAX_2(float16)
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ec7dca09606..b77917ea661 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -241,6 +241,8 @@ float16 float16_min(float16, float16, float_status *status);
 float16 float16_max(float16, float16, float_status *status);
 float16 float16_minnum(float16, float16, float_status *status);
 float16 float16_maxnum(float16, float16, float_status *status);
+float16 float16_minnum_noprop(float16, float16, float_status *status);
+float16 float16_maxnum_noprop(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
@@ -420,6 +422,8 @@ bfloat16 bfloat16_min(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_max(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_minnum_noprop(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_maxnum_noprop(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
@@ -587,6 +591,8 @@ float32 float32_min(float32, float32, float_status *status);
 float32 float32_max(float32, float32, float_status *status);
 float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
+float32 float32_minnum_noprop(float32, float32, float_status *status);
+float32 float32_maxnum_noprop(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
@@ -776,6 +782,8 @@ float64 float64_min(float64, float64, float_status *status);
 float64 float64_max(float64, float64, float_status *status);
 float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
+float64 float64_minnum_noprop(float64, float64, float_status *status);
+float64 float64_maxnum_noprop(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
@@ -1208,6 +1216,8 @@ float128 float128_min(float128, float128, float_status *status);
 float128 float128_max(float128, float128, float_status *status);
 float128 float128_minnum(float128, float128, float_status *status);
 float128 float128_maxnum(float128, float128, float_status *status);
+float128 float128_minnum_noprop(float128, float128, float_status *status);
+float128 float128_maxnum_noprop(float128, float128, float_status *status);
 float128 float128_minnummag(float128, float128, float_status *status);
 float128 float128_maxnummag(float128, float128, float_status *status);
 bool float128_is_quiet_nan(float128, float_status *status);
-- 
2.25.1


