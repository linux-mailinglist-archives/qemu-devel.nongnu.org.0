Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28323AF134
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:01:35 +0200 (CEST)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNIk-0002jY-K5
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnY-0007qT-Pu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnW-0007lm-Gk
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so435988wma.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r3fM2jmt1sBYL82ILyWVf7hzlWtLI+J9aPNHNSsCL+I=;
 b=vAOP5xjn1IRK/qP+Mnx24LmDZ3r9oL+pSLAYlOMnGmmGHTbBm7qaWXlFumBwxtgjJA
 gq4fiEPbl+lPfelpd/W1dM0LN55sUu5QFnVDd0QOm/TD2k7McBlgmgqApRg8wh64K6rc
 ijFO0ZoQl2e+RZIMlAHmK5Y9ZbdgMPTpt9j0FApkuMmtxwjky0qAj/BNq5f7163AUZ92
 Z+hQzvcWk3706Vq6fywQYJuBuLwHVRIQNb78HfwMeCNKEH2s3O08F1Yl/F0p7TgyP9Hg
 GtA1l2tUgehdrLZM5GDkbRSUW3rM46Ur49JQqIP3IrAhjyn2Edim7ziMUhICrBcuqe9b
 yqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3fM2jmt1sBYL82ILyWVf7hzlWtLI+J9aPNHNSsCL+I=;
 b=pAGNZ2cyXjIvfM81K75N5MHf2Ns6zLHMtjcaQa1nYK5vZiq2Z21NwJzphqHjXtTHjs
 MokO/t0mKriERyzXHTwbhaDCzopuz5CP6lrmMCGQ8mewsZOYn9DNTeiErHpT1avWdruA
 TiSWfOmILPsVZzu3Rdp0aLtkuG3FK6ddAmgUuWoq5YV6cY5+aDeMN8U8lyjKYhC6NRAz
 lS8+PE9l9caZtuw6mdD9h78XkIwvrvWBuVuvFEO4OMfGJqzyjgrKPCtiL/g8/oFNNwDK
 hd9ucjsNi7Io2xitrHnDWMYwCjEuFCIzlgIdkZMwxwPhawRh4ZHfvirUo1k59HVChMox
 KKVg==
X-Gm-Message-State: AOAM531xSGQzzDUQu1zUnls1FQ77/gE4X6VO10nBI5HiPqFkzOZiLuad
 vunhupUK+YAMBHvqsjSV3xgPzSKJWsjBjPTE
X-Google-Smtp-Source: ABdhPJyKKAYt8lg2/aOSNfgo+avyu4ZaK1w+I8MAinVrzbtcOcUMDRnv5Zrna8BnE9ohA57qa2xQgg==
X-Received: by 2002:a1c:f014:: with SMTP id a20mr27807797wmb.67.1624292957330; 
 Mon, 21 Jun 2021 09:29:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/57] target/arm: Implement MVE VQDMLADH and VQRDMLADH
Date: Mon, 21 Jun 2021 17:28:23 +0100
Message-Id: <20210621162833.32535-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VQDMLADH and VQRDMLADH insns.  These multiply
elements, and then add pairs of products, double, possibly round,
saturate and return the high half of the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-37-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 16 +++++++
 target/arm/mve.decode      |  5 +++
 target/arm/mve_helper.c    | 89 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++
 4 files changed, 114 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b7e2243a19a..c3cc6a08476 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -201,6 +201,22 @@ DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 07da231fe64..76796b0f920 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -627,6 +627,95 @@ DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
 DO_2OP_SAT_S(vqrshls, DO_SQRSHL_OP)
 DO_2OP_SAT_U(vqrshlu, DO_UQRSHL_OP)
 
+/*
+ * Multiply add dual returning high half
+ * The 'FN' here takes four inputs A, B, C, D, a 0/1 indicator of
+ * whether to add the rounding constant, and the pointer to the
+ * saturation flag, and should do "(A * B + C * D) * 2 + rounding constant",
+ * saturate to twice the input size and return the high half; or
+ * (A * B - C * D) etc for VQDMLSDH.
+ */
+#define DO_VQDMLADH_OP(OP, ESIZE, TYPE, XCHG, ROUND, FN)                \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                void *vm)                               \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            if ((e & 1) == XCHG) {                                      \
+                TYPE r = FN(n[H##ESIZE(e)],                             \
+                            m[H##ESIZE(e - XCHG)],                      \
+                            n[H##ESIZE(e + (1 - 2 * XCHG))],            \
+                            m[H##ESIZE(e + (1 - XCHG))],                \
+                            ROUND, &sat);                               \
+                mergemask(&d[H##ESIZE(e)], r, mask);                    \
+                qc |= sat & mask & 1;                                   \
+            }                                                           \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
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
+DO_VQDMLADH_OP(vqdmladhb, 1, int8_t, 0, 0, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqdmladhh, 2, int16_t, 0, 0, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqdmladhw, 4, int32_t, 0, 0, do_vqdmladh_w)
+DO_VQDMLADH_OP(vqdmladhxb, 1, int8_t, 1, 0, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqdmladhxh, 2, int16_t, 1, 0, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqdmladhxw, 4, int32_t, 1, 0, do_vqdmladh_w)
+
+DO_VQDMLADH_OP(vqrdmladhb, 1, int8_t, 0, 1, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqrdmladhh, 2, int16_t, 0, 1, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqrdmladhw, 4, int32_t, 0, 1, do_vqdmladh_w)
+DO_VQDMLADH_OP(vqrdmladhxb, 1, int8_t, 1, 1, do_vqdmladh_b)
+DO_VQDMLADH_OP(vqrdmladhxh, 2, int16_t, 1, 1, do_vqdmladh_h)
+DO_VQDMLADH_OP(vqrdmladhxw, 4, int32_t, 1, 1, do_vqdmladh_w)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d75cc377fee..d830b42d5ce 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -410,6 +410,10 @@ DO_2OP(VQSHL_S, vqshls)
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


