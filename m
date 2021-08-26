Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C353F8919
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:37:28 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFZP-0001Nv-1T
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGO-0005rX-3j
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGJ-00058J-OA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h13so5065745wrp.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AcdAYe4UKe0yqe1e/LyFr+Aew3hd7YeEn7Z4eVbDvMM=;
 b=R6AxDmatdm9TiM5WfRTElgQHqkvjrVdtmcRaO73QukF4L6GRkncuIMUAp3Mv437YM3
 WT4X+bJmA+cUf+CzmYgdaVv8HdnQl8O5v5xcPDAbPaINXlekdKaxOhHy6SeD+ljayQwV
 yq+dIsfNoL0BZ394oXN6iPv107+WvAZOTpLgChJ0OgxveTydAG23B4NvViCvtX38mlDJ
 P/pZyNHZKKpMBsdEyUwP4Y7PsDsZEClv2AqPRD8Jl0nGjCMCh0mB3q5kzcNXe0p1mNGB
 Oddh9XF+pR/0cdBxBH6KAczS1W+0M9st3Urg6iQU+mXPBAROAzsAXWFEJ7PxQ06Jr7Ln
 Bdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcdAYe4UKe0yqe1e/LyFr+Aew3hd7YeEn7Z4eVbDvMM=;
 b=iZLkvn/hlc89KXEjlRUTBMrLqSLGb38toi2bBjm7jHUu2sB7g/gg+8UANQTEIJ2lsV
 u6g7tKlsy69fekvoO1+uem5nWHL9FafRe3sZ9tU4WVy3MGv+ieAfuLdHTJETsfjfV3OM
 CABLZRzFuwWrkoHVuRXVkQLAEjQmNNfxRJjiGp5XJnuubMwNp3B+fA5vZ8H1tOZXtFUw
 Gi1A0nNnKety2B35LeiB3miE6pkRetMB7o/xthxtLH460m/xPuPRnpYSo8wJQ/g/gAyb
 /LCJj1BJ4KL+0CpI9WA/6QR22ZVjJsAedl8VNE85UQ29dnHt2hjMdDRUHWOu1aGvIurD
 ohLg==
X-Gm-Message-State: AOAM533T4HuwdzGPfnwiHN1PL6PUpdCGCN4oB/aiz7HHOtf+FqnV9GIX
 FnMky5ZycSUFpn2zVvEfZcDUMw==
X-Google-Smtp-Source: ABdhPJzeNet2WOSGFZFNCY00h380ZLXhRo1ThUahYXhMpmM9ngdpjbFFtpIygS1EOtKoBMjubLSPtw==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr4043245wrr.268.1629983861570; 
 Thu, 26 Aug 2021 06:17:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/18] target/arm: Implement MVE VRINT insns
Date: Thu, 26 Aug 2021 14:17:24 +0100
Message-Id: <20210826131725.22449-18-peter.maydell@linaro.org>
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

Implement the MVE VRINT insns, which round floating point inputs
to integer values, leaving them in floating point format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: use float* types
---
 target/arm/helper-mve.h    |  6 +++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f6345c7abbe..76bd25006d8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -882,3 +882,9 @@ DEF_HELPER_FLAGS_4(mve_vcvt_sf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_uf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_fs, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_fu, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrint_rm_h, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrint_rm_s, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vrintx_h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrintx_s, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 32de4af3170..72b93bfcaa3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -815,3 +815,10 @@ VCVTPS            1111 1111 1 . 11 .. 11 ... 000 10 0 1 . 0 ... 0 @1op
 VCVTPU            1111 1111 1 . 11 .. 11 ... 000 10 1 1 . 0 ... 0 @1op
 VCVTMS            1111 1111 1 . 11 .. 11 ... 000 11 0 1 . 0 ... 0 @1op
 VCVTMU            1111 1111 1 . 11 .. 11 ... 000 11 1 1 . 0 ... 0 @1op
+
+VRINTN            1111 1111 1 . 11 .. 10 ... 001 000 1 . 0 ... 0 @1op
+VRINTX            1111 1111 1 . 11 .. 10 ... 001 001 1 . 0 ... 0 @1op
+VRINTA            1111 1111 1 . 11 .. 10 ... 001 010 1 . 0 ... 0 @1op
+VRINTZ            1111 1111 1 . 11 .. 10 ... 001 011 1 . 0 ... 0 @1op
+VRINTM            1111 1111 1 . 11 .. 10 ... 001 101 1 . 0 ... 0 @1op
+VRINTP            1111 1111 1 . 11 .. 10 ... 001 111 1 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1ed76ac5ed8..846962bf4c5 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3333,6 +3333,12 @@ DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
 DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
 DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
 
+#define DO_VRINT_RM_H(M, F, S) helper_rinth(M, S)
+#define DO_VRINT_RM_S(M, F, S) helper_rints(M, S)
+
+DO_VCVT_RMODE(vrint_rm_h, 2, uint16_t, DO_VRINT_RM_H)
+DO_VCVT_RMODE(vrint_rm_s, 4, uint32_t, DO_VRINT_RM_S)
+
 /*
  * VCVT between halfprec and singleprec. As usual for halfprec
  * conversions, FZ16 is ignored and AHP is observed.
@@ -3413,3 +3419,32 @@ void HELPER(mve_vcvtt_hs)(CPUARMState *env, void *vd, void *vm)
 {
     do_vcvt_hs(env, vd, vm, 1);
 }
+
+#define DO_1OP_FP(OP, ESIZE, TYPE, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \
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
+            r = FN(m[H##ESIZE(e)], fpst);                               \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_1OP_FP(vrintx_h, 2, float16, float16_round_to_int)
+DO_1OP_FP(vrintx_s, 4, float32, float32_round_to_int)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 194ef99cc74..2ed91577ec8 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -641,6 +641,51 @@ DO_VCVT_SH(VCVTT_SH, vcvtt_sh)
 DO_VCVT_SH(VCVTB_HS, vcvtb_hs)
 DO_VCVT_SH(VCVTT_HS, vcvtt_hs)
 
+#define DO_VRINT(INSN, RMODE)                                           \
+    static void gen_##INSN##h(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_vrint_rm_h(env, qd, qm,                          \
+                                  tcg_constant_i32(arm_rmode_to_sf(RMODE))); \
+    }                                                                   \
+    static void gen_##INSN##s(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_vrint_rm_s(env, qd, qm,                          \
+                                  tcg_constant_i32(arm_rmode_to_sf(RMODE))); \
+    }                                                                   \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)               \
+    {                                                                   \
+        static MVEGenOneOpFn * const fns[] = {                          \
+            NULL,                                                       \
+            gen_##INSN##h,                                              \
+            gen_##INSN##s,                                              \
+            NULL,                                                       \
+        };                                                              \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                         \
+            return false;                                               \
+        }                                                               \
+        return do_1op(s, a, fns[a->size]);                              \
+    }
+
+DO_VRINT(VRINTN, FPROUNDING_TIEEVEN)
+DO_VRINT(VRINTA, FPROUNDING_TIEAWAY)
+DO_VRINT(VRINTZ, FPROUNDING_ZERO)
+DO_VRINT(VRINTM, FPROUNDING_NEGINF)
+DO_VRINT(VRINTP, FPROUNDING_POSINF)
+
+static bool trans_VRINTX(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vrintx_h,
+        gen_helper_mve_vrintx_s,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1


