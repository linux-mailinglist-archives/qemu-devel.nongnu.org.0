Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A6387163
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:44:00 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisWN-0007Mo-M4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007Yo-Qw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:01 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKb-00074f-3d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:01 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGzI3-1ldfXt2ohH-00E6tT; Tue, 18
 May 2021 07:31:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 27/59] linux-user/sparc: Clean up setup_frame
Date: Tue, 18 May 2021 07:30:59 +0200
Message-Id: <20210518053131.87212-28-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O6o4lxWFP6lgjUZn8R2ul7q8ED1LuM6zEnjgHOMBjRMIiINHwWz
 s+idrNuDzMsCUdM8zL8+eNdITooqw4kMkPpWlVgz8WTHDBPUbljdEmy6sigbO68hxPyGq6t
 vAYznLtEQNYk6VNi/AZWSQnvHzDAszi4OAe65W4f8xvOxsdbmgcmuqo6oF6rJSrAg/TgLlW
 +ACp8dutIpvmWTzFx9IkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oWf+8smovsw=:DIqaO+yPpfPgLa2M9vghta
 GvYaIcl06pA8upASCWVEbelguXBW7D+xPGdKDfzBuaFBno/kFYIo54xRctj47ln0iGvdQFgky
 BSt0CISVraT6iAVjFOsqPvuu0Z8wvLydqwJ6fFLtY06hh6PRRsBbQmUPs04ITZZjxHuB9pYfE
 uOZi+a94k5shf9iDq9g2pDDj6lcVlCg44xDtmm7Tljs0AhMNKsJFFNDRO0/NIPpMf2x58CkPG
 PD+TXgHahFb0k4osrunhk5MdEbg/Gc3ybHFPRbg0w7Bb0Irl80pvtuGsvIeO9eXUFWZV+YpPd
 NZcaxpaEid2YX7u1CURFxsrP7VtT/Gij0r/w1yxvVS7H+ONGQMlmIrsHG2aKziSkRHUTYQSSS
 jg4NL9iY8hy/hjqrltrv+zb2gWgu7yP3EU0qnavIkG6JKUx5oHBksPWe78fQTw/z9TKskDSiu
 EM0cY4CVAnbzF2R3tlBi31INotEF4L0tUvnc4onglADpjNrGrgnQqXbJFHQBTa9oY/oFIIudO
 3q4dTqFsVW/uipvhTncW+g=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Clean up a goto label with a single use.  Remove #if 0.
Remove useless parentheses.  Fold constants into __put_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-21-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 4a0578ebf37b..f0f614a3af7a 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -192,14 +192,13 @@ void setup_frame(int sig, struct target_sigaction *ka,
     size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
     int i;
 
-    /* 1. Make sure everything is clean */
-
     sf_addr = get_sigframe(ka, env, sf_size);
     trace_user_setup_frame(env, sf_addr);
 
     sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
     if (!sf) {
-        goto sigsegv;
+        force_sigsegv(sig);
+        return;
     }
 
     /* 2. Save the current process state */
@@ -228,33 +227,21 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
-    env->npc = (env->pc + 4);
+    env->npc = env->pc + 4;
+
     /* 5. return to kernel instructions */
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        uint32_t val32;
-
         env->regwptr[WREG_O7] = sf_addr +
                 offsetof(struct target_signal_frame, insns) - 2 * 4;
 
         /* mov __NR_sigreturn, %g1 */
-        val32 = 0x821020d8;
-        __put_user(val32, &sf->insns[0]);
-
+        __put_user(0x821020d8u, &sf->insns[0]);
         /* t 0x10 */
-        val32 = 0x91d02010;
-        __put_user(val32, &sf->insns[1]);
+        __put_user(0x91d02010u, &sf->insns[1]);
     }
     unlock_user(sf, sf_addr, sf_size);
-    return;
-#if 0
-sigill_and_return:
-    force_sig(TARGET_SIGILL);
-#endif
-sigsegv:
-    unlock_user(sf, sf_addr, sizeof(struct target_signal_frame));
-    force_sigsegv(sig);
 }
 
 void setup_rt_frame(int sig, struct target_sigaction *ka,
-- 
2.31.1


