Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E76E7F8D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:25:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbf-0000YB-GQ; Wed, 19 Apr 2023 12:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAba-0000XS-Cy
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbY-0008E4-V9
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsDG2E/frgQwEevwdrvRlNa3eZnaPjMHmNCGRZX3XSI=;
 b=EiKekZrMDsQCqZX8qhT/RQwiiDXMiuoc8DxlinZR8hVMT8xP5sy2MuseUkD9LhTd4zU/vU
 gReY/KSgq6MgwPrd9WO69uJpL7gJT481wDJB1USsDaZ7jq3KM99U0NVBH2Ose8b1e12r5R
 zjjoDIupgO19mZotw0BIhhNO9+gCwBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-eGH5ukFdOb2QKB1rcKXg-Q-1; Wed, 19 Apr 2023 12:24:22 -0400
X-MC-Unique: eGH5ukFdOb2QKB1rcKXg-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 428D710146EE
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 767D91121314;
 Wed, 19 Apr 2023 16:24:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 04/12] migration: Make dirty_sync_missed_zero_copy atomic
Date: Wed, 19 Apr 2023 18:24:07 +0200
Message-Id: <20230419162415.16260-5-quintela@redhat.com>
In-Reply-To: <20230419162415.16260-1-quintela@redhat.com>
References: <20230419162415.16260-1-quintela@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 migration/ram.h       | 4 +---
 migration/migration.c | 2 +-
 migration/multifd.c   | 2 +-
 migration/ram.c       | 5 -----
 4 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index ed70391317..2170c55e67 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -43,7 +43,7 @@
 typedef struct {
     int64_t dirty_pages_rate;
     int64_t dirty_sync_count;
-    uint64_t dirty_sync_missed_zero_copy;
+    Stat64 dirty_sync_missed_zero_copy;
     uint64_t downtime_bytes;
     Stat64 duplicate;
     Stat64 multifd_bytes;
@@ -114,6 +114,4 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
-void dirty_sync_missed_zero_copy(void);
-
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index c3debe71f6..66e5197b77 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1150,7 +1150,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
     info->ram->dirty_sync_missed_zero_copy =
-            ram_counters.dirty_sync_missed_zero_copy;
+        stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
diff --git a/migration/multifd.c b/migration/multifd.c
index 1c992abf53..903df2117b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -576,7 +576,7 @@ static int multifd_zero_copy_flush(QIOChannel *c)
         return -1;
     }
     if (ret == 1) {
-        dirty_sync_missed_zero_copy();
+        stat64_add(&ram_counters.dirty_sync_missed_zero_copy, 1);
     }
 
     return ret;
diff --git a/migration/ram.c b/migration/ram.c
index 95ba5ea0c5..72e3d78589 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -472,11 +472,6 @@ void ram_transferred_add(uint64_t bytes)
     stat64_add(&ram_counters.transferred, bytes);
 }
 
-void dirty_sync_missed_zero_copy(void)
-{
-    ram_counters.dirty_sync_missed_zero_copy++;
-}
-
 struct MigrationOps {
     int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
 };
-- 
2.39.2


