Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA338718C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:00:25 +0200 (CEST)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lismG-0002e8-8M
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKd-0007N3-GL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:51 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKZ-00073t-ME
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:51 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MRC3Y-1m5tMj2TrQ-00N9jU; Tue, 18
 May 2021 07:31:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 25/59] linux-user/sparc: Save and restore fpu in signal frame
Date: Tue, 18 May 2021 07:30:57 +0200
Message-Id: <20210518053131.87212-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MrodjR0SfSHrd8asxsNpQjYphJC2m2oB8vNj/1K4zZo0gADjW7K
 nUc8WXBADfK3njGUC7adRCS4sHs8NlKKQTJWEudMwp3zPLx5fnya97f2e0T/Z3bqM70CxCf
 fkp+twXMKz9TVuPxKLRLDInpXElwC11lM25QvcL5RJehR0H34ew7EGmu96NpW82RSuZf3Tp
 8v8oQQ05dcmpmT0iD9cAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/RZ1JrAKCAQ=:i13FlK6h8m5XVQlSg+vm9m
 honIXXTU1bBm4PPW9qK0H284z/kNhley3aIEBKNKT1+n7TiLyEbJkWVZWME0i9/dDghvs92DA
 s39hRZ5xHHZZQ51j63SlhfqpASxbQWWjYHxOxv5ezqWb3ohHYCZS7yLj1IaHZal7lEnJN5ID6
 6a1iITV44CdjIHXyDBeZC5pel2Fm3otSQvkobQOMe7anWeESJHMzME4FPuevDKJPGGGDlgiY9
 uWUaw+hfiX42VdOyJ6B6nna+y0LnQaWFJEe1c9ZRr8ARVXGu1B7saRJS7Pw8UNfWqDeWgWsO2
 qwt/cKfPm+dwQfhnuIofbfMxiroMZvXkr/OKyCPPZpe6Tpz6APglLVteV1rbqDegqaU91GX8z
 2yVzw5Rb4W9Ce3EE0MGLWUHkk6cycYijvUd8sRJDfdcKME7uJXLuVgLhddtebhYjkpNTpD2Lh
 En2buklbDjZZ/mp/3jlt3ptCm3iuJ2k4bsxsi74K0yD5RB5X1cUyNR3kIOMPTGc0qX9VIWxtj
 l+6ZlHv0U2cCX0nk6ohWY0=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Message-Id: <20210426025334.1168495-19-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 84 ++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 57dbc72c9949..59bb4495121e 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -43,26 +43,25 @@ struct target_stackf {
     abi_ulong xargs[8];
 };
 
-typedef struct {
-    abi_ulong  si_float_regs[32];
-    unsigned   long si_fsr;
-    unsigned   long si_fpqdepth;
+struct target_siginfo_fpu {
+    /* It is more convenient for qemu to move doubles, not singles. */
+    uint64_t si_double_regs[16];
+    uint32_t si_fsr;
+    uint32_t si_fpqdepth;
     struct {
-        unsigned long *insn_addr;
-        unsigned long insn;
+        uint32_t insn_addr;
+        uint32_t insn;
     } si_fpqueue [16];
-} qemu_siginfo_fpu_t;
-
+};
 
 struct target_signal_frame {
     struct target_stackf ss;
     struct target_pt_regs regs;
-    uint32_t            si_mask;
-    abi_ulong           fpu_save;
-    uint32_t            insns[2] QEMU_ALIGNED(8);
-    abi_ulong           extramask[TARGET_NSIG_WORDS - 1];
-    abi_ulong           extra_size; /* Should be 0 */
-    qemu_siginfo_fpu_t fpu_state;
+    uint32_t si_mask;
+    abi_ulong fpu_save;
+    uint32_t insns[2] QEMU_ALIGNED(8);
+    abi_ulong extramask[TARGET_NSIG_WORDS - 1];
+    abi_ulong extra_size; /* Should be 0 */
 };
 
 static abi_ulong get_sigframe(struct target_sigaction *sa,
@@ -163,33 +162,51 @@ static void save_reg_win(struct target_reg_window *win, CPUSPARCState *env)
     }
 }
 
-#define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
+static void save_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 16; ++i) {
+        __put_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __put_user(env->fsr, &fpu->si_fsr);
+    __put_user(0, &fpu->si_fpqdepth);
+}
+
+static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 16; ++i) {
+        __get_user(env->fpr[i].ll, &fpu->si_double_regs[i]);
+    }
+    __get_user(env->fsr, &fpu->si_fsr);
+}
 
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    int sigframe_size, i;
+    size_t sf_size = sizeof(*sf) + sizeof(struct target_siginfo_fpu);
+    int i;
 
     /* 1. Make sure everything is clean */
-    //synchronize_user_stack();
 
-    sigframe_size = NF_ALIGNEDSZ;
-    sf_addr = get_sigframe(ka, env, sigframe_size);
+    sf_addr = get_sigframe(ka, env, sf_size);
     trace_user_setup_frame(env, sf_addr);
 
-    sf = lock_user(VERIFY_WRITE, sf_addr,
-                   sizeof(struct target_signal_frame), 0);
+    sf = lock_user(VERIFY_WRITE, sf_addr, sf_size, 0);
     if (!sf) {
         goto sigsegv;
     }
+
     /* 2. Save the current process state */
     save_pt_regs(&sf->regs, env);
     __put_user(0, &sf->extra_size);
 
-    //save_fpu_state(regs, &sf->fpu_state);
-    //__put_user(&sf->fpu_state, &sf->fpu_save);
+    save_fpu((struct target_siginfo_fpu *)(sf + 1), env);
+    __put_user(sf_addr + sizeof(*sf), &sf->fpu_save);
 
     __put_user(set->sig[0], &sf->si_mask);
     for (i = 0; i < TARGET_NSIG_WORDS - 1; i++) {
@@ -226,7 +243,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         val32 = 0x91d02010;
         __put_user(val32, &sf->insns[1]);
     }
-    unlock_user(sf, sf_addr, sizeof(struct target_signal_frame));
+    unlock_user(sf, sf_addr, sf_size);
     return;
 #if 0
 sigill_and_return:
@@ -248,7 +265,7 @@ long do_sigreturn(CPUSPARCState *env)
 {
     abi_ulong sf_addr;
     struct target_signal_frame *sf;
-    abi_ulong pc, npc;
+    abi_ulong pc, npc, ptr;
     target_sigset_t set;
     sigset_t host_set;
     int i;
@@ -276,14 +293,15 @@ long do_sigreturn(CPUSPARCState *env)
     env->pc = pc;
     env->npc = npc;
 
-    /* FIXME: implement FPU save/restore:
-     * __get_user(fpu_save, &sf->fpu_save);
-     * if (fpu_save) {
-     *     if (restore_fpu_state(env, fpu_save)) {
-     *         goto segv_and_exit;
-     *     }
-     * }
-     */
+    __get_user(ptr, &sf->fpu_save);
+    if (ptr) {
+        struct target_siginfo_fpu *fpu;
+        if ((ptr & 3) || !lock_user_struct(VERIFY_READ, fpu, ptr, 1)) {
+            goto segv_and_exit;
+        }
+        restore_fpu(fpu, env);
+        unlock_user_struct(fpu, ptr, 0);
+    }
 
     __get_user(set.sig[0], &sf->si_mask);
     for (i = 1; i < TARGET_NSIG_WORDS; i++) {
-- 
2.31.1


