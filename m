Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B66FB0F8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:12:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0e8-0004cb-1a; Mon, 08 May 2023 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0dN-00040W-86
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0dD-00012Y-1j
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0/64K/qSP6S4qwokn5M1j0REskez/N1l4Un71CnZyM=;
 b=GYHWx6Donll6PTPf2KfGXbYCn85W6byhpTInIbNKR06euOS/gLtQuQD7sDdN24WiFiNEHR
 UjQ7EezN3FnbqSVIxjr7/OoF4dMt32lwUhYYbdBL9gkJVYQ3bA2BrquGmNnKQF7jxSvJs8
 IGQbuWO0jVV2NyDF2vtC1Y/DiKgutFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-4kVC3C01PCy7cgz6l21Pog-1; Mon, 08 May 2023 09:10:14 -0400
X-MC-Unique: 4kVC3C01PCy7cgz6l21Pog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AD27100F658;
 Mon,  8 May 2023 13:10:13 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6BF2166B40;
 Mon,  8 May 2023 13:10:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 08/21] migration: Move setup_time to mig_stats
Date: Mon,  8 May 2023 15:08:56 +0200
Message-Id: <20230508130909.65420-9-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

It is a time that needs to be cleaned each time cancel migration.
Once there ccreate calculate_time_since() to calculate how time since
a time in the past.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.c |  7 +++++++
 migration/migration-stats.h | 14 ++++++++++++++
 migration/migration.c       |  9 ++++-----
 migration/migration.h       |  1 -
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/migration/migration-stats.c b/migration/migration-stats.c
index 2f2cea965c..5278c6c821 100644
--- a/migration/migration-stats.c
+++ b/migration/migration-stats.c
@@ -12,6 +12,13 @@
 
 #include "qemu/osdep.h"
 #include "qemu/stats64.h"
+#include "qemu/timer.h"
 #include "migration-stats.h"
 
 MigrationAtomicStats mig_stats;
+
+void calculate_time_since(Stat64 *val, int64_t since)
+{
+    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    stat64_set(val, now - since);
+}
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index cf8a4f0410..73c73d75b9 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -69,6 +69,10 @@ typedef struct {
      * Number of bytes sent during precopy stage.
      */
     Stat64 precopy_bytes;
+    /*
+     * How long has the setup stage took.
+     */
+    Stat64 setup_time;
     /*
      * Total number of bytes transferred.
      */
@@ -81,4 +85,14 @@ typedef struct {
 
 extern MigrationAtomicStats mig_stats;
 
+/**
+ * calculate_time_since: Calculate how much time has passed
+ *
+ * @val: stat64 where to store the time
+ * @since: reference time since we want to calculate
+ *
+ * Returns: Nothing.  The time is stored in val.
+ */
+
+void calculate_time_since(Stat64 *val, int64_t since);
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index b1cfb56523..72286de969 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -884,7 +884,7 @@ static void populate_time_info(MigrationInfo *info, MigrationState *s)
 {
     info->has_status = true;
     info->has_setup_time = true;
-    info->setup_time = s->setup_time;
+    info->setup_time = stat64_get(&mig_stats.setup_time);
 
     if (s->state == MIGRATION_STATUS_COMPLETED) {
         info->has_total_time = true;
@@ -1387,7 +1387,6 @@ void migrate_init(MigrationState *s)
     s->pages_per_second = 0.0;
     s->downtime = 0;
     s->expected_downtime = 0;
-    s->setup_time = 0;
     s->start_postcopy = false;
     s->postcopy_after_devices = false;
     s->migration_thread_running = false;
@@ -2640,7 +2639,7 @@ static void migration_calculate_complete(MigrationState *s)
         s->downtime = end_time - s->downtime_start;
     }
 
-    transfer_time = s->total_time - s->setup_time;
+    transfer_time = s->total_time - stat64_get(&mig_stats.setup_time);
     if (transfer_time) {
         s->mbps = ((double) bytes * 8.0) / transfer_time / 1000;
     }
@@ -2965,7 +2964,7 @@ static void *migration_thread(void *opaque)
     qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
                                MIGRATION_STATUS_ACTIVE);
 
-    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
+    calculate_time_since(&mig_stats.setup_time, setup_start);
 
     trace_migration_thread_setup_complete();
 
@@ -3077,7 +3076,7 @@ static void *bg_migration_thread(void *opaque)
     qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
                                MIGRATION_STATUS_ACTIVE);
 
-    s->setup_time = qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
+    calculate_time_since(&mig_stats.setup_time, setup_start);
 
     trace_migration_thread_setup_complete();
     s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
diff --git a/migration/migration.h b/migration/migration.h
index 3a918514e7..7f554455ac 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -311,7 +311,6 @@ struct MigrationState {
     int64_t downtime;
     int64_t expected_downtime;
     bool capabilities[MIGRATION_CAPABILITY__MAX];
-    int64_t setup_time;
     /*
      * Whether guest was running when we enter the completion stage.
      * If migration is interrupted by any reason, we need to continue
-- 
2.40.0


