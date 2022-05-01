Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A3516217
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 07:57:00 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2Zn-0002Lk-Ly
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 01:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tb-0006jz-Fh
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2TZ-0001E9-Id
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:35 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e24so10350950pjt.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dx5oiRJc+noH6sVw0rqRTwoMiOy0KFwAAYpCE0cKydI=;
 b=FXv2Ap61Mj45dxmTRg+AU2WAE94b6Gx//d7KHUC4Lk7dGyPJoJ7WUGijvyxj0QJYeH
 Hv2NPLZnjSCShg30ydlkFAr8LwcYyR0JiOvj35osagvgWVX3PkcRS5/980ZKtM5vNl4O
 pRBF1rKuzVrWTYTZgtRsFU6WAjJH27EEcXtw+Tc1S5bsLebaOcjWMAOVEF6+7a+dstVd
 nb/DqCUikBQG9XHvPohbGSOCrjooSiMvM70/SfD+Omqsi05ICYPexOm0QuxUhSZJPJHj
 ItzGNptlNu6YALGyyhd8j5ZwrlrMe+dpAE1hnBNNkhW4PCDJO3Gq3fxZhPuCYAhh6te4
 Jkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dx5oiRJc+noH6sVw0rqRTwoMiOy0KFwAAYpCE0cKydI=;
 b=J2ZAeIDfpYG0tXCiS0mSpe/k6TzuiWhVWbINjLNjFtY3DYxyREBdfrq005lizXh9C0
 hH9hmow0EsQGgxR+kcghvsB1SbZCnBrbGq0eJqj0okJ33AZsRGPX11KsiZA+SHBAMPPU
 AzJIB7LZnkG8ACqfJbtk3O1Z9+sYyBe6j+Zov1RZm1N7k9c5b3MuyXKEWOxj1gymxxoF
 cCNyQaqs2Sz/P8/L4vWn9ZNS+wvtXH3J8etjBQ7A83mj7+ZEy3ouYM387bMAtg/lvQLf
 XLL5sUYeGRmXlZ1zMh0WbECckOvd3t6bw5Tza28RTB636+lzQ5SQPkoKwSb9L/AiwQiX
 qRlw==
X-Gm-Message-State: AOAM5322tl+JwCZ1aPkFIsItbX15KXTgJz7yU6hiXIUM5awO55PWYNSQ
 88B17yEj33OnocZXPhohK6V75jZuPPgNkw==
X-Google-Smtp-Source: ABdhPJwZaIgaJEjlKPGaKR1BuBhYfQdIrnXmE+nQLtm1Hc2lo0L05F+FizhZKcif1EdLEvy4l7MnpA==
X-Received: by 2002:a17:90a:e7c1:b0:1d2:b8f8:ecc1 with SMTP id
 kb1-20020a17090ae7c100b001d2b8f8ecc1mr12002875pjb.176.1651384232254; 
 Sat, 30 Apr 2022 22:50:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/45] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
Date: Sat, 30 Apr 2022 22:49:44 -0700
Message-Id: <20220501055028.646596-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rearrange the values of the enumerators of CPAccessResult
so that we may directly extract the target el. For the two
special cases in access_check_cp_reg, use CPAccessResult.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h    | 26 ++++++++++++--------
 target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 8064c0763e..7f2c30eab1 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -167,26 +167,32 @@ static inline bool cptype_valid(int cptype)
 typedef enum CPAccessResult {
     /* Access is permitted */
     CP_ACCESS_OK = 0,
+
+    /*
+     * Combined with one of the following, the low 2 bits indicate the
+     * target exception level.  If 0, the exception is taken to the usual
+     * target EL (EL1 or PL1 if in EL0, otherwise to the current EL).
+     */
+    CP_ACCESS_EL_MASK = 3,
+
     /*
      * Access fails due to a configurable trap or enable which would
      * result in a categorized exception syndrome giving information about
      * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
-     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 or
-     * PL1 if in EL0, otherwise to the current EL).
+     * 0xc or 0x18).
      */
-    CP_ACCESS_TRAP = 1,
+    CP_ACCESS_TRAP = (1 << 2),
+    CP_ACCESS_TRAP_EL2 = CP_ACCESS_TRAP | 2,
+    CP_ACCESS_TRAP_EL3 = CP_ACCESS_TRAP | 3,
+
     /*
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
      */
-    CP_ACCESS_TRAP_UNCATEGORIZED = 2,
-    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_EL2 = 3,
-    CP_ACCESS_TRAP_EL3 = 4,
-    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 */
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = 5,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = 6,
+    CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = CP_ACCESS_TRAP_UNCATEGORIZED | 2,
+    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = CP_ACCESS_TRAP_UNCATEGORIZED | 3,
 } CPAccessResult;
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 67be91c732..76499ffa14 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -632,11 +632,13 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
 {
     const ARMCPRegInfo *ri = rip;
+    CPAccessResult res = CP_ACCESS_OK;
     int target_el;
 
     if (arm_feature(env, ARM_FEATURE_XSCALE) && ri->cp < 14
         && extract32(env->cp15.c15_cpar, ri->cp, 1) == 0) {
-        raise_exception(env, EXCP_UDEF, syndrome, exception_target_el(env));
+        res = CP_ACCESS_TRAP;
+        goto fail;
     }
 
     /*
@@ -655,48 +657,46 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
         mask &= ~((1 << 4) | (1 << 14));
 
         if (env->cp15.hstr_el2 & mask) {
-            target_el = 2;
-            goto exept;
+            res = CP_ACCESS_TRAP_EL2;
+            goto fail;
         }
     }
 
-    if (!ri->accessfn) {
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+    if (likely(res == CP_ACCESS_OK)) {
         return;
     }
 
-    switch (ri->accessfn(env, ri, isread)) {
-    case CP_ACCESS_OK:
-        return;
+ fail:
+    switch (res & ~CP_ACCESS_EL_MASK) {
     case CP_ACCESS_TRAP:
-        target_el = exception_target_el(env);
-        break;
-    case CP_ACCESS_TRAP_EL2:
-        /* Requesting a trap to EL2 when we're in EL3 is
-         * a bug in the access function.
-         */
-        assert(arm_current_el(env) != 3);
-        target_el = 2;
-        break;
-    case CP_ACCESS_TRAP_EL3:
-        target_el = 3;
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
-        target_el = exception_target_el(env);
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL2:
-        target_el = 2;
-        syndrome = syn_uncategorized();
-        break;
-    case CP_ACCESS_TRAP_UNCATEGORIZED_EL3:
-        target_el = 3;
         syndrome = syn_uncategorized();
         break;
     default:
         g_assert_not_reached();
     }
 
-exept:
+    target_el = res & CP_ACCESS_EL_MASK;
+    switch (target_el) {
+    case 0:
+        target_el = exception_target_el(env);
+        break;
+    case 2:
+        assert(arm_current_el(env) != 3);
+        assert(arm_is_el2_enabled(env));
+        break;
+    case 3:
+        assert(arm_feature(env, ARM_FEATURE_EL3));
+        break;
+    default:
+        /* No "direct" traps to EL1 */
+        g_assert_not_reached();
+    }
+
     raise_exception(env, EXCP_UDEF, syndrome, target_el);
 }
 
-- 
2.34.1


