Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD883F88F9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:30:06 +0200 (CEST)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFSH-0004EF-KO
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGJ-0005nV-UP
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGE-000537-5s
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h13so5065392wrp.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mfamHtdFPlP/R6iQ+VFMxT63nZJoG0XuYjj5ksHMeHA=;
 b=l8h7EMEREd8y1zYGg2JXeS6eg7LZthFWgaUdWcoH1ah8e4QTnt2/fjofnVJqKbF/lx
 W/VaDhPqgHi0YLWX/CeyNE7SIoKl3foxTNT/Eg03iJJYK/j1LTG+IV1SQxGHM7iu/ch+
 8es1gK13IPFjSBAga9cVEeSJH6NRJN04aEEQ4N2T1KMqKAJdipIRTTAjGTMXVrLyUOBM
 Ij1EtvHukossBZpEyyMvWIn5BPF7FUzfDCzyvlnH+BXUTHm8XOkHlgqOHYBRM5sOvBZS
 XzXJ3Ks3ead8Xq7mK+R/RBxOLbHxB/vLq896wWCRZXYfor4fcI1PT72FKLtJ8PcXQIuj
 9fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfamHtdFPlP/R6iQ+VFMxT63nZJoG0XuYjj5ksHMeHA=;
 b=lcEi2ZnZlNE4/99zfEEkIyadNFq1TNVDPvUO5J1MzCMUBZNlm/pFfc5g8zjcCA31HX
 j6InCuNF2GMdkozUbaQl4OQf4fbF2JKnKEzhXMrOa6ieG9+v9gG1Nu7G9MC19eO0dTSx
 jZKnNwmKk2XqHMR5d1AJH3sNnE0sSaLchH2XaBczqFiVFZ/k0XUQmUETJf6h/TnOvR4X
 PpHSmiPXFGW31USrq74Uf9yuvHl/aUmnRs8vM1CO/YLLWn6UyJYSFGlFrmiLR1lCQcu9
 c1JfRaD7/bNBoRhnTNQV2m8dB/o7koQVvSzVsQf+xvw0zWM3Fch3MIzQkIO7pEzxYLck
 V7Kg==
X-Gm-Message-State: AOAM53129DBY2a43nQ4GbNzWZOTKbVjTQTToSr0Ng/bI44nKC7oX3vrl
 Wmb0sgkXxEuzauK8Di43YLnv6Zn/1HuBiw==
X-Google-Smtp-Source: ABdhPJx//30F/b0DVdCXnuecS8WRnqiatVBpgWWp8UFnojgofDRkiQvFoGK4eXTiSrsc4lJ8I1qezQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr3936689wrv.117.1629983856630; 
 Thu, 26 Aug 2021 06:17:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/18] target/arm: Implement MVE fp vector comparisons
Date: Thu, 26 Aug 2021 14:17:18 +0100
Message-Id: <20210826131725.22449-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
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

Implement the MVE fp vector comparisons VCMP and VPT.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: use float* types
---
 target/arm/helper-mve.h    | 18 +++++++++++
 target/arm/mve.decode      | 39 +++++++++++++++++++----
 target/arm/mve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 22 +++++++++++++
 4 files changed, 137 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 47fd18dddbf..0c15c531641 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -813,6 +813,24 @@ DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vfcmpeqh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmpeqs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpneh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmpnes, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpgeh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmpges, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vfcmplth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmplts, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpgth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmpgts, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfcmples, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vfadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfadd_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1a18c3b8eeb..7767ecae2ac 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -124,6 +124,9 @@
 @vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
              mask=%mask_22_13
 
+@vcmp_fp .... .... .... qn:3 . .... .... .... .... &vcmp \
+         qm=%qm size=%2op_fp_scalar_size mask=%mask_22_13
+
 @vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
 
 @2op_fp .... .... .... .... .... .... .... .... &2op \
@@ -663,17 +666,41 @@ VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
 # Comparisons. We expand out the conditions which are split across
 # encodings T1, T2, T3 and the fc bits. These include VPT, which is
 # effectively "VCMP then VPST". A plain "VCMP" has a mask field of zero.
-VCMPEQ            1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
-VCMPNE            1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
+{
+  VCMPEQ_fp       111 . 1110 0 . 11 ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp_fp
+  VCMPEQ          111 1 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 0 @vcmp
+}
+
+{
+  VCMPNE_fp       111 . 1110 0 . 11 ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp_fp
+  VCMPNE          111 1 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 0 @vcmp
+}
+
+{
+  VCMPGE_fp       111 . 1110 0 . 11 ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp_fp
+  VCMPGE          111 1 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
+}
+
+{
+  VCMPLT_fp       111 . 1110 0 . 11 ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp_fp
+  VCMPLT          111 1 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
+}
+
+{
+  VCMPGT_fp       111 . 1110 0 . 11 ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp_fp
+  VCMPGT          111 1 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
+}
+
+{
+  VCMPLE_fp         111 . 1110 0 . 11 ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp_fp
+  VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
+}
+
 {
   VPSEL           1111 1110 0 . 11 ... 1 ... 0 1111 . 0 . 0 ... 1 @2op_nosz
   VCMPCS          1111 1110 0 . .. ... 1 ... 0 1111 0 0 . 0 ... 1 @vcmp
   VCMPHI          1111 1110 0 . .. ... 1 ... 0 1111 1 0 . 0 ... 1 @vcmp
 }
-VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
-VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
-VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
-VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
 
 {
   VPNOT           1111 1110 0 0 11 000 1 000 0 1111 0100 1101
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 52e5a8f2a8b..07a1ab88814 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3156,3 +3156,67 @@ DO_FP_VMAXMINV(vmaxnmavh, 2, float16, true, float16_maxnum)
 DO_FP_VMAXMINV(vmaxnmavs, 4, float32, true, float32_maxnum)
 DO_FP_VMAXMINV(vminnmavh, 2, float16, true, float16_minnum)
 DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
+
+/* FP compares; note that all comparisons signal InvalidOp for QNaNs */
+#define DO_VCMP_FP(OP, ESIZE, TYPE, FN)                                 \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, void *vm)   \
+    {                                                                   \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        bool r;                                                         \
+        for (e = 0; e < 16 / ESIZE; e++, emask <<= ESIZE) {             \
+            if ((mask & emask) == 0) {                                  \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & (1 << (e * ESIZE)))) {                         \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], fpst);               \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
+
+/*
+ * Some care is needed here to get the correct result for the unordered case.
+ * Architecturally EQ, GE and GT are defined to be false for unordered, but
+ * the NE, LT and LE comparisons are defined as simple logical inverses of
+ * EQ, GE and GT and so they must return true for unordered. The softfloat
+ * comparison functions float*_{eq,le,lt} all return false for unordered.
+ */
+#define DO_GE16(X, Y, S) float16_le(Y, X, S)
+#define DO_GE32(X, Y, S) float32_le(Y, X, S)
+#define DO_GT16(X, Y, S) float16_lt(Y, X, S)
+#define DO_GT32(X, Y, S) float32_lt(Y, X, S)
+
+DO_VCMP_FP(vfcmpeqh, 2, float16, float16_eq)
+DO_VCMP_FP(vfcmpeqs, 4, float32, float32_eq)
+
+DO_VCMP_FP(vfcmpneh, 2, float16, !float16_eq)
+DO_VCMP_FP(vfcmpnes, 4, float32, !float32_eq)
+
+DO_VCMP_FP(vfcmpgeh, 2, float16, DO_GE16)
+DO_VCMP_FP(vfcmpges, 4, float32, DO_GE32)
+
+DO_VCMP_FP(vfcmplth, 2, float16, !DO_GE16)
+DO_VCMP_FP(vfcmplts, 4, float32, !DO_GE32)
+
+DO_VCMP_FP(vfcmpgth, 2, float16, DO_GT16)
+DO_VCMP_FP(vfcmpgts, 4, float32, DO_GT32)
+
+DO_VCMP_FP(vfcmpleh, 2, float16, !DO_GT16)
+DO_VCMP_FP(vfcmples, 4, float32, !DO_GT32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4e2aa2cae2d..da14a6f790e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1758,6 +1758,28 @@ DO_VCMP(VCMPLT, vcmplt)
 DO_VCMP(VCMPGT, vcmpgt)
 DO_VCMP(VCMPLE, vcmple)
 
+#define DO_VCMP_FP(INSN, FN)                                    \
+    static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
+    {                                                           \
+        static MVEGenCmpFn * const fns[] = {                    \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_vcmp(s, a, fns[a->size]);                     \
+    }
+
+DO_VCMP_FP(VCMPEQ_fp, vfcmpeq)
+DO_VCMP_FP(VCMPNE_fp, vfcmpne)
+DO_VCMP_FP(VCMPGE_fp, vfcmpge)
+DO_VCMP_FP(VCMPLT_fp, vfcmplt)
+DO_VCMP_FP(VCMPGT_fp, vfcmpgt)
+DO_VCMP_FP(VCMPLE_fp, vfcmple)
+
 static bool do_vmaxv(DisasContext *s, arg_vmaxv *a, MVEGenVADDVFn fn)
 {
     /*
-- 
2.20.1


