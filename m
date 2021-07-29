Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93E3DA280
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:52:19 +0200 (CEST)
Received: from localhost ([::1]:40574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94aI-0006U1-KV
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941T-0001Jr-Px
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9410-0001PB-Kj
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c16so6429435wrp.13
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vs7FOGHKNBHJAr5iI+u8DlBQ7avOBil7+a3EJ4GTK7A=;
 b=urv6983rsVGMK8660734Y52LxNNBcqb122uhO5d61JrdfKVttoPvBfkk22TqmiFRRx
 ZZObWjDy6uyI05loD0aPS1IMnRTqUA66nw+lrYSusXlvGJrh0BjLeWwhx2zx/dVu/LF0
 jfTKucasakmJvlISZCXJeN8BwFnhpK7joq8a0sNpUyVFBYOBSuFU6WDnNQC+itAHdHba
 qTUgc2TVbxJ7gbkSrtnFhhZ7syjaB2ox89Dzhk9FChN+PTopGdM/Ii20M29GGdO6urgH
 ViYAAB6Z0P+6TJkkS68WB8YjnSS9dkhZ27mG99WCYBdTBqvJCINZTYwtQJjL04qODK9A
 VjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vs7FOGHKNBHJAr5iI+u8DlBQ7avOBil7+a3EJ4GTK7A=;
 b=ZGnknzsLMS8321BhjvBVTSFXTGT2iPeavRdij9hqkGwUOaLo4U5k0BALdO2TUVZw1n
 MqA0lJOCjyqVJNFuO79SjHNGA19v14TZyRhyPAzRdUdVNs+Pn1Xvq22Ys76xfZMTKvYe
 2qHvtI0DRQADmrXEpDnX735ubfm366g5+ztQ3B83qvxfI+0AkTcaM65xpVYcnWqTrkTy
 8lrtTE3DDdnuQhy5tQyP2sC+ZOaZpE9yxGQhZl/IFAq0F93lRxN2Z0q6wtWKLs7qF/nr
 2PBtZzS6O6Mo5jFEbYRwIJm1tFopChJhc13dET7MpsWZJSgXHM16tSJyIvmSkAphAtl9
 hfJg==
X-Gm-Message-State: AOAM532cW2iPc4/f2gP6wryGFiM7T/RF1Cmh4GNKbLb2COBl6pgwHLAD
 I2nOqKfRt+kiviw8W8i508XX6an+iDuyqw==
X-Google-Smtp-Source: ABdhPJzNeK0GMZ6luY/LkTfl0a8r/zo+64X3HDr2vGLLuoIGk1sjueI60712syDGR1gKyppkHJ/T2w==
X-Received: by 2002:adf:fc12:: with SMTP id i18mr4214481wrr.138.1627557349053; 
 Thu, 29 Jul 2021 04:15:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 41/53] target/arm: Implement MVE VMAXNMA and VMINNMA
Date: Thu, 29 Jul 2021 12:15:00 +0100
Message-Id: <20210729111512.16541-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the MVE VMAXNMA and VMINNMA insns; these are 2-operand, but
the destination register must be the same as one of the source
registers.

We defer the decode of the size in bit 28 to the individual insn
patterns rather than doing it in the format, because otherwise we
would have a single insn pattern that overlapped with two groups (eg
VMAXNMA with the VMULH_S and VMULH_U groups). Having two insn
patterns per insn seems clearer than a complex multilevel nesting
of overlapping and non-overlapping groups.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 11 +++++++++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 44 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 73950403bc3..57ab3f7b59f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -428,6 +428,12 @@ DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vmaxnmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vfcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 403381eef61..b0622e1f62c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,11 @@
 @2op_fp_size_rev .... .... .... .... .... .... .... .... &2op \
                  qd=%qd qn=%qn qm=%qm size=%2op_fp_size_rev
 
+# 2-operand, but Qd and Qn share a field. Size is in bit 28, but we
+# don't decode it in this format
+@vmaxnma  .... .... .... .... .... .... .... .... &2op \
+          qd=%qd qn=%qd qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -199,6 +204,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 # The VSHLL T2 encoding is not a @2op pattern, but is here because it
 # overlaps what would be size=0b11 VMULH/VRMULH
 {
+  VMAXNMA        111 0 1110 0 . 11 1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=2
+
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -211,6 +218,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMAXNMA        111 1 1110 0 . 11  1111 ... 0 1110 1 0 . 0 ... 1 @vmaxnma size=1
+
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -221,6 +230,7 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMINNMA        111 0 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=2
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
@@ -233,6 +243,7 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 }
 
 {
+  VMINNMA        111 1 1110 0 . 11  1111 ... 1 1110 1 0 . 0 ... 1 @vmaxnma size=1
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 489892344b4..d44369c15e2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2860,6 +2860,31 @@ DO_2OP_FP(vmaxnms, 4, uint32_t, float32_maxnum)
 DO_2OP_FP(vminnmh, 2, uint16_t, float16_minnum)
 DO_2OP_FP(vminnms, 4, uint32_t, float32_minnum)
 
+static inline float16 float16_maxnuma(float16 a, float16 b, float_status *s)
+{
+    return float16_maxnum(float16_abs(a), float16_abs(b), s);
+}
+
+static inline float32 float32_maxnuma(float32 a, float32 b, float_status *s)
+{
+    return float32_maxnum(float32_abs(a), float32_abs(b), s);
+}
+
+static inline float16 float16_minnuma(float16 a, float16 b, float_status *s)
+{
+    return float16_minnum(float16_abs(a), float16_abs(b), s);
+}
+
+static inline float32 float32_minnuma(float32 a, float32 b, float_status *s)
+{
+    return float32_minnum(float32_abs(a), float32_abs(b), s);
+}
+
+DO_2OP_FP(vmaxnmah, 2, uint16_t, float16_maxnuma)
+DO_2OP_FP(vmaxnmas, 4, uint32_t, float32_maxnuma)
+DO_2OP_FP(vminnmah, 2, uint16_t, float16_minnuma)
+DO_2OP_FP(vminnmas, 4, uint32_t, float32_minnuma)
+
 #define DO_VCADD_FP(OP, ESIZE, TYPE, FN0, FN1)                          \
     void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
                                 void *vd, void *vn, void *vm)           \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d62ed1fc295..4d702da808d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -864,6 +864,8 @@ DO_2OP_FP(VCMLA0, vcmla0)
 DO_2OP_FP(VCMLA90, vcmla90)
 DO_2OP_FP(VCMLA180, vcmla180)
 DO_2OP_FP(VCMLA270, vcmla270)
+DO_2OP_FP(VMAXNMA, vmaxnma)
+DO_2OP_FP(VMINNMA, vminnma)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


