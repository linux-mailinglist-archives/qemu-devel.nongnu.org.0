Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2013A9E3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 14:00:58 +0100 (CET)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLoU-0008Ia-Tg
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 08:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLiL-0002AH-PY
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:54:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLiI-0001br-2Z
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:54:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30583
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLiH-0001bj-Tz
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGtOvyEUGfifsxxl01xh+gxn1N24J9QLDuYgx3ZYdPU=;
 b=I/JnRG/W/VjxN0U5DUQKGTCubqFx5Ew7k8D3B8/Zh5RLa4HYk/t91+fsu+mH+C+tfB5EC7
 UAwwHX0DGQVOGnEgOlT5BKTW/xqjd/jLJF0E43+3vqZ+Tm77/U3moS2ZKAbmPqjl1CBpRe
 9b7aTxRsG1VupCiyLLeZcByzhEzDO/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-y3znGWDzNZaSpFMACrMSDQ-1; Tue, 14 Jan 2020 07:54:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3C9801E77;
 Tue, 14 Jan 2020 12:54:26 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 165B95D9E5;
 Tue, 14 Jan 2020 12:54:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] migration: Rate limit inside host pages
Date: Tue, 14 Jan 2020 13:52:33 +0100
Message-Id: <20200114125254.4515-10-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: y3znGWDzNZaSpFMACrMSDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Lin Ma <LMa@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When using hugepages, rate limiting is necessary within each huge
page, since a 1G huge page can take a significant time to send, so
you end up with bursty behaviour.

Fixes: 4c011c37ecb3 ("postcopy: Send whole huge pages")
Reported-by: Lin Ma <LMa@suse.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c  | 57 ++++++++++++++++++++++++------------------
 migration/migration.h  |  1 +
 migration/ram.c        |  2 ++
 migration/trace-events |  4 +--
 4 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 354ad072fa..27500d09a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3224,6 +3224,37 @@ void migration_consume_urgent_request(void)
     qemu_sem_wait(&migrate_get_current()->rate_limit_sem);
 }
=20
+/* Returns true if the rate limiting was broken by an urgent request */
+bool migration_rate_limit(void)
+{
+    int64_t now =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    MigrationState *s =3D migrate_get_current();
+
+    bool urgent =3D false;
+    migration_update_counters(s, now);
+    if (qemu_file_rate_limit(s->to_dst_file)) {
+        /*
+         * Wait for a delay to do rate limiting OR
+         * something urgent to post the semaphore.
+         */
+        int ms =3D s->iteration_start_time + BUFFER_DELAY - now;
+        trace_migration_rate_limit_pre(ms);
+        if (qemu_sem_timedwait(&s->rate_limit_sem, ms) =3D=3D 0) {
+            /*
+             * We were woken by one or more urgent things but
+             * the timedwait will have consumed one of them.
+             * The service routine for the urgent wake will dec
+             * the semaphore itself for each item it consumes,
+             * so add this one we just eat back.
+             */
+            qemu_sem_post(&s->rate_limit_sem);
+            urgent =3D true;
+        }
+        trace_migration_rate_limit_post(urgent);
+    }
+    return urgent;
+}
+
 /*
  * Master migration thread on the source VM.
  * It drives the migration and pumps the data down the outgoing channel.
@@ -3290,8 +3321,6 @@ static void *migration_thread(void *opaque)
     trace_migration_thread_setup_complete();
=20
     while (migration_is_active(s)) {
-        int64_t current_time;
-
         if (urgent || !qemu_file_rate_limit(s->to_dst_file)) {
             MigIterateState iter_state =3D migration_iteration_run(s);
             if (iter_state =3D=3D MIG_ITERATE_SKIP) {
@@ -3318,29 +3347,7 @@ static void *migration_thread(void *opaque)
             update_iteration_initial_status(s);
         }
=20
-        current_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-
-        migration_update_counters(s, current_time);
-
-        urgent =3D false;
-        if (qemu_file_rate_limit(s->to_dst_file)) {
-            /* Wait for a delay to do rate limiting OR
-             * something urgent to post the semaphore.
-             */
-            int ms =3D s->iteration_start_time + BUFFER_DELAY - current_ti=
me;
-            trace_migration_thread_ratelimit_pre(ms);
-            if (qemu_sem_timedwait(&s->rate_limit_sem, ms) =3D=3D 0) {
-                /* We were worken by one or more urgent things but
-                 * the timedwait will have consumed one of them.
-                 * The service routine for the urgent wake will dec
-                 * the semaphore itself for each item it consumes,
-                 * so add this one we just eat back.
-                 */
-                qemu_sem_post(&s->rate_limit_sem);
-                urgent =3D true;
-            }
-            trace_migration_thread_ratelimit_post(urgent);
-        }
+        urgent =3D migration_rate_limit();
     }
=20
     trace_migration_thread_after_loop();
diff --git a/migration/migration.h b/migration/migration.h
index 79b3dda146..aa9ff6f27b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -341,5 +341,6 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, vo=
id *opaque);
=20
 void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
+bool migration_rate_limit(void);
=20
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 825f47f517..aa6cc7d47a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2639,6 +2639,8 @@ static int ram_save_host_page(RAMState *rs, PageSearc=
hStatus *pss,
=20
         pages +=3D tmppages;
         pss->page++;
+        /* Allow rate limiting to happen in the middle of huge pages */
+        migration_rate_limit();
     } while ((pss->page & (pagesize_bits - 1)) &&
              offset_in_ramblock(pss->block, pss->page << TARGET_PAGE_BITS)=
);
=20
diff --git a/migration/trace-events b/migration/trace-events
index 6dee7b5389..2f9129e213 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -138,12 +138,12 @@ migrate_send_rp_recv_bitmap(char *name, int64_t size)=
 "block '%s' size 0x%"PRIi6
 migration_completion_file_err(void) ""
 migration_completion_postcopy_end(void) ""
 migration_completion_postcopy_end_after_complete(void) ""
+migration_rate_limit_pre(int ms) "%d ms"
+migration_rate_limit_post(int urgent) "urgent: %d"
 migration_return_path_end_before(void) ""
 migration_return_path_end_after(int rp_error) "%d"
 migration_thread_after_loop(void) ""
 migration_thread_file_err(void) ""
-migration_thread_ratelimit_pre(int ms) "%d ms"
-migration_thread_ratelimit_post(int urgent) "urgent: %d"
 migration_thread_setup_complete(void) ""
 open_return_path_on_source(void) ""
 open_return_path_on_source_continue(void) ""
--=20
2.24.1


