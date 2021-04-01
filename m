Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8A63511F6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:24:44 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtZD-0008WT-PC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX9-0006rL-I1
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:39 -0400
Received: from relay.sw.ru ([185.231.240.75]:49896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX5-0006Uu-5x
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=IaYDXLpsx8dXdhtbVkcPoomSxkPgq7RsGQc6eyw3BAY=; b=AAlCZtVYsddM
 HfwsF0HjhpPes+kLbIfiEPpVAMsQAEj19k3adCYzrrHGpRV8TdhTJmOdlT+SxoqRDKBDEGJfcW3Q0
 oUPEjJtIjPeFMoiUzA8tPRV40JrM/QmdxEGGdDqgYFNhLFmxeaj8gwLNrQn2QY4POJqy6XuUMgos6
 9re5g=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRtX1-000DxR-IO; Thu, 01 Apr 2021 12:22:27 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH for-6.0 v1 2/4] migration: Inhibit virtio-balloon for the
 duration of background snapshot
Date: Thu,  1 Apr 2021 12:22:24 +0300
Message-Id: <20210401092226.102804-3-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The same thing as for incoming postcopy - we cannot deal with concurrent
RAM discards when using background snapshot feature in outgoing migration.

Fixes: 8518278a6af589ccc401f06e35f171b1e6fae800 (migration: implementation
  of background snapshot thread)
Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reported-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 8 ++++++--
 include/migration/misc.h   | 2 ++
 migration/migration.c      | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e770955176..d120bf8f43 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -66,8 +66,12 @@ static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
 
 static bool virtio_balloon_inhibited(void)
 {
-    /* Postcopy cannot deal with concurrent discards, so it's special. */
-    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy();
+    /*
+     * Postcopy cannot deal with concurrent discards,
+     * so it's special, as well as background snapshots.
+     */
+    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy() ||
+            migration_in_bg_snapshot();
 }
 
 static void balloon_inflate_page(VirtIOBalloon *balloon,
diff --git a/include/migration/misc.h b/include/migration/misc.h
index bccc1b6b44..738675ef52 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -70,6 +70,8 @@ bool migration_in_postcopy_after_devices(MigrationState *);
 void migration_global_dump(Monitor *mon);
 /* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
 bool migration_in_incoming_postcopy(void);
+/* True if background snapshot is active */
+bool migration_in_bg_snapshot(void);
 
 /* migration/block-dirty-bitmap.c */
 void dirty_bitmap_mig_init(void);
diff --git a/migration/migration.c b/migration/migration.c
index 00e13f9d58..be4729e7c8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1976,6 +1976,14 @@ bool migration_in_incoming_postcopy(void)
     return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
 }
 
+bool migration_in_bg_snapshot(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return migrate_background_snapshot() &&
+            migration_is_setup_or_active(s->state);
+}
+
 bool migration_is_idle(void)
 {
     MigrationState *s = current_migration;
-- 
2.27.0


