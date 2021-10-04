Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75FA42070D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:11:29 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ4J-0003jE-EU
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeT-0004LG-Ox
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:45 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:47725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeQ-0004wU-Rl
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:45 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MNc1T-1m8tDM3WGJ-00P9aT; Mon, 04
 Oct 2021 09:44:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] linux-user/riscv: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:15 +0200
Message-Id: <20211004074421.3141222-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AAF27IW3lRIldQ+uE/IG01kCk2OyRCNFh3Xk17b48cO69mqRLTO
 Eh6RTxhIbvn1ABVjs7W/AoHN8TqQm2mhFEUMKmaS+56iNHGqHJbT1RLaBw5kmaYt1zaWLi7
 ZlMLkHJce3c2SYh4HNJz48wh1/Xo38VWLpRM64tAsp5u1IV8nodHyvkOxxJo20PqXLY1zdO
 AwZzFJPwN+Papmv47pUPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wjxzRMMCZkw=:PHlWAiIXd+SUXl7/b/bzca
 6anktjQ1IQoqRT/sTDZhl9jDiXtSkckfSIazjAPxx1vqbmt1/CH33GwubMb5+kjDsKKxKgipj
 liRmOqwpfJu3XNwSDq37jxy/3frxDtpdBIqdZf9Qf7k1oQ4xpt8VkVyEgSyw9M61/+LjeBQv3
 ssEjVaVtvvG0vJIrrtLnTwtB+kLV81X9nBSW5O1uXglH8/rOcKRYZE9qKPPZglEAQRR7XWf9N
 zDHWXhTJ3YUQiGfVWVFaB1cEsXtB5eNjg5dXwRooZaX8xQxXsBNLCNPg3Z6cHFo5JcVsKG0lO
 310qysyanZfnbk+QVzkmeTe4WJSMHuFgX217r0RHwnq0VhsSzWdGy4Zxl1X6/tZa+//MJ2IQs
 8DcrKxv50Z3Ng3nkHLfi1ez5GmmoGkd1QTK6OVFkBS7yexXhtwJ7HQyDcItQUiMHoKvQWwhSU
 noqkbVKUS0f/xrKSOYoNQWzmwFbIPYv0lw2cZKAHH4dNe2ryI0OuQNAdIpcYVSSOr3qSwvNr1
 gMFZ3GRtW65iI8QrSwJURltGFMkRH1gsbU1G1zX3vlxQ/IlPC7mIP5RJ6s6z8sW+YXvcp69e4
 P7I34h2UskGn7p08WgrH5OIBI+X9rO39F5Y6qZMibNPIDx560ky/GKHf4G2B26ozwtFkMWuHP
 qhSmF1ULuzrnEjoh3r+Uo/YrmZIHBZLJiM7XBu060LwmEi30lWHPTTro6xfYwCzX2qgxCIiZV
 nF2OT0HO1935+hB+sw8whzkUjJAxUQdnsMvUsA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Create and record the rt signal trampoline.

This fixes a bug wrt libgcc fallback unwinding.  It expects
the stack pointer to point to the siginfo_t, whereas we had
inexplicably placed our private signal trampoline at the start
of the signal frame instead of the end.  Now moot because we
have removed it from the stack frame entirely.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-21-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/riscv/signal.c        | 22 +++++++++++++---------
 linux-user/riscv/target_signal.h |  2 ++
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index f7f33bc90aed..a0f9542ce39a 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -47,7 +47,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -105,12 +104,6 @@ static void setup_ucontext(struct target_ucontext *uc,
     setup_sigcontext(&uc->uc_mcontext, env);
 }
 
-static inline void install_sigtramp(uint32_t *tramp)
-{
-    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
-    __put_user(0x00000073, tramp + 1);  /* ecall */
-}
-
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPURISCVState *env)
@@ -127,14 +120,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
-    install_sigtramp(frame->tramp);
 
     env->pc = ka->_sa_handler;
     env->gpr[xSP] = frame_addr;
     env->gpr[xA0] = sig;
     env->gpr[xA1] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[xA2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[xRA] = frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[xRA] = default_rt_sigreturn;
 
     return;
 
@@ -203,3 +195,15 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
+    __put_user(0x00000073, tramp + 1);  /* ecall */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
index f113ba9a55f6..3e36fddc9dbb 100644
--- a/linux-user/riscv/target_signal.h
+++ b/linux-user/riscv/target_signal.h
@@ -15,4 +15,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* RISCV_TARGET_SIGNAL_H */
-- 
2.31.1


