Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AC6EF9F8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:20:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjjZ-0000QF-Ev; Wed, 26 Apr 2023 14:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjX-0000Pp-LI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prjjV-0001xA-Fx
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 14:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682533152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgDnnl9TIzKy2MBxl7JHJwYHSYXHWT5QCxoKTtTU98Y=;
 b=cJBl3S1y/Qt+f/MueBrhBVp73rVoXLem4QSYncAEToBiqjrpi+XxsJU+96pMqmZVD/x/mL
 KsIUpt2n6LX8MPeI+KIYsHoBvx8JF2KDl3GUoAUoo3JwLo2ppMDW8ZoY3HjI9e+h92/Jot
 ncN4NBAM8uZtkrn/1UZVyvWiBgexqNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-dW73ROjWOB2pYe5vssbL8Q-1; Wed, 26 Apr 2023 14:19:09 -0400
X-MC-Unique: dW73ROjWOB2pYe5vssbL8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37F8285C1A0;
 Wed, 26 Apr 2023 18:19:09 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD06B14171B6;
 Wed, 26 Apr 2023 18:19:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v9 3/3] multifd: Only flush once each full round of memory
Date: Wed, 26 Apr 2023 20:19:01 +0200
Message-Id: <20230426181901.13574-4-quintela@redhat.com>
In-Reply-To: <20230426181901.13574-1-quintela@redhat.com>
References: <20230426181901.13574-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

We need to add a new flag to mean to flush at that point.
Notice that we still flush at the end of setup and at the end of
complete stages.

Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Add missing qemu_fflush(), now it passes all tests always.
In the previous version, the check that changes the default value to
false got lost in some rebase.  Get it back.
---
 migration/migration.c |  2 +-
 migration/migration.h |  3 +--
 migration/options.c   |  6 +-----
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 4 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e82aa69842..e504f30c2e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3345,7 +3345,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                       decompress_error_check, true),
     DEFINE_PROP_BOOL("multifd-flush-after-each-section", MigrationState,
-                      multifd_flush_after_each_section, true),
+                      multifd_flush_after_each_section, false),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
     DEFINE_PROP_BOOL("x-preempt-pre-7-2", MigrationState,
diff --git a/migration/migration.h b/migration/migration.h
index e2247d708f..3a918514e7 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -412,8 +412,7 @@ struct MigrationState {
      * only need to do this flush after we have go through all the
      * dirty pages.  For historical reasons, we do that after each
      * section.  This is suboptimal (we flush too many times).
-     * Default value is false.  Setting this property has no effect
-     * until the patch that removes this comment.  (since 8.1)
+     * Default value is false. (since 8.1)
      */
     bool multifd_flush_after_each_section;
     /*
diff --git a/migration/options.c b/migration/options.c
index b9d54b4ef7..78bfcc8ec0 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -221,11 +221,7 @@ bool migrate_multifd_flush_after_each_section(void)
 {
     MigrationState *s = migrate_get_current();
 
-    /*
-     * Until the patch that remove this comment, we always return that
-     * the property is enabled.
-     */
-    return true || s->multifd_flush_after_each_section;
+    return s->multifd_flush_after_each_section;
 }
 
 bool migrate_postcopy(void)
diff --git a/migration/ram.c b/migration/ram.c
index 1e2414d681..e9dcda8b9d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -86,6 +86,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in qemu-file.h for RAM_SAVE_FLAG_HOOK */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MULTIFD_FLUSH    0x200
 /* We can't use any flag that is bigger than 0x200 */
 
 int (*xbzrle_encode_buffer_func)(uint8_t *, uint8_t *, int,
@@ -1581,6 +1582,7 @@ retry:
  * associated with the search process.
  *
  * Returns:
+ *         <0: An error happened
  *         PAGE_ALL_CLEAN: no dirty page found, give up
  *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
  *         PAGE_DIRTY_FOUND: dirty page found
@@ -1608,6 +1610,15 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
         pss->page = 0;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
         if (!pss->block) {
+            if (!migrate_multifd_flush_after_each_section()) {
+                QEMUFile *f = rs->pss[RAM_CHANNEL_PRECOPY].pss_channel;
+                int ret = multifd_send_sync_main(f);
+                if (ret < 0) {
+                    return ret;
+                }
+                qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
+                qemu_fflush(f);
+            }
             /*
              * If memory migration starts over, we will meet a dirtied page
              * which may still exists in compression threads's ring, so we
@@ -2600,6 +2611,9 @@ static int ram_find_and_save_block(RAMState *rs)
                     break;
                 } else if (res == PAGE_TRY_AGAIN) {
                     continue;
+                } else if (res < 0) {
+                    pages = res;
+                    break;
                 }
             }
         }
@@ -3286,6 +3300,10 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_flush_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3471,6 +3489,9 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
+    if (!migrate_multifd_flush_after_each_section()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_FLUSH);
+    }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -4152,7 +4173,9 @@ int ram_load_postcopy(QEMUFile *f, int channel)
             }
             decompress_data_with_multi_threads(f, page_buffer, len);
             break;
-
+        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_flush_after_each_section()) {
@@ -4426,6 +4449,9 @@ static int ram_load_precopy(QEMUFile *f)
                 break;
             }
             break;
+        case RAM_SAVE_FLAG_MULTIFD_FLUSH:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_flush_after_each_section()) {
-- 
2.40.0


