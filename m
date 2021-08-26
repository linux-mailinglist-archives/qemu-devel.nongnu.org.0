Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3C3F8906
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:32:49 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFUp-0008Aw-Ot
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGO-0005rj-Li
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGJ-00057I-LF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d26so5121945wrc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PuYwv7IQju2UavvbdJU5w8adZg7ikn6rO+blWY/QnVE=;
 b=KitbIkLzpunuiB/OC3v5pDTWcSHD9+lkygwzUC8Dxont/8jbEgSmAOIWAOwpA6+FTN
 U65H6NOX2OPljLzYQ6WxL3hB2Q7rdA/roKamIgEzzmlJ4UAPmN6YVFl8rCZYBor2QzOu
 /1CZYQ2DEsYqyiQQaTAK53bKB3kRFLrCqipee/g0biJ3AieoyxezdYJ69/dv+bSvFRtO
 cyHAmrGq2m4jsGVK0GpY4e9znAj5lVAI+FJPX4ZoK09PtiHq6g+VHQKKUwmhGHWg9eD2
 Rj/SbUb2yJl8qPGtFsflgJbKxt1hPado67QMQ+WTKaRjAQJSgX3fumlUp5tc0OD7n5ct
 VXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuYwv7IQju2UavvbdJU5w8adZg7ikn6rO+blWY/QnVE=;
 b=ZdMm1IkVi4jTJDu/a2cuGG4QIGQeLRfZhrUtlBNHWVo7IoU4mUuGB8i5LLsCYWpWzf
 qYZr/HtOlITCZKZm3VeKMYnhwBEBh2Q4D6LkJx9iNjHRW3tmQ7yugImzN5MlQsSZKeB4
 /Y1p/gv+AnT2VoI4DS0mbE4tbhiUxGZQy+KXDzedW/7Be31gfmbVBpdZxdNeLFMeoJaw
 9424XnuLK0YkbKj++Xaqwob2QxkXjUVq1oFzRXOp6fmlU9rEkJbgO4nFLIE1A9pA4qHZ
 WVNBUQ6emBkGOw4EKW8M+ZwlzD5WFgYtLNjHpv+p7ZKa8GPzowXjQMMHtBZEZ/ZdFeC6
 sqgw==
X-Gm-Message-State: AOAM532OZf9t59FR+dTdb35HOpSitCmd3YHA9c/5DSCcF32LitgTkUQY
 PG/w3qw7SMLdpil59lu4+J1Bvxk1YMB/ag==
X-Google-Smtp-Source: ABdhPJz1/buW42MU2mKFMic9/L1gXfxyPB/El/nREG9KNiPd2lE5jpiAyw3m921ko0bsGCu6csKzYQ==
X-Received: by 2002:a5d:5447:: with SMTP id w7mr3958082wrv.137.1629983860768; 
 Thu, 26 Aug 2021 06:17:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/18] target/arm: Implement MVE VCVT between single and
 half precision
Date: Thu, 26 Aug 2021 14:17:23 +0100
Message-Id: <20210826131725.22449-17-peter.maydell@linaro.org>
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

Implement the MVE VCVT instruction which converts between single
and half precision floating point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: make do_vcvt_sh/do_vcvt_hs functions, not macros
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      |  8 ++++
 target/arm/mve_helper.c    | 81 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 14 +++++++
 4 files changed, 108 insertions(+)

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
index a793199fbee..1ed76ac5ed8 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3332,3 +3332,84 @@ DO_VCVT_RMODE(vcvt_rm_sh, 2, uint16_t, helper_vfp_toshh)
 DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
 DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
 DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
+
+/*
+ * VCVT between halfprec and singleprec. As usual for halfprec
+ * conversions, FZ16 is ignored and AHP is observed.
+ */
+static void do_vcvt_sh(CPUARMState *env, void *vd, void *vm, int top)
+{
+    uint16_t *d = vd;
+    uint32_t *m = vm;
+    uint16_t r;
+    uint16_t mask = mve_element_mask(env);
+    bool ieee = !(env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_AHP);
+    unsigned e;
+    float_status *fpst;
+    float_status scratch_fpst;
+    float_status *base_fpst = &env->vfp.standard_fp_status;
+    bool old_fz = get_flush_to_zero(base_fpst);
+    set_flush_to_zero(false, base_fpst);
+    for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+        if ((mask & MAKE_64BIT_MASK(0, 4)) == 0) {
+            continue;
+        }
+        fpst = base_fpst;
+        if (!(mask & 1)) {
+            /* We need the result but without updating flags */
+            scratch_fpst = *fpst;
+            fpst = &scratch_fpst;
+        }
+        r = float32_to_float16(m[H4(e)], ieee, fpst);
+        mergemask(&d[H2(e * 2 + top)], r, mask >> (top * 2));
+    }
+    set_flush_to_zero(old_fz, base_fpst);
+    mve_advance_vpt(env);
+}
+
+static void do_vcvt_hs(CPUARMState *env, void *vd, void *vm, int top)
+{
+    uint32_t *d = vd;
+    uint16_t *m = vm;
+    uint32_t r;
+    uint16_t mask = mve_element_mask(env);
+    bool ieee = !(env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_AHP);
+    unsigned e;
+    float_status *fpst;
+    float_status scratch_fpst;
+    float_status *base_fpst = &env->vfp.standard_fp_status;
+    bool old_fiz = get_flush_inputs_to_zero(base_fpst);
+    set_flush_inputs_to_zero(false, base_fpst);
+    for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+        if ((mask & MAKE_64BIT_MASK(0, 4)) == 0) {
+            continue;
+        }
+        fpst = base_fpst;
+        if (!(mask & (1 << (top * 2)))) {
+            /* We need the result but without updating flags */
+            scratch_fpst = *fpst;
+            fpst = &scratch_fpst;
+        }
+        r = float16_to_float32(m[H2(e * 2 + top)], ieee, fpst);
+        mergemask(&d[H4(e)], r, mask);
+    }
+    set_flush_inputs_to_zero(old_fiz, base_fpst);
+    mve_advance_vpt(env);
+}
+
+void HELPER(mve_vcvtb_sh)(CPUARMState *env, void *vd, void *vm)
+{
+    do_vcvt_sh(env, vd, vm, 0);
+}
+void HELPER(mve_vcvtt_sh)(CPUARMState *env, void *vd, void *vm)
+{
+    do_vcvt_sh(env, vd, vm, 1);
+}
+void HELPER(mve_vcvtb_hs)(CPUARMState *env, void *vd, void *vm)
+{
+    do_vcvt_hs(env, vd, vm, 0);
+}
+void HELPER(mve_vcvtt_hs)(CPUARMState *env, void *vd, void *vm)
+{
+    do_vcvt_hs(env, vd, vm, 1);
+}
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


