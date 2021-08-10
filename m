Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58E3DA28C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:55:24 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94dH-00079i-ON
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941b-0001QY-GJ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-0001TM-61
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id b7so6456518wri.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XkZ/M1G+THrDlmqrCgDLQ+Zh1oSvNMXSv94gr49fYtc=;
 b=rtHNOSokLA8O5zBaYcAJ706IaGOPtRtKB8qEQCm/lbzm8zRHqwjRnsi+Cv9v0E/hnd
 jvBCK5WZGhpvohQQJe43cZRDSHPBOIZCzSinso+S50uJg9erueW2hVoV+BIP/HG9JLQt
 yZxdqLnoxpk947RKLtsVRmmZLnsEV2HcNjE+U1mgWxlbP7XnS71mKUF1xOm1ClxVpx1x
 GArQ+e6DNSrbbgWGko5ap5RbPJ8MST3Cm81nflBb3OlitRTaLiW4einbijV9E8SAk7g+
 U4mueMPlBW1dLxjJlF4mFimJ+hXaGH63g/jcTCNUcZsGxuS76HC+7BVKCSbMdwCyRxhW
 wD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XkZ/M1G+THrDlmqrCgDLQ+Zh1oSvNMXSv94gr49fYtc=;
 b=MJBTt9790ms5+05uzgr4eoRjzWlIJWj+NYaWdLF171U3LfweCWH5ErZda1JUFf16jj
 gQJxYov4VpkJgdaegV53Ly1ZaON6lvr9KYQJ6h4G/Tol8GlVj82oR52eMQYeyq5SgWa4
 hCoxltr0vI7QU5bClSz+K04SbU3upsn16qvaHm4+iOzkDwjw9ZRgN0BLD4SvAj44QG4t
 bhQX37os3RveUoCp84iN2gb/saytUWnMIUDRWYRNob4Hb35VD6+Y4H0fLPaIYR7zJu0d
 7NNaJ+SXKw8zZoDcr5vv8T2JHfCIRuJxCzWO5E6m8pi2UMtR4P26So5s9JTuyyAEe8lW
 A0mw==
X-Gm-Message-State: AOAM532F6kRWaViXtmWYhUPrxMcKvb1x0leMYHLz58eyfdICxmBL6aIg
 e72si7AHAItrlQuqEu2d/Ukr41emHaUeIw==
X-Google-Smtp-Source: ABdhPJzbvOYKDux75XycHwaqng4bUYXR2jlXhuTP2s0hjlpBS5xlcrz3TypTMFpLEW2xeGGCxeJ8iw==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr2822447wrz.405.1627557354932; 
 Thu, 29 Jul 2021 04:15:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 48/53] target/arm: Implement MVE VCVT between floating
 and fixed point
Date: Thu, 29 Jul 2021 12:15:07 +0100
Message-Id: <20210729111512.16541-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Implement the MVE VCVT insns which convert between floating and fixed
point.  As with the Neon equivalents, these use essentially the same
constant encoding as right-shift-by-immediate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index aa113279dc5..d9fcc42d36d 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -771,3 +771,22 @@ VCMLA0            1111 110 00 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_
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
index 0aeccc12d69..8e1184db3b4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3263,3 +3263,39 @@ DO_VCMP_FP_BOTH(vfcmpgts, vfcmpgt_scalars, 4, uint32_t, DO_GT32)
 
 DO_VCMP_FP_BOTH(vfcmpleh, vfcmple_scalarh, 2, uint16_t, !DO_GT16)
 DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, uint32_t, !DO_GT32)
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


