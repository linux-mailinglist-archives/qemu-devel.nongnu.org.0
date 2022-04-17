Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585845048E1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:24:13 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9ZE-00054R-EP
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xD-0000yW-9x
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:55 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xA-0003MY-Ua
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso12207472pjf.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kQGH0Cy2HcRWOzQdszvWYCvmoLOtgBt5ZPwOUyma0Q=;
 b=wQAAsmyg3n5S4LCPwHVToO0VZ2joUjpYmEbZ+5t0AWJ0EgNje3FkibzaA+gW4ndzCp
 EMcj8aWHiRsksbK7rsBECqUAgNUt7DHZavxlvgUWi2cuamDnuRfAQZ2wadKYkGNDE4o+
 uX9/JB/7NFYKHlD8d4kxFGGcYbDdeo1ua2n7otSJWjQE0IBfxC/woMGJHWi5iqtFqGLh
 jNYggpGlIR5kawCPT/E3aYUpJpBZNp/s4Yr9HSmzkmov03S+u5Loh1kDq9BjGVyDclgE
 cUjFYhpkSvZTXVpfBV79SMvSd7IouIHokZvdlFbGI5lxazmKjehWrbYzjKyvNpgg9r6M
 WBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kQGH0Cy2HcRWOzQdszvWYCvmoLOtgBt5ZPwOUyma0Q=;
 b=IaP6hXokvrA2AtAS+RoIsS0cI5JlYT4xNIAoCcOVoqcSUn3VuTSKYVhBSDW3WwELNJ
 8SFjATCwfSCONyEVpfNdL52p31+CxPIqIGAaL/X8k7NX9GsYuLwb6pDMFykofOv4hYiz
 l3CddwE0utxJlJazBbDNZzRTgCnQ+0C77Mk3DX9PPri48YugLJRUE1uN7+BNqQVNzN4W
 XB1O2oefie4XP2z0v9eLLmSvc4OGSr43E5H+pcYV8CEyvUVbhGJNbk1PX8vPUPe6rrR6
 LiVm4dp0Z5cq6fqWzVTxwpse21V1WVJCszxXr8hOinKJD2v2awYXwEX192w72uolPhnG
 ZBXQ==
X-Gm-Message-State: AOAM532TAni9RTtOBVyMixZaPAPiUHTPuJ6ikQUbVEYAGHohOg5tLZsx
 PtRdmshpjLMXRFugkx6B4H+AlzsMmrDC9A==
X-Google-Smtp-Source: ABdhPJxcs3UM5RWSpnFYg/ZuKXWa2HfYB5+ucs7+4AWJmJu+EkqyNvZxCVADm5KyKGk+s9r5qeP/Ew==
X-Received: by 2002:a17:902:e0ca:b0:158:cc0a:44f7 with SMTP id
 e10-20020a170902e0ca00b00158cc0a44f7mr7343242pla.70.1650217491599; 
 Sun, 17 Apr 2022 10:44:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
Date: Sun, 17 Apr 2022 10:43:51 -0700
Message-Id: <20220417174426.711829-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rearrange the values of the enumerators of CPAccessResult
so that we may directly extract the target el. For the two
special cases in access_check_cp_reg, use CPAccessResult.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h    | 26 ++++++++++++--------
 target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
 2 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 005aa2d3a5..700fcc1478 100644
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
2.25.1


