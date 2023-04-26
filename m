Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13276EF015
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:17:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praJw-0004l5-F9; Wed, 26 Apr 2023 04:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1praJu-0004kb-EF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1praJr-0001a7-Gh
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682496966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/g914JzMP30qeXp3jvw+m3GPwam/j0vWaxgnCiCZ8kE=;
 b=GREe7qts7i97ZJO+GUbYFOHQIdWA/GLF+7Cbpfhq8C0hptbtJ5R8U3SxRA9vYlREAnm7T2
 kvvqeA0NK53eBGRjyw1HKv3StFdP60QUpz06jytLUyXt9tlHYdiEb1r8+WG0SXvvmxrV7J
 0LKnobo6nA1a/IlGeRs5z20O/V1To3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-FC2OgaXYOR6AFWQM3P08EQ-1; Wed, 26 Apr 2023 04:16:04 -0400
X-MC-Unique: FC2OgaXYOR6AFWQM3P08EQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 978AD85C064;
 Wed, 26 Apr 2023 08:16:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FEBA14171BA;
 Wed, 26 Apr 2023 08:16:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH] tests/unit/test-blockjob: Re-enable complete_in_standby test
Date: Wed, 26 Apr 2023 04:16:01 -0400
Message-Id: <20230426081601.2567990-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Pause the job while draining so that pause_count will be
increased and bdrv_drain_all_end() won't reset it to 0, so the
job will not continue.

With this fix, the test is not flaky anymore.

Additionally remove useless aiocontext lock around bdrv_drain_all_end()
in test_complete_in_standby().

Fixes: b6903cbe3a2 "tests/unit/test-blockjob: Disable
complete_in_standby test"
Suggested-by: Hanna Czenczek <hreitz@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/unit/test-blockjob.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index a130f6fefb..46d720aeee 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -488,11 +488,15 @@ static void test_complete_in_standby(void)
     bdrv_drain_all_begin();
     assert_job_status_is(job, JOB_STATUS_STANDBY);
 
+    /*
+     * Increase pause_count so that the counter is
+     * unbalanced and job won't resume
+     */
+    job_pause(job);
+
     /* Lock the IO thread to prevent the job from being run */
-    aio_context_acquire(ctx);
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
-    aio_context_release(ctx);
 
     WITH_JOB_LOCK_GUARD() {
         /* But the job cannot run, so it will remain on standby */
@@ -531,13 +535,6 @@ int main(int argc, char **argv)
     g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
     g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
     g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
-
-    /*
-     * This test is flaky and sometimes fails in CI and otherwise:
-     * don't run unless user opts in via environment variable.
-     */
-    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
-        g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
-    }
+    g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
     return g_test_run();
 }
-- 
2.39.1


