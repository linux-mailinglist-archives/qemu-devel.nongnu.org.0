Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DF13DA292
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:56:30 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94eL-0001IL-G0
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941c-0001Sm-27
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-0001V0-Fb
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b11so1109598wrx.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zAZRxjiyb+93dblmUX5ptmQBplEyBfFmOxvexmaeevQ=;
 b=EG1jpE6JM6ZujeqJQjfa5t5l0rm1Dx47gpiMhUt+G63knT+tTgbCLZbVM+gYDyH2T4
 Bdgemr/LcLq/KxOtsB8xyTSdtzX/wrdBBt9+197cmQSsFaWEddEatrcoJZXlHEJgKzaa
 WDUYcdLmNpUt4mBJE8gQb3bOahFKrMSYA9Xq1mDwzfGBN/hnmSipwPfvNnylGXYoxaus
 XTOjeRY+cvCg6V6uZUKpcrIQLWOZYOwHjg5vnuk7Ia0WaL8cycbq+ObTSNnxOQQcNQhZ
 wrckQl2oK15nBSaSFRSnlyV4OqhoVeYfn+dEEoihm5qOP/SJGLOeIKSvpgMkjm3NlkkJ
 nx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAZRxjiyb+93dblmUX5ptmQBplEyBfFmOxvexmaeevQ=;
 b=jNcRqtV/9w9AErhNndG13wi85YHGK3VmZdcChkk5dWH3oAdYnZn906JXdQb2GDqtKU
 JxQP3/8OVALV93TzzsfFw5I/fhgOmYpa8aWFUdQrY+iGxm46Kac019FQ327FM/3OfNsm
 tbU/p95NUBTA+0pjOiaeTw33Uw4+mMQDg2sEw8YzpSIkhmEfkyVhO81HvWUdWrNdT7Re
 32je+N018fQfKXpirYbCilDMhcJVzFF/fhkHWOXDXxR4iec6j3R6TkZJGaaJFRFfXdTe
 d+7zL4iH3Fs2PPBW26fwvSEdEa3WcNPkWVoWkwp1TK9hhfqWyyt4zUYFhlXttYg8tiOv
 y6yg==
X-Gm-Message-State: AOAM533KEx52O0Fz3gvl8/ssgvXngTV57k3hsrek0RftLU3kK4yvvs0t
 eUqqu5zGO/LZxbas9/1QtwJdX8dAeEEHvQ==
X-Google-Smtp-Source: ABdhPJz87zW+mMUYWJ0UeWE2FSw8aG5frQBeWYzrm8+IMrAppgvmhG+WNalJVL4kjXxPxYTzGm2iCg==
X-Received: by 2002:adf:82e6:: with SMTP id 93mr4206843wrc.47.1627557357412;
 Thu, 29 Jul 2021 04:15:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 51/53] target/arm: Implement MVE VCVT between single
 and half precision
Date: Thu, 29 Jul 2021 12:15:10 +0100
Message-Id: <20210729111512.16541-52-peter.maydell@linaro.org>
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

Implement the MVE VCVT instruction which converts between single
and half precision floating point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      |  8 +++++
 target/arm/mve_helper.c    | 71 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 14 ++++++++
 4 files changed, 98 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 6d4052a5269..f6345c7abbe 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -182,6 +182,11 @@ DEF_HELPER_FLAGS_4(mve_vcvt_rm_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_rm_ss, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_rm_us, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vcvtb_sh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcvtt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcvtb_hs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vcvtt_hs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 410ea746fcf..32de4af3170 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -221,6 +221,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 # The VSHLL T2 encoding is not a @2op pattern, but is here because it
 # overlaps what would be size=0b11 VMULH/VRMULH
 {
+  VCVTB_SH       111 0 1110 0 . 11 1111 ... 0 1110 0 0 . 0 ... 1 @1op_nosz
+
   VMAXNMA        111 0 1110 0 . 11 1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=2
 
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
@@ -235,6 +237,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VCVTB_HS       111 1 1110 0 . 11  1111 ... 0 1110 0 0 . 0 ... 1  @1op_nosz
+
   VMAXNMA        111 1 1110 0 . 11  1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=1
 
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
@@ -247,6 +251,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VCVTT_SH       111 0 1110 0 . 11  1111 ... 1 1110 0 0 . 0 ... 1 @1op_nosz
+
   VMINNMA        111 0 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=2
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
@@ -260,6 +266,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VCVTT_HS       111 1 1110 0 . 11  1111 ... 1 1110 0 0 . 0 ... 1 @1op_nosz
+
   VMINNMA        111 1 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=1
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 4e0d979e643..7a5143ba6f3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3337,3 +3337,74 @@ DO_VCVT_RMODE(vcvt_rm_sh, 2, uint16_t, helper_vfp_toshh)
 DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
 DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
 DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
+
+/*
+ * VCVT between halfprec and singleprec. As usual for halfprec
+ * conversions, FZ16 is ignored and AHP is observed.
+ */
+#define DO_VCVT_SH(OP, TOP)                                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \
+    {                                                                   \
+        uint16_t *d = vd;                                               \
+        uint32_t *m = vm;                                               \
+        uint16_t r;                                                     \
+        uint16_t mask = mve_element_mask(env);                          \
+        bool ieee = !(env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_AHP);        \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        float_status *base_fpst = &env->vfp.standard_fp_status;         \
+        bool old_fz = get_flush_to_zero(base_fpst);                     \
+        set_flush_to_zero(false, base_fpst);                            \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+            if ((mask & MAKE_64BIT_MASK(0, 4)) == 0) {                  \
+                continue;                                               \
+            }                                                           \
+            fpst = base_fpst;                                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = float32_to_float16(m[H4(e)], ieee, fpst);               \
+            mergemask(&d[H2(e * 2 + TOP)], r, mask >> (TOP * 2));       \
+        }                                                               \
+        set_flush_to_zero(old_fz, base_fpst);                           \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCVT_HS(OP, TOP)                                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \
+    {                                                                   \
+        uint32_t *d = vd;                                               \
+        uint16_t *m = vm;                                               \
+        uint32_t r;                                                     \
+        uint16_t mask = mve_element_mask(env);                          \
+        bool ieee = !(env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_AHP);        \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        float_status *base_fpst = &env->vfp.standard_fp_status;         \
+        bool old_fiz = get_flush_inputs_to_zero(base_fpst);             \
+        set_flush_inputs_to_zero(false, base_fpst);                     \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+            if ((mask & MAKE_64BIT_MASK(0, 4)) == 0) {                  \
+                continue;                                               \
+            }                                                           \
+            fpst = base_fpst;                                           \
+            if (!(mask & (1 << (TOP * 2)))) {                           \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = float16_to_float32(m[H2(e * 2 + TOP)], ieee, fpst);     \
+            mergemask(&d[H4(e)], r, mask);                              \
+        }                                                               \
+        set_flush_inputs_to_zero(old_fiz, base_fpst);                   \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCVT_SH(vcvtb_sh, 0)
+DO_VCVT_SH(vcvtt_sh, 1)
+DO_VCVT_HS(vcvtb_hs, 0)
+DO_VCVT_HS(vcvtt_hs, 1)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e80a55eb62e..194ef99cc74 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -627,6 +627,20 @@ DO_VCVT_RMODE(VCVTPU, FPROUNDING_POSINF, true)
 DO_VCVT_RMODE(VCVTMS, FPROUNDING_NEGINF, false)
 DO_VCVT_RMODE(VCVTMU, FPROUNDING_NEGINF, true)
 
+#define DO_VCVT_SH(INSN, FN)                                    \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_1op(s, a, gen_helper_mve_##FN);               \
+    }                                                           \
+
+DO_VCVT_SH(VCVTB_SH, vcvtb_sh)
+DO_VCVT_SH(VCVTT_SH, vcvtt_sh)
+DO_VCVT_SH(VCVTB_HS, vcvtb_hs)
+DO_VCVT_SH(VCVTT_HS, vcvtt_hs)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1


