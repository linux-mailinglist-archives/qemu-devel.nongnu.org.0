Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFB31E35C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:02:52 +0100 (CET)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWmR-0000iM-LQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRR-0000S7-Lj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRO-0004hW-0k
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gx20so272058pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxrWuJHCJz8lKt8K8c9u+iIMVOHEkTdiNJKvhZZoVh8=;
 b=c1DoOhDjfTeqCq96VavqLEEOOGVoczNwvq4IPFDebMbf2BQyap5oef1SV7T9QpvlUX
 eqkNr9V2+qFbaoTbX6CuWksaKlAFUgI7Ue0zzXVn2SJJpOKp/PGt1aHHz2uWROsMbrsj
 NtrVcynMVOeIX/RqJ60wJn7fCZfNPi/E6x94JVn+XarKJAPLNhl0Z0OlK4rpvMDqrjLr
 sTHMgIe1+DBIS5m9PCtDQubrNp8vB4PZvT48IqXDZUqe63dnNrq6EE6HMHaTBiYKQSpo
 f/MZlBISwws26bM5/+6SFFsvC02xu9zNuVpquiRqAw5r5Mip3LunLMQpaNtWpoyRsh0C
 x2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxrWuJHCJz8lKt8K8c9u+iIMVOHEkTdiNJKvhZZoVh8=;
 b=aCo/pih9VONs6VtcjXJQ74qR4ewafKJ5sfMYUzBusr2xnKhlx7vkzv/tuNt3d3tR63
 +Jbhm9sm1KB1FW2utrOFTVqFEmphTLFEK234ATDuPsS+adin/etHQ79yiBzB/AtEtKLc
 0npu4MOWoLa6Zrn+ic1uH64cS8Ad4KyuQ3238wSB3p8r9SizQE8Cp6TzptYI5XRi7f8Z
 iMt4siDV/vy6K7kWa3P1OrhekTbnMij9l5WYcoys3mcb7AFdEB1pwIYjDDBHNrnWSQOx
 F1qURGCb771RYGmofBToNLqaydvUARqat+WPYJhqr2tjlVmWKzp0LmaQ5IyCrA7Hap3U
 vOWw==
X-Gm-Message-State: AOAM532kyKgin8nW1EPNF1auX4gp3P2n9+70D7/nmxzoAhoaeqa354G+
 SHto9sD4BB7O/546bfLZZhIXr48MeKgbNA==
X-Google-Smtp-Source: ABdhPJx8iVqWVSl/w+sgfra2Y8ldpW9/rtLuGQ9k35sZjnO5iWFB8usqN60vH3rXtWIAmxvHuW37oQ==
X-Received: by 2002:a17:902:8483:b029:dc:3e69:4095 with SMTP id
 c3-20020a1709028483b02900dc3e694095mr1283258plo.66.1613605264463; 
 Wed, 17 Feb 2021 15:41:04 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/35] Hexagon (target/hexagon/fma_emu.[ch]) utility functions
Date: Wed, 17 Feb 2021 15:40:06 -0800
Message-Id: <20210217234023.1742406-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/fma_emu.h |  36 ++
 target/hexagon/fma_emu.c | 702 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 738 insertions(+)
 create mode 100644 target/hexagon/fma_emu.h
 create mode 100644 target/hexagon/fma_emu.c

diff --git a/target/hexagon/fma_emu.h b/target/hexagon/fma_emu.h
new file mode 100644
index 0000000000..e3b99a8cf4
--- /dev/null
+++ b/target/hexagon/fma_emu.h
@@ -0,0 +1,36 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_FMA_EMU_H
+#define HEXAGON_FMA_EMU_H
+
+static inline bool is_finite(float64 x)
+{
+    return !float64_is_any_nan(x) && !float64_is_infinity(x);
+}
+
+int32_t float64_getexp(float64 f64);
+int32_t float32_getexp(float32 f32);
+float32 infinite_float32(uint8_t sign);
+float32 internal_fmafx(float32 a, float32 b, float32 c,
+                       int scale, float_status *fp_status);
+float32 internal_mpyf(float32 a, float32 b, float_status *fp_status);
+float64 internal_mpyhh(float64 a, float64 b,
+                       unsigned long long int accumulated,
+                       float_status *fp_status);
+
+#endif
diff --git a/target/hexagon/fma_emu.c b/target/hexagon/fma_emu.c
new file mode 100644
index 0000000000..842d903710
--- /dev/null
+++ b/target/hexagon/fma_emu.c
@@ -0,0 +1,702 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/int128.h"
+#include "fpu/softfloat.h"
+#include "macros.h"
+#include "conv_emu.h"
+#include "fma_emu.h"
+
+#define DF_INF_EXP     0x7ff
+#define DF_BIAS        1023
+#define DF_MANTBITS    52
+#define DF_NAN         0xffffffffffffffffULL
+#define DF_INF         0x7ff0000000000000ULL
+#define DF_MINUS_INF   0xfff0000000000000ULL
+#define DF_MAXF        0x7fefffffffffffffULL
+#define DF_MINUS_MAXF  0xffefffffffffffffULL
+
+#define SF_INF_EXP     0xff
+#define SF_BIAS        127
+#define SF_MANTBITS    23
+#define SF_INF         0x7f800000
+#define SF_MINUS_INF   0xff800000
+#define SF_MAXF        0x7f7fffff
+#define SF_MINUS_MAXF  0xff7fffff
+
+#define HF_INF_EXP 0x1f
+#define HF_BIAS 15
+
+#define WAY_BIG_EXP 4096
+
+typedef union {
+    double f;
+    uint64_t i;
+    struct {
+        uint64_t mant:52;
+        uint64_t exp:11;
+        uint64_t sign:1;
+    };
+} Double;
+
+typedef union {
+    float f;
+    uint32_t i;
+    struct {
+        uint32_t mant:23;
+        uint32_t exp:8;
+        uint32_t sign:1;
+    };
+} Float;
+
+static inline uint64_t float64_getmant(float64 f64)
+{
+    Double a = { .i = f64 };
+    if (float64_is_normal(f64)) {
+        return a.mant | 1ULL << 52;
+    }
+    if (float64_is_zero(f64)) {
+        return 0;
+    }
+    if (float64_is_denormal(f64)) {
+        return a.mant;
+    }
+    return ~0ULL;
+}
+
+int32_t float64_getexp(float64 f64)
+{
+    Double a = { .i = f64 };
+    if (float64_is_normal(f64)) {
+        return a.exp;
+    }
+    if (float64_is_denormal(f64)) {
+        return a.exp + 1;
+    }
+    return -1;
+}
+
+static inline uint64_t float32_getmant(float32 f32)
+{
+    Float a = { .i = f32 };
+    if (float32_is_normal(f32)) {
+        return a.mant | 1ULL << 23;
+    }
+    if (float32_is_zero(f32)) {
+        return 0;
+    }
+    if (float32_is_denormal(f32)) {
+        return a.mant;
+    }
+    return ~0ULL;
+}
+
+int32_t float32_getexp(float32 f32)
+{
+    Float a = { .i = f32 };
+    if (float32_is_normal(f32)) {
+        return a.exp;
+    }
+    if (float32_is_denormal(f32)) {
+        return a.exp + 1;
+    }
+    return -1;
+}
+
+static inline uint32_t int128_getw0(Int128 x)
+{
+    return int128_getlo(x);
+}
+
+static inline uint32_t int128_getw1(Int128 x)
+{
+    return int128_getlo(x) >> 32;
+}
+
+static inline Int128 int128_mul_6464(uint64_t ai, uint64_t bi)
+{
+    Int128 a, b;
+    uint64_t pp0, pp1a, pp1b, pp1s, pp2;
+
+    a = int128_make64(ai);
+    b = int128_make64(bi);
+    pp0 = (uint64_t)int128_getw0(a) * (uint64_t)int128_getw0(b);
+    pp1a = (uint64_t)int128_getw1(a) * (uint64_t)int128_getw0(b);
+    pp1b = (uint64_t)int128_getw1(b) * (uint64_t)int128_getw0(a);
+    pp2 = (uint64_t)int128_getw1(a) * (uint64_t)int128_getw1(b);
+
+    pp1s = pp1a + pp1b;
+    if ((pp1s < pp1a) || (pp1s < pp1b)) {
+        pp2 += (1ULL << 32);
+    }
+    uint64_t ret_low = pp0 + (pp1s << 32);
+    if ((ret_low < pp0) || (ret_low < (pp1s << 32))) {
+        pp2 += 1;
+    }
+
+    return int128_make128(ret_low, pp2 + (pp1s >> 32));
+}
+
+static inline Int128 int128_sub_borrow(Int128 a, Int128 b, int borrow)
+{
+    Int128 ret = int128_sub(a, b);
+    if (borrow != 0) {
+        ret = int128_sub(ret, int128_one());
+    }
+    return ret;
+}
+
+typedef struct {
+    Int128 mant;
+    int32_t exp;
+    uint8_t sign;
+    uint8_t guard;
+    uint8_t round;
+    uint8_t sticky;
+} Accum;
+
+static inline void accum_init(Accum *p)
+{
+    p->mant = int128_zero();
+    p->exp = 0;
+    p->sign = 0;
+    p->guard = 0;
+    p->round = 0;
+    p->sticky = 0;
+}
+
+static inline Accum accum_norm_left(Accum a)
+{
+    a.exp--;
+    a.mant = int128_lshift(a.mant, 1);
+    a.mant = int128_or(a.mant, int128_make64(a.guard));
+    a.guard = a.round;
+    a.round = a.sticky;
+    return a;
+}
+
+static inline Accum accum_norm_right(Accum a, int amt)
+{
+    if (amt > 130) {
+        a.sticky |=
+            a.round | a.guard | int128_nz(a.mant);
+        a.guard = a.round = 0;
+        a.mant = int128_zero();
+        a.exp += amt;
+        return a;
+
+    }
+    while (amt >= 64) {
+        a.sticky |= a.round | a.guard | (int128_getlo(a.mant) != 0);
+        a.guard = (int128_getlo(a.mant) >> 63) & 1;
+        a.round = (int128_getlo(a.mant) >> 62) & 1;
+        a.mant = int128_make64(int128_gethi(a.mant));
+        a.exp += 64;
+        amt -= 64;
+    }
+    while (amt > 0) {
+        a.exp++;
+        a.sticky |= a.round;
+        a.round = a.guard;
+        a.guard = int128_getlo(a.mant) & 1;
+        a.mant = int128_rshift(a.mant, 1);
+        amt--;
+    }
+    return a;
+}
+
+/*
+ * On the add/sub, we need to be able to shift out lots of bits, but need a
+ * sticky bit for what was shifted out, I think.
+ */
+static Accum accum_add(Accum a, Accum b);
+
+static inline Accum accum_sub(Accum a, Accum b, int negate)
+{
+    Accum ret;
+    accum_init(&ret);
+    int borrow;
+
+    if (a.sign != b.sign) {
+        b.sign = !b.sign;
+        return accum_add(a, b);
+    }
+    if (b.exp > a.exp) {
+        /* small - big == - (big - small) */
+        return accum_sub(b, a, !negate);
+    }
+    if ((b.exp == a.exp) && (int128_gt(b.mant, a.mant))) {
+        /* small - big == - (big - small) */
+        return accum_sub(b, a, !negate);
+    }
+
+    while (a.exp > b.exp) {
+        /* Try to normalize exponents: shrink a exponent and grow mantissa */
+        if (int128_gethi(a.mant) & (1ULL << 62)) {
+            /* Can't grow a any more */
+            break;
+        } else {
+            a = accum_norm_left(a);
+        }
+    }
+
+    while (a.exp > b.exp) {
+        /* Try to normalize exponents: grow b exponent and shrink mantissa */
+        /* Keep around shifted out bits... we might need those later */
+        b = accum_norm_right(b, a.exp - b.exp);
+    }
+
+    if ((int128_gt(b.mant, a.mant))) {
+        return accum_sub(b, a, !negate);
+    }
+
+    /* OK, now things should be normalized! */
+    ret.sign = a.sign;
+    ret.exp = a.exp;
+    assert(!int128_gt(b.mant, a.mant));
+    borrow = (b.round << 2) | (b.guard << 1) | b.sticky;
+    ret.mant = int128_sub_borrow(a.mant, b.mant, (borrow != 0));
+    borrow = 0 - borrow;
+    ret.guard = (borrow >> 2) & 1;
+    ret.round = (borrow >> 1) & 1;
+    ret.sticky = (borrow >> 0) & 1;
+    if (negate) {
+        ret.sign = !ret.sign;
+    }
+    return ret;
+}
+
+static Accum accum_add(Accum a, Accum b)
+{
+    Accum ret;
+    accum_init(&ret);
+    if (a.sign != b.sign) {
+        b.sign = !b.sign;
+        return accum_sub(a, b, 0);
+    }
+    if (b.exp > a.exp) {
+        /* small + big ==  (big + small) */
+        return accum_add(b, a);
+    }
+    if ((b.exp == a.exp) && int128_gt(b.mant, a.mant)) {
+        /* small + big ==  (big + small) */
+        return accum_add(b, a);
+    }
+
+    while (a.exp > b.exp) {
+        /* Try to normalize exponents: shrink a exponent and grow mantissa */
+        if (int128_gethi(a.mant) & (1ULL << 62)) {
+            /* Can't grow a any more */
+            break;
+        } else {
+            a = accum_norm_left(a);
+        }
+    }
+
+    while (a.exp > b.exp) {
+        /* Try to normalize exponents: grow b exponent and shrink mantissa */
+        /* Keep around shifted out bits... we might need those later */
+        b = accum_norm_right(b, a.exp - b.exp);
+    }
+
+    /* OK, now things should be normalized! */
+    if (int128_gt(b.mant, a.mant)) {
+        return accum_add(b, a);
+    };
+    ret.sign = a.sign;
+    ret.exp = a.exp;
+    assert(!int128_gt(b.mant, a.mant));
+    ret.mant = int128_add(a.mant, b.mant);
+    ret.guard = b.guard;
+    ret.round = b.round;
+    ret.sticky = b.sticky;
+    return ret;
+}
+
+/* Return an infinity with requested sign */
+static inline float64 infinite_float64(uint8_t sign)
+{
+    if (sign) {
+        return make_float64(DF_MINUS_INF);
+    } else {
+        return make_float64(DF_INF);
+    }
+}
+
+/* Return a maximum finite value with requested sign */
+static inline float64 maxfinite_float64(uint8_t sign)
+{
+    if (sign) {
+        return make_float64(DF_MINUS_MAXF);
+    } else {
+        return make_float64(DF_MAXF);
+    }
+}
+
+/* Return a zero value with requested sign */
+static inline float64 zero_float64(uint8_t sign)
+{
+    if (sign) {
+        return make_float64(0x8000000000000000);
+    } else {
+        return float64_zero;
+    }
+}
+
+/* Return an infinity with the requested sign */
+float32 infinite_float32(uint8_t sign)
+{
+    if (sign) {
+        return make_float32(SF_MINUS_INF);
+    } else {
+        return make_float32(SF_INF);
+    }
+}
+
+/* Return a maximum finite value with the requested sign */
+static inline float32 maxfinite_float32(uint8_t sign)
+{
+    if (sign) {
+        return make_float32(SF_MINUS_MAXF);
+    } else {
+        return make_float32(SF_MAXF);
+    }
+}
+
+/* Return a zero value with requested sign */
+static inline float32 zero_float32(uint8_t sign)
+{
+    if (sign) {
+        return make_float32(0x80000000);
+    } else {
+        return float32_zero;
+    }
+}
+
+#define GEN_XF_ROUND(SUFFIX, MANTBITS, INF_EXP, INTERNAL_TYPE) \
+static inline SUFFIX accum_round_##SUFFIX(Accum a, float_status * fp_status) \
+{ \
+    if ((int128_gethi(a.mant) == 0) && (int128_getlo(a.mant) == 0) \
+        && ((a.guard | a.round | a.sticky) == 0)) { \
+        /* result zero */ \
+        switch (fp_status->float_rounding_mode) { \
+        case float_round_down: \
+            return zero_##SUFFIX(1); \
+        default: \
+            return zero_##SUFFIX(0); \
+        } \
+    } \
+    /* Normalize right */ \
+    /* We want MANTBITS bits of mantissa plus the leading one. */ \
+    /* That means that we want MANTBITS+1 bits, or 0x000000000000FF_FFFF */ \
+    /* So we need to normalize right while the high word is non-zero and \
+    * while the low word is nonzero when masked with 0xffe0_0000_0000_0000 */ \
+    while ((int128_gethi(a.mant) != 0) || \
+           ((int128_getlo(a.mant) >> (MANTBITS + 1)) != 0)) { \
+        a = accum_norm_right(a, 1); \
+    } \
+    /* \
+     * OK, now normalize left \
+     * We want to normalize left until we have a leading one in bit 24 \
+     * Theoretically, we only need to shift a maximum of one to the left if we \
+     * shifted out lots of bits from B, or if we had no shift / 1 shift sticky \
+     * shoudl be 0  \
+     */ \
+    while ((int128_getlo(a.mant) & (1ULL << MANTBITS)) == 0) { \
+        a = accum_norm_left(a); \
+    } \
+    /* \
+     * OK, now we might need to denormalize because of potential underflow. \
+     * We need to do this before rounding, and rounding might make us normal \
+     * again \
+     */ \
+    while (a.exp <= 0) { \
+        a = accum_norm_right(a, 1 - a.exp); \
+        /* \
+         * Do we have underflow? \
+         * That's when we get an inexact answer because we ran out of bits \
+         * in a denormal. \
+         */ \
+        if (a.guard || a.round || a.sticky) { \
+            float_raise(float_flag_underflow, fp_status); \
+        } \
+    } \
+    /* OK, we're relatively canonical... now we need to round */ \
+    if (a.guard || a.round || a.sticky) { \
+        float_raise(float_flag_inexact, fp_status); \
+        switch (fp_status->float_rounding_mode) { \
+        case float_round_to_zero: \
+            /* Chop and we're done */ \
+            break; \
+        case float_round_up: \
+            if (a.sign == 0) { \
+                a.mant = int128_add(a.mant, int128_one()); \
+            } \
+            break; \
+        case float_round_down: \
+            if (a.sign != 0) { \
+                a.mant = int128_add(a.mant, int128_one()); \
+            } \
+            break; \
+        default: \
+            if (a.round || a.sticky) { \
+                /* round up if guard is 1, down if guard is zero */ \
+                a.mant = int128_add(a.mant, int128_make64(a.guard)); \
+            } else if (a.guard) { \
+                /* exactly .5, round up if odd */ \
+                a.mant = int128_add(a.mant, int128_and(a.mant, int128_one())); \
+            } \
+            break; \
+        } \
+    } \
+    /* \
+     * OK, now we might have carried all the way up. \
+     * So we might need to shr once \
+     * at least we know that the lsb should be zero if we rounded and \
+     * got a carry out... \
+     */ \
+    if ((int128_getlo(a.mant) >> (MANTBITS + 1)) != 0) { \
+        a = accum_norm_right(a, 1); \
+    } \
+    /* Overflow? */ \
+    if (a.exp >= INF_EXP) { \
+        /* Yep, inf result */ \
+        float_raise(float_flag_overflow, fp_status); \
+        float_raise(float_flag_inexact, fp_status); \
+        switch (fp_status->float_rounding_mode) { \
+        case float_round_to_zero: \
+            return maxfinite_##SUFFIX(a.sign); \
+        case float_round_up: \
+            if (a.sign == 0) { \
+                return infinite_##SUFFIX(a.sign); \
+            } else { \
+                return maxfinite_##SUFFIX(a.sign); \
+            } \
+        case float_round_down: \
+            if (a.sign != 0) { \
+                return infinite_##SUFFIX(a.sign); \
+            } else { \
+                return maxfinite_##SUFFIX(a.sign); \
+            } \
+        default: \
+            return infinite_##SUFFIX(a.sign); \
+        } \
+    } \
+    /* Underflow? */ \
+    if (int128_getlo(a.mant) & (1ULL << MANTBITS)) { \
+        /* Leading one means: No, we're normal. So, we should be done... */ \
+        INTERNAL_TYPE ret; \
+        ret.i = 0; \
+        ret.sign = a.sign; \
+        ret.exp = a.exp; \
+        ret.mant = int128_getlo(a.mant); \
+        return ret.i; \
+    } \
+    assert(a.exp == 1); \
+    INTERNAL_TYPE ret; \
+    ret.i = 0; \
+    ret.sign = a.sign; \
+    ret.exp = 0; \
+    ret.mant = int128_getlo(a.mant); \
+    return ret.i; \
+}
+
+GEN_XF_ROUND(float64, DF_MANTBITS, DF_INF_EXP, Double)
+GEN_XF_ROUND(float32, SF_MANTBITS, SF_INF_EXP, Float)
+
+static bool is_inf_prod(float64 a, float64 b)
+{
+    return ((float64_is_infinity(a) && float64_is_infinity(b)) ||
+            (float64_is_infinity(a) && is_finite(b) && (!float64_is_zero(b))) ||
+            (float64_is_infinity(b) && is_finite(a) && (!float64_is_zero(a))));
+}
+
+static inline float64 special_fma(float64 a, float64 b, float64 c,
+                                  float_status *fp_status)
+{
+    float64 ret = make_float64(0);
+
+    /*
+     * If A multiplied by B is an exact infinity and C is also an infinity
+     * but with the opposite sign, FMA returns NaN and raises invalid.
+     */
+    uint8_t a_sign = float64_is_neg(a);
+    uint8_t b_sign = float64_is_neg(b);
+    uint8_t c_sign = float64_is_neg(c);
+    if (is_inf_prod(a, b) && float64_is_infinity(c)) {
+        if ((a_sign ^ b_sign) != c_sign) {
+            ret = make_float64(DF_NAN);
+            float_raise(float_flag_invalid, fp_status);
+            return ret;
+        }
+    }
+    if ((float64_is_infinity(a) && float64_is_zero(b)) ||
+        (float64_is_zero(a) && float64_is_infinity(b))) {
+        ret = make_float64(DF_NAN);
+        float_raise(float_flag_invalid, fp_status);
+        return ret;
+    }
+    /*
+     * If none of the above checks are true and C is a NaN,
+     * a NaN shall be returned
+     * If A or B are NaN, a NAN shall be returned.
+     */
+    if (float64_is_any_nan(a) ||
+        float64_is_any_nan(b) ||
+        float64_is_any_nan(c)) {
+        if (float64_is_any_nan(a) && (fGETBIT(51, a) == 0)) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        if (float64_is_any_nan(b) && (fGETBIT(51, b) == 0)) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        if (float64_is_any_nan(c) && (fGETBIT(51, c) == 0)) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        ret = make_float64(DF_NAN);
+        return ret;
+    }
+    /*
+     * We have checked for adding opposite-signed infinities.
+     * Other infinities return infinity with the correct sign
+     */
+    if (float64_is_infinity(c)) {
+        ret = infinite_float64(c_sign);
+        return ret;
+    }
+    if (float64_is_infinity(a) || float64_is_infinity(b)) {
+        ret = infinite_float64(a_sign ^ b_sign);
+        return ret;
+    }
+    g_assert_not_reached();
+}
+
+static inline float32 special_fmaf(float32 a, float32 b, float32 c,
+                                 float_status *fp_status)
+{
+    float64 aa, bb, cc;
+    aa = float32_to_float64(a, fp_status);
+    bb = float32_to_float64(b, fp_status);
+    cc = float32_to_float64(c, fp_status);
+    return float64_to_float32(special_fma(aa, bb, cc, fp_status), fp_status);
+}
+
+float32 internal_fmafx(float32 a, float32 b, float32 c, int scale,
+                       float_status *fp_status)
+{
+    Accum prod;
+    Accum acc;
+    Accum result;
+    accum_init(&prod);
+    accum_init(&acc);
+    accum_init(&result);
+
+    uint8_t a_sign = float32_is_neg(a);
+    uint8_t b_sign = float32_is_neg(b);
+    uint8_t c_sign = float32_is_neg(c);
+    if (float32_is_infinity(a) ||
+        float32_is_infinity(b) ||
+        float32_is_infinity(c)) {
+        return special_fmaf(a, b, c, fp_status);
+    }
+    if (float32_is_any_nan(a) ||
+        float32_is_any_nan(b) ||
+        float32_is_any_nan(c)) {
+        return special_fmaf(a, b, c, fp_status);
+    }
+    if ((scale == 0) && (float32_is_zero(a) || float32_is_zero(b))) {
+        float32 tmp = float32_mul(a, b, fp_status);
+        tmp = float32_add(tmp, c, fp_status);
+        return tmp;
+    }
+
+    /* (a * 2**b) * (c * 2**d) == a*c * 2**(b+d) */
+    prod.mant = int128_mul_6464(float32_getmant(a), float32_getmant(b));
+
+    /*
+     * Note: extracting the mantissa into an int is multiplying by
+     * 2**23, so adjust here
+     */
+    prod.exp = float32_getexp(a) + float32_getexp(b) - SF_BIAS - 23;
+    prod.sign = a_sign ^ b_sign;
+    if (float32_is_zero(a) || float32_is_zero(b)) {
+        prod.exp = -2 * WAY_BIG_EXP;
+    }
+    if ((scale > 0) && float32_is_denormal(c)) {
+        acc.mant = int128_mul_6464(0, 0);
+        acc.exp = -WAY_BIG_EXP;
+        acc.sign = c_sign;
+        acc.sticky = 1;
+        result = accum_add(prod, acc);
+    } else if (!float32_is_zero(c)) {
+        acc.mant = int128_mul_6464(float32_getmant(c), 1);
+        acc.exp = float32_getexp(c);
+        acc.sign = c_sign;
+        result = accum_add(prod, acc);
+    } else {
+        result = prod;
+    }
+    result.exp += scale;
+    return accum_round_float32(result, fp_status);
+}
+
+float32 internal_mpyf(float32 a, float32 b, float_status *fp_status)
+{
+    if (float32_is_zero(a) || float32_is_zero(b)) {
+        return float32_mul(a, b, fp_status);
+    }
+    return internal_fmafx(a, b, float32_zero, 0, fp_status);
+}
+
+float64 internal_mpyhh(float64 a, float64 b,
+                      unsigned long long int accumulated,
+                      float_status *fp_status)
+{
+    Accum x;
+    unsigned long long int prod;
+    unsigned int sticky;
+    uint8_t a_sign, b_sign;
+
+    sticky = accumulated & 1;
+    accumulated >>= 1;
+    accum_init(&x);
+    if (float64_is_zero(a) ||
+        float64_is_any_nan(a) ||
+        float64_is_infinity(a)) {
+        return float64_mul(a, b, fp_status);
+    }
+    if (float64_is_zero(b) ||
+        float64_is_any_nan(b) ||
+        float64_is_infinity(b)) {
+        return float64_mul(a, b, fp_status);
+    }
+    x.mant = int128_mul_6464(accumulated, 1);
+    x.sticky = sticky;
+    prod = fGETUWORD(1, float64_getmant(a)) * fGETUWORD(1, float64_getmant(b));
+    x.mant = int128_add(x.mant, int128_mul_6464(prod, 0x100000000ULL));
+    x.exp = float64_getexp(a) + float64_getexp(b) - DF_BIAS - 20;
+    if (!float64_is_normal(a) || !float64_is_normal(b)) {
+        /* crush to inexact zero */
+        x.sticky = 1;
+        x.exp = -4096;
+    }
+    a_sign = float64_is_neg(a);
+    b_sign = float64_is_neg(b);
+    x.sign = a_sign ^ b_sign;
+    return accum_round_float64(x, fp_status);
+}
-- 
2.25.1


