Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B743FD84B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:59:02 +0200 (CEST)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNxN-0003u6-Ot
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcH-00072K-Gy
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcD-0005km-QO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n5so3688326wro.12
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oPfkL3Cu9SyMP90dfWKppbYc+M39u0zDP8KCQ6gbCQY=;
 b=mhlCZKiVnADvhHvbJ/4F4+R7Ho+wcsdaZWys/OLwUephcsuPl0wf1CD0nWJE0c8o2a
 vjoZcsmzFU+cIXbK3xpwkIsSZhWn2vyIOjvlC7BM7XkWYL2NMyiieJYhA8MODMOCgbYj
 eCACoA/cS/he5fFycRiJEsGWJi/+MQX5WxLSDjSssTmV5hv7dal+8ll58w9WcsNxFjLd
 qSYbVoP9+fwUjTGMOEjtnPnTwGyglUGL9xMjoWUTDuM/QSRDyTWOPs17lLbTB2rskHMW
 E4qnEswRzt0R9GFixGVz4H2e5RzpCcKCGtdJv/0w+9PaVH4vowqPZ2LiYJc9rKkPooY7
 nqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPfkL3Cu9SyMP90dfWKppbYc+M39u0zDP8KCQ6gbCQY=;
 b=QI1TowNziX3hiHHwi3LU0rKF5BL78T33fWravkWeFuU66xak1AKeJv6CBiGB6JNpuI
 8WuxNbAaO2ZxUeFqirAGxgdxASJYbhmvAeF6B4ZKQX3n8Y60L8r351C77nzded32PfS3
 WhiNbP1jsZ2W97XzaLkB96FYQQ2FIrYRKm8ccWeN+AJG03IfNcvfg1KwvGLJZ/gaUBJU
 gx7GB34q7XQpqyR4vMdjU/bfBnS2p+rRZhSqBkUrcTiHlW64B5yNSbPH5qn5AL6LL+hS
 RHh+aBSklZPQbP4jNgM48oyiq6W/XoK2aVIQgMAxykBXUOzVXLtCEB/0EcsYbxG3jmDe
 0Htw==
X-Gm-Message-State: AOAM532vB/PAeb3Iv+HzvovtVB6txU+ulheQF+pwwCM3p37oOMtP52cE
 87D4MifbhiS5Hi39FDT36/zm+dXAQ8Bq0w==
X-Google-Smtp-Source: ABdhPJy1XsGeqpJ6aO63iP16Kqf4/EjQHNPn6cpALTse6h2EMANuK/qY+oAQ55mxKbZsbKwhU2zgQg==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr34860772wrr.376.1630492628376; 
 Wed, 01 Sep 2021 03:37:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/51] target/arm: Implement MVE VCVT between floating and
 fixed point
Date: Wed,  1 Sep 2021 11:36:20 +0100
Message-Id: <20210901103653.13435-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the MVE VCVT insns which convert between floating and fixed
point.  As with the Neon equivalents, these use essentially the same
constant encoding as right-shift-by-immediate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  9 +++++++++
 target/arm/mve.decode      | 19 +++++++++++++++++++
 target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 18 ++++++++++++++++++
 4 files changed, 82 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9ee841cdf01..f3c2b43bf43 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -863,3 +863,12 @@ DEF_HELPER_FLAGS_4(mve_vfma_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vfmas_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfmas_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vcvt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_hs, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_hu, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_sf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_uf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_fs, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_fu, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index f1b8afb4778..d93083065d6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -779,3 +779,22 @@ VCMLA0            1111 110 00 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_
 VCMLA90           1111 110 01 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
 VCMLA180          1111 110 10 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
 VCMLA270          1111 110 11 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+
+# floating-point <-> fixed-point conversions. Naming convention:
+# VCVT_<from><to>, S = signed int, U = unsigned int, H = halfprec, F = singleprec
+@vcvt             .... .... .. 1 ..... .... .. 1 . .... .... &2shift \
+                  qd=%qd qm=%qm shift=%rshift_i5 size=2
+@vcvt_f16         .... .... .. 11 .... .... .. 0 . .... .... &2shift \
+                  qd=%qd qm=%qm shift=%rshift_i4 size=1
+
+VCVT_SH_fixed     1110 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt_f16
+VCVT_UH_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt_f16
+
+VCVT_HS_fixed     1110 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt_f16
+VCVT_HU_fixed     1111 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt_f16
+
+VCVT_SF_fixed     1110 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
+VCVT_UF_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
+
+VCVT_FS_fixed     1110 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
+VCVT_FU_fixed     1111 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 891926c124d..d829ffe12d6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3258,3 +3258,39 @@ DO_VCMP_FP_BOTH(vfcmpgts, vfcmpgt_scalars, 4, float32, DO_GT32)
 
 DO_VCMP_FP_BOTH(vfcmpleh, vfcmple_scalarh, 2, float16, !DO_GT16)
 DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, float32, !DO_GT32)
+
+#define DO_VCVT_FIXED(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm,   \
+                                uint32_t shift)                         \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(m[H##ESIZE(e)], shift, fpst);                        \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCVT_FIXED(vcvt_sh, 2, int16_t, helper_vfp_shtoh)
+DO_VCVT_FIXED(vcvt_uh, 2, uint16_t, helper_vfp_uhtoh)
+DO_VCVT_FIXED(vcvt_hs, 2, int16_t, helper_vfp_toshh_round_to_zero)
+DO_VCVT_FIXED(vcvt_hu, 2, uint16_t, helper_vfp_touhh_round_to_zero)
+DO_VCVT_FIXED(vcvt_sf, 4, int32_t, helper_vfp_sltos)
+DO_VCVT_FIXED(vcvt_uf, 4, uint32_t, helper_vfp_ultos)
+DO_VCVT_FIXED(vcvt_fs, 4, int32_t, helper_vfp_tosls_round_to_zero)
+DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e8a3dec6683..9269dbc3324 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1439,6 +1439,24 @@ DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 DO_2SHIFT(VSRI, vsri, false)
 DO_2SHIFT(VSLI, vsli, false)
 
+#define DO_2SHIFT_FP(INSN, FN)                                  \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
+    {                                                           \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2shift(s, a, gen_helper_mve_##FN, false);     \
+    }
+
+DO_2SHIFT_FP(VCVT_SH_fixed, vcvt_sh)
+DO_2SHIFT_FP(VCVT_UH_fixed, vcvt_uh)
+DO_2SHIFT_FP(VCVT_HS_fixed, vcvt_hs)
+DO_2SHIFT_FP(VCVT_HU_fixed, vcvt_hu)
+DO_2SHIFT_FP(VCVT_SF_fixed, vcvt_sf)
+DO_2SHIFT_FP(VCVT_UF_fixed, vcvt_uf)
+DO_2SHIFT_FP(VCVT_FS_fixed, vcvt_fs)
+DO_2SHIFT_FP(VCVT_FU_fixed, vcvt_fu)
+
 static bool do_2shift_scalar(DisasContext *s, arg_shl_scalar *a,
                              MVEGenTwoOpShiftFn *fn)
 {
-- 
2.20.1


