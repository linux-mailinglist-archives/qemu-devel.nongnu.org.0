Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDC383CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:53:14 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiMa-0002JL-Iu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm4-000707-FR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004ZQ-Ci
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:28 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MKd92-1m3gYd1MjM-00KylB; Mon, 17
 May 2021 20:14:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 56/59] linux-user/alpha: Share code for TARGET_NR_sigaction
Date: Mon, 17 May 2021 20:14:21 +0200
Message-Id: <20210517181424.8093-57-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VRqOgVQyn2uZEI32R73D/tNDrEzGN9pMqKehuR8IzAu0OsRYqFb
 7VMHyzT/fbly6sNo6FkT8U9NZ4jXNNs8YpJRJUdb6uUuYWKOyQ16zlqkijcbtbIObkHSGd/
 avn2H01PK5kRI4Vy1lUlRK5NINvIg3EmfModtSO9MX8AB9i8bLT2UWVhvVUssQuj5x0TuSB
 LDVUp82LZ6Tuwdt8++XBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1cFfBAlHvyc=:ZgBUCzpPZ31GopnXCR2ORY
 8oqSkW+JAUkoTBGbbP/cerxBgNwqXR958v6h/IY3CgVSqs65EhYQxET512mshWzukryjnz4ME
 GdsegIVsRfXrKS/Msp8wX0vMKcAb9dDwmpz1/OAiUJ+i3ovQ60L69xpUqnYsT9nIXe7d4ye99
 oXDC4y8DeE9Mk6HJZZ4PA+3Fr8GdtUamoRuK+omxj54J1ssprC/UxOJ4mTSVqVy6Gm06PCe/6
 j/v7BweVAf2BM3Z7frBcszof5RkNAGstihICofWEhITVqljhf1MOpDhMVfiD7C5XK5Uyw+3vu
 hDYNt5R5tYGEtTBS/zp4TT/QZtlH277HzxcMxa9Q72SbYYOXf0HQXUQOQLJpzgXRyoyYCTZAT
 5ytn1Amo72tbu5HWI0u9yFINourzhbpylgEc9hPeZHiI/vMJY5fv3UX7YyDfLGl6PM9/dX7bX
 aSRBO/baH/Tc2z7k+1+ZT/zzUws7kv3dKXqGNpWEMUXXLaktLGVxBmqnDXl9WaUWhWsZEl52H
 2HQVUexUWmU8EXDzMmSTJk=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

There's no longer a difference between the alpha code and
the generic code.

There is a type difference in target_old_sigaction.sa_flags,
which can be resolved with a very much smaller ifdef, which
allows us to finish sharing the target_sigaction definition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422230227.314751-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 23 +----------------------
 linux-user/syscall_defs.h | 21 ++++++---------------
 2 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4515f816b59b..2c5ced1570b5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8980,28 +8980,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_sigaction
     case TARGET_NR_sigaction:
         {
-#if defined(TARGET_ALPHA)
-            struct target_sigaction act, oact, *pact = 0;
-            struct target_old_sigaction *old_act;
-            if (arg2) {
-                if (!lock_user_struct(VERIFY_READ, old_act, arg2, 1))
-                    return -TARGET_EFAULT;
-                act._sa_handler = old_act->_sa_handler;
-                target_siginitset(&act.sa_mask, old_act->sa_mask);
-                act.sa_flags = old_act->sa_flags;
-                unlock_user_struct(old_act, arg2, 0);
-                pact = &act;
-            }
-            ret = get_errno(do_sigaction(arg1, pact, &oact, 0));
-            if (!is_error(ret) && arg3) {
-                if (!lock_user_struct(VERIFY_WRITE, old_act, arg3, 0))
-                    return -TARGET_EFAULT;
-                old_act->_sa_handler = oact._sa_handler;
-                old_act->sa_mask = oact.sa_mask.sig[0];
-                old_act->sa_flags = oact.sa_flags;
-                unlock_user_struct(old_act, arg3, 1);
-            }
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
 	    struct target_sigaction act, oact, *pact, *old_act;
 
 	    if (arg2) {
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 7a1d3b239c02..18b031a2f6a8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -501,21 +501,12 @@ int do_sigaction(int sig, const struct target_sigaction *act,
 #endif
 
 #if defined(TARGET_ALPHA)
-struct target_old_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_mask;
-    int32_t sa_flags;
-};
+typedef int32_t target_old_sa_flags;
+#else
+typedef abi_ulong target_old_sa_flags;
+#endif
 
-/* This is the struct used inside the kernel.  The ka_restorer
-   field comes from the 5th argument to sys_rt_sigaction.  */
-struct target_sigaction {
-    abi_ulong _sa_handler;
-    abi_ulong sa_flags;
-    target_sigset_t sa_mask;
-    abi_ulong ka_restorer;
-};
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
 struct target_sigaction {
 	uint32_t	sa_flags;
 #if defined(TARGET_ABI_MIPSN32)
@@ -533,7 +524,7 @@ struct target_sigaction {
 struct target_old_sigaction {
         abi_ulong _sa_handler;
         abi_ulong sa_mask;
-        abi_ulong sa_flags;
+        target_old_sa_flags sa_flags;
 #ifdef TARGET_ARCH_HAS_SA_RESTORER
         abi_ulong sa_restorer;
 #endif
-- 
2.31.1


