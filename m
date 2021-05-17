Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03D383C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:44:32 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiEB-0005AT-0K
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihla-0006ML-0Q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlM-0004S7-OE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:57 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQdMG-1m5J7H3IsI-00NiUK; Mon, 17
 May 2021 20:14:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 30/59] linux-user/sparc: Implement sparc32 rt signals
Date: Mon, 17 May 2021 20:13:55 +0200
Message-Id: <20210517181424.8093-31-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5TABmhdhA8q5nUkbiFyUgPbb6SUy7K4oVIvFRxsmoSyhoG153BJ
 4mNJntY1mu1gQW2W9hOkgZfeTXbK6IE3vt4iGGDUlmTltZ9UCI48NlwbdNREi1v+B8t97oW
 4VPfP+ThXaY+uOm6cbWB8qQWM5gTZe0qLbFvf/2NrUQkdV+klw2+PECoYgKezXuwwE3C5H5
 jC3/kY4XV/naYyFm/QyKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDU5leVRHlQ=:3+brV4vWTfdP3Qz0IcHP2O
 Us/EZ6gci8fxaUKj6StWTcExOOR1gzOA5xoECDVsKU08lPdPVcD2vZaGkTS6H3l12LLwhFFrn
 /PT4kg82ivMtcAGhIch98CjVor9xXFLyQ7Oix2R1S3+ftWKscGBpUaO5CBPud77tf2jAwDXvn
 gEGGot0C0bUfMSuP2sjN7ep5dijYjXEHchrfAdd54Y2YTUCQuQdf9Q6GHcS3FhV8kNqBsYjjy
 edtG+SCCzcp63zLbIUR4Vx1xnHAWWZEcPfaAFOTA0/7f64tptr0GW5r8C2Bi/MoHYvW2uHbgG
 +KYS1GDTkkLGTPTQE9LB1Ju/LpQK+cg1zfIEIydlWL/h2ZyE9xjHkqdhTkMm6BbKqIvhuVEqG
 LEE1u/LuS+5rBbSinxXnXhslzyQ2eWIaRb0YrJYesc1o7dVxshNF4przTlD1N8WAVMP9qyfOK
 cmH1zogFcZv/6ZKFCPvb18Zp6dawZc41M6x6aA/JdF70GYMQxR8a2dVpfRrOwzcanCgqKbX6c
 vpoON/lbaOu8GWlPRbUPTI=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-24-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 126 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 122 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 41a8b33bac3c..362993da0281 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -72,6 +72,18 @@ struct target_signal_frame {
     abi_ulong rwin_save;
 };
 
+struct target_rt_signal_frame {
+    struct target_stackf ss;
+    target_siginfo_t info;
+    struct target_pt_regs regs;
+    target_sigset_t mask;
+    abi_ulong fpu_save;
+    uint32_t insns[2];
+    target_stack_t stack;
+    abi_ulong extra_size; /* Should be 0 */
+    abi_ulong rwin_save;
+};
+
 static abi_ulong get_sigframe(struct target_sigaction *sa,
                               CPUSPARCState *env,
                               size_t framesize)
@@ -284,7 +296,59 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUSPARCState *env)
 {
-    qemu_log_mask(LOG_UNIMP, "setup_rt_frame: not implemented\n");
+    abi_ulong sf_addr;
+    struct target_rt_signal_frame *sf;
+    size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
+
+    sf_addr = get_sigframe(ka, env, sf_size);
+    trace_user_setup_rt_frame(env, sf_addr);
+
+    sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
+    if (!sf) {
+        force_sigsegv(sig);
+        return;
+    }
+
+    /* 2. Save the current process state */
+    save_reg_win(&sf->ss.win, env);
+    save_pt_regs(&sf->regs, env);
+
+    save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
+    __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
+
+    __put_user(0, &sf->rwin_save);  /* TODO: save_rwin_state */
+
+    tswap_siginfo(&sf->info, info);
+    tswap_sigset(&sf->mask, set);
+    target_save_altstack(&sf->stack, env);
+
+    __put_user(0, &sf->extra_size);
+
+    /* 3. signal handler back-trampoline and parameters */
+    env->regwptr[WREG_SP] = sf_addr;
+    env->regwptr[WREG_O0] = sig;
+    env->regwptr[WREG_O1] =
+        sf_addr + offsetof(struct target_rt_signal_frame, info);
+    env->regwptr[WREG_O2] =
+        sf_addr + offsetof(struct target_rt_signal_frame, regs);
+
+    /* 4. signal handler */
+    env->pc = ka->_sa_handler;
+    env->npc = env->pc + 4;
+
+    /* 5. return to kernel instructions */
+    if (ka->ka_restorer) {
+        env->regwptr[WREG_O7] = ka->ka_restorer;
+    } else {
+        env->regwptr[WREG_O7] =
+            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
+
+        /* mov __NR_rt_sigreturn, %g1 */
+        __put_user(0x82102065u, &sf->insns[0]);
+        /* t 0x10 */
+        __put_user(0x91d02010u, &sf->insns[1]);
+    }
+    unlock_user(sf, sf_addr, sf_size);
 }
 
 long do_sigreturn(CPUSPARCState *env)
@@ -356,9 +420,63 @@ long do_sigreturn(CPUSPARCState *env)
 
 long do_rt_sigreturn(CPUSPARCState *env)
 {
-    trace_user_do_rt_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
+    abi_ulong sf_addr, tpc, tnpc, ptr;
+    struct target_rt_signal_frame *sf = NULL;
+    sigset_t set;
+
+    sf_addr = get_sp_from_cpustate(env);
+    trace_user_do_rt_sigreturn(env, sf_addr);
+
+    /* 1. Make sure we are not getting garbage from the user */
+    if ((sf_addr & 15) || !lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
+        goto segv_and_exit;
+    }
+
+    /* Validate SP alignment.  */
+    __get_user(ptr, &sf->regs.u_regs[8 + WREG_SP]);
+    if ((ptr + TARGET_STACK_BIAS) & 7) {
+        goto segv_and_exit;
+    }
+
+    /* Validate PC and NPC alignment.  */
+    __get_user(tpc, &sf->regs.pc);
+    __get_user(tnpc, &sf->regs.npc);
+    if ((tpc | tnpc) & 3) {
+        goto segv_and_exit;
+    }
+
+    /* 2. Restore the state */
+    restore_pt_regs(&sf->regs, env);
+
+    __get_user(ptr, &sf->fpu_save);
+    if (ptr) {
+        struct target_siginfo_fpu *fpu;
+        if ((ptr & 7) || !lock_user_struct(VERIFY_READ, fpu, ptr, 1)) {
+            goto segv_and_exit;
+        }
+        restore_fpu(fpu, env);
+        unlock_user_struct(fpu, ptr, 0);
+    }
+
+    __get_user(ptr, &sf->rwin_save);
+    if (ptr) {
+        goto segv_and_exit;  /* TODO: restore_rwin_state */
+    }
+
+    target_restore_altstack(&sf->stack, env);
+    target_to_host_sigset(&set, &sf->mask);
+    set_sigmask(&set);
+
+    env->pc = tpc;
+    env->npc = tnpc;
+
+    unlock_user_struct(sf, sf_addr, 0);
+    return -TARGET_QEMU_ESIGRETURN;
+
+ segv_and_exit:
+    unlock_user_struct(sf, sf_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return -TARGET_QEMU_ESIGRETURN;
 }
 
 #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-- 
2.31.1


