Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACE50A6B3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:12:01 +0200 (CEST)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaLY-00066a-47
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrZ-0007e2-6z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrX-000333-IX
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShCUuI63/mt3wpxMNlFt0Jc5lH6COcup9Ii6XnVBldc=;
 b=LZwGi4DFjH0vbYlZtGsZpSyK20VX63lDvWWwDj9PUaoK3RqXRXPAApdTRIFmEomm9s+XGS
 81IqPmlZCWrKgzf6X2u+1yM9CqfTGNXbvxT21UZMkb3ZeffPR+dD2hR2CSpxSD5C0hGpnc
 3Kr0/Z9r9Kz6esuCUg4l4zXBuNFDKgM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-7m0u2G6LNI6P1lEH9epp7g-1; Thu, 21 Apr 2022 12:40:57 -0400
X-MC-Unique: 7m0u2G6LNI6P1lEH9epp7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76FE0101AA4D
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:40:57 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B14EF40D016E;
 Thu, 21 Apr 2022 16:40:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 07/18] tests: introduce ability to provide hooks for migration
 precopy test
Date: Thu, 21 Apr 2022 17:40:32 +0100
Message-Id: <20220421164043.209703-8-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

There are alot of different scenarios to test with migration due to the
wide number of parameters and capabilities available. To enable sharing
of the basic precopy test scenario, we need to be able to set arbitrary
parameters and capabilities before the migration is initiated, but don't
want to have all this logic in the common helper function. Solve this
by defining two hooks that can be provided by the test case, one before
migration starts and one after migration finishes.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-10-berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index b62869b3af..ae40429798 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -778,6 +778,30 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
+/*
+ * A hook that runs after the src and dst QEMUs have been
+ * created, but before the migration is started. This can
+ * be used to set migration parameters and capabilities.
+ *
+ * Returns: NULL, or a pointer to opaque state to be
+ *          later passed to the TestMigrateFinishHook
+ */
+typedef void * (*TestMigrateStartHook)(QTestState *from,
+                                       QTestState *to);
+
+/*
+ * A hook that runs after the migration has finished,
+ * regardless of whether it succeeded or failed, but
+ * before QEMU has terminated (unless it self-terminated
+ * due to migration error)
+ *
+ * @opaque is a pointer to state previously returned
+ * by the TestMigrateStartHook if any, or NULL.
+ */
+typedef void (*TestMigrateFinishHook)(QTestState *from,
+                                      QTestState *to,
+                                      void *opaque);
+
 typedef struct {
     /* Optional: fine tune start parameters */
     MigrateStart start;
@@ -792,11 +816,17 @@ typedef struct {
      * This allows for dynamically picking a free TCP port.
      */
     const char *connect_uri;
+
+    /* Optional: callback to run at start to set migration parameters */
+    TestMigrateStartHook start_hook;
+    /* Optional: callback to run at finish to cleanup */
+    TestMigrateFinishHook finish_hook;
 } MigrateCommon;
 
 static void test_precopy_common(MigrateCommon *args)
 {
     QTestState *from, *to;
+    void *data_hook = NULL;
 
     if (test_migrate_start(&from, &to, args->listen_uri, &args->start)) {
         return;
@@ -812,6 +842,10 @@ static void test_precopy_common(MigrateCommon *args)
     /* 1GB/s */
     migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
+    if (args->start_hook) {
+        data_hook = args->start_hook(from, to);
+    }
+
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
 
@@ -837,6 +871,10 @@ static void test_precopy_common(MigrateCommon *args)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
 
+    if (args->finish_hook) {
+        args->finish_hook(from, to, data_hook);
+    }
+
     test_migrate_end(from, to, true);
 }
 
-- 
2.35.1


