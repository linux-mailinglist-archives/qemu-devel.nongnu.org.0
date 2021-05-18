Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AC3871EC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:31:08 +0200 (CEST)
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litFz-0007h3-Jq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKx-00088Z-17
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:11 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKp-0007Ce-SJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:10 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEUaQ-1lg9aF3Vik-00G0FI; Tue, 18
 May 2021 07:32:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 56/59] linux-user/alpha: Share code for TARGET_NR_sigaction
Date: Tue, 18 May 2021 07:31:28 +0200
Message-Id: <20210518053131.87212-57-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uIe5Oi1LqiCOTOhl/5aXtZNXe6NL5mR8sAovxAghsJO/Bonhbum
 rqsQs8HghicY3ynqZIgJ8sLTlnCA32dseuKPR7nUW5edQN3tDWI6pL7W23ZVkRlN6hRBFRy
 vZbRU/9O5b198BWw87Af05K9y9H8lwyQr1ONzH7hOsRtrdDXmOsWoJiRIzF1keUFsVA6+aS
 bsPh5NUuNDwfeaA64J1MQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VnsybytxsFY=:YEJm3fSrnSzrPwvj7ZNnUL
 +gUXa/K1PvsEp+5XhQvuaE7d1PgDRL96e0Znpua/6iPHIalCNs7tVSWjuXDeQu362Y+JwtjFP
 dSSI2ZjjbMYDn/p0CuNFA/6G+wGIe+gitVOVaimxmn3LTpPu+PQe6svseY6+CkE5Qygwn67oL
 yDxEYeP44vK/Xo1Tn8m4yQCTHsj0zuZApL0EeaGAvtHtpqv4cvLZaczr1mGmdwBWjPdaOgzoC
 O5HBbRGjSd2AhoVkrGXl3Kqm90epkHfHfAAgaZh1s6VKhoTnmBou9Ua0HnD6b8VmXU3MjIv4N
 Gm0UsIaK6ks6jgoQ2q2tdyQ7Tx4NlUXoxwOU8CrOtFrd6dIFiSpc9vFAQR0zg33H3ZRsTv4wY
 iXPqo5EEtyBJMC54Pwvke0WdEUh7419yYZ4rx3bk+9WRcgxLAXvqDBen1Yy443M0py5lnQKx9
 JCHemb3HLe0HKZukehouDoqrr+bQqDsy3xK+MOKd+2aiDBrKWMiN4qDs3jAImzJfTJ10M9gQV
 QZA6ItAe7EiEsSm7/LMP8A=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
index 048056ba2bf2..8d7ac1ebcffa 100644
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


