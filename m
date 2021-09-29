Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440EF41C720
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:46:02 +0200 (CEST)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaqP-00080F-9n
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVanp-0006VJ-1d
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVann-0007Cr-2q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrbIoa5oIYf3DeW7L22Fv+IJDQJDUWpQgTMWCfAs8NU=;
 b=iWNF4CWTfmqGDPP7CLm7la3FR371RZjM1G+OxgrdJFLrg4ItKYY7IPsfSGUFmC2ZrfQJsU
 5Jr7aTae6Ri3ClyBdJWQPKpGDiur7kAhWWmUK2EdkjaeVfn8iYH0CJgZjKo382Lj3B+jt/
 PYj+wJsu5gRHf5p5n3zbVeD4ZInsRnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-yUYXFqoPMpaXqj6nhjGZ4w-1; Wed, 29 Sep 2021 10:43:16 -0400
X-MC-Unique: yUYXFqoPMpaXqj6nhjGZ4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A931C18125E7
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 14:43:15 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BC871017E27;
 Wed, 29 Sep 2021 14:43:13 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration: provide an error message to migration_cancel()
Date: Wed, 29 Sep 2021 16:43:10 +0200
Message-Id: <20210929144311.1168561-2-lvivier@redhat.com>
In-Reply-To: <20210929144311.1168561-1-lvivier@redhat.com>
References: <20210929144311.1168561-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This avoids to call migrate_get_current() in the caller function
whereas migration_cancel() already needs the pointer to the current
migration state.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 migration/migration.h | 2 +-
 migration/migration.c | 9 ++++++---
 migration/ram.c       | 3 +--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fdde..8130b703eb95 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -388,7 +388,7 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, void *opaque);
 void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
 bool migration_rate_limit(void);
-void migration_cancel(void);
+void migration_cancel(const Error *error);
 
 void populate_vfio_info(MigrationInfo *info);
 
diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7f5..565cbc859744 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -215,8 +215,11 @@ void migration_object_init(void)
     dirty_bitmap_mig_init();
 }
 
-void migration_cancel(void)
+void migration_cancel(const Error *error)
 {
+    if (error) {
+        migrate_set_error(current_migration, error);
+    }
     migrate_fd_cancel(current_migration);
 }
 
@@ -226,7 +229,7 @@ void migration_shutdown(void)
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
      */
-    migration_cancel();
+    migration_cancel(NULL);
     object_unref(OBJECT(current_migration));
 
     /*
@@ -2316,7 +2319,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
 
 void qmp_migrate_cancel(Error **errp)
 {
-    migration_cancel();
+    migration_cancel(NULL);
 }
 
 void qmp_migrate_continue(MigrationStatus state, Error **errp)
diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7afcb..50809b59ee70 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4178,9 +4178,8 @@ static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
          * Abort and indicate a proper reason.
          */
         error_setg(&err, "RAM block '%s' resized during precopy.", rb->idstr);
-        migrate_set_error(migrate_get_current(), err);
+        migration_cancel(err);
         error_free(err);
-        migration_cancel();
     }
 
     switch (ps) {
-- 
2.31.1


