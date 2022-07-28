Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A2583E58
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:09:34 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2Kb-0003yQ-71
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Be-0001Yi-L6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Bc-0001xl-R6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuYKXod9meK5/3kuBVMs3EAPF/cb5AdSc/xEpwKg5J0=;
 b=OlHOykj+Nwiv61g5N7cc6fKJ1fzw9WYFZhxohIHgD49h77eP8K1XRV1RTDVVq1Ac2T1Dz6
 V+7tqkBx6lnEroZ+6S3dkD7bhOs/AMgz7oorKz7fK6/TzWXWkethYJTDFkNvaMg/WXABiO
 WGnZTTB2kRxjaqDfSnt/xPt8fwotxoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-6E4Jy28mNCSdoVZ_IESdOw-1; Thu, 28 Jul 2022 08:00:11 -0400
X-MC-Unique: 6E4Jy28mNCSdoVZ_IESdOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DECF811E76;
 Thu, 28 Jul 2022 12:00:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1BF594561;
 Thu, 28 Jul 2022 12:00:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 5/6] multifd: Only sync once each full round of memory
Date: Thu, 28 Jul 2022 13:59:56 +0200
Message-Id: <20220728115957.5554-6-quintela@redhat.com>
In-Reply-To: <20220728115957.5554-1-quintela@redhat.com>
References: <20220728115957.5554-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to add a new flag to mean to sync at that point.
Notice that we still synchronize at the end of setup and at the end of
complete stages.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Add missing qemu_fflush(), now it passes all tests always.
---
 migration/migration.c |  2 +-
 migration/ram.c       | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ebca4f2d8a..7905145d7d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4393,7 +4393,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
     /* We will change to false when we introduce the new mechanism */
     DEFINE_PROP_BOOL("multifd-sync-after-each-section", MigrationState,
-                      multifd_sync_after_each_section, true),
+                      multifd_sync_after_each_section, false),
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
     DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
diff --git a/migration/ram.c b/migration/ram.c
index 1507ba1991..234603ee4f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -82,6 +82,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
 
 XBZRLECacheStats xbzrle_counters;
 
@@ -1540,6 +1541,7 @@ retry:
  * associated with the search process.
  *
  * Returns:
+ *         <0: An error happened
  *         PAGE_ALL_CLEAN: no dirty page found, give up
  *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
  *         PAGE_DIRTY_FOUND: dirty page found
@@ -1572,6 +1574,14 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
         pss->page = 0;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
         if (!pss->block) {
+            if (!migrate_multifd_sync_after_each_section()) {
+                int ret = multifd_send_sync_main(rs->f);
+                if (ret < 0) {
+                    return ret;
+                }
+                qemu_put_be64(rs->f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+                qemu_fflush(rs->f);
+            }
             /*
              * If memory migration starts over, we will meet a dirtied page
              * which may still exists in compression threads's ring, so we
@@ -2556,6 +2566,9 @@ static int ram_find_and_save_block(RAMState *rs)
                         break;
                     } else if (res == PAGE_TRY_AGAIN) {
                         continue;
+                    } else if (res < 0) {
+                        pages = res;
+                        break;
                     }
                 }
             }
@@ -3232,6 +3245,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3419,6 +3436,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -4087,7 +4107,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
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
@@ -4367,6 +4389,9 @@ static int ram_load_precopy(QEMUFile *f)
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
2.37.1


