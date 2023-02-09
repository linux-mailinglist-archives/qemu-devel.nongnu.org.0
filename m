Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31766914BC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 00:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQGU9-0002Le-81; Thu, 09 Feb 2023 18:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU6-0002Hv-HP
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQGU3-0007fR-KO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 18:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675985862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VtYgSFYuL65BZjhUmpjkj4gvldPqTJ/e4USBQlgQAt0=;
 b=byfydeambhNWgLtg37aFzdBom4+7T8FwZpBVUE6mAKTsQWruFxruhDPmEs94fAUxRgiTd3
 9FQqbrcToyeD5e5ozkZE0WQqcpVRWEMSb0w0DXh15Myexp4Q9W7LuxOw4stY5elj7k14U3
 1exQgVC/lVjM9pCMDfm6dvypn4WZNm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-7L226PW_No2Iq1O-yAe9eQ-1; Thu, 09 Feb 2023 18:37:38 -0500
X-MC-Unique: 7L226PW_No2Iq1O-yAe9eQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F8261871D94;
 Thu,  9 Feb 2023 23:37:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4581140EBF6;
 Thu,  9 Feb 2023 23:37:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 3/4] multifd: Only sync once each full round of memory
Date: Fri, 10 Feb 2023 00:37:29 +0100
Message-Id: <20230209233730.38288-4-quintela@redhat.com>
In-Reply-To: <20230209233730.38288-1-quintela@redhat.com>
References: <20230209233730.38288-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
 qapi/migration.json   |  2 +-
 migration/migration.c |  2 --
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 2907241b9c..5d0efa4590 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -482,7 +482,7 @@
 #                                   section is sent.  We used to do
 #                                   that in the past, but it is
 #                                   suboptimal.
-#                                   Default value is true until all code is in.
+#                                   Default value is false.
 #                                   (since 8.0)
 #
 # Features:
diff --git a/migration/migration.c b/migration/migration.c
index b2844d374f..9eb061319d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2710,8 +2710,6 @@ bool migrate_multifd_sync_after_each_section(void)
 {
     MigrationState *s = migrate_get_current();
 
-    return true;
-    // We will change this when code gets in.
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index 899e2cd8af..32fab7b5ee 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -82,6 +82,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
 
 int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
      uint8_t *, int) = xbzrle_encode_buffer;
@@ -1593,6 +1594,7 @@ retry:
  * associated with the search process.
  *
  * Returns:
+ *         <0: An error happened
  *         PAGE_ALL_CLEAN: no dirty page found, give up
  *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
  *         PAGE_DIRTY_FOUND: dirty page found
@@ -1620,6 +1622,15 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
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
@@ -2612,6 +2623,9 @@ static int ram_find_and_save_block(RAMState *rs)
                     break;
                 } else if (res == PAGE_TRY_AGAIN) {
                     continue;
+                } else if (res < 0) {
+                    pages = res;
+                    break;
                 }
             }
         }
@@ -3298,6 +3312,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3483,6 +3501,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_sync_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -4167,7 +4188,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
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
@@ -4441,6 +4464,9 @@ static int ram_load_precopy(QEMUFile *f)
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


