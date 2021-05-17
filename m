Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69990383CA1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:46:17 +0200 (CEST)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiFs-0001n4-9Q
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlc-0006VK-CR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlN-0004Ru-AC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:00 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mf0yy-1lFPLu42FG-00gUtY; Mon, 17
 May 2021 20:14:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 28/59] linux-user/sparc: Minor corrections to do_sigreturn
Date: Mon, 17 May 2021 20:13:53 +0200
Message-Id: <20210517181424.8093-29-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nW9XUH0vxzB0brOUi4L8KWdVEMBDxPu65thTjLXkGUC9GE4Rp8n
 AnRjAbC1+oA2+rRqDXiSLUlVUoHBO1ydUo9M+yCu+6Gty9jD85nRN1L+j8c2j0RHBcRHfz1
 2K2ksZU3+b21/waOVLLipYEKNojE8N5KGnswK99ZptR1vPW3S6KVgLr161kUwFQfqx+P1tk
 xEqv29wJHgNQy8+hEuBXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:as3RVSeXN/s=:De88Sl4q4uc+gqkq0b+8R0
 ob3zEu6NNLAU63maZv+3bwdFdR8c3inib4FrkNOA8NzVurmR3HRUO4UqEAGLao3BHP7tYGsKD
 ssYq/PnmaLjAnWME6a1g7O5VVYcduejwTKlciwnh/CM4bmP+/amDSsys7s43pXaXH6UUw4Ro+
 VietDsXIccVt7POSukUQ07HbZDcEDSMEem3Jn5zoAFbm6iOzt9sn2HARHtEM1TAn8wdHeWWtD
 T+IDNS3LJukPmcaXotwk/51ytDTwW9vA5eNxi0wuEZaxZ0P4s0kIsdjGwwvI3JZlOPzKntN7/
 PqOUfqrFh++VIkPB6V3+iBCX8xBaJTGfL0yAuHV9wfzPChkipAiNLOCg7yjagrxeAEIsFhbSc
 mM3/LPMVctTseFWmTxpnUK5Vjau7IGiswPLtmCQy8eYyuNGOTx8sfaoXL1JsY+tLD96Drnl8g
 LMUnxzRsNZ2/WcBuZVOpgPe4zarBiI+5ITPuCheF0Klvzflc0nVknUM+ooyCqtlZf5pWGAQKR
 HzDY7EaITdNkSSAKuqexIc=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Check that the input sp is 16 byte aligned, not 4.
Do that before the lock_user_struct check.

Validate the saved sp is 8 byte aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-22-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index f0f614a3af7a..0ff57af43d1e 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -254,7 +254,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
-    struct target_signal_frame *sf;
+    struct target_signal_frame *sf = NULL;
     abi_ulong pc, npc, ptr;
     target_sigset_t set;
     sigset_t host_set;
@@ -262,18 +262,21 @@ long do_sigreturn(CPUSPARCState *env)
 
     sf_addr = env->regwptr[WREG_SP];
     trace_user_do_sigreturn(env, sf_addr);
-    if (!lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
-        goto segv_and_exit;
-    }
 
     /* 1. Make sure we are not getting garbage from the user */
+    if ((sf_addr & 15) || !lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
+        goto segv_and_exit;
+    }
 
-    if (sf_addr & 3)
+    /* Make sure stack pointer is aligned.  */
+    __get_user(ptr, &sf->regs.u_regs[14]);
+    if (ptr & 7) {
         goto segv_and_exit;
+    }
 
-    __get_user(pc,  &sf->regs.pc);
+    /* Make sure instruction pointers are aligned.  */
+    __get_user(pc, &sf->regs.pc);
     __get_user(npc, &sf->regs.npc);
-
     if ((pc | npc) & 3) {
         goto segv_and_exit;
     }
@@ -309,7 +312,7 @@ long do_sigreturn(CPUSPARCState *env)
     unlock_user_struct(sf, sf_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 
-segv_and_exit:
+ segv_and_exit:
     unlock_user_struct(sf, sf_addr, 0);
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
-- 
2.31.1


