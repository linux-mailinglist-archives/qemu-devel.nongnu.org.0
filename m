Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3626E963E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUXu-0006La-6K; Thu, 20 Apr 2023 09:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXY-0006AD-0m
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXV-00069q-M4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyL4vAcNv17VUf0wp7LdNqqpYGygmAQsbmUGwHW6U90=;
 b=Xdh7fahLTuoH3YBAJcOWKghm+gsoSl5HDscUldlnGZ1pkIl2vXNIpb8BWSooOlZo4oZhii
 99YSsJV8ARKn9rG8GVCeVQUKNaCtr/3Zl+/VgzFeit/COvJRNTceTV7K9SW1RZWQDkRk5h
 Uk0i0XgzJ+HM6w/4T5ZnyF8JZM8TzuE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-ZK9qHBXINoaFvKnsqZPo2Q-1; Thu, 20 Apr 2023 09:41:31 -0400
X-MC-Unique: ZK9qHBXINoaFvKnsqZPo2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DCBE3C10252;
 Thu, 20 Apr 2023 13:41:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 780604020BED;
 Thu, 20 Apr 2023 13:41:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Leonardo Bras <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 29/43] migration: Move migrate_postcopy() to options.c
Date: Thu, 20 Apr 2023 15:39:48 +0200
Message-Id: <20230420134002.29531-30-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 5 -----
 migration/migration.h | 2 --
 migration/options.c   | 5 +++++
 migration/options.h   | 1 +
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bbc9a07fd7..efb098c4e4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2246,11 +2246,6 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
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
diff --git a/migration/migration.h b/migration/migration.h
index 2099470e8e..2b71df8617 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -447,8 +447,6 @@ bool migration_is_blocked(Error **errp);
 bool migration_in_postcopy(void);
 MigrationState *migrate_get_current(void);
 
-bool migrate_postcopy(void);
-
 uint64_t ram_get_total_transferred_pages(void);
 
 /* Sending on the return path - generic and then for each message type */
diff --git a/migration/options.c b/migration/options.c
index 6db221157f..360faf53ca 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -207,6 +207,11 @@ bool migrate_zero_copy_send(void)
 
 /* pseudo capabilities */
 
+bool migrate_postcopy(void)
+{
+    return migrate_postcopy_ram() || migrate_dirty_bitmaps();
+}
+
 bool migrate_tls(void)
 {
     MigrationState *s;
diff --git a/migration/options.h b/migration/options.h
index c91d5cbef0..c1413c0e85 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -45,6 +45,7 @@ bool migrate_zero_copy_send(void);
  * check, but they are not a capability.
  */
 
+bool migrate_postcopy(void);
 bool migrate_tls(void);
 
 /* capabilities helpers */
-- 
2.39.2


