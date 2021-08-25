Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FC3F73D1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:55:59 +0200 (CEST)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqZW-0008TQ-0X
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGK-00049I-QB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGI-0005Wx-TX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id f5so35619529wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NHW+bio5vpc+hqjWMB9d8Ta5DNoBT2v+EDTK/IAK+GE=;
 b=uBRpAo6YsqjOe/+ZSotZNVKIRm1ciUoy/niKIsv8N2Kd/A9v8M9adevaVFGCZEyZOD
 c1wHRhVr+lH1+hPzhy2tXQtS0OyTc9YpmZur8PUqSLS9vxQCofKhojaYeW3ixUSA4VDN
 hSJvuB2bNNwSH7dEopZ7z11G809lDBg9X3Rknd/RMpBp0br8lcyPJsBh0ncp7r9HT3K0
 6pGMwPuQZExrX1/NxRIej5GhXqBSAWDIHwLE17dMCHXrTgIzG09NDd68+4DOinAg3tnn
 4G1MbqS8KLQ+f1+Y5oxo2sIfEs7KpThVwqBBSYgmeBzw6RUQN/e5faxjyQExFWtXaxL4
 QSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHW+bio5vpc+hqjWMB9d8Ta5DNoBT2v+EDTK/IAK+GE=;
 b=O+ikr8pnruFEZzXRDxhLizeIq35iLJtt+Lo3XrlKYURBmbEWV9LU12+0SdYVvemJk+
 C1u7zYZw2fp3306OelvsgU1xcKhZbkLDiJqpcwQSU5X7UM5YC581f/wLMACOWRRDf264
 uLsejA4Sdg6GGreL2UhVyhMRLGY89816I1lVolPHIyT6GbYYpquIbTM3ivJUpkckoIUr
 VOl38/MsfEiMyEsE2whVw3k8cCyxhxy6bqSRluL4039C8+5BpNveEbtm5hn8N+gA8MRq
 +rrEIP0n4oaqkUbPGSb2Qe+5aJhSVzyRAZqSiBvpQSezSctstbILwLJKx81JeLF3WigH
 4eoQ==
X-Gm-Message-State: AOAM530+WNyMto+r5C3QCTPlysHdydu1JDgsFTvwsx/Vif3oixvHvnTI
 VTn4hEEavJrYdz1mPQW1QrbFC320sX15ZQ==
X-Google-Smtp-Source: ABdhPJzzmnHOp6+7SZdYF7cRD8+D/L7qDHDANQ4rslx9GnJ5uzMrQzoyfc6wmeYtja9TBld57v02Lw==
X-Received: by 2002:adf:82b0:: with SMTP id 45mr2758456wrc.161.1629887761412; 
 Wed, 25 Aug 2021 03:36:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/44] target/arm: Implement MVE VMAXA, VMINA
Date: Wed, 25 Aug 2021 11:35:19 +0100
Message-Id: <20210825103534.6936-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the MVE VMAXA and VMINA insns, which take the absolute
value of the signed elements in the input vector and then accumulate
the unsigned max or min into the destination vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f9345bfafc7..651020aaad8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -84,6 +84,14 @@ DEF_HELPER_FLAGS_3(mve_vqnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vqnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmaxab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmaxaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vminab, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminah, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vminaw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a05b882f9d9..0955ed0cc22 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -156,6 +156,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
   VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
 
+  VMAXA          111 0 1110 0 . 11 .. 11 ... 0 1110 1 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -176,6 +178,8 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
   VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
 
+  VMINA          111 0 1110 0 . 11 .. 11 ... 1 1110 1 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6539012ddd8..d326205cbf0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2237,3 +2237,29 @@ DO_1OP_SAT(vqabsw, 4, int32_t, DO_VQABS_W)
 DO_1OP_SAT(vqnegb, 1, int8_t, DO_VQNEG_B)
 DO_1OP_SAT(vqnegh, 2, int16_t, DO_VQNEG_H)
 DO_1OP_SAT(vqnegw, 4, int32_t, DO_VQNEG_W)
+
+/*
+ * VMAXA, VMINA: vd is unsigned; vm is signed, and we take its
+ * absolute value; we then do an unsigned comparison.
+ */
+#define DO_VMAXMINA(OP, ESIZE, STYPE, UTYPE, FN)                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        UTYPE *d = vd;                                                  \
+        STYPE *m = vm;                                                  \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            UTYPE r = DO_ABS(m[H##ESIZE(e)]);                           \
+            r = FN(d[H##ESIZE(e)], r);                                  \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMAXMINA(vmaxab, 1, int8_t, uint8_t, DO_MAX)
+DO_VMAXMINA(vmaxah, 2, int16_t, uint16_t, DO_MAX)
+DO_VMAXMINA(vmaxaw, 4, int32_t, uint32_t, DO_MAX)
+DO_VMAXMINA(vminab, 1, int8_t, uint8_t, DO_MIN)
+DO_VMAXMINA(vminah, 2, int16_t, uint16_t, DO_MIN)
+DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f2213ec8cde..02c26987a2d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -277,6 +277,8 @@ DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
+DO_1OP(VMAXA, vmaxa)
+DO_1OP(VMINA, vmina)
 
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
-- 
2.20.1


