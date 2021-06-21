Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2073AF168
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:07:30 +0200 (CEST)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNOT-0003Tc-LK
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMna-0007v1-6D
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnY-0007nJ-5k
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f2so20340118wri.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/eWpdtc/122vziwfPccNSLKg3DTaIMj0ioucG7x6IdI=;
 b=HrFGGx8P3oCJdHf+kmpimTx5f/zgUGmUcv38eVfgi785Sedji70wxQvXvA8FaYmO4m
 bmqulBbclcQclCy+zqcn2zyLmBGo5wvd+j3BahUJ+bHPX3XpMlO+fQATwcdcl4mEsd16
 VhZKRnY4WJuMeO4x867B+voaUnzTxZxk9ipkxWPUoglW/1fFDtwMa7JMoDRyAjniL/C+
 H1Clg7WMAbnjkV958tGxPU0elh9rFsRag/wDpu/pfxixySzMQgBmRsU2h/Dq8wVQbU5H
 PYmFv4SThUpVfxUAodPd0c0Jm4B8rggotWI1z4IXdXc4yWoXX/daxgoDQ82NsVyoEca1
 cDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/eWpdtc/122vziwfPccNSLKg3DTaIMj0ioucG7x6IdI=;
 b=K3EbAisjSZBwR8wOvzX8KplllZkpPkFCfnuaCwYV2YZ7oElXZYBPKs0CCMSqsM2x3S
 ImiGsaEHOT/5W2+8QTWmKhdtD9mFhZij/htZp0A4D+kGH2+21jkUB8UfblHodsfnHfeh
 vy0I+1H5e518pZvNwuTBhRoM9FjMRi6yxwsHjPeflIFlhCnDryPmsmUMTgF4ATAhcFzK
 Eu4tFADTA35s8JFYDvUzc9o3pEdfOYxdlNEXBDyt+kS6/03IweG3goPdVkls1FSDVzzv
 xvCUEcXD5NVNZpP8PUmsp2AyCzGcIh6RHOBxrH1em8heRlll5PNFCTKypjGZbvrcirJZ
 OrRQ==
X-Gm-Message-State: AOAM532ph9PhH6aXr65PWGTnnt+F+6RrDuG/VKB59/b3NA2T3ipVkPwH
 nzK0l/hp7siH6vwHdVrvn0jM/lVJjGJ83X/M
X-Google-Smtp-Source: ABdhPJwyt8LfHdGHymoVmPfBgq0Rn2z5GkR0s7ijybvu00RSv99j7VeubNbV8XNZAHf75ztyecjSSw==
X-Received: by 2002:adf:9084:: with SMTP id i4mr29556739wri.23.1624292958932; 
 Mon, 21 Jun 2021 09:29:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/57] target/arm: Implement MVE VQDMULL (vector)
Date: Mon, 21 Jun 2021 17:28:25 +0100
Message-Id: <20210621162833.32535-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Implement the vector form of the MVE VQDMULL insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-39-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 61f8082e0e3..34a46ed38ee 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -233,6 +233,11 @@ DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullbh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index fa4fb1b2038..3a2a7e75a3a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -39,6 +39,8 @@
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
+@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
+     size=%size_28
 
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
@@ -152,6 +154,9 @@ VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
 VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
 VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
+VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1e61bfac9be..07c6b238feb 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -899,6 +899,36 @@ DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, 2, int16_t, 4, int32_t, \
 DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, 4, int32_t, 8, int64_t, \
                     do_qdmullw, SATMASK32)
 
+/*
+ * Long saturating ops
+ */
+#define DO_2OP_SAT_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN, SATMASK)  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                void *vm)                               \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        bool qc = false;                                                \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE op1 = n[H##ESIZE(le * 2 + TOP)];                      \
+            LTYPE op2 = m[H##ESIZE(le * 2 + TOP)];                      \
+            mergemask(&d[H##LESIZE(le)], FN(op1, op2, &sat), mask);     \
+            qc |= sat && (mask & SATMASK);                              \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_2OP_SAT_L(vqdmullbh, 0, 2, int16_t, 4, int32_t, do_qdmullh, SATMASK16B)
+DO_2OP_SAT_L(vqdmullbw, 0, 4, int32_t, 8, int64_t, do_qdmullw, SATMASK32)
+DO_2OP_SAT_L(vqdmullth, 1, 2, int16_t, 4, int32_t, do_qdmullh, SATMASK16T)
+DO_2OP_SAT_L(vqdmulltw, 1, 4, int32_t, 8, int64_t, do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 27b3e378ac7..05789a19812 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -419,6 +419,36 @@ DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 
+static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
+{
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullbh,
+        gen_helper_mve_vqdmullbw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
+{
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullth,
+        gen_helper_mve_vqdmulltw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
-- 
2.20.1


