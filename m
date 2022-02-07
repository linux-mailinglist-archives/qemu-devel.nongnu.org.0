Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F274AB7FD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:56:15 +0100 (CET)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0ko-0002tQ-8K
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNb-000679-5U
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:11 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:48253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-0007A6-AU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:10 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MbRXj-1nsW7e3YL3-00bwAq; Mon, 07
 Feb 2022 09:28:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] linux-user: Implement starttime field in self stat
 emulation
Date: Mon,  7 Feb 2022 09:27:57 +0100
Message-Id: <20220207082759.180431-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mGB8DLIJC6uD4MP8w/AlgMqp/BntEFqfB/i5p/f8bEVLvjYtX7c
 Nh2QTz1WtPguORkjUwkUD1REPw+7aAu/sv2w+obB1ZEpAW1zFjkMazj2QJ7hC4W14qm9O6T
 qYDLkXdq1oNl+CywzpLWMgf8EkPOiNvGcn9y40sjOh0XP6DK9u/HJSlcpTBqqOntDinejaj
 m2ZuEW1nbLJ/t/jbJnbnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jF5C1H2HKwQ=:+5SCVPYpqLpZUOuwPTB1ai
 tOz5LgmbHC4vtI1IKkWfd8beAK0mHMjS6/y+BX4PLGirgevh4oZax7TYVjU9yUQfeHoW4gwEl
 lIbFdXpTCSjKg/Shnj4sCP63zfyOEtLIrAd5yZpEFUuLGKzHMenJZwarn4NCeFlLVwN0UbKFZ
 xMeOXSkD/soh0mjNG+RWObxHYgRIjTnYCMjXYf10DorZQKVgrY9/X5K/1/0HEaKurABHdFzA6
 Jynrk9iInHCr9YAZ6M6xYJgYUvuRVa64MDBUXu4QeFygS+4g7HqiQfwDsIvyGjOJB/DPN7Tep
 aOBGd+W0MHlVWmZb2yzJQeKYwJ4ROHVQonI+qfUi6JBYnkupbmHs9wTcgWIFH3TrV5gDGgTBD
 yfiHjDTUqjeOypQMoygFA2IN2OA/72XfE9bjVpz1kH58WaksmrTL1dQRS4d/6GLWXZ5co+GGT
 ygHV132igIJCSDzWffwlhKj0jCaB3/d51ME2PypiOmaSWzsUfM8C0I3w47jAPQx/LYij1poh5
 EvEVwhTpKU+A8ARACAH2/HbcWGvn8Qem4tbki6xaHC8z2Bjd9MeMplH0NZKbgY9/7qNg9ZBWl
 YMxf0cNuRMwWz5XOCAwwuSK0H7rjEFOHXjM9BcpOdCAgXdwzDX5314nzIrPFqutdKPb4YiHp8
 zUJi2pAZH9EvLhQBoPr7ltAgGCmv6Ltuwm9lCwd96gfYkbHLEC9gqPkdzalfUUqcnT5E=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

Instead of always returning 0, return actual starttime.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220128001251.45165-1-dirty@apple.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c    | 14 ++++++++++++++
 linux-user/qemu.h    |  3 +++
 linux-user/syscall.c |  3 +++
 3 files changed, 20 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d91..fbc9bcfd5f5f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -190,12 +190,26 @@ void stop_all_tasks(void)
 /* Assumes contents are already zeroed.  */
 void init_task_state(TaskState *ts)
 {
+    long ticks_per_sec;
+    struct timespec bt;
+
     ts->used = 1;
     ts->sigaltstack_used = (struct target_sigaltstack) {
         .ss_sp = 0,
         .ss_size = 0,
         .ss_flags = TARGET_SS_DISABLE,
     };
+
+    /* Capture task start time relative to system boot */
+
+    ticks_per_sec = sysconf(_SC_CLK_TCK);
+
+    if ((ticks_per_sec > 0) && !clock_gettime(CLOCK_BOOTTIME, &bt)) {
+        /* start_boottime is expressed in clock ticks */
+        ts->start_boottime = bt.tv_sec * (uint64_t) ticks_per_sec;
+        ts->start_boottime += bt.tv_nsec * (uint64_t) ticks_per_sec /
+                              NANOSECONDS_PER_SECOND;
+    }
 }
 
 CPUArchState *cpu_copy(CPUArchState *env)
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9d2b3119d1fe..98dfbf20962b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -154,6 +154,9 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
+
+    /* Start time of task after system boot in clock ticks */
+    uint64_t start_boottime;
 } TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 84cfa223df4e..b3948d13a9dd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8077,6 +8077,9 @@ static int open_self_stat(void *cpu_env, int fd)
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
+        } else if (i == 21) {
+            /* starttime */
+            g_string_printf(buf, "%" PRIu64 " ", ts->start_boottime);
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.34.1


