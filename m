Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA56F1EEB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:52:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psU6Z-0000tj-1H; Fri, 28 Apr 2023 15:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6T-0000qU-RV
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:01 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1psU6L-00016Z-HT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:50:00 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 123285F74C;
 Fri, 28 Apr 2023 22:49:47 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b432::1:18])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id TnPWb50Oca60-uYQtUQoA; Fri, 28 Apr 2023 22:49:46 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682711386; bh=zH6VZk1K2LbG7/mejD0LaLx4Ubz9Wgk9QajDKzJITYk=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=FKF7kVcyQnCNrf6N/nT7e/cBRsjyN9FSIWl5rm+9LNl42lkCJtS7VxHhn9vVjZFWM
 YV1+fV1GJckGWTePfaXe/2RSAIZGYJYwpUbc7NM3IpiZw7Ft8vweXZMfI1dXvV2Mzo
 qqv83Y3tpuyk1er02nucmx6QXHqzHwTEK5orKS4s=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: lukasstraub2@web.de, quintela@redhat.com, chen.zhang@intel.com,
 vsementsov@yandex-team.ru, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v4 07/10] migration: split migration_incoming_co
Date: Fri, 28 Apr 2023 22:49:25 +0300
Message-Id: <20230428194928.1426370-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Originally, migration_incoming_co was introduced by
25d0c16f625feb3b6
   "migration: Switch to COLO process after finishing loadvm"
to be able to enter from COLO code to one specific yield point, added
by 25d0c16f625feb3b6.

Later in 923709896b1b0
 "migration: poll the cm event for destination qemu"
we reused this variable to wake the migration incoming coroutine from
RDMA code.

That was doubtful idea. Entering coroutines is a very fragile thing:
you should be absolutely sure which yield point you are going to enter.

I don't know how much is it safe to enter during qemu_loadvm_state()
which I think what RDMA want to do. But for sure RDMA shouldn't enter
the special COLO-related yield-point. As well, COLO code doesn't want
to enter during qemu_loadvm_state(), it want to enter it's own specific
yield-point.

As well, when in 8e48ac95865ac97d
 "COLO: Add block replication into colo process" we added
bdrv_invalidate_cache_all() call (now it's called activate_all())
it became possible to enter the migration incoming coroutine during
that call which is wrong too.

So, let't make these things separate and disjoint: loadvm_co for RDMA,
non-NULL during qemu_loadvm_state(), and colo_incoming_co for COLO,
non-NULL only around specific yield.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/colo.c      | 4 ++--
 migration/migration.c | 8 ++++++--
 migration/migration.h | 9 ++++++++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 6c7c313956..a688ac553a 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -145,8 +145,8 @@ static void secondary_vm_do_failover(void)
     qemu_sem_post(&mis->colo_incoming_sem);
 
     /* For Secondary VM, jump to incoming co */
-    if (mis->migration_incoming_co) {
-        qemu_coroutine_enter(mis->migration_incoming_co);
+    if (mis->colo_incoming_co) {
+        qemu_coroutine_enter(mis->colo_incoming_co);
     }
 }
 
diff --git a/migration/migration.c b/migration/migration.c
index 8db0892317..23b2d187de 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -505,12 +505,14 @@ process_incoming_migration_co(void *opaque)
     Error *local_err = NULL;
 
     assert(mis->from_src_file);
-    mis->migration_incoming_co = qemu_coroutine_self();
     mis->largest_page_size = qemu_ram_pagesize_largest();
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
     migrate_set_state(&mis->state, MIGRATION_STATUS_NONE,
                       MIGRATION_STATUS_ACTIVE);
+
+    mis->loadvm_co = qemu_coroutine_self();
     ret = qemu_loadvm_state(mis->from_src_file);
+    mis->loadvm_co = NULL;
 
     ps = postcopy_state_get();
     trace_process_incoming_migration_co_end(ret, ps);
@@ -551,7 +553,10 @@ process_incoming_migration_co(void *opaque)
 
         qemu_thread_create(&colo_incoming_thread, "COLO incoming",
              colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
+
+        mis->colo_incoming_co = qemu_coroutine_self();
         qemu_coroutine_yield();
+        mis->colo_incoming_co = NULL;
 
         qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
@@ -563,7 +568,6 @@ process_incoming_migration_co(void *opaque)
 
     mis->bh = qemu_bh_new(process_incoming_migration_bh, mis);
     qemu_bh_schedule(mis->bh);
-    mis->migration_incoming_co = NULL;
     return;
 fail:
     local_err = NULL;
diff --git a/migration/migration.h b/migration/migration.h
index 7721c7658b..48a46123a0 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -162,8 +162,15 @@ struct MigrationIncomingState {
 
     int state;
 
+    /*
+     * The incoming migration coroutine, non-NULL during qemu_loadvm_state().
+     * Used to wake the migration incoming coroutine from rdma code. How much is
+     * it safe - it's a question.
+     */
+    Coroutine *loadvm_co;
+
     /* The coroutine we should enter (back) after failover */
-    Coroutine *migration_incoming_co;
+    Coroutine *colo_incoming_co;
     QemuSemaphore colo_incoming_sem;
 
     /*
-- 
2.34.1


