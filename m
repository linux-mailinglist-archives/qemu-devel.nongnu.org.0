Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437F3906CD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:42:16 +0200 (CEST)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla8F-0007F3-1J
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYen-0002Gl-RN
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeR-0006lB-DC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h12so4336579plf.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ytofR8WbQtEyPToJLhefg0tEo9cYPt2fZe6o8phMK5E=;
 b=ep7y7vEPA+LFrDFCm6qfcE2P8K4IkD4DbYegf7nsOgXgKJum0OHHFMaUU5E4EEe7Bh
 3gEJL160OWg3I7kcX/X40N4CCUS5/RGaFR6nMVV6367dwa9LZKwyyc3aG6EDhLV1VKWR
 bqCOq2ZxFiP5e8aXY0b5BgcjrwsCKxGCNspTr3SixNSEfgysvR/T9hX1UKOCPZDjOTEl
 85SOmKtYlsaFHczf+HLsQxIgC89lCS6uSYzLeqjlHVt/dR2B0+9xvwa4D/FwRWZjoM1v
 LIB2oSYE+hQK1Yvhhjei2A1xzMg0OThi752GSbzfkEimdZ8248qS+yu0GpHXWq1chexo
 XJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytofR8WbQtEyPToJLhefg0tEo9cYPt2fZe6o8phMK5E=;
 b=qH/9Ke0Qkj/MPK+Anzouar8jCxN5F7aQ9AfYN91khIH1L0ZwR/Rbu+7vLNGL0YsqJw
 6xS0LLGvOOmOONpoVn9A1nk5Cdz3PcEw/D4H2M2kIcfppAnbQbIgyLwzS7JZR8Eim2IO
 WuI5c6hPmnZH7RAHvBxYeFRd5A14iDCUtox9voqtG4mMWdrOQyphBi6R4i2Fc+pMsUXY
 Bx5u75jWo1djxW0wvEPP2qKLIs1Qmg0YWy7c53cGWIyDam3o79ZJ07SEKJqev+dSkmVY
 UFA/6Oj78bB4aMLZ1nSi6APJ1iRccs2FHoT/w+jIk/XCuCTHvyPNNT2ATfCMRzlbsFUe
 74zw==
X-Gm-Message-State: AOAM532wvOI/sf9bJZ4ehhcH4gZCk07QektbrnCTRP8YzoiSIHzD9Tu4
 b0y7rn5LWu18kPCmkYIkc6CLWT087P+AGA==
X-Google-Smtp-Source: ABdhPJxMh3tI9ze2K+TlN/RdFhV9pT0bdfyWvpfFE5UQ1bq6TQCzBRAsz4FGKl4F6LJZD/0cwVdP6A==
X-Received: by 2002:a17:90b:201:: with SMTP id
 fy1mr5198437pjb.119.1621955242132; 
 Tue, 25 May 2021 08:07:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/28] softfloat: Convert floatx80 compare to FloatParts
Date: Tue, 25 May 2021 08:07:01 -0700
Message-Id: <20210525150706.294968-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 82 +++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 60 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 0d1d9df70d..b86441d0c9 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3865,6 +3865,28 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
     return float128_do_compare(a, b, s, true);
 }
 
+static FloatRelation QEMU_FLATTEN
+floatx80_do_compare(floatx80 a, floatx80 b, float_status *s, bool is_quiet)
+{
+    FloatParts128 pa, pb;
+
+    if (!floatx80_unpack_canonical(&pa, a, s) ||
+        !floatx80_unpack_canonical(&pb, b, s)) {
+        return float_relation_unordered;
+    }
+    return parts_compare(&pa, &pb, s, is_quiet);
+}
+
+FloatRelation floatx80_compare(floatx80 a, floatx80 b, float_status *s)
+{
+    return floatx80_do_compare(a, b, s, false);
+}
+
+FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b, float_status *s)
+{
+    return floatx80_do_compare(a, b, s, true);
+}
+
 /*
  * Scale by 2**N
  */
@@ -5699,66 +5721,6 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
     return normalizeRoundAndPackFloat128(aSign ^ zSign, bExp - 4, aSig0, aSig1,
                                          status);
 }
-
-static inline FloatRelation
-floatx80_compare_internal(floatx80 a, floatx80 b, bool is_quiet,
-                          float_status *status)
-{
-    bool aSign, bSign;
-
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return float_relation_unordered;
-    }
-    if (( ( extractFloatx80Exp( a ) == 0x7fff ) &&
-          ( extractFloatx80Frac( a )<<1 ) ) ||
-        ( ( extractFloatx80Exp( b ) == 0x7fff ) &&
-          ( extractFloatx80Frac( b )<<1 ) )) {
-        if (!is_quiet ||
-            floatx80_is_signaling_nan(a, status) ||
-            floatx80_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return float_relation_unordered;
-    }
-    aSign = extractFloatx80Sign( a );
-    bSign = extractFloatx80Sign( b );
-    if ( aSign != bSign ) {
-
-        if ( ( ( (uint16_t) ( ( a.high | b.high ) << 1 ) ) == 0) &&
-             ( ( a.low | b.low ) == 0 ) ) {
-            /* zero case */
-            return float_relation_equal;
-        } else {
-            return 1 - (2 * aSign);
-        }
-    } else {
-        /* Normalize pseudo-denormals before comparison.  */
-        if ((a.high & 0x7fff) == 0 && a.low & UINT64_C(0x8000000000000000)) {
-            ++a.high;
-        }
-        if ((b.high & 0x7fff) == 0 && b.low & UINT64_C(0x8000000000000000)) {
-            ++b.high;
-        }
-        if (a.low == b.low && a.high == b.high) {
-            return float_relation_equal;
-        } else {
-            return 1 - 2 * (aSign ^ ( lt128( a.high, a.low, b.high, b.low ) ));
-        }
-    }
-}
-
-FloatRelation floatx80_compare(floatx80 a, floatx80 b, float_status *status)
-{
-    return floatx80_compare_internal(a, b, 0, status);
-}
-
-FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b,
-                                     float_status *status)
-{
-    return floatx80_compare_internal(a, b, 1, status);
-}
-
 static void __attribute__((constructor)) softfloat_init(void)
 {
     union_float64 ua, ub, uc, ur;
-- 
2.25.1


