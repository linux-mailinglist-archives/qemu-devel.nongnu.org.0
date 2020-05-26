Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7061D59B4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 21:10:41 +0200 (CEST)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZfjE-0005rn-4e
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 15:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZfaz-0001nK-QE
 for qemu-devel@nongnu.org; Fri, 15 May 2020 15:02:09 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:50621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZfay-0001q2-Cf
 for qemu-devel@nongnu.org; Fri, 15 May 2020 15:02:09 -0400
Received: by mail-pj1-x1041.google.com with SMTP id t9so1315398pjw.0
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqPX34Y2xYCeaTCM4tOC/EtcK+8f3Xuhtp9sJmjWnMU=;
 b=jb5ku57gR8/Yjp+yY8uLApUIyGNzX95m8V58Ohakr3lGKSQRNNNbQp8rJfbVDsQWo/
 RQYL1YNu5Skymruqzql+oNooX18kGtp3CEyQsl1/K28n5CRMz/gDk3rVoG7wK/LLp34K
 C3CZprmJlCCr5z9pXNF4x2SVbe+qq2QH3Qa2KLMHlqU5bOrHsQRtp5CAyLvn/L7uJyMW
 QSX0W2p19ysb+TaVLWRmCJj8I4YgClq5QcwmOosFTSS2iZRUpzRJUAO9sbEzZtxJd1Wy
 RXp52+1F638U08CP+kKRdVh1kqSPwyPM3MckZH5YicXT+bzs44HqKQlttm7zsl37I3tc
 uuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqPX34Y2xYCeaTCM4tOC/EtcK+8f3Xuhtp9sJmjWnMU=;
 b=iEfCowuP178c/0Yaq7LILrcu1GC217AKMcy81OzxdTjbu4VJy2NKX8Fcei5jZh9bZp
 +WAI0bB2OWiqNf2tUSbFfuC5YdPhTKGphsWq1uMmEOfMmIgQIx4dDlER5pACWaMsyXfu
 kpXBaIqZe7eIJP6qz1w4ofkw5Z51CTNQAOVFtvyilubqM/B3iyrRioyMns4tva4NNl64
 OC+MsaKBeBRunoEtQWuqvmoC1Jk0Rr/Quo86I+f++K3ctQyLyY9/BduJUvuuksS/65BE
 mmu/HSvIIE16jFfWUNZ52P7gAwI516Rv7uT8yIpFUC7HhBppolCKcc+knoAbj/A8ctNl
 q8Ew==
X-Gm-Message-State: AOAM532y1TTzjeS1/oYhxbKUiRUqO3GoSd8vPf9O/vB4tq1F2pAzuzKG
 v0y0R5tKU6hf267EldAR9uX+D8voiO4=
X-Google-Smtp-Source: ABdhPJzQaTGEfJYiDSIybFfDwEr4xu88+wATxL1/RbRY77axge3Z09F6O99+FQbltof22RKfts1WTQ==
X-Received: by 2002:a17:902:8b88:: with SMTP id
 ay8mr4933419plb.235.1589569326087; 
 Fri, 15 May 2020 12:02:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q21sm2485719pfg.131.2020.05.15.12.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 12:02:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] softfloat: Inline float128 compare specializations
Date: Fri, 15 May 2020 12:01:51 -0700
Message-Id: <20200515190153.6017-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515190153.6017-1-richard.henderson@linaro.org>
References: <20200515190153.6017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the float128 compare specializations with inline functions
that call the standard float128_compare{,_quiet} functions.
Use bool as the return type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h |  49 +++++++--
 fpu/softfloat.c         | 238 ----------------------------------------
 2 files changed, 41 insertions(+), 246 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 281f0fd971..cfb3cda46b 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -901,14 +901,6 @@ float128 float128_mul(float128, float128, float_status *status);
 float128 float128_div(float128, float128, float_status *status);
 float128 float128_rem(float128, float128, float_status *status);
 float128 float128_sqrt(float128, float_status *status);
-int float128_eq(float128, float128, float_status *status);
-int float128_le(float128, float128, float_status *status);
-int float128_lt(float128, float128, float_status *status);
-int float128_unordered(float128, float128, float_status *status);
-int float128_eq_quiet(float128, float128, float_status *status);
-int float128_le_quiet(float128, float128, float_status *status);
-int float128_lt_quiet(float128, float128, float_status *status);
-int float128_unordered_quiet(float128, float128, float_status *status);
 FloatRelation float128_compare(float128, float128, float_status *status);
 FloatRelation float128_compare_quiet(float128, float128, float_status *status);
 int float128_is_quiet_nan(float128, float_status *status);
@@ -964,6 +956,47 @@ static inline int float128_is_any_nan(float128 a)
         ((a.low != 0) || ((a.high & 0xffffffffffffLL) != 0));
 }
 
+static inline bool float128_eq(float128 a, float128 b, float_status *s)
+{
+    return float128_compare(a, b, s) == float_relation_equal;
+}
+
+static inline bool float128_le(float128 a, float128 b, float_status *s)
+{
+    return float128_compare(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float128_lt(float128 a, float128 b, float_status *s)
+{
+    return float128_compare(a, b, s) < float_relation_equal;
+}
+
+static inline bool float128_unordered(float128 a, float128 b, float_status *s)
+{
+    return float128_compare(a, b, s) == float_relation_unordered;
+}
+
+static inline bool float128_eq_quiet(float128 a, float128 b, float_status *s)
+{
+    return float128_compare_quiet(a, b, s) == float_relation_equal;
+}
+
+static inline bool float128_le_quiet(float128 a, float128 b, float_status *s)
+{
+    return float128_compare_quiet(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float128_lt_quiet(float128 a, float128 b, float_status *s)
+{
+    return float128_compare_quiet(a, b, s) < float_relation_equal;
+}
+
+static inline bool float128_unordered_quiet(float128 a, float128 b,
+                                           float_status *s)
+{
+    return float128_compare_quiet(a, b, s) == float_relation_unordered;
+}
+
 #define float128_zero make_float128(0, 0)
 
 /*----------------------------------------------------------------------------
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5d7fc2c17a..4567dda112 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -7218,244 +7218,6 @@ float128 float128_sqrt(float128 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is equal to
-| the corresponding value `b', and 0 otherwise.  The invalid exception is
-| raised if either operand is a NaN.  Otherwise, the comparison is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_eq(float128 a, float128 b, float_status *status)
-{
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        float_raise(float_flag_invalid, status);
-        return 0;
-    }
-    return
-           ( a.low == b.low )
-        && (    ( a.high == b.high )
-             || (    ( a.low == 0 )
-                  && ( (uint64_t) ( ( a.high | b.high )<<1 ) == 0 ) )
-           );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is less than
-| or equal to the corresponding value `b', and 0 otherwise.  The invalid
-| exception is raised if either operand is a NaN.  The comparison is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_le(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        float_raise(float_flag_invalid, status);
-        return 0;
-    }
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign != bSign ) {
-        return
-               aSign
-            || (    ( ( (uint64_t) ( ( a.high | b.high )<<1 ) ) | a.low | b.low )
-                 == 0 );
-    }
-    return
-          aSign ? le128( b.high, b.low, a.high, a.low )
-        : le128( a.high, a.low, b.high, b.low );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is less than
-| the corresponding value `b', and 0 otherwise.  The invalid exception is
-| raised if either operand is a NaN.  The comparison is performed according
-| to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_lt(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        float_raise(float_flag_invalid, status);
-        return 0;
-    }
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign != bSign ) {
-        return
-               aSign
-            && (    ( ( (uint64_t) ( ( a.high | b.high )<<1 ) ) | a.low | b.low )
-                 != 0 );
-    }
-    return
-          aSign ? lt128( b.high, b.low, a.high, a.low )
-        : lt128( a.high, a.low, b.high, b.low );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point values `a' and `b' cannot
-| be compared, and 0 otherwise.  The invalid exception is raised if either
-| operand is a NaN. The comparison is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_unordered(float128 a, float128 b, float_status *status)
-{
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        float_raise(float_flag_invalid, status);
-        return 1;
-    }
-    return 0;
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is equal to
-| the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
-| exception.  The comparison is performed according to the IEC/IEEE Standard
-| for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_eq_quiet(float128 a, float128 b, float_status *status)
-{
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        if (float128_is_signaling_nan(a, status)
-         || float128_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return 0;
-    }
-    return
-           ( a.low == b.low )
-        && (    ( a.high == b.high )
-             || (    ( a.low == 0 )
-                  && ( (uint64_t) ( ( a.high | b.high )<<1 ) == 0 ) )
-           );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is less than
-| or equal to the corresponding value `b', and 0 otherwise.  Quiet NaNs do not
-| cause an exception.  Otherwise, the comparison is performed according to the
-| IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_le_quiet(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        if (float128_is_signaling_nan(a, status)
-         || float128_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return 0;
-    }
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign != bSign ) {
-        return
-               aSign
-            || (    ( ( (uint64_t) ( ( a.high | b.high )<<1 ) ) | a.low | b.low )
-                 == 0 );
-    }
-    return
-          aSign ? le128( b.high, b.low, a.high, a.low )
-        : le128( a.high, a.low, b.high, b.low );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point value `a' is less than
-| the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
-| exception.  Otherwise, the comparison is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_lt_quiet(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        if (float128_is_signaling_nan(a, status)
-         || float128_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return 0;
-    }
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign != bSign ) {
-        return
-               aSign
-            && (    ( ( (uint64_t) ( ( a.high | b.high )<<1 ) ) | a.low | b.low )
-                 != 0 );
-    }
-    return
-          aSign ? lt128( b.high, b.low, a.high, a.low )
-        : lt128( a.high, a.low, b.high, b.low );
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns 1 if the quadruple-precision floating-point values `a' and `b' cannot
-| be compared, and 0 otherwise.  Quiet NaNs do not cause an exception.  The
-| comparison is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-int float128_unordered_quiet(float128 a, float128 b, float_status *status)
-{
-    if (    (    ( extractFloat128Exp( a ) == 0x7FFF )
-              && ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) )
-         || (    ( extractFloat128Exp( b ) == 0x7FFF )
-              && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
-       ) {
-        if (float128_is_signaling_nan(a, status)
-         || float128_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return 1;
-    }
-    return 0;
-}
-
 static inline FloatRelation
 floatx80_compare_internal(floatx80 a, floatx80 b, bool is_quiet,
                           float_status *status)
-- 
2.20.1


