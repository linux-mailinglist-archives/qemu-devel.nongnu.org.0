Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06613F73E0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:58:20 +0200 (CEST)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqbr-0000WJ-Q4
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGK-00046z-9i
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGI-0005Wo-B8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id g135so5369287wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2WneyhHKqIU7XDRl0YOpayRXl21coDrx+TpbKifug4Y=;
 b=DsTzT33ZOE1ztNhTKAWKwUiTomASiAOI/o3q30zeL8zzDI0m9pbbz5PRxD8clsjZ3i
 9EvJUw8WLX9mOposq8K94LXbclyztUwKzYjxCygUqEpUgvKnCzjo1fH0ukGcUhqk2cFk
 UDnIBe6SOp6iHrrEJGP2+cng6yRq3y0NorQ0OFNT9yyCQGVv9GBaDps7ZDNDTJ+KqzaC
 Rmy0mvQujUMPKhZEn1InsbeIiV2yO356wsUhzyo87q9voHiOQkGnP505PDd/yULKWo/v
 UG3GH/pPrS2pORYvN2w4DfLqBW601mNgepfIW8glUYXs8qOw8BypWG88rqUBtxnSiYKO
 osBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WneyhHKqIU7XDRl0YOpayRXl21coDrx+TpbKifug4Y=;
 b=YW4KFCGKYU4trMUCwM+oSwsVyR52jt7G5RxjDjgbishaBuyfyttO9gs7m+Q5rQtkxp
 Ax3TMzdrLlNvz/p8kzCYyQCwgrd3HdgtsFeX4pl+6/OB2h7U/YqIqwTxEA0p6fA3GWbn
 n4Ald02runi7wRjZra0SYillxJpD+MLi+oNG2FnJeLrEViSP+FjiyUdRhUmxvgkMajrn
 igL7kSKtLKcSJcgRhs+BBq+9U9MmsmjWTdbVL5zq2o1HnULklgj/3ZOOvU1pCeBLVHbz
 t0O2YYza1YRR05ygGjr0YS3caHZPDnlriOWJB5dWIep2nvFhpzVnLUpNR0Gu2AFsshuw
 6mUQ==
X-Gm-Message-State: AOAM533ERJR9muVXXaYTo3WMyN9B8myeOLgEpPA5WKDS9W5lkX0klW80
 ePoGEWzDH8vxS1P2EphL3wZx9EdSTUgJfQ==
X-Google-Smtp-Source: ABdhPJyWUW9O80nwGrjLX/tpdQAJrn8qeyULm3O53LRVqTtTzf9Prb7qKYMDODK4AgdcGWUJfWB1EQ==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr8394382wmb.53.1629887760800;
 Wed, 25 Aug 2021 03:36:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/44] target/arm: Implement MVE VQABS, VQNEG
Date: Wed, 25 Aug 2021 11:35:18 +0100
Message-Id: <20210825103534.6936-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE 1-operand saturating operations VQABS and VQNEG.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 50 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 2f54396b2df..f9345bfafc7 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -76,6 +76,14 @@ DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vqabsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 7a6de3991b6..a05b882f9d9 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -279,6 +279,9 @@ VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
 VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
 VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
 
+VQABS            1111 1111 1 . 11 .. 00 ... 0 0111 01 . 0 ... 0 @1op
+VQNEG            1111 1111 1 . 11 .. 00 ... 0 0111 11 . 0 ... 0 @1op
+
 &vdup qd rt size
 # Qd is in the fields usually named Qn
 @vdup            .... .... . . .. ... . rt:4 .... . . . . .... qd=%qn &vdup
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a69fcd2243c..6539012ddd8 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2200,3 +2200,40 @@ void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
     }
     mve_advance_vpt(env);
 }
+
+#define DO_1OP_SAT(OP, ESIZE, TYPE, FN)                                 \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)], &sat), mask); \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VQABS_B(N, SATP) \
+    do_sat_bhs(DO_ABS((int64_t)N), INT8_MIN, INT8_MAX, SATP)
+#define DO_VQABS_H(N, SATP) \
+    do_sat_bhs(DO_ABS((int64_t)N), INT16_MIN, INT16_MAX, SATP)
+#define DO_VQABS_W(N, SATP) \
+    do_sat_bhs(DO_ABS((int64_t)N), INT32_MIN, INT32_MAX, SATP)
+
+#define DO_VQNEG_B(N, SATP) do_sat_bhs(-(int64_t)N, INT8_MIN, INT8_MAX, SATP)
+#define DO_VQNEG_H(N, SATP) do_sat_bhs(-(int64_t)N, INT16_MIN, INT16_MAX, SATP)
+#define DO_VQNEG_W(N, SATP) do_sat_bhs(-(int64_t)N, INT32_MIN, INT32_MAX, SATP)
+
+DO_1OP_SAT(vqabsb, 1, int8_t, DO_VQABS_B)
+DO_1OP_SAT(vqabsh, 2, int16_t, DO_VQABS_H)
+DO_1OP_SAT(vqabsw, 4, int32_t, DO_VQABS_W)
+
+DO_1OP_SAT(vqnegb, 1, int8_t, DO_VQNEG_B)
+DO_1OP_SAT(vqnegh, 2, int16_t, DO_VQNEG_H)
+DO_1OP_SAT(vqnegw, 4, int32_t, DO_VQNEG_W)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index e3e115c1aa9..f2213ec8cde 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -275,6 +275,8 @@ DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
+DO_1OP(VQABS, vqabs)
+DO_1OP(VQNEG, vqneg)
 
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
-- 
2.20.1


