Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF2563A5AB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozb0G-0002wO-Nf; Mon, 28 Nov 2022 05:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb0A-0002vx-Uh
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozb09-0002nl-CL
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669629876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4x9Uc2O/YYSWgQHdej6oltF+w7KQbdQhTCdYRbP0kk=;
 b=YSWrO9Sfev70SbaX9qtKcQ88gt3QL59jSzJFA5f6FL4TzE12XHaMpxJxmhcJCf8wcxzkiX
 knhuOy3s9FUIKB2x2sVb22mXywK31OoOgLRic7MNKkI4SpW3WlvhDzJ6xrOB5CFEAVdptv
 xrg2YWfwJdhoHWWO6URIaB4pIcP8u80=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-vHcCkMmcP0W6WyqiGZVYsQ-1; Mon, 28 Nov 2022 05:04:31 -0500
X-MC-Unique: vHcCkMmcP0W6WyqiGZVYsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7BEC1C05137;
 Mon, 28 Nov 2022 10:04:30 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FDDE2028CE4;
 Mon, 28 Nov 2022 10:04:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/11] migration: Make multifd_bytes atomic
Date: Mon, 28 Nov 2022 11:04:13 +0100
Message-Id: <20221128100422.13522-3-quintela@redhat.com>
In-Reply-To: <20221128100422.13522-1-quintela@redhat.com>
References: <20221128100422.13522-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.h       | 1 +
 migration/migration.c | 4 ++--
 migration/multifd.c   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 81cbb0947c..3c1de6aedf 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -50,6 +50,7 @@ typedef struct {
     Stat64 duplicate;
     Stat64 normal;
     Stat64 postcopy_bytes;
+    Stat64 multifd_bytes;
 } MigrationAtomicStats;
 
 extern MigrationAtomicStats ram_atomic_counters;
diff --git a/migration/migration.c b/migration/migration.c
index c3490c495d..d5733b7c03 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1062,7 +1062,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
             ram_counters.dirty_sync_missed_zero_copy;
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
-    info->ram->multifd_bytes = ram_counters.multifd_bytes;
+    info->ram->multifd_bytes = stat64_get(&ram_atomic_counters.multifd_bytes);
     info->ram->pages_per_second = s->pages_per_second;
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
@@ -3667,7 +3667,7 @@ static MigThrError migration_detect_error(MigrationState *s)
 static uint64_t migration_total_bytes(MigrationState *s)
 {
     return qemu_file_total_transferred(s->to_dst_file) +
-        ram_counters.multifd_bytes;
+        stat64_get(&ram_atomic_counters.multifd_bytes);
 }
 
 static void migration_calculate_complete(MigrationState *s)
diff --git a/migration/multifd.c b/migration/multifd.c
index 20a81cd7f2..49fa76e5e1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -431,8 +431,8 @@ static int multifd_send_pages(QEMUFile *f)
     p->pages = pages;
     transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
     qemu_file_acct_rate_limit(f, transferred);
-    ram_counters.multifd_bytes += transferred;
     qemu_mutex_unlock(&p->mutex);
+    stat64_add(&ram_atomic_counters.multifd_bytes, transferred);
     stat64_add(&ram_atomic_counters.transferred, transferred);
     qemu_sem_post(&p->sem);
 
@@ -623,8 +623,8 @@ int multifd_send_sync_main(QEMUFile *f)
         p->flags |= MULTIFD_FLAG_SYNC;
         p->pending_job++;
         qemu_file_acct_rate_limit(f, p->packet_len);
-        ram_counters.multifd_bytes += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
+        stat64_add(&ram_atomic_counters.multifd_bytes, p->packet_len);
         stat64_add(&ram_atomic_counters.transferred, p->packet_len);
         qemu_sem_post(&p->sem);
 
-- 
2.38.1


