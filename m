Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930A4CACE9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:04:53 +0100 (CET)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTLI-0006XM-J9
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7y-0007UE-Iq
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7w-0008Qn-JS
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1RhqUzRrgQUzFff9VRw1AZE7aQy+mwpEY4rc2EbVgw=;
 b=Jj3BTfyF5lKp9AyzvGiY47uVrty1X83AzP+2rtx6li6FVU02Hg4K+uXwebnDls3k5pAonD
 8QG8nqMbVDOMxejHdW0Vw0SzxeXpoo0jq5hI5/Ck9JyYD3yyTLXCHB0Gq5/ACfk5j+TxoC
 vBYyZeZYqUhHZKiDLmnHnM7MNIy3lkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-oAPtlbE4OYW6NGNepOkvPg-1; Wed, 02 Mar 2022 12:51:02 -0500
X-MC-Unique: oAPtlbE4OYW6NGNepOkvPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D4695200
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:01 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 818088000B;
 Wed,  2 Mar 2022 17:50:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/18] tests: switch migration FD passing test to use common
 precopy helper
Date: Wed,  2 Mar 2022 17:49:24 +0000
Message-Id: <20220302174932.2692378-11-berrange@redhat.com>
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

The combination of the start and finish hooks allow the FD passing
code to use the precopy helper

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 55 +++++++++++++-----------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2f2059cebc..2082c58e8b 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1015,31 +1015,12 @@ static void test_precopy_tcp(void)
                         false /* dirty_ring */);
 }
 
-static void test_migrate_fd_proto(void)
+static void *test_migrate_fd_start_hook(QTestState *from,
+                                        QTestState *to)
 {
-    MigrateStart *args = migrate_start_new();
-    QTestState *from, *to;
+    QDict *rsp;
     int ret;
     int pair[2];
-    QDict *rsp;
-    const char *error_desc;
-
-    if (test_migrate_start(&from, &to, "defer", args)) {
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
@@ -1064,17 +1045,15 @@ static void test_migrate_fd_proto(void)
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
@@ -1092,11 +1071,15 @@ static void test_migrate_fd_proto(void)
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
+    test_precopy_common("defer",
+                        "fd:fd-mig",
+                        test_migrate_fd_start_hook,
+                        test_migrate_fd_finish_hook,
+                        false /* dirty_ring */);
 }
 
 static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
-- 
2.34.1


