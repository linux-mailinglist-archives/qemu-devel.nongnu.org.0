Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28A6E7F99
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:26:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAbi-0000bQ-8T; Wed, 19 Apr 2023 12:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbe-0000YE-7m
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppAbc-0008F2-Ri
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681921468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oa9scpZGQykHfaaH/GTNyys8hMeHjQmpuuDLILcUghs=;
 b=DoJQ4PQld9cRX8bNfbuvXolnB8cMChtee1eMmCYNQy0RBHaPwLVtALkZusk0wQ98dFKMLi
 a+qmLLrjUQIzGhNCHU5FBv/6oTHVtR5q8V2/H3zId23jizDzm+GSG3PY7Yq2UkqllTunTB
 YIAcUhUfcALZAjLwj4GRDFtNT2nw9R8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Br7_dBd2OWaU2o86bMhsDQ-1; Wed, 19 Apr 2023 12:24:26 -0400
X-MC-Unique: Br7_dBd2OWaU2o86bMhsDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97219381D4C8
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 16:24:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C92221121318;
 Wed, 19 Apr 2023 16:24:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v3 08/12] migration: Make postcopy_requests atomic
Date: Wed, 19 Apr 2023 18:24:11 +0200
Message-Id: <20230419162415.16260-9-quintela@redhat.com>
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
 migration/ram.h       | 2 +-
 migration/migration.c | 3 ++-
 migration/ram.c       | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/ram.h b/migration/ram.h
index 8c0d07c43a..afa68521d7 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -49,7 +49,7 @@ typedef struct {
     Stat64 multifd_bytes;
     Stat64 normal;
     Stat64 postcopy_bytes;
-    int64_t postcopy_requests;
+    Stat64 postcopy_requests;
     Stat64 precopy_bytes;
     int64_t remaining;
     Stat64 transferred;
diff --git a/migration/migration.c b/migration/migration.c
index 97c227aa85..09b37a6603 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1152,7 +1152,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
         stat64_get(&ram_counters.dirty_sync_count);
     info->ram->dirty_sync_missed_zero_copy =
         stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
-    info->ram->postcopy_requests = ram_counters.postcopy_requests;
+    info->ram->postcopy_requests =
+        stat64_get(&ram_counters.postcopy_requests);
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
     info->ram->pages_per_second = s->pages_per_second;
diff --git a/migration/ram.c b/migration/ram.c
index b391546020..b4aa07118a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2169,7 +2169,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
     RAMBlock *ramblock;
     RAMState *rs = ram_state;
 
-    ram_counters.postcopy_requests++;
+    stat64_add(&ram_counters.postcopy_requests, 1);
     RCU_READ_LOCK_GUARD();
 
     if (!rbname) {
-- 
2.39.2


