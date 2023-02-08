Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076DA68EFC8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkXA-0000mM-GI; Wed, 08 Feb 2023 08:30:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWs-0000YW-Ke
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPkWq-0007DI-80
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675863027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/9pYm8MfxHu9zrfNbeJYEzl/R1JQaYzxF7tVs+YzhQ=;
 b=Unkd+nk523pq9VCdp07BBTOY2pXw+593vNeN1HAJR7jtXlVYtwxBtsihINR2Ou0PJ8uGa5
 g2u2IL9UfuOcpgPUhb8C42atnmbvTsWteNdnX0MWNuDntQXacJ9mF25vVZEYwNx50LHoaZ
 YOTHUcsAEtzfBJLBs8/K2r/T4z+8zdU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-98HmpsyUOCKCbqi52viDSg-1; Wed, 08 Feb 2023 08:30:26 -0500
X-MC-Unique: 98HmpsyUOCKCbqi52viDSg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F156C38173C5;
 Wed,  8 Feb 2023 13:30:25 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 420AEC15BA0;
 Wed,  8 Feb 2023 13:30:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 5/6] multifd: Only sync once each full round of memory
Date: Wed,  8 Feb 2023 14:30:09 +0100
Message-Id: <20230208133010.17323-6-quintela@redhat.com>
In-Reply-To: <20230208133010.17323-1-quintela@redhat.com>
References: <20230208133010.17323-1-quintela@redhat.com>
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

We need to add a new flag to mean to sync at that point.
Notice that we still synchronize at the end of setup and at the end of
complete stages.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Add missing qemu_fflush(), now it passes all tests always.
---
 migration/migration.c |  2 --
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index cf02295765..cf4dfb0072 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2680,8 +2680,6 @@ bool migrate_multifd_sync_after_each_section(void)
 {
     MigrationState *s = migrate_get_current();
 
-    return true;
-    // We will change this when code gets in.
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index e05503f825..7952d5f01c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -82,6 +82,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
 
 XBZRLECacheStats xbzrle_counters;
 
@@ -1554,6 +1555,7 @@ retry:
  * associated with the search process.
  *
  * Returns:
+ *         <0: An error happened
  *         PAGE_ALL_CLEAN: no dirty page found, give up
  *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
  *         PAGE_DIRTY_FOUND: dirty page found
@@ -1581,6 +1583,15 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
         pss->page = 0;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
         if (!pss->block) {
+            if (!migrate_multifd_sync_after_each_section()) {
+                QEMUFile *f = rs->pss[RAM_CHANNEL_PRECOPY].pss_channel;
+                int ret = multifd_send_sync_main(f);
+                if (ret < 0) {
+                    return ret;
+                }
+                qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+                qemu_fflush(f);
+            }
             /*
              * If memory migration starts over, we will meet a dirtied page
              * which may still exists in compression threads's ring, so we
@@ -2573,6 +2584,9 @@ static int ram_find_and_save_block(RAMState *rs)
                     break;
                 } else if (res == PAGE_TRY_AGAIN) {
                     continue;
+                } else if (res < 0) {
+                    pages = res;
+                    break;
                 }
             }
         }
@@ -3250,6 +3264,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3436,6 +3454,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -4120,7 +4141,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
             }
             decompress_data_with_multi_threads(f, page_buffer, len);
             break;
-
+        case RAM_SAVE_FLAG_MULTIFD_SYNC:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_sync_after_each_section()) {
@@ -4394,6 +4417,9 @@ static int ram_load_precopy(QEMUFile *f)
                 break;
             }
             break;
+        case RAM_SAVE_FLAG_MULTIFD_SYNC:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_sync_after_each_section()) {
-- 
2.39.1


