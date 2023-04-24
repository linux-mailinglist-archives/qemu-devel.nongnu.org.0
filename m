Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4996ECE2A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:29:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwGB-0000RM-O1; Mon, 24 Apr 2023 09:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFh-0007Zo-T2
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pqwFg-0001de-DY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682342947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6n+gAfOkuODCtOAVM6y39i4P0a+dylqFR14uo3fg14=;
 b=EDbvaBPcOo7t/Hx/mgOuYREH9k93WWlLQz9SPqx/4FBSdYBBa1XQztodSRgYpbi6MwhdCW
 bki5OeUxN6x6WnWjJsvlsT/UylpsrKV0DYmWutiHUsG9z6hP9tLEuY+AuYmV+eeAlCjdvh
 EcY1IHDN7Hzoc3S1GHm9vWVj7pEnl5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-zyEeBVmjPOyTomDF_u9EjA-1; Mon, 24 Apr 2023 09:29:03 -0400
X-MC-Unique: zyEeBVmjPOyTomDF_u9EjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 784DDA0F383;
 Mon, 24 Apr 2023 13:29:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C053814171B8;
 Mon, 24 Apr 2023 13:28:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PULL 29/30] migration: Move migrate_postcopy() to options.c
Date: Mon, 24 Apr 2023 15:27:29 +0200
Message-Id: <20230424132730.70752-30-quintela@redhat.com>
In-Reply-To: <20230424132730.70752-1-quintela@redhat.com>
References: <20230424132730.70752-1-quintela@redhat.com>
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c | 5 -----
 migration/migration.h | 2 --
 migration/options.c   | 8 ++++++++
 migration/options.h   | 9 +++++++++
 4 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index dccad95a55..f20d7bcc06 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2245,11 +2245,6 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
     qemu_sem_post(&s->pause_sem);
 }
 
-bool migrate_postcopy(void)
-{
-    return migrate_postcopy_ram() || migrate_dirty_bitmaps();
-}
-
 int migrate_use_tls(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 3ae938b19c..dcf906868d 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -447,8 +447,6 @@ bool migration_is_blocked(Error **errp);
 bool migration_in_postcopy(void);
 MigrationState *migrate_get_current(void);
 
-bool migrate_postcopy(void);
-
 int migrate_use_tls(void);
 
 uint64_t ram_get_total_transferred_pages(void);
diff --git a/migration/options.c b/migration/options.c
index 615534c151..8bd2d949ae 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -204,6 +204,14 @@ bool migrate_zero_copy_send(void)
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
+
+/* pseudo capabilities */
+
+bool migrate_postcopy(void)
+{
+    return migrate_postcopy_ram() || migrate_dirty_bitmaps();
+}
+
 typedef enum WriteTrackingSupport {
     WT_SUPPORT_UNKNOWN = 0,
     WT_SUPPORT_ABSENT,
diff --git a/migration/options.h b/migration/options.h
index 99f6bbd7a1..093bc907a1 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -38,6 +38,15 @@ bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
 bool migrate_zero_copy_send(void);
 
+/*
+ * pseudo capabilities
+ *
+ * These are functions that are used in a similar way to capabilities
+ * check, but they are not a capability.
+ */
+
+bool migrate_postcopy(void);
+
 /* capabilities helpers */
 
 bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
-- 
2.39.2


