Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1F6FB0EC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:11:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0ct-0003aF-ER; Mon, 08 May 2023 09:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cq-0003Ys-AN
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0co-0000mB-O1
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYeutPKog/HcFBUEouJIGxFSbZ2ttV5wtAhlcbyXyQI=;
 b=L6+8pOel1wKDR0ADO1QY1JuUpPRE+ZM1yS0UN+n4MQ5QZtWW7i7CwKulbF83QwVYxCDvNR
 Si6HoOTnqTFMQtv+OFdyZUC0zlbnSGF92hm51YhRgC0kw3i10VYI2cipoE5qlFWHsDcvIq
 4bgrPdJkrwEL1kkT8boYPOTjZ/N9Fik=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-lBku-1jNNa-33SCYRdWI4g-1; Mon, 08 May 2023 09:09:53 -0400
X-MC-Unique: lBku-1jNNa-33SCYRdWI4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7E953813F2C;
 Mon,  8 May 2023 13:09:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4F12166B40;
 Mon,  8 May 2023 13:09:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 03/21] migration: We set the rate_limit by a second
Date: Mon,  8 May 2023 15:08:51 +0200
Message-Id: <20230508130909.65420-4-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

That the implementation does the check every 100 milliseconds is an
implementation detail that shouldn't be seen on the interfaz.
Notice that all callers of qemu_file_set_rate_limit() used the
division or pass 0, so this change is a NOP.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 7 +++----
 migration/options.c   | 4 ++--
 migration/qemu-file.c | 6 +++++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3979a98949..e17a6538b4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2117,7 +2117,7 @@ static int postcopy_start(MigrationState *ms)
      * will notice we're in POSTCOPY_ACTIVE and not actually
      * wrap their state up here
      */
-    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
+    qemu_file_set_rate_limit(ms->to_dst_file, bandwidth);
     if (migrate_postcopy_ram()) {
         /* Ping just for debugging, helps line traces up */
         qemu_savevm_send_ping(ms->to_dst_file, 2);
@@ -3207,11 +3207,10 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
 
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
index 2e759cc306..d04b5fbc3a 100644
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
 
@@ -1275,7 +1275,7 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
         s->parameters.max_postcopy_bandwidth = params->max_postcopy_bandwidth;
         if (s->to_dst_file && migration_in_postcopy()) {
             qemu_file_set_rate_limit(s->to_dst_file,
-                    s->parameters.max_postcopy_bandwidth / XFER_LIMIT_RATIO);
+                    s->parameters.max_postcopy_bandwidth);
         }
     }
     if (params->has_max_cpu_throttle) {
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 745361d238..12cf7fb04e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -29,6 +29,7 @@
 #include "migration.h"
 #include "qemu-file.h"
 #include "trace.h"
+#include "options.h"
 #include "qapi/error.h"
 
 #define IO_BUF_SIZE 32768
@@ -747,7 +748,10 @@ int64_t qemu_file_get_rate_limit(QEMUFile *f)
 
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
2.40.0


