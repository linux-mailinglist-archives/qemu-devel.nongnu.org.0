Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A10D383C8C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:42:10 +0200 (CEST)
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiBt-0007Us-DL
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihle-0006gr-Vj
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:03 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlO-0004Sc-K8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:02 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MMWcT-1m1CWC0Oal-00Jbsn; Mon, 17
 May 2021 20:14:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 33/59] linux-user/s390x: Fix sigframe types
Date: Mon, 17 May 2021 20:13:58 +0200
Message-Id: <20210517181424.8093-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TxyEcAhsSbqBLujpqtJut140YA7aMpj9BH3C0P+OZX0DvPZjZVj
 qTeLWG21Z932mGU8DK7KiW69E02mKTEFF5WMoOo9eAetvvkxAzAL4+ECfDV1adRZxovGvm6
 iZAAyApdt8lcysZOHSWGWTk+aa5I+sjuByDV8QKw7dYtusoOYclbcKuPV+7QyTz1WXYcOVH
 goxsOdUiv2oI5s6zQg3gg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wqb2OFwA6zE=:kPKLwNaXDZz2iukfeNE3fo
 ZTJr+yTa1HWKw7GHCCu8UnaIZqsYkQw/S6o03rbWDp8mC+ZJN4mJ50tipItiOGwiQ3uDKnIqM
 s0ZP4KxdWKv8Nbmsphm537NhPi2GOTTyqMcc4OxbJTags2j/GFG7MtKm+8pt/rantdARdEKEr
 j541iBU63haNR5roE2DCQgaJcYZ5hyjWIavTY2vDxvPmDM83w4N86GRbk234rmhx9oVtR3Rmn
 ylzOWHbGOky1XLQPfkNjMMKvYo4hBTKrve0tvh1YVmYcKq+Ay0bSC20SEwCnrxXqk/7cos6Lp
 DPf4uaJZgA9oj+1Qxve5ethQpCMrpMsMDV3iRdr+o6eF4kfGcKCQLIfEz4TEYuZdcQ9rtbCtj
 vSEYhbYex4+y2HqeD8roaTALp9n+j4533g0xnnskznMvw4QRNK2oNlpikEC+NhgQu4p/ifZ7P
 qAIgQ7LhbKFemE7hNfmEuZATFG6JC8hrkJ7AzoWXY8fubt+YB6LCrI2LH92aD7pj3F0bm4Rj3
 6yiCX7H0rfNK9GvClVXZXQ=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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


