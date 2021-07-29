Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC73DA28A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:54:47 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94cg-00050q-HH
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941V-0001KZ-V4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9414-0001Pi-Tn
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:21 -0400
Received: by mail-wr1-x432.google.com with SMTP id m12so1650400wru.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p/PVosmr3NDaaW48KULGfEDE4gWAQBCxNNHpd5+4wvQ=;
 b=XYZD9OiFWNXRZANimC6KdeeBOd9/IP8LQwcic3/Rr3WwYgFrxe3bJjVz8xSG0yaAOH
 rAWPsLKED3IpwtUl6dHRiZgAmaVlGkhV3JHkH3ZCEUAxEdKe9l1uMkZo2xYexpNiHkac
 y45+iqJsCP8zqra12ipRDT7YCi5XUbl5P48p4TlvJr7Q+PaEJXDu/SE0l39t4Xcduorf
 N4xpd95zg3pq2UYf3enw+F5Ewe3ulOAscw5WkFnffbG+4DjALaOo5nfV4fPr9RaE0Lua
 gcVlTfGtuOOVSp4869uIJzd3ug2niSENL9OGhjOJ99xG2HaqOoFzPEq56YlHuZNxP0w3
 +PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/PVosmr3NDaaW48KULGfEDE4gWAQBCxNNHpd5+4wvQ=;
 b=a9fc9kgQJO8wuYSG0gkYttX7JxkBPo8MMpmszB2ovG4zgsIBmp5uHZV1dJOjQZB166
 UH8+KP3FyvB7K8Hp18ZMs/lsvSuCIha+RcpMZs9yFKdDjKC775bTCN1AOnHeDY2eev5Z
 +hDS3OnP+dwEDdW+ec8mVvwByas5PMeaaNkJYZ/7sQxezJhkeIKbD8h6+Z4Z7TGsjz/k
 r/dskKBfpmGEuJ/03fwVdvGj8dgTI5xWPCG+bjSZspOZ+TeUhGpWq38AD2vrAkyJW9gD
 QZa8D8HCZNa7J93hgR1RXlji7ZnEqE7SEJbY3VFBt7tVUQZdExykBlDm4Bqh9oXcbG1c
 /Etw==
X-Gm-Message-State: AOAM533zATKTy1Ie0FUZakfYkiFg5040oxl6fGA6/hvdO0OLYouxtRss
 a8nF53jyoW7PTxl6IbKOxZz/Kw==
X-Google-Smtp-Source: ABdhPJy1qwc662Ht16KS5dSUtGRIOMHqMZ5OdO8sObWAjHTFgF9+/3kBDOYH2rkmfPUZumhbLw3Hnw==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr4209511wrm.59.1627557350653; 
 Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 43/53] target/arm: Implement MVE fp-with-scalar VFMA,
 VFMAS
Date: Thu, 29 Jul 2021 12:15:02 +0100
Message-Id: <20210729111512.16541-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Implement the MVE fp-with-scalar VFMA and VFMAS insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 14 +++++++++++---
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 091ec4b4270..cb7b6423239 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -809,3 +809,9 @@ DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfma_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfma_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmas_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmas_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5ba8b6deeaa..d2bd6815bc3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -508,9 +508,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
-# The U bit (28) is don't-care because it does not affect the result
-VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
-VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+{
+  VFMA_scalar     111 . 1110 0 . 11 ... 1 ... 0 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLA            111 - 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
+}
+
+{
+  VFMAS_scalar    111 . 1110 0 . 11 ... 1 ... 1 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLAS           111 - 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+}
 
 VQRDMLAH         1110 1110 0 . .. ... 0 ... 0 1110 . 100 .... @2scalar
 VQRDMLASH        1110 1110 0 . .. ... 0 ... 1 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4175bacfaa4..3b243aaefa2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3080,3 +3080,40 @@ DO_2OP_FP_SCALAR(vfsub_scalarh, 2, uint16_t, float16_sub)
 DO_2OP_FP_SCALAR(vfsub_scalars, 4, uint32_t, float32_sub)
 DO_2OP_FP_SCALAR(vfmul_scalarh, 2, uint16_t, float16_mul)
 DO_2OP_FP_SCALAR(vfmul_scalars, 4, uint32_t, float32_mul)
+
+#define DO_2OP_FP_ACC_SCALAR(OP, ESIZE, TYPE, FN)                       \
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
+            r = FN(n[H##ESIZE(e)], m, d[H##ESIZE(e)], 0, fpst);         \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* VFMAS is vector * vector + scalar, so swap op2 and op3 */
+#define DO_VFMAS_SCALARH(N, M, D, F, S) float16_muladd(N, D, M, F, S)
+#define DO_VFMAS_SCALARS(N, M, D, F, S) float32_muladd(N, D, M, F, S)
+
+/* VFMA is vector * scalar + vector */
+DO_2OP_FP_ACC_SCALAR(vfma_scalarh, 2, uint16_t, float16_muladd)
+DO_2OP_FP_ACC_SCALAR(vfma_scalars, 4, uint32_t, float32_muladd)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalarh, 2, uint16_t, DO_VFMAS_SCALARH)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, uint32_t, DO_VFMAS_SCALARS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bc4b3f840a0..3627ba227f2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -979,6 +979,8 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
 DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
 DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
 DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+DO_2OP_FP_SCALAR(VFMA_scalar, vfma_scalar)
+DO_2OP_FP_SCALAR(VFMAS_scalar, vfmas_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
-- 
2.20.1


