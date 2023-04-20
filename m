Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 032076E960F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUY9-0007Q5-06; Thu, 20 Apr 2023 09:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXc-0006Jx-Q5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUXV-00069e-NZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681998092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZQsgTAQm4hPqvs3WBnDUVTdB3h90fnIDlKd/MLTT7Y=;
 b=ZkaCOoQ5Y2tP7ccsLokJVHo2+gMqlc/7uGfu4HNCoMGHS7sHvNpOQl4CgkAdjp4pOp2vso
 d0FQUFajWTNcGUw+XXXCJQxpvVOX9Sc7AlQbcLI0uI8Z4HPAHSAelKNEZ1qvpKUaItagLY
 RB47F0qXYK2eOy8g+TyRcjGHjNzvSO0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-r5N3SvavN1e7CsJ8YhqdTg-1; Thu, 20 Apr 2023 09:41:28 -0400
X-MC-Unique: r5N3SvavN1e7CsJ8YhqdTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 344DF29AA39B;
 Thu, 20 Apr 2023 13:41:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDEF4020BED;
 Thu, 20 Apr 2023 13:41:25 +0000 (UTC)
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
Subject: [PATCH v2 28/43] migration: Move migrate_use_tls() to options.c
Date: Thu, 20 Apr 2023 15:39:47 +0200
Message-Id: <20230420134002.29531-29-quintela@redhat.com>
In-Reply-To: <20230420134002.29531-1-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Once there, rename it to migrate_tls() and make it return bool for
consistency.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c |  9 ---------
 migration/migration.h |  2 --
 migration/options.c   | 16 +++++++++++++++-
 migration/options.h   |  9 +++++++++
 migration/tls.c       |  3 ++-
 5 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 2191437b15..bbc9a07fd7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2251,15 +2251,6 @@ bool migrate_postcopy(void)
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
 }
 
-int migrate_use_tls(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.tls_creds && *s->parameters.tls_creds;
-}
-
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
diff --git a/migration/migration.h b/migration/migration.h
index 3ae938b19c..2099470e8e 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -449,8 +449,6 @@ MigrationState *migrate_get_current(void);
 
 bool migrate_postcopy(void);
 
-int migrate_use_tls(void);
-
 uint64_t ram_get_total_transferred_pages(void);
 
 /* Sending on the return path - generic and then for each message type */
diff --git a/migration/options.c b/migration/options.c
index a111d0d43f..6db221157f 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -204,6 +204,20 @@ bool migrate_zero_copy_send(void)
 
     return s->capabilities[MIGRATION_CAPABILITY_ZERO_COPY_SEND];
 }
+
+/* pseudo capabilities */
+
+bool migrate_tls(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
+
+
 typedef enum WriteTrackingSupport {
     WT_SUPPORT_UNKNOWN = 0,
     WT_SUPPORT_ABSENT,
@@ -353,7 +367,7 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
          new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
          new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
          migrate_multifd_compression() ||
-         migrate_use_tls())) {
+         migrate_tls())) {
         error_setg(errp,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
         return false;
diff --git a/migration/options.h b/migration/options.h
index 99f6bbd7a1..c91d5cbef0 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -38,6 +38,15 @@ bool migrate_xbzrle(void);
 bool migrate_zero_blocks(void);
 bool migrate_zero_copy_send(void);
 
+/*
+ * pseudo capabilities
+ *
+ * This are functions that are used in a similar way that capabilities
+ * check, but they are not a capability.
+ */
+
+bool migrate_tls(void);
+
 /* capabilities helpers */
 
 bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp);
diff --git a/migration/tls.c b/migration/tls.c
index 4d2166a209..acd38e0b62 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -22,6 +22,7 @@
 #include "channel.h"
 #include "migration.h"
 #include "tls.h"
+#include "options.h"
 #include "crypto/tlscreds.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -165,7 +166,7 @@ void migration_tls_channel_connect(MigrationState *s,
 
 bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc)
 {
-    if (!migrate_use_tls()) {
+    if (!migrate_tls()) {
         return false;
     }
 
-- 
2.39.2


