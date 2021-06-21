Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECE3AF172
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:08:37 +0200 (CEST)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNPY-000650-Mm
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnW-0007k1-RY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnT-0007kJ-LJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id k42so9060407wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oo7c07DMiv9B+5x4UFvOKnpV7Ib/XCnbbC9gGn7BgbA=;
 b=R0opQ4UiNt3OYSQpkS/YgZI/DKKtUbZdu91mrXOsNXeotxGdYGO1mP/brh4vQ0DRVM
 1+9SnLdubjCVgolDRdQ7QMbjqodYxt90tWadFB1U+ro6vVg7zcJvOXr82VyWz7KVM0mb
 wawcQHrzl81pR1sNvvND1FqEd+NlxTIBh5masIe1g+8h62xmtxJz+HV+iWeZT0W9pVwo
 MeLqXCcPaWKWBeNre6aMJQ6Xf16RGcAQ8qbPTYKJGKTdQ1x93gDcr+iAdDldtxP0w4eQ
 tyNx7R8WkxA6JakRxMW4/44t8BspkTbTwKjHazaJaqrzrlwxP3DqKt1JphSbZkJmX8Ct
 6MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oo7c07DMiv9B+5x4UFvOKnpV7Ib/XCnbbC9gGn7BgbA=;
 b=DBDAURhvD8fH84bFViWsD/0nUnNz+S/EWLkbkBtMl5q8bhL7YzkB++FEuvV2nxJv5l
 hd9Xz62kjLzSY2vedWYuuPxaQ3gsmQ+F+3wBoC6Lm/U91zoi702Sqg8OalbZXySzBnMC
 9d6lFt/HgFZxal87MNcaQQ9v36TfVj4ONWt7FkdhbUo51Uui3Y8BcDYnGpQSExktEssj
 4N/tWlY6OOVCt8a7YQgoHnxJqnseJ5QFHHbdqYxlXRD2RuMxcNO9lQnClC2SXMw2VIsJ
 GGd9O2ywkXPcMm2wpI+2jCJ7xTeN9e1iBFH/F5y7BU2GUY18o6YHcdG2ykRPOMcOKQ35
 oZPw==
X-Gm-Message-State: AOAM532ps1Zicr+XJ6xSzg7toGjdPKm5aKrvs62qoBHCYZ9mp6jLgls7
 UwPCrNNZmJgU871Ki5ywqYsA/T2zxNz7Xzhc
X-Google-Smtp-Source: ABdhPJynOrXsTtDiH4eb5AoK4QfpB07xoLkzueP+1Qz44cRzDpBuupR3EYh+A3G229+CQ5Qg40MA4g==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr20616025wmk.47.1624292954404; 
 Mon, 21 Jun 2021 09:29:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/57] target/arm: Implement MVE VQSHL (vector)
Date: Mon, 21 Jun 2021 17:28:19 +0100
Message-Id: <20210621162833.32535-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Implement the MVE VQSHL insn (encoding T4, which is the
vector-shift-by-vector version).

The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-33-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      | 12 ++++++++++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 93847fc04ad..1c5626bb726 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -169,6 +169,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 80fa647c08f..2c37e265765 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,15 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+# The _rev suffix indicates that Vn and Vm are reversed. This is
+# the case for shifts. In the Arm ARM these insns are documented
+# with the Vm and Vn fields in their usual places, but in the
+# assembly the operands are listed "backwards", ie in the order
+# Qd, Qm, Qn where other insns use Qd, Qn, Qm. For QEMU we choose
+# to consider Vm and Vn as being in different fields in the insn.
+# This gives us consistency with A64 and Neon.
+@2op_rev .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qn qn=%qm
+
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 @2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
@@ -121,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1349a58b010..5ffc0720d89 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -389,6 +389,18 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_SAT_U(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, uint8_t, FN)           \
+    DO_2OP_SAT(OP##h, 2, uint16_t, FN)          \
+    DO_2OP_SAT(OP##w, 4, uint32_t, FN)
+
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_SAT_S(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, int8_t, FN)            \
+    DO_2OP_SAT(OP##h, 2, int16_t, FN)           \
+    DO_2OP_SAT(OP##w, 4, int32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -577,6 +589,28 @@ DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
 DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
 DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
 
+/*
+ * This wrapper fixes up the impedance mismatch between do_sqrshl_bhs()
+ * and friends wanting a uint32_t* sat and our needing a bool*.
+ */
+#define WRAP_QRSHL_HELPER(FN, N, M, ROUND, satp)                        \
+    ({                                                                  \
+        uint32_t su32 = 0;                                              \
+        typeof(N) r = FN(N, (int8_t)(M), sizeof(N) * 8, ROUND, &su32);  \
+        if (su32) {                                                     \
+            *satp = true;                                               \
+        }                                                               \
+        r;                                                              \
+    })
+
+#define DO_SQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
+#define DO_UQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+
+DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
+DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9f59ed591bc..52fef6cd892 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -402,6 +402,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VQSHL_S, vqshls)
+DO_2OP(VQSHL_U, vqshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


