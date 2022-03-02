Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC14CACBC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:59:57 +0100 (CET)
Received: from localhost ([::1]:33770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTGW-0006q6-Dv
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7v-0007Ru-KG
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7t-0008OA-Mr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xk2bg+w+t479K7e12gxC03cc6fYtP7mFlXQG4+v/d0I=;
 b=L99fI1nndbPrfMnljqpUFz3X0O+CS4X/huTeplW9TBdDNCkXU4KuMWqGTeNp/O4HVx5SuF
 V1ree90KFP1puh9XefBlScPxYKZBVgABldZNSKPIZE0rb7NsBMVTQNmkuwrq9nvroLNy4P
 Qn5PqCCF6vBnDL97/er7U/IkqMz2n3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-jzOhRhMsPFyL2pIEA1n8kQ-1; Wed, 02 Mar 2022 12:51:00 -0500
X-MC-Unique: jzOhRhMsPFyL2pIEA1n8kQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BACF5200
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:50:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0422C8000B;
 Wed,  2 Mar 2022 17:50:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] tests: introduce ability to provide hooks for migration
 precopy test
Date: Wed,  2 Mar 2022 17:49:23 +0000
Message-Id: <20220302174932.2692378-10-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/qtest/migration-test.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c1058dc944..2f2059cebc 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -796,11 +796,37 @@ static void test_baddest(void)
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
 /*
  * Common helper for running a precopy migration test
  *
  * @listen_uri: the URI for the dst QEMU to listen on
  * @connect_uri: the URI for the src QEMU to connect to
+ * @start_hook: (optional) callback to run at start to set migration parameters
+ * @finish_hook: (optional) callback to run at finish to cleanup
  * @dirty_ring: true to use dirty ring tracking
  *
  * If @connect_uri is NULL, then it will query the dst
@@ -810,11 +836,14 @@ static void test_baddest(void)
  */
 static void test_precopy_common(const char *listen_uri,
                                 const char *connect_uri,
+                                TestMigrateStartHook start_hook,
+                                TestMigrateFinishHook finish_hook,
                                 bool dirty_ring)
 {
     MigrateStart *args = migrate_start_new();
     g_autofree char *local_connect_uri = NULL;
     QTestState *from, *to;
+    void *data_hook = NULL;
 
     args->use_dirty_ring = dirty_ring;
 
@@ -832,6 +861,10 @@ static void test_precopy_common(const char *listen_uri,
     /* 1GB/s */
     migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
+    if (start_hook) {
+        data_hook = start_hook(from, to);
+    }
+
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
 
@@ -855,6 +888,10 @@ static void test_precopy_common(const char *listen_uri,
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
 
+    if (finish_hook) {
+        finish_hook(from, to, data_hook);
+    }
+
     test_migrate_end(from, to, true);
 }
 
@@ -864,6 +901,8 @@ static void test_precopy_unix_common(bool dirty_ring)
 
     test_precopy_common(uri,
                         uri,
+                        NULL, /* start_hook */
+                        NULL, /* finish_hook */
                         dirty_ring);
 }
 
@@ -971,6 +1010,8 @@ static void test_precopy_tcp(void)
 {
     test_precopy_common("tcp:127.0.0.1:0",
                         NULL, /* connect_uri */
+                        NULL, /* start_hook */
+                        NULL, /* finish_hook */
                         false /* dirty_ring */);
 }
 
-- 
2.34.1


