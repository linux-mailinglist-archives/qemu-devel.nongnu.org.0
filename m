Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152F55C078
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:57:44 +0200 (CEST)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68ud-0003dK-4f
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rr-0000TM-2X
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rp-0006WV-7h
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaoBvyqnmaBx57AzM7IDHSb4QRZiZyWXZZIh24Icw28=;
 b=L5eXtmiTbks5PRmbeHdQaDBrGZVJKRqhIC0UjVzTWTpOfMILIC5wl1uAsgMDy7hqs37VIS
 Mh2Pd/rLNnjNsX1utWvy9OY+0g79rh95u5LoJARrw1poj7OTrwdGj83sPk/XReRE6z4K6x
 VaVe7kfXKzAKodQzslefY6+2G1qYLxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-ab8f7mVfOkakMVRDHxtKFg-1; Tue, 28 Jun 2022 06:54:45 -0400
X-MC-Unique: ab8f7mVfOkakMVRDHxtKFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D458811E76;
 Tue, 28 Jun 2022 10:54:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42AE0112131B;
 Tue, 28 Jun 2022 10:54:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/5] tests: use consistent bandwidth/downtime limits in
 migration tests
Date: Tue, 28 Jun 2022 11:54:33 +0100
Message-Id: <20220628105434.295905-5-berrange@redhat.com>
In-Reply-To: <20220628105434.295905-1-berrange@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The different migration test cases are using a variety of settings
to ensure convergance/non-convergance. Introduce two helpers to
extra the common functionality and ensure consistency.

  * Non-convergance: 1ms downtime, 30mbs bandwidth
  * Convergance: 30s downtime, 1gbs bandwidth

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 54 +++++++++++++-----------------------
 1 file changed, 20 insertions(+), 34 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index a54eff6d56..9e64125f02 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -46,9 +46,6 @@ unsigned start_address;
 unsigned end_address;
 static bool uffd_feature_thread_id;
 
-/* A downtime where the test really should converge */
-#define CONVERGE_DOWNTIME (1000 * 30)
-
 #if defined(__linux__)
 #include <sys/syscall.h>
 #include <sys/vfs.h>
@@ -402,6 +399,20 @@ static void migrate_set_parameter_str(QTestState *who, const char *parameter,
     migrate_check_parameter_str(who, parameter, value);
 }
 
+static void migrate_ensure_non_converge(QTestState *who)
+{
+    /* Can't converge with 1ms downtime + 30 mbs bandwidth limit */
+    migrate_set_parameter_int(who, "max-bandwidth", 30 * 1000 * 1000);
+    migrate_set_parameter_int(who, "downtime-limit", 1);
+}
+
+static void migrate_ensure_converge(QTestState *who)
+{
+    /* Should converge with 30s downtime + 1 gbs bandwidth limit */
+    migrate_set_parameter_int(who, "max-bandwidth", 1 * 1000 * 1000 * 1000);
+    migrate_set_parameter_int(who, "downtime-limit", 30 * 1000);
+}
+
 static void migrate_pause(QTestState *who)
 {
     QDict *rsp;
@@ -984,12 +995,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
-    /* We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
-    migrate_set_parameter_int(from, "downtime-limit", 1);
+    migrate_ensure_non_converge(from);
 
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
@@ -1188,15 +1194,7 @@ static void test_precopy_common(MigrateCommon *args)
         return;
     }
 
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge*/
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
+    migrate_ensure_non_converge(from);
 
     if (args->start_hook) {
         data_hook = args->start_hook(from, to);
@@ -1230,7 +1228,7 @@ static void test_precopy_common(MigrateCommon *args)
             wait_for_migration_pass(from);
         }
 
-        migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+        migrate_ensure_converge(from);
 
         /* We do this first, as it has a timeout to stop us
          * hanging forever if migration didn't converge */
@@ -1694,8 +1692,7 @@ static void test_migrate_auto_converge(void)
      * Set the initial parameters so that the migration could not converge
      * without throttling.
      */
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100Mb/s */
+    migrate_ensure_non_converge(from);
 
     /* To check remaining size after precopy */
     migrate_set_capability(from, "pause-before-switchover", true);
@@ -2000,15 +1997,7 @@ static void test_multifd_tcp_cancel(void)
         return;
     }
 
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge*/
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 300MB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
+    migrate_ensure_non_converge(from);
 
     migrate_set_parameter_int(from, "multifd-channels", 16);
     migrate_set_parameter_int(to, "multifd-channels", 16);
@@ -2054,10 +2043,7 @@ static void test_multifd_tcp_cancel(void)
 
     wait_for_migration_status(from, "cancelled", NULL);
 
-    /* 300ms it should converge */
-    migrate_set_parameter_int(from, "downtime-limit", 300);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
+    migrate_ensure_converge(from);
 
     migrate_qmp(from, uri, "{}");
 
-- 
2.36.1


