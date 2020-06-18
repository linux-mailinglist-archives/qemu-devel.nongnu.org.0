Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7D1FEA3E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 06:37:49 +0200 (CEST)
Received: from localhost ([::1]:39762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlmJ9-0005OI-3B
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 00:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9W-0003SH-L0
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:50 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9Q-0002Uj-Jh
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:27:50 -0400
Received: by mail-pl1-x641.google.com with SMTP id n2so1893839pld.13
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZak3l82SIOkXxMGPmecx2ON3q41zNmoRYnuO/ggS+0=;
 b=UA8JIcZr2CJl0HtqEiN0U01dZWe1gv6pL0QT2gDxQqSUcforJ/VuW0gKrCGHU2Nsl5
 8h0omWG1sqYZRLm5s19b+FeAwun09sdnXJ8PQXuKLrJMpItCWDlsh/dVUMVZL6zVroCJ
 pEWlYo2PXdjNf/oUogAvutqVl4W8vDsWUYyhZEzxM+zMGcfY4Z+DqgLslVJX/v/5c1zM
 t4qvKE9eCwgh34xJCvCWQUxVxAk54dEg68B/IJWtgKy2rl2zbECgQwwzjwYv1j82C2Qc
 9IIVATzbXU2Ds5AttfikM9vrdGFUf3Tiiaknr2lJqotwUbWW415cJPT/qSopwK89j0o/
 O6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZak3l82SIOkXxMGPmecx2ON3q41zNmoRYnuO/ggS+0=;
 b=HTPaJ4GbtwQ3mZoVQPNdTESUzGCgqjLyDUHOz5nmrKUX/+mteecCdQVnatMuzgok20
 YjqVRFgp/onvEjAMgUXbWGZxdjZpoOK06G/T0kgnU+lKu7O8j0zdnTCr9n7CYxZNsPnl
 KXr5LRTb9eYAFNiYbvfTHYeLIFEEJ1FSdeVRkZQ4dEvsPl17aJqwLyQliO1tLZJmEHJW
 wnPUc+d8AXwBMgm2jl2oA1CF5eresjWXaAJGr0wR6o3aAEbuSC6TWNZMaDd5ZIcXUi3X
 BOCCgIvoDrzQEbTROLyx8EW3GqZYA7QY2G+HAv1lrMgFML7ApMM6vqsUa0hYwAzqmnja
 jo1Q==
X-Gm-Message-State: AOAM533hxy6RjYlGdaFfjUBX/2duKaP20GR3dTOsU74mjM7f+sjdQ5wR
 nOXzG3U5bH5FxHgF8bzxc85A/23fsKE=
X-Google-Smtp-Source: ABdhPJwfRDd5TbJ08PKHnRxnlfYSV1vLyXGixsINpfLS0Wcy3hmpQys+BvpnB2QAS+D6d2jt9hCEQw==
X-Received: by 2002:a17:902:74cb:: with SMTP id
 f11mr2110878plt.239.1592454462381; 
 Wed, 17 Jun 2020 21:27:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 019/100] target/arm: Split out saturating/rounding shifts
 from neon
Date: Wed, 17 Jun 2020 21:25:23 -0700
Message-Id: <20200618042644.1685561-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split these operations out into a header that can be shared
between neon and sve.  The "sat" pointer acts both as a boolean
for control of saturating behavior and controls the difference
in behavior between neon and sve -- QC bit or no QC bit.

Widen the shift operand in the new helpers, as the SVE2 insns treat
the whole input element as significant.  For the neon uses, truncate
the shift to int8_t while passing the parameter.

Implement right-shift rounding as

    tmp = src >> (shift - 1);
    dst = (tmp >> 1) + (tmp & 1);

This is the same number of instructions as the current

    tmp = 1 << (shift - 1);
    dst = (src + tmp) >> shift;

without any possibility of intermediate overflow.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Widen the shift operand (laurent desnouges)
---
 target/arm/vec_internal.h | 138 +++++++++++
 target/arm/neon_helper.c  | 507 +++++++-------------------------------
 2 files changed, 221 insertions(+), 424 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 00a8277765..372fe76523 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -30,4 +30,142 @@ static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
     }
 }
 
+static inline int32_t do_sqrshl_bhs(int32_t src, int32_t shift, int bits,
+                                    bool round, uint32_t *sat)
+{
+    if (shift <= -bits) {
+        /* Rounding the sign bit always produces 0. */
+        if (round) {
+            return 0;
+        }
+        return src >> 31;
+    } else if (shift < 0) {
+        if (round) {
+            src >>= -shift - 1;
+            return (src >> 1) + (src & 1);
+        }
+        return src >> -shift;
+    } else if (shift < bits) {
+        int32_t val = src << shift;
+        if (bits == 32) {
+            if (!sat || val >> shift == src) {
+                return val;
+            }
+        } else {
+            int32_t extval = sextract32(val, 0, bits);
+            if (!sat || val == extval) {
+                return extval;
+            }
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return (1u << (bits - 1)) - (src >= 0);
+}
+
+static inline uint32_t do_uqrshl_bhs(uint32_t src, int32_t shift, int bits,
+                                     bool round, uint32_t *sat)
+{
+    if (shift <= -(bits + round)) {
+        return 0;
+    } else if (shift < 0) {
+        if (round) {
+            src >>= -shift - 1;
+            return (src >> 1) + (src & 1);
+        }
+        return src >> -shift;
+    } else if (shift < bits) {
+        uint32_t val = src << shift;
+        if (bits == 32) {
+            if (!sat || val >> shift == src) {
+                return val;
+            }
+        } else {
+            uint32_t extval = extract32(val, 0, bits);
+            if (!sat || val == extval) {
+                return extval;
+            }
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return MAKE_64BIT_MASK(0, bits);
+}
+
+static inline int32_t do_suqrshl_bhs(int32_t src, int32_t shift, int bits,
+                                     bool round, uint32_t *sat)
+{
+    if (src < 0) {
+        *sat = 1;
+        return 0;
+    }
+    return do_uqrshl_bhs(src, shift, bits, round, sat);
+}
+
+static inline int64_t do_sqrshl_d(int64_t src, int64_t shift,
+                                  bool round, uint32_t *sat)
+{
+    if (shift <= -64) {
+        /* Rounding the sign bit always produces 0. */
+        if (round) {
+            return 0;
+        }
+        return src >> 63;
+    } else if (shift < 0) {
+        if (round) {
+            src >>= -shift - 1;
+            return (src >> 1) + (src & 1);
+        }
+        return src >> -shift;
+    } else if (shift < 64) {
+        int64_t val = src << shift;
+        if (!sat || val >> shift == src) {
+            return val;
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return src < 0 ? INT64_MIN : INT64_MAX;
+}
+
+static inline uint64_t do_uqrshl_d(uint64_t src, int64_t shift,
+                                   bool round, uint32_t *sat)
+{
+    if (shift <= -(64 + round)) {
+        return 0;
+    } else if (shift < 0) {
+        if (round) {
+            src >>= -shift - 1;
+            return (src >> 1) + (src & 1);
+        }
+        return src >> -shift;
+    } else if (shift < 64) {
+        uint64_t val = src << shift;
+        if (!sat || val >> shift == src) {
+            return val;
+        }
+    } else if (!sat || src == 0) {
+        return 0;
+    }
+
+    *sat = 1;
+    return UINT64_MAX;
+}
+
+static inline int64_t do_suqrshl_d(int64_t src, int64_t shift,
+                                   bool round, uint32_t *sat)
+{
+    if (src < 0) {
+        *sat = 1;
+        return 0;
+    }
+    return do_uqrshl_d(src, shift, round, sat);
+}
+
 #endif /* TARGET_ARM_VEC_INTERNALS_H */
diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
index b637265691..338b9189d5 100644
--- a/target/arm/neon_helper.c
+++ b/target/arm/neon_helper.c
@@ -11,6 +11,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
+#include "vec_internal.h"
 
 #define SIGNBIT (uint32_t)0x80000000
 #define SIGNBIT64 ((uint64_t)1 << 63)
@@ -576,496 +577,154 @@ NEON_POP(pmax_s16, neon_s16, 2)
 NEON_POP(pmax_u16, neon_u16, 2)
 #undef NEON_FN
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8 || \
-        tmp <= -(ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp < 0) { \
-        dest = src1 >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, false, NULL))
 NEON_VOP(shl_u16, neon_u16, 2)
 #undef NEON_FN
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
-        dest = src1 >> (sizeof(src1) * 8 - 1); \
-    } else if (tmp < 0) { \
-        dest = src1 >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, false, NULL))
 NEON_VOP(shl_s16, neon_s16, 2)
 #undef NEON_FN
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if ((tmp >= (ssize_t)sizeof(src1) * 8) \
-        || (tmp <= -(ssize_t)sizeof(src1) * 8)) { \
-        dest = 0; \
-    } else if (tmp < 0) { \
-        dest = (src1 + (1 << (-1 - tmp))) >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, true, NULL))
 NEON_VOP(rshl_s8, neon_s8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, true, NULL))
 NEON_VOP(rshl_s16, neon_s16, 2)
 #undef NEON_FN
 
-/* The addition of the rounding constant may overflow, so we use an
- * intermediate 64 bit accumulator.  */
-uint32_t HELPER(neon_rshl_s32)(uint32_t valop, uint32_t shiftop)
+uint32_t HELPER(neon_rshl_s32)(uint32_t val, uint32_t shift)
 {
-    int32_t dest;
-    int32_t val = (int32_t)valop;
-    int8_t shift = (int8_t)shiftop;
-    if ((shift >= 32) || (shift <= -32)) {
-        dest = 0;
-    } else if (shift < 0) {
-        int64_t big_dest = ((int64_t)val + (1 << (-1 - shift)));
-        dest = big_dest >> -shift;
-    } else {
-        dest = val << shift;
-    }
-    return dest;
+    return do_sqrshl_bhs(val, (int8_t)shift, 32, true, NULL);
 }
 
-/* Handling addition overflow with 64 bit input values is more
- * tricky than with 32 bit values.  */
-uint64_t HELPER(neon_rshl_s64)(uint64_t valop, uint64_t shiftop)
+uint64_t HELPER(neon_rshl_s64)(uint64_t val, uint64_t shift)
 {
-    int8_t shift = (int8_t)shiftop;
-    int64_t val = valop;
-    if ((shift >= 64) || (shift <= -64)) {
-        val = 0;
-    } else if (shift < 0) {
-        val >>= (-shift - 1);
-        if (val == INT64_MAX) {
-            /* In this case, it means that the rounding constant is 1,
-             * and the addition would overflow. Return the actual
-             * result directly.  */
-            val = 0x4000000000000000LL;
-        } else {
-            val++;
-            val >>= 1;
-        }
-    } else {
-        val <<= shift;
-    }
-    return val;
+    return do_sqrshl_d(val, (int8_t)shift, true, NULL);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8 || \
-        tmp < -(ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp == -(ssize_t)sizeof(src1) * 8) { \
-        dest = src1 >> (-tmp - 1); \
-    } else if (tmp < 0) { \
-        dest = (src1 + (1 << (-1 - tmp))) >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, true, NULL))
 NEON_VOP(rshl_u8, neon_u8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, true, NULL))
 NEON_VOP(rshl_u16, neon_u16, 2)
 #undef NEON_FN
 
-/* The addition of the rounding constant may overflow, so we use an
- * intermediate 64 bit accumulator.  */
-uint32_t HELPER(neon_rshl_u32)(uint32_t val, uint32_t shiftop)
+uint32_t HELPER(neon_rshl_u32)(uint32_t val, uint32_t shift)
 {
-    uint32_t dest;
-    int8_t shift = (int8_t)shiftop;
-    if (shift >= 32 || shift < -32) {
-        dest = 0;
-    } else if (shift == -32) {
-        dest = val >> 31;
-    } else if (shift < 0) {
-        uint64_t big_dest = ((uint64_t)val + (1 << (-1 - shift)));
-        dest = big_dest >> -shift;
-    } else {
-        dest = val << shift;
-    }
-    return dest;
+    return do_uqrshl_bhs(val, (int8_t)shift, 32, true, NULL);
 }
 
-/* Handling addition overflow with 64 bit input values is more
- * tricky than with 32 bit values.  */
-uint64_t HELPER(neon_rshl_u64)(uint64_t val, uint64_t shiftop)
+uint64_t HELPER(neon_rshl_u64)(uint64_t val, uint64_t shift)
 {
-    int8_t shift = (uint8_t)shiftop;
-    if (shift >= 64 || shift < -64) {
-        val = 0;
-    } else if (shift == -64) {
-        /* Rounding a 1-bit result just preserves that bit.  */
-        val >>= 63;
-    } else if (shift < 0) {
-        val >>= (-shift - 1);
-        if (val == UINT64_MAX) {
-            /* In this case, it means that the rounding constant is 1,
-             * and the addition would overflow. Return the actual
-             * result directly.  */
-            val = 0x8000000000000000ULL;
-        } else {
-            val++;
-            val >>= 1;
-        }
-    } else {
-        val <<= shift;
-    }
-    return val;
+    return do_uqrshl_d(val, (int8_t)shift, true, NULL);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-        if (src1) { \
-            SET_QC(); \
-            dest = ~0; \
-        } else { \
-            dest = 0; \
-        } \
-    } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp < 0) { \
-        dest = src1 >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-        if ((dest >> tmp) != src1) { \
-            SET_QC(); \
-            dest = ~0; \
-        } \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_u8, neon_u8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_u16, neon_u16, 2)
-NEON_VOP_ENV(qshl_u32, neon_u32, 1)
 #undef NEON_FN
 
-uint64_t HELPER(neon_qshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop)
+uint32_t HELPER(neon_qshl_u32)(CPUARMState *env, uint32_t val, uint32_t shift)
 {
-    int8_t shift = (int8_t)shiftop;
-    if (shift >= 64) {
-        if (val) {
-            val = ~(uint64_t)0;
-            SET_QC();
-        }
-    } else if (shift <= -64) {
-        val = 0;
-    } else if (shift < 0) {
-        val >>= -shift;
-    } else {
-        uint64_t tmp = val;
-        val <<= shift;
-        if ((val >> shift) != tmp) {
-            SET_QC();
-            val = ~(uint64_t)0;
-        }
-    }
-    return val;
+    return do_uqrshl_bhs(val, (int8_t)shift, 32, false, env->vfp.qc);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-        if (src1) { \
-            SET_QC(); \
-            dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
-            if (src1 > 0) { \
-                dest--; \
-            } \
-        } else { \
-            dest = src1; \
-        } \
-    } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
-        dest = src1 >> 31; \
-    } else if (tmp < 0) { \
-        dest = src1 >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-        if ((dest >> tmp) != src1) { \
-            SET_QC(); \
-            dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
-            if (src1 > 0) { \
-                dest--; \
-            } \
-        } \
-    }} while (0)
+uint64_t HELPER(neon_qshl_u64)(CPUARMState *env, uint64_t val, uint64_t shift)
+{
+    return do_uqrshl_d(val, (int8_t)shift, false, env->vfp.qc);
+}
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_s8, neon_s8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, false, env->vfp.qc))
 NEON_VOP_ENV(qshl_s16, neon_s16, 2)
-NEON_VOP_ENV(qshl_s32, neon_s32, 1)
 #undef NEON_FN
 
-uint64_t HELPER(neon_qshl_s64)(CPUARMState *env, uint64_t valop, uint64_t shiftop)
+uint32_t HELPER(neon_qshl_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
 {
-    int8_t shift = (uint8_t)shiftop;
-    int64_t val = valop;
-    if (shift >= 64) {
-        if (val) {
-            SET_QC();
-            val = (val >> 63) ^ ~SIGNBIT64;
-        }
-    } else if (shift <= -64) {
-        val >>= 63;
-    } else if (shift < 0) {
-        val >>= -shift;
-    } else {
-        int64_t tmp = val;
-        val <<= shift;
-        if ((val >> shift) != tmp) {
-            SET_QC();
-            val = (tmp >> 63) ^ ~SIGNBIT64;
-        }
-    }
-    return val;
+    return do_sqrshl_bhs(val, (int8_t)shift, 32, false, env->vfp.qc);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    if (src1 & (1 << (sizeof(src1) * 8 - 1))) { \
-        SET_QC(); \
-        dest = 0; \
-    } else { \
-        int8_t tmp; \
-        tmp = (int8_t)src2; \
-        if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-            if (src1) { \
-                SET_QC(); \
-                dest = ~0; \
-            } else { \
-                dest = 0; \
-            } \
-        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
-            dest = 0; \
-        } else if (tmp < 0) { \
-            dest = src1 >> -tmp; \
-        } else { \
-            dest = src1 << tmp; \
-            if ((dest >> tmp) != src1) { \
-                SET_QC(); \
-                dest = ~0; \
-            } \
-        } \
-    }} while (0)
-NEON_VOP_ENV(qshlu_s8, neon_u8, 4)
-NEON_VOP_ENV(qshlu_s16, neon_u16, 2)
+uint64_t HELPER(neon_qshl_s64)(CPUARMState *env, uint64_t val, uint64_t shift)
+{
+    return do_sqrshl_d(val, (int8_t)shift, false, env->vfp.qc);
+}
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_suqrshl_bhs(src1, (int8_t)src2, 8, false, env->vfp.qc))
+NEON_VOP_ENV(qshlu_s8, neon_s8, 4)
 #undef NEON_FN
 
-uint32_t HELPER(neon_qshlu_s32)(CPUARMState *env, uint32_t valop, uint32_t shiftop)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_suqrshl_bhs(src1, (int8_t)src2, 16, false, env->vfp.qc))
+NEON_VOP_ENV(qshlu_s16, neon_s16, 2)
+#undef NEON_FN
+
+uint32_t HELPER(neon_qshlu_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
 {
-    if ((int32_t)valop < 0) {
-        SET_QC();
-        return 0;
-    }
-    return helper_neon_qshl_u32(env, valop, shiftop);
+    return do_suqrshl_bhs(val, (int8_t)shift, 32, false, env->vfp.qc);
 }
 
-uint64_t HELPER(neon_qshlu_s64)(CPUARMState *env, uint64_t valop, uint64_t shiftop)
+uint64_t HELPER(neon_qshlu_s64)(CPUARMState *env, uint64_t val, uint64_t shift)
 {
-    if ((int64_t)valop < 0) {
-        SET_QC();
-        return 0;
-    }
-    return helper_neon_qshl_u64(env, valop, shiftop);
+    return do_suqrshl_d(val, (int8_t)shift, false, env->vfp.qc);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-        if (src1) { \
-            SET_QC(); \
-            dest = ~0; \
-        } else { \
-            dest = 0; \
-        } \
-    } else if (tmp < -(ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp == -(ssize_t)sizeof(src1) * 8) { \
-        dest = src1 >> (sizeof(src1) * 8 - 1); \
-    } else if (tmp < 0) { \
-        dest = (src1 + (1 << (-1 - tmp))) >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-        if ((dest >> tmp) != src1) { \
-            SET_QC(); \
-            dest = ~0; \
-        } \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u8, neon_u8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_u16, neon_u16, 2)
 #undef NEON_FN
 
-/* The addition of the rounding constant may overflow, so we use an
- * intermediate 64 bit accumulator.  */
-uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shiftop)
+uint32_t HELPER(neon_qrshl_u32)(CPUARMState *env, uint32_t val, uint32_t shift)
 {
-    uint32_t dest;
-    int8_t shift = (int8_t)shiftop;
-    if (shift >= 32) {
-        if (val) {
-            SET_QC();
-            dest = ~0;
-        } else {
-            dest = 0;
-        }
-    } else if (shift < -32) {
-        dest = 0;
-    } else if (shift == -32) {
-        dest = val >> 31;
-    } else if (shift < 0) {
-        uint64_t big_dest = ((uint64_t)val + (1 << (-1 - shift)));
-        dest = big_dest >> -shift;
-    } else {
-        dest = val << shift;
-        if ((dest >> shift) != val) {
-            SET_QC();
-            dest = ~0;
-        }
-    }
-    return dest;
+    return do_uqrshl_bhs(val, (int8_t)shift, 32, true, env->vfp.qc);
 }
 
-/* Handling addition overflow with 64 bit input values is more
- * tricky than with 32 bit values.  */
-uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop)
+uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shift)
 {
-    int8_t shift = (int8_t)shiftop;
-    if (shift >= 64) {
-        if (val) {
-            SET_QC();
-            val = ~0;
-        }
-    } else if (shift < -64) {
-        val = 0;
-    } else if (shift == -64) {
-        val >>= 63;
-    } else if (shift < 0) {
-        val >>= (-shift - 1);
-        if (val == UINT64_MAX) {
-            /* In this case, it means that the rounding constant is 1,
-             * and the addition would overflow. Return the actual
-             * result directly.  */
-            val = 0x8000000000000000ULL;
-        } else {
-            val++;
-            val >>= 1;
-        }
-    } else { \
-        uint64_t tmp = val;
-        val <<= shift;
-        if ((val >> shift) != tmp) {
-            SET_QC();
-            val = ~0;
-        }
-    }
-    return val;
+    return do_uqrshl_d(val, (int8_t)shift, true, env->vfp.qc);
 }
 
-#define NEON_FN(dest, src1, src2) do { \
-    int8_t tmp; \
-    tmp = (int8_t)src2; \
-    if (tmp >= (ssize_t)sizeof(src1) * 8) { \
-        if (src1) { \
-            SET_QC(); \
-            dest = (typeof(dest))(1 << (sizeof(src1) * 8 - 1)); \
-            if (src1 > 0) { \
-                dest--; \
-            } \
-        } else { \
-            dest = 0; \
-        } \
-    } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
-        dest = 0; \
-    } else if (tmp < 0) { \
-        dest = (src1 + (1 << (-1 - tmp))) >> -tmp; \
-    } else { \
-        dest = src1 << tmp; \
-        if ((dest >> tmp) != src1) { \
-            SET_QC(); \
-            dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
-            if (src1 > 0) { \
-                dest--; \
-            } \
-        } \
-    }} while (0)
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 8, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
+#undef NEON_FN
+
+#define NEON_FN(dest, src1, src2) \
+    (dest = do_sqrshl_bhs(src1, (int8_t)src2, 16, true, env->vfp.qc))
 NEON_VOP_ENV(qrshl_s16, neon_s16, 2)
 #undef NEON_FN
 
-/* The addition of the rounding constant may overflow, so we use an
- * intermediate 64 bit accumulator.  */
-uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t valop, uint32_t shiftop)
+uint32_t HELPER(neon_qrshl_s32)(CPUARMState *env, uint32_t val, uint32_t shift)
 {
-    int32_t dest;
-    int32_t val = (int32_t)valop;
-    int8_t shift = (int8_t)shiftop;
-    if (shift >= 32) {
-        if (val) {
-            SET_QC();
-            dest = (val >> 31) ^ ~SIGNBIT;
-        } else {
-            dest = 0;
-        }
-    } else if (shift <= -32) {
-        dest = 0;
-    } else if (shift < 0) {
-        int64_t big_dest = ((int64_t)val + (1 << (-1 - shift)));
-        dest = big_dest >> -shift;
-    } else {
-        dest = val << shift;
-        if ((dest >> shift) != val) {
-            SET_QC();
-            dest = (val >> 31) ^ ~SIGNBIT;
-        }
-    }
-    return dest;
+    return do_sqrshl_bhs(val, (int8_t)shift, 32, true, env->vfp.qc);
 }
 
-/* Handling addition overflow with 64 bit input values is more
- * tricky than with 32 bit values.  */
-uint64_t HELPER(neon_qrshl_s64)(CPUARMState *env, uint64_t valop, uint64_t shiftop)
+uint64_t HELPER(neon_qrshl_s64)(CPUARMState *env, uint64_t val, uint64_t shift)
 {
-    int8_t shift = (uint8_t)shiftop;
-    int64_t val = valop;
-
-    if (shift >= 64) {
-        if (val) {
-            SET_QC();
-            val = (val >> 63) ^ ~SIGNBIT64;
-        }
-    } else if (shift <= -64) {
-        val = 0;
-    } else if (shift < 0) {
-        val >>= (-shift - 1);
-        if (val == INT64_MAX) {
-            /* In this case, it means that the rounding constant is 1,
-             * and the addition would overflow. Return the actual
-             * result directly.  */
-            val = 0x4000000000000000ULL;
-        } else {
-            val++;
-            val >>= 1;
-        }
-    } else {
-        int64_t tmp = val;
-        val <<= shift;
-        if ((val >> shift) != tmp) {
-            SET_QC();
-            val = (tmp >> 63) ^ ~SIGNBIT64;
-        }
-    }
-    return val;
+    return do_sqrshl_d(val, (int8_t)shift, true, env->vfp.qc);
 }
 
 uint32_t HELPER(neon_add_u8)(uint32_t a, uint32_t b)
-- 
2.25.1


