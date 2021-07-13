Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC43C3C719B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:57:30 +0200 (CEST)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Iuf-0005Xs-Ji
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibq-0000KA-IR
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibe-0003nX-J3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:02 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so30499777wrf.10
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S3Nm5WPC1woG5qpBDWUMq5K5w6e5M1eP3KgH+21zZP4=;
 b=f/CshtQbdvfiYRqQ++ff2TFu+5bw6AxHu4Kk8v4G7/JY1OtiE5Meg6zFM5ljvyJWjE
 4P7HwqKXPt+rtiTdEBJUmW2kny/t2Bxm/09ipmPp3cwFbgkW+8fZSWThmSJxz9bvlKXy
 VATbDZ4nr/17gBCcp/Y5sC412IaTA0c22s95h515pLgmAjKjWsgtt0IQ8BDpJk1/q0jV
 fAjq3POXju/Wj/U5Rt3EYs4Azh6Nox9/7NF6ys+6Tv7TYoNY2T682FlwLpXieeP6sfMr
 /io/jrS04Ru3Xsbcn5z29vNbzkqt/7MQ/dCfhjnlMk3vhCADlb4dAoWnaoPF5Ns6juYr
 7Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S3Nm5WPC1woG5qpBDWUMq5K5w6e5M1eP3KgH+21zZP4=;
 b=pWaY7YIPXpdvfUPZT1Ku96RW5VGl4Zly7tbcU7I0v3KkEUfil93r4VSOHBJ1a3sUYx
 u31ReMh6vAQIYhGXQNtgZ5L6k1LAYnTuYcLrBI0gsI4eEF23m29JwkvqxwMfIaWbeF8p
 mkKRKhdkX+Eu2mMPDthejheUbWYRM6kvXRbrI+qe2DWH7jBki5hPhqeM1tDLoYepiFOZ
 je27dcCT+2KpezyOtSIP1UvsynjPJH95MDL4LhubAEKNrJpPLhM3ap/HK+tDkfRPbt3P
 L+1HJwcY7aWPMBiB6fSuFRwCwyIgpuzb0uJUGUJyisr5sQXKdpNWZvhayNNtQI6PurUd
 saGw==
X-Gm-Message-State: AOAM533do5UxHtg995+0xqaRnK3YVQmz7QiWYu1FUMVMZFTxUoZ+Nv4u
 6YDev4HOsBdYubhKZp+eH4xEdRn+C5ahH+R0
X-Google-Smtp-Source: ABdhPJzMh3LN+PBFhwzCH55ZZ3ji96BFwjvA9Mh3L+f8i4REW/jwH8NXt1KZq262F9ynG6lsx8XgzQ==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr5739115wrm.60.1626183469359; 
 Tue, 13 Jul 2021 06:37:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 27/34] target/arm: Implement MVE VQABS, VQNEG
Date: Tue, 13 Jul 2021 14:37:19 +0100
Message-Id: <20210713133726.26842-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 50 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e61c5d56f41..69f0474f6a3 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -80,6 +80,14 @@ DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
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
index 99cea8d39b6..1d38dd8dba3 100644
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
index 1013060baeb..3b3695885ef 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2213,3 +2213,40 @@ void HELPER(mve_vpsel)(CPUARMState *env, void *vd, void *vn, void *vm)
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
index f8b34c9ef36..59e09f58a8c 100644
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


