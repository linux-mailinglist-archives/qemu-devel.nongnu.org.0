Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BB3A6AB1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:42:42 +0200 (CEST)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsojZ-0003L0-93
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFA-0002VP-L4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEo-0000ct-5o
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f17so12343133wmf.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2AI56BEiD77sm3umQwP5ChcdSG3BF9TV7uVZN96Qk8=;
 b=k6xgaoVBnZW4I61Eavqjp1RuAikAKH2ToME+eq5uimx312hHxFpShp/mY1a7uiORDs
 tMxkn7XGoc8F0beYb3LQ74ozBXZfMEAuWDnzpWyYEv/p2RV9M7hwUsXmjCUgG/sXPvEg
 yvIsH7ibkiolwlkSh29IpbtqvsYTfNWealMxLc1MTjva55zl7ltszr85j6LZXFlRue6Q
 MaWNa4AKSiDHGhA5vEKPO2X3VrkjsBzaBJC2j8+l8GyPI52Oq67K3zRZfTdub2MGCw3s
 x9acNXEdkuasdhP2Q/oeS1qWGNxlmj4KgJDtouGIgKz93Ina9tcWjybI5cLMuFbk5TtL
 UNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2AI56BEiD77sm3umQwP5ChcdSG3BF9TV7uVZN96Qk8=;
 b=RIzdOMHgoRsiPW1L3lJ/lec4SylPmPZiP5XaorWXnuCBnT/3x51y7Wpip2FTAnRnm5
 M+f/FtZnSxCIJFNertMGJ7siMW24Ie0v7q+sz5Klq2cqTAZ4LAtcaMFXVG2hJZSqdvI7
 KkW5I8kayaCa4wRq2w70usexVZddMTsUORXp8HngXGxp/6GRlTS5ljXz2yYxqpqb/0zl
 azrxjZPpRcK8uSl/gB3rjbRawAGmwLFNcq/rwonni4CQioagWXxLIE4VUn/UNAFZxLqV
 CURNWF8YI2zEJ6aHq9p9k4+vtbQHQ5zxNcSYvnhOJNkUAvS3kykkuqVC0SUZysCkK2L2
 onmw==
X-Gm-Message-State: AOAM530/m1YXLwOOjuGHjdNdGlqNO86HrBMPgV6pqbtwNaz3GiL0ShYt
 u23TZIJXF9y82b53eeHcHWkNyw==
X-Google-Smtp-Source: ABdhPJygVYNjpql0QOBUbuNq/WJPqH1d6aiU0Ec/2NjcxJnvTt/3f4gsMEnmjAU35BqD7cYqLAW+Bg==
X-Received: by 2002:a05:600c:3504:: with SMTP id
 h4mr31477562wmq.118.1623683451935; 
 Mon, 14 Jun 2021 08:10:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 51/57] target/arm: Implement MVE VQDMULL (vector)
Date: Mon, 14 Jun 2021 16:10:01 +0100
Message-Id: <20210614151007.4545-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the vector form of the MVE VQDMULL insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 61f8082e0e3..34a46ed38ee 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -233,6 +233,11 @@ DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullbh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index fa4fb1b2038..3a2a7e75a3a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -39,6 +39,8 @@
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
+@2op_sz28 .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn \
+     size=%size_28
 
 # The _rev suffix indicates that Vn and Vm are reversed. This is
 # the case for shifts. In the Arm ARM these insns are documented
@@ -152,6 +154,9 @@ VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
 VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
 VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
+VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bd348f034df..7c5b36caae9 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -914,6 +914,36 @@ DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, 2, int16_t, 4, int32_t, \
 DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, 4, int32_t, 8, int64_t, \
                     do_qdmullw, SATMASK32)
 
+/*
+ * Long saturating ops
+ */
+#define DO_2OP_SAT_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN, SATMASK)  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                void *vm)                               \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        bool qc = false;                                                \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE op1 = n[H##ESIZE(le * 2 + TOP)];                      \
+            LTYPE op2 = m[H##ESIZE(le * 2 + TOP)];                      \
+            mergemask(&d[H##LESIZE(le)], FN(op1, op2, &sat), mask);     \
+            qc |= sat && (mask & SATMASK);                              \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_2OP_SAT_L(vqdmullbh, 0, 2, int16_t, 4, int32_t, do_qdmullh, SATMASK16B)
+DO_2OP_SAT_L(vqdmullbw, 0, 4, int32_t, 8, int64_t, do_qdmullw, SATMASK32)
+DO_2OP_SAT_L(vqdmullth, 1, 2, int16_t, 4, int32_t, do_qdmullh, SATMASK16T)
+DO_2OP_SAT_L(vqdmulltw, 1, 4, int32_t, 8, int64_t, do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 502ab1f1398..ca1203e650d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -419,6 +419,36 @@ DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 
+static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
+{
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullbh,
+        gen_helper_mve_vqdmullbw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
+{
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullth,
+        gen_helper_mve_vqdmulltw,
+        NULL,
+    };
+    if (a->size == MO_32 && (a->qd == a->qm || a->qd == a->qn)) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op(s, a, fns[a->size]);
+}
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
-- 
2.20.1


