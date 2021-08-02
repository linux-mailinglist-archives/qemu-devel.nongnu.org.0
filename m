Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BF3DD614
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:56:05 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXUC-0000rr-KF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1mAXTF-00008E-OH
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:55:05 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:50720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1mAXTE-0005e8-0L
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:55:05 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 310161FF83;
 Mon,  2 Aug 2021 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627908901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PI6iWZWZNSrQfcnrv4mjJ4UauK2p997d6XAj1DjsHi0=;
 b=y8cexmhJcD/ycr4QBp9M5ZMEFXOsegfzqDL8Kbpl7Kb2rU3LzNky+u8ZsJCQejPiO6audr
 dypj1IDjf5URAJYZmIVYNCtH5ErHpJ39L9JlU5b9bIS7yrMZ1sQ+jt97TKsJrhALKYGlPQ
 gl0Y+D0Ie38BQ+4m+MvYgFqBib7gsTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627908901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PI6iWZWZNSrQfcnrv4mjJ4UauK2p997d6XAj1DjsHi0=;
 b=A3KgdePo2tZpWgit3pphXxyqje84QgbRO7dkXrvI5r+NfSnDcToWdtOJkX7p5vWnK7DSce
 yVHg0QkMVBB5fABA==
Received: from hawking.suse.de (hawking.suse.de [10.160.4.0])
 by relay2.suse.de (Postfix) with ESMTP id 2791AA3BB6;
 Mon,  2 Aug 2021 12:55:01 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 12C1E4461A0; Mon,  2 Aug 2021 14:55:01 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall: add support for CLONE_PIDFD
X-Yow: KARL MALDEN'S NOSE just won an ACADEMY AWARD!!
Date: Mon, 02 Aug 2021 14:55:00 +0200
Message-ID: <mvmk0l42ehn.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=schwab@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add basic support for CLONE_PIDFD, only fork-like clone without additional
flags.  This is enough to make Qt/forkfd working.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 52 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2d..ad0de26dd7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -137,6 +137,9 @@
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
 #endif
+#ifndef CLONE_PIDFD
+#define CLONE_PIDFD             0x00001000      /* set if a pidfd should be placed in parent */
+#endif
 
 /* We can't directly call the host clone syscall, because this will
  * badly confuse libc (breaking mutexes, for example). So we must
@@ -163,7 +166,8 @@
 /* Flags for fork which we can implement within QEMU itself */
 #define CLONE_OPTIONAL_FORK_FLAGS               \
     (CLONE_SETTLS | CLONE_PARENT_SETTID |       \
-     CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID)
+     CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID | \
+     CLONE_PIDFD)
 
 /* Flags for thread creation which we can implement within QEMU itself */
 #define CLONE_OPTIONAL_THREAD_FLAGS                             \
@@ -488,6 +492,39 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
           struct host_rlimit64 *, old_limit)
 #endif
 
+#if defined __NR_clone2
+#define __NR_sys_clone2 __NR_clone2
+_syscall6(int, sys_clone2, int, flags, void *, child_stack, size_t, stack_size,
+          int *, ptid, int *, ctid, void *, newtls);
+#else
+#define __NR_sys_clone __NR_clone
+#if defined __cris__ || defined __s390x__
+_syscall5(int, sys_clone, void *, child_stack, int, flags, int *, ptid,
+          void *, newtls, int *, ctid);
+#elif defined __microblaze__
+_syscall6(int, sys_clone, int, flags, void *, child_stack, size_t, stack_size,
+          int *, ptid, void *, newtls, int *, ctid);
+#else
+/*
+ * Note: ctid and newtls are swapped on some architectures, but both are
+ * passed as NULL only for now.
+ */
+_syscall5(int, sys_clone, int, flags, void *, child_stack, int *, ptid,
+          int *, ctid, void *, newtls);
+#endif
+#endif
+static int sys_clone_pidfd(int flags, int *pidfd)
+{
+#ifdef __NR_clone2
+    return sys_clone2(flags, NULL, 0, pidfd, NULL, NULL);
+#elif defined __cris__ || defined __s390x__
+    return sys_clone(NULL, flags, pidfd, NULL, NULL);
+#elif defined __microblaze__
+    return sys_clone(flags, NULL, 0, pidfd, NULL, NULL);
+#else
+    return sys_clone(flags, NULL, pidfd, NULL, NULL);
+#endif
+}
 
 #if defined(TARGET_NR_timer_create)
 /* Maximum of 32 active POSIX timers allowed at any one time. */
@@ -6346,6 +6383,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
     CPUState *new_cpu;
     CPUArchState *new_env;
     sigset_t sigmask;
+    int pidfd;
 
     flags &= ~CLONE_IGNORED_FLAGS;
 
@@ -6353,6 +6391,10 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
     if (flags & CLONE_VFORK)
         flags &= ~(CLONE_VFORK | CLONE_VM);
 
+    /* Only basic fork-like clone is supported with CLONE_PIDFD for now. */
+    if (flags & CLONE_PIDFD && flags & ~(CLONE_PIDFD|CSIGNAL))
+        return -TARGET_EINVAL;
+
     if (flags & CLONE_VM) {
         TaskState *parent_ts = (TaskState *)cpu->opaque;
         new_thread_info info;
@@ -6451,7 +6493,11 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         }
 
         fork_start();
-        ret = fork();
+        if (flags & CLONE_PIDFD) {
+            ret = sys_clone_pidfd(flags, &pidfd);
+        } else {
+            ret = fork();
+        }
         if (ret == 0) {
             /* Child Process.  */
             cpu_clone_regs_child(env, newsp, flags);
@@ -6474,6 +6520,8 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         } else {
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
+            if (flags & CLONE_PIDFD)
+                put_user_u32(pidfd, parent_tidptr);
         }
     }
     return ret;
-- 
2.32.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

