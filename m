Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E6383CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:03:26 +0200 (CEST)
Received: from localhost ([::1]:50994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiWT-0007m7-8K
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm2-0006vO-7E
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004ZJ-CD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:25 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MaHOX-1lxIm82ylp-00WILc; Mon, 17
 May 2021 20:14:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 53/59] linux-user: Pass ka_restorer to do_sigaction
Date: Mon, 17 May 2021 20:14:18 +0200
Message-Id: <20210517181424.8093-54-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mcsTfc6fOoZjp0wHQWNS2UTZdGTnyUWtJhL+kCpbN0KgtpwY21I
 BvztYYBMLD+ryRP9aIKW1af8yOigTph2jpJVkCVoVpuBvXh544mcAr6rwgn6iP59nlMNhQO
 O/5asGffLqeB95QguIQM0MW0PHxPTmbPbNwLOBkcIUbizhrExGkEA3/JVfvDg5oyC+CqOH0
 qAFCCUYAIVbqEoT7mrHoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O6hzklbdBm0=:EykCqzB6cRFiyJmtEpxUZe
 qFq1pDU/fcfq62r90FS/MdXqKPbWohthY7uvmI59kSkTkHo1T+rDX+LXMgBwY0jXHdpjC0eMf
 xhWSfY2+vbKTfHmJkho75Ak+poWGsG+1UqQbGWCoWdBxsfLmHsU1DvouuYUaUQdC6oKrzw7Z1
 ZMWyJlwZ30t37qG3MxXvRZhbv7jS8sVtINvGMoLSQ6NFRHVJSTSjjsYF7T4383Du+SdNfi0zz
 AZHiixwPS+gZl9GTjWkVZUsdr4o8jdP3dl77eiyAuLFcf/WrPKfuXc4fg9LINZmfl5wu2MRkT
 TG/bazEK8zUGj2SE/SL5mfS5YRSYz2n8Duc2xqRVkmlSq+cw3WaeWjkjW55e43Cgp2rPQ7/cM
 L4LIpiYL94PpzsoC9insnNdOj1VCqiFk/MZ3+Ej+bL7xobrIDSxdhfuf3bIZX6d7nbzQhsL2O
 bA+m+FiZKFXzp03UDqCia2u+2L1k7rTbkwMEIbewNzUv0HsDfURfq2apvmV2I7H1mz8xrXhB5
 1zs5CWnIoEB1euS8qkm6c8=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The value of ka_restorer needs to be saved in sigact_table.
At the moment, the attempt to save it in do_syscall is
improperly clobbering user memory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422230227.314751-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/signal.c       |  5 ++++-
 linux-user/syscall.c      | 19 ++++++-------------
 linux-user/syscall_defs.h |  2 +-
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index cbd80b28cf5a..9016896dcda0 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -842,7 +842,7 @@ abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
 
 /* do_sigaction() return target values and host errnos */
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact)
+                 struct target_sigaction *oact, abi_ulong ka_restorer)
 {
     struct target_sigaction *k;
     struct sigaction act1;
@@ -875,6 +875,9 @@ int do_sigaction(int sig, const struct target_sigaction *act,
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
index 82736540ebcc..1f282574a12c 100644
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
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 693d4f3788d4..e4aaf8412f56 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -492,7 +492,7 @@ void target_to_host_old_sigset(sigset_t *sigset,
                                const abi_ulong *old_sigset);
 struct target_sigaction;
 int do_sigaction(int sig, const struct target_sigaction *act,
-                 struct target_sigaction *oact);
+                 struct target_sigaction *oact, abi_ulong ka_restorer);
 
 #include "target_signal.h"
 
-- 
2.31.1


