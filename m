Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DC457311
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:34:27 +0100 (CET)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6qI-0001s8-Aa
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:34:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oy-0006jq-UM
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:12 -0500
Received: from [2a00:1450:4864:20::432] (port=37450
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Ow-0004Ub-Pw
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:12 -0500
Received: by mail-wr1-x432.google.com with SMTP id b12so18965966wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sweQ4BDR3k99ik596XHBGoHw6k1qdFiMXzqKL7htKfk=;
 b=ZR3mlp1GexIJeHznNLQNHG3iA04cMZeo1k9D4B3m0K0AyNuNajWC2d4B4D2QqQlK7s
 JbrzS7qET35L2/B+P7SEkr8XV8pbkOnWnBV6WhVQUOdPOY8+vpM5vxYo/tPD60BtbIIE
 1lOnMOW/2R8ZFi+wzOe34sLdH6ooxyMcu+v3SU41zXGiaJOVDUA0TfEm6XFaiqeJsHr7
 8D+nTisnH9PEQI03vZED+kIGmqE8XDgjzYaO+XAkQgiAtsSOLOXJ4VDnl01OLym49oZU
 cUT4rob4PnH8s1IX5RtulGdXEHumTecLOR5zx5/okx/QQYPavrE6cyskw5NaVUUd2/S5
 2PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sweQ4BDR3k99ik596XHBGoHw6k1qdFiMXzqKL7htKfk=;
 b=OPQL/7BnclbpsPqph5qsNuYnHdBnmXfK/mUKyhTK5xpfYNnDGGZxRx3+diO6wauHFI
 LAG5JUuM0HM7xNkwWyYEGYTkyqhDBGwHt1LHtBmj/uhRgpCZbqKKFf/rpBJX4bqUdIdg
 0llx7jka+BjFwhojuTeFEdyk1LSgqkG7k9HufLz0rQcze6EfE3dKZ3gVaLAZViv7sRkV
 S5FRrIAZjsFU99dhpGTFPA7ERW3i2M53FoMhWypFO4Y7JRdRrjN2pw3xMMK9pHLyJEyT
 p5nolfYUWQeGc5kwhQj30UkerxhtxJdl/FJC76xVonFC44WhS+mbbDMGgEhLOsXWccAP
 6Y3g==
X-Gm-Message-State: AOAM533RdLh5HtICr37GhN9xEBb3UXBynT6+KSxX8/AOk2dmyRRYLmJb
 I+riKSgFwexI5StZWRtEvEJXWB7G3qXkMNrEsxU=
X-Google-Smtp-Source: ABdhPJwGcB42dPrF9+QF246b47tU/BNRC5EvGbTIc46vA1Zc/kLFqMYjSb0QE7ZK6oz7a4MHByOWGg==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr8456896wrs.46.1637337969340; 
 Fri, 19 Nov 2021 08:06:09 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/35] softfloat: Add float64r32 arithmetic routines
Date: Fri, 19 Nov 2021 17:04:54 +0100
Message-Id: <20211119160502.17432-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

These variants take a float64 as input, compute the result to
infinite precision (as we do with FloatParts), round the result
to the precision and dynamic range of float32, and then return
the result in the format of float64.

This is the operation PowerPC requires for its float32 operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h |  12 +++++
 fpu/softfloat.c         | 110 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 0d3b407807..d34b2c44d2 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -908,6 +908,18 @@ static inline bool float64_unordered_quiet(float64 a, float64 b,
 *----------------------------------------------------------------------------*/
 float64 float64_default_nan(float_status *status);
 
+/*----------------------------------------------------------------------------
+| Software IEC/IEEE double-precision operations, rounding to single precision,
+| returning a result in double precision, with only one rounding step.
+*----------------------------------------------------------------------------*/
+
+float64 float64r32_add(float64, float64, float_status *status);
+float64 float64r32_sub(float64, float64, float_status *status);
+float64 float64r32_mul(float64, float64, float_status *status);
+float64 float64r32_div(float64, float64, float_status *status);
+float64 float64r32_muladd(float64, float64, float64, int, float_status *status);
+float64 float64r32_sqrt(float64, float_status *status);
+
 /*----------------------------------------------------------------------------
 | Software IEC/IEEE extended double-precision conversion routines.
 *----------------------------------------------------------------------------*/
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 834ed3a054..7f524d4377 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1693,6 +1693,50 @@ static float64 float64_round_pack_canonical(FloatParts64 *p,
     return float64_pack_raw(p);
 }
 
+static float64 float64r32_round_pack_canonical(FloatParts64 *p,
+                                               float_status *s)
+{
+    parts_uncanon(p, s, &float32_params);
+
+    /*
+     * In parts_uncanon, we placed the fraction for float32 at the lsb.
+     * We need to adjust the fraction higher so that the least N bits are
+     * zero, and the fraction is adjacent to the float64 implicit bit.
+     */
+    switch (p->cls) {
+    case float_class_normal:
+        if (unlikely(p->exp == 0)) {
+            /*
+             * The result is denormal for float32, but can be represented
+             * in normalized form for float64.  Adjust, per canonicalize.
+             */
+            int shift = frac_normalize(p);
+            p->exp = (float32_params.frac_shift -
+                      float32_params.exp_bias - shift + 1 +
+                      float64_params.exp_bias);
+            frac_shr(p, float64_params.frac_shift);
+        } else {
+            frac_shl(p, float32_params.frac_shift - float64_params.frac_shift);
+            p->exp += float64_params.exp_bias - float32_params.exp_bias;
+        }
+        break;
+    case float_class_snan:
+    case float_class_qnan:
+        frac_shl(p, float32_params.frac_shift - float64_params.frac_shift);
+        p->exp = float64_params.exp_max;
+        break;
+    case float_class_inf:
+        p->exp = float64_params.exp_max;
+        break;
+    case float_class_zero:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return float64_pack_raw(p);
+}
+
 static void float128_unpack_canonical(FloatParts128 *p, float128 f,
                                       float_status *s)
 {
@@ -1938,6 +1982,28 @@ float64_sub(float64 a, float64 b, float_status *s)
     return float64_addsub(a, b, s, hard_f64_sub, soft_f64_sub);
 }
 
+static float64 float64r32_addsub(float64 a, float64 b, float_status *status,
+                                 bool subtract)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_addsub(&pa, &pb, status, subtract);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
+float64 float64r32_add(float64 a, float64 b, float_status *status)
+{
+    return float64r32_addsub(a, b, status, false);
+}
+
+float64 float64r32_sub(float64 a, float64 b, float_status *status)
+{
+    return float64r32_addsub(a, b, status, true);
+}
+
 static bfloat16 QEMU_FLATTEN
 bfloat16_addsub(bfloat16 a, bfloat16 b, float_status *status, bool subtract)
 {
@@ -2069,6 +2135,17 @@ float64_mul(float64 a, float64 b, float_status *s)
                         f64_is_zon2, f64_addsubmul_post);
 }
 
+float64 float64r32_mul(float64 a, float64 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_mul(&pa, &pb, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN
 bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
@@ -2296,6 +2373,19 @@ float64_muladd(float64 xa, float64 xb, float64 xc, int flags, float_status *s)
     return soft_f64_muladd(ua.s, ub.s, uc.s, flags, s);
 }
 
+float64 float64r32_muladd(float64 a, float64 b, float64 c,
+                          int flags, float_status *status)
+{
+    FloatParts64 pa, pb, pc, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    float64_unpack_canonical(&pc, c, status);
+    pr = parts_muladd(&pa, &pb, &pc, flags, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
                                       int flags, float_status *status)
 {
@@ -2419,6 +2509,17 @@ float64_div(float64 a, float64 b, float_status *s)
                         f64_div_pre, f64_div_post);
 }
 
+float64 float64r32_div(float64 a, float64 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_div(&pa, &pb, status);
+
+    return float64r32_round_pack_canonical(pr, status);
+}
+
 bfloat16 QEMU_FLATTEN
 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
@@ -4285,6 +4386,15 @@ float64 QEMU_FLATTEN float64_sqrt(float64 xa, float_status *s)
     return soft_f64_sqrt(ua.s, s);
 }
 
+float64 float64r32_sqrt(float64 a, float_status *status)
+{
+    FloatParts64 p;
+
+    float64_unpack_canonical(&p, a, status);
+    parts_sqrt(&p, status, &float64_params);
+    return float64r32_round_pack_canonical(&p, status);
+}
+
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
     FloatParts64 p;
-- 
2.25.1


