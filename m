Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EA50A751
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:42:39 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhapB-0002yH-K0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZra-0007eV-5j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrY-00033G-IQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXXeq/F97wMpl3QZrWtox0qlKB/Ki3jgj0ftB3LfKfo=;
 b=DOY/9CFUbjod+ztaacCQ+7CqswfZ1+jlpABzWLkZLmvxpJi7vzrpS+0ArZiYJ6Qqn70m5B
 Q4Q51u9+dga1CxZ94wketMD/X1t1HC0nhODNGtEFIhzVhT7K88W5ym0ceLHwzc1LpGSB63
 FGocIA987CPwSoLF13QquB+QIY8b78Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-YMsyywIqNMSVJn2OVydjIA-1; Thu, 21 Apr 2022 12:40:58 -0400
X-MC-Unique: YMsyywIqNMSVJn2OVydjIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7944B811E81
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:40:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B23C940D016F;
 Thu, 21 Apr 2022 16:40:57 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 08/18] tests: switch migration FD passing test to use common
 precopy helper
Date: Thu, 21 Apr 2022 17:40:33 +0100
Message-Id: <20220421164043.209703-9-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

The combination of the start and finish hooks allow the FD passing
code to use the precopy helper

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-11-berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 57 +++++++++++++-----------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ae40429798..04f749aaa1 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1002,31 +1002,12 @@ static void test_precopy_tcp(void)
     test_precopy_common(&args);
 }
 
-static void test_migrate_fd_proto(void)
+static void *test_migrate_fd_start_hook(QTestState *from,
+                                        QTestState *to)
 {
-    MigrateStart args = {};
-    QTestState *from, *to;
+    QDict *rsp;
     int ret;
     int pair[2];
-    QDict *rsp;
-    const char *error_desc;
-
-    if (test_migrate_start(&from, &to, "defer", &args)) {
-        return;
-    }
-
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge */
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
-
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
 
     /* Create two connected sockets for migration */
     ret = socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
@@ -1051,17 +1032,15 @@ static void test_migrate_fd_proto(void)
     qobject_unref(rsp);
     close(pair[1]);
 
-    /* Start migration to the 2nd socket*/
-    migrate_qmp(from, "fd:fd-mig", "{}");
-
-    wait_for_migration_pass(from);
-
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+    return NULL;
+}
 
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
+static void test_migrate_fd_finish_hook(QTestState *from,
+                                        QTestState *to,
+                                        void *opaque)
+{
+    QDict *rsp;
+    const char *error_desc;
 
     /* Test closing fds */
     /* We assume, that QEMU removes named fd from its list,
@@ -1079,11 +1058,17 @@ static void test_migrate_fd_proto(void)
     error_desc = qdict_get_str(qdict_get_qdict(rsp, "error"), "desc");
     g_assert_cmpstr(error_desc, ==, "File descriptor named 'fd-mig' not found");
     qobject_unref(rsp);
+}
 
-    /* Complete migration */
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-    test_migrate_end(from, to, true);
+static void test_migrate_fd_proto(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .connect_uri = "fd:fd-mig",
+        .start_hook = test_migrate_fd_start_hook,
+        .finish_hook = test_migrate_fd_finish_hook
+    };
+    test_precopy_common(&args);
 }
 
 static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
-- 
2.35.1


