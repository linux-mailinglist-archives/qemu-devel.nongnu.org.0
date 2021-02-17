Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010A31E357
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:59:32 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWjE-0005KO-0y
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRN-0000GZ-36
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:05 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRK-0004gN-9n
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:04 -0500
Received: by mail-pg1-x52a.google.com with SMTP id m2so9525523pgq.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djrIDKwpqXpESsxZegRWeJHdpQe7kKeeT84+hbZKTlI=;
 b=KJ1SuDCwjVyJohsvnZsXGAwKd0ehgpK0S20R6sQXqaXK85GFph6U38S8y/UW/+JUde
 sFf8qw7Od+FIzpE9GLeCXoibVnhluuKw8Vq7Yp6Q24R4fLPdL7vzmoUnKJUxHnhnOVzv
 49kL1wP3TPr7oAC9VsTn5pdvGVVZ3/itY8WJVhRS0yJgMT0CCEvBDBD8zkl2Lg8PArWK
 RriCpUeNeRAdq8jClt9l5N3R0D0I3aByBW7AJFlHZRQ+fon+eEcOOf/ZgkwwyLKLGjFc
 41d0FPN+hh0e99N89WJnFSCfMLp2/hK7mljgTsBhOPBG+xoPqilLmspIVs/Yx69WSsiH
 L2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djrIDKwpqXpESsxZegRWeJHdpQe7kKeeT84+hbZKTlI=;
 b=H1TthYcezrSk/M/XFFnmNBKFF5QxMltIKWjSxWrb96+5mUCU45Z8FSQO0hU9VF3hNu
 UEFES+aa+ZNx2MGAkI53zC+z6AtjPunTB+diQkwruWTWbpTqb2HNayjy7ChP8SFwBL+t
 3EG4xNRQOCi+MGVOBDAcHM2JmXesIpumNq2o7wubO+H7T1aguGA4Yg97zjpDQAu/H2cp
 LBBu4NUUy4DB90aeP7uQRBgCqYmbDqOZSYvYLZoHyJpuchxAEkEPFA6TtwpIrQ0qj9L9
 CZNFmRucdk8ECpEIAqYgThwdeiC9DhW4pwp7EaG0VzVWmz0pCuScfWXKJPJhQBgN8/EM
 KpHw==
X-Gm-Message-State: AOAM531btZVyxzb5M7WMmhYhkKDeFRhIQexd7IMPl2vIq6kY1gbIZFFO
 Nf6W5SKLX3xHwBZ2lLP4wIfnwZWPRIt9UA==
X-Google-Smtp-Source: ABdhPJwqSGunRWAP++yzw82/qZUGGzLC32//XiNG3At7mKvQqREfNHeC4HVq1CPufOxnIpKJmwKlPQ==
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr1542050pfk.73.1613605260670; 
 Wed, 17 Feb 2021 15:41:00 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/35] Hexagon (target/hexagon/arch.[ch]) utility functions
Date: Wed, 17 Feb 2021 15:40:04 -0800
Message-Id: <20210217234023.1742406-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-16-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/arch.h |  34 +++++
 target/hexagon/arch.c | 300 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 334 insertions(+)
 create mode 100644 target/hexagon/arch.h
 create mode 100644 target/hexagon/arch.c

diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
new file mode 100644
index 0000000000..1f7f03693a
--- /dev/null
+++ b/target/hexagon/arch.h
@@ -0,0 +1,34 @@
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
+#ifndef HEXAGON_ARCH_H
+#define HEXAGON_ARCH_H
+
+#include "qemu/int128.h"
+
+uint64_t interleave(uint32_t odd, uint32_t even);
+uint64_t deinterleave(uint64_t src);
+uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c);
+int32_t conv_round(int32_t a, int n);
+void arch_fpop_start(CPUHexagonState *env);
+void arch_fpop_end(CPUHexagonState *env);
+int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
+                         int *adjust, float_status *fp_status);
+int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
+                          float_status *fp_status);
+
+#endif
diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
new file mode 100644
index 0000000000..09de124818
--- /dev/null
+++ b/target/hexagon/arch.c
@@ -0,0 +1,300 @@
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
+#include "fpu/softfloat.h"
+#include "cpu.h"
+#include "fma_emu.h"
+#include "arch.h"
+#include "macros.h"
+
+#define SF_BIAS        127
+#define SF_MAXEXP      254
+#define SF_MANTBITS    23
+#define float32_nan    make_float32(0xffffffff)
+
+#define BITS_MASK_8 0x5555555555555555ULL
+#define PAIR_MASK_8 0x3333333333333333ULL
+#define NYBL_MASK_8 0x0f0f0f0f0f0f0f0fULL
+#define BYTE_MASK_8 0x00ff00ff00ff00ffULL
+#define HALF_MASK_8 0x0000ffff0000ffffULL
+#define WORD_MASK_8 0x00000000ffffffffULL
+
+uint64_t interleave(uint32_t odd, uint32_t even)
+{
+    /* Convert to long long */
+    uint64_t myodd = odd;
+    uint64_t myeven = even;
+    /* First, spread bits out */
+    myodd = (myodd | (myodd << 16)) & HALF_MASK_8;
+    myeven = (myeven | (myeven << 16)) & HALF_MASK_8;
+    myodd = (myodd | (myodd << 8)) & BYTE_MASK_8;
+    myeven = (myeven | (myeven << 8)) & BYTE_MASK_8;
+    myodd = (myodd | (myodd << 4)) & NYBL_MASK_8;
+    myeven = (myeven | (myeven << 4)) & NYBL_MASK_8;
+    myodd = (myodd | (myodd << 2)) & PAIR_MASK_8;
+    myeven = (myeven | (myeven << 2)) & PAIR_MASK_8;
+    myodd = (myodd | (myodd << 1)) & BITS_MASK_8;
+    myeven = (myeven | (myeven << 1)) & BITS_MASK_8;
+    /* Now OR together */
+    return myeven | (myodd << 1);
+}
+
+uint64_t deinterleave(uint64_t src)
+{
+    /* Get odd and even bits */
+    uint64_t myodd = ((src >> 1) & BITS_MASK_8);
+    uint64_t myeven = (src & BITS_MASK_8);
+
+    /* Unspread bits */
+    myeven = (myeven | (myeven >> 1)) & PAIR_MASK_8;
+    myodd = (myodd | (myodd >> 1)) & PAIR_MASK_8;
+    myeven = (myeven | (myeven >> 2)) & NYBL_MASK_8;
+    myodd = (myodd | (myodd >> 2)) & NYBL_MASK_8;
+    myeven = (myeven | (myeven >> 4)) & BYTE_MASK_8;
+    myodd = (myodd | (myodd >> 4)) & BYTE_MASK_8;
+    myeven = (myeven | (myeven >> 8)) & HALF_MASK_8;
+    myodd = (myodd | (myodd >> 8)) & HALF_MASK_8;
+    myeven = (myeven | (myeven >> 16)) & WORD_MASK_8;
+    myodd = (myodd | (myodd >> 16)) & WORD_MASK_8;
+
+    /* Return odd bits in upper half */
+    return myeven | (myodd << 32);
+}
+
+uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c)
+{
+    uint64_t tmpa, tmpb, tmpc;
+    tmpa = fGETUWORD(0, a);
+    tmpb = fGETUWORD(0, b);
+    tmpc = tmpa + tmpb + c;
+    tmpa = fGETUWORD(1, a);
+    tmpb = fGETUWORD(1, b);
+    tmpc = tmpa + tmpb + fGETUWORD(1, tmpc);
+    tmpc = fGETUWORD(1, tmpc);
+    return tmpc;
+}
+
+int32_t conv_round(int32_t a, int n)
+{
+    int64_t val;
+
+    if (n == 0) {
+        val = a;
+    } else if ((a & ((1 << (n - 1)) - 1)) == 0) {    /* N-1..0 all zero? */
+        /* Add LSB from int part */
+        val = ((fSE32_64(a)) + (int64_t) (((uint32_t) ((1 << n) & a)) >> 1));
+    } else {
+        val = ((fSE32_64(a)) + (1 << (n - 1)));
+    }
+
+    val = val >> n;
+    return (int32_t)val;
+}
+
+/* Floating Point Stuff */
+
+static const int softfloat_roundingmodes[] = {
+    float_round_nearest_even,
+    float_round_to_zero,
+    float_round_down,
+    float_round_up,
+};
+
+void arch_fpop_start(CPUHexagonState *env)
+{
+    set_float_exception_flags(0, &env->fp_status);
+    set_float_rounding_mode(
+        softfloat_roundingmodes[fREAD_REG_FIELD(USR, USR_FPRND)],
+        &env->fp_status);
+}
+
+#ifdef CONFIG_USER_ONLY
+/*
+ * Hexagon Linux kernel only sets the relevant bits in USR (user status
+ * register).  The exception isn't raised to user mode, so we don't
+ * model it in qemu user mode.
+ */
+#define RAISE_FP_EXCEPTION   do {} while (0)
+#endif
+
+#define SOFTFLOAT_TEST_FLAG(FLAG, MYF, MYE) \
+    do { \
+        if (flags & FLAG) { \
+            if (GET_USR_FIELD(USR_##MYF) == 0) { \
+                SET_USR_FIELD(USR_##MYF, 1); \
+                if (GET_USR_FIELD(USR_##MYE)) { \
+                    RAISE_FP_EXCEPTION; \
+                } \
+            } \
+        } \
+    } while (0)
+
+void arch_fpop_end(CPUHexagonState *env)
+{
+    int flags = get_float_exception_flags(&env->fp_status);
+    if (flags != 0) {
+        SOFTFLOAT_TEST_FLAG(float_flag_inexact, FPINPF, FPINPE);
+        SOFTFLOAT_TEST_FLAG(float_flag_divbyzero, FPDBZF, FPDBZE);
+        SOFTFLOAT_TEST_FLAG(float_flag_invalid, FPINVF, FPINVE);
+        SOFTFLOAT_TEST_FLAG(float_flag_overflow, FPOVFF, FPOVFE);
+        SOFTFLOAT_TEST_FLAG(float_flag_underflow, FPUNFF, FPUNFE);
+    }
+}
+
+static float32 float32_mul_pow2(float32 a, uint32_t p, float_status *fp_status)
+{
+    float32 b = make_float32((SF_BIAS + p) << SF_MANTBITS);
+    return float32_mul(a, b, fp_status);
+}
+
+int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
+                         float_status *fp_status)
+{
+    int n_exp;
+    int d_exp;
+    int ret = 0;
+    float32 RsV, RtV, RdV;
+    int PeV = 0;
+    RsV = *Rs;
+    RtV = *Rt;
+    if (float32_is_any_nan(RsV) && float32_is_any_nan(RtV)) {
+        if (extract32(RsV & RtV, 22, 1) == 0) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        RdV = RsV = RtV = float32_nan;
+    } else if (float32_is_any_nan(RsV)) {
+        if (extract32(RsV, 22, 1) == 0) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        RdV = RsV = RtV = float32_nan;
+    } else if (float32_is_any_nan(RtV)) {
+        /* or put NaN in num/den fixup? */
+        if (extract32(RtV, 22, 1) == 0) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        RdV = RsV = RtV = float32_nan;
+    } else if (float32_is_infinity(RsV) && float32_is_infinity(RtV)) {
+        /* or put Inf in num fixup? */
+        RdV = RsV = RtV = float32_nan;
+        float_raise(float_flag_invalid, fp_status);
+    } else if (float32_is_zero(RsV) && float32_is_zero(RtV)) {
+        /* or put zero in num fixup? */
+        RdV = RsV = RtV = float32_nan;
+        float_raise(float_flag_invalid, fp_status);
+    } else if (float32_is_zero(RtV)) {
+        /* or put Inf in num fixup? */
+        uint8_t RsV_sign = float32_is_neg(RsV);
+        uint8_t RtV_sign = float32_is_neg(RtV);
+        RsV = infinite_float32(RsV_sign ^ RtV_sign);
+        RtV = float32_one;
+        RdV = float32_one;
+        if (float32_is_infinity(RsV)) {
+            float_raise(float_flag_divbyzero, fp_status);
+        }
+    } else if (float32_is_infinity(RtV)) {
+        RsV = make_float32(0x80000000 & (RsV ^ RtV));
+        RtV = float32_one;
+        RdV = float32_one;
+    } else if (float32_is_zero(RsV)) {
+        /* Does this just work itself out? */
+        /* No, 0/Inf causes problems. */
+        RsV = make_float32(0x80000000 & (RsV ^ RtV));
+        RtV = float32_one;
+        RdV = float32_one;
+    } else if (float32_is_infinity(RsV)) {
+        uint8_t RsV_sign = float32_is_neg(RsV);
+        uint8_t RtV_sign = float32_is_neg(RtV);
+        RsV = infinite_float32(RsV_sign ^ RtV_sign);
+        RtV = float32_one;
+        RdV = float32_one;
+    } else {
+        PeV = 0x00;
+        /* Basic checks passed */
+        n_exp = float32_getexp(RsV);
+        d_exp = float32_getexp(RtV);
+        if ((n_exp - d_exp + SF_BIAS) <= SF_MANTBITS) {
+            /* Near quotient underflow / inexact Q */
+            PeV = 0x80;
+            RtV = float32_mul_pow2(RtV, -64, fp_status);
+            RsV = float32_mul_pow2(RsV, 64, fp_status);
+        } else if ((n_exp - d_exp + SF_BIAS) > (SF_MAXEXP - 24)) {
+            /* Near quotient overflow */
+            PeV = 0x40;
+            RtV = float32_mul_pow2(RtV, 32, fp_status);
+            RsV = float32_mul_pow2(RsV, -32, fp_status);
+        } else if (n_exp <= SF_MANTBITS + 2) {
+            RtV = float32_mul_pow2(RtV, 64, fp_status);
+            RsV = float32_mul_pow2(RsV, 64, fp_status);
+        } else if (d_exp <= 1) {
+            RtV = float32_mul_pow2(RtV, 32, fp_status);
+            RsV = float32_mul_pow2(RsV, 32, fp_status);
+        } else if (d_exp > 252) {
+            RtV = float32_mul_pow2(RtV, -32, fp_status);
+            RsV = float32_mul_pow2(RsV, -32, fp_status);
+        }
+        RdV = 0;
+        ret = 1;
+    }
+    *Rs = RsV;
+    *Rt = RtV;
+    *Rd = RdV;
+    *adjust = PeV;
+    return ret;
+}
+
+int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
+                           float_status *fp_status)
+{
+    float32 RsV, RdV;
+    int PeV = 0;
+    int r_exp;
+    int ret = 0;
+    RsV = *Rs;
+    if (float32_is_infinity(RsV)) {
+        if (extract32(RsV, 22, 1) == 0) {
+            float_raise(float_flag_invalid, fp_status);
+        }
+        RdV = RsV = float32_nan;
+    } else if (float32_lt(RsV, float32_zero, fp_status)) {
+        /* Negative nonzero values are NaN */
+        float_raise(float_flag_invalid, fp_status);
+        RsV = float32_nan;
+        RdV = float32_nan;
+    } else if (float32_is_infinity(RsV)) {
+        /* or put Inf in num fixup? */
+        RsV = infinite_float32(1);
+        RdV = infinite_float32(1);
+    } else if (float32_is_zero(RsV)) {
+        /* or put zero in num fixup? */
+        RdV = float32_one;
+    } else {
+        PeV = 0x00;
+        /* Basic checks passed */
+        r_exp = float32_getexp(RsV);
+        if (r_exp <= 24) {
+            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            PeV = 0xe0;
+        }
+        RdV = 0;
+        ret = 1;
+    }
+    *Rs = RsV;
+    *Rd = RdV;
+    *adjust = PeV;
+    return ret;
+}
-- 
2.25.1


