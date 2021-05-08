Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB4376EF1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:46:06 +0200 (CEST)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCyj-0003TK-RK
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8U-0003Z8-Ep
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:06 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8D-0005bF-JO
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:06 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6549289pjv.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jo+ANFYUJMSCyvRfCt/6jyK6Kk/POkqHuzGReMBellk=;
 b=WeoYBPMziOBg34gZW3xQ9KbnszjHPng6VyiJ9sKvRDFuBpY0rVE2n01uJfbUJY8LD4
 zPYra06zlP6OBpgqcCbKvBL93bvA2ibpMS8qAVrEz1k/sTc/9D7FFI5mVX+iGMdcmdO7
 +lh/MRp2CAEflJ78fRf6YGsOb/vs7xtY2rNfFZWb9mRvX3Iu168WGDwxKxlm21u4P1fj
 hXhEKRyMXG55DNBygKXe+k5Z9KpGZ+XNpNVPc2Y3uEbdMfYp4i0qBOJrrUa2kIhouZad
 C7icG0qYZwxNnIfXeIfL/kQKdOx/PRpEumvhOuTnv+qq1ydnFra+GBSxXLsQ1T6iTwuM
 XBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jo+ANFYUJMSCyvRfCt/6jyK6Kk/POkqHuzGReMBellk=;
 b=X80+JeDbmc7LzqLhkuNqDYjLYWnJOcITg/vaTcQnvJ1vqKvpaUd7e1Fh4ijorV2RLZ
 u9bpsLVPgWt2HZEtmDxZ+nft3V+yrRBmAM5zOdKZW8gzlhzVySJcfvd4wzucZXoGYKdB
 34O+TaDbYYae3RrOBofwwJJ4225zyD40LUo1mOamHmH9DVLgwue2l8Mq+Qko9oAVKSV0
 /7qCUS7OYTBcBnhKkw8uuu/DO4MnHGRd6VTg6w3DjdTUCjmPNOmGKwbvlQi/DghUJwNE
 jzlf5/XYuk7Nvf9f24kTfiopacaH+N8HMamRqRlQDxjrPClc/k02lsUnL9cPk0ESSSc5
 HMKw==
X-Gm-Message-State: AOAM532ic730Vig/x8EC8bEh4lgNxbhzJwU7jNHySmAKcwRRmo65pvXl
 wRp/YuGY5GJTlWCneDiPc7M4tj+i9h+ypg==
X-Google-Smtp-Source: ABdhPJw8X6hjrfBk6l53Ug5riOqj2dgZEdWPBb2edln2ZgqEu6H7NY4IvCcGO7eeN/4idkVlHynR+w==
X-Received: by 2002:a17:90b:310b:: with SMTP id
 gc11mr13752229pjb.118.1620438708427; 
 Fri, 07 May 2021 18:51:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 69/72] softfloat: Convert floatx80 compare to FloatParts
Date: Fri,  7 May 2021 18:47:59 -0700
Message-Id: <20210508014802.892561-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index 81ff563dc0..b89ec4b832 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3864,6 +3864,28 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
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
@@ -5698,66 +5720,6 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
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


