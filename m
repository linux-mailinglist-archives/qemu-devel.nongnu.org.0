Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6286A86EB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:39:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlv9-0002ju-BS; Thu, 02 Mar 2023 11:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu9-0000ma-7s
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pXlu6-0008BB-L5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2JvIY+VtITpVc80SYym9U4RIIUAjNTVfTFZFKxKw/Y=;
 b=VOja/RS2xIcn/z/JChys/OPE89JIyHr+6C5C6+3N/Xi85WFlmxotpdjjZfUzTgPJOwNEpS
 TDlOIPqYnSh7i4MhXTS3FYnbIJtpzvFS9ZgoHc2NzVhHHc7iZ3KcoAqwgQA6CIrHxelYjO
 fVVFb5qtQZb1ueb+GFP7snhAPp/mvaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-yEqwYIN_Pa683DgDiknHsA-1; Thu, 02 Mar 2023 11:35:33 -0500
X-MC-Unique: yEqwYIN_Pa683DgDiknHsA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98C7C81172B;
 Thu,  2 Mar 2023 16:35:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8A20492C3E;
 Thu,  2 Mar 2023 16:35:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 29/43] migration: Move migrate_postcopy() to options.c
Date: Thu,  2 Mar 2023 17:33:56 +0100
Message-Id: <20230302163410.11399-30-quintela@redhat.com>
In-Reply-To: <20230302163410.11399-1-quintela@redhat.com>
References: <20230302163410.11399-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h | 2 --
 migration/options.h   | 1 +
 migration/migration.c | 5 -----
 migration/options.c   | 5 +++++
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 57efcb7c9f..f241159dd3 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -408,8 +408,6 @@ bool migration_is_blocked(Error **errp);
 bool migration_in_postcopy(void);
 MigrationState *migrate_get_current(void);
 
-bool migrate_postcopy(void);
-
 uint64_t ram_get_total_transferred_pages(void);
 
 /* Sending on the return path - generic and then for each message type */
diff --git a/migration/options.h b/migration/options.h
index 4fbe4cb411..4214bebcb7 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -47,6 +47,7 @@ bool migrate_zero_copy_send(void);
  * check, but they are not a capability.
  */
 
+bool migrate_postcopy(void);
 bool migrate_tls(void);
 
 /* capabilities helpers */
diff --git a/migration/migration.c b/migration/migration.c
index 7c4b49deda..e091663af9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2243,11 +2243,6 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
     qemu_sem_post(&s->pause_sem);
 }
 
-bool migrate_postcopy(void)
-{
-    return migrate_postcopy_ram() || migrate_dirty_bitmaps();
-}
-
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/options.c b/migration/options.c
index 0ea3500b24..d9383afa35 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -209,6 +209,11 @@ bool migrate_zero_copy_send(void)
 
 /* pseudo capabilities */
 
+bool migrate_postcopy(void)
+{
+    return migrate_postcopy_ram() || migrate_dirty_bitmaps();
+}
+
 bool migrate_tls(void)
 {
     MigrationState *s;
-- 
2.39.2


