Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE416DF83D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:20:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbKW-0000i0-RB; Wed, 12 Apr 2023 10:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKV-0000hJ-5s
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmbKT-0006TS-0V
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681309208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHd/Hc2Shq/LhFkYLXvRRxBndKDfCZnW2r2zw+r3qjo=;
 b=Zr/+VW/CGSQMEBPhwTU9J+zThUChbyc7+SADSKZPAeFWOW7QTIEeKQK3soBCEqyC0cwhdK
 AoWx23PEoSftZYbV6wmYerl1mruk3buc1thF/ootXE/kBt7DfSHztyfosPqLISsjVR5+8o
 vYEyBActDtwt9/C7X7DArq24Ihsql5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-U4sckj56NXaDw_1P7eHV9w-1; Wed, 12 Apr 2023 10:20:06 -0400
X-MC-Unique: U4sckj56NXaDw_1P7eHV9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1051A858F09
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 14:20:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E8A1121320;
 Wed, 12 Apr 2023 14:20:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/2] tests/migration: Only run auto_converge in slow mode
Date: Wed, 12 Apr 2023 16:20:01 +0200
Message-Id: <20230412142001.16501-3-quintela@redhat.com>
In-Reply-To: <20230412142001.16501-1-quintela@redhat.com>
References: <20230412142001.16501-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b05b0b7dd..6317131b50 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1795,6 +1795,21 @@ static void test_validate_uuid_dst_not_set(void)
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
@@ -2574,8 +2589,12 @@ int main(int argc, char **argv)
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
2.39.2


