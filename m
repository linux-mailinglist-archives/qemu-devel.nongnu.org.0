Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE5383CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:48:48 +0200 (CEST)
Received: from localhost ([::1]:57756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiIJ-0008AU-Pt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlv-0006pf-Ih
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:25 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004Z8-9n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:17 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MKuGD-1m3xfr3gVx-00LFk4; Mon, 17
 May 2021 20:14:51 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 47/59] linux-user/s390x: Handle vector regs in signal stack
Date: Mon, 17 May 2021 20:14:12 +0200
Message-Id: <20210517181424.8093-48-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MUS6mjG1fkeJ1B7i+zi/qDDTcaAzyPH9ip3FGkEwXscKtML9w8D
 dHOauG5IFbShcJJ9VdsGffaGNNC0CxgoxhSzxL+kkDg65vp3LPw3Rw321jhC7sKT5wpeQFx
 4X6ll7lHEjg7Xiqg74Djuax350JNhn1zIfby0rjtNqEY+h51Qh3W+YQmQvkPMzPfl7iK5GM
 PfqhUZW3IWOPbXjuXo+SA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q+xnQ76W4Uw=:XpaHgyw/il62zUYTkhKhMj
 f9StGwAD+3F3kUW7SaAlMWZ/uZwymNMKwyD5AETkrG9rm1R2hPt9XFa2o3xmDl+NFKRrMm3qw
 uF3gEjuVB3COQbARpBNnZJVjI3wWX2IwWjB7db7Q63ewpKseJdFIwqOkF3fMotMkims/UZVr+
 ap8rL56+0iQxjwRlfBQZXGylGwaEh+Jl4FQlldWHGwFStRzf61YQy5Wttfbpa+5p5j+Vt7+8Q
 OQ4LqAotnsaVZa5wEBnXWvYhvAKGEyaX2453y5lU+2BCo/m4n7IBXaAGH5PTs3gx4V1qT57vM
 8pXBvJJTTa9sG/M1jxH7CWGSGe0K1BeWaYu9GI+f3V28acjcST2k//1OZhLde6dO/yKqXRDEJ
 0Dvwri/oOrDSPKcy9UcUR1jnayoxCGbisDE+yzi3p8Vv2k56KCt5d5aVDEc1Ol89zclTHQZWT
 T7741G1xtW/J938AldvYocJWdV+SlWwhW3RVBuSiAv3JXhDiwwbFfqfSGFsseHXvUa+y3ALNA
 PDQKq66YjCBYJBtDZ99X7o=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 62 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 9d470e4ca069..b537646e60b3 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -50,6 +50,12 @@ typedef struct {
     target_s390_fp_regs     fpregs;
 } target_sigregs;
 
+typedef struct {
+    uint64_t vxrs_low[16];
+    uint64_t vxrs_high[16][2];
+    uint8_t reserved[128];
+} target_sigregs_ext;
+
 typedef struct {
     abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
     abi_ulong sregs;
@@ -60,15 +66,20 @@ typedef struct {
     target_sigcontext sc;
     target_sigregs sregs;
     int signo;
+    target_sigregs_ext sregs_ext;
     uint16_t retcode;
 } sigframe;
 
+#define TARGET_UC_VXRS 2
+
 struct target_ucontext {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
     target_stack_t tuc_stack;
     target_sigregs tuc_mcontext;
-    target_sigset_t tuc_sigmask;   /* mask last for extensibility */
+    target_sigset_t tuc_sigmask;
+    uint8_t reserved[128 - sizeof(target_sigset_t)];
+    target_sigregs_ext tuc_mcontext_ext;
 };
 
 typedef struct {
@@ -128,6 +139,24 @@ static void save_sigregs(CPUS390XState *env, target_sigregs *sregs)
     }
 }
 
+static void save_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
+{
+    int i;
+
+    /*
+     * if (MACHINE_HAS_VX) ...
+     * That said, we always allocate the stack storage and the
+     * space is always available in env.
+     */
+    for (i = 0; i < 16; ++i) {
+       __put_user(env->vregs[i][1], &ext->vxrs_low[i]);
+    }
+    for (i = 0; i < 16; ++i) {
+       __put_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
+       __put_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
+    }
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUS390XState *env)
 {
@@ -161,6 +190,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
      */
     __put_user(sig, &frame->signo);
 
+    /* Create sigregs_ext on the signal stack. */
+    save_sigregs_ext(env, &frame->sregs_ext);
+
     /*
      * Set up to return from userspace.
      * If provided, use a stub already in userspace.
@@ -202,6 +234,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     rt_sigframe *frame;
     abi_ulong frame_addr;
     abi_ulong restorer;
+    abi_ulong uc_flags;
 
     frame_addr = get_sigframe(ka, env, sizeof *frame);
     trace_user_setup_rt_frame(env, frame_addr);
@@ -229,10 +262,15 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     tswap_siginfo(&frame->info, info);
 
     /* Create ucontext on the signal stack. */
-    __put_user(0, &frame->uc.tuc_flags);
+    uc_flags = 0;
+    if (s390_has_feat(S390_FEAT_VECTOR)) {
+        uc_flags |= TARGET_UC_VXRS;
+    }
+    __put_user(uc_flags, &frame->uc.tuc_flags);
     __put_user(0, &frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
     save_sigregs(env, &frame->uc.tuc_mcontext);
+    save_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
     tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up registers for signal handler */
@@ -271,6 +309,24 @@ static void restore_sigregs(CPUS390XState *env, target_sigregs *sc)
     }
 }
 
+static void restore_sigregs_ext(CPUS390XState *env, target_sigregs_ext *ext)
+{
+    int i;
+
+    /*
+     * if (MACHINE_HAS_VX) ...
+     * That said, we always allocate the stack storage and the
+     * space is always available in env.
+     */
+    for (i = 0; i < 16; ++i) {
+       __get_user(env->vregs[i][1], &ext->vxrs_low[i]);
+    }
+    for (i = 0; i < 16; ++i) {
+       __get_user(env->vregs[i + 16][0], &ext->vxrs_high[i][0]);
+       __get_user(env->vregs[i + 16][1], &ext->vxrs_high[i][1]);
+    }
+}
+
 long do_sigreturn(CPUS390XState *env)
 {
     sigframe *frame;
@@ -292,6 +348,7 @@ long do_sigreturn(CPUS390XState *env)
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
     restore_sigregs(env, &frame->sregs);
+    restore_sigregs_ext(env, &frame->sregs_ext);
 
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
@@ -313,6 +370,7 @@ long do_rt_sigreturn(CPUS390XState *env)
     set_sigmask(&set); /* ~_BLOCKABLE? */
 
     restore_sigregs(env, &frame->uc.tuc_mcontext);
+    restore_sigregs_ext(env, &frame->uc.tuc_mcontext_ext);
 
     target_restore_altstack(&frame->uc.tuc_stack, env);
 
-- 
2.31.1


