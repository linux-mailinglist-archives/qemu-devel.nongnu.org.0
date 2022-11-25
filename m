Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D9638E30
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybSJ-0006lk-8e; Fri, 25 Nov 2022 11:21:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b148449fe7651e19c7a95ae0d78f2244c5f810e7@lizzy.crudebyte.com>)
 id 1oybSG-0006lc-DF
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:21:32 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b148449fe7651e19c7a95ae0d78f2244c5f810e7@lizzy.crudebyte.com>)
 id 1oybSE-0004zf-BJ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=XVaWa4RZvOF6goowH9f0hyFWmKVl1lX5zwz07Bmr+aU=; b=o3nXM
 mCl3LM9hAzFAsdoQyXMusf08/Z75is0rbaXgDyID/MmKXwmE8j+CUw7PpTENnuX2pFVEVlUQD1xWL
 jIe6hPlCyTpJOOzQSYifcWtOxS1cFx/PUM7/B7SzDKhLOJyyKhJLE345wcVsPB1C4BCMB/MAsY/2m
 zsxtwMwXg26nX+ZqSyg+GRKLjs3gKzydgY0Dki1B9WvpwH2b2XR+fVdbaY3xFzkwPM2n6897soH7S
 g6GSlKUeOFKzjljlvofgfy+j7cZptr+nIdo5uadf/Auzpq5q1tZkmujCC80vWcWG5PZLWWgNj3HJ3
 om1QhvhD1iBKfa/B7lcgEqJiRUkxA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 25 Nov 2022 16:58:53 +0100
Subject: [PATCH] tests/qtest/vhost-user-blk-test: don't abort all qtests on
 missing envar
To: qemu-devel@nongnu.org
Cc: Coiby Xu <coiby.xu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <E1oybRD-0005D5-5r@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b148449fe7651e19c7a95ae0d78f2244c5f810e7@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This test requires environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY
to be defined for running. If not, it would immediately abort all qtests
and prevent other, unrelated tests from running.

To fix that, just skip vhost-user-blk-test instead and log a message
about missing environment variable.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---

 I also tried g_test_skip(errmsg) from the setup handlers instead, but it
 always caused the tests to abort with an error:
 
 ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
 but encountered exit status 1 (expected 0)
 
 I haven't further investigated.

 tests/qtest/vhost-user-blk-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 07a4c2d500..dc37f5af4d 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -983,6 +983,12 @@ static void register_vhost_user_blk_test(void)
         .before = vhost_user_blk_test_setup,
     };
 
+    if (!getenv("QTEST_QEMU_STORAGE_DAEMON_BINARY")) {
+        g_test_message("QTEST_QEMU_STORAGE_DAEMON_BINARY not defined, "
+                       "skipping vhost-user-blk-test");
+        return;
+    }
+
     /*
      * tests for vhost-user-blk and vhost-user-blk-pci
      * The tests are borrowed from tests/virtio-blk-test.c. But some tests
-- 
2.30.2


