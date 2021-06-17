Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CFF3AA947
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:58:50 +0200 (CEST)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiEz-0004mE-4P
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAc-0003T2-Pn
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:12066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAT-0000Pu-1N
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:18 -0400
IronPort-SDR: 2it6plXCZEjHRbPVY6bPcQ8tKdiPVXZ6bW1ubxuJE8FqevzURahJvZotMPZ6vStyYy6kygclgh
 JUvt2hWz8XPg==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414084"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414084"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:54:06 -0700
IronPort-SDR: 3agVnx3SfQgMNv0FLsMirnDU7soUnThECDK5jd17giBh4hJnHZH8yq98d028u4mpwnQ9EDukU1
 +5xAZwUdHzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121960"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:54:04 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 3/7] Fixed SVM hang when do failover before PVM crash
Date: Thu, 17 Jun 2021 10:47:11 +0800
Message-Id: <1623898035-18533-4-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei.rao@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: like.xu.linux@gmail.com, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixed as follows:
    Thread 1 (Thread 0x7f34ee738d80 (LWP 11212)):
    #0 __pthread_clockjoin_ex (threadid=139847152957184, thread_return=0x7f30b1febf30, clockid=<optimized out>, abstime=<optimized out>, block=<optimized out>) at pthread_join_common.c:145
    #1 0x0000563401998e36 in qemu_thread_join (thread=0x563402d66610) at util/qemu-thread-posix.c:587
    #2 0x00005634017a79fa in process_incoming_migration_co (opaque=0x0) at migration/migration.c:502
    #3 0x00005634019b59c9 in coroutine_trampoline (i0=63395504, i1=22068) at util/coroutine-ucontext.c:115
    #4 0x00007f34ef860660 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91 from /lib/x86_64-linux-gnu/libc.so.6
    #5 0x00007f30b21ee730 in ?? ()
    #6 0x0000000000000000 in ?? ()

    Thread 13 (Thread 0x7f30b3dff700 (LWP 11747)):
    #0  __lll_lock_wait (futex=futex@entry=0x56340218ffa0 <qemu_global_mutex>, private=0) at lowlevellock.c:52
    #1  0x00007f34efa000a3 in _GI__pthread_mutex_lock (mutex=0x56340218ffa0 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
    #2  0x0000563401997f99 in qemu_mutex_lock_impl (mutex=0x56340218ffa0 <qemu_global_mutex>, file=0x563401b7a80e "migration/colo.c", line=806) at util/qemu-thread-posix.c:78
    #3  0x0000563401407144 in qemu_mutex_lock_iothread_impl (file=0x563401b7a80e "migration/colo.c", line=806) at /home/workspace/colo-qemu/cpus.c:1899
    #4  0x00005634017ba8e8 in colo_process_incoming_thread (opaque=0x563402d664c0) at migration/colo.c:806
    #5  0x0000563401998b72 in qemu_thread_start (args=0x5634039f8370) at util/qemu-thread-posix.c:519
    #6  0x00007f34ef9fd609 in start_thread (arg=<optimized out>) at pthread_create.c:477
    #7  0x00007f34ef924293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

    The QEMU main thread is holding the lock:
    (gdb) p qemu_global_mutex
    $1 = {lock = {_data = {lock = 2, __count = 0, __owner = 11212, __nusers = 9, __kind = 0, __spins = 0, __elision = 0, __list = {_prev = 0x0, __next = 0x0}},
     __size = "\002\000\000\000\000\000\000\000\314+\000\000\t", '\000' <repeats 26 times>, __align = 2}, file = 0x563401c07e4b "util/main-loop.c", line = 240,
    initialized = true}

From the call trace, we can see it is a deadlock bug. and the QEMU main thread holds the global mutex to wait until the COLO thread ends. and the colo thread
wants to acquire the global mutex, which will cause a deadlock. So, we should release the qemu_global_mutex before waiting colo thread ends.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index c2c84c7..6debb8b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -593,8 +593,10 @@ static void process_incoming_migration_co(void *opaque)
         mis->have_colo_incoming_thread = true;
         qemu_coroutine_yield();
 
+        qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
         qemu_thread_join(&mis->colo_incoming_thread);
+        qemu_mutex_lock_iothread();
         /* We hold the global iothread lock, so it is safe here */
         colo_release_ram_cache();
     }
-- 
1.8.3.1


