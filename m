Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597139AD3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:52:47 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovGf-0006aG-0B
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6F-0002qP-BX
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov65-0001A7-HU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:59 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r1so6165568pgk.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ndVa83SIfMh7/NYhgST6dDyuB+J+HvB1UgKzExjE9v8=;
 b=qrpAHubuOPfTL1yxgHwgrzkF/fMrBaJzUWnxWaCJnhMUgipGZ8Ibkg/noq4M1T0xpN
 Zby1WhTVqjaU4uxItGlf7saaleTOtanK8FsUTyCpqUu8WQOOMK4bWTLDIgwGaTzffVeu
 19Fj9bHlwMkMZ7uTlnpGDtObqVtLB88XV9MFaOMImA2ZENKcso29oBqsczNU1JWYIlz+
 vO7tbxoAK6RyBex/QPXdVlPUPDbEXVjfRniPtyfQbmofFI/jo8fTiag5CXpMS6zetn+0
 Sj0jEDPhNZs/QTvrvl14oqHMiUcSOSLAppKMYbvamVFiwD2O22Hv0LBBwVQLNsqZvXva
 50CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndVa83SIfMh7/NYhgST6dDyuB+J+HvB1UgKzExjE9v8=;
 b=stcmT1F9r2y7k6vfxGXqDHkIu5st84IKHP36DOS8xdwI/qSjaChvgI6VlG/f1QqVU+
 txmW3QxXvetsWYxe7Y6WZd93Nt4FczN8teZpjl+4+WjK69/0Adw0UQYEFlf6FAIhCGHX
 NPbooXicxfFKI25wvL7iZrdhh2wuRD/gF7wVELdEa8Sj4F+agosLzpK8ZIn2eCwpf4Uc
 WA2Ppg0LCDluRBeeMBcaDbnXhIbM22xJX75nYndmsDUeVIMJ5SHpoMe6+beUhkMQ4DFv
 +tpJ3LYqZq7Z9tkViuF+cWo4QAyrfZzjm9gKMtDZx+EnUVbkkkB+a+BaZYkCe0VUP8a+
 +r+Q==
X-Gm-Message-State: AOAM531D5TwL463QyzO0F79Le1t7dxjuCRxDegNzuq5RVnkRtB8/ZOyk
 FPb3Djjm+P6oDk2iIUr4rvXpOO7pKVR3cQ==
X-Google-Smtp-Source: ABdhPJzab6JPv2ZPjM3k0EnLAJwZmv39tDc+ZsdkZLc7vEJZUb5lNkEMk0IMBlcOJdgLwRKDQHqfjA==
X-Received: by 2002:a05:6a00:10c2:b029:2de:7333:1343 with SMTP id
 d2-20020a056a0010c2b02902de73331343mr1381577pfu.42.1622756508387; 
 Thu, 03 Jun 2021 14:41:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/29] softfloat: Convert floatx80 compare to FloatParts
Date: Thu,  3 Jun 2021 14:41:26 -0700
Message-Id: <20210603214131.629841-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 82 +++++++++++++------------------------------------
 1 file changed, 22 insertions(+), 60 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 770badd447..c32b1c7113 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3862,6 +3862,28 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
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
@@ -5696,66 +5718,6 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
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


