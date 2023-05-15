Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CFB702E92
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXv5-00027i-Gj; Mon, 15 May 2023 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXun-0001yG-QI
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:03 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pyXuj-0001xV-TX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:07:00 -0400
Received: from mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c14:750a:0:640:e46:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3301B5FCC8;
 Mon, 15 May 2023 16:06:53 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown
 [2a02:6b8:8f:4:7a31:c1ff:fef2:bf07])
 by mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id f6aGDc2OcCg0-DA1HCpKE; Mon, 15 May 2023 16:06:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1684156012; bh=c/jdz6xabRJ7bQc4O1i2CBoNjS08bTMayW/qfO7NJK0=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=bzaSEpNX74EV7y/ysOYrGc7yRpo4xZlJQTpr+jhAZ/Y2zTgaDiwh6E/an0ab7J2hW
 6FuoZb+NTTUvo06RlHBX/6h6isYEOipjbB/BLuSxbOToo1Mrs16qRdO0FJM/MOcFJe
 N9D+ZXBDo8nx+4in6wIPh2z6iVHB0Gactuy5HPwU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-34.sas.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 leobras@redhat.com, peterx@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, chen.zhang@intel.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v5 2/3] migration: split migration_incoming_co
Date: Mon, 15 May 2023 16:06:39 +0300
Message-Id: <20230515130640.46035-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515130640.46035-1-vsementsov@yandex-team.ru>
References: <20230515130640.46035-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 migration/rdma.c      | 5 ++---
 4 files changed, 18 insertions(+), 8 deletions(-)

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
index 439e8651df..e66b06d3ec 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -520,12 +520,14 @@ process_incoming_migration_co(void *opaque)
         goto fail;
     }
 
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
@@ -566,7 +568,10 @@ process_incoming_migration_co(void *opaque)
 
         qemu_thread_create(&colo_incoming_thread, "COLO incoming",
              colo_process_incoming_thread, mis, QEMU_THREAD_JOINABLE);
+
+        mis->colo_incoming_co = qemu_coroutine_self();
         qemu_coroutine_yield();
+        mis->colo_incoming_co = NULL;
 
         qemu_mutex_unlock_iothread();
         /* Wait checkpoint incoming thread exit before free resource */
@@ -578,7 +583,6 @@ process_incoming_migration_co(void *opaque)
 
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
diff --git a/migration/rdma.c b/migration/rdma.c
index 2cd8f1cc66..2e4dcff1c9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3342,9 +3342,8 @@ static void rdma_cm_poll_handler(void *opaque)
             }
         }
         rdma_ack_cm_event(cm_event);
-
-        if (mis->migration_incoming_co) {
-            qemu_coroutine_enter(mis->migration_incoming_co);
+        if (mis->loadvm_co) {
+            qemu_coroutine_enter(mis->loadvm_co);
         }
         return;
     }
-- 
2.34.1


