Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6548566865
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:43:44 +0200 (CEST)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g1v-0006XY-RL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwz-0006RL-4t
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwx-0005zY-FD
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwc+iXBws/23SLnZQiRVwc/hC4r78Tv2uAs7qc6w0Ts=;
 b=NbMDYWOp/f8/141082vbmFqGtr8Qt6hivJp/XbJWiF3AAKcEjJ8t6tkoOX9AZSo83RZs+C
 rMBmuvJcEOrwIiISRmRLg/x4L61QyieBXkP5J39AOJhbfk7pnGPOXenCTersO76WaffRsJ
 8PNGVEHcn8/ZnNhxaW0aNnBO9WVtzEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-R_JQJUauMpa8SCoTaq-Dmw-1; Tue, 05 Jul 2022 06:38:34 -0400
X-MC-Unique: R_JQJUauMpa8SCoTaq-Dmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF8ED29AA2E5;
 Tue,  5 Jul 2022 10:38:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8CD492CA3;
 Tue,  5 Jul 2022 10:38:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 10/14] tests: use consistent bandwidth/downtime limits in
 migration tests
Date: Tue,  5 Jul 2022 12:38:12 +0200
Message-Id: <20220705103816.608166-11-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

The different migration test cases are using a variety of settings
to ensure convergance/non-convergance. Introduce two helpers to
extra the common functionality and ensure consistency.

  * Non-convergance: 1ms downtime, 30mbs bandwidth
  * Convergance: 30s downtime, 1gbs bandwidth

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220628105434.295905-5-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


