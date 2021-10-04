Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43685420752
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:28:06 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJKP-0001RT-9O
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeZ-0004Pw-CT
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeT-0004yM-Bg
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:49 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3loZ-1mX1ni0Fql-000rRB; Mon, 04
 Oct 2021 09:44:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] linux-user/sh4: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:17 +0200
Message-Id: <20211004074421.3141222-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UY5j0COrFLEmlfQfVnJ3koYLiU9Vl3VFrGwXK8OfbZYdruni67y
 FSBAz7JRYyf+ndjBPINEi9Pq9F79OKb1F8yrieF3vGY8XLfcKdPvhsM7rWiwzhvYCpEZpaM
 ZlsWgJMsWaMFVLuDjTi/jp+g3++YHo5GxkQnDbuzn5mOGNkiW+ruCV9A3HrIznGP1xfdX8l
 OC0rh0P9PQvxRYBoMHL6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lBjxHDcKciI=:WiWlakfPIck/APP8uhbNij
 RQGRCRV9LotOilvhEKGtvWWl9qjLZqzHr8hw4BT1PSlO9/n06DoHY+l5VaKmqMmT9iLMGOyGj
 OlDCyiPjPw7l6IgJBixu2sYxNuYQd9UVGHru2SkVO/2oDsJrDYXkVwCYJVokgagZY5bQPN2XY
 rrEbXteVciswOrG8gFhPFE6S6REiPjOwQ4mUAXuCG8w7w0ri9pw+DZbVGU+1S5j8G4S9k9Qn+
 HClpRGXZATU2YFY4kiAgYBwFlt7wbO8Nu9riSJjQV3DBQc3ZZLS3m7NwfUwnjRbcDzdjODtSm
 J0DGNX3neq0vR24PiODuvYJ/yfXNycnldKS5TgPmxeTtQ/pDdEas7wbRSY26p8aRn4XCE3Ehx
 mQmYVFA0PbZMUEHHiwY6ZxTBPEIQ31bzEw8D+IVWaA/6dalXfrTQNlSoTRKu54U04xgu++2uF
 rxEK2rXXg4iFUJULVMy/6T6SH6EpzKry/pbpgczfki9eqbZR2oeDTbrWbVwVTuZ567uYiJksP
 jmLF/oHBYoLmpBouwzY/hzMswqiHA9ygiooWDZ56JGny2/jYgkEKelqZ/IkX72mUA/C0jfjGU
 9cigO3/2OBn+qA+RaYpd8Of4W8EXr94A8V3Ssu7thCaibPHllzvpg+LCWhYBJ9IUPazQVgJIa
 AZj/3Cy0k3JxsoM6MzcXFRSUO8crrNojjjBl/kWSlsV0j0OPMiV48Z0EJjOxQ1weGvnJxTqu5
 8sfUc09KxWVl2OzP9VkMuNKGbHie/ZCh8LoaZA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-23-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sh4/signal.c        | 40 +++++++++++++++++++---------------
 linux-user/sh4/target_signal.h |  2 ++
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
index d70d744befc2..faa869fb1958 100644
--- a/linux-user/sh4/signal.c
+++ b/linux-user/sh4/signal.c
@@ -52,7 +52,6 @@ struct target_sigframe
 {
     struct target_sigcontext sc;
     target_ulong extramask[TARGET_NSIG_WORDS-1];
-    uint16_t retcode[3];
 };
 
 
@@ -68,7 +67,6 @@ struct target_rt_sigframe
 {
     struct target_siginfo info;
     struct target_ucontext uc;
-    uint16_t retcode[3];
 };
 
 
@@ -190,15 +188,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        regs->pr = (unsigned long) ka->sa_restorer;
+        regs->pr = ka->sa_restorer;
     } else {
-        /* Generate return code (system call to sigreturn) */
-        abi_ulong retcode_addr = frame_addr +
-                                 offsetof(struct target_sigframe, retcode);
-        __put_user(MOVW(2), &frame->retcode[0]);
-        __put_user(TRAP_NOARG, &frame->retcode[1]);
-        __put_user((TARGET_NR_sigreturn), &frame->retcode[2]);
-        regs->pr = (unsigned long) retcode_addr;
+        regs->pr = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -248,15 +240,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        regs->pr = (unsigned long) ka->sa_restorer;
+        regs->pr = ka->sa_restorer;
     } else {
-        /* Generate return code (system call to sigreturn) */
-        abi_ulong retcode_addr = frame_addr +
-                                 offsetof(struct target_rt_sigframe, retcode);
-        __put_user(MOVW(2), &frame->retcode[0]);
-        __put_user(TRAP_NOARG, &frame->retcode[1]);
-        __put_user((TARGET_NR_rt_sigreturn), &frame->retcode[2]);
-        regs->pr = (unsigned long) retcode_addr;
+        regs->pr = default_rt_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -334,3 +320,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(MOVW(2), &tramp[0]);
+    __put_user(TRAP_NOARG, &tramp[1]);
+    __put_user(TARGET_NR_sigreturn, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 6;
+    __put_user(MOVW(2), &tramp[3]);
+    __put_user(TRAP_NOARG, &tramp[4]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 2 * 6);
+}
diff --git a/linux-user/sh4/target_signal.h b/linux-user/sh4/target_signal.h
index d7309b7136d7..04069cba6641 100644
--- a/linux-user/sh4/target_signal.h
+++ b/linux-user/sh4/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* SH4_TARGET_SIGNAL_H */
-- 
2.31.1


