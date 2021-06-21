Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3233D3AF068
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:48:26 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN61-00022y-50
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnB-00079I-Gs
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:57 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn1-0007YV-PP
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so3855351wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/M+Pmtv7hNap4L2ZArgSyv3ozm9BCFab40Fmf0jm35E=;
 b=dET2VlDaFwN/XxCtrNcGArI56K73/AD19EuqoGOgwEdV6PVHFnUplLEAV3YmA3n8MF
 zOF3dYi8G+FYy1mUP8mSHgVQOpsHc2DKg9t0zF6p1rDZKrUve3L3vpxw4x5Bbx8igBvB
 O/uApv9jeRhyQaVBUeJiyHYFTWCXcdnMx0CAha/zvdsE5fCih2iRSDzvO45MM+W7O46c
 RxjAfedbl5tcBLRmphwkgieDjqcE25vI1K+a8aLMUGlelWQGXbArIdOkNG3xCK5Cl9la
 Htyv0E6ndnoZJnFlof9XSw0LYaCFkIXdR+HBDe0mzFtn39KFSKE20gclgixvC0WHymZ8
 /naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/M+Pmtv7hNap4L2ZArgSyv3ozm9BCFab40Fmf0jm35E=;
 b=KQ+3S/qWBbT5pYtV2JWFuW40JFLtrSP506mY37iNYJS6D1P0zQc5ozRIofaB254Sbd
 5AOE/MohFJk0LKlUpjO/AS83Ydv3B7wKmkU+4+LF8XTxQnSdbRYQfNYhjGe/8ZEVAfxI
 xK4uAjgPMlyv1aeTdz+cmwsT9g9aU/dpySshfwjS4qvyKFdYQJwi9qKPT4WcbZvEoQUV
 M1hD2FIjszyydhUc5v1JD8u9W9afuHtHqdYpZnzSydLy5UTG/WIlx2yt4VWARrQqAjvJ
 ey0vbbovIN5NNRDVpTc6pP8XjORHIBYobrPojVfHSLe+0L6YlUhGyHsqVE82Yk0PIvXt
 F7Cw==
X-Gm-Message-State: AOAM530TWqbbC/RC6zalLE5PPDUqwYkH+FxYlqmPBH4US/y9XxeC3UIR
 tFba4Go30qd3i8zcDRXmw/qIeOgC7lUjl/T7
X-Google-Smtp-Source: ABdhPJyLWHLquWq38pGklAj17OaY4idS3aM88iWJehGeiFM0M7z2Xumjb9MnivzSkE8Nhsk7othIEQ==
X-Received: by 2002:a1c:f014:: with SMTP id a20mr27805180wmb.67.1624292926465; 
 Mon, 21 Jun 2021 09:28:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/57] target/arm: Implement MVE VCLZ
Date: Mon, 21 Jun 2021 17:27:50 +0100
Message-Id: <20210621162833.32535-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Implement the MVE VCLZ insn (and the necessary machinery
for MVE 1-input vector ops).

Note that for non-load instructions predication is always performed
at a byte level granularity regardless of element size (R_ZLSJ),
and so the masking logic here differs from that used in the VLDR
and VSTR helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-4-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  4 ++
 target/arm/mve.decode      |  8 ++++
 target/arm/mve_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 38 ++++++++++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e47d4164ae7..c5c1315b161 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -32,3 +32,7 @@ DEF_HELPER_FLAGS_3(mve_vldrh_uw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3bc5f034531..24999bf703e 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -20,13 +20,17 @@
 #
 
 %qd 22:1 13:3
+%qm 5:1 1:3
 
 &vldr_vstr rn qd imm p a w size l u
+&1op qd qm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
+@1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -61,3 +65,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
                  size=1 p=1
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
+
+# Vector miscellaneous
+
+VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3c2b036c9ca..f2fae523e24 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -181,3 +181,85 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 
 #undef DO_VLDR
 #undef DO_VSTR
+
+/*
+ * The mergemask(D, R, M) macro performs the operation "*D = R" but
+ * storing only the bytes which correspond to 1 bits in M,
+ * leaving other bytes in *D unchanged. We use _Generic
+ * to select the correct implementation based on the type of D.
+ */
+
+static void mergemask_ub(uint8_t *d, uint8_t r, uint16_t mask)
+{
+    if (mask & 1) {
+        *d = r;
+    }
+}
+
+static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
+{
+    mergemask_ub((uint8_t *)d, r, mask);
+}
+
+static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
+{
+    uint16_t bmask = expand_pred_b_data[mask & 3];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
+{
+    mergemask_uh((uint16_t *)d, r, mask);
+}
+
+static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
+{
+    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
+{
+    mergemask_uw((uint32_t *)d, r, mask);
+}
+
+static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
+{
+    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sq(int64_t *d, int64_t r, uint16_t mask)
+{
+    mergemask_uq((uint64_t *)d, r, mask);
+}
+
+#define mergemask(D, R, M)                      \
+    _Generic(D,                                 \
+             uint8_t *: mergemask_ub,           \
+             int8_t *:  mergemask_sb,           \
+             uint16_t *: mergemask_uh,          \
+             int16_t *:  mergemask_sh,          \
+             uint32_t *: mergemask_uw,          \
+             int32_t *:  mergemask_sw,          \
+             uint64_t *: mergemask_uq,          \
+             int64_t *:  mergemask_sq)(D, R, M)
+
+#define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_CLZ_B(N)   (clz32(N) - 24)
+#define DO_CLZ_H(N)   (clz32(N) - 16)
+
+DO_1OP(vclzb, 1, uint8_t, DO_CLZ_B)
+DO_1OP(vclzh, 2, uint16_t, DO_CLZ_H)
+DO_1OP(vclzw, 4, uint32_t, clz32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4cabdf7a69b..9eb6a68c976 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -29,6 +29,7 @@
 #include "decode-mve.c.inc"
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -160,3 +161,40 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
 DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
+
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
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
+    fn(cpu_env, qd, qm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_1OP(INSN, FN)                                        \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        static MVEGenOneOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_1op(s, a, fns[a->size]);                      \
+    }
+
+DO_1OP(VCLZ, vclz)
-- 
2.20.1


