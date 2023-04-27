Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC816F027C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwxC-0001Jt-NS; Thu, 27 Apr 2023 04:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx9-0001Hf-46
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prwx7-0001Fq-IH
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgIH6ip8ba6VQ6/6CNScjncdL1YBECwLG9beCYfsVXY=;
 b=VWbbu7Vav1ssbRrRvLK5/DCczYJkF8Uj5Zfn/sio1ks9tzuH2We+0kEeKQVZRjbx3qDur/
 IVZmQqaXZke76I4Ymm0Lq9Rvn6PH/QYo0QGL0K4kvngX2hP8MW+woz4i/YFG1Mu6L85Mza
 HOHOxnDMsthmQTCvMkGbS3WTIfLo4/Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-v5NKEx7nOkiDbCWWikJMMQ-1; Thu, 27 Apr 2023 04:26:05 -0400
X-MC-Unique: v5NKEx7nOkiDbCWWikJMMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFAE41C0896B;
 Thu, 27 Apr 2023 08:26:04 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C124C15BA0;
 Thu, 27 Apr 2023 08:26:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 3/7] migration: Move migrate_use_tls() to options.c
Date: Thu, 27 Apr 2023 10:25:53 +0200
Message-Id: <20230427082557.20994-4-quintela@redhat.com>
In-Reply-To: <20230427082557.20994-1-quintela@redhat.com>
References: <20230427082557.20994-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Once there, rename it to migrate_tls() and make it return bool for
consistency.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

---

Fix typos found by fabiano
---
 migration/migration.c |  9 ---------
 migration/migration.h |  2 --
 migration/options.c   | 11 ++++++++++-
 migration/options.h   |  1 +
 migration/tls.c       |  3 ++-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 53dd59f6f6..02c2355d0d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2177,15 +2177,6 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
     qemu_sem_post(&s->pause_sem);
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
index dcf906868d..2b71df8617 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -447,8 +447,6 @@ bool migration_is_blocked(Error **errp);
 bool migration_in_postcopy(void);
 MigrationState *migrate_get_current(void);
 
-int migrate_use_tls(void);
-
 uint64_t ram_get_total_transferred_pages(void);
 
 /* Sending on the return path - generic and then for each message type */
diff --git a/migration/options.c b/migration/options.c
index dd97c99391..943936a320 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -214,6 +214,15 @@ bool migrate_postcopy(void)
     return migrate_postcopy_ram() || migrate_dirty_bitmaps();
 }
 
+bool migrate_tls(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
 typedef enum WriteTrackingSupport {
     WT_SUPPORT_UNKNOWN = 0,
     WT_SUPPORT_ABSENT,
@@ -368,7 +377,7 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
          new_caps[MIGRATION_CAPABILITY_COMPRESS] ||
          new_caps[MIGRATION_CAPABILITY_XBZRLE] ||
          migrate_multifd_compression() ||
-         migrate_use_tls())) {
+         migrate_tls())) {
         error_setg(errp,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
         return false;
diff --git a/migration/options.h b/migration/options.h
index 1b78fa9f3d..13318a16c7 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -46,6 +46,7 @@ bool migrate_zero_copy_send(void);
  */
 
 bool migrate_postcopy(void);
+bool migrate_tls(void);
 
 /* capabilities helpers */
 
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
2.40.0


