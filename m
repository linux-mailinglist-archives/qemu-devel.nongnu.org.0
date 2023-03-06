Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2B56AC4C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCjJ-0001eN-NX; Mon, 06 Mar 2023 10:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZCjH-0001dw-Nt
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:26:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZCjG-0000Nj-2Y
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678116381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oR2qukHad2ZQk40M71HRTYUiSSA2Z0kEp3gw66HMQ1c=;
 b=MuiY9ntviQTtoRfnZ0uVI/o1LTF2yKbSr3qePH1NIY383m+nRbxtTMzNClA1I96dFthS50
 7a9A/6tfdAWUAAmNw7rGQDKJM7GQx2mFdgeAJv2DosjYhqzI8UQaVr5wSlQjG89hHlqIOV
 zYTa3c0uJ1gI/KUJsA5iQFhOxCxxVkM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-eftbjCrePimG9y6n-IuGIw-1; Mon, 06 Mar 2023 10:26:19 -0500
X-MC-Unique: eftbjCrePimG9y6n-IuGIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ABA71C17421
 for <qemu-devel@nongnu.org>; Mon,  6 Mar 2023 15:26:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3BE34010E36;
 Mon,  6 Mar 2023 15:26:18 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, quintela@redhat.com,
 berrange@redhat.com
Subject: [PATCH] tests/migration: Tweek auto converge limits check
Date: Mon,  6 Mar 2023 15:26:12 +0000
Message-Id: <20230306152612.52291-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
2.39.2


