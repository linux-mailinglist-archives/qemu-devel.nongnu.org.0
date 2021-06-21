Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656363AF1B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:14:01 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNUm-00087R-FH
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnd-00086T-Gf
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnZ-0007nd-Ps
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id f2so20340193wri.11
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QV7VcbxaXW/+qAUBMaxdVtazY52CHsxjKt6VvIu/zdQ=;
 b=aifqL5YmKCDHLBA/4rMZmMrW9fib1bxTDMHvu3BqDuehLjWSa39T51Vr4odxYA/1sn
 seEK9DmzLSK5AI5pvKMOfD9i4qbEOIDGyrJNquFZ28EWz8e3vaJdDYJ+yOXb9G9Py9UW
 S/CrTUiR0D/7ABfDJ+2ZHCPp9rZRBNmx/6inHi1NBh9GqdGTys4cqWpOCSpLrF6CEgf+
 1PUISeIM452/+dmSsK0lNo0mrrj5HZMMUGMQ+r0mLm/H1xqipwIe9zxEj6hnBKrvR2kt
 zhugCXaT/9N9ag8QfgH9x6h8rMpwK8DGU+x2E1DC9Z/5JYK50gTNdTEgLTfmKRsdaEc2
 9JqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QV7VcbxaXW/+qAUBMaxdVtazY52CHsxjKt6VvIu/zdQ=;
 b=QR9R9fWcdOaCetnkxMCNXfz10saR35A/0v8KHr+9+72CqZUWcL8Oe3fFTtPXMFfY+/
 hfAnnR4CPSKKsFXS9O+Oz8qhFqYtW+Yu1Ech99WvsYoqWCn4Q5oJs+QvEXiPTwX7Bb1l
 4gGqYx30WI6L7He9ofaNShnTrNvzwftrV4M2cDVOH/hw2JYTPkmzT3jesXsmyXOer1V2
 uFSnVREFIFg/10tBIX74enYn0tz8Cp0fqpGPlMQw4USu9gMogg/r1NdA8B4juTYKr4PZ
 wIqTHSuyFRq/SAXvqXRO1ms6RcBvupH9Vy2g2vXthzdxvaBtwH1w5DeZfpNspchnMPXv
 FGVA==
X-Gm-Message-State: AOAM5303g7pbZFrX/kiz8p20Xprgvr8IsmweCu0BUYRBg70zb25u0zon
 og8K3PhP/B3wfLMTnvbsVFwTheGXeWr/UQBP
X-Google-Smtp-Source: ABdhPJzaej+WEX25GSJDW2rBH8pr6ohQi7Fr91Wj9J13ouL+xBGwsacUZDHCb8diFqC1LlrVdiGErg==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr29714871wrx.13.1624292960417; 
 Mon, 21 Jun 2021 09:29:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/57] target/arm: Implement MVE VADC, VSBC
Date: Mon, 21 Jun 2021 17:28:27 +0100
Message-Id: <20210621162833.32535-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the MVE VADC and VSBC insns.  These perform an
add-with-carry or subtract-with-carry of the 32-bit elements in each
lane of the input vectors, where the carry-out of each add is the
carry-in of the next.  The initial carry input is either 1 or is from
FPSCR.C; the carry out at the end is written back to FPSCR.C.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-41-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  5 ++++
 target/arm/mve.decode      |  5 ++++
 target/arm/mve_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 37 +++++++++++++++++++++++++++
 4 files changed, 99 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 2f0cf99359a..459c8eebdd6 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -246,6 +246,11 @@ DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vadc, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vadci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsbc, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vsbci, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6b969902df0..79915f45d71 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -160,6 +160,11 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
+VADC             1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+VSBC             1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+VADCI            1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+VSBCI            1111 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 725a775605a..f76df1c964b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -537,6 +537,58 @@ DO_2OP_U(vrshlu, DO_VRSHLU)
 DO_2OP_S(vrhadds, DO_RHADD_S)
 DO_2OP_U(vrhaddu, DO_RHADD_U)
 
+static void do_vadc(CPUARMState *env, uint32_t *d, uint32_t *n, uint32_t *m,
+                    uint32_t inv, uint32_t carry_in, bool update_flags)
+{
+    uint16_t mask = mve_element_mask(env);
+    unsigned e;
+
+    /* If any additions trigger, we will update flags. */
+    if (mask & 0x1111) {
+        update_flags = true;
+    }
+
+    for (e = 0; e < 16 / 4; e++, mask >>= 4) {
+        uint64_t r = carry_in;
+        r += n[H4(e)];
+        r += m[H4(e)] ^ inv;
+        if (mask & 1) {
+            carry_in = r >> 32;
+        }
+        mergemask(&d[H4(e)], r, mask);
+    }
+
+    if (update_flags) {
+        /* Store C, clear NZV. */
+        env->vfp.xregs[ARM_VFP_FPSCR] &= ~FPCR_NZCV_MASK;
+        env->vfp.xregs[ARM_VFP_FPSCR] |= carry_in * FPCR_C;
+    }
+    mve_advance_vpt(env);
+}
+
+void HELPER(mve_vadc)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
+    do_vadc(env, vd, vn, vm, 0, carry_in, false);
+}
+
+void HELPER(mve_vsbc)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    bool carry_in = env->vfp.xregs[ARM_VFP_FPSCR] & FPCR_C;
+    do_vadc(env, vd, vn, vm, -1, carry_in, false);
+}
+
+
+void HELPER(mve_vadci)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    do_vadc(env, vd, vn, vm, 0, 0, true);
+}
+
+void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
+{
+    do_vadc(env, vd, vn, vm, -1, 1, true);
+}
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index febf644079c..f8cc6080c9e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -451,6 +451,43 @@ static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
     return do_2op(s, a, fns[a->size]);
 }
 
+/*
+ * VADC and VSBC: these perform an add-with-carry or subtract-with-carry
+ * of the 32-bit elements in each lane of the input vectors, where the
+ * carry-out of each add is the carry-in of the next.  The initial carry
+ * input is either fixed (0 for VADCI, 1 for VSBCI) or is from FPSCR.C
+ * (for VADC and VSBC); the carry out at the end is written back to FPSCR.C.
+ * These insns are subject to beat-wise execution.  Partial execution
+ * of an I=1 (initial carry input fixed) insn which does not
+ * execute the first beat must start with the current FPSCR.NZCV
+ * value, not the fixed constant input.
+ */
+static bool trans_VADC(DisasContext *s, arg_2op *a)
+{
+    return do_2op(s, a, gen_helper_mve_vadc);
+}
+
+static bool trans_VADCI(DisasContext *s, arg_2op *a)
+{
+    if (mve_skip_first_beat(s)) {
+        return trans_VADC(s, a);
+    }
+    return do_2op(s, a, gen_helper_mve_vadci);
+}
+
+static bool trans_VSBC(DisasContext *s, arg_2op *a)
+{
+    return do_2op(s, a, gen_helper_mve_vsbc);
+}
+
+static bool trans_VSBCI(DisasContext *s, arg_2op *a)
+{
+    if (mve_skip_first_beat(s)) {
+        return trans_VSBC(s, a);
+    }
+    return do_2op(s, a, gen_helper_mve_vsbci);
+}
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
-- 
2.20.1


