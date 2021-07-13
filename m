Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D574A3C7179
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:51:26 +0200 (CEST)
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ion-00075e-TC
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibc-0008WC-Hf
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:50 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbW-0003gt-5c
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so10392wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OFf9oyydDstmZq6qaETKxiNX7dyXcqTKjvBd2TGqcCg=;
 b=O9kRsFXnEAJHqORufnkpz7G44qE+kL5p71wZdi6JOdYHi6CZWDdj74oiBUvqVdrYN1
 GJiBn26lWGT8Fq4Q/Vg45bvw3J8cKYz8srz4aopElmKvv1yxPHmxFqlSYnkuQECjWTSv
 hrO5TJZHC4a7B0QJ/kgI79WCs8jYUv+pYa/QPK/6NtHnNw9EFsBI3OF2/NcHncnnKk/U
 +eNIq+o73lPQlQtpB5iBYr2GD/PyK7vtGwEuDFmz8nlcq5NrTNq/TZv+7V+N7xlHeWD7
 Fj2OBSqdfSQ94n5EBdiPxZLUFh5DndqOAQz7nCSS14exLASXMH3rQSqkqCHcAMYkQ/Ff
 x2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFf9oyydDstmZq6qaETKxiNX7dyXcqTKjvBd2TGqcCg=;
 b=BzcvgeyFCVDsWTHEyLfb7y+SwVI1UT+Q0s/DM+m80PypDYJOWOjIqZH2lqqwZp6c1F
 Ja3ZxR/nhwPATVbFrfi6mAEVQbBFwExCePQNonCiKI08QtXxE+/ykEbkxJxijXIt8IpL
 TVNlqmV+sSBNhdJVXNfediAai6vKXGTkRECcfqPW/uMtnrF6GLa10dQsWb+gbd18FJX6
 RNyOc6DaNwSEOTD12ha7GNi+mpyatIUzRq8SAPY7QGIPcjCElymY79XT3rh9LbeDlkQ/
 K9OdBtR1/foCnPTTYlnbMd+uxfLQvOE+ov0PQjHw+3dTSiMd2NRIFs9PFK38u9FlbZ89
 HQQg==
X-Gm-Message-State: AOAM533jil3Z3tLCDrIAKRSK8hl4Sk+lO5niOKMfn/u8mw1mKfoDWKNP
 T+tQi8ZpqdfblLU3fKY5kt0Yb3eDkVqujOf3
X-Google-Smtp-Source: ABdhPJzO4iXc9BsLBJtQGlhNTb0y4/ttrK+n1enGh29rOlav3r+c8RoyB6g4I0W8OQlv62q81Ni22Q==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr5104371wmi.179.1626183460742; 
 Tue, 13 Jul 2021 06:37:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 15/34] target/arm: Implement MVE integer
 vector-vs-scalar comparisons
Date: Tue, 13 Jul 2021 14:37:07 +0100
Message-Id: <20210713133726.26842-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE integer vector comparison instructions that compare
each element against a scalar from a general purpose register.  These
are "VCMP (vector)" encodings T4, T5 and T6 and "VPT (vector)"
encodings T4, T5 and T6.

We have to move the decodetree pattern for VPST, because it
overlaps with VCMP T4 with size = 0b11.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 32 +++++++++++++++++++++++++++
 target/arm/mve.decode      | 18 +++++++++++++---
 target/arm/mve_helper.c    | 44 +++++++++++++++++++++++++++++++-------
 target/arm/translate-mve.c | 43 +++++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e89238eac9d..035779b0576 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -516,3 +516,35 @@ DEF_HELPER_FLAGS_3(mve_vcmpgtw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmpleb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmplew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 76bbf9a6136..ef708ba80ff 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -38,6 +38,7 @@
 &vidup qd rn size imm
 &viwdup qd rn rm size imm
 &vcmp qm qn size mask
+&vcmp_scalar qn rm size mask
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -90,6 +91,8 @@
 # Vector comparison; 4-bit Qm but 3-bit Qn
 %mask_22_13      22:1 13:3
 @vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
+@vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
+             mask=%mask_22_13
 
 # Vector loads and stores
 
@@ -349,9 +352,6 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
                  rdahi=%rdahi rdalo=%rdalo
 }
 
-# Predicate operations
-VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
-
 # Logical immediate operations (1 reg and modified-immediate)
 
 # The cmode/op bits here decode VORR/VBIC/VMOV/VMVN, but
@@ -474,3 +474,15 @@ VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
 VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
 VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
 VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
+
+{
+  VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
+  VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
+}
+VCMPNE_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 0 0 .... @vcmp_scalar
+VCMPCS_scalar     1111 1110 0 . .. ... 1 ... 0 1111 0 1 1 0 .... @vcmp_scalar
+VCMPHI_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 1 0 .... @vcmp_scalar
+VCMPGE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 0 0 .... @vcmp_scalar
+VCMPLT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 0 0 .... @vcmp_scalar
+VCMPGT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 1 0 .... @vcmp_scalar
+VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 23398e86f7d..57a92bc6841 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1791,15 +1791,43 @@ DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
         mve_advance_vpt(env);                                           \
     }
 
-#define DO_VCMP_S(OP, FN)                       \
-    DO_VCMP(OP##b, 1, int8_t, FN)               \
-    DO_VCMP(OP##h, 2, int16_t, FN)              \
-    DO_VCMP(OP##w, 4, int32_t, FN)
+#define DO_VCMP_SCALAR(OP, ESIZE, TYPE, FN)                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,             \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *n = vn;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            bool r = FN(n[H##ESIZE(e)], (TYPE)rm);                      \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+            emask <<= ESIZE;                                            \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
 
-#define DO_VCMP_U(OP, FN)                       \
-    DO_VCMP(OP##b, 1, uint8_t, FN)              \
-    DO_VCMP(OP##h, 2, uint16_t, FN)             \
-    DO_VCMP(OP##w, 4, uint32_t, FN)
+#define DO_VCMP_S(OP, FN)                               \
+    DO_VCMP(OP##b, 1, int8_t, FN)                       \
+    DO_VCMP(OP##h, 2, int16_t, FN)                      \
+    DO_VCMP(OP##w, 4, int32_t, FN)                      \
+    DO_VCMP_SCALAR(OP##_scalarb, 1, int8_t, FN)         \
+    DO_VCMP_SCALAR(OP##_scalarh, 2, int16_t, FN)        \
+    DO_VCMP_SCALAR(OP##_scalarw, 4, int32_t, FN)
+
+#define DO_VCMP_U(OP, FN)                               \
+    DO_VCMP(OP##b, 1, uint8_t, FN)                      \
+    DO_VCMP(OP##h, 2, uint16_t, FN)                     \
+    DO_VCMP(OP##w, 4, uint32_t, FN)                     \
+    DO_VCMP_SCALAR(OP##_scalarb, 1, uint8_t, FN)        \
+    DO_VCMP_SCALAR(OP##_scalarh, 2, uint16_t, FN)       \
+    DO_VCMP_SCALAR(OP##_scalarw, 4, uint32_t, FN)
 
 #define DO_EQ(N, M) ((N) == (M))
 #define DO_NE(N, M) ((N) != (M))
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a7334609e29..f8b8639eab7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -44,6 +44,7 @@ typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1207,6 +1208,37 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
     return true;
 }
 
+static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
+                           MVEGenScalarCmpFn *fn)
+{
+    TCGv_ptr qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !fn || a->rm == 13) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    if (a->rm == 15) {
+        /* Encoding Rm=0b1111 means "constant zero" */
+        rm = tcg_constant_i32(0);
+    } else {
+        rm = load_reg(s, a->rm);
+    }
+    fn(cpu_env, qn, rm);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_i32(rm);
+    if (a->mask) {
+        /* VPT */
+        gen_vpst(s, a->mask);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
 #define DO_VCMP(INSN, FN)                                       \
     static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
     {                                                           \
@@ -1217,6 +1249,17 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
             NULL,                                               \
         };                                                      \
         return do_vcmp(s, a, fns[a->size]);                     \
+    }                                                           \
+    static bool trans_##INSN##_scalar(DisasContext *s,          \
+                                      arg_vcmp_scalar *a)       \
+    {                                                           \
+        static MVEGenScalarCmpFn * const fns[] = {              \
+            gen_helper_mve_##FN##_scalarb,                      \
+            gen_helper_mve_##FN##_scalarh,                      \
+            gen_helper_mve_##FN##_scalarw,                      \
+            NULL,                                               \
+        };                                                      \
+        return do_vcmp_scalar(s, a, fns[a->size]);              \
     }
 
 DO_VCMP(VCMPEQ, vcmpeq)
-- 
2.20.1


