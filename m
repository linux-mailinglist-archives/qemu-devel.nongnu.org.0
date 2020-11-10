Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26EC2AD15C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:34:30 +0100 (CET)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcP6j-00048q-Gv
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP3A-0000mC-FW
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcP33-00072Q-6s
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:30:48 -0500
Received: from localhost.localdomain ([82.252.154.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mbj3Y-1k1g3631F0-00dFdc; Tue, 10 Nov 2020 09:30:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] linux-user/sparc: Correct set/get_context handling of fp
 and i7
Date: Tue, 10 Nov 2020 09:30:33 +0100
Message-Id: <20201110083034.224832-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110083034.224832-1-laurent@vivier.eu>
References: <20201110083034.224832-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JT4T9Y9GyDE9lgicWo6FjtB3XP+nELWswQm92onsqMjWca3RAyt
 axD+2A7oIi37Q7ElkM7xlmSm8ngkFrp7cRT0WmyjJneGKEde9NyETMt17owTBBvWrx52+2Z
 fl3D3/qnz3FV3cUy+8iA58I2K6W1bgq5Y2lviqAIoeV59FpAc9Wjz3OrCe261u2fhe5oiGz
 RjQdom2r3E4LIfN5v7jAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CMJsjlvygo4=:fElf4UZpvrzDFFaEzvU/ls
 2+IlAXp4QiPbIJJg+kjRoKC5DHkmaFRNyj5rNrGLpsZhdOxtr1gvB9grC9Hk3+BtkOvDKUAMs
 l8unWyYRjBOyDJb8p0jC3ZZ7s6KAiDrTH35ucF2nv5uxnnsW8JVRfp9tDziOQnK+og4d8bSan
 gWfMbmYjhJv60V2qf/dDulmX/cRd995NId1c/o1O7c9YS3IXvvfBNbljbtt7CghrlLGV5Oo+Z
 lSad6G7fwytLiUWW2LTvxkKfNdletuLfS+yYV3gJLmDQf/JSykL2ey59zN4sZDARuKSXEM8b0
 FDGCK0hYBudeaKWFexSGAIdGPanvJBCtyaKYEBXdoLR4WjWdIjL4aPkZutpgs+VGOcGI7nlM4
 f6QxDwD4jUI2x5ScGpusw1b8oOraGPTkDUtDyIH6Hhw7hwDOdB9LA/aD4a80CbSLIx5Hc60TQ
 gEgu7gLkdw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 03:30:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Because QEMU's user-mode emulation just directly accesses guest CPU
state, for SPARC the guest register window state is not the same in
the sparc64_get_context() and sparc64_set_context() functions as it
is for the real kernel's versions of those functions.  Specifically,
for the kernel it has saved the user space state such that the O*
registers go into a pt_regs struct as UREG_I*, and the I* registers
have been spilled onto the userspace stack.  For QEMU, we haven't
done that, so the guest's O* registers are still in WREG_O* and the
I* registers in WREG_I*.

The code was already accessing the O* registers correctly for QEMU,
but had copied the kernel code for accessing the I* registers off the
userspace stack.  Replace this with direct accesses to fp and i7 in
the CPU state, and add a comment explaining why we differ from the
kernel code here.

This fix is sufficient to get bash to a shell prompt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201105212314.9628-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 47 ++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 57ea1593bfc9..c315704b3895 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -403,7 +403,6 @@ void sparc64_set_context(CPUSPARCState *env)
     struct target_ucontext *ucp;
     target_mc_gregset_t *grp;
     abi_ulong pc, npc, tstate;
-    abi_ulong fp, i7, w_addr;
     unsigned int i;
 
     ucp_addr = env->regwptr[WREG_O0];
@@ -447,6 +446,15 @@ void sparc64_set_context(CPUSPARCState *env)
     __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
     __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
     __get_user(env->gregs[7], (&(*grp)[SPARC_MC_G7]));
+
+    /*
+     * Note that unlike the kernel, we didn't need to mess with the
+     * guest register window state to save it into a pt_regs to run
+     * the kernel. So for us the guest's O regs are still in WREG_O*
+     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
+     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
+     * need to be written back to userspace memory.
+     */
     __get_user(env->regwptr[WREG_O0], (&(*grp)[SPARC_MC_O0]));
     __get_user(env->regwptr[WREG_O1], (&(*grp)[SPARC_MC_O1]));
     __get_user(env->regwptr[WREG_O2], (&(*grp)[SPARC_MC_O2]));
@@ -456,18 +464,9 @@ void sparc64_set_context(CPUSPARCState *env)
     __get_user(env->regwptr[WREG_O6], (&(*grp)[SPARC_MC_O6]));
     __get_user(env->regwptr[WREG_O7], (&(*grp)[SPARC_MC_O7]));
 
-    __get_user(fp, &(ucp->tuc_mcontext.mc_fp));
-    __get_user(i7, &(ucp->tuc_mcontext.mc_i7));
+    __get_user(env->regwptr[WREG_FP], &(ucp->tuc_mcontext.mc_fp));
+    __get_user(env->regwptr[WREG_I7], &(ucp->tuc_mcontext.mc_i7));
 
-    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_O6];
-    if (put_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
-                 abi_ulong) != 0) {
-        goto do_sigsegv;
-    }
-    if (put_user(i7, w_addr + offsetof(struct target_reg_window, ins[7]),
-                 abi_ulong) != 0) {
-        goto do_sigsegv;
-    }
     /* FIXME this does not match how the kernel handles the FPU in
      * its sparc64_set_context implementation. In particular the FPU
      * is only restored if fenab is non-zero in:
@@ -501,7 +500,6 @@ void sparc64_get_context(CPUSPARCState *env)
     struct target_ucontext *ucp;
     target_mc_gregset_t *grp;
     target_mcontext_t *mcp;
-    abi_ulong fp, i7, w_addr;
     int err;
     unsigned int i;
     target_sigset_t target_set;
@@ -553,6 +551,15 @@ void sparc64_get_context(CPUSPARCState *env)
     __put_user(env->gregs[5], &((*grp)[SPARC_MC_G5]));
     __put_user(env->gregs[6], &((*grp)[SPARC_MC_G6]));
     __put_user(env->gregs[7], &((*grp)[SPARC_MC_G7]));
+
+    /*
+     * Note that unlike the kernel, we didn't need to mess with the
+     * guest register window state to save it into a pt_regs to run
+     * the kernel. So for us the guest's O regs are still in WREG_O*
+     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
+     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
+     * need to be fished out of userspace memory.
+     */
     __put_user(env->regwptr[WREG_O0], &((*grp)[SPARC_MC_O0]));
     __put_user(env->regwptr[WREG_O1], &((*grp)[SPARC_MC_O1]));
     __put_user(env->regwptr[WREG_O2], &((*grp)[SPARC_MC_O2]));
@@ -562,18 +569,8 @@ void sparc64_get_context(CPUSPARCState *env)
     __put_user(env->regwptr[WREG_O6], &((*grp)[SPARC_MC_O6]));
     __put_user(env->regwptr[WREG_O7], &((*grp)[SPARC_MC_O7]));
 
-    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_O6];
-    fp = i7 = 0;
-    if (get_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
-                 abi_ulong) != 0) {
-        goto do_sigsegv;
-    }
-    if (get_user(i7, w_addr + offsetof(struct target_reg_window, ins[7]),
-                 abi_ulong) != 0) {
-        goto do_sigsegv;
-    }
-    __put_user(fp, &(mcp->mc_fp));
-    __put_user(i7, &(mcp->mc_i7));
+    __put_user(env->regwptr[WREG_FP], &(mcp->mc_fp));
+    __put_user(env->regwptr[WREG_I7], &(mcp->mc_i7));
 
     {
         uint32_t *dst = ucp->tuc_mcontext.mc_fpregs.mcfpu_fregs.sregs;
-- 
2.28.0


