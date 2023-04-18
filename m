Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A16E6600
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:32:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polQf-0004Tb-Lk; Tue, 18 Apr 2023 09:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQM-0004PO-Ea
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1polQK-0000uH-Rg
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681824666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oILfNF6JpbWDS/bd7J5ZggBnMQShfldM7P82jsiPaRg=;
 b=W00lJ+NSxVtrkPnWyqWnx+5meNW9mWLci0SHruzOZyTZvtg+D0X+/acdgfJX4jqGheFKWh
 //8c2VC2Sli/XTIwYrGmaEJMgAuoBLBt6q2D8UP0J36INcsjv/JGTGwo5SpYFnqVNNnGte
 09Nm0nC3/4eTKj/MRauvRuZ85RuAjOQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-6iPLCKYpMxG2TEmmRbFpVg-1; Tue, 18 Apr 2023 09:31:05 -0400
X-MC-Unique: 6iPLCKYpMxG2TEmmRbFpVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA9A8385054E
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 13:31:04 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ED8E40C6E21;
 Tue, 18 Apr 2023 13:31:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios run
 non-live
Date: Tue, 18 Apr 2023 14:31:00 +0100
Message-Id: <20230418133100.48799-3-berrange@redhat.com>
In-Reply-To: <20230418133100.48799-1-berrange@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

There are 27 pre-copy live migration scenarios being tested. In all of
these we force non-convergance and run for one iteration, then let it
converge and wait for completion during the second (or following)
iterations. At 3 mbps bandwidth limit the first iteration takes a very
long time (~30 seconds).

While it is important to test the migration passes and convergance
logic, it is overkill to do this for all 27 pre-copy scenarios. The
TLS migration scenarios in particular are merely exercising different
code paths during connection establishment.

To optimize time taken, switch most of the test scenarios to run
non-live (ie guest CPUs paused) with no bandwidth limits. This gives
a massive speed up for most of the test scenarios.

For test coverage the following scenarios are unchanged

 * Precopy with UNIX sockets
 * Precopy with UNIX sockets and dirty ring tracking
 * Precopy with XBZRLE
 * Precopy with multifd

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..cdc9635f0b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -574,6 +574,9 @@ typedef struct {
     /* Optional: set number of migration passes to wait for */
     unsigned int iterations;
 
+    /* Whether the guest CPUs should be running during migration */
+    bool live;
+
     /* Postcopy specific fields */
     void *postcopy_data;
     bool postcopy_preempt;
@@ -1329,7 +1332,11 @@ static void test_precopy_common(MigrateCommon *args)
         return;
     }
 
-    migrate_ensure_non_converge(from);
+    if (args->live) {
+        migrate_ensure_non_converge(from);
+    } else {
+        migrate_ensure_converge(from);
+    }
 
     if (args->start_hook) {
         data_hook = args->start_hook(from, to);
@@ -1357,16 +1364,20 @@ static void test_precopy_common(MigrateCommon *args)
             qtest_set_expected_status(to, EXIT_FAILURE);
         }
     } else {
-        if (args->iterations) {
-            while (args->iterations--) {
+        if (args->live) {
+            if (args->iterations) {
+                while (args->iterations--) {
+                    wait_for_migration_pass(from);
+                }
+            } else {
                 wait_for_migration_pass(from);
             }
+
+            migrate_ensure_converge(from);
         } else {
-            wait_for_migration_pass(from);
+            qtest_qmp_discard_response(from, "{ 'execute' : 'stop'}");
         }
 
-        migrate_ensure_converge(from);
-
         /* We do this first, as it has a timeout to stop us
          * hanging forever if migration didn't converge */
         wait_for_migration_complete(from);
@@ -1375,7 +1386,12 @@ static void test_precopy_common(MigrateCommon *args)
             qtest_qmp_eventwait(from, "STOP");
         }
 
-        qtest_qmp_eventwait(to, "RESUME");
+        if (!args->live) {
+            qtest_qmp_discard_response(to, "{ 'execute' : 'cont'}");
+        }
+        if (!got_resume) {
+            qtest_qmp_eventwait(to, "RESUME");
+        }
 
         wait_for_serial("dest_serial");
     }
@@ -1393,6 +1409,7 @@ static void test_precopy_unix_plain(void)
     MigrateCommon args = {
         .listen_uri = uri,
         .connect_uri = uri,
+        .live = true,
     };
 
     test_precopy_common(&args);
@@ -1408,6 +1425,7 @@ static void test_precopy_unix_dirty_ring(void)
         },
         .listen_uri = uri,
         .connect_uri = uri,
+        .live = true,
     };
 
     test_precopy_common(&args);
@@ -1519,6 +1537,7 @@ static void test_precopy_unix_xbzrle(void)
         .start_hook = test_migrate_xbzrle_start,
 
         .iterations = 2,
+        .live = true,
     };
 
     test_precopy_common(&args);
@@ -1919,6 +1938,7 @@ static void test_multifd_tcp_none(void)
     MigrateCommon args = {
         .listen_uri = "defer",
         .start_hook = test_migrate_precopy_tcp_multifd_start,
+        .live = true,
     };
     test_precopy_common(&args);
 }
-- 
2.40.0


