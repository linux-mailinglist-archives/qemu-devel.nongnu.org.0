Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101C39E565
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:28:55 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ3W-0003SU-DZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIau-0007gl-BL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:20 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaQ-000808-NX
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a20so18491743wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rYQ4/VTW64aDOScj4zmfC/qPGaCb6zVYq6DVXxcIMj0=;
 b=IdPa92XYm9opfhjrbDAoTAKTYk2OLGvmo02oYMs5OipiUJlNSeGLgUm57JriV+pAju
 0/MarxIQ0fp3K25VESwyLR9aySo8fpQNvTnyJxYjGnIhbbIM8Kvk1xc/L2qGR3+cGJN7
 OUreKJo2unB3tY/bxldhtq81dz7He5DJV1H4Gjgv9RXnsO06WTGLbHA/tlcnNz1Zh6Y5
 dQSCtfyxSleeVJBiyNV12WuvBc4+iQWyenBdwVVMEg2YB/MftMwQDvyVFOxa3Gst3xoC
 P0eA7VtHeGbZH5KSEwDQqxB77tdekrTVJID8SvIVmw9m/Soj2GNfIPZr0UhHGZBe501H
 aYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rYQ4/VTW64aDOScj4zmfC/qPGaCb6zVYq6DVXxcIMj0=;
 b=E1Up/rfoiKFAK+VZax8QQ7RQ+rlkgfW/Wde3URbbke5WLPO9mLwi+xcWAiDBZDaiz9
 JMs92d5YUagHlQk4z3bP6L/CVCd+6ZfsmdQMBe69TGwbzInG90uPy50OA6D1sL6p1MAV
 pcDGZ4aqfZig6KN3Avw5eRsu6vAsblpcaC5Kt1JX2Oo2tESE7FnKKW6A+d/lDYHFYRq7
 b0xe6RoBB6oM2WxwA3LtLna3uoN6T9jBSjyC42cPKjx1Mm3Kz3hKERR6I2H+Hspe8mOW
 HY0O+1rgtu4gvcqXyWYaLmcpoxcIHvKkTEhKpD/L+Ft5LnzD7IF12biz0oBrVlMfGZku
 dl4A==
X-Gm-Message-State: AOAM5320C5glSvWND5haTCT4l63tmc9yQmKnD7bYnJhihs27zeD+lDVW
 lwJxPOumKka69AlM+VBYpARCUA==
X-Google-Smtp-Source: ABdhPJzRvsII9G6tY3qI0RfIloaNLZTlNy8C8e4vwmZejVZwySMiGsoYn5TSlEeXqdKHxMJBxyqapQ==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr18485006wri.140.1623085126106; 
 Mon, 07 Jun 2021 09:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/55] target/arm: Implement MVE VMULL
Date: Mon,  7 Jun 2021 17:57:54 +0100
Message-Id: <20210607165821.9892-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Implement the MVE VMULL insn, which multiplies two single
width integer elements to produce a double width result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 58 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 7b22990c3ba..66d31633cef 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -132,3 +132,17 @@ DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmullbsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulltsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 241d1c44c19..5a480d61cd6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -101,6 +101,11 @@ VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
 VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 
+VMULL_BS         111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5982f6bf5eb..2d0c6998caa 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -335,6 +335,27 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
     DO_2OP(OP##h, 2, int16_t, H2, FN)           \
     DO_2OP(OP##w, 4, int32_t, H4, FN)
 
+/*
+ * "Long" operations where two half-sized inputs (taken from either the
+ * top or the bottom of the input vector) produce a double-width result.
+ * Here TYPE and H are for the input, and LESIZE, LTYPE, LH for the output.
+ */
+#define DO_2OP_L(OP, TOP, TYPE, H, LESIZE, LTYPE, LH, FN)               \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            LTYPE r = FN((LTYPE)n[H(le * 2 + TOP)], m[H(le * 2 + TOP)]); \
+            uint64_t bytemask = mask_to_bytemask##LESIZE(mask);         \
+            d[LH(le)] &= ~bytemask;                                     \
+            d[LH(le)] |= (r & bytemask);                                \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -355,6 +376,20 @@ DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
 
+DO_2OP_L(vmullbsb, 0, int8_t, H1, 2, int16_t, H2, DO_MUL)
+DO_2OP_L(vmullbsh, 0, int16_t, H2, 4, int32_t, H4, DO_MUL)
+DO_2OP_L(vmullbsw, 0, int32_t, H4, 8, int64_t, , DO_MUL)
+DO_2OP_L(vmullbub, 0, uint8_t, H1, 2, uint16_t, H2, DO_MUL)
+DO_2OP_L(vmullbuh, 0, uint16_t, H2, 4, uint32_t, H4, DO_MUL)
+DO_2OP_L(vmullbuw, 0, uint32_t, H4, 8, uint64_t, , DO_MUL)
+
+DO_2OP_L(vmulltsb, 1, int8_t, H1, 2, int16_t, H2, DO_MUL)
+DO_2OP_L(vmulltsh, 1, int16_t, H2, 4, int32_t, H4, DO_MUL)
+DO_2OP_L(vmulltsw, 1, int32_t, H4, 8, int64_t, , DO_MUL)
+DO_2OP_L(vmulltub, 1, uint8_t, H1, 2, uint16_t, H2, DO_MUL)
+DO_2OP_L(vmulltuh, 1, uint16_t, H2, 4, uint32_t, H4, DO_MUL)
+DO_2OP_L(vmulltuw, 1, uint32_t, H4, 8, uint64_t, , DO_MUL)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c22b739f36e..ccff7fc0ecf 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -393,3 +393,7 @@ DO_2OP(VHADD_S, vhadds)
 DO_2OP(VHADD_U, vhaddu)
 DO_2OP(VHSUB_S, vhsubs)
 DO_2OP(VHSUB_U, vhsubu)
+DO_2OP(VMULL_BS, vmullbs)
+DO_2OP(VMULL_BU, vmullbu)
+DO_2OP(VMULL_TS, vmullts)
+DO_2OP(VMULL_TU, vmulltu)
-- 
2.20.1


