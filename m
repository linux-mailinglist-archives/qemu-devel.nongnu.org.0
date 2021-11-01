Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB12844150C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:09:25 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSNg-00033X-QV
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJz-0003NP-Nr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:46959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJt-0004Gy-A7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="228421380"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="228421380"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541548"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:22 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 3/7] Fixed SVM hang when do failover before PVM crash
Date: Mon,  1 Nov 2021 15:57:01 +0800
Message-Id: <1635753425-11756-4-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
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
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/migration.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e5b38a492f..811097c423 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -587,8 +587,10 @@ static void process_incoming_migration_co(void *opaque)
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
2.30.2


