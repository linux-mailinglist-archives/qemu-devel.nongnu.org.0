Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D0420704
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:07:16 +0200 (CEST)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ0F-00068h-Kq
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeR-0004Jr-Qn
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:43 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:41309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeM-0004sE-PP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:42 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MavF5-1n3tdg2jG7-00cTRz; Mon, 04
 Oct 2021 09:44:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/26] linux-user/cris: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:02 +0200
Message-Id: <20211004074421.3141222-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AYWD5ubbTywWVnEnEWbtAJt1YIMMn+hzNn3Ydo/W2UVOb8idEB9
 ayB7BHmXbQWD70dHNpm35qft9JW2b12zmCY3fdaSq6WO7W/0RX6OcfnuvZC7BeMf7JixdiH
 rxPYtzW0Gr3irH4cxH/06oX3KAhXMgI0g5GQHXDpgxpZvkkJq8SnzYxgBhumaaTG7+qkZb4
 DX3hb7GAfF1HOu6a8llxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SdfmUmY/5fs=:Ww+QdfCfSRkwIHVoo3BXxG
 8bRnbhBGg+pA1SQ9235wRIHafgrtToj82uL/bTPJHsrGfOzSikl12zyBbJCmZ6O9kWeEmgbED
 HDSV9mmoeaUJSA5IB+nvk1HphQkyYMwPcdGFLe8QeTBh5t+0YdjF6rVsP30lB+f22G0R/JU6W
 gMcHSed2lhzivuPFcjIWHTwfltzyAak/gZEldOjA9bV0wUYv8JXPymWC1obHOLNeaul+7fhdn
 dIuMq2WN94jwsA1bBU/VyrGpsJVC5WPktgZ1JKl5jaJstAPkS8fi2DVtc2Ldrr9Lj8sNf7rcS
 gf4hy7aaZsUSBJQAb3qyrdMnfdt3dK1G8si3PYXHwFkaA8XJkGXbi/p4Le5q9qjupybmFTUL8
 9ErtXjxJXTYRRHNlJjZLD62i75zAi/epwVDdW50nKPxDPWvHKf0Vk/43IHOTgKUEULywUY/E4
 g8k4+AsybKBW6dxChHqFX3POJCPZj3Iqs3pr7DiYg5TUOfwpMUihidPaAkYH+EiHumY4LjfvF
 aAp3T3gLqdVPVMHRXRlL0KvG86TdXG42inQNMy7M094xWE7iIKHcfVK9FTwnt4DuLzBdORcn+
 WCGQZWFeNSAQUA0Alr92Vuwjntr86d97jGJIMuPRvBibefJrQSKSF3NHHtOTjyX+oyoK+Qntn
 YFxx2vNGDccoPUmyf0qLmZ0BkmWCnOxe2L/NPN9G/ZPZaBp3IhE+4Szoe8XuNWRppiOjIPENb
 zrfTA2sghjAZB7yinFyvZ2b3q1MQ2dVu6DD03Q==
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Split out setup_sigreturn so that we can continue to
initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
 linux-user/cris/target_signal.h |  2 ++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 2c39bdf7277f..7f6aca934e10 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -97,6 +97,14 @@ static abi_ulong get_sigframe(CPUCRISState *env, int framesize)
     return sp - framesize;
 }
 
+static void setup_sigreturn(uint16_t *retcode)
+{
+    /* This is movu.w __NR_sigreturn, r9; break 13; */
+    __put_user(0x9c5f, retcode + 0);
+    __put_user(TARGET_NR_sigreturn, retcode + 1);
+    __put_user(0xe93d, retcode + 2);
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUCRISState *env)
 {
@@ -112,14 +120,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /*
      * The CRIS signal return trampoline. A real linux/CRIS kernel doesn't
      * use this trampoline anymore but it sets it up for GDB.
-     * In QEMU, using the trampoline simplifies things a bit so we use it.
-     *
-     * This is movu.w __NR_sigreturn, r9; break 13;
      */
-    __put_user(0x9c5f, frame->retcode+0);
-    __put_user(TARGET_NR_sigreturn,
-               frame->retcode + 1);
-    __put_user(0xe93d, frame->retcode + 2);
+    setup_sigreturn(frame->retcode);
 
     /* Save the mask.  */
     __put_user(set->sig[0], &frame->sc.oldmask);
@@ -135,7 +137,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[10] = sig;
     env->pc = (unsigned long) ka->_sa_handler;
     /* Link SRP so the guest returns through the trampoline.  */
-    env->pregs[PR_SRP] = frame_addr + offsetof(typeof(*frame), retcode);
+    env->pregs[PR_SRP] = default_sigreturn;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -187,3 +189,14 @@ long do_rt_sigreturn(CPUCRISState *env)
     qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    setup_sigreturn(tramp);
+
+    unlock_user(tramp, sigtramp_page, 6);
+}
diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
index 495a14289681..83a515550745 100644
--- a/linux-user/cris/target_signal.h
+++ b/linux-user/cris/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* CRIS_TARGET_SIGNAL_H */
-- 
2.31.1


