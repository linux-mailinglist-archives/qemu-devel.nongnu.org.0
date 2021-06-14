Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173363A6AE8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:50:07 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoqk-0004Va-45
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFF-0002q0-LQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEp-0000dr-A8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id f17so12343192wmf.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wcZxpRuNVl8m/x6IwxRgZ1t/II2usAztG6iFaiDT4GY=;
 b=M7IO4mXk2uGs3jSdInMkPzQ0fPKxCO0xfVzs7+tSnqfjQUJ2YaReSEIguMvzJZewRT
 NcoJBIlYpsyenMP4YmLDSCMBxVPk/SGRCGynbvTk0XfxUP+a0U7tGfB6Pg70MXi6u/lz
 IUWIU3FZ1PpMxgdEOYn4vdOy3Ktyv005Sq+gLKOEom2lZCzJI04RxOoFin26StSI7F2J
 WAOeo5pMy+NnheFFxZLKUq0wXUMyP9Vks/MKSZAVVnvJ0xv5ITwJbRMBFDok8qlOs//L
 EPSGQTtOz7y/XwdFTcL9NoKSZ/5XILiLyWgtBGzj3eGQ/r3tgv3H7keagJcXFmPuNAKl
 56lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wcZxpRuNVl8m/x6IwxRgZ1t/II2usAztG6iFaiDT4GY=;
 b=jdUQuckD9Axu/QK2QVm8FYrpeBGoOi0w/lDIdAAmNSMpVlzBB7f0FKT/p7eO63ZD9N
 Pe62U0Ak62PkPZSgiwj5VT9COiORdMuip6cOjXrMLDRzLk5XLbsi3rddkbVXqETTX4lH
 Ky97QrP9kcwvoIoR9HAjkDlf7Zuy0WK37PNlo7BTjbFAiJ+XFmrkTr4BTTXa6vF2pCUu
 yYEOQNA9d5bUVMJ8hu83uG+WQ/zWotersvdRCSgn9GVd9yO6mjgi8ALBWM3t+BRXadgk
 5oQqkkhTCe6jzcJHgjVxGj4XG+0/2w+YPbQJW6Z/cd9mxxvN0T9ziKQo/ksVOfBCEITk
 m8qw==
X-Gm-Message-State: AOAM532qJksTxVgXm9AbAPQMPAEa42YYm7g6AAubuMkFSau/5qBKywqF
 +ijhgs/hTdbMn9ZZ/XSsGoL/zQ==
X-Google-Smtp-Source: ABdhPJwF0yZB2xkRl2hQxJBQkkMFG87j5WIXiOK/OcD/ZlHutq8bADGzEnTvHRR+TXEg5qKhgerpCQ==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr33186764wmq.143.1623683453746; 
 Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 53/57] target/arm: Implement MVE VADC, VSBC
Date: Mon, 14 Jun 2021 16:10:03 +0100
Message-Id: <20210614151007.4545-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VADC and VSBC insns.  These perform an
add-with-carry or subtract-with-carry of the 32-bit elements in each
lane of the input vectors, where the carry-out of each add is the
carry-in of the next.  The initial carry input is either 1 or is from
FPSCR.C; the carry out at the end is written back to FPSCR.C.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index a8ff921144d..4b941f73f05 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -552,6 +552,58 @@ DO_2OP_U(vrshlu, DO_VRSHLU)
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
index a4efb9bc3eb..c21f5afe230 100644
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


