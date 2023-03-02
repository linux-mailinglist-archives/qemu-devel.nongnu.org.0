Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59A6A8639
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:22:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlgk-0004na-Ru; Thu, 02 Mar 2023 11:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlgh-0004lD-Uo
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlgf-0003X5-BU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMtmC+W/5UN9EzDVPNHRf6HynmGhkOxnhqiG4FMRsxs=;
 b=cfxwjVMy1Qw2q8aaIX3bAdE7jQ1SFDRq/CfgY4dvTdWbPoMorh7LlFCvVNKwQhEXWTFHzo
 lR8/PLpZ+Q1y5a0W2zDPqYJ6MsWF3rUoSZYW0u53RBfcOb4cyE/mA2UDxOQJiQBNLu12gT
 sFZcxFqy3tGYbodT6n0uSgMC9n5pBPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-RDdp8HBdM7mQ0ra5kVXhkQ-1; Thu, 02 Mar 2023 11:21:43 -0500
X-MC-Unique: RDdp8HBdM7mQ0ra5kVXhkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB3F088282D;
 Thu,  2 Mar 2023 16:21:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B2301121315;
 Thu,  2 Mar 2023 16:21:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>
Subject: [PATCH v2 3/3] migration: Make multifd_bytes atomic
Date: Thu,  2 Mar 2023 17:21:38 +0100
Message-Id: <20230302162138.10076-4-quintela@redhat.com>
In-Reply-To: <20230302162138.10076-1-quintela@redhat.com>
References: <20230302162138.10076-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the spirit of:

commit 394d323bc3451e4d07f13341cb8817fac8dfbadd
Author: Peter Xu <peterx@redhat.com>
Date:   Tue Oct 11 17:55:51 2022 -0400

    migration: Use atomic ops properly for page accountings

Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       | 2 +-
 migration/migration.c | 4 ++--
 migration/multifd.c   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 64fb92ccd4..6a3498c732 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -45,11 +45,11 @@ typedef struct {
     Stat64 duplicate;
     Stat64 normal;
     Stat64 postcopy_bytes;
+    Stat64 multifd_bytes;
     int64_t remaining;
     int64_t dirty_pages_rate;
     int64_t dirty_sync_count;
     int64_t postcopy_requests;
-    uint64_t multifd_bytes;
     uint64_t precopy_bytes;
     uint64_t downtime_bytes;
     uint64_t dirty_sync_missed_zero_copy;
diff --git a/migration/migration.c b/migration/migration.c
index 923f4762f4..ca52c8aab3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1153,7 +1153,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
             ram_counters.dirty_sync_missed_zero_copy;
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
-    info->ram->multifd_bytes = ram_counters.multifd_bytes;
+    info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
@@ -3774,7 +3774,7 @@ static MigThrError migration_detect_error(MigrationState *s)
 static uint64_t migration_total_bytes(MigrationState *s)
 {
     return qemu_file_total_transferred(s->to_dst_file) +
-        ram_counters.multifd_bytes;
+        stat64_get(&ram_counters.multifd_bytes);
 }
 
 static void migration_calculate_complete(MigrationState *s)
diff --git a/migration/multifd.c b/migration/multifd.c
index f558169e37..91552d33bf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -432,9 +432,9 @@ static int multifd_send_pages(QEMUFile *f)
     p->pages = pages;
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
-    ram_counters.multifd_bytes += transferred;
     qemu_mutex_unlock(&p->mutex);
     stat64_add(&ram_counters.transferred, transferred);
+    stat64_add(&ram_counters.multifd_bytes, transferred);
     qemu_sem_post(&p->sem);
 
     return 1;
@@ -627,9 +627,9 @@ int multifd_send_sync_main(QEMUFile *f)
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
-        ram_counters.multifd_bytes += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         stat64_add(&ram_counters.transferred, p->packet_len);
+        stat64_add(&ram_counters.multifd_bytes, p->packet_len);
         qemu_sem_post(&p->sem);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
2.39.2


