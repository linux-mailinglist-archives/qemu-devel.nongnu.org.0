Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A493F739D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:48:04 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqRv-0002Ud-2h
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG9-0003Nf-5I
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:53 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG6-0005Nc-3m
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3936553wme.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ByVPvCjeaXnuNCmNSTqYK/dafUjEZDazMD4qmT4NIMQ=;
 b=CIMGSWwoMZViRx0riKi8S677WRw+NJgjvCt5NiRwEo1x1fwgDouVvCY1Gb2d+2/b3S
 QfKUvJF/hJEmkz1R7c+2RKvBIQxRZPnvQnAGYF8qAiWADYDail8nS9I2bIlqM/Vg0XCw
 tQmwbrrBNg8lThGfdrZg9YWV/ujMFZdTaI7Zp8MDJODCq5vj9J+GwMCoctZwGFlgV42L
 +yMATJPKqy6W4wUY+Dofr3KxSdm7lKg5xaF1oabB9mpxGZdf5hYBMR1dcU6tjngoiXS1
 oeSkHqzIG2QPzGr15d5602IKBYzO4qiBsiomXOfursh5b+hNzDcKjbfKoe2HX4Irf44O
 tJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByVPvCjeaXnuNCmNSTqYK/dafUjEZDazMD4qmT4NIMQ=;
 b=Tl4LgbxwPo/P49jRIWENMWvSh8gY1v9bVyfwoBzodBKKCjmblyq52ye+bGc9dDXU9n
 iWQh8mV+aC7qLJU5JR5VhgPro0P/39AdZ+AEeicyNt/jsxvwfrjSCoQBcxhaqEI7GJZM
 4J7Prgl2DIB0SuQAhh7RLx48ZxFl9afhqEHmqMnHge53GW46cxsW5kH91yUf9n72jiWf
 Phz975/c5ZUSn5KcIiz8h4oMOYjV1/pU0e9/R3LiiQVhtHPvxOouGCUKwQfME5tRciHD
 rKGWy3agk19EPxa2B+w/GsWjUIh6yCvHnZrSb85N6EknK0tVldvmS4DLX3FnhO3lRKr+
 /PQA==
X-Gm-Message-State: AOAM533mlWqufDrT4WbvbJClfZdEKWqwnLUs9fT4K9SIpROEcRBX32fO
 BDSZeim8n7f0W901fv9x4xQnKYHYDHEkdQ==
X-Google-Smtp-Source: ABdhPJzi+79glYI+GRSMGAEefIVVbanbOPmNQDXr6YXTVY/RGmGfFWXWMG51DwhnkJzDJlIULR5iHQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr8393553wmb.53.1629887748549;
 Wed, 25 Aug 2021 03:35:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/44] target/arm: Implement MVE integer vector comparisons
Date: Wed, 25 Aug 2021 11:35:05 +0100
Message-Id: <20210825103534.6936-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Implement the MVE integer vector comparison instructions.  These are
"VCMP (vector)" encodings T1, T2 and T3, and "VPT (vector)" encodings
T1, T2 and T3.

These insns compare corresponding elements in each vector, and update
the VPR.P0 predicate bits with the results of the comparison.  VPT
also sets the VPR.MASK01 and VPR.MASK23 fields -- it is effectively
"VCMP then VPST".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 32 ++++++++++++++++++++++
 target/arm/mve.decode      | 18 +++++++++++-
 target/arm/mve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 47 ++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b9af03cc03b..ca5a6ab51cc 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -480,3 +480,35 @@ DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_uqrshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqrshr, TCG_CALL_NO_RWG, i32, env, i32, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpeqb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpeqw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpneb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpneh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpnew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpcsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpcsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmphib, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphih, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmphiw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgeb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgeh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpltb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpltw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgtb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpgtw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpleb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcmplew, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 88c9c18ebf1..76bbf9a6136 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -37,6 +37,7 @@
 &2shift qd qm shift size
 &vidup qd rn size imm
 &viwdup qd rn rm size imm
+&vcmp qm qn size mask
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -86,6 +87,10 @@
 @2_shr_w .... .... .. 1 ..... .... .... .... .... &2shift qd=%qd qm=%qm \
          size=2 shift=%rshift_i5
 
+# Vector comparison; 4-bit Qm but 3-bit Qn
+%mask_22_13      22:1 13:3
+@vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -345,7 +350,6 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
 # Predicate operations
-%mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
 
 # Logical immediate operations (1 reg and modified-immediate)
@@ -458,3 +462,15 @@ VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
 VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
 
 VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
+
+# Comparisons. We expand out the conditions which are split across
+# encodings T1, T2, T3 and the fc bits. These include VPT, which is
+# effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
+VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
+VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
+VCMPCS            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
+VCMPHI            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
+VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
+VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
+VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
+VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 38b4181db2a..b0b380b94b0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1758,3 +1758,59 @@ static uint32_t do_sub_wrap(uint32_t offset, uint32_t wrap, uint32_t imm)
 DO_VIDUP_ALL(vidup, DO_ADD)
 DO_VIWDUP_ALL(viwdup, do_add_wrap)
 DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
+
+/*
+ * Vector comparison.
+ * P0 bits for non-executed beats (where eci_mask is 0) are unchanged.
+ * P0 bits for predicated lanes in executed beats (where mask is 0) are 0.
+ * P0 bits otherwise are updated with the results of the comparisons.
+ * We must also keep unchanged the MASK fields at the top of v7m.vpr.
+ */
+#define DO_VCMP(OP, ESIZE, TYPE, FN)                                    \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, void *vm)   \
+    {                                                                   \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            bool r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)]);                \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+            emask <<= ESIZE;                                            \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMP_S(OP, FN)                       \
+    DO_VCMP(OP##b, 1, int8_t, FN)               \
+    DO_VCMP(OP##h, 2, int16_t, FN)              \
+    DO_VCMP(OP##w, 4, int32_t, FN)
+
+#define DO_VCMP_U(OP, FN)                       \
+    DO_VCMP(OP##b, 1, uint8_t, FN)              \
+    DO_VCMP(OP##h, 2, uint16_t, FN)             \
+    DO_VCMP(OP##w, 4, uint32_t, FN)
+
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_NE(N, M) ((N) != (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_EQ(N, M) ((N) == (M))
+#define DO_GE(N, M) ((N) >= (M))
+#define DO_LT(N, M) ((N) < (M))
+#define DO_GT(N, M) ((N) > (M))
+#define DO_LE(N, M) ((N) <= (M))
+
+DO_VCMP_U(vcmpeq, DO_EQ)
+DO_VCMP_U(vcmpne, DO_NE)
+DO_VCMP_U(vcmpcs, DO_GE)
+DO_VCMP_U(vcmphi, DO_GT)
+DO_VCMP_S(vcmpge, DO_GE)
+DO_VCMP_S(vcmplt, DO_LT)
+DO_VCMP_S(vcmpgt, DO_GT)
+DO_VCMP_S(vcmple, DO_LE)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6d8da361469..2d7211b5271 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -43,6 +43,7 @@ typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1182,3 +1183,49 @@ static bool trans_VDWDUP(DisasContext *s, arg_viwdup *a)
     };
     return do_viwdup(s, a, fns[a->size]);
 }
+
+static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
+{
+    TCGv_ptr qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qn, qm);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    if (a->mask) {
+        /* VPT */
+        gen_vpst(s, a->mask);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VCMP(INSN, FN)                                       \
+    static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
+    {                                                           \
+        static MVEGenCmpFn * const fns[] = {                    \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_vcmp(s, a, fns[a->size]);                     \
+    }
+
+DO_VCMP(VCMPEQ, vcmpeq)
+DO_VCMP(VCMPNE, vcmpne)
+DO_VCMP(VCMPCS, vcmpcs)
+DO_VCMP(VCMPHI, vcmphi)
+DO_VCMP(VCMPGE, vcmpge)
+DO_VCMP(VCMPLT, vcmplt)
+DO_VCMP(VCMPGT, vcmpgt)
+DO_VCMP(VCMPLE, vcmple)
-- 
2.20.1


