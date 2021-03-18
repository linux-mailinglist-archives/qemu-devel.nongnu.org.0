Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6F340C6C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:04:55 +0100 (CET)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMx0w-0001nJ-32
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwkk-0006JQ-Dx
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:12 -0400
Received: from relay.sw.ru ([185.231.240.75]:57932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwkb-00084H-Fy
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=twgg4Z8xG2CcH6Cma/P0ULRnshzs58g8AoicKzYomz4=; b=eOgnKionxB90
 YA8SItefiq2o3KqOSBO3MHg5Xxl77oEGZCcGmp9UcP/RtARm21TDiKxq+um9Rji0xEEvmHtvgwxQ9
 OobzjXRd8za1ZXtF6yzQAn6kz9DyHndmMvXEsJp52iPlQ66hnsNazyZULalq+tPHvpoJqgkCSjvr5
 zXa+8=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMwjy-003De5-3N; Thu, 18 Mar 2021 20:47:22 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH 2/3] migration: Inhibit virtio-balloon for the duration of
 background snapshot
Date: Thu, 18 Mar 2021 20:46:10 +0300
Message-Id: <20210318174611.293520-3-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
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

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
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
index 496cf6e17b..656d6249a6 100644
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
2.25.1


