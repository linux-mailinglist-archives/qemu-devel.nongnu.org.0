Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D039E5E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:51:20 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJPD-0003hM-9c
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbD-0008BW-0e
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaZ-00084h-RQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h3so91989wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/dbcaZ35VQzjGpYiGimMfbRRlmi/LegWLbSCLBzEsU=;
 b=ckDAKhYSQBLEHp+PgdJs+oTxk/8JahS9RzVq58iiAfEgbafTG/AAu5rVYIP+PM0K3z
 bTIs9RbsMWEzqX3+6XnhD3+1iofwA3p1+sY/NmGFRBhz2i2l6HQZT5vcmBIpYw3lWgb5
 vPjHw3M0tPncaccjx3F70zj60/gWLOhK5xqa3nThJD5bkGito2RUjaR6/DEdR4mWtc4k
 PWwZ9otNlRC8a3NtGQJoi6DOFsBSqflzyp6Tv04MLyqfyG9Cl0yam6kQ5EzDtWc8wspc
 6IpMc5nSDnY4Arg7Rn4kqKfWVdAg059H0ELwSnQQm9PvE8BcLkxRN4/LoHA8uCeTqhs3
 GJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/dbcaZ35VQzjGpYiGimMfbRRlmi/LegWLbSCLBzEsU=;
 b=eay+VKmcCaeIGrA2o7zp9AgPmUvb0ZBzTZWf6KMRUhwyxgsmxJa14zFrrJJSTJVAzN
 weoYe9+MfWiJakdyqusp9BHEm4fokREQTcfRyG3M7el2aboOsCpMR0usl4c8IxkDhoif
 k5joc+zudQtL85CWaDetxm/gsJfYEizg3FgF5Jv4yN97Eh1pD+yyiDLB/6vljEQCJteR
 EyB3Z/SUy/36Da/PuQNyS7m3idrUmCdDhKFKlRw04WsEj2KdDrnPzO3JEcatOUtus6tY
 1Ax219oMWEOOl1N1lWk/W3L6lR+G5STyP9vFNT4sWBfIwGal8D9BfpZitB+qgngvy1mx
 H7Sg==
X-Gm-Message-State: AOAM532h0BET9LiFmQEItBf41KM8FC4Q/mnAkf3kCzKg5DuoMMpqG3wU
 Tp07D4B4vRPAo14jgmUmkPQhCQ==
X-Google-Smtp-Source: ABdhPJzVAppxoN6P9xtLw34zd1qJbvgQFnc7c0nEwMXjvrbPOXQfCFjVRVL8lRtTk/VANiXEyswdcg==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr18271551wmq.42.1623085137502; 
 Mon, 07 Jun 2021 09:58:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/55] target/arm: Implement MVE VQSHL (vector)
Date: Mon,  7 Jun 2021 17:58:09 +0100
Message-Id: <20210607165821.9892-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Implement the MVE VQSHL insn (encoding T4, which is the
vector-shift-by-vector version).

The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 +++++
 target/arm/mve.decode      | 12 +++++++
 target/arm/mve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 95 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9801a39a984..352b6a46a5e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -171,6 +171,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index d3562f80026..7ac41cb1460 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -376,6 +376,18 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_SAT_U(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, uint8_t, H1, FN)       \
+    DO_2OP_SAT(OP##h, 2, uint16_t, H2, FN)      \
+    DO_2OP_SAT(OP##w, 4, uint32_t, H4, FN)
+
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_SAT_S(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, int8_t, H1, FN)        \
+    DO_2OP_SAT(OP##h, 2, int16_t, H2, FN)       \
+    DO_2OP_SAT(OP##w, 4, int32_t, H4, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -564,6 +576,67 @@ DO_2OP_SAT(vqsubsb, 1, int8_t, H1, DO_SQSUB_B)
 DO_2OP_SAT(vqsubsh, 2, int16_t, H2, DO_SQSUB_H)
 DO_2OP_SAT(vqsubsw, 4, int32_t, H4, DO_SQSUB_W)
 
+#define DO_SQSHL_OP(src1, src2, satp)                           \
+    ({                                                          \
+        int8_t tmp;                                             \
+        typeof(src1) dest;                                      \
+        tmp = (int8_t)src2;                                     \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {                 \
+            if (src1) {                                         \
+                *satp = true;                                   \
+                dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
+                if (src1 > 0) {                                 \
+                    dest--;                                     \
+                }                                               \
+            } else {                                            \
+                dest = src1;                                    \
+            }                                                   \
+        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) {         \
+            dest = src1 >> 31;                                  \
+        } else if (tmp < 0) {                                   \
+            dest = src1 >> -tmp;                                \
+        } else {                                                \
+            dest = src1 << tmp;                                 \
+            if ((dest >> tmp) != src1) {                        \
+                *satp = true;                                   \
+                dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1)); \
+                if (src1 > 0) {                                 \
+                    dest--;                                     \
+                }                                               \
+            }                                                   \
+        }                                                       \
+        dest;                                                   \
+    })
+
+#define DO_UQSHL_OP(src1, src2, satp)                   \
+    ({                                                  \
+        int8_t tmp;                                     \
+        typeof(src1) dest;                              \
+        tmp = (int8_t)src2;                             \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {         \
+            if (src1) {                                 \
+                *satp = true;                           \
+                dest = ~0;                              \
+            } else {                                    \
+                dest = 0;                               \
+            }                                           \
+        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) { \
+            dest = 0;                                   \
+        } else if (tmp < 0) {                           \
+            dest = src1 >> -tmp;                        \
+        } else {                                        \
+            dest = src1 << tmp;                         \
+            if ((dest >> tmp) != src1) {                \
+                *satp = true;                           \
+                dest = ~0;                              \
+            }                                           \
+        }                                               \
+        dest;                                           \
+    })
+
+DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
+DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 957e7e48fab..998f47fb94e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -421,6 +421,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VQSHL_S, vqshls)
+DO_2OP(VQSHL_U, vqshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


