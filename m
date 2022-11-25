Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6263853A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 09:33:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyU7I-0007Y5-7c; Fri, 25 Nov 2022 03:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyU70-0007U9-No
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 03:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyU6y-0006P2-Mw
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 03:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669365061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/kSSNyESKJDsd1YzIoxyT8KCaLoYLln+DTdopHndciA=;
 b=gtQvzag1LUnvOGynZ8t/L+rAa5FOjxk9rjtlM6RVMvYfk5LQdRRWcwm77baV8ybzByny29
 6AmjReSAYd0/bazrV8f5PJFjwi1AH04VwyYn+lFM1SUKn4RNljuvvAoX9Nwq4S9bKLQaZH
 al7W7zUb0BddpmOiNe3v7Q9VgRjIA3Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Y4r-O8qyPN6DTscTr5bOLQ-1; Fri, 25 Nov 2022 03:31:00 -0500
X-MC-Unique: Y4r-O8qyPN6DTscTr5bOLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C250C1C06904
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 08:30:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D4E31400B15;
 Fri, 25 Nov 2022 08:30:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests/qtest/migration-test: Fix unlink error and memory leaks
Date: Fri, 25 Nov 2022 09:30:54 +0100
Message-Id: <20221125083054.117504-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When running the migration test compiled with Clang from Fedora 37
and sanitizers enabled, there is an error complaining about unlink():

 ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
  passed as argument 1, which is declared to never be null
 /usr/include/unistd.h:858:48: note: nonnull attribute specified here
 SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
  ../tests/qtest/migration-test.c:1072:12 in
 (test program exited with status code 1)
 TAP parsing error: Too few tests run (expected 33, got 20)

The data->clientcert and data->clientkey pointers can indeed be unset
in some tests, so we have to check them before calling unlink() with
those.

While we're at it, I also noticed that the code is only freeing
some but not all of the allocated strings in this function, and
indeed, valgrind is also complaining about memory leaks here.
So let's call g_free() on all allocated strings to avoid leaking
memory here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 442998d9eb..dbde726adf 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1066,15 +1066,27 @@ test_migrate_tls_x509_finish(QTestState *from,
     TestMigrateTLSX509Data *data = opaque;
 
     test_tls_cleanup(data->keyfile);
+    g_free(data->keyfile);
+
     unlink(data->cacert);
+    g_free(data->cacert);
     unlink(data->servercert);
+    g_free(data->servercert);
     unlink(data->serverkey);
-    unlink(data->clientcert);
-    unlink(data->clientkey);
-    rmdir(data->workdir);
+    g_free(data->serverkey);
 
+    if (data->clientcert) {
+        unlink(data->clientcert);
+        g_free(data->clientcert);
+    }
+    if (data->clientkey) {
+        unlink(data->clientkey);
+        g_free(data->clientkey);
+    }
+
+    rmdir(data->workdir);
     g_free(data->workdir);
-    g_free(data->keyfile);
+
     g_free(data);
 }
 #endif /* CONFIG_TASN1 */
-- 
2.31.1


