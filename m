Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A16A611B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7KF-0004P3-4u; Tue, 28 Feb 2023 16:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KD-0004OS-6U
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7KB-0004Lv-QT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnnWKKTt/Jd/lhXQoVvXu5e26trL+RnjsW3fkNmubwk=;
 b=ZnG92HC1wnnJHnVzLPZ2ykHza1j1jRXyP5xjRserCF2nCt89SesCv+FzehCoFUDoBNivcp
 BPPGBXJVeD612+uQ/mTNfTBwJDgufDA6ktIExGH/MAeEpBMkO5dyXZQLJxLAkpWIDdLii0
 xQYkP/c7WT3bwRn0PmkXwcBitiBweNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-Y0I8oD_HMs-5sHDkANj9MQ-1; Tue, 28 Feb 2023 16:15:47 -0500
X-MC-Unique: Y0I8oD_HMs-5sHDkANj9MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3216980D0F1;
 Tue, 28 Feb 2023 21:15:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 089A840C6EC4;
 Tue, 28 Feb 2023 21:15:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 4/6] tests/qtest/readconfig-test: Allow testing for arbitrary
 memory sizes
Date: Tue, 28 Feb 2023 22:15:31 +0100
Message-Id: <20230228211533.201837-5-thuth@redhat.com>
In-Reply-To: <20230228211533.201837-1-thuth@redhat.com>
References: <20230228211533.201837-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Make test_x86_memdev_resp() more flexible by allowing arbitrary
memory sizes as parameter here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/readconfig-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 2160603880..533623f638 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -48,7 +48,7 @@ static QTestState *qtest_init_with_config(const char *cfgdata)
     return qts;
 }
 
-static void test_x86_memdev_resp(QObject *res)
+static void test_x86_memdev_resp(QObject *res, const char *mem_id, int size)
 {
     Visitor *v;
     g_autoptr(MemdevList) memdevs = NULL;
@@ -63,8 +63,8 @@ static void test_x86_memdev_resp(QObject *res)
     g_assert(!memdevs->next);
 
     memdev = memdevs->value;
-    g_assert_cmpstr(memdev->id, ==, "ram");
-    g_assert_cmpint(memdev->size, ==, 200 * MiB);
+    g_assert_cmpstr(memdev->id, ==, mem_id);
+    g_assert_cmpint(memdev->size, ==, size * MiB);
 
     visit_free(v);
 }
@@ -80,7 +80,7 @@ static void test_x86_memdev(void)
     qts = qtest_init_with_config(cfgdata);
     /* Test valid command */
     resp = qtest_qmp(qts, "{ 'execute': 'query-memdev' }");
-    test_x86_memdev_resp(qdict_get(resp, "return"));
+    test_x86_memdev_resp(qdict_get(resp, "return"), "ram", 200);
     qobject_unref(resp);
 
     qtest_quit(qts);
-- 
2.31.1


