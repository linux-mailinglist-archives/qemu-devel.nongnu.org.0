Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616AE3FD7FB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:49:25 +0200 (CEST)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNo4-0001d0-FC
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcB-0006pl-NN
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc7-0005fX-Jv
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id u15so1523738wmj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DtXlyh+x5hTL1mWaYC4Ui4ld7VP7J6g7isQSBi8KZMQ=;
 b=COozZcOx+a/awhnpLbGOG4GHJoc7b35w3FgRVLqtSoEpC/ERnTBKc9wz0oOBmbxFl2
 rL8/Xp6p3iG5rWrSwkpxpoJDqgHaQcjMQW/AqAXEg2Wdrej8egHynJWuleNO7vYhjLAN
 YsbPzkcM0wn6EBIaEs62nCUtMLektKiLwG+CIj6RV3K/E4ycZtl+pmFvubMhbvUCOgPX
 pnzvKemsA2C4UkA/5EOISRH6lCsJ3EM5701dKnhvgx+841Lx+1Yo3MGdVfwrIFc0wxM+
 NPCpTOKTFEYlwQvxIngp5ggDP/4uoFAcfLBa4ysdv4cieh8rnH9iln61Gqn1eeXkjiM1
 ntKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtXlyh+x5hTL1mWaYC4Ui4ld7VP7J6g7isQSBi8KZMQ=;
 b=fAHvRE0xKnAaMxf/4OujJJIKjHyAtrR6LDOrCgI4VaMfqx14fy97pZby/dGPdWcn9W
 vb59tEXzV182CZ6Ecdl18vyGYO4znl+xckVkHoOlfh4ZPqxcdNfxj2QZFBgm+T4ApXCp
 xvmxnmGltkkSanUdUs11lRWRrSZuFHQdtqKs0O2a7R+JfN5M2Q7gUHhAMIrBu3YQ782K
 Qj2K2qoAWQEMme+SG2KPcdATdYwgznYZBJTGydxVfRYaVfoyq7ZBbVr81DL1SwXKXNSm
 W9mA6jW7SUjPCstOkg3LcdUnAYupI8CU15VAVA5G6JedOQqEqkJF21KJgNYM6pRoveVM
 BzTw==
X-Gm-Message-State: AOAM531hvT/Tu2P5jNvzxVo7GV4Ik+CyNMriFDYYtMvXLS0ESM6N4r+M
 9WK67zeBysuAqf+fD049fONrdSvhCvpuFw==
X-Google-Smtp-Source: ABdhPJxdtY4rk1asOHnJvM/MI5crvsAKbrxs4CuSgmX2jt379lTNUUhPWziudrD0kK6lpYpqqgvw6g==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr8764138wmi.158.1630492622209; 
 Wed, 01 Sep 2021 03:37:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/51] target/arm: Implement MVE VFMA and VFMS
Date: Wed,  1 Sep 2021 11:36:11 +0100
Message-Id: <20210901103653.13435-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 48 insertions(+)

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
index 2cc8b3e11b7..d7f250a4455 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2894,3 +2894,40 @@ DO_VCADD_FP(vfcadd90h, 2, float16, float16_sub, float16_add)
 DO_VCADD_FP(vfcadd90s, 4, float32, float32_sub, float32_add)
 DO_VCADD_FP(vfcadd270h, 2, float16, float16_add, float16_sub)
 DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
+
+#define DO_VFMA(OP, ESIZE, TYPE, CHS)                                   \
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
+            r = n[H##ESIZE(e)];                                         \
+            if (CHS) {                                                  \
+                r = TYPE##_chs(r);                                      \
+            }                                                           \
+            r = TYPE##_muladd(r, m[H##ESIZE(e)], d[H##ESIZE(e)],        \
+                              0, fpst);                                 \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VFMA(vfmah, 2, float16, false)
+DO_VFMA(vfmas, 4, float32, false)
+DO_VFMA(vfmsh, 2, float16, true)
+DO_VFMA(vfmss, 4, float32, true)
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


