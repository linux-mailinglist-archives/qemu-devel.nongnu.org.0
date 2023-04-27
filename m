Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E96F0845
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:27:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3Wm-0001ZN-6l; Thu, 27 Apr 2023 11:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3WY-0001Nl-Ci
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps3WW-0000yM-0n
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682609221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy1LT4y8A/6RjhKEZRZXKNwPiEwkx5zgEeXLHA5wj5w=;
 b=Cl1FaXcsT3Rtur5lyv9dyGP+4RtTvu1gG/PZD9bjKYecLYosDFXtKP2VnBwbSgLejqMwJG
 jWS+PKvjf+brbeHgi/m1TvZccUdDRnbK1HBllb5ODBAeeEQl9mQ0vLqL22VB2PHVIUMCY1
 dV9XqPeYh7yF+1uJwmcjhIheTcbgZUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-XvNiFx8gPpOQ-TY2OzLorA-1; Thu, 27 Apr 2023 11:26:04 -0400
X-MC-Unique: XvNiFx8gPpOQ-TY2OzLorA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3903F38294DB;
 Thu, 27 Apr 2023 15:23:22 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2B5940C201F;
 Thu, 27 Apr 2023 15:23:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, John Snow <jsnow@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 15/18] multifd: Only flush once each full round of memory
Date: Thu, 27 Apr 2023 17:22:31 +0200
Message-Id: <20230427152234.25400-16-quintela@redhat.com>
In-Reply-To: <20230427152234.25400-1-quintela@redhat.com>
References: <20230427152234.25400-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Acked-by: Peter Xu <peterx@redhat.com>

---

Add missing qemu_fflush(), now it passes all tests always.
In the previous version, the check that changes the default value to
false got lost in some rebase.  Get it back.
---
 migration/migration.h |  3 +--
 migration/options.c   |  8 ++------
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 3 files changed, 30 insertions(+), 9 deletions(-)

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
index 690c8f718e..53b7fc5d5d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -89,7 +89,7 @@ Property migration_properties[] = {
     DEFINE_PROP_BOOL("decompress-error-check", MigrationState,
                       decompress_error_check, true),
     DEFINE_PROP_BOOL("multifd-flush-after-each-section", MigrationState,
-                      multifd_flush_after_each_section, true),
+                      multifd_flush_after_each_section, false),
     DEFINE_PROP_UINT8("x-clear-bitmap-shift", MigrationState,
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
     DEFINE_PROP_BOOL("x-preempt-pre-7-2", MigrationState,
@@ -341,11 +341,7 @@ bool migrate_multifd_flush_after_each_section(void)
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


