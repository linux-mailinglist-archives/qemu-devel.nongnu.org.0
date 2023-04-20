Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1B6E95B5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:22:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUB5-0001dv-5B; Thu, 20 Apr 2023 09:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAn-0001UO-It
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUAl-0005dM-Lb
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681996682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cT9l59Y4GSadWstb/Go/h8p2mUI+dL2YBlwxDVEEcfI=;
 b=K3l9n0W2A3ch3v7HWIdUY4ZoqmCWI2ymMmLWxhaEG5GdaFKiyMvRPHX2Y3P3sOfXlLu/gG
 d6yQdZJJ70f8WbLaKdweoY/3GzDum4JG2ce0Di1M8aE4N0bJNEC/28PZ2g/xutm6pgjBXY
 KIFJvIuAbADlKB8zifSpY/bk2ojLIps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-ifQBww58NZaSfPljLEqIWw-1; Thu, 20 Apr 2023 09:18:01 -0400
X-MC-Unique: ifQBww58NZaSfPljLEqIWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09530101A557
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:18:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A1A5C16024;
 Thu, 20 Apr 2023 13:18:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 07/20] migration: Make precopy_bytes atomic
Date: Thu, 20 Apr 2023 15:17:38 +0200
Message-Id: <20230420131751.28534-8-quintela@redhat.com>
In-Reply-To: <20230420131751.28534-1-quintela@redhat.com>
References: <20230420131751.28534-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 2 +-
 migration/ram.c       | 2 +-
 migration/ram.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 66e5197b77..cbd6f6f235 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1155,7 +1155,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
     info->ram->pages_per_second = s->pages_per_second;
-    info->ram->precopy_bytes = ram_counters.precopy_bytes;
+    info->ram->precopy_bytes = stat64_get(&ram_counters.precopy_bytes);
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
     info->ram->postcopy_bytes = stat64_get(&ram_counters.postcopy_bytes);
 
diff --git a/migration/ram.c b/migration/ram.c
index 93e0a48af4..0b4693215e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -463,7 +463,7 @@ RAMStats ram_counters;
 void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
-        ram_counters.precopy_bytes += bytes;
+        stat64_add(&ram_counters.precopy_bytes, bytes);
     } else if (migration_in_postcopy()) {
         stat64_add(&ram_counters.postcopy_bytes, bytes);
     } else {
diff --git a/migration/ram.h b/migration/ram.h
index 2170c55e67..a766b895fa 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -50,7 +50,7 @@ typedef struct {
     Stat64 normal;
     Stat64 postcopy_bytes;
     int64_t postcopy_requests;
-    uint64_t precopy_bytes;
+    Stat64 precopy_bytes;
     int64_t remaining;
     Stat64 transferred;
 } RAMStats;
-- 
2.39.2


