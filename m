Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122D3DA291
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:56:29 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94eK-0001F6-85
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941V-0001KX-U1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9411-0001PT-FC
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n12so6481685wrr.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SmFi3d8a8x239T2bKc1646ktKfQt5s6Sv+V0vxSAgpw=;
 b=gv7A213iGovDwz7W6KSaCkTMfGWEExH81+R76vgJpmqMz8muSlbm3JxiiekQJPbw8i
 DSsm6he15/3KODxE4OznU0tBM40Ij4yr8zAzxl8GqTmO+c2EPg0tujgZyFgVm3vqWPnv
 7133UPhfN9Xs6E7RXeIIZugOWI0R4rzd3Z/2iYsfo7BP7auC+uPdZm+Pv32oqvccS4cx
 Z4KTyVRYvRiqM+BGNG1glsw9k6PZFZ3It2fOz82m1ZnQE82RaETodltKq76xFwNTYNJZ
 3vgn5q87bdrPGP4dm6PKW0OeOnhV/35eOyQVOkyH9w9BGu48F3eIcSRCVqvQc3aPyJlc
 RhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmFi3d8a8x239T2bKc1646ktKfQt5s6Sv+V0vxSAgpw=;
 b=COlkTEF4SgXfIsy/NkK1EcxXv3EBh3iTNjdwu0CK7P4HgTNXDj9VhvUngjLjstEBiw
 eTy105mHP7+iRxv27z0Hbwt2eDafFlSArj8qbg70XFDBNiYFs7TmDr1tMouotgFxqPaQ
 NboZcbbjDncXIsNkvBhd5QNVXJJFbuNrJcQxKM5mEd/RJwnL5Z9LAnSDEflJDLsyKXQ0
 aUUSc8lnLv6P4xA+BNGlsylKuKmVqUPTST5biwOp/euYDoy8UUSPaF/g2J0bu0wViAmB
 feIX1fzifkfiA0Eo+iVt/Uz7Q5olCeQzRnDncdcyTZjYjvSlYJSLGQjhobKWPzmBD4bS
 YeQg==
X-Gm-Message-State: AOAM5323BHZ0GROseNNRhWPQttoFGTHUMR1yy+W/1QY4SNudxRluW7kE
 6ybjGNYbT1+APtDQrUdIlumLeHP0qQ98zw==
X-Google-Smtp-Source: ABdhPJyudSYYLaJnchXrFP/vvwBWftBETz5nAgUBQI+6KEmxgFicWXzkKEajNrJ9td62V7YNy5K5xw==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr4371387wru.71.1627557349837; 
 Thu, 29 Jul 2021 04:15:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 42/53] target/arm: Implement MVE scalar fp insns
Date: Thu, 29 Jul 2021 12:15:01 +0100
Message-Id: <20210729111512.16541-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement the MVE scalar floating point insns VADD, VSUB and VMUL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  9 +++++++++
 target/arm/mve.decode      | 27 +++++++++++++++++++++------
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 20 ++++++++++++++++++++
 4 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 57ab3f7b59f..091ec4b4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -800,3 +800,12 @@ DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfadd_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfsub_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index b0622e1f62c..5ba8b6deeaa 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -31,6 +31,8 @@
 %2op_fp_size 20:1 !function=neon_3same_fp_size
 # VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
 %2op_fp_size_rev 20:1 !function=plus_1
+# FP scalars have size in bit 28, 1 for 16 bit, 0 for 32 bit
+%2op_fp_scalar_size 28:1 !function=neon_3same_fp_size
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -135,6 +137,9 @@
 @vmaxnma  .... .... .... .... .... .... .... .... &2op \
           qd=%qd qn=%qd qm=%qm
 
+@2op_fp_scalar .... .... .... .... .... .... .... rm:4 &2scalar \
+               qd=%qd qn=%qn size=%2op_fp_scalar_size
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -471,10 +476,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VBRSR           1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 }
 
-VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
-VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+{
+  VADD_fp_scalar  111 . 1110 0 . 11 ... 0 ... 0 1111 . 100 .... @2op_fp_scalar
+  VHADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+  VHADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+}
+
+{
+  VSUB_fp_scalar  111 . 1110 0 . 11 ... 0 ... 1 1111 . 100 .... @2op_fp_scalar
+  VHSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+  VHSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+}
 
 {
   VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
@@ -490,8 +502,11 @@ VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
                   size=%size_28
 }
 
-VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
-VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+{
+  VMUL_fp_scalar  111 . 1110 0 . 11 ... 1 ... 0 1110 . 110 .... @2op_fp_scalar
+  VQDMULH_scalar  1110  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+  VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+}
 
 # The U bit (28) is don't-care because it does not affect the result
 VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d44369c15e2..4175bacfaa4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3046,3 +3046,37 @@ DO_VCMLA(vcmla180h, 2, uint16_t, 2, float16_chs, DO_VCMLAH)
 DO_VCMLA(vcmla180s, 4, uint32_t, 2, float32_chs, DO_VCMLAS)
 DO_VCMLA(vcmla270h, 2, uint16_t, 3, float16_chs, DO_VCMLAH)
 DO_VCMLA(vcmla270s, 4, uint32_t, 3, float32_chs, DO_VCMLAS)
+
+#define DO_2OP_FP_SCALAR(OP, ESIZE, TYPE, FN)                           \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, uint32_t rm)        \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE r, m = rm;                                                 \
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
+            r = FN(n[H##ESIZE(e)], m, fpst);                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_2OP_FP_SCALAR(vfadd_scalarh, 2, uint16_t, float16_add)
+DO_2OP_FP_SCALAR(vfadd_scalars, 4, uint32_t, float32_add)
+DO_2OP_FP_SCALAR(vfsub_scalarh, 2, uint16_t, float16_sub)
+DO_2OP_FP_SCALAR(vfsub_scalars, 4, uint32_t, float32_sub)
+DO_2OP_FP_SCALAR(vfmul_scalarh, 2, uint16_t, float16_mul)
+DO_2OP_FP_SCALAR(vfmul_scalars, 4, uint32_t, float32_mul)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4d702da808d..bc4b3f840a0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -960,6 +960,26 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
     return do_2op_scalar(s, a, fns[a->size]);
 }
 
+
+#define DO_2OP_FP_SCALAR(INSN, FN)                              \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
+DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
+DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
-- 
2.20.1


