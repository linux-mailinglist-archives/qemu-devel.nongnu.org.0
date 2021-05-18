Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1749D387193
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:03:30 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lispE-0001JI-Oz
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKj-0007W3-8K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:01 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:49409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKg-00078T-05
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:57 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mr8vG-1l5zQB1YHO-00oH3a; Tue, 18
 May 2021 07:31:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 33/59] linux-user/s390x: Fix sigframe types
Date: Tue, 18 May 2021 07:31:05 +0200
Message-Id: <20210518053131.87212-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0urGm6ZvufG+APtXNbvTbNiQkkhr65pbK5qMHl89WrrHqBe+g7g
 yfImRy2dfOA//JCcqNSN2p3GAPbjXLxR3B76yjF2wvP/xlUFcST+YEFTb6cw4nSt4zfnhZS
 b7S7WPZ4lG6xgncMSPHKkDhbLi9KkpPrenJaryRWTP+nmVGMvU5CBHqlJL59wDHxoHnCfH/
 h9YYBg5EOKJR0q8kGXRoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w2nRTAjZVEw=:1LQszoWpBCu7qMeURyj617
 opyawaflF9pJtYTWfYdLz8M8LLwp2goUIZZl8GwN/S2IO9A9cVBJfP5Ogrefr24I/bPWaavRN
 Z/rVNJedjFWVXCgfUGU9wPqJ6XbHMWjbACbthlaaQwqPmjy0eUfRlNxvuzCDdVVkhc21BdRCg
 BDoUgRB5p5sAst8hs6P1D/EYsUj5tv0ku3GvBfy+qxIH+iOwwxnRIyGddh5dagS6pmJ3nIeQg
 ed/jhvSQ9BVjZfXQVwdLsHsxlJTAXKshUn6On5VsZ2X3ARHyMlh8/APxYp1WxlD9urzx2WHAF
 d3ZL8lVDIN0khIEpE3uxrCHQl62sSg/YMyunektT6jLyv44K7Q0NYy54ZNYYAzgbfqNcJnve/
 uyHClEsykCwIV3CpFFYmdAgVvmyQbiOavLSgWOFSdLe92433FKgA/XCtO+2omiD5xW0Bb2lhW
 8Tf1OR2ec4eIZlsx3m3hxaj81TYR/3/XQ2u2JLNk7vx/FMyKczTk7hdsJXizlPAx/M6U0b/8f
 MOaunv/ZbVT47fMSoEYBq4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Noticed via gitlab clang-user job:

  TEST    signals on s390x
../linux-user/s390x/signal.c:258:9: runtime error: \
  1.84467e+19 is outside the range of representable values of \
  type 'unsigned long'

Which points to the fact that we were performing a double-to-uint64_t
conversion while storing the fp registers, instead of just copying
the data across.

Turns out there are several errors:

target_ulong is the size of the target register, whereas abi_ulong
is the target 'unsigned long' type.  Not a big deal here, since we
only support 64-bit s390x, but not correct either.

In target_sigcontext and target ucontext, we used a host pointer
instead of a target pointer, aka abi_ulong.

Fixing this allows the removal of a cast to __put_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index b68b44ae7e99..707fb603d72e 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -37,13 +37,14 @@
 
 typedef struct {
     target_psw_t psw;
-    target_ulong gprs[__NUM_GPRS];
-    unsigned int acrs[__NUM_ACRS];
+    abi_ulong gprs[__NUM_GPRS];
+    abi_uint acrs[__NUM_ACRS];
 } target_s390_regs_common;
 
 typedef struct {
-    unsigned int fpc;
-    double   fprs[__NUM_FPRS];
+    uint32_t fpc;
+    uint32_t pad;
+    uint64_t fprs[__NUM_FPRS];
 } target_s390_fp_regs;
 
 typedef struct {
@@ -51,22 +52,22 @@ typedef struct {
     target_s390_fp_regs     fpregs;
 } target_sigregs;
 
-struct target_sigcontext {
-    target_ulong   oldmask[_SIGCONTEXT_NSIG_WORDS];
-    target_sigregs *sregs;
-};
+typedef struct {
+    abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
+    abi_ulong sregs;
+} target_sigcontext;
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    struct target_sigcontext sc;
+    target_sigcontext sc;
     target_sigregs sregs;
     int signo;
     uint8_t retcode[S390_SYSCALL_SIZE];
 } sigframe;
 
 struct target_ucontext {
-    target_ulong tuc_flags;
-    struct target_ucontext *tuc_link;
+    abi_ulong tuc_flags;
+    abi_ulong tuc_link;
     target_stack_t tuc_stack;
     target_sigregs tuc_mcontext;
     target_sigset_t tuc_sigmask;   /* mask last for extensibility */
@@ -143,8 +144,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     save_sigregs(env, &frame->sregs);
 
-    __put_user((abi_ulong)(unsigned long)&frame->sregs,
-               (abi_ulong *)&frame->sc.sregs);
+    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.31.1


