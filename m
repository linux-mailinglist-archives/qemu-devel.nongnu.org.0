Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A873AB3B3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:37:01 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrGW-0003Li-5v
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx4-0001dG-2F
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwv-000723-MZ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id f2so6506808wri.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6f3B20YB7jO7BQgfTo9BwyrubdLLqVfugqIcbJ7LZZ4=;
 b=mNEC8PP45JaToixzpnIqfPs1loGqBh33eaQ77lYGiFk71KSMUxfL5TRBDGTixsIb5K
 2QEHjQ9pbLFEdEtLoxMT6QzJlcJWnXn59dQIX5sBxFUuWAV8BznXQl/fI+3Oc/5dbLAx
 QBVnRCo14lCnxOJSQbZoJBbjuxgJLbkclDAoUBZYcUr6Aab4tTovaP0popKXdudBOcBX
 +U4c/B+ctEPJIemqAb+lMQL2sV89GpPfFChnYN6zaXNnBRjswMCA4dSNKTiGpRVnn2XF
 +EPId0A55hoOVHy9JDYwS59wmWqprN6H87oaHlOI7p62KQK4DIyXeAp+PMlp9Bl0Xqr0
 kUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6f3B20YB7jO7BQgfTo9BwyrubdLLqVfugqIcbJ7LZZ4=;
 b=NOslTbLuzWiy9NYoQ4GlwL0jtJ/x0JGbdqCK6SOkKxmiKyN2r3Wrc54nhf7VVei0mx
 78h14kVlP2qgMSigvo1nOhweIsgqQtEnV28bxGeHbB/xTScnAbO8GfTNoDSQWYpTZXZ2
 bKPJ8j0pw+FAxVszHlyuO07a3xF+XTgXqnPuklmsqPb3zpD2CLiHEyxERSXbwMC97ied
 BS13MgwVzwGbJP9pwQvjEzqUnwE6ioOmYAjum2OivMQ1WNWWlGufL0NxlnmZULyJ7Ieq
 AvsIhv+kBuRsj+CewAQmk/IUGNPFpGr3Wno4tXA2x/16lgHG51ZxJ9Bxl1obET0vJ0tA
 BUkA==
X-Gm-Message-State: AOAM532Xect5pSwGFDQzekg78cS5rnGe60mo0gDNySqvqzJozm/k5uZi
 Z/nSjh/ZJGb7yM8EBkqhECxnX2TXQgcI4w==
X-Google-Smtp-Source: ABdhPJw/h6Kf3Iiy8VXCyz94pN2CozFREosbWjKAl5Sm9m+Tr1Depqt0zYMmSRRUhEYEVskJQJlrsA==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr5347314wrw.249.1623932204405; 
 Thu, 17 Jun 2021 05:16:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 18/44] target/arm: Implement MVE VMULL
Date: Thu, 17 Jun 2021 13:16:02 +0100
Message-Id: <20210617121628.20116-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 57 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 02bef53ed41..9bbeb7ec49d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -130,3 +130,17 @@ DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index a89f6e3b01b..4bb4b6ce02e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -364,6 +364,26 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
     DO_2OP(OP##h, 2, int16_t, FN)               \
     DO_2OP(OP##w, 4, int32_t, FN)
 
+/*
+ * "Long" operations where two half-sized inputs (taken from either the
+ * top or the bottom of the input vector) produce a double-width result.
+ * Here ESIZE, TYPE are for the input, and LESIZE, LTYPE for the output.
+ */
+#define DO_2OP_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)               \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            LTYPE r = FN((LTYPE)n[H##ESIZE(le * 2 + TOP)],              \
+                         m[H##ESIZE(le * 2 + TOP)]);                    \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -384,6 +404,20 @@ DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
 
+DO_2OP_L(vmullbsb, 0, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmullbsh, 0, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmullbsw, 0, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmullbub, 0, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmullbuh, 0, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmullbuw, 0, 4, uint32_t, 8, uint64_t, DO_MUL)
+
+DO_2OP_L(vmulltsb, 1, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmulltsh, 1, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmulltsw, 1, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmulltub, 1, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmulltuh, 1, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmulltuw, 1, 4, uint32_t, 8, uint64_t, DO_MUL)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f593d3693b9..1cadc3b04da 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -361,3 +361,7 @@ DO_2OP(VHADD_S, vhadds)
 DO_2OP(VHADD_U, vhaddu)
 DO_2OP(VHSUB_S, vhsubs)
 DO_2OP(VHSUB_U, vhsubu)
+DO_2OP(VMULL_BS, vmullbs)
+DO_2OP(VMULL_BU, vmullbu)
+DO_2OP(VMULL_TS, vmullts)
+DO_2OP(VMULL_TU, vmulltu)
-- 
2.20.1


