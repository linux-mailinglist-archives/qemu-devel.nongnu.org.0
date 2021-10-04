Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C78420727
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:16:45 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ9P-0004bU-Lc
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeZ-0004Pt-BE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeK-0004p4-Jc
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:49 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mi4un-1n2Dc71PXt-00e893; Mon, 04
 Oct 2021 09:44:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] linux-user/m68k: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:07 +0200
Message-Id: <20211004074421.3141222-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1DgHCBPdYMlNL/Lp4AhHSyXZbDc7LU/FnUP6wCSRdv05/tMNsTB
 2bLZBoAY86xD344ehaov7bOYrdzkD+JroQn9aPdzXx7vJU+KfIYuLfVrujBu1bTF/Srv8p5
 Ijpw0CaNtFsn5ADEUp32rSE92WNLv37oi1xi8TkgjdaQHTB5GoY6r4MpEaWJKygNbg7x77k
 g4brSshE2CMWrAAwzt3yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DlnajSSkPlI=:UDu4WeGaNL1/Nxp26rFBx1
 1RFzH35h18kqAhIoWeZIbMzonW7fFjNdlOhSCKMwSi0DPmMfb5dCb855lwxzXQwPXnQg7sQWY
 aprPUPSLvIOIUKFjXjH4Fz9zz1W2zBqJfIUHkPqtDsYS0F3bYrGV+rdsWDGqeEdKfojC9a6S2
 AXkG613+fQavwFd/z+hx06hYesy77fjeZi1Xs6Tg6we2KrIBsqUKYg73yVSBvhyPPaTY/wTbB
 yDofgwD6KRSJXHVyRVXLf2jbVUHEyiJP2JsHR+eTgzNdTNJUEneih5X6lshlgzQXUlX33FBF/
 IQygHvb882I9CHoNV0w6QsuBX7zZtomjuy3GZnFKvLa8BkjyYQV8zsKstGMMtS4Qbf/+LgWW8
 EGuvBGVZS/oBB1uXiyr4v94dM+kL/0ZHSH17NoPGDFCxxMX+liMzo1O7Uwzfo9TAM75Vmtzvb
 8KZpCfqtBy2dMNQQn+u4Dl8oH8NVHAwGNhhWnzMCyBiBkP8ng3cC9xQPX4OZfGXiJGe2OyOji
 g7G6paqNg21coVY8Oq1zMReAD/+yzowTBPP35CfrfHg2eQmmz8ZhiVdzZEgoE3UlFMQv2humU
 j9LcPor9Dr4WuT3QmAlB3oUB5DdIcmw8UKVuc0oAc9+Sh2AXsMfZfVu3wbXT38ah8292mhnxP
 ymph7U4b3KJhaDOjlPgVTGS6U3+TBgbcmepYgMnC3jtSsswt0LApY8AnqkW0NAYFWQDpmY9OF
 dPO7WeQZaI5W1rh8mI2mhodz2jQU1T6k0IrRvg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the two signal trampolines.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-13-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/signal.c        | 47 +++++++++++++++------------------
 linux-user/m68k/target_signal.h |  2 ++
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
index 4f8eb6f727e4..ec33482e1403 100644
--- a/linux-user/m68k/signal.c
+++ b/linux-user/m68k/signal.c
@@ -39,7 +39,6 @@ struct target_sigframe
     int sig;
     int code;
     abi_ulong psc;
-    char retcode[8];
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     struct target_sigcontext sc;
 };
@@ -76,7 +75,6 @@ struct target_rt_sigframe
     int sig;
     abi_ulong pinfo;
     abi_ulong puc;
-    char retcode[8];
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -130,7 +128,6 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     struct target_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong sc_addr;
     int i;
 
@@ -152,16 +149,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; trap #0 */
-
-    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16),
-               (uint32_t *)(frame->retcode));
-
-    /* Set up to return from userspace */
+    __put_user(default_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -288,7 +276,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 {
     struct target_rt_sigframe *frame;
     abi_ulong frame_addr;
-    abi_ulong retcode_addr;
     abi_ulong info_addr;
     abi_ulong uc_addr;
     int err = 0;
@@ -325,17 +312,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Set up to return from userspace.  */
-
-    retcode_addr = frame_addr + offsetof(struct target_sigframe, retcode);
-    __put_user(retcode_addr, &frame->pretcode);
-
-    /* moveq #,d0; notb d0; trap #0 */
-
-    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
-               (uint32_t *)(frame->retcode + 0));
-    __put_user(0x4e40, (uint16_t *)(frame->retcode + 4));
-
-    /* Set up to return from userspace */
+    __put_user(default_rt_sigreturn, &frame->pretcode);
 
     env->aregs[7] = frame_addr;
     env->pc = ka->_sa_handler;
@@ -411,3 +388,23 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    void *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 + 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+
+    /* moveq #,d0; trap #0 */
+    __put_user(0x70004e40 + (TARGET_NR_sigreturn << 16), (uint32_t *)tramp);
+
+    default_rt_sigreturn = sigtramp_page + 4;
+
+    /* moveq #,d0; notb d0; trap #0 */
+    __put_user(0x70004600 + ((TARGET_NR_rt_sigreturn ^ 0xff) << 16),
+               (uint32_t *)(tramp + 4));
+    __put_user(0x4e40, (uint16_t *)(tramp + 8));
+
+    unlock_user(tramp, sigtramp_page, 4 + 6);
+}
diff --git a/linux-user/m68k/target_signal.h b/linux-user/m68k/target_signal.h
index d096544ef842..94157bf1f48d 100644
--- a/linux-user/m68k/target_signal.h
+++ b/linux-user/m68k/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* M68K_TARGET_SIGNAL_H */
-- 
2.31.1


