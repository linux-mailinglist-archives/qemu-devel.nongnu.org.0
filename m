Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516012FEBD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 23:27:48 +0100 (CET)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inVPQ-0000k2-5I
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 17:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHp-0006yk-Sc
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1inVHn-00080X-VG
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:17 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:53083 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1inVHn-0003qu-Ig
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 17:19:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 2A8FA1A2270;
 Fri,  3 Jan 2020 23:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0138E1A1FD7;
 Fri,  3 Jan 2020 23:18:10 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/12] linux-user: mips: Update syscall numbers to kernel
 5.5 rc3 level
Date: Fri,  3 Jan 2020 23:17:52 +0100
Message-Id: <1578089882-3587-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578089882-3587-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1578089882-3587-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Update mips syscall numbers based on Linux kernel tag v5.5-rc3
(commit 46cf053e).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/mips/cpu_loop.c     | 69 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/mips/syscall_nr.h   | 45 +++++++++++++++++++++++++++
 linux-user/mips64/syscall_nr.h | 13 ++++++++
 3 files changed, 127 insertions(+)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 39915b3..a9db725 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -390,6 +390,75 @@ static const uint8_t mips_syscall_args[] = {
         MIPS_SYS(sys_copy_file_range, 6) /* 360 */
         MIPS_SYS(sys_preadv2, 6)
         MIPS_SYS(sys_pwritev2, 6)
+        MIPS_SYS(sys_pkey_mprotect, 4)
+        MIPS_SYS(sys_pkey_alloc, 2)
+        MIPS_SYS(sys_pkey_free, 1)                 /* 365 */
+        MIPS_SYS(sys_statx, 5)
+        MIPS_SYS(sys_rseq, 4)
+        MIPS_SYS(sys_io_pgetevents, 6)
+        0,
+        0,                                         /* 370 */
+        0,
+        0,
+        0,
+        0,
+        0,                                         /* 375 */
+        0,
+        0,
+        0,
+        0,
+        0,                                         /* 380 */
+        0,
+        0,
+        0,
+        0,
+        0,                                         /* 385 */
+        0,
+        0,
+        0,
+        0,
+        0,                                         /* 390 */
+        0,
+        0,
+        MIPS_SYS(sys_semget, 3)
+        MIPS_SYS(sys_semctl, 4)
+        MIPS_SYS(sys_shmget, 3)                    /* 395 */
+        MIPS_SYS(sys_shmctl, 3)
+        MIPS_SYS(sys_shmat, 3)
+        MIPS_SYS(sys_shmdt, 1)
+        MIPS_SYS(sys_msgget, 2)
+        MIPS_SYS(sys_msgsnd, 4)                    /* 400 */
+        MIPS_SYS(sys_msgrcv, 5)
+        MIPS_SYS(sys_msgctl, 3)
+        MIPS_SYS(sys_timer_gettime64, 2)
+        MIPS_SYS(sys_timer_settime64, 4)
+        MIPS_SYS(sys_timerfd_gettime64, 2)         /* 410 */
+        MIPS_SYS(sys_timerfd_settime64, 4)
+        MIPS_SYS(sys_utimensat_time64, 4)
+        MIPS_SYS(sys_pselect6_time64, 6)
+        MIPS_SYS(sys_ppoll_time64, 5)
+        0,                                         /* 415 */
+        MIPS_SYS(sys_io_pgetevents_time64, 6)
+        MIPS_SYS(sys_recvmmsg_time64, 5)
+        MIPS_SYS(sys_mq_timedsend_time64, 5)
+        MIPS_SYS(sys_mq_timedreceive_time64, 5)
+        MIPS_SYS(sys_semtimedop_time64, 4)         /* 420 */
+        MIPS_SYS(sys_rt_sigtimedwait_time64, 4)
+        MIPS_SYS(sys_futex_time64, 6)
+        MIPS_SYS(sys_sched_rr_get_interval_time64, 2)
+        MIPS_SYS(sys_pidfd_send_signal, 4)
+        MIPS_SYS(sys_io_uring_setup, 2)            /* 425 */
+        MIPS_SYS(sys_io_uring_enter, 6)
+        MIPS_SYS(sys_io_uring_register, 4)
+        MIPS_SYS(sys_open_tree, 3)
+        MIPS_SYS(sys_move_mount, 5)
+        MIPS_SYS(sys_fsopen, 2)                    /* 430 */
+        MIPS_SYS(sys_fsconfig, 5)
+        MIPS_SYS(sys_fsmount, 3)
+        MIPS_SYS(sys_fspick, 3)
+        MIPS_SYS(sys_pidfd_open, 2)
+        MIPS_SYS(sys_clone3, 2)                    /* 435 */
+
 };
 #  undef MIPS_SYS
 # endif /* O32 */
diff --git a/linux-user/mips/syscall_nr.h b/linux-user/mips/syscall_nr.h
index 7fa7fa5..0be3af1 100644
--- a/linux-user/mips/syscall_nr.h
+++ b/linux-user/mips/syscall_nr.h
@@ -376,5 +376,50 @@
 #define TARGET_NR_statx                 (TARGET_NR_Linux + 366)
 #define TARGET_NR_rseq                  (TARGET_NR_Linux + 367)
 #define TARGET_NR_io_pgetevents         (TARGET_NR_Linux + 368)
+/* room for arch specific calls */
+#define TARGET_NR_semget                (TARGET_NR_Linux + 393)
+#define TARGET_NR_semctl                (TARGET_NR_Linux + 394)
+#define TARGET_NR_shmget                (TARGET_NR_Linux + 395)
+#define TARGET_NR_shmctl                (TARGET_NR_Linux + 396)
+#define TARGET_NR_shmat                 (TARGET_NR_Linux + 397)
+#define TARGET_NR_shmdt                 (TARGET_NR_Linux + 398)
+#define TARGET_NR_msgget                (TARGET_NR_Linux + 399)
+#define TARGET_NR_msgsnd                (TARGET_NR_Linux + 400)
+#define TARGET_NR_msgrcv                (TARGET_NR_Linux + 401)
+#define TARGET_NR_msgctl                (TARGET_NR_Linux + 402)
+/* 403-423 common for 32-bit archs */
+#define TARGET_NR_clock_gettime64              (TARGET_NR_Linux + 403)
+#define TARGET_NR_clock_settime64              (TARGET_NR_Linux + 404)
+#define TARGET_NR_clock_adjtime64              (TARGET_NR_Linux + 405)
+#define TARGET_NR_clock_getres_time64          (TARGET_NR_Linux + 406)
+#define TARGET_NR_clock_nanosleep_time64       (TARGET_NR_Linux + 407)
+#define TARGET_NR_timer_gettime64              (TARGET_NR_Linux + 408)
+#define TARGET_NR_timer_settime64              (TARGET_NR_Linux + 409)
+#define TARGET_NR_timerfd_gettime64            (TARGET_NR_Linux + 410)
+#define TARGET_NR_timerfd_settime64            (TARGET_NR_Linux + 411)
+#define TARGET_NR_utimensat_time64             (TARGET_NR_Linux + 412)
+#define TARGET_NR_pselect6_time64              (TARGET_NR_Linux + 413)
+#define TARGET_NR_ppoll_time64                 (TARGET_NR_Linux + 414)
+#define TARGET_NR_io_pgetevents_time64         (TARGET_NR_Linux + 416)
+#define TARGET_NR_recvmmsg_time64              (TARGET_NR_Linux + 417)
+#define TARGET_NR_mq_timedsend_time64          (TARGET_NR_Linux + 418)
+#define TARGET_NR_mq_timedreceive_time64       (TARGET_NR_Linux + 419)
+#define TARGET_NR_semtimedop_time64            (TARGET_NR_Linux + 420)
+#define TARGET_NR_rt_sigtimedwait_time64       (TARGET_NR_Linux + 421)
+#define TARGET_NR_futex_time64                 (TARGET_NR_Linux + 422)
+#define TARGET_NR_sched_rr_get_interval_time64 (TARGET_NR_Linux + 423)
+/* 424 onwards common for all archs */
+#define TARGET_NR_pidfd_send_signal            (TARGET_NR_Linux + 424)
+#define TARGET_NR_io_uring_setup               (TARGET_NR_Linux + 425)
+#define TARGET_NR_io_uring_enter               (TARGET_NR_Linux + 426)
+#define TARGET_NR_io_uring_register            (TARGET_NR_Linux + 427)
+#define TARGET_NR_open_tree                    (TARGET_NR_Linux + 428)
+#define TARGET_NR_move_mount                   (TARGET_NR_Linux + 429)
+#define TARGET_NR_fsopen                       (TARGET_NR_Linux + 430)
+#define TARGET_NR_fsconfig                     (TARGET_NR_Linux + 431)
+#define TARGET_NR_fsmount                      (TARGET_NR_Linux + 432)
+#define TARGET_NR_fspick                       (TARGET_NR_Linux + 433)
+#define TARGET_NR_pidfd_open                   (TARGET_NR_Linux + 434)
+#define TARGET_NR_clone3                       (TARGET_NR_Linux + 435)
 
 #endif
diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
index db40f69..c86943a 100644
--- a/linux-user/mips64/syscall_nr.h
+++ b/linux-user/mips64/syscall_nr.h
@@ -674,6 +674,19 @@
 #define TARGET_NR_statx                 (TARGET_NR_Linux + 326)
 #define TARGET_NR_rseq                  (TARGET_NR_Linux + 327)
 #define TARGET_NR_io_pgetevents         (TARGET_NR_Linux + 328)
+/* 329 through 423 are reserved to sync up with other architectures */
+#define TARGET_NR_pidfd_send_signal     (TARGET_NR_Linux + 424)
+#define TARGET_NR_io_uring_setup        (TARGET_NR_Linux + 425)
+#define TARGET_NR_io_uring_enter        (TARGET_NR_Linux + 426)
+#define TARGET_NR_io_uring_register     (TARGET_NR_Linux + 427)
+#define TARGET_NR_open_tree             (TARGET_NR_Linux + 428)
+#define TARGET_NR_move_mount            (TARGET_NR_Linux + 429)
+#define TARGET_NR_fsopen                (TARGET_NR_Linux + 430)
+#define TARGET_NR_fsconfig              (TARGET_NR_Linux + 431)
+#define TARGET_NR_fsmount               (TARGET_NR_Linux + 432)
+#define TARGET_NR_fspick                (TARGET_NR_Linux + 433)
+#define TARGET_NR_pidfd_open            (TARGET_NR_Linux + 434)
+#define TARGET_NR_clone3                (TARGET_NR_Linux + 435)
 #endif
 
 #endif
-- 
2.7.4


