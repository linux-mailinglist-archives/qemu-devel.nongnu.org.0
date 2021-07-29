Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231C3DA22F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:32:07 +0200 (CEST)
Received: from localhost ([::1]:38138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Gk-0007ZM-9p
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941B-00014W-Re
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940p-0001Ge-HJ
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so6545820wmg.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2WneyhHKqIU7XDRl0YOpayRXl21coDrx+TpbKifug4Y=;
 b=ByVounPG/fEi8V4Z4srS2cgHHsGjZgQMEdrztd6eXE2H+RfH+97QCzqkH13X1Pg2uN
 yLFDD/R5Y1gFrqY6YOBbjqLC8wtUQLxatLtLcZXEmwYuA7dkc3KAMPPdr2hMWmaGmh+7
 99zFh+QY3YsgPsKF6nC+ewi2RuB0HHl88pqadHIoUd73eKwPZgr352Zk2/fzzs/gplw5
 IKOErjr2O9EjSkREUpOABiMq/TC1egjYT+NkoOStyL8IfFfUxB1BuixJcrY7why1x/lZ
 ww7tcDlVrOYztSCT4gaAdz+o7Z9cwDvNmg0uCDWYWjd2bDiTDppfyfKbKve7qfvVBCbF
 x5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2WneyhHKqIU7XDRl0YOpayRXl21coDrx+TpbKifug4Y=;
 b=BImPLQ962Uz4ljCEK+qvdvrUO3bu0ZN5vFIp8OwVfWqBL/2IxX7BUBgJlUnYmAROWs
 zpWAjafdxPNCXOWi13YFaF1mwk8qew45jk5l9wcWvisd79OMWFZbdOjRlnmn/L+oY2K3
 KWOENSS4ObEhUdz1p0dEEJvTf3bd7jt05a+FaaT5XsOeZoQfZ1R0nyayHqlfdzWYx5O2
 0Pr4pufJDy0LYHDIZw/lKZjNYwZR3psGaKu1UY29bsAiaQZB9GRQiO2kr3hqN6mCfSci
 D2BbaXWN31zgGiEMPf+THAwA9aCbusXvIb5NZoGmrks42c1W+Mha8tIekPfsvM9Vf87d
 dW8g==
X-Gm-Message-State: AOAM5318u28WKt8HzubVYzs5Jfut1bd3EQlQeM4VQptgabxe76ACXNJM
 I+8D6N43wu8mKW9uo1QMukO5a2nyenq3oQ==
X-Google-Smtp-Source: ABdhPJyt11vwd+xXZg476yFC1U6a1NcL2J7PUZ2x3RZfM7Qh4qJk836oU4Bknhjo/1KNcLruH8dq/A==
X-Received: by 2002:a05:600c:33a6:: with SMTP id
 o38mr7760479wmp.131.1627557337925; 
 Thu, 29 Jul 2021 04:15:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 28/53] target/arm: Implement MVE VQABS, VQNEG
Date: Thu, 29 Jul 2021 12:14:47 +0100
Message-Id: <20210729111512.16541-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


