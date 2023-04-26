Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0A86EF277
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:44:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZO-0001uR-MQ; Wed, 26 Apr 2023 06:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prcZL-0001mx-GT
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prcZK-0003hf-3w
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682505613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8QdsUP6SikZizHlSb/W811YkaBJvBiTtrPOagdFkMPA=;
 b=goImbWigPLuutOmua/zFFsaEiFmPmRFyhXv21dda6LkiUKsczW5Zw4xOgR2WFxf2o5VFFv
 fHG7S5v1ZUy7IvFYvXPSmNeuAE7RdxpSsW7h/4jl9nE3s0lwtIzJfCDVWoeK2mZOb3Bi8P
 DyXvLZfafkn2cLb2xc6xj2Ch3YgQvgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-fmj39Ay7OT2mw2YmnSg7dA-1; Wed, 26 Apr 2023 06:40:12 -0400
X-MC-Unique: fmj39Ay7OT2mw2YmnSg7dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D3791C0514C;
 Wed, 26 Apr 2023 10:40:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30A4E2027043;
 Wed, 26 Apr 2023 10:40:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Hanna Czenczek <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2] tests/unit/test-blockjob: Re-enable complete_in_standby
 test
Date: Wed, 26 Apr 2023 06:40:09 -0400
Message-Id: <20230426104009.2571175-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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
 tests/unit/test-blockjob.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index a130f6fefb..7c03958feb 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -488,11 +488,14 @@ static void test_complete_in_standby(void)
     bdrv_drain_all_begin();
     assert_job_status_is(job, JOB_STATUS_STANDBY);
 
-    /* Lock the IO thread to prevent the job from being run */
-    aio_context_acquire(ctx);
+    /*
+     * Increase pause_count so that the counter is
+     * unbalanced and job won't resume
+     */
+    job_pause(job);
+
     /* This will schedule the job to resume it */
     bdrv_drain_all_end();
-    aio_context_release(ctx);
 
     WITH_JOB_LOCK_GUARD() {
         /* But the job cannot run, so it will remain on standby */
@@ -531,13 +534,6 @@ int main(int argc, char **argv)
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


