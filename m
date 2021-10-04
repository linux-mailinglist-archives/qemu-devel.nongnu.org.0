Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84E4206D9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:55:21 +0200 (CEST)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIoi-0007tK-1f
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeO-0004Ea-Kx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:40 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeL-0004qh-9I
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M91Tq-1mTRIt0D3e-006AyM; Mon, 04
 Oct 2021 09:44:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] linux-user/openrisc: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:12 +0200
Message-Id: <20211004074421.3141222-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IV0ogjXMl7VEDcZT/Xq0tFT3pt51U8A8BqPvpAiQ6Jx9h3PS5h1
 XLWriprsXWrjso6sa7E1yuPK8KauGCY0JnkFSsWLREv763aOs/e45CN7moKn6Lb3BRNZQKG
 /qPDL87JcHSki281cpfcbHdUZFlNmvkRQ31F0NU8uqsHSuHDFfO6kPtRHMRHzKNkIl/twD0
 5PqjJrTUmc3Jny5n/ZskQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tGuIXfAHjlc=:uXwqV4rdXtHs69vVJLzQXi
 e7ZxQ+GbwqR9CwKR+i/ULnp+ADgyHvPCJEpJjlgx7zvZmb/4ZBRFSQRpWk40TNxyKbE1LeYb8
 i7yNDuD9IvQ2+rvW7wzC0Hg+Kde+MBRuQxaSxlGs3SVEa+VibwNbccBrET7S5TOKULrxl92Fb
 +rFrHFYlKnOpOcxcUohcuW/zjclhaPMj3Cv931ZIL4BzjVnMp3BssgizpJEpW7lGQJKgSttfu
 XP+91JNzsJ9vHMCKy8SVSuQrgbmBbPHLhLBc1pgi2lEmeZsUB/gjY3yN+4rDz7XWV7aBieyS1
 Rshcy6p9UPnY28HiDH2tMNV7u+e7Sbx4qKzU8EJo+xZDoc1Cb5pfOQ69rrAUdzuGw0pclSCh5
 ksJISIL6IPYJafXL6uaABCTMLz/mEhLEkW3uoVEc15DoK5f/swcXfw3F20dsO6Ft1PAB/qt14
 Y28qkGMkIcCjjmNp7YW6cB78PvRmGgYM33Vw8MVuix9uyzAAWt7fY/p3ciyU4hs/i5YEAOTq0
 Q/JXQgx7APtI73/Fqk4z/b71j1ksFGmX/NOa7JAJ/1n8aGFiFWOtvP2rxDV2l8naQNj40MiYs
 E/nauKx8TPAt5XecbyzOSWtclX4xD1nnNY5go91x2+WVuc02JE395dDk6RztMcQ4MxeoBB8LI
 huJF7JgFI8EpycgeNlRYr65D3iNAPim36PSAddpnXYd5KuCeXVNf/l2qNkTdMJ5zS51FUYLp4
 FikVE+Vq4wqt0311wxI82xlWPZbDyrSLcXHq3Q==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the rt signal trampoline.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-18-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/openrisc/signal.c        | 22 ++++++++++++++--------
 linux-user/openrisc/target_signal.h |  2 ++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index ca2532bf500f..be8b68784a20 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -38,7 +38,6 @@ typedef struct target_ucontext {
 typedef struct target_rt_sigframe {
     struct target_siginfo info;
     target_ucontext uc;
-    uint32_t retcode[4];  /* trampoline code */
 } target_rt_sigframe;
 
 static void restore_sigcontext(CPUOpenRISCState *env, target_sigcontext *sc)
@@ -116,14 +115,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
-    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, frame->retcode + 0);
-    __put_user(0x20000001, frame->retcode + 1);
-    __put_user(0x15000000, frame->retcode + 2);
-    __put_user(0x15000000, frame->retcode + 3);
-
     /* Set up registers for signal handler */
-    cpu_set_gpr(env, 9, frame_addr + offsetof(target_rt_sigframe, retcode));
+    cpu_set_gpr(env, 9, default_rt_sigreturn);
     cpu_set_gpr(env, 3, sig);
     cpu_set_gpr(env, 4, frame_addr + offsetof(target_rt_sigframe, info));
     cpu_set_gpr(env, 5, frame_addr + offsetof(target_rt_sigframe, uc));
@@ -169,3 +162,16 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1 */
+    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, tramp + 0);
+    __put_user(0x20000001, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
index 8283eaf54419..077ec3d5e8d7 100644
--- a/linux-user/openrisc/target_signal.h
+++ b/linux-user/openrisc/target_signal.h
@@ -26,4 +26,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* OPENRISC_TARGET_SIGNAL_H */
-- 
2.31.1


