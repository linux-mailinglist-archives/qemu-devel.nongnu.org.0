Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC840376ECD
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:32:39 +0200 (CEST)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfClj-0000Ea-0s
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC86-0003Bl-Pu
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC82-0005UC-V7
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i190so9084664pfc.12
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eMIJGqBzed5Gqno92wb2fBBiT03MKVRcpl3Hpjjr9sA=;
 b=WB2XNQ1yGN4oLJb3r3tnLj+wjaa/nwWP8mPVhL+0H2oONQ722gMg4ATft46RjusWdl
 A34AN/izQw1MtDrY4oeITQLY56A1Zgw8XeIb8BcSoGIWxCry7pJQO+QnrOfz9TfOP57L
 CqpNwpo6u+MkELA2Mk4iwvv3jRMcn05OTjIYuPpa6Y8g5EvjkuQQQxyNfsHddsHQozwA
 GCvH1D02moeuVnWt5l8ew0shbMwh4JN8fCK7Qf6VZSPqNJsBKI5xnWKYprf7yUkUHM/9
 W3WU/KcfQAPB8l7qx0JJoZo9rgsF1FF/dcm5zDR44nLcPw2MfjVUHt0zEbUmHorV30RC
 Gb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eMIJGqBzed5Gqno92wb2fBBiT03MKVRcpl3Hpjjr9sA=;
 b=QPXYZsbRLyjkAAKkPb0FOaV+OXx1ON0h1etmF2AtXGWYA2DHqlJ3DuJHbsLLwwO5J6
 FKNSH2xi9Wg3OPiJviocgS1Hk0agVdVHeuxUkotwJkfMuO2nuc9QdyPEnyiC5wGf+Esf
 12zSUJQF84T/V5hhPUAkRFP4a9Vt8BOQ5Na3dl5upPL76jS/Cisf5/vRZW1q184OFhKz
 2DiqY4ZCvmIETbn/LjeMwQ+Dj4chl1tpPqJi7neeVIap80atVR4caXcOA4u9U8xFf6sY
 9wy13MUEFT2sX6v+aZfb3c/N3A0kN08EeVzifLK4M//X4130YtOGxSYr7U0kMyLVi7PQ
 9V1A==
X-Gm-Message-State: AOAM533i04Jay2J1sriMuWI0IBL7R5Dh/6WsZ/2czPTkGPMm3wo7UaHC
 OCRVfZRRr/Jbm87FaAWYb7SylAhtQD1uIg==
X-Google-Smtp-Source: ABdhPJwxWMW7kM/Gvg8ugzCZBSE1BsooiXy6Hpl3/xPpxSREUQhrf8MutnZpnka+56nzOQuwu/Zaag==
X-Received: by 2002:aa7:87d9:0:b029:28e:af66:d71d with SMTP id
 i25-20020aa787d90000b029028eaf66d71dmr13658492pfo.28.1620438697557; 
 Fri, 07 May 2021 18:51:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 52/72] softfloat: Move scalbn_decomposed to
 softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:42 -0700
Message-Id: <20210508014802.892561-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Rename to parts$N_scalbn.
Reimplement float128_scalbn with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 103 +++++++++++++-------------------------
 fpu/softfloat-parts.c.inc |  21 ++++++++
 2 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 2faceadf8b..f83ca20000 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -889,6 +889,12 @@ static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
 #define parts_compare(A, B, S, Q) \
     PARTS_GENERIC_64_128(compare, A)(A, B, S, Q)
 
+static void parts64_scalbn(FloatParts64 *a, int n, float_status *s);
+static void parts128_scalbn(FloatParts128 *a, int n, float_status *s);
+
+#define parts_scalbn(A, N, S) \
+    PARTS_GENERIC_64_128(scalbn, A)(A, N, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3531,58 +3537,53 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
     return float128_do_compare(a, b, s, true);
 }
 
-/* Multiply A by 2 raised to the power N.  */
-static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
-{
-    if (unlikely(is_nan(a.cls))) {
-        parts_return_nan(&a, s);
-    }
-    if (a.cls == float_class_normal) {
-        /* The largest float type (even though not supported by FloatParts64)
-         * is float128, which has a 15 bit exponent.  Bounding N to 16 bits
-         * still allows rounding to infinity, without allowing overflow
-         * within the int32_t that backs FloatParts64.exp.
-         */
-        n = MIN(MAX(n, -0x10000), 0x10000);
-        a.exp += n;
-    }
-    return a;
-}
+/*
+ * Scale by 2**N
+ */
 
 float16 float16_scalbn(float16 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float16_round_pack_canonical(&pr, status);
+    float16_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float16_round_pack_canonical(&p, status);
 }
 
 float32 float32_scalbn(float32 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float32_round_pack_canonical(&pr, status);
+    float32_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float32_round_pack_canonical(&p, status);
 }
 
 float64 float64_scalbn(float64 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float64_round_pack_canonical(&pr, status);
+    float64_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float64_round_pack_canonical(&p, status);
 }
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return bfloat16_round_pack_canonical(&pr, status);
+    bfloat16_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return bfloat16_round_pack_canonical(&p, status);
+}
+
+float128 float128_scalbn(float128 a, int n, float_status *status)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float128_round_pack_canonical(&p, status);
 }
 
 /*
@@ -6640,42 +6641,6 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
                                          aSign, aExp, aSig, 0, status);
 }
 
-float128 float128_scalbn(float128 a, int n, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            return propagateFloat128NaN(a, a, status);
-        }
-        return a;
-    }
-    if (aExp != 0) {
-        aSig0 |= UINT64_C(0x0001000000000000);
-    } else if (aSig0 == 0 && aSig1 == 0) {
-        return a;
-    } else {
-        aExp++;
-    }
-
-    if (n > 0x10000) {
-        n = 0x10000;
-    } else if (n < -0x10000) {
-        n = -0x10000;
-    }
-
-    aExp += n - 1;
-    return normalizeRoundAndPackFloat128( aSign, aExp, aSig0, aSig1
-                                         , status);
-
-}
-
 static void __attribute__((constructor)) softfloat_init(void)
 {
     union_float64 ua, ub, uc, ur;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 4e11aa8b3b..9749c11a6b 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1062,3 +1062,24 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
  b_sign:
     return b->sign ? float_relation_greater : float_relation_less;
 }
+
+/*
+ * Multiply A by 2 raised to the power N.
+ */
+static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
+{
+    switch (a->cls) {
+    case float_class_snan:
+    case float_class_qnan:
+        parts_return_nan(a, s);
+        break;
+    case float_class_zero:
+    case float_class_inf:
+        break;
+    case float_class_normal:
+        a->exp += MIN(MAX(n, -0x10000), 0x10000);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


