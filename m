Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792D383C8A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:41:39 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiBN-0006Fj-TY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0006Kt-LC
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:57 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlM-0004Rc-Og
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:57 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5FMB-1lJaF02vP3-011ERP; Mon, 17
 May 2021 20:14:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 25/59] linux-user/sparc: Save and restore fpu in signal frame
Date: Mon, 17 May 2021 20:13:50 +0200
Message-Id: <20210517181424.8093-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g/EyXyz+ZwLfOJoNsW7S0hI/Ie4PYZ9cfAcvqvBuyiXhvfRpsTR
 tCFTova+PJ0xCo3DoMzpr7s77lXMCzPSMhCdYukHGefXDK9Tmi8UBE7fBqSHLmPxnRIYNky
 kmZ8PreYhAoJE5tQdnBMtvf2TIclnWHUZAEpuHZGBlvuNKM+nFyx2VIj3oUu1frCT6MFeGb
 +ibUFOwP/rb7amI3Ap7Zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1WZ+rsFFXbQ=:wbfDEPwqRtWXr2JtKyHdzF
 9latrDfGgUe8Dd94HoRvOx3wYCB4DOYuvBXcJ3pORqIDeiSvr65x4jFo6BijXKCwIWMYOJ74p
 IoHREN1DduggSI/enIHhZ2fMgH1PW4+FarInm+PZ7prB2nhNPWbMk16cEbL4/8Fk0NI74RL2v
 yb8mlxJKE/Q3UrKk1IRSoAFX+uuIyphs/JyBtUkZH0mT7mMi7G4tslfkdSRwn3ddzhpagdy5O
 hYUqJVEVFr0p2yZdDmTaFPOQSPoWsoCQpww1hK28V2bH+vtSWvF+TQBnVouDogvOXOUdNhYVe
 yiOWTniIcUURxsPJSozOnVf+yR1CBsfUCpyhuIABA5jze+XJAC9oDpqXSn8WzOl5rjldsbPm/
 WoBcbWTfSsXT6haierCEols084i7uu8uRi5K7Te1/Iedn7PD7oFO65HNq9DGuDrt88BBEojK2
 QJHBtHpOA/SMtXGrhd3SGKUP4wRMFWWx/MVbHuJGsOS/nQ7K4FeXDbCptRQBc5dpUegdEWXDg
 t1zQHQRCqlLlcYUo96ok2o=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


