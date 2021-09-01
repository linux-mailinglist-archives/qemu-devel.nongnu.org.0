Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F53FD82F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:52:13 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNqm-0007L3-6t
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcF-0006z3-43
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc8-0005h2-U6
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:10 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1587837wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uIL/JKNlltw4EN6kRtqTAh5RgOnu1Wq5yQDPOpSyymg=;
 b=sKENnf0IlKPZI/ecKr1NkdWiW8UbKS8RCSJCJY/mVEeM5BVPzEMe7/E1j/iuXrjcys
 FwQbXsbpcYMDlUfNzVM99NP5ULMy4Q/PynygtZxim3RjtwsxnxkHKQPLuo9xsfRGlqVM
 5VWbY1aabZeUeK1S+/b6KLgTnIYRKZQsbe5roQgV6Ln0JO+ciT4+Q7x5U94lbfEedyVm
 wmyRQ68fIN7lWH9N+7N16kvIO7jBvZxSrJ6Stk/GXisQ275y+CTom7FiChIz7+6h7Q5f
 AReUTuu9Qq/puVombpFYMfPVzBPpSg8+BrrYwuNl2tM1OSwflaZ5QHwLSiRgvovLcapt
 adqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uIL/JKNlltw4EN6kRtqTAh5RgOnu1Wq5yQDPOpSyymg=;
 b=TJq/qzlSjHlNAWuBNfVoVk2uV9w7xO0G7yRtgnpy9pApBWeeWQYfhhI0I84PZ7PQs+
 ZVR+0MxF8vHW1I8LuWkBQXU/388/355L5BggToTphANszYkQ6cFsiutjMU3c3zrIMtBR
 LTxGQhT0souzzy3jCaELG7YCSfi7j2p4wa2KIprGQH5xO3prOxjbj5YeXqwdDLopwOPI
 FjQxNyAVs1Rhx13Gy9IuC/b26z23NPXuHpWuzupJPxZaxl7WzxH1VwNs2gvQF8XDVInT
 bcSACRFneTQMLPA9uRtVp+fRC3tlPXcnifwbrVss94J1xXeBr1+PowSVofQaC9JWjexb
 yKIw==
X-Gm-Message-State: AOAM532g6kWI/iHywJ++jhCfIt5Vn7P3aBDb15yRKHHl6MZAG4sCTj5d
 QuEHmysHpYaOQk+jBJXqVZeqKMG9aVgegw==
X-Google-Smtp-Source: ABdhPJwB48oca6kfd7Ru9SoiWqyEoh6USRic82gZODp0yUUbP/eApZ/TIGfEIop0ooL5BXKHVNCWeg==
X-Received: by 2002:a1c:a9d2:: with SMTP id s201mr8717082wme.81.1630492623508; 
 Wed, 01 Sep 2021 03:37:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/51] target/arm: Implement MVE VMAXNMA and VMINNMA
Date: Wed,  1 Sep 2021 11:36:13 +0100
Message-Id: <20210901103653.13435-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 11 +++++++++++
 target/arm/mve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 42 insertions(+)

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
index e478408fddd..a6ad894414a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2855,6 +2855,29 @@ DO_2OP_FP_ALL(vfabd, abd)
 DO_2OP_FP_ALL(vmaxnm, maxnum)
 DO_2OP_FP_ALL(vminnm, minnum)
 
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
+DO_2OP_FP_ALL(vmaxnma, maxnuma)
+DO_2OP_FP_ALL(vminnma, minnuma)
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


