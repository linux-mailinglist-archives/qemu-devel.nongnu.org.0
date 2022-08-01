Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BA4586E43
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:07:11 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXwk-0001CP-7T
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlP-00039u-44
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlK-0001NE-UY
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pd4DSXWZ2BpSI3AA/IPBOY8l4LinBjl/Hl+fz+v0MG0=;
 b=KJ2Zcj/ALBAN+XfB/70aVMBY6AZtbPWQH8Hu+BEhr6+I2Ng3vEtmPykAYQL8WIGU2TnU9f
 CMRvWj7WvOXSij94lv9Li8H82Nxwd4bmzvMTjiKEpI1anbOuDWHqU0YjR+IiT8ehfwXA8/
 2sjXhyMkjeBWZt+JEZWOKviX7tDRzjw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-3bSqZCiFPfasTmi_oEHfEQ-1; Mon, 01 Aug 2022 11:55:18 -0400
X-MC-Unique: 3bSqZCiFPfasTmi_oEHfEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FCD7294EDCE;
 Mon,  1 Aug 2022 15:55:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31BFC18EA8;
 Mon,  1 Aug 2022 15:55:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 2/7] migration-test: Use migrate_ensure_converge() for
 auto-converge
Date: Mon,  1 Aug 2022 17:55:01 +0200
Message-Id: <20220801155506.254316-3-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Thomas reported that auto-converge test will timeout on MacOS CI gatings.
Use the migrate_ensure_converge() helper too in the auto-converge as when
Daniel reworked the other test cases.

Since both max_bandwidth / downtime_limit will not be used for converge
calculations, make it simple by removing the remaining check, then we can
completely remove both variables altogether, since migrate_ensure_converge
is used the remaining check won't make much sense anyway.

Reported-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220728133516.92061-2-peterx@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 71595a74fd..c1e002087d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1768,7 +1768,7 @@ static void test_migrate_auto_converge(void)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart args = {};
     QTestState *from, *to;
-    int64_t remaining, percentage;
+    int64_t percentage;
 
     /*
      * We want the test to be stable and as fast as possible.
@@ -1776,14 +1776,6 @@ static void test_migrate_auto_converge(void)
      * so we need to decrease a bandwidth.
      */
     const int64_t init_pct = 5, inc_pct = 50, max_pct = 95;
-    const int64_t max_bandwidth = 400000000; /* ~400Mb/s */
-    const int64_t downtime_limit = 250; /* 250ms */
-    /*
-     * We migrate through unix-socket (> 500Mb/s).
-     * Thus, expected migration speed ~= bandwidth limit (< 500Mb/s).
-     * So, we can predict expected_threshold
-     */
-    const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
 
     if (test_migrate_start(&from, &to, uri, &args)) {
         return;
@@ -1818,8 +1810,7 @@ static void test_migrate_auto_converge(void)
     /* The first percentage of throttling should be equal to init_pct */
     g_assert_cmpint(percentage, ==, init_pct);
     /* Now, when we tested that throttling works, let it converge */
-    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
-    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
+    migrate_ensure_converge(from);
 
     /*
      * Wait for pre-switchover status to check last throttle percentage
@@ -1830,11 +1821,6 @@ static void test_migrate_auto_converge(void)
     /* The final percentage of throttling shouldn't be greater than max_pct */
     percentage = read_migrate_property_int(from, "cpu-throttle-percentage");
     g_assert_cmpint(percentage, <=, max_pct);
-
-    remaining = read_ram_property_int(from, "remaining");
-    g_assert_cmpint(remaining, <,
-                    (expected_threshold + expected_threshold / 100));
-
     migrate_continue(from, "pre-switchover");
 
     qtest_qmp_eventwait(to, "RESUME");
@@ -1842,7 +1828,6 @@ static void test_migrate_auto_converge(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
 
-
     test_migrate_end(from, to, true);
 }
 
-- 
2.31.1


