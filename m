Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5F39E5AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:43:02 +0200 (CEST)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJHB-0003qc-DG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbH-0008Vy-RC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:43 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIab-00086O-TS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so13390709wri.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5QkF3qGfRO7IFJppquy5uIhGZiL/TMkugt4cNNnqJY=;
 b=eTWaYIRqPA7qO40AOuSL7WPpLPyosKXNlp9O6nSL0Mx6BfMkN7sKiGUf/JQmmKNrA+
 yZMi8+V3I4upEUMd/7ShdRnWOqAKrRMLqGdWSvJcMNx3ZBrTx5dIQ2YlxVNmtJCZ7R1M
 XtVzf+EBv2Fkf2OjPPHfcCvfsmgQGiuUx5ZfqtUKpDy8JYvwJoHAjkKrO8VcHbkOK8og
 ZC0bvD1pjOavre2c2elCJyqZrJH89LE8PBRLrcH/yutF/lGJoXOLxEkKUn03Ezy9TFQN
 oatfpgfJZzXDVTGEAiC0Ek4hD51ncGEuVbo23PE4xytFXbOE/n0ALzgMd9Hnfllsb+4A
 hOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5QkF3qGfRO7IFJppquy5uIhGZiL/TMkugt4cNNnqJY=;
 b=i3we+NQvobt7AZhIEUe97EOa+yS+oxIWtNfdhrFo4QWvvYqMqb2wtegANzEqFJBDZ/
 3W2U/m+iJQ3U228r4OjUcLc0nKqTNM0/AGWSQXcsdmBgR3VrkdFNp/Q7yMlJtJ0QHcno
 yJAfIM1R0oFFhLrmSLe2lcmoTyiw/4Y8fY/p4GbMrOwvfKw0HGEjCRXMjmiq9ysmb0CF
 5LjaeRSMRhiuJ61rhbjcg3ZPs5CxhgLdZYs592omAsEcjiF8JjKcABJBYPiXiianS/xU
 4EYzKRVkl2D0xdn/4wvpNxTtfSqY3EEq+tfljMeMLtNQKMo0Fvv3nimiEt7p6QZ4dbAP
 2ixg==
X-Gm-Message-State: AOAM531LZQ2OvL2ayUVr+p4EHOKAv94lu0a52ezn2XW9G5ohIypM3ZmA
 4t8pllT7n0/gadGP4t2zFEBN18Y5fcOWNMmd
X-Google-Smtp-Source: ABdhPJyv84HABvj6Ce/eS1vf2h+LInllLmxml5RjyEguqs4D24WdZNSmJZYQxOlVlhSxHEM9Gwt4iw==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr17769535wrf.420.1623085140657; 
 Mon, 07 Jun 2021 09:59:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 47/55] target/arm: Implement MVE VQDMLADH and VQRDMLADH
Date: Mon,  7 Jun 2021 17:58:13 +0100
Message-Id: <20210607165821.9892-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VQDMLADH and VQRDMLADH insns.  These multiply
elements, and then add pairs of products, double, possibly round,
saturate and return the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 +++++++
 target/arm/mve.decode      |  5 +++
 target/arm/mve_helper.c    | 87 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 6939cf84c57..c62066d94aa 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -203,6 +203,22 @@ DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmladhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmladhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmladhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqdmladhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmladhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmladhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmladhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmladhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmladhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmladhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmladhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmladhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c30fb2c1536..d267c8838eb 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -142,6 +142,11 @@ VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 
+VQDMLADH         1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+VQDMLADHX        1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+VQRDMLADH        1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+VQRDMLADHX       1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 9c23e6b9b28..03701d32dcb 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -830,6 +830,93 @@ DO_2OP_SAT(vqrshlsb, 1, int8_t, H1, DO_SQRSHL_OP)
 DO_2OP_SAT(vqrshlsh, 2, int16_t, H2, DO_SQRSHL_OP)
 DO_2OP_SAT(vqrshlsw, 4, int32_t, H4, DO_SQRSHL32_OP)
 
+/*
+ * Multiply add dual returning high half
+ * The 'FN' here takes four inputs A, B, C, D, a 0/1 indicator of
+ * whether to add the rounding constant, and the pointer to the
+ * saturation flag, and should do "(A * B + C * D) * 2 + rounding constant",
+ * saturate to twice the input size and return the high half; or
+ * (A * B - C * D) etc for VQDMLSDH.
+ */
+#define DO_VQDMLADH_OP(OP, ESIZE, TYPE, H, XCHG, ROUND, FN)             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                void *vm)                               \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            if ((e & 1) == XCHG) {                                      \
+                TYPE r = FN(n[H(e)], m[H(e - XCHG)],                    \
+                            n[H(e + (1 - 2 * XCHG))], m[H(e + (1 - XCHG))], \
+                            ROUND, &sat);                               \
+                uint64_t bytemask = mask_to_bytemask##ESIZE(mask);      \
+                d[H(e)] &= ~bytemask;                                   \
+                d[H(e)] |= (r & bytemask);                              \
+                if (sat && (mask & 1)) {                                \
+                    env->vfp.qc[0] = 1;                                 \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+static int8_t do_vqdmladh_b(int8_t a, int8_t b, int8_t c, int8_t d,
+                            int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b + (int64_t)c * d) * 2 + (round << 7);
+    return do_sat_bhw(r, INT16_MIN, INT16_MAX, sat) >> 8;
+}
+
+static int16_t do_vqdmladh_h(int16_t a, int16_t b, int16_t c, int16_t d,
+                             int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b + (int64_t)c * d) * 2 + (round << 15);
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat) >> 16;
+}
+
+static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
+                             int round, bool *sat)
+{
+    int64_t m1 = (int64_t)a * b;
+    int64_t m2 = (int64_t)c * d;
+    int64_t r;
+    /*
+     * Architecturally we should do the entire add, double, round
+     * and then check for saturation. We do three saturating adds,
+     * but we need to be careful about the order. If the first
+     * m1 + m2 saturates then it's impossible for the *2+rc to
+     * bring it back into the non-saturated range. However, if
+     * m1 + m2 is negative then it's possible that doing the doubling
+     * would take the intermediate result below INT64_MAX and the
+     * addition of the rounding constant then brings it back in range.
+     * So we add half the rounding constant before doubling rather
+     * than adding the rounding constant after the doubling.
+     */
+    if (sadd64_overflow(m1, m2, &r) ||
+        sadd64_overflow(r, (round << 30), &r) ||
+        sadd64_overflow(r, r, &r)) {
+        *sat = true;
+        return r < 0 ? INT32_MAX : INT32_MIN;
+    }
+    return r >> 32;
+}
+
+DO_VQDMLADH_OP(vqdmladhb, 1, int8_t, H1, 0, 0, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqdmladhh, 2, int16_t, H2, 0, 0, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqdmladhw, 4, int32_t, H4, 0, 0, do_vqdmladh_w)
+DO_VQDMLADH_OP(vqdmladhxb, 1, int8_t, H1, 1, 0, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqdmladhxh, 2, int16_t, H2, 1, 0, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqdmladhxw, 4, int32_t, H4, 1, 0, do_vqdmladh_w)
+
+DO_VQDMLADH_OP(vqrdmladhb, 1, int8_t, H1, 0, 1, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqrdmladhh, 2, int16_t, H2, 0, 1, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqrdmladhw, 4, int32_t, H4, 0, 1, do_vqdmladh_w)
+DO_VQDMLADH_OP(vqrdmladhxb, 1, int8_t, H1, 1, 1, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqrdmladhxh, 2, int16_t, H2, 1, 1, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqrdmladhxw, 4, int32_t, H4, 1, 1, do_vqdmladh_w)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6bc32379172..7c25802bf53 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -429,6 +429,10 @@ DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
 DO_2OP(VQRSHL_U, vqrshlu)
+DO_2OP(VQDMLADH, vqdmladh)
+DO_2OP(VQDMLADHX, vqdmladhx)
+DO_2OP(VQRDMLADH, vqrdmladh)
+DO_2OP(VQRDMLADHX, vqrdmladhx)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


