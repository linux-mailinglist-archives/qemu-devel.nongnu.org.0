Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64326EB064
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:16:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuLx-0004LL-20; Fri, 21 Apr 2023 13:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLp-0004J1-Kt
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppuLP-0008Fv-T5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682097286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIgLP/m1YpVv6v0gWloisUl5qczqbC6ZSGsdkG8SV6Y=;
 b=TOLBOPToTCe0ZdTK3LTaOjfcWxZZNFK206lpF0UM36rvTC+DFAc+gAN5KBv6nsU3QXM9FR
 UPOXkapLO1kUfBtoR0bKWmfwGkWRH5aFaa8q8v3pY/WyNhCFiLg9GDy0bBrLDAkw+jRx9F
 gczw4i1XlK1bquEpctBHZGczwLd8XAc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-0GCgKuE5MrOB7fXyH6cQbw-1; Fri, 21 Apr 2023 13:14:42 -0400
X-MC-Unique: 0GCgKuE5MrOB7fXyH6cQbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DE03382C969;
 Fri, 21 Apr 2023 17:14:42 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2315F492C13;
 Fri, 21 Apr 2023 17:14:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 6/6] tests/migration: Only run auto_converge in slow mode
Date: Fri, 21 Apr 2023 18:14:11 +0100
Message-Id: <20230421171411.566300-7-berrange@redhat.com>
In-Reply-To: <20230421171411.566300-1-berrange@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
---
 tests/qtest/migration-test.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 63bd8a1893..9ed178aa03 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1877,6 +1877,21 @@ static void test_validate_uuid_dst_not_set(void)
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
@@ -2660,8 +2675,12 @@ int main(int argc, char **argv)
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
2.40.0


