Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66503DA285
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:53:11 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94b8-0000TW-R5
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941Q-0001Id-KI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940y-0001Mj-P7
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id p5so6464102wro.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lyRTX/hDBkPMXx5zFtZ53SkkChNk+0nncZrvsfyNOxs=;
 b=ykrcNS8AkfuW5Gjcf2OaG91KgJ226pCFkE87yKjw/GQN57b1bA91JbswfdAW57OW7s
 fOJc9bIAjaPYVi33ckxPcA0d0U3RCoWnV1V62zpoLlOJkc/taMXLELwc9yud2GJvNx5q
 zil3OrT1BiiAMGTRXady6RjkqqT3yPndddfmoeQIMQgVGAp4C31D6KIjsn1B1q+ppwXZ
 YfjTI42VpXa+C6Ijq44CqMP8cZSVKXGCr3H25xFKN794Wpl/bRhWGoY5ByhlN816YYHr
 PCePOUTl76Q+SIlI/eELCFDgw8jRTWVUwyk7z+tqjE+JIHZU15BoMS1vJCFLs7SW9x98
 SL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyRTX/hDBkPMXx5zFtZ53SkkChNk+0nncZrvsfyNOxs=;
 b=O6YXkrlOYsn2OcqaE8v+tCKeDpaNHfP2TXMxDzgSR2nKqlVQvSi7kIICx0ESyWirpG
 ivThKhtDQFiqBDj8ailIoFGgkuNTjlJjHkbSk0rNO8cLYFyFoTBTMrX/Uy7ZYmmc3t7q
 UQR4FXbhPtxiXx2AKo2ngFhmGD96SWy2nCbqlY+MxsRPca1DE591++dVPP+SnO9yXKhB
 agpakEZgwtHpBKb/fgzkWoNCfP40GLxFXYiyXzzCSsiAgvYnxMXo8CVSso1eMWrUk+qb
 p/NoT+C0lki/4aQNzWZMD13OJ57pzfVHH6uTgznP/Zl21Ge3Ivx4UkxICKf8dTMcOYDl
 NWIw==
X-Gm-Message-State: AOAM532UnvLoncUQdmSwvuVE4gXx5EkQTlivLISznqRDEEaGSQguQ0pM
 GhhY6UJuRg6DCaPXqhCk8FMj2Cyklfb1sQ==
X-Google-Smtp-Source: ABdhPJxLeK3Loh42b6uGRRHQVDtC+Oeu3gxPOF3m0iAO4OXHypM7CtU8DidowCpXrKlPC+h1NHITXg==
X-Received: by 2002:adf:f302:: with SMTP id i2mr4208007wro.186.1627557347454; 
 Thu, 29 Jul 2021 04:15:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 39/53] target/arm: Implement MVE VFMA and VFMS
Date: Thu, 29 Jul 2021 12:14:58 +0100
Message-Id: <20210729111512.16541-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VFMA and VFMS insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 47 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 42eba8ea96d..c230610d25c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -434,6 +434,12 @@ DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmss, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c728c7089ac..3a2056f6b34 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -639,3 +639,6 @@ VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
 
 VCADD90_fp        1111 1100 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
 VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+
+VFMA              1110 1111 0 . 0 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
+VFMS              1110 1111 0 . 1 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index fd6ff167849..0146137d18f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2899,3 +2899,39 @@ DO_VCADD_FP(vfcadd90h, 2, uint16_t, float16_sub, float16_add)
 DO_VCADD_FP(vfcadd90s, 4, uint32_t, float32_sub, float32_add)
 DO_VCADD_FP(vfcadd270h, 2, uint16_t, float16_add, float16_sub)
 DO_VCADD_FP(vfcadd270s, 4, uint32_t, float32_add, float32_sub)
+
+#define DO_VFMA(OP, ESIZE, TYPE, FN)                                    \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], d[H##ESIZE(e)],      \
+                   0, fpst);                                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VFMS16(N, M, D, F, S) float16_muladd(float16_chs(N), M, D, F, S)
+#define DO_VFMS32(N, M, D, F, S) float32_muladd(float32_chs(N), M, D, F, S)
+
+DO_VFMA(vfmah, 2, uint16_t, float16_muladd)
+DO_VFMA(vfmas, 4, uint32_t, float32_muladd)
+DO_VFMA(vfmsh, 2, uint16_t, DO_VFMS16)
+DO_VFMA(vfmss, 4, uint32_t, DO_VFMS32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6203e3ff916..d61abc6d46f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -854,6 +854,8 @@ DO_2OP_FP(VMAXNM, vmaxnm)
 DO_2OP_FP(VMINNM, vminnm)
 DO_2OP_FP(VCADD90_fp, vfcadd90)
 DO_2OP_FP(VCADD270_fp, vfcadd270)
+DO_2OP_FP(VFMA, vfma)
+DO_2OP_FP(VFMS, vfms)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


