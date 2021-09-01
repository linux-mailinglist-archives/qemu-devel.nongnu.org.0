Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527F3FD7CD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:39:42 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNef-0001UH-EJ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc9-0006mn-Jv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc6-0005eH-VC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id q14so3762507wrp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CDghGKNxB38lPfiyQ/7haMC6qZxl8ZbSdUy9LBKKEMk=;
 b=z1ZezLE75PtzMtp7lCgSBWG88uCu0bhR4gK+QybqT1OXKvER7qvsC9Q8Jq1Zd2t3ha
 mswLM0Q94MdM1tlaRbYlkxUBoMpK6FWngu1OLf7w4/tXpA/5JhQTGdyafhHSYuQhEBJh
 /uj2MJHg3z6NmmBUSHovj7n/9xUoI+Dl/GasBWYnq7/Z47jq7RtrQJ0AMyKyW9h60Zqo
 mXSe1V5ud/ukK/NkoK/u5SXeAYTDcl4f0V8BctfQ2Mai56TYo4jCcS+BFkxitjjdtrld
 U7hylHh/L5ONBVwZJsGTfx9fMyrjBxLDB4zXYbt4NVGxUV6gbRh/He3n8ngMeiQIXMu1
 kVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDghGKNxB38lPfiyQ/7haMC6qZxl8ZbSdUy9LBKKEMk=;
 b=F6hHgWkSzqgFOVlpqOGK93VoDWENyBeDdZ7OPwwuQ7pIUq3xuRVOTMm5ix07yKBR2x
 PJaziQZG45U2mzuBP+frhyVFFjVfu4lZVHqW+i4da5ZeN6mjx4KARVqIvU3ktDUcIOhR
 jLcmAxz1f7SpixBmtYM1W5lDwq+GGV6+NQKKcbIDGeIVcK6VIBmt8EVexxccOCak3+C9
 FBarHUYYInvzHZhaSh5xUW0ng04PABZRuJeHDjRuz1nox2GywLQ96Jg1fpVocmSOjhnN
 VAjOz4Coq0aI5no6LaPZtQf5UPtaXwB1PtY2AWkhNeu+h0r1mwoUiMiMPCf7BD2MqemA
 8iWw==
X-Gm-Message-State: AOAM533RYrWDJKfyfzsGTIzTKnjoWFGL+aGO8MojX3CmnmFQqQ+P4Z9R
 OR40JlKk7HafXe9dU4o9GTDfoqjsGsVJIQ==
X-Google-Smtp-Source: ABdhPJwpHIEIQfFsOHDx0tjVxWrp8cr4JSh8GHKEWOd7lSivVIYIn2jtc6r1yDsHD7ey+BAkUqqlTw==
X-Received: by 2002:adf:b745:: with SMTP id n5mr37850991wre.338.1630492621571; 
 Wed, 01 Sep 2021 03:37:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/51] target/arm: Implement MVE VCADD
Date: Wed,  1 Sep 2021 11:36:10 +0100
Message-Id: <20210901103653.13435-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Implement the MVE VCADD insn.  Note that here the size bit is the
opposite sense to the other 2-operand fp insns.

We don't check for the sz == 1 && Qd == Qm UNPREDICTABLE case,
because that would mean we can't use the DO_2OP_FP macro in
translate-mve.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  8 ++++++++
 target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++-
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 370876d7934..42eba8ea96d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -428,6 +428,12 @@ DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cdbfaa4245b..c728c7089ac 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -29,6 +29,8 @@
 # 2 operand fp insns have size in bit 20: 1 for 16 bit, 0 for 32 bit,
 # like Neon FP insns.
 %2op_fp_size 20:1 !function=neon_3same_fp_size
+# VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
+%2op_fp_size_rev 20:1 !function=plus_1
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -125,6 +127,9 @@
 @2op_fp .... .... .... .... .... .... .... .... &2op \
         qd=%qd qn=%qn qm=%qm size=%2op_fp_size
 
+@2op_fp_size_rev .... .... .... .... .... .... .... .... &2op \
+                 qd=%qd qn=%qn qm=%qm size=%2op_fp_size_rev
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -631,3 +636,6 @@ VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
 
 VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
 VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+
+VCADD90_fp        1111 1100 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d6bc686c985..2cc8b3e11b7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2854,3 +2854,43 @@ static inline float32 float32_abd(float32 a, float32 b, float_status *s)
 DO_2OP_FP_ALL(vfabd, abd)
 DO_2OP_FP_ALL(vmaxnm, maxnum)
 DO_2OP_FP_ALL(vminnm, minnum)
+
+#define DO_VCADD_FP(OP, ESIZE, TYPE, FN0, FN1)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r[16 / ESIZE];                                             \
+        uint16_t tm, mask = mve_element_mask(env);                      \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0, tm = mask; e < 16 / ESIZE; e++, tm >>= ESIZE) {     \
+            if ((tm & MAKE_64BIT_MASK(0, ESIZE)) == 0) {                \
+                r[e] = 0;                                               \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(tm & 1)) {                                            \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H##ESIZE(e)], m[H##ESIZE(e + 1)], fpst);   \
+            } else {                                                    \
+                r[e] = FN1(n[H##ESIZE(e)], m[H##ESIZE(e - 1)], fpst);   \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], r[e], mask);                     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCADD_FP(vfcadd90h, 2, float16, float16_sub, float16_add)
+DO_VCADD_FP(vfcadd90s, 4, float32, float32_sub, float32_add)
+DO_VCADD_FP(vfcadd270h, 2, float16, float16_add, float16_sub)
+DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 98282335820..6203e3ff916 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -852,6 +852,8 @@ DO_2OP_FP(VMUL_fp, vfmul)
 DO_2OP_FP(VABD_fp, vfabd)
 DO_2OP_FP(VMAXNM, vmaxnm)
 DO_2OP_FP(VMINNM, vminnm)
+DO_2OP_FP(VCADD90_fp, vfcadd90)
+DO_2OP_FP(VCADD270_fp, vfcadd270)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
@@ -883,7 +885,7 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     return true;
 }
 
-#define DO_2OP_SCALAR(INSN, FN) \
+#define DO_2OP_SCALAR(INSN, FN)                                 \
     static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
     {                                                           \
         static MVEGenTwoOpScalarFn * const fns[] = {            \
-- 
2.20.1


