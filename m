Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AEE68BB57
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:23:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzZs-0004IZ-5u; Mon, 06 Feb 2023 06:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZm-0004Fn-Bb
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZj-0003Ob-0B
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtsL8ERd4ZdT7V/YvGYXethl/MqAVLTyFEEwTNfoqy4=;
 b=MmaIOC3AXcZ51mHErx1eYNcvrO2RNC9mgwYNpJ+K7GzT3AMotcCIyIV32USKmsqOwavWlI
 hUkkD8kHapXQTfw+vhWtGRYbRyf5y6683W4uK7Yk8nTZSRf5Y7viaTx8BND0QXM+kIsIqK
 Yd552Jn6JhR4Z8FKrOxrunn+NsHnAw0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-Bx8nWHSlOYuyHWpfgOyq6g-1; Mon, 06 Feb 2023 06:21:10 -0500
X-MC-Unique: Bx8nWHSlOYuyHWpfgOyq6g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E51F1C06EC2;
 Mon,  6 Feb 2023 11:21:10 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAD8A492B21;
 Mon,  6 Feb 2023 11:21:05 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 3/8] migration: Add last stage indicator to global dirty
 log synchronization
Date: Mon,  6 Feb 2023 19:20:05 +0800
Message-Id: <20230206112010.99871-4-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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

For the pre-copy live migration scenario, the last stage indicator
is needed for KVM backend to collect the dirty pages from the backup
bitmap when dirty ring is used. The indicator isn't used so far.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 migration/ram.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d1b9b270ec..6c9642edee 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1176,7 +1176,7 @@ static void migration_trigger_throttle(RAMState *rs)
     }
 }
 
-static void migration_bitmap_sync(RAMState *rs)
+static void migration_bitmap_sync(RAMState *rs, bool last_stage)
 {
     RAMBlock *block;
     int64_t end_time;
@@ -1188,7 +1188,7 @@ static void migration_bitmap_sync(RAMState *rs)
     }
 
     trace_migration_bitmap_sync_start();
-    memory_global_dirty_log_sync(false);
+    memory_global_dirty_log_sync(last_stage);
 
     qemu_mutex_lock(&rs->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
@@ -1222,7 +1222,7 @@ static void migration_bitmap_sync(RAMState *rs)
     }
 }
 
-static void migration_bitmap_sync_precopy(RAMState *rs)
+static void migration_bitmap_sync_precopy(RAMState *rs, bool last_stage)
 {
     Error *local_err = NULL;
 
@@ -1235,7 +1235,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
         local_err = NULL;
     }
 
-    migration_bitmap_sync(rs);
+    migration_bitmap_sync(rs, last_stage);
 
     if (precopy_notify(PRECOPY_NOTIFY_AFTER_BITMAP_SYNC, &local_err)) {
         error_report_err(local_err);
@@ -2844,7 +2844,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     RCU_READ_LOCK_GUARD();
 
     /* This should be our last sync, the src is now paused */
-    migration_bitmap_sync(rs);
+    migration_bitmap_sync(rs, false);
 
     /* Easiest way to make sure we don't resume in the middle of a host-page */
     rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
@@ -3034,7 +3034,7 @@ static void ram_init_bitmaps(RAMState *rs)
         /* We don't use dirty log with background snapshots */
         if (!migrate_background_snapshot()) {
             memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, false);
         }
     }
     qemu_mutex_unlock_ramlist();
@@ -3349,7 +3349,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 
     WITH_RCU_READ_LOCK_GUARD() {
         if (!migration_in_postcopy()) {
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, true);
         }
 
         ram_control_before_iterate(f, RAM_CONTROL_FINISH);
@@ -3407,7 +3407,7 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
         remaining_size < max_size) {
         qemu_mutex_lock_iothread();
         WITH_RCU_READ_LOCK_GUARD() {
-            migration_bitmap_sync_precopy(rs);
+            migration_bitmap_sync_precopy(rs, false);
         }
         qemu_mutex_unlock_iothread();
         remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
-- 
2.23.0


