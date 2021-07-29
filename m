Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B263DA24B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:40:29 +0200 (CEST)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Oq-00005L-SB
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9410-0000kG-6Q
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0001AC-Mi
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so6545529wmg.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sMTDRQniGICDQscZGG0hawEpXGBLFhziwkAtwxxcYNs=;
 b=cguWcA8kPh9Nq8axqquWdaJg8ic3M7eY5vIW4f7PkVSfjeNZALmbRZFfI9YZ10T0f0
 /o1JtrFjgslxome1FR4yw4ug9UY8sY6wC49boXhxJXSynPo/KjVRBoeZgqgaIljzQLLe
 CAqCuW6XgdZLsoXpbhlJmzu2VTzu9tDf8Q+G8Ji1CFRJSMpypF2ard9ee2BrUVKGeVrC
 XiSV2sPDfNurBKGUS4f4Lpt6lF0Bcg1wcRkarl5e478Y20ACqMGSkDxO5V97gBQlIttd
 usH1KQKW0UmZcuVd+Ef3b55bQ/tQi8332Hz5xQwZUK7EVtq6+kmy28pC5t+OyujF9hXp
 lEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sMTDRQniGICDQscZGG0hawEpXGBLFhziwkAtwxxcYNs=;
 b=EdOoCWaXQajDOXKWr8D1yeWMbBetjNLOhe6siX60DWmYUsH6xVDgYe1ILhqz30gmJj
 /t43K1a+OiRE8aQDUCswtBliatI5XmviGfICxLWmBKKovlxvV6kFTevvU7g0t9wPFre8
 ac6K0arPBdxOuP8yBAU/mk/lJlOFUM9rzWXHt6vhrzJADc403FK+D+yep8g+uNXGC2MS
 tuQqHTmHLtZhsyoI+S4jPYgMn7EE6SRDA+ajOqa9pxzGcyoKiLDc0m0vJjM4J59DVbdn
 wuwtgtMGpoeQf42fKMAPjL2xH96ccRMGSXf2nrGxNlwJMH61tS4fUEuoEO6CgP+S3vhw
 CdIg==
X-Gm-Message-State: AOAM532gu0PerPjPwoKoj4k8N4WBYsCb458QdnnNSGH2oHjtSu6A1pel
 cvSSGovoD1qizTsCFtNgD86jTQ==
X-Google-Smtp-Source: ABdhPJzuOpLxYkxlMDH6YYuyGWlKuhZM39Nkvj9Bkv+2vqdWuK+MmR/NEisRFq2fLL2IwUNyuyd5vQ==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr725694wma.1.1627557329737;
 Thu, 29 Jul 2021 04:15:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 18/53] target/arm: Implement MVE VMLAS
Date: Thu, 29 Jul 2021 12:14:37 +0100
Message-Id: <20210729111512.16541-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE VMLAS insn, which multiplies a vector by a vector
and adds a scalar.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
changes: don't decode U bit as it does not affect output values
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c |  1 +
 4 files changed, 34 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 16c4c3b8f61..715b1bbd012 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -347,6 +347,10 @@ DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i3
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vmlasb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlash, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlasw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 4bd20a9a319..226b74790b3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -345,6 +345,9 @@ VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+# The U bit (28) is don't-care because it does not affect the result
+VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+
 # Vector add across vector
 {
   VADDV          111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 03171766b57..ab02a1e60f4 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -948,6 +948,22 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
         mve_advance_vpt(env);                                           \
     }
 
+/* "accumulating" version where FN takes d as well as n and m */
+#define DO_2OP_ACC_SCALAR(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(d[H##ESIZE(e)], n[H##ESIZE(e)], m), mask);     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
@@ -958,6 +974,11 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
     DO_2OP_SCALAR(OP##h, 2, int16_t, FN)        \
     DO_2OP_SCALAR(OP##w, 4, int32_t, FN)
 
+#define DO_2OP_ACC_SCALAR_U(OP, FN)             \
+    DO_2OP_ACC_SCALAR(OP##b, 1, uint8_t, FN)    \
+    DO_2OP_ACC_SCALAR(OP##h, 2, uint16_t, FN)   \
+    DO_2OP_ACC_SCALAR(OP##w, 4, uint32_t, FN)
+
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
 DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
 DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
@@ -987,6 +1008,11 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/* Vector by vector plus scalar */
+#define DO_VMLAS(D, N, M) ((N) * (D) + (M))
+
+DO_2OP_ACC_SCALAR_U(vmlas, DO_VMLAS)
+
 /*
  * Long saturating scalar ops. As with DO_2OP_L, TYPE and H are for the
  * input (smaller) type and LESIZE, LTYPE, LH for the output (long) type.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index aa38218e08f..b56c91db2ab 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -596,6 +596,7 @@ DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
+DO_2OP_SCALAR(VMLAS, vmlas)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
 {
-- 
2.20.1


