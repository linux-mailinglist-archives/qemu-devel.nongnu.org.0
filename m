Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6783F73A6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:50:04 +0200 (CEST)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqTm-00086n-5T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGC-0003cB-KZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGA-0005Rq-VF
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so210165wrh.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WJjWm9FDJCY1N24UtIPKV2StMedL6VIApBeIOCLcWD0=;
 b=iBdMToZbh83LbR92ngbvj5jlxYloZV1WchphqYdjAfePZAINJAB7ZJEUdQyg/NWud3
 zQEzlHD7NDRxFypeu/i52Cbo+tWfTOVbJtoj3USxrH/huIiyQjZZ6wgOt1ao+B8uzZeY
 TQFGE//EKaoVAHmT29NZKJzB7r9bhRgLs02Db1DSdSOaRgv3T1/wLx6fTv7GLNH9Lm+p
 JTH3oXLoDDeBpVFjC+Qv2EToyl1EkqYad/1C9bZJbW5JDBIke0u+uWFbHG6RtRJPzGvf
 fEgLZbFww0OdyQzh822kdXURthBCJmRUc8yJ64GV3RsqkWSdipdD7uwOMpVwK9fR6/3a
 FXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJjWm9FDJCY1N24UtIPKV2StMedL6VIApBeIOCLcWD0=;
 b=Wstk/Osu6rF6HedjpVxvxdRlZhzhVefi1B5VIj2H1xg19FCe3B3xn7l8kicdG7wxqE
 pqVK90ynk+R6shxhHFSR1i3m9WJv2071moGEqTkRiDSzRUDsi0YOB/UGUuDvwEpPLxR9
 kQ6RkTpn/kKDmaeyKroYXvv4EGL8SBK5ZOF2iIEOvVsO2EeazhRA4lQu3iS6sX6gTpbs
 8zqUiRD7bY4g+a4Cvne9MlXGPhAYuwlMSldzKGTaebAhrAvppWD5yZf1Utxe2yHEzVyK
 Nk0h0H43gJ6vhISmlWvGzwDIo2kv1TiW+mTM8aAHDLr0zP+bFtPwU5WWjFrCnfqRSYcx
 LIFw==
X-Gm-Message-State: AOAM530EMab7uuhJDXkQ0Nxdvd5Nwxqx45kvo5OFPFYUnSNJGVZH4QEs
 054Y/DNLXZzoBIr7B9lSjZP6TAgD3c787g==
X-Google-Smtp-Source: ABdhPJz5ylBx6J/eO/PHftuiHDrsqcNUpF/2rR2gREhgo5eRbGGLkh6EHeaCOTpgQweoDuOR/FfCBw==
X-Received: by 2002:adf:b347:: with SMTP id k7mr21928330wrd.239.1629887753623; 
 Wed, 25 Aug 2021 03:35:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/44] target/arm: Implement MVE VMLAS
Date: Wed, 25 Aug 2021 11:35:08 +0100
Message-Id: <20210825103534.6936-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the MVE VMLAS insn, which multiplies a vector by a vector
and adds a scalar.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


