Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF06EB061
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:16:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuLl-0004GA-Vg; Fri, 21 Apr 2023 13:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLi-0004Er-5I
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLL-0008FG-U4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682097279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VXWg0L75HwDwdYbxVHo0xl3QCzybdJvp4oWtQ+cTQz8=;
 b=ivvXDB6pOuujUFqOzba1aCx97/XJR6eYYVldQYT4n+s3VCjpG+BaKGmZ3QzBFvpp2RuHSS
 o/tLQP8Veiek+VCBc1EVHLAWF26L7XWj/3IcQY2cvUOVl5foqahjC3Wqvo8XCeZz0Eblpz
 M/dueXBI5CLHFnTL11vMohs96e3K6qo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-7Pe1nLtJNSCam9tDctLhtA-1; Fri, 21 Apr 2023 13:14:36 -0400
X-MC-Unique: 7Pe1nLtJNSCam9tDctLhtA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DEC0185A792;
 Fri, 21 Apr 2023 17:14:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19210492C13;
 Fri, 21 Apr 2023 17:14:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/6] tests/qtests: remove migration test iterations config
Date: Fri, 21 Apr 2023 18:14:07 +0100
Message-Id: <20230421171411.566300-3-berrange@redhat.com>
In-Reply-To: <20230421171411.566300-1-berrange@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The 'unsigned int interations' config for migration is somewhat
overkill. Most tests don't set it, and a value of '0' is treated
as equivalent to '1'. The only test that does set it, xbzrle,
used a value of '2'.

This setting, however, only relates to the migration iterations
that take place prior to allowing convergence. IOW, on top of
this iteration count, there is always at least 1 further migration
iteration done to deal with pages that are dirtied during the
previous iteration(s).

IOW, even with iterations==1, the xbzrle test will be running for
a minimum of 2 iterations. With this in mind we can simplify the
code and just get rid of the special case.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ac2e8ecac6..e16120ff30 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -568,9 +568,6 @@ typedef struct {
         MIG_TEST_FAIL_DEST_QUIT_ERR,
     } result;
 
-    /* Optional: set number of migration passes to wait for */
-    unsigned int iterations;
-
     /* Postcopy specific fields */
     void *postcopy_data;
     bool postcopy_preempt;
@@ -1354,13 +1351,7 @@ static void test_precopy_common(MigrateCommon *args)
             qtest_set_expected_status(to, EXIT_FAILURE);
         }
     } else {
-        if (args->iterations) {
-            while (args->iterations--) {
-                wait_for_migration_pass(from);
-            }
-        } else {
-            wait_for_migration_pass(from);
-        }
+        wait_for_migration_pass(from);
 
         migrate_ensure_converge(from);
 
@@ -1514,8 +1505,6 @@ static void test_precopy_unix_xbzrle(void)
         .listen_uri = uri,
 
         .start_hook = test_migrate_xbzrle_start,
-
-        .iterations = 2,
     };
 
     test_precopy_common(&args);
-- 
2.40.0


