Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FE4D502B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:24:55 +0100 (CET)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMX0-0005V1-6T
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRu-00039Y-4y
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRs-0003fy-J0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nBfhy9UBLjqhChQKBdb9ltd4tW2nMjMQ5jncP1hgrOM=;
 b=dRHa+UPjSdT2ZKOtGHphlXZMdGEpxCjwSbsxKlMXVbTTwuD4FAA0kgs5kMqGkx+vqDoZUL
 7RYu+af0IVAnVbMv1fsEpnzCynqm798vzG9P8FHQ7g8wTi1j+6GQUyfb3ceOjhTE944ETw
 dPudrhw8fog8QLjDJLNcugf0lzZHEhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-5tPJMAnmOKub4b1XTEMSIg-1; Thu, 10 Mar 2022 12:19:34 -0500
X-MC-Unique: 5tPJMAnmOKub4b1XTEMSIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953FC1006AA5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBDAC106D5DC;
 Thu, 10 Mar 2022 17:19:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] tests: introduce ability to provide hooks for
 migration precopy test
Date: Thu, 10 Mar 2022 17:18:12 +0000
Message-Id: <20220310171821.3724080-10-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are alot of different scenarios to test with migration due to the
wide number of parameters and capabilities available. To enable sharing
of the basic precopy test scenario, we need to be able to set arbitrary
parameters and capabilities before the migration is initiated, but don't
want to have all this logic in the common helper function. Solve this
by defining two hooks that can be provided by the test case, one before
migration starts and one after migration finishes.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.34.1


