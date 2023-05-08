Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72A6FB0FE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0eO-0006hM-Bk; Mon, 08 May 2023 09:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0e0-0004cl-95
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0db-00019Y-Sv
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk+T4+c1clYy4lrV9FOJAderCO0LRvuls5DTHUJl6e0=;
 b=crwj02IYDMvTqfRSuKIjHm7z/tZoITj5IQGOKfWfV3bsgRQOb+/GOGHE9/LLbIUYTcW9gI
 zxAfTEkSSKh+IqBiuTMfG88qqhmqf9+7tqPucWQSNdZQQqVjnVWZMNH/1OIvfLGy8r7v+B
 A1ryENZRryVs4Q5RpJKiiEs36N1pENk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-m-VIvm6aMayeOCN346prGw-1; Mon, 08 May 2023 09:10:36 -0400
X-MC-Unique: m-VIvm6aMayeOCN346prGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC0F880080E;
 Mon,  8 May 2023 13:10:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A1EC2166B40;
 Mon,  8 May 2023 13:10:31 +0000 (UTC)
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
Subject: [PATCH 13/21] migration: Use migration_transferred_bytes() to
 calculate rate_limit
Date: Mon,  8 May 2023 15:09:01 +0200
Message-Id: <20230508130909.65420-14-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration-stats.c | 7 +++++--
 migration/migration-stats.h | 6 +++++-
 migration/migration.c       | 2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/migration/migration-stats.c b/migration/migration-stats.c
index 46b2b0d06e..eb1a2c1ad4 100644
--- a/migration/migration-stats.c
+++ b/migration/migration-stats.c
@@ -31,7 +31,9 @@ bool migration_rate_limit_exceeded(QEMUFile *f)
         return true;
     }
 
-    uint64_t rate_limit_used = stat64_get(&mig_stats.rate_limit_used);
+    uint64_t rate_limit_start = stat64_get(&mig_stats.rate_limit_start);
+    uint64_t rate_limit_current = migration_transferred_bytes(f);
+    uint64_t rate_limit_used = rate_limit_current - rate_limit_start;
     uint64_t rate_limit_max = stat64_get(&mig_stats.rate_limit_max);
     /*
      *  rate_limit_max == 0 means no rate_limit enfoncement.
@@ -55,9 +57,10 @@ void migration_rate_limit_set(uint64_t limit)
     stat64_set(&mig_stats.rate_limit_max, limit);
 }
 
-void migration_rate_limit_reset(void)
+void migration_rate_limit_reset(QEMUFile *f)
 {
     stat64_set(&mig_stats.rate_limit_used, 0);
+    stat64_set(&mig_stats.rate_limit_start, migration_transferred_bytes(f));
 }
 
 void migration_rate_limit_account(uint64_t len)
diff --git a/migration/migration-stats.h b/migration/migration-stats.h
index c82fce9608..4029f1deab 100644
--- a/migration/migration-stats.h
+++ b/migration/migration-stats.h
@@ -69,6 +69,10 @@ typedef struct {
      * Number of bytes sent during precopy stage.
      */
     Stat64 precopy_bytes;
+    /*
+     * Amount of transferred data at the start of current cycle.
+     */
+    Stat64 rate_limit_start;
     /*
      * Maximum amount of data we can send in a cycle.
      */
@@ -126,7 +130,7 @@ uint64_t migration_rate_limit_get(void);
  *
  * This is called when we know we start a new transfer cycle.
  */
-void migration_rate_limit_reset(void);
+void migration_rate_limit_reset(QEMUFile *f);
 
 /**
  * migration_rate_limit_set: Set the maximum amount that can be transferred.
diff --git a/migration/migration.c b/migration/migration.c
index e6d262ffe1..6922c612e4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2684,7 +2684,7 @@ static void migration_update_counters(MigrationState *s,
             stat64_get(&mig_stats.dirty_bytes_last_sync) / bandwidth;
     }
 
-    migration_rate_limit_reset();
+    migration_rate_limit_reset(s->to_dst_file);
 
     update_iteration_initial_status(s);
 
-- 
2.40.0


