Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386F83B5F9A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:06:59 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxruc-0006xV-6S
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmt-0003DO-Ei
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmd-00063A-Oy
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n23so11557172wms.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8R2+8f0vjwp7XTGCJXHQiTOHFPsZ37n3AK5bLswILIU=;
 b=gyg60KHCDlL/6uqc9LNgkdaMuBJ182m8MpM8DtgV/qt9fMJMkddoLJNSsyU4M/kdZQ
 yUF3vWMQwKGU5C1La2KYGJYE5XGMcC+QUaz7z3HX5lEa7lPf7nMA+00bXx+yWp8NVtTo
 Cfh7xiYjCJAVaKOM4vPXI1/YHu1ZFNMH0zbgrXTG0Mycda2LchrsnaY9wLaA1lmGl99b
 DKzkIGQ3C1S6lFXmDEN7mADOrGCFIyeZTIGDBIoUtLrqvJXpefW8ry7bKXbUeO3PbY8a
 o5H4EI6NZcCwWLwgUadYRtfMa8uBGZnuT0odLXB6DtAqgVxnzzSYh/rIvXq2I4NK8ubA
 l6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8R2+8f0vjwp7XTGCJXHQiTOHFPsZ37n3AK5bLswILIU=;
 b=iBjsdiYRNhU2GZTHJ+cSBc9bnKpxXEJQ4yeNK41R1oIpc+RF2Y9HJvkfPhyt/JjFpl
 pODH53BXWpmp1Bwdcea05ZHc0mDOfQ9EVqiyXu0EMbTQGD+4elUfRJp9iWrZRkG4H2wZ
 t0kARED73Oux6Ddnrr1+7JUhIRgbY/zS/hOfxueryrwwZFXpb0xok5AWH2vshgLFJMsD
 49igvrOkhzJBcg+PKEnIIKLRsfzsFWeCX/XRJSP+AeMcRlzX08oq6X36uPLS4UPfc9/u
 do8mssrUU2pIC4/F2x0tTuEaw0R4+4Ihy/c8wZ5ikVCCKYBDYNZW0gVBG8ctfBbHr2fJ
 zwHg==
X-Gm-Message-State: AOAM53142s45ebD7lxbffRO1styDw2o6PxBUBzYX4YCG0AZVPC+W7s6e
 7/M455LLLbTTBcwlt1qtZsuHaw==
X-Google-Smtp-Source: ABdhPJxWODvD88c0S1uqkO9tkzVh9/Xv7HzPAlOS/FJMzizLnfZYz8J58O7/dMCJ4XTYoxSDogi5Lw==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr27193047wma.85.1624888722353; 
 Mon, 28 Jun 2021 06:58:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/18] target/arm: Implement MVE vector shift left by
 immediate insns
Date: Mon, 28 Jun 2021 14:58:24 +0100
Message-Id: <20210628135835.6690-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE shift-vector-left-by-immediate insns VSHL, VQSHL
and VQSHLU.

The size-and-immediate encoding here is the same as Neon, and we
handle it the same way neon-dp.decode does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 +++++++++++
 target/arm/mve.decode      | 23 +++++++++++++++
 target/arm/mve_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 51 ++++++++++++++++++++++++++++++++++
 4 files changed, 147 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5248dbe825a..8cd7c6a0d8a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -359,3 +359,19 @@ DEF_HELPER_FLAGS_3(mve_vaddvuw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vmovi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vandi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vorri, TCG_CALL_NO_WG, void, env, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshli_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshli_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshli_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshlui_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshlui_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshlui_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index caeb016c12f..183eb731d2b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -34,6 +34,7 @@
 &2op qd qm qn size
 &2scalar qd qn rm size
 &1imm qd imm cmode op
+&2shift qd qm shift size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -59,6 +60,10 @@
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 @2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
+@2_shl_b .... .... .. 001 shift:3 .... .... .... .... &2shift qd=%qd qm=%qm size=0
+@2_shl_h .... .... .. 01  shift:4 .... .... .... .... &2shift qd=%qd qm=%qm size=1
+@2_shl_w .... .... .. 1   shift:5 .... .... .... .... &2shift qd=%qd qm=%qm size=2
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -275,3 +280,21 @@ VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
 # So we have a single decode line and check the cmode/op in the
 # trans function.
 Vimm_1r 111 . 1111 1 . 00 0 ... ... 0 .... 0 1 . 1 .... @1imm
+
+# Shifts by immediate
+
+VSHLI             111 0 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_b
+VSHLI             111 0 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_h
+VSHLI             111 0 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_w
+
+VQSHLI_S          111 0 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_b
+VQSHLI_S          111 0 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_h
+VQSHLI_S          111 0 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_w
+
+VQSHLI_U          111 1 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_b
+VQSHLI_U          111 1 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_h
+VQSHLI_U          111 1 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_w
+
+VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_b
+VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_h
+VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_w
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e6ced144673..285c8b56f78 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -733,6 +733,8 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, true, satp)
 #define DO_UQRSHL_OP(N, M, satp) \
     WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, true, satp)
+#define DO_SUQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_suqrshl_bhs, N, M, false, satp)
 
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
@@ -1186,3 +1188,58 @@ DO_VADDV(vaddvsw, 4, uint32_t)
 DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
+
+/* Shifts by immediate */
+#define DO_2SHIFT(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        TYPE *d = vd, *m = vm;                                  \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            mergemask(&d[H##ESIZE(e)],                          \
+                      FN(m[H##ESIZE(e)], shift), mask);         \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+#define DO_2SHIFT_SAT(OP, ESIZE, TYPE, FN)                      \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        TYPE *d = vd, *m = vm;                                  \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        bool qc = false;                                        \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            bool sat = false;                                   \
+            mergemask(&d[H##ESIZE(e)],                          \
+                      FN(m[H##ESIZE(e)], shift, &sat), mask);   \
+            qc |= sat & mask & 1;                               \
+        }                                                       \
+        if (qc) {                                               \
+            env->vfp.qc[0] = qc;                                \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+/* provide unsigned 2-op shift helpers for all sizes */
+#define DO_2SHIFT_U(OP, FN)                     \
+    DO_2SHIFT(OP##b, 1, uint8_t, FN)            \
+    DO_2SHIFT(OP##h, 2, uint16_t, FN)           \
+    DO_2SHIFT(OP##w, 4, uint32_t, FN)
+
+#define DO_2SHIFT_SAT_U(OP, FN)                 \
+    DO_2SHIFT_SAT(OP##b, 1, uint8_t, FN)        \
+    DO_2SHIFT_SAT(OP##h, 2, uint16_t, FN)       \
+    DO_2SHIFT_SAT(OP##w, 4, uint32_t, FN)
+#define DO_2SHIFT_SAT_S(OP, FN)                 \
+    DO_2SHIFT_SAT(OP##b, 1, int8_t, FN)         \
+    DO_2SHIFT_SAT(OP##h, 2, int16_t, FN)        \
+    DO_2SHIFT_SAT(OP##w, 4, int32_t, FN)
+
+DO_2SHIFT_U(vshli_u, DO_VSHLU)
+DO_2SHIFT_SAT_U(vqshli_u, DO_UQSHL_OP)
+DO_2SHIFT_SAT_S(vqshli_s, DO_SQSHL_OP)
+DO_2SHIFT_SAT_S(vqshlui_s, DO_SUQSHL_OP)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f435a1cfd97..fc8a2da6e1f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -32,6 +32,7 @@ typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenTwoOpShiftFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVADDVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
@@ -837,3 +838,53 @@ static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
     }
     return do_1imm(s, a, fn);
 }
+
+static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
+                      bool negateshift)
+{
+    TCGv_ptr qd, qm;
+    int shift = a->shift;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /*
+     * When we handle a right shift insn using a left-shift helper
+     * which permits a negative shift count to indicate a right-shift,
+     * we must negate the shift count.
+     */
+    if (negateshift) {
+        shift = -shift;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, tcg_constant_i32(shift));
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_2SHIFT(INSN, FN, NEGATESHIFT)                         \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
+    {                                                           \
+        static MVEGenTwoOpShiftFn * const fns[] = {             \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2shift(s, a, fns[a->size], NEGATESHIFT);      \
+    }
+
+DO_2SHIFT(VSHLI, vshli_u, false)
+DO_2SHIFT(VQSHLI_S, vqshli_s, false)
+DO_2SHIFT(VQSHLI_U, vqshli_u, false)
+DO_2SHIFT(VQSHLUI, vqshlui_s, false)
-- 
2.20.1


