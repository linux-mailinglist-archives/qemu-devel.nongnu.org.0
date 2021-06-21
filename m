Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9C3AF12D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:59:41 +0200 (CEST)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNGu-0000ck-TN
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnU-0007bL-EZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnS-0007j6-AF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so435818wma.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ExlVSxRFMun6HfUzsTAkB/NKR1W+AoAbGWww0Hv84gk=;
 b=hV1t52ylLlbEiY/xSfZgzCPVwndz4HQTjJ2dufSWZAeI31rOnDEascnCPu/WEVSLnM
 Qlog+L0pcojW1ynotGwvjNafkkOGdv/sl+zmNm4zUxHgYc91FBnOptk73yyr0yFATgi4
 UhInspJ8fuiQ3UYNprrfYMWNIAweg6C9V59QOnCANl73LOQzSKMkF9XsoCxXW0uR848D
 kD10l80onW1I/IRuq+b5YujVTynXMmk8OEBtaHPESjpGALeliMYF5b+pPJwiuvDiH2t/
 eoTPjiNBL5pvRhoBXGprOKI1isKH4mkkeAmrFzCrtD8Dh4QWqlO4kWU1yWSVNzAnPbQL
 X/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ExlVSxRFMun6HfUzsTAkB/NKR1W+AoAbGWww0Hv84gk=;
 b=TPe4clsQZaI6Aju6DK03CppKNmZG3Dg5+8teDUO2bhQHEM5BhGeawXKwHgy0oa2Gaa
 0yV7j5MzyulDpgEu6LSEhcpMsUJku3+xTYZSFTUMVoglsugt2eK03nS7LsYBe5gNRyRj
 Wl8jF4hcoxWS6Wo0594pitgs1j2CA+N4F32BqrfZE/s3ul8QvOT+hRw31xRf3GdeX3X4
 XmB8aV/UI9Yi/zM7/ufWAtV1CAg3ZmowmuYAyd1NvBEBM6bAdCH7cyAi+/W4mhTUtbJ4
 BL4pnvZnyupCRBybIGAO/2KZMUzqZZ4MQCwQBbib0hsZkPLD+wSMoQJe45469pDrTkFC
 75gA==
X-Gm-Message-State: AOAM530YaxxdWsXYuib/GfvTsBQfiEpS5rJJ/RgnO44E+Mf5ixWJvCiC
 5G3dCX6zizb+7akUXoKPcgQl3wQtjuh3+eVH
X-Google-Smtp-Source: ABdhPJyATgdx7UhMSM0Pi/di1VIy0eFPY3lWC6ORc3m67nrLo0xAqSHmasNAyLngF9uGqkVAnXEYpQ==
X-Received: by 2002:a1c:40c3:: with SMTP id n186mr28462583wma.52.1624292952946; 
 Mon, 21 Jun 2021 09:29:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/57] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
Date: Mon, 21 Jun 2021 17:28:17 +0100
Message-Id: <20210621162833.32535-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-31-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 41dd61264e0..c4e766c6511 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,14 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a71ad7252bf..9860d43f73c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -113,6 +113,9 @@ VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
 VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 
+VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 113635896e1..45b7e83888a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -370,6 +370,25 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT(OP, ESIZE, TYPE, FN)                                 \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);          \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -536,6 +555,14 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
                                          INT32_MIN, INT32_MAX, s)
 
+DO_2OP_SAT(vqdmulhb, 1, int8_t, DO_QDMULH_B)
+DO_2OP_SAT(vqdmulhh, 2, int16_t, DO_QDMULH_H)
+DO_2OP_SAT(vqdmulhw, 4, int32_t, DO_QDMULH_W)
+
+DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
+DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
+DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f73b36cae49..ec9a9852868 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -396,6 +396,8 @@ DO_2OP(VMULL_BS, vmullbs)
 DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
+DO_2OP(VQDMULH, vqdmulh)
+DO_2OP(VQRDMULH, vqrdmulh)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


