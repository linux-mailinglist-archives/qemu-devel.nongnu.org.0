Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A053AB3DF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:42:42 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrM0-0001XH-86
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx9-0001lx-7n
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwy-00074Q-VU
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id c9so6547741wrt.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbkHoSNs6J2houYuZnK6YCgx5+RFrPH2605DmnBtA9o=;
 b=Jlxte7Is7q1W+L6tbJcAdwR3FjCNoYWe2DhdHlyqWYON/pmT2OQsiqLZD5Ub7Vgwfb
 Kq/VE0DRLrjzNY0wngc4T69oEkaQlTibWWdk6XRYiZ6G44CFxhQZAltANI49o1K9hhyV
 yCbMb/AIJq5CxnGxV9DlqvkBWKt9QumbvQW9Oj8sEutanbm/EETTaWJ4LUkgmT3I2405
 AqoIoY/XxadE5yqJ1BDHwnr7fn5gx8OTbKVc6VaX+xbirsQFD1yfw/Ae4CjN6p0XHlXA
 4/BRqbQ04S00EPUBrxeQr390QHMd3cCy/k10pGcacp2pFjAxs/msDpElnKCJDMkSdEQT
 6P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbkHoSNs6J2houYuZnK6YCgx5+RFrPH2605DmnBtA9o=;
 b=qB6BLvPouthU8nsRpo8RzkddJnMFZB94+dpgaiQ1+F2JbEXle9tMZ2bK1wgQhgZ83y
 +qFSObYpzSCu2EPTbHiTp60OyV3hop9X4/7Qd3tc9EK1D+BkpHXfmccpOmI2GLPQGmvZ
 tJTBzcNiKjL7D07xE324yTdF8R8j2d5Zs4yrzvwZtYiq+cFUiVtM8QOlmnxDsQqyon8W
 WWmoqsvY/GDcv21J0YgvYgO0rFds14a8wVba4Y7+J73j8kOBIF6kgx2J/64WCLsUWza2
 9oUOT7OdIvo8PnHuJzfULBXsqDqd4P1BGRveddNx8kYhEjt13hp5RBGUgT/sVgvwOlHP
 nkkA==
X-Gm-Message-State: AOAM533hgHE1CRlsSxRsFrCI1qCBqb0bIXmHSo1uH5DIZjnGQ5s7I3h/
 TG3wN8VgYM3lDbLNwwYqV3vbYQ==
X-Google-Smtp-Source: ABdhPJySBo8//W+5QjfdwQy2vu/67EqDr+eWPlnWoYpNYjop4LIUr/rR5EeviqA88r1cxBxLDWilZQ==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr5285240wru.133.1623932207641; 
 Thu, 17 Jun 2021 05:16:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 22/44] target/arm: Implement MVE VADD (scalar)
Date: Thu, 17 Jun 2021 13:16:06 +0100
Message-Id: <20210617121628.20116-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Implement the scalar form of the MVE VADD insn. This takes the
scalar operand from a general purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 22 +++++++++++++++++++
 target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f9d4b242beb..16b974a4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,10 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ac68f072bbe..0ee7a727081 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,6 +26,7 @@
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
+&2scalar qd qn rm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -36,6 +37,8 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+@2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -154,3 +157,7 @@ VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_no
 VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+
+# Scalar operations
+
+VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b51b7cd52e4..19cd1964f86 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -506,6 +506,28 @@ DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
 
+#define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], FN(n[H##ESIZE(e)], m), mask);    \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* provide unsigned 2-op scalar helpers for all sizes */
+#define DO_2OP_SCALAR_U(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
+    DO_2OP_SCALAR(OP##h, 2, uint16_t, FN)       \
+    DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
+
+DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a0c4f10a935..388848b4ff0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
@@ -383,6 +384,50 @@ DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 
+static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
+                          MVEGenTwoOpScalarFn fn)
+{
+    TCGv_ptr qd, qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qn) ||
+        !fn) {
+        return false;
+    }
+    if (a->rm == 13 || a->rm == 15) {
+        /* UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    rm = load_reg(s, a->rm);
+    fn(cpu_env, qd, qn, rm);
+    tcg_temp_free_i32(rm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_2OP_SCALAR(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1


