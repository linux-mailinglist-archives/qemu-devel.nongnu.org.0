Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1004387184
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:58:12 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisk7-0005Q9-MO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKc-0007LV-GZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:50 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:35221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKY-00073T-OW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:50 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MeCd5-1lA60l1Dkt-00bMtX; Tue, 18
 May 2021 07:31:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/59] linux-user/sparc: Use target_pt_regs
Date: Tue, 18 May 2021 07:30:54 +0200
Message-Id: <20210518053131.87212-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PevIUhbPkgzvvmYLXnc/vzCw9lJf9UwmnBDWP3i6zs8mnjkih2m
 zUShhb+ebWxgTo4drZvpWb229YoTrsSqW61MFRwDPM+h5fubSzODyDHjwRjqqKsoDtlELiv
 YLRTwDq5dThm3yN00DZyU7jL2oUUNIjzlhYlV3V2yqUsapql91g4IsQ/ClGh7KSA2ZWOKzi
 mCZjU82rmBQlKiOhs0sQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rqJ7Ay0WD9A=:Wp6y/wVvRDXEkw3JO7+ozz
 0ZVwGAf7SGjAnel98iVlLKn9IgPTHUX7w20fBFUXupKkWSu5wBerC5WoHgXH15LkYxHWIhf4l
 YGNgTGRucAuybus39I/N9ji6wufFch8YjVcr/42U7O7ciRHxuVwOIUdKqxFjDtwvzRE332ETi
 Ew1fAEUptytsNiMibNVSr4ztlUVW2HheoR9q6385HxxC5ZLy8qqjeGt6Vhk8dQ3MKqZCudtCW
 sfmgFQ8CJTsDl4O+Le+9meqavQdDDyYygBmZBpY+vKDP//H/ZsTnYdoXoGU5XIHFrV3wN4bRq
 wacGVMzxdgb/cARJoZ8e79rxvO7KOBRZcwOjOkTmGUp7YB0IJSrnQsBq0V3JfQ+bwl/vtcDf8
 hkqjMbYoXZvnot1G4JYvR5WfeKnb1lBwxsYiUboxIyNFFkwJO5j3ZD9/qPMuHLtMTOKx3qpPL
 4jJzL1KfmCeN5/S45Wi9tOQUhmrjJYputJgDVVmGxQMGekQcHZL/OpZ9iWwz29ceE0CcGDHya
 41UTX/pjhzta+QE6gjZm6E=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Replace __siginfo_t with target_pt_regs, and move si_mask
into target_signal_frame directly.

Extract save/restore functions for target_pt_regs.  Adjust
for sparc64 tstate.  Use proper get/put functions for psr.
Turns out we were already writing to si_mask twice, so no
need to handle that in the new functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 123 ++++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3474098641a6..0d9305818f8c 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -43,17 +43,6 @@ struct target_stackf {
     abi_ulong xargs[8];
 };
 
-typedef struct {
-    struct {
-        abi_ulong psr;
-        abi_ulong pc;
-        abi_ulong npc;
-        abi_ulong y;
-        abi_ulong u_regs[16]; /* globals and ins */
-    }               si_regs;
-    int             si_mask;
-} __siginfo_t;
-
 typedef struct {
     abi_ulong  si_float_regs[32];
     unsigned   long si_fsr;
@@ -67,7 +56,8 @@ typedef struct {
 
 struct target_signal_frame {
     struct target_stackf ss;
-    __siginfo_t         info;
+    struct target_pt_regs regs;
+    uint32_t            si_mask;
     abi_ulong           fpu_save;
     uint32_t            insns[2] QEMU_ALIGNED(8);
     abi_ulong           extramask[TARGET_NSIG_WORDS - 1];
@@ -103,23 +93,61 @@ static inline abi_ulong get_sigframe(struct target_sigaction *sa,
     return sp;
 }
 
-static int
-setup___siginfo(__siginfo_t *si, CPUSPARCState *env, abi_ulong mask)
+static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
 {
-    int err = 0, i;
-
-    __put_user(env->psr, &si->si_regs.psr);
-    __put_user(env->pc, &si->si_regs.pc);
-    __put_user(env->npc, &si->si_regs.npc);
-    __put_user(env->y, &si->si_regs.y);
-    for (i=0; i < 8; i++) {
-        __put_user(env->gregs[i], &si->si_regs.u_regs[i]);
+    int i;
+
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    __put_user(sparc64_tstate(env), &regs->tstate);
+    /* TODO: magic should contain PT_REG_MAGIC + %tt. */
+    __put_user(0, &regs->magic);
+#else
+    __put_user(cpu_get_psr(env), &regs->psr);
+#endif
+
+    __put_user(env->pc, &regs->pc);
+    __put_user(env->npc, &regs->npc);
+    __put_user(env->y, &regs->y);
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->gregs[i], &regs->u_regs[i]);
     }
-    for (i=0; i < 8; i++) {
-        __put_user(env->regwptr[WREG_O0 + i], &si->si_regs.u_regs[i + 8]);
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+    }
+}
+
+static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+{
+    int i;
+
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+    /* User can only change condition codes and %asi in %tstate. */
+    uint64_t tstate;
+    __get_user(tstate, &regs->tstate);
+    cpu_put_ccr(env, tstate >> 32);
+    env->asi = extract64(tstate, 24, 8);
+#else
+    /*
+     * User can only change condition codes and FPU enabling in %psr.
+     * But don't bother with FPU enabling, since a real kernel would
+     * just re-enable the FPU upon the next fpu trap.
+     */
+    uint32_t psr;
+    __get_user(psr, &regs->psr);
+    env->psr = (psr & PSR_ICC) | (env->psr & ~PSR_ICC);
+#endif
+
+    /* Note that pc and npc are handled in the caller. */
+
+    __get_user(env->y, &regs->y);
+
+    for (i = 0; i < 8; i++) {
+        __get_user(env->gregs[i], &regs->u_regs[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __get_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
     }
-    __put_user(mask, &si->si_mask);
-    return err;
 }
 
 #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
@@ -129,7 +157,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    int sigframe_size, err, i;
+    int sigframe_size, i;
 
     /* 1. Make sure everything is clean */
     //synchronize_user_stack();
@@ -143,18 +171,14 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (!sf) {
         goto sigsegv;
     }
-#if 0
-    if (invalid_frame_pointer(sf, sigframe_size))
-        goto sigill_and_return;
-#endif
     /* 2. Save the current process state */
-    err = setup___siginfo(&sf->info, env, set->sig[0]);
+    save_pt_regs(&sf->regs, env);
     __put_user(0, &sf->extra_size);
 
     //save_fpu_state(regs, &sf->fpu_state);
     //__put_user(&sf->fpu_state, &sf->fpu_save);
 
-    __put_user(set->sig[0], &sf->info.si_mask);
+    __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
         __put_user(set->sig[i + 1], &sf->extramask[i]);
     }
@@ -165,16 +189,14 @@ void setup_frame(int sig, struct target_sigaction *ka,
     for (i = 0; i < 8; i++) {
         __put_user(env->regwptr[i + WREG_I0], &sf->ss.win.ins[i]);
     }
-    if (err)
-        goto sigsegv;
 
     /* 3. signal handler back-trampoline and parameters */
     env->regwptr[WREG_SP] = sf_addr;
     env->regwptr[WREG_O0] = sig;
     env->regwptr[WREG_O1] = sf_addr +
-            offsetof(struct target_signal_frame, info);
+            offsetof(struct target_signal_frame, regs);
     env->regwptr[WREG_O2] = sf_addr +
-            offsetof(struct target_signal_frame, info);
+            offsetof(struct target_signal_frame, regs);
 
     /* 4. signal handler */
     env->pc = ka->_sa_handler;
@@ -218,7 +240,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    abi_ulong up_psr, pc, npc;
+    abi_ulong pc, npc;
     target_sigset_t set;
     sigset_t host_set;
     int i;
@@ -234,29 +256,17 @@ long do_sigreturn(CPUSPARCState *env)
     if (sf_addr & 3)
         goto segv_and_exit;
 
-    __get_user(pc,  &sf->info.si_regs.pc);
-    __get_user(npc, &sf->info.si_regs.npc);
+    __get_user(pc,  &sf->regs.pc);
+    __get_user(npc, &sf->regs.npc);
 
     if ((pc | npc) & 3) {
         goto segv_and_exit;
     }
 
     /* 2. Restore the state */
-    __get_user(up_psr, &sf->info.si_regs.psr);
-
-    /* User can only change condition codes and FPU enabling in %psr. */
-    env->psr = (up_psr & (PSR_ICC /* | PSR_EF */))
-            | (env->psr & ~(PSR_ICC /* | PSR_EF */));
-
+    restore_pt_regs(&sf->regs, env);
     env->pc = pc;
     env->npc = npc;
-    __get_user(env->y, &sf->info.si_regs.y);
-    for (i=0; i < 8; i++) {
-        __get_user(env->gregs[i], &sf->info.si_regs.u_regs[i]);
-    }
-    for (i=0; i < 8; i++) {
-        __get_user(env->regwptr[i + WREG_O0], &sf->info.si_regs.u_regs[i + 8]);
-    }
 
     /* FIXME: implement FPU save/restore:
      * __get_user(fpu_save, &sf->fpu_save);
@@ -267,11 +277,8 @@ long do_sigreturn(CPUSPARCState *env)
      * }
      */
 
-    /* This is pretty much atomic, no amount locking would prevent
-         * the races which exist anyways.
-         */
-    __get_user(set.sig[0], &sf->info.si_mask);
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
+    __get_user(set.sig[0], &sf->si_mask);
+    for (i = 1; i < TARGET_NSIG_WORDS; i++) {
         __get_user(set.sig[i], &sf->extramask[i - 1]);
     }
 
-- 
2.31.1


