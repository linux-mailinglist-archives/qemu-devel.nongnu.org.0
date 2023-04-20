Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3E6E8F9A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHn-00013J-Uq; Thu, 20 Apr 2023 06:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHe-0000xE-Pf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-00081F-C8
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8L+XTVYeStGD3qBofj8rGWz3Lk6YmUs3hvoFQftr5s=;
 b=HnlDN1uqYB3wasX8SxyffetoCEGic7IuJ7TYYZwtD8l8aac8CoLUjQWdIe1sWXsks80BGR
 WOB+e14FtVd7vBise149b3LQETd62NRM9UjDN8A14KY63F+QpnKuj3WmkSBslUsVFgwYIG
 0DkkxnsfYqZcd0zgQ9rHLU2VPBFefz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-77_n4a_xPkqEJ4nknKRg8A-1; Thu, 20 Apr 2023 06:12:32 -0400
X-MC-Unique: 77_n4a_xPkqEJ4nknKRg8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 720B4185A7A9;
 Thu, 20 Apr 2023 10:12:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90F65440BC;
 Thu, 20 Apr 2023 10:12:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 09/23] tests/migration: Only run auto_converge in slow mode
Date: Thu, 20 Apr 2023 12:12:02 +0200
Message-Id: <20230420101216.786304-10-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230412142001.16501-3-quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..60dd53d3ec 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1796,6 +1796,21 @@ static void test_validate_uuid_dst_not_set(void)
     do_test_validate_uuid(&args, false);
 }
 
+/*
+ * The way auto_converge works, we need to do too many passes to
+ * run this test.  Auto_converge logic is only run once every
+ * three iterations, so:
+ *
+ * - 3 iterations without auto_converge enabled
+ * - 3 iterations with pct = 5
+ * - 3 iterations with pct = 30
+ * - 3 iterations with pct = 55
+ * - 3 iterations with pct = 80
+ * - 3 iterations with pct = 95 (max(95, 80 + 25))
+ *
+ * To make things even worse, we need to run the initial stage at
+ * 3MB/s so we enter autoconverge even when host is (over)loaded.
+ */
 static void test_migrate_auto_converge(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -2575,8 +2590,12 @@ int main(int argc, char **argv)
                    test_validate_uuid_src_not_set);
     qtest_add_func("/migration/validate_uuid_dst_not_set",
                    test_validate_uuid_dst_not_set);
-
-    qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
+    /*
+     * See explanation why this test is slow on function definition
+     */
+    if (g_test_slow()) {
+        qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
+    }
     qtest_add_func("/migration/multifd/tcp/plain/none",
                    test_multifd_tcp_none);
     /*
-- 
2.31.1


