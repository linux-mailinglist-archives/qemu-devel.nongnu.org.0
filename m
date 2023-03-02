Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46636A870C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:42:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvI-00032Z-S1; Thu, 02 Mar 2023 11:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlul-0001eR-7p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXluj-0000KU-E0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5/5JxJi2WRFpSM8VJJ1wkmd0dm7V5w5lyuYlsHhN6Q=;
 b=Vh8+Cn52izpnNo2ipkPOgJB9r4i6zReCP12I04YV84AbhjCUWimeoLCWHaDN6A7fEq8C8I
 wlpZZFIO7NZxaSL3JkieYB4GObgAnHzPaf6DVEA5dshaTkFJD1y0SkaiHrz3e1zYeeGKx2
 wcQiWJWqpPGMnAOxkl8gQbWscbpo72g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-MswMTbaqMuyp9qgRjPclcA-1; Thu, 02 Mar 2023 11:36:11 -0500
X-MC-Unique: MswMTbaqMuyp9qgRjPclcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4EF785CBE7;
 Thu,  2 Mar 2023 16:36:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD586492C3E;
 Thu,  2 Mar 2023 16:36:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 35/43] migration: Create migrate_downtime_limit() function
Date: Thu,  2 Mar 2023 17:34:02 +0100
Message-Id: <20230302163410.11399-36-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/options.h   | 1 +
 migration/migration.c | 4 ++--
 migration/options.c   | 7 +++++++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/migration/options.h b/migration/options.h
index c7c9a4002b..10a59b1172 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -73,6 +73,7 @@ uint8_t migrate_cpu_throttle_increment(void);
 uint8_t migrate_cpu_throttle_initial(void);
 bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
+uint64_t migrate_downtime_limit(void);
 uint8_t migrate_max_cpu_throttle(void);
 uint64_t migrate_max_bandwidth(void);
 int64_t migrate_max_postcopy_bandwidth(void);
diff --git a/migration/migration.c b/migration/migration.c
index 62a6f29647..9db8e09462 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2733,7 +2733,7 @@ static void migration_update_counters(MigrationState *s,
     transferred = current_bytes - s->iteration_initial_bytes;
     time_spent = current_time - s->iteration_start_time;
     bandwidth = (double)transferred / time_spent;
-    s->threshold_size = bandwidth * s->parameters.downtime_limit;
+    s->threshold_size = bandwidth * migrate_downtime_limit();
 
     s->mbps = (((double) transferred * 8.0) /
                ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
@@ -3240,7 +3240,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
      */
     migrate_error_free(s);
 
-    s->expected_downtime = s->parameters.downtime_limit;
+    s->expected_downtime = migrate_downtime_limit();
     if (resume) {
         assert(s->cleanup_bh);
     } else {
diff --git a/migration/options.c b/migration/options.c
index 350cd24e28..6034443cee 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -519,6 +519,13 @@ int migrate_decompress_threads(void)
     return s->parameters.decompress_threads;
 }
 
+uint64_t migrate_downtime_limit(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.downtime_limit;
+}
+
 uint8_t migrate_max_cpu_throttle(void)
 {
     MigrationState *s = migrate_get_current();
-- 
2.39.2


