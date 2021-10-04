Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0742073D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:22:53 +0200 (CEST)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJFM-0002DY-Jq
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIed-0004Qq-0x
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:56 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:51971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeX-000520-Sx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:52 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MiuGK-1n32xU10lw-00exUa; Mon, 04
 Oct 2021 09:44:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/26] linux-user/hexagon: Implement setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:03 +0200
Message-Id: <20211004074421.3141222-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LoLYmLm85yRnkWD0guv+MYG5Mcs+tcLyixwGFhU7m6rwv2S8ZMN
 0Ax2KYBH5XlCMsvEqFoGxka0AfraBjIJj212vX1QqC4NxC+bcDviT12QeO/1S4o5NT0BpUA
 /qC6LtbCDaYhFpgKnh8DkoHzx7A4jn+gr3zGGlgGZHqoeTSpgSLRk2BiiPvodJ6KchvRnzx
 am8bFvFuFZnNH3ial25Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LKZZj7ZF/a8=:3fQoV7qT7bdH0SF+Pm9AzP
 v2qAa8+dq+fSIdm4PvKna/1d65B6cQJvf2+Tcg/UaY+u7x0aiXD7XP7LXf3wrPUGqboJSFDau
 1a7sOnl9YOiWhaxz0XwYxRunyei/FVz0z3S6Rg7jdb6+n9LtAIRke8qaXsl0w6FGY+AzOAQwP
 aGT1PeOXENTWmRygf4dqZbr9J0Fev9MEW4TBP2Dct2T9rKc4Ospc4xcHrp6iPH5//3+6c/2TI
 mCbzwm4HUKPL4cJLBL1/0xXOIJKbuXQnazRGZyMuzPgdXfCoLUVGLjq++/zo2wiSdb4RCdz8K
 TJYwe1xMOURPrhRFcygcgwhPyiphY7X5zkz8B5N7ue7Bczw9gdS6M+ml8Cbt7D64FBniN87sz
 MuGEKnc1lSRPTlUjIn2vVVpcHjR3N8yjJO81bba2MeqzQFpASFvxUN2tKm764o0RpD3RUGICg
 L4rjwUMrsKJ2j/zuGXTfI3fLYGKVbm/VCur20d6t2p5RlCIg4pXt1dbcYE+csNDD59smsLjZY
 BlOiomyMEuoG767IW6fP0UdqJCCOabhBIoqpZqvzzEBt/dvWXdP4B0m8fGM9m+X3sv4Psu0J6
 wt1758RrX3N+hHZaezmERXQfli2FxSnDElyNofg5pBOP0Ea81QVK7r/ltoJFQ69q2TfgRrBQS
 W1GE6XP72+g5yKIXEh+I+/HP4DP0F2+/TVYTnTqzW7EUGxMn0uhwgeV610iyORljRLx27AOMy
 cblmdt59zekE7qDqcw2LIaXHNgEIDj6DVM/UHQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hexagon/signal.c        | 19 +++++++++++++++++--
 linux-user/hexagon/target_signal.h |  2 ++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index c7f0bf6b9283..74e61739a0ab 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -162,6 +162,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
+    /*
+     * The on-stack signal trampoline is no longer executed;
+     * however, the libgcc signal frame unwinding code checks
+     * for the presence of these two numeric magic values.
+     */
     install_sigtramp(frame->tramp);
 
     env->gpr[HEX_REG_PC] = ka->_sa_handler;
@@ -171,8 +176,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[HEX_REG_R02] =
         frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[HEX_REG_LR] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[HEX_REG_LR] = default_rt_sigreturn;
 
     return;
 
@@ -271,3 +275,14 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);
+    assert(tramp != NULL);
+
+    default_rt_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+
+    unlock_user(tramp, sigtramp_page, 4 * 2);
+}
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 345cf1cbb843..9e0223d32225 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -31,4 +31,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* TARGET_SIGNAL_H */
-- 
2.31.1


