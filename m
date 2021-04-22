Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF6368936
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:06:47 +0200 (CEST)
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZiPG-0001An-DR
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLG-0005Ee-0t
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZiLB-0007p6-4f
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:02:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id h20so24313504plr.4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcPohUJWUFK5d9fBWTi1civihLvFybtJees054KN698=;
 b=nK+8iNGgiElRkLPhvH2RntlROcVQ0UaIVOTu5rAW+MEVw6hMb8bKJzhyMD15Tq1Wxy
 hq08ZcBuEpAfNujI5yFJ11mA5BK3TdO0Gprx6R8hVq6Plb19krvuF+dkTaA2ZqdKICLR
 sY/4/vsOFg/XilXqx3Ef/ii2VBqg5sqfQ4YQ4nMlQ7SiJePNz5ii/rXof+U9F4swOh8C
 zcwIIQjvS+xiaBqzaVvR8KfhnssKcBXG5K1Qqu0cBT7dYE64yVaZ+SUP/4TMp6BYWdsN
 ag7envE1QPNxln8hEJXdZyJyk/Kq9L27iAfiL5tW9W5YcUW6/9YtfexxZgHNYIBTXsQB
 6eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcPohUJWUFK5d9fBWTi1civihLvFybtJees054KN698=;
 b=P1SkwIPeBLTkHu1GuCPmIa48H0FKdL91/s5/7sVY0eeGZynLtwC7j1z3RDnVxmenFj
 elCc90ms5t64oJq6KmcXg3/APeo4Thcby6D6lqZIzBAeuQEUaEHV5twgnjEGLRy3TKtp
 9uH1Gx6eIcDII4iwNdz3d09MpMXdqIknJtf+kBQw8I9mDTgcMkf3XGvvmJ4YHKQmPCX3
 RCGERH5iNPJyZKR2HJo5Gk0jOgcvkA0dpI6wO/HwnbVMb/nQA5HZf4Fio+/62vJ9xbwB
 AR9QFMxqgRZ0yRKslsDVB4UMVyDQ2DbQigDie9ZC36tdTDC95YYwwt6+QxZB7pMK4SGm
 8Kdw==
X-Gm-Message-State: AOAM532Jsv9XI+dULAcsUtp322t4UeNpsmS4XrF9sZ8YUZyyj6dy7stQ
 MIzUbqDjjPPSNkxI3TQC9cC5ybELFbj9KQ==
X-Google-Smtp-Source: ABdhPJwIiElIq1Cipf1p9U13WPbfbhfOXXqPnNgSSadOTjRWM+VJxZAlm87A1+BPYsZUhPkbt22gZQ==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr1089993pjb.47.1619132551466; 
 Thu, 22 Apr 2021 16:02:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z12sm2930605pfn.195.2021.04.22.16.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:02:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] linux-user: Pass ka_restorer to do_sigaction
Date: Thu, 22 Apr 2021 16:02:23 -0700
Message-Id: <20210422230227.314751-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
References: <20210422230227.314751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of ka_restorer needs to be saved in sigact_table.
At the moment, the attempt to save it in do_syscall is
improperly clobbering user memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h |  2 +-
 linux-user/signal.c       |  5 ++++-
 linux-user/syscall.c      | 19 ++++++-------------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 693d4f3788..e4aaf8412f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -492,7 +492,7 @@ void target_to_host_old_sigset(sigset_t *sigset,
                                const abi_ulong *old_sigset);
 struct target_sigaction;
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact);
+                 struct target_sigaction *oact, abi_ulong ka_restorer);
 
 #include "target_signal.h"
 
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 7eecec46c4..44a5012930 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -830,7 +830,7 @@ out:
 
 /* do_sigaction() return target values and host errnos */
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact)
+                 struct target_sigaction *oact, abi_ulong ka_restorer)
 {
     struct target_sigaction *k;
     struct sigaction act1;
@@ -863,6 +863,9 @@ int do_sigaction(int sig, const struct target_sigaction *act,
         __get_user(k->sa_flags, &act->sa_flags);
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
         __get_user(k->sa_restorer, &act->sa_restorer);
+#endif
+#ifdef TARGET_ARCH_HAS_KA_RESTORER
+        k->ka_restorer = ka_restorer;
 #endif
         /* To be swapped in target_to_host_sigset.  */
         k->sa_mask = act->sa_mask;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ee21eb5e6f..36169a0ded 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8989,11 +8989,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = old_act->_sa_handler;
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
-                act.ka_restorer = 0;
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
+            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
             if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
                     return -TARGET_EFAULT;
@@ -9017,7 +9016,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 		pact = NULL;
 	    }
 
-	    ret = get_errno(do_sigaction(arg1, pact, &oact));
+	    ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
 
 	    if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
@@ -9040,15 +9039,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 target_siginitset(&act.sa_mask, old_act->sa_mask);
                 act.sa_flags = old_act->sa_flags;
                 act.sa_restorer = old_act->sa_restorer;
-#ifdef TARGET_ARCH_HAS_KA_RESTORER
-                act.ka_restorer = 0;
-#endif
                 unlock_user_struct(old_act, arg2, 0);
                 pact = &act;
             } else {
                 pact = NULL;
             }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
+            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
             if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
                     return -TARGET_EFAULT;
@@ -9085,11 +9081,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 act._sa_handler = rt_act->_sa_handler;
                 act.sa_mask = rt_act->sa_mask;
                 act.sa_flags = rt_act->sa_flags;
-                act.ka_restorer = arg5;
                 unlock_user_struct(rt_act, arg2, 0);
                 pact = &act;
             }
-            ret = get_errno(do_sigaction(arg1, pact, &oact));
+            ret = get_errno(do_sigaction(arg1, pact, &oact, arg5));
             if (!is_error(ret) && arg3) {
                 if (!lock_user_struct(VERIFY_WRITE, rt_act, arg3, 0))
                     return -TARGET_EFAULT;
@@ -9104,6 +9099,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             target_ulong sigsetsize = arg5;
 #else
             target_ulong sigsetsize = arg4;
+            target_ulong restorer = 0;
 #endif
             struct target_sigaction *act;
             struct target_sigaction *oact;
@@ -9115,9 +9111,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 if (!lock_user_struct(VERIFY_READ, act, arg2, 1)) {
                     return -TARGET_EFAULT;
                 }
-#ifdef TARGET_ARCH_HAS_KA_RESTORER
-                act->ka_restorer = restorer;
-#endif
             } else {
                 act = NULL;
             }
@@ -9128,7 +9121,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
             } else
                 oact = NULL;
-            ret = get_errno(do_sigaction(arg1, act, oact));
+            ret = get_errno(do_sigaction(arg1, act, oact, restorer));
 	rt_sigaction_fail:
             if (act)
                 unlock_user_struct(act, arg2, 0);
-- 
2.25.1


