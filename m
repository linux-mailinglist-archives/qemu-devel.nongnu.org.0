Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC76F1EB1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTWb-0004yE-Hc; Fri, 28 Apr 2023 15:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWR-0004xM-Lv
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psTWQ-00032d-4y
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682709165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODr1+q+whZ7g0He07Wyb5qTASgn+dGPdmIiuYcQElcM=;
 b=Raz8w0f6cqYK5rDyZ66AqtxoyKCCSES7wJAwexTh9SMc6p0TRX/2BLjCDh2t+ZEnzxumm5
 evm2CMsVZh0zVUJO2hJtm0aQ9zNtLDkhggLjOngMX0AUeL3vf/0Kvtcl8CUXFFr1SkTMxD
 CFO5OuP0wUvT1/AXPlo/5UPoP08ouCA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-n7pJJhklM0Wda0AmD0PrVw-1; Fri, 28 Apr 2023 15:12:42 -0400
X-MC-Unique: n7pJJhklM0Wda0AmD0PrVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F23EC1C06911;
 Fri, 28 Apr 2023 19:12:41 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96A5D2166BA0;
 Fri, 28 Apr 2023 19:12:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 21/21] migration: Initialize and cleanup decompression in
 migration.c
Date: Fri, 28 Apr 2023 21:12:03 +0200
Message-Id: <20230428191203.39520-22-quintela@redhat.com>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Lukas Straub <lukasstraub2@web.de>

This fixes compress with colo.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 9 +++++++++
 migration/ram.c       | 5 -----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index feb5ab7493..11f5a2dd6f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpu-throttle.h"
 #include "rdma.h"
 #include "ram.h"
+#include "ram-compress.h"
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "migration.h"
@@ -228,6 +229,7 @@ void migration_incoming_state_destroy(void)
     struct MigrationIncomingState *mis = migration_incoming_get_current();
 
     multifd_load_cleanup();
+    compress_threads_load_cleanup();
 
     if (mis->to_src_file) {
         /* Tell source that we are done */
@@ -500,6 +502,12 @@ process_incoming_migration_co(void *opaque)
     Error *local_err = NULL;
 
     assert(mis->from_src_file);
+
+    if (compress_threads_load_setup(mis->from_src_file)) {
+        error_report("Failed to setup decompress threads");
+        goto fail;
+    }
+
     mis->migration_incoming_co = qemu_coroutine_self();
     mis->largest_page_size = qemu_ram_pagesize_largest();
     postcopy_state_set(POSTCOPY_INCOMING_NONE);
@@ -565,6 +573,7 @@ fail:
     qemu_fclose(mis->from_src_file);
 
     multifd_load_cleanup();
+    compress_threads_load_cleanup();
 
     exit(EXIT_FAILURE);
 }
diff --git a/migration/ram.c b/migration/ram.c
index a5bd943cc6..1f664fa071 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3558,10 +3558,6 @@ void colo_release_ram_cache(void)
  */
 static int ram_load_setup(QEMUFile *f, void *opaque)
 {
-    if (compress_threads_load_setup(f)) {
-        return -1;
-    }
-
     xbzrle_load_setup();
     ramblock_recv_map_init();
 
@@ -3577,7 +3573,6 @@ static int ram_load_cleanup(void *opaque)
     }
 
     xbzrle_load_cleanup();
-    compress_threads_load_cleanup();
 
     RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
         g_free(rb->receivedmap);
-- 
2.40.0


