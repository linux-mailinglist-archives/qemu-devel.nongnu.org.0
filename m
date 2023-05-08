Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500866FB129
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:16:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0eP-0006vH-5m; Mon, 08 May 2023 09:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0e0-0004cp-AM
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0df-000170-QN
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxVq3XMHcGOljMpMBdbQV6LRAPheG9dTdkNJsu4Wxvk=;
 b=EofCp2+7cDuomo2W5L82WQf/FMTWaV2sqfpwrXgTO1+vWNsOUck7McUooqO9Eb9gMH7+yy
 EhRXQC2uvNpc/Xqt/nX9igqr1jC64JSAXKCrWhbN9noTX6z2q6z+O2I5JFahS1/oBqMc9f
 zEBKxO3kxp1ElJEW/WZTgJl9hXIeZLk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-GbgUA867OWOf3uw9t8EYMw-1; Mon, 08 May 2023 09:10:28 -0400
X-MC-Unique: GbgUA867OWOf3uw9t8EYMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5B9D2806065;
 Mon,  8 May 2023 13:10:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA94C2166B41;
 Mon,  8 May 2023 13:10:23 +0000 (UTC)
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
Subject: [PATCH 11/21] migration: Move migration_total_bytes() to
 migration-stats.c
Date: Mon,  8 May 2023 15:08:59 +0200
Message-Id: <20230508130909.65420-12-quintela@redhat.com>
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

Once there rename it to migration_transferred_bytes() and pass a
QEMUFile instead of a migration object.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.c |  6 ++++++
 migration/migration-stats.h |  9 +++++++++
 migration/migration.c       | 13 +++----------
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/migration/migration-stats.c b/migration/migration-stats.c
index e01842cabc..fba66c4577 100644
--- a/migration/migration-stats.c
+++ b/migration/migration-stats.c
@@ -63,3 +63,9 @@ void migration_rate_limit_account(uint64_t len)
 {
     stat64_add(&mig_stats.rate_limit_used, len);
 }
+
+uint64_t migration_transferred_bytes(QEMUFile *f)
+{
+    return qemu_file_transferred(f) + stat64_get(&mig_stats.multifd_bytes);
+}
+
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index 65f11ec7d1..c82fce9608 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -137,4 +137,13 @@ void migration_rate_limit_reset(void);
  */
 void migration_rate_limit_set(uint64_t new_rate);
 
+/**
+ * migration_transferred_bytes: Return number of bytes transferred
+ *
+ * Returtns how many bytes have we transferred since the beginning of
+ * the migration.  It accounts for bytes sent through any migration
+ * channel, multifd, qemu_file, rdma, ....
+ */
+uint64_t migration_transferred_bytes(QEMUFile *f);
+
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 370998600e..e6d262ffe1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2617,16 +2617,9 @@ static MigThrError migration_detect_error(MigrationState *s)
     }
 }
 
-/* How many bytes have we transferred since the beginning of the migration */
-static uint64_t migration_total_bytes(MigrationState *s)
-{
-    return qemu_file_transferred(s->to_dst_file) +
-        stat64_get(&mig_stats.multifd_bytes);
-}
-
 static void migration_calculate_complete(MigrationState *s)
 {
-    uint64_t bytes = migration_total_bytes(s);
+    uint64_t bytes = migration_transferred_bytes(s->to_dst_file);
     int64_t end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     int64_t transfer_time;
 
@@ -2652,7 +2645,7 @@ static void update_iteration_initial_status(MigrationState *s)
      * wrong speed calculation.
      */
     s->iteration_start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-    s->iteration_initial_bytes = migration_total_bytes(s);
+    s->iteration_initial_bytes = migration_transferred_bytes(s->to_dst_file);
     s->iteration_initial_pages = ram_get_total_transferred_pages();
 }
 
@@ -2667,7 +2660,7 @@ static void migration_update_counters(MigrationState *s,
         return;
     }
 
-    current_bytes = migration_total_bytes(s);
+    current_bytes = migration_transferred_bytes(s->to_dst_file);
     transferred = current_bytes - s->iteration_initial_bytes;
     time_spent = current_time - s->iteration_start_time;
     bandwidth = (double)transferred / time_spent;
-- 
2.40.0


