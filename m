Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81254572B1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:19:04 +0100 (CET)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6bP-0003is-Ul
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:19:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OX-0005P1-Cz
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:45 -0500
Received: from [2a00:1450:4864:20::332] (port=53964
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OU-0004FZ-5v
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id y196so8957118wmc.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecw3pEDxzdy2sWgykx+6y/yiX4Ql91xUSM5z6uzfGc0=;
 b=xrp8KzYdjpVI1fqRsKSMUj0eA2IaJpE9/fotN7jlI1ckEhZ+WCvmtjrJ4ndx00htS1
 o+4MbaI1HT5y4w1s31bOd8pLZ3/IKr23ZQWxkk2sFA3RgJL8vkDBTnOmGfr7MoopxmgS
 ysVLN92pR0U4XuvHU8H/YMwjtsaGmBe4i1Em9ShG9zUpwXlmNCbu9oNFr4KcepMOXc1G
 ngO81A/lJCKjYAefkAW4rNt64XiQd+567w3TCoWltwmZZ8AVtVeTHws592HwrefgfRF8
 H2ukVD17fTVS48z4lO0vhNOd7U0GgMmd1ZebspAFwy8PFMGiqiKy0GmQj5t9Cfaz3PlZ
 uXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecw3pEDxzdy2sWgykx+6y/yiX4Ql91xUSM5z6uzfGc0=;
 b=A0nFW7nG0c7ePxNDDndZEN3qCVTqnl4KY2gXYj/+WmqR8b2uHP7iZf2h61UMabDHph
 NNgqkPVc40MyY/y/i0+Dh2PA8jnCTb0fvYs4BANXZd+TJrr/Fi5tIqI4HSfoPMhWzljJ
 X0U+5CKZ1i/cDqeNPidcnHzG5953l2RovOw+VX6pmG5sRAS8YX+7CLypKRFXUcgExyRg
 fPHdwdI2PC29pNt0ns2HMGglqHZUfz41H/ClyvYZkOLpoFCAiEG87zgrGgCSGnReQ7Rr
 qO1swfoMArGLCgO7AYykt1JgD79HElI6KxcS3ql0x+as+TeRuX7NMruwbbNbw4WM4/Yv
 VGVQ==
X-Gm-Message-State: AOAM531E5j+rH4mnooABJM5BG/+F6oLAtwmBTGIk2gcb7u/dwrgOE88T
 rSrUubCMzaCJvbl//czkW6+FppeVRI/DlGjboVM=
X-Google-Smtp-Source: ABdhPJyU+8kZGgq00dKEJwIH8G4fMIJAqg78kG6cqRla+GB6B7POODq4CPeVzMc21H+ALzoXY6PjyA==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr938341wmi.44.1637337939538;
 Fri, 19 Nov 2021 08:05:39 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/35] target/ppc: Fix VXCVI return value
Date: Fri, 19 Nov 2021 17:04:40 +0100
Message-Id: <20211119160502.17432-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were returning nanval for any instance of invalid being set,
but that is an incorrect for VXCVI.  This failure can be seen
in the float_convs tests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6b8367a105..ee1047d7e5 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -537,13 +537,20 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
     return ret;
 }
 
-static void float_invalid_cvt(CPUPPCState *env, int flags,
-                              bool set_fprc, uintptr_t retaddr)
+static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
+                                  uint64_t ret, uint64_t ret_nan,
+                                  bool set_fprc, uintptr_t retaddr)
 {
-    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+    /*
+     * VXCVI is different from most in that it sets two exception bits,
+     * VXCVI and VXSNAN for an SNaN input.
+     */
     if (flags & float_flag_invalid_snan) {
-        float_invalid_op_vxsnan(env, retaddr);
+        env->fpscr |= FP_VXSNAN;
     }
+    float_invalid_op_vxcvi(env, set_fprc, retaddr);
+
+    return flags & float_flag_invalid_cvti ? ret : ret_nan;
 }
 
 #define FPU_FCTI(op, cvt, nanval)                                      \
@@ -551,10 +558,8 @@ uint64_t helper_##op(CPUPPCState *env, float64 arg)                    \
 {                                                                      \
     uint64_t ret = float64_to_##cvt(arg, &env->fp_status);             \
     int flags = get_float_exception_flags(&env->fp_status);            \
-                                                                       \
     if (unlikely(flags & float_flag_invalid)) {                        \
-        float_invalid_cvt(env, flags, 1, GETPC());                     \
-        ret = nanval;                                                  \
+        ret = float_invalid_cvt(env, flags, ret, nanval, 1, GETPC());  \
     }                                                                  \
     return ret;                                                        \
 }
@@ -2746,8 +2751,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
         flags = env->fp_status.float_exception_flags;                        \
         if (unlikely(flags & float_flag_invalid)) {                          \
-            float_invalid_cvt(env, flags, 0, GETPC());                       \
-            t.tfld = rnan;                                                   \
+            t.tfld = float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC());\
         }                                                                    \
         all_flags |= flags;                                                  \
     }                                                                        \
@@ -2794,8 +2798,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
     flags = get_float_exception_flags(&env->fp_status);                      \
     if (flags & float_flag_invalid) {                                        \
-        float_invalid_cvt(env, flags, 0, GETPC());                           \
-        t.tfld = rnan;                                                       \
+        t.tfld = float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC());    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-- 
2.25.1


