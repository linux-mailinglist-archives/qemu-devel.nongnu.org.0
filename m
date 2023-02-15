Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74939698533
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSO2i-0003Pl-CJ; Wed, 15 Feb 2023 15:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO2g-0003Mb-A7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSO2e-0006bD-Dr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676491571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYWILZNDRqRKAPG1wFGutXoZk8C18/1z3YfLEmfdUf8=;
 b=ah0DD7NqDb/k69dicJFg0OOZm8YxWLoJbbYu4AYefaxfGNgIrA3eXdM9YL244VGg+UVGvH
 xd1GsaRNyfYAu0ID2bMZyque7s86mx3C9UKBOe1V9ErHQKpVoRwaJIfAdOjI2FmvpLn5Cn
 xzEdevutlIz3dpNYfxjmV3spCAq0a2o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-7Kmbm_9hOQuBVXrSHfozIw-1; Wed, 15 Feb 2023 15:06:06 -0500
X-MC-Unique: 7Kmbm_9hOQuBVXrSHfozIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE0FD1C08976;
 Wed, 15 Feb 2023 20:06:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77211C15BAD;
 Wed, 15 Feb 2023 20:06:02 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-s390x@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 2/5] migration/block: Convert remaining DPRINTF() debug macro
 to trace events
Date: Wed, 15 Feb 2023 21:05:51 +0100
Message-Id: <20230215200554.1365-3-quintela@redhat.com>
In-Reply-To: <20230215200554.1365-1-quintela@redhat.com>
References: <20230215200554.1365-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Finish the conversion from commit fe80c0241d
("migration: using trace_ to replace DPRINTF").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/block.c      | 12 +-----------
 migration/trace-events |  1 +
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 29f69025af..b5ce506d01 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -42,16 +42,6 @@
 #define MAX_IO_BUFFERS 512
 #define MAX_PARALLEL_IO 16
 
-/* #define DEBUG_BLK_MIGRATION */
-
-#ifdef DEBUG_BLK_MIGRATION
-#define DPRINTF(fmt, ...) \
-    do { printf("blk_migration: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 typedef struct BlkMigDevState {
     /* Written during setup phase.  Can be read without a lock.  */
     BlockBackend *blk;
@@ -502,7 +492,7 @@ static int blk_mig_save_bulked_block(QEMUFile *f)
         block_mig_state.prev_progress = progress;
         qemu_put_be64(f, (progress << BDRV_SECTOR_BITS)
                          | BLK_MIG_FLAG_PROGRESS);
-        DPRINTF("Completed %d %%\r", progress);
+        trace_migration_block_progression(progress);
     }
 
     return ret;
diff --git a/migration/trace-events b/migration/trace-events
index 67b65a70ff..b20e1271bc 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -357,6 +357,7 @@ migration_block_flush_blks(const char *action, int submitted, int read_done, int
 migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
 migration_block_save_complete(void) "Block migration completed"
 migration_block_state_pending(uint64_t pending) "Enter save live pending  %" PRIu64
+migration_block_progression(unsigned percent) "Completed %u%%"
 
 # page_cache.c
 migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
-- 
2.39.1


