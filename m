Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F26702CD1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:36:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXPl-0006qo-Jq; Mon, 15 May 2023 08:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXPA-0006Up-3s
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXOs-0003Lr-DO
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684154038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PlvK0jZEypQL5Au5TZqNRqloEjsCBWZio4hIgCCZls=;
 b=M4tqc+Z6pN3v/PeLDZds9hwM2wAqglsWwgOs69p+v1oWnGKt8PyxMmqrMdOTi4FNtfk+Iu
 B5sHnKjXxI+zVfLSRJXXvorzSg0CHvlrwK2yse1FYKl0QfuKnjPJM0DNgTKz6NxcdLdD7k
 htMAvGQFRO8g5R24FgiYzSVnkl34C2I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-jgZ8rO_EPriEu1Wo0fYpZg-1; Mon, 15 May 2023 08:33:55 -0400
X-MC-Unique: jgZ8rO_EPriEu1Wo0fYpZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70B738123AD;
 Mon, 15 May 2023 12:33:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A4D35453;
 Mon, 15 May 2023 12:33:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/11] migration: We set the rate_limit by a second
Date: Mon, 15 May 2023 14:33:31 +0200
Message-Id: <20230515123334.58995-9-quintela@redhat.com>
In-Reply-To: <20230515123334.58995-1-quintela@redhat.com>
References: <20230515123334.58995-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

That the implementation does the check every 100 milliseconds is an
implementation detail that shouldn't be seen on the interfaz.
Notice that all callers of qemu_file_set_rate_limit() used the
division or pass 0, so this change is a NOP.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230508130909.65420-4-quintela@redhat.com>
---
 migration/migration.c | 7 +++----
 migration/options.c   | 4 ++--
 migration/qemu-file.c | 6 +++++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5636119e8e..73ac63746b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2140,7 +2140,7 @@ static int postcopy_start(MigrationState *ms)
      * will notice we're in POSTCOPY_ACTIVE and not actually
      * wrap their state up here
      */
-    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
+    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth);
     if (migrate_postcopy_ram()) {
         /* Ping just for debugging, helps line traces up */
         qemu_savevm_send_ping(ms->to_dst_file, 2);
@@ -3231,11 +3231,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
 
     if (resume) {
         /* This is a resumed migration */
-        rate_limit = migrate_max_postcopy_bandwidth() /
-            XFER_LIMIT_RATIO;
+        rate_limit = migrate_max_postcopy_bandwidth();
     } else {
         /* This is a fresh new migration */
-        rate_limit = migrate_max_bandwidth() / XFER_LIMIT_RATIO;
+        rate_limit = migrate_max_bandwidth();
 
         /* Notify before starting migration thread */
         notifier_list_notify(&migration_state_notifiers, s);
diff --git a/migration/options.c b/migration/options.c
index 7ed88b7b32..c2a278ee2d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -1243,7 +1243,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.max_bandwidth = params->max_bandwidth;
         if (s->to_dst_file && !migration_in_postcopy()) {
             qemu_file_set_rate_limit(s->to_dst_file,
-                                s->parameters.max_bandwidth / XFER_LIMIT_RATIO);
+                                s->parameters.max_bandwidth);
         }
     }
 
@@ -1273,7 +1273,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
         if (s->to_dst_file && migration_in_postcopy()) {
             qemu_file_set_rate_limit(s->to_dst_file,
-                    s->parameters.max_postcopy_bandwidth / XFER_LIMIT_RATIO);
+                    s->parameters.max_postcopy_bandwidth);
         }
     }
     if (params->has_max_cpu_throttle) {
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 61fb580342..60f6345033 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -29,6 +29,7 @@
 #include "migration.h"
 #include "qemu-file.h"
 #include "trace.h"
+#include "options.h"
 #include "qapi/error.h"
 
 #define IO_BUF_SIZE 32768
@@ -744,7 +745,10 @@ int64_t qemu_file_get_rate_limit(QEMUFile *f)
 
 void qemu_file_set_rate_limit(QEMUFile *f, int64_t limit)
 {
-    f->rate_limit_max = limit;
+    /*
+     * 'limit' is per second.  But we check it each 100 miliseconds.
+     */
+    f->rate_limit_max = limit / XFER_LIMIT_RATIO;
 }
 
 void qemu_file_reset_rate_limit(QEMUFile *f)
-- 
2.40.1


