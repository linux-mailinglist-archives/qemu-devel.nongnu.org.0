Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E07755343C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:12:10 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ebx-00012I-Ms
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVg-0003I5-IE
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVe-000084-Tx
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJg/WFGZVTtU9gkUoEDGA71eYp5/Sv32u/ewLvjUnxA=;
 b=Otm7FdKMfM4cJ1HftubTqkn9uTyCg/ehjnGS8laaQ0EjxRr56jDxPaUbjVgCvH3ib640FO
 ZWLqVz3i6bYwsLdOqnc/dxreSzT+0hnvvSiIX++UIDKqJtGX84C2vlUvAEoMSDpLUXab4X
 eqyjA07WbubkELqLGOC9e0bEwcP7xqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-vGX8YB88O_CZ-pbxGFXSAQ-1; Tue, 21 Jun 2022 10:05:33 -0400
X-MC-Unique: vGX8YB88O_CZ-pbxGFXSAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83B4C101E986;
 Tue, 21 Jun 2022 14:05:32 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A571E2166B26;
 Tue, 21 Jun 2022 14:05:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 5/5] multifd: Only sync once each full round of memory
Date: Tue, 21 Jun 2022 16:05:07 +0200
Message-Id: <20220621140507.1246-6-quintela@redhat.com>
In-Reply-To: <20220621140507.1246-1-quintela@redhat.com>
References: <20220621140507.1246-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
 migration/migration.c |  2 +-
 migration/ram.c       | 42 ++++++++++++++++++++++++++++++------------
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3f79df0b70..6627787fc2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4283,7 +4283,7 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     /* We will change to false when we introduce the new mechanism */
     DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
-                      multifd_sync_each_iteration, true),
+                      multifd_sync_each_iteration, false),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/migration/ram.c b/migration/ram.c
index 2c7289edad..6792986565 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -81,6 +81,7 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_MULTIFD_SYNC     0x200
 
 XBZRLECacheStats xbzrle_counters;
 
@@ -1482,6 +1483,7 @@ retry:
  * associated with the search process.
  *
  * Returns:
+ *        <0: An error happened
  *         0: no page found, give up
  *         1: no page found, retry
  *         2: page found
@@ -1510,6 +1512,13 @@ static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
         pss->page = 0;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
         if (!pss->block) {
+            if (!migrate_multifd_sync_each_iteration()) {
+                int ret = multifd_send_sync_main(rs->f);
+                if (ret < 0) {
+                    return ret;
+                }
+                qemu_put_be64(rs->f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+            }
             /*
              * If memory migration starts over, we will meet a dirtied page
              * which may still exists in compression threads's ring, so we
@@ -2273,7 +2282,8 @@ static int ram_find_and_save_block(RAMState *rs)
         if (!get_queued_page(rs, &pss)) {
             /* priority queue empty, so just search for something dirty */
             int res = find_dirty_block(rs, &pss);
-            if (res == 0) {
+            if (res <= 0) {
+                pages = res;
                 break;
             } else if (res == 1)
                 continue;
@@ -2943,11 +2953,13 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    if (migrate_multifd_sync_each_iteration()) {
-        ret =  multifd_send_sync_main(f);
-        if (ret < 0) {
-            return ret;
-        }
+    ret =  multifd_send_sync_main(f);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!migrate_multifd_sync_each_iteration()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
     }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
@@ -3127,13 +3139,14 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    if (migrate_multifd_sync_each_iteration()) {
-        ret = multifd_send_sync_main(rs->f);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = multifd_send_sync_main(rs->f);
+    if (ret < 0) {
+        return ret;
     }
 
+    if (migrate_multifd_sync_each_iteration()) {
+        qemu_put_be64(f, RAM_SAVE_FLAG_MULTIFD_SYNC);
+    }
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3800,7 +3813,9 @@ int ram_load_postcopy(QEMUFile *f)
             }
             decompress_data_with_multi_threads(f, page_buffer, len);
             break;
-
+        case RAM_SAVE_FLAG_MULTIFD_SYNC:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_sync_each_iteration()) {
@@ -4079,6 +4094,9 @@ static int ram_load_precopy(QEMUFile *f)
                 break;
             }
             break;
+        case RAM_SAVE_FLAG_MULTIFD_SYNC:
+            multifd_recv_sync_main();
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             if (migrate_multifd_sync_each_iteration()) {
-- 
2.34.1


