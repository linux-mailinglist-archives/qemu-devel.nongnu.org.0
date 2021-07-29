Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68FF3DA289
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:54:35 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94cU-00045m-QI
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941Z-0001MV-Lf
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-0001Ug-5z
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d8so6457495wrm.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/oEQZ2222tqM0a4cMKBeNUf6j4gK7g7+B5zZA/0EG9I=;
 b=e/jn0Y4tVLANZeLl8hOFxumPzKGBUvJO6WOhn8R4yPqKs2sBWaeOZH30WLmM5DCsCl
 w2pIL5sftu5U1xRUy0I0vTn47giJFxFXNRe0PaLAvtpJCeDSJKPVNBcDTJc/2UKEo/V5
 widh6y/YDMggu+zsJeysNiam0v9Kw/8/AfnLl8TzdRKG967c+Wxj7ilJnk3OqzMv3jL7
 ZvXtU9ZOoDZidhPTapOvAygD5eErBEiNXDTrptX4lehEqUFv/METKsJo+4LImb64U1O7
 nguNigAVU619i8btG0rIwWtAXHO1uxaabDQCC0MIsov58HqLBoCsNT/K2JOQuWERUxjs
 xPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/oEQZ2222tqM0a4cMKBeNUf6j4gK7g7+B5zZA/0EG9I=;
 b=NpCZf7DIw01K9JP0Eh2QlT02hiTqUbOoawsHtHO7dYstnE5nBOcuCRBCoNotnSlzoo
 tI8YH/AjFUEcokZcFzx2XlXq3masfXbmI+4Ua9dltN2vEKDqeeJg+Bh2p1Jv/J8AaMWo
 Ak7U4E3FvhpsRlZ2jyCFz/sGaSl/ki5coq/2HNxjYs8DG7MCx0uEjgJdoO+zEgjtZGTV
 8AkPhtOXIRPYMNgN3OPgQmlJmlP7xv7QYTfXZB/bOJnkMetG5XjrG6QW1k0Bj/cVK4Cj
 BJfrWZkUN5w8HWuMa9H4z5aIuOrvUBHxuGbR5/dmrZKcqivGfsxXrQz6DVg3vYlwQQYB
 yOtQ==
X-Gm-Message-State: AOAM533ddSUuTknR51HnkUq91gnzyZjcA1gf07nvbxbivEKkn02gS8Pb
 yGxQ82M0iu42hldanhmwz8K1Mg==
X-Google-Smtp-Source: ABdhPJws55HduM6WOFvByUKcydlN+t9N4B0xIEWz1wgFRgbAXKGvf7polBxLJwSYZs2pNI53JJ1FRA==
X-Received: by 2002:adf:8169:: with SMTP id 96mr4213795wrm.424.1627557356482; 
 Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 50/53] target/arm: Implement MVE VCVT with specified
 rounding mode
Date: Thu, 29 Jul 2021 12:15:09 +0100
Message-Id: <20210729111512.16541-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VCVT which converts from floating-point to integer
using a rounding mode specified by the instruction.  We implement
this similarly to the Neon equivalents, by passing the required
rounding mode as an extra integer parameter to the helper functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 ++++
 target/arm/mve.decode      | 10 ++++++++
 target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 52 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f3c2b43bf43..6d4052a5269 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,11 @@ DEF_HELPER_FLAGS_3(mve_vminab, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vminah, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vminaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_ss, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vcvt_rm_us, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 9a40ff9f43c..410ea746fcf 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -797,3 +797,13 @@ VCVT_SF           1111 1111 1 . 11 .. 11 ... 0 011 00 1 . 0 ... 0 @1op
 VCVT_UF           1111 1111 1 . 11 .. 11 ... 0 011 01 1 . 0 ... 0 @1op
 VCVT_FS           1111 1111 1 . 11 .. 11 ... 0 011 10 1 . 0 ... 0 @1op
 VCVT_FU           1111 1111 1 . 11 .. 11 ... 0 011 11 1 . 0 ... 0 @1op
+
+# VCVT from floating point to integer with specified rounding mode
+VCVTAS            1111 1111 1 . 11 .. 11 ... 000 00 0 1 . 0 ... 0 @1op
+VCVTAU            1111 1111 1 . 11 .. 11 ... 000 00 1 1 . 0 ... 0 @1op
+VCVTNS            1111 1111 1 . 11 .. 11 ... 000 01 0 1 . 0 ... 0 @1op
+VCVTNU            1111 1111 1 . 11 .. 11 ... 000 01 1 1 . 0 ... 0 @1op
+VCVTPS            1111 1111 1 . 11 .. 11 ... 000 10 0 1 . 0 ... 0 @1op
+VCVTPU            1111 1111 1 . 11 .. 11 ... 000 10 1 1 . 0 ... 0 @1op
+VCVTMS            1111 1111 1 . 11 .. 11 ... 000 11 0 1 . 0 ... 0 @1op
+VCVTMU            1111 1111 1 . 11 .. 11 ... 000 11 1 1 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8e1184db3b4..4e0d979e643 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3299,3 +3299,41 @@ DO_VCVT_FIXED(vcvt_sf, 4, int32_t, helper_vfp_sltos)
 DO_VCVT_FIXED(vcvt_uf, 4, uint32_t, helper_vfp_ultos)
 DO_VCVT_FIXED(vcvt_fs, 4, int32_t, helper_vfp_tosls_round_to_zero)
 DO_VCVT_FIXED(vcvt_fu, 4, uint32_t, helper_vfp_touls_round_to_zero)
+
+/* VCVT with specified rmode */
+#define DO_VCVT_RMODE(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vm, uint32_t rmode)     \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        float_status *base_fpst = (ESIZE == 2) ?                        \
+            &env->vfp.standard_fp_status_f16 :                          \
+            &env->vfp.standard_fp_status;                               \
+        uint32_t prev_rmode = get_float_rounding_mode(base_fpst);       \
+        set_float_rounding_mode(rmode, base_fpst);                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = base_fpst;                                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(m[H##ESIZE(e)], 0, fpst);                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        set_float_rounding_mode(prev_rmode, base_fpst);                 \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCVT_RMODE(vcvt_rm_sh, 2, uint16_t, helper_vfp_toshh)
+DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
+DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
+DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 351033af1ec..e80a55eb62e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -49,6 +49,7 @@ typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenVCVTRmodeFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -575,6 +576,57 @@ DO_VCVT(VCVT_UF, vcvt_uh, vcvt_uf)
 DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
 DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
 
+static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
+                          enum arm_fprounding rmode, bool u)
+{
+    /*
+     * Handle VCVT fp to int with specified rounding mode.
+     * This is a 1op fn but we must pass the rounding mode as
+     * an immediate to the helper.
+     */
+    TCGv_ptr qd, qm;
+    static MVEGenVCVTRmodeFn * const fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vcvt_rm_sh, gen_helper_mve_vcvt_rm_uh },
+        { gen_helper_mve_vcvt_rm_ss, gen_helper_mve_vcvt_rm_us },
+        { NULL, NULL },
+    };
+    MVEGenVCVTRmodeFn *fn = fns[a->size][u];
+
+    if (!dc_isar_feature(aa32_mve_fp, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, tcg_constant_i32(arm_rmode_to_sf(rmode)));
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_VCVT_RMODE(INSN, RMODE, U)                           \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        return do_vcvt_rmode(s, a, RMODE, U);                   \
+    }                                                           \
+
+DO_VCVT_RMODE(VCVTAS, FPROUNDING_TIEAWAY, false)
+DO_VCVT_RMODE(VCVTAU, FPROUNDING_TIEAWAY, true)
+DO_VCVT_RMODE(VCVTNS, FPROUNDING_TIEEVEN, false)
+DO_VCVT_RMODE(VCVTNU, FPROUNDING_TIEEVEN, true)
+DO_VCVT_RMODE(VCVTPS, FPROUNDING_POSINF, false)
+DO_VCVT_RMODE(VCVTPU, FPROUNDING_POSINF, true)
+DO_VCVT_RMODE(VCVTMS, FPROUNDING_NEGINF, false)
+DO_VCVT_RMODE(VCVTMU, FPROUNDING_NEGINF, true)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1


