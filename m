Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7156ED494
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 20:39:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0zz-0000LN-09; Mon, 24 Apr 2023 14:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zq-0000Hd-Fg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pr0zd-0005eH-CR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 14:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682361172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bzvrHL2lSkXlgGLZ3P+hwNCeRaERrJG0E6SXlHzB1w=;
 b=BDm4qC8H1t8v83ME42vix/PRZR5nrdkLZIRXjyarmGVTj5y1GX6bBuK0zyGxMiQQl5qyRn
 uH/yltVHYjYbaYlsmdaLiibm1+gYTcpCqj6EWiEY64YUYSvhInTkcNkr2SvuzEz8s4yhku
 nlrUboG6Md8PO5hvT+sEL/2isVb9ipE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-QaANzqdrNj6PNzO3n9SHhQ-1; Mon, 24 Apr 2023 14:32:49 -0400
X-MC-Unique: QaANzqdrNj6PNzO3n9SHhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1689F299E747;
 Mon, 24 Apr 2023 18:32:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75DE3C15BA0;
 Mon, 24 Apr 2023 18:32:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Juan Quintela <quintela@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 05/13] migration: Create migrate_downtime_limit() function
Date: Mon, 24 Apr 2023 20:32:28 +0200
Message-Id: <20230424183236.74561-6-quintela@redhat.com>
In-Reply-To: <20230424183236.74561-1-quintela@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 4 ++--
 migration/options.c   | 7 +++++++
 migration/options.h   | 1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 45fc5be93a..ee8e9416ce 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2737,7 +2737,7 @@ static void migration_update_counters(MigrationState *s,
     transferred = current_bytes - s->iteration_initial_bytes;
     time_spent = current_time - s->iteration_start_time;
     bandwidth = (double)transferred / time_spent;
-    s->threshold_size = bandwidth * s->parameters.downtime_limit;
+    s->threshold_size = bandwidth * migrate_downtime_limit();
 
     s->mbps = (((double) transferred * 8.0) /
                ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
@@ -3244,7 +3244,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
      */
     migrate_error_free(s);
 
-    s->expected_downtime = s->parameters.downtime_limit;
+    s->expected_downtime = migrate_downtime_limit();
     if (resume) {
         assert(s->cleanup_bh);
     } else {
diff --git a/migration/options.c b/migration/options.c
index bf4efd6ad4..ba854f613f 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -515,6 +515,13 @@ int migrate_decompress_threads(void)
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
diff --git a/migration/options.h b/migration/options.h
index 86bcbb738c..e982103c0d 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -71,6 +71,7 @@ uint8_t migrate_cpu_throttle_increment(void);
 uint8_t migrate_cpu_throttle_initial(void);
 bool migrate_cpu_throttle_tailslow(void);
 int migrate_decompress_threads(void);
+uint64_t migrate_downtime_limit(void);
 uint8_t migrate_max_cpu_throttle(void);
 uint64_t migrate_max_bandwidth(void);
 int64_t migrate_max_postcopy_bandwidth(void);
-- 
2.39.2


