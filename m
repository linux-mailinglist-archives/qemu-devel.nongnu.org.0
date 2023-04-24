Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FBB6ECADA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:02:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtxJ-0006R3-W6; Mon, 24 Apr 2023 07:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxG-0006Ma-0f
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqtxE-00006p-FW
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682334115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Onh57vrnmdF/fkaMzeSarm7LYi+lYdgF6rW+lcbE5rM=;
 b=eoU33PkPZ9zeS+dedFeUBd3WtV7Nt5tL9m+bkfnJSgwDYDhqwatFXRYHmv0+ZJb311A3Hx
 hfci0CVm4xBeuu+GL1hvHxSg0qkcXIX6glvLKK3vGe2zsyf76BVfE5HbdLmpH0m/rYwl4R
 t08Zyzu8+80cTTGpv1cQbSCRBdPE3EY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-WVaKmXK0ODqLhXtUFXrzNQ-1; Mon, 24 Apr 2023 07:01:54 -0400
X-MC-Unique: WVaKmXK0ODqLhXtUFXrzNQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B55E7877CD0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 11:01:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4ED2492C13;
 Mon, 24 Apr 2023 11:01:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 09/17] migration: Make postcopy_requests atomic
Date: Mon, 24 Apr 2023 13:01:11 +0200
Message-Id: <20230424110119.68520-10-quintela@redhat.com>
In-Reply-To: <20230424110119.68520-1-quintela@redhat.com>
References: <20230424110119.68520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
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
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 3 ++-
 migration/ram.c       | 2 +-
 migration/ram.h       | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

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
index 3c13136559..fe69ecaef4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2169,7 +2169,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
     RAMBlock *ramblock;
     RAMState *rs = ram_state;
 
-    ram_counters.postcopy_requests++;
+    stat64_add(&ram_counters.postcopy_requests, 1);
     RCU_READ_LOCK_GUARD();
 
     if (!rbname) {
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
-- 
2.39.2


