Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33E3A6ACA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:45:16 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsom3-0000Yg-9W
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEx-00028G-Ps
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEf-0000Yi-Kr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso187277wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Mml87/Gj3QwxgBdynCEdtyNHz2bSDs/0GXWyp7FDuw=;
 b=TE2HMiC0cuN7OXd3n4sOLcKzu+t9lK8PUjlNLE0D4pYVS2pkz/OXTCkpZax2Mh+36R
 uVeY7wUjvRMI+k5DNDSCg6Ia0BLPTZPZXcJxsZmIUj4wtN2TZSAuz6CLswogYrvmP1O1
 LcF/sEr4g4moYhsCvsYlPYKEh69xaH1TJsM1DzO8ds2L7P4TQg9uKpqdSF1MI1bcIigF
 uj+SM+tsh2t1jCZGavYMgx8nKWjZztRwlH9Qs9n9vdjXW82DozGkqA37hLiFFS5E1EW8
 kcsvcn0wahX6CKsfQ1JQf1m/GTkYRsToIMIRXYwsQxomyEUm6T1pqKmduHskW1A0qiCS
 KR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Mml87/Gj3QwxgBdynCEdtyNHz2bSDs/0GXWyp7FDuw=;
 b=TDOObKyagzMz6qu81rsC2pB/Ts0Lxp1NutLCwAYrJV3J9mLsirbdlrGiO0o2GIpyNz
 q7R1kqI8+ii1i+r45l0NEEUIAJ8U/HS16YPQJSjhRz1GkmiGsZzyHSMH+gIpLelOsGPA
 /G+UIZJ+uyaqUna+3uygm5/dejdRM6xTu1PhU00lrEx+TGEOR8fs0aK6VtwXXhbUyv4j
 RH6ZN4m1KTQ/QTEQz53isTqvOeQft8XvIMFjL8mnWvOxEJ4UtgWeqIwfoOCE5Tms391o
 EJ9XzjLxD033YNaB5y8Bcjq/fS3jhDWmLINXFbJA+/64hLqA5IahOtGKWlIFVxV1ZLdz
 qCpw==
X-Gm-Message-State: AOAM533C0pUWChVhsYkcRcjChhIPGM5UzszYUnvqXiT9s5ykKtNE05Tl
 LogM4VS4wHqbz7EaG4LDWax7Yw==
X-Google-Smtp-Source: ABdhPJzOdr06JmpZXWw0dC9GVeCRp4ouuVCclVHcGzLyOGHmZiCUTGiaq4aJreqS8BhWyuAWPixQ9w==
X-Received: by 2002:a05:600c:3504:: with SMTP id
 h4mr31476955wmq.118.1623683444317; 
 Mon, 14 Jun 2021 08:10:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 42/57] target/arm: Implement MVE VQDMULL scalar
Date: Mon, 14 Jun 2021 16:09:52 +0100
Message-Id: <20210614151007.4545-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE VQDMULL scalar insn. This multiplies the top or
bottom half of each element by the scalar, doubles and saturates
to a double-width result.

Note that this encoding overlaps with VQADD and VQSUB; it uses
what in VQADD and VQSUB would be the 'size=0b11' encoding.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      | 23 +++++++++++---
 target/arm/mve_helper.c    | 65 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++
 4 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a0a01d0cc3b..41dd61264e0 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -201,6 +201,11 @@ DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 47ce6ebb83b..a71ad7252bf 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -23,6 +23,9 @@
 %qm 5:1 1:3
 %qn 7:1 17:3
 
+# VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
+%size_28 28:1 !function=plus_1
+
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
@@ -38,6 +41,7 @@
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+@2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
 # Vector loads and stores
 
@@ -168,15 +172,26 @@ VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 
-VQADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
-VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+{
+  VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQDMULLB_scalar 111 . 1110 0 . 11 ... 0 ... 0 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
+{
+  VQSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQDMULLT_scalar 111 . 1110 0 . 11 ... 0 ... 1 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 45f402e795c..2f401f72bb3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -625,6 +625,71 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/*
+ * Long saturating scalar ops. As with DO_2OP_L, TYPE and H are for the
+ * input (smaller) type and LESIZE, LTYPE, LH for the output (long) type.
+ * SATMASK specifies which bits of the predicate mask matter for determining
+ * whether to propagate a saturation indication into FPSCR.QC -- for
+ * the 16x16->32 case we must check only the bit corresponding to the T or B
+ * half that we used, but for the 32x32->64 case we propagate if the mask
+ * bit is set for either half.
+ */
+#define DO_2OP_SAT_SCALAR_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN, SATMASK) \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn;                                                   \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        bool qc = false;                                                \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE r = FN((LTYPE)n[H##ESIZE(le * 2 + TOP)], m, &sat);    \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+            qc |= sat && (mask & SATMASK);                              \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+static inline int32_t do_qdmullh(int16_t n, int16_t m, bool *sat)
+{
+    int64_t r = ((int64_t)n * m) * 2;
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat);
+}
+
+static inline int64_t do_qdmullw(int32_t n, int32_t m, bool *sat)
+{
+    /* The multiply can't overflow, but the doubling might */
+    int64_t r = (int64_t)n * m;
+    if (r > INT64_MAX / 2) {
+        *sat = true;
+        return INT64_MAX;
+    } else if (r < INT64_MIN / 2) {
+        *sat = true;
+        return INT64_MIN;
+    } else {
+        return r * 2;
+    }
+}
+
+#define SATMASK16B 1
+#define SATMASK16T (1 << 2)
+#define SATMASK32 ((1 << 4) | 1)
+
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarh, 0, 2, int16_t, 4, int32_t, \
+                    do_qdmullh, SATMASK16B)
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarw, 0, 4, int32_t, 8, int64_t, \
+                    do_qdmullw, SATMASK32)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, 2, int16_t, 4, int32_t, \
+                    do_qdmullh, SATMASK16T)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, 4, int32_t, 8, int64_t, \
+                    do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ec0900e9f69..eb69084c183 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -454,6 +454,36 @@ DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
+static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
+{
+    static MVEGenTwoOpScalarFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullb_scalarh,
+        gen_helper_mve_vqdmullb_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
+{
+    static MVEGenTwoOpScalarFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullt_scalarh,
+        gen_helper_mve_vqdmullt_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1


