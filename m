Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39B6B7A09
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:12:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbitN-0005YP-Qe; Mon, 13 Mar 2023 10:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitK-0005VD-M8
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitG-0006bw-7g
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678716665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/i0rcKiB/Lm+gIKa6w8fX6K4qK1bqkU/Vy5l2Ma27g=;
 b=iL0hW3fiuWJ1VBHmYDIWvCajzblXxXfKTXb65usQA8mKpBzmVZ4rAiQXB4JwVHjqge4TtE
 It8YgorF0h733Y4FcgPw92BB8pGXDyqjJd9+Z3Q0Mt6YDYvZPHPO8pfZyw8jeNHVAljItN
 lhtoQTHm4Xk3Z6MZNAbaCDbZ7FFECus=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-6KFzix50MH-LMc5AEYTT8w-1; Mon, 13 Mar 2023 10:11:01 -0400
X-MC-Unique: 6KFzix50MH-LMc5AEYTT8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02EEF857A84;
 Mon, 13 Mar 2023 14:11:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E60A1121315;
 Mon, 13 Mar 2023 14:10:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/5] tests/migration: Tweek auto converge limits check
Date: Mon, 13 Mar 2023 15:10:53 +0100
Message-Id: <20230313141057.230810-2-thuth@redhat.com>
In-Reply-To: <20230313141057.230810-1-thuth@redhat.com>
References: <20230313141057.230810-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Thomas found an autoconverge test failure where the
migration completed before the autoconverge had kicked in.

To try and avoid this again:
  a) Reduce the usleep in test_migrate_auto_converge
    so that it should exit quicker when autoconverge kicks in
  b) Make the loop exit immediately rather than have the sleep
     when it does start autoconverge, otherwise the autoconverge
     might succeed during the sleep.
  c) Reduce inc_pct so auto converge happens more slowly
  d) Reduce the max-bandwidth in migrate_ensure_non_converge
    to make the ensure more ensure.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20230306152612.52291-1-dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d4ab3934ed..75d4f1d4a9 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -408,8 +408,8 @@ static void migrate_set_parameter_str(QTestState *who, const char *parameter,
 
 static void migrate_ensure_non_converge(QTestState *who)
 {
-    /* Can't converge with 1ms downtime + 30 mbs bandwidth limit */
-    migrate_set_parameter_int(who, "max-bandwidth", 30 * 1000 * 1000);
+    /* Can't converge with 1ms downtime + 3 mbs bandwidth limit */
+    migrate_set_parameter_int(who, "max-bandwidth", 3 * 1000 * 1000);
     migrate_set_parameter_int(who, "downtime-limit", 1);
 }
 
@@ -1808,7 +1808,7 @@ static void test_migrate_auto_converge(void)
      * E.g., with 1Gb/s bandwith migration may pass without throttling,
      * so we need to decrease a bandwidth.
      */
-    const int64_t init_pct = 5, inc_pct = 50, max_pct = 95;
+    const int64_t init_pct = 5, inc_pct = 25, max_pct = 95;
 
     if (test_migrate_start(&from, &to, uri, &args)) {
         return;
@@ -1835,13 +1835,16 @@ static void test_migrate_auto_converge(void)
 
     /* Wait for throttling begins */
     percentage = 0;
-    while (percentage == 0) {
+    do {
         percentage = read_migrate_property_int(from, "cpu-throttle-percentage");
-        usleep(100);
+        if (percentage != 0) {
+            break;
+        }
+        usleep(20);
         g_assert_false(got_stop);
-    }
-    /* The first percentage of throttling should be equal to init_pct */
-    g_assert_cmpint(percentage, ==, init_pct);
+    } while (true);
+    /* The first percentage of throttling should be at least init_pct */
+    g_assert_cmpint(percentage, >=, init_pct);
     /* Now, when we tested that throttling works, let it converge */
     migrate_ensure_converge(from);
 
-- 
2.31.1


