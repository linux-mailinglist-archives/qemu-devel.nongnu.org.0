Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2012F8936
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:12:52 +0100 (CET)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YGx-0000vV-Et
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsL-0003sE-NY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsF-0005JF-Ak
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x12so5438187plr.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+pOvzjLdVYp+MmYo9tDbbGKAe+YDrG7n/EDarHxK9g=;
 b=x0XQUAUsc7bB+vP4BeTYRil5LWXgaCzg/miumn33qYnIpbwR0B06YQ3tHmXqOHdGKv
 EUecuDPif9BQWgX6TNmlmLfRrfR+GDSEjdKJNgUgLKM6mrAg6zhutkLlzqJ206o+8G29
 Q7b4Tq0QPTNei1l1FyuVR/IP9cZdfZanRyfaX9LpCb829mKAtH/H5RmxFbEX+I+Kd8RD
 trTx/5L1rY9vvjRQ36HN5LRVkaLclWbm/3qJt1Afg06vzZoLgMFTqKqsDs3dGtHiq9r6
 PF12XeazIhUAiLlkzVXDTwRFDZX4bg+oFylqc3gi//25pDh0Z7TvqFjErhPyRyk9BvML
 eWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+pOvzjLdVYp+MmYo9tDbbGKAe+YDrG7n/EDarHxK9g=;
 b=fKihzqgYLPDWCbWPKBub2T+idVApRl11OIGpFsD2Sc+0/xk8iW4TUgXNeCqPt/5sm6
 DhDlpPLzfldr3vJWy0kG/7j06iTMX93WdDpdVgFqiWuZMHPK6M9fXrGML62gDiWkl+pr
 IiCqf5pWqaQzspTWQU9MI06tOmDp/uVAFEup17pzLHGyeNjr2+eDdC8UwUW7pJZudqfl
 swV3j7rROrwuQiqeZV2Xhj6muXg8QkxXlO1tG8vyK1/DtZJKVkbqgpl2dMldnoI5wSBi
 jAWAYbnEroKyk7m29J9WQmxEPyLvUD+bEtmisqQK19M213e/5SMgvuKtCHsvxDZ5655x
 UAWg==
X-Gm-Message-State: AOAM530BliqYmYQgeO4+jN6Q3aOGcOcy97xPed55DcoAKGAWitiTILSL
 NLuZ5dK8oeORIuxGrz4W9+4bMwZFMuZkGVtJ
X-Google-Smtp-Source: ABdhPJyIegFssN9gj9aZVacE2wYVAV0rck4ogiGU7LY3JSdPqG7CpQyrZpV48j2v9B5p5RRIBGx5RA==
X-Received: by 2002:a17:90a:5318:: with SMTP id
 x24mr13186645pjh.226.1610750838077; 
 Fri, 15 Jan 2021 14:47:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for async
 tag check error
Date: Fri, 15 Jan 2021 12:46:42 -1000
Message-Id: <20210115224645.1196742-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  1 +
 linux-user/aarch64/cpu_loop.c      | 34 +++++++++++++++++++++---------
 target/arm/mte_helper.c            | 10 +++++++++
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 777fb667fe..18013e1b23 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,6 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 6867f0db2b..6160a401bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -72,6 +72,21 @@
         put_user_u16(__x, (gaddr));                     \
     })
 
+static bool check_mte_async_fault(CPUARMState *env, target_siginfo_t *info)
+{
+    if (likely(env->cp15.tfsr_el[0] == 0)) {
+        return false;
+    }
+
+    env->cp15.tfsr_el[0] = 0;
+    info->si_signo = TARGET_SIGSEGV;
+    info->si_errno = 0;
+    info->_sifields._sigfault._addr = 0;
+    info->si_code = TARGET_SEGV_MTEAERR;
+    queue_signal(env, info->si_signo, QEMU_SI_FAULT, info);
+    return true;
+}
+
 /* AArch64 main loop */
 void cpu_loop(CPUARMState *env)
 {
@@ -88,15 +103,13 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
-            ret = do_syscall(env,
-                             env->xregs[8],
-                             env->xregs[0],
-                             env->xregs[1],
-                             env->xregs[2],
-                             env->xregs[3],
-                             env->xregs[4],
-                             env->xregs[5],
-                             0, 0);
+            if (check_mte_async_fault(env, &info)) {
+                ret = -TARGET_ERESTARTSYS;
+            } else {
+                ret = do_syscall(env, env->xregs[8], env->xregs[0],
+                                 env->xregs[1], env->xregs[2], env->xregs[3],
+                                 env->xregs[4], env->xregs[5], 0, 0);
+            }
             if (ret == -TARGET_ERESTARTSYS) {
                 env->pc -= 4;
             } else if (ret != -TARGET_QEMU_ESIGRETURN) {
@@ -104,7 +117,8 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
+            /* Just indicate that signals should be handled asap. */
+            check_mte_async_fault(env, &info);
             break;
         case EXCP_UDEF:
             info.si_signo = TARGET_SIGILL;
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 153bd1e9df..d55f8d1e1e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -565,6 +565,16 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
             select = 0;
         }
         env->cp15.tfsr_el[el] |= 1 << select;
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Stand in for a timer irq, setting _TIF_MTE_ASYNC_FAULT,
+         * which then sends a SIGSEGV when the thread is next scheduled.
+         * This cpu will return to the main loop at the end of the TB,
+         * which is rather sooner than "normal".  But the alternative
+         * is waiting until the next syscall.
+         */
+        qemu_cpu_kick(env_cpu(env));
+#endif
         break;
 
     default:
-- 
2.25.1


