Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850663AA938
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:56:54 +0200 (CEST)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiD7-0000yk-Jx
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAX-0003Oa-5e
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:12085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAT-0000Yo-45
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:12 -0400
IronPort-SDR: olMT3FqYWu2/KVqyTmGfBSNMdazmTAsU20cMThmhcJgi4m6jMG3qz2ZolUPbMfGYkMFrtNUCZT
 xxmGKUYaW7kw==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414076"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414076"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:54:03 -0700
IronPort-SDR: 3HgTLM7SF6E9fgxNSInw3sVFZtv2KLBhBYc24Q7TqJvdcRgcWfzMZWO9xw4GUX6LqPf2G1wOe/
 dDY5stQ9twpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121944"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:54:00 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 2/7] Fixed qemu crash when guest power off in COLO mode
Date: Thu, 17 Jun 2021 10:47:10 +0800
Message-Id: <1623898035-18533-3-git-send-email-lei.rao@intel.com>
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

This patch fixes the following:
qemu-system-x86_64: invalid runstate transition: 'shutdown' -> 'running'
Aborted (core dumped)
The gdb bt as following:
0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
1  0x00007faa3d613859 in __GI_abort () at abort.c:79
2  0x000055c5a21268fd in runstate_set (new_state=RUN_STATE_RUNNING) at vl.c:723
3  0x000055c5a1f8cae4 in vm_prepare_start () at /home/workspace/colo-qemu/cpus.c:2206
4  0x000055c5a1f8cb1b in vm_start () at /home/workspace/colo-qemu/cpus.c:2213
5  0x000055c5a2332bba in migration_iteration_finish (s=0x55c5a4658810) at migration/migration.c:3376
6  0x000055c5a2332f3b in migration_thread (opaque=0x55c5a4658810) at migration/migration.c:3527
7  0x000055c5a251d68a in qemu_thread_start (args=0x55c5a5491a70) at util/qemu-thread-posix.c:519
8  0x00007faa3d7e9609 in start_thread (arg=<optimized out>) at pthread_create.c:477
9  0x00007faa3d710293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635..c2c84c7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3561,7 +3561,9 @@ static void migration_iteration_finish(MigrationState *s)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_CANCELLING:
         if (s->vm_was_running) {
-            vm_start();
+            if (!runstate_check(RUN_STATE_SHUTDOWN)) {
+                vm_start();
+            }
         } else {
             if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
                 runstate_set(RUN_STATE_POSTMIGRATE);
-- 
1.8.3.1


