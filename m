Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A737B6C1292
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBR-0001N9-04; Mon, 20 Mar 2023 09:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBG-0001Jo-G1
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBD-0006LH-Ud
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cwqlw8oWlou3+tFn5+hA7fC3dHFru2/VHUK4twtGTo=;
 b=dCWZsS45ZlwSuWXqfC0mnAFz9ftWZUALg8ML1LEdS6BFiBgmltxa00TTvo1Jn5bO7nD9wb
 6rMaBj0mVxAr+qqQ5+8gOJZPWHRTFiMbh45FjyMlNa0k8C3RJyUzvF96DvXMXy5U2kQNz7
 24ErW2B18TpD5rPXDRTVtedXAh2BUHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-YORwVLMMOeusOuGGBOvudQ-1; Mon, 20 Mar 2023 09:04:01 -0400
X-MC-Unique: YORwVLMMOeusOuGGBOvudQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EAE6855300;
 Mon, 20 Mar 2023 13:04:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0233C15BA0;
 Mon, 20 Mar 2023 13:04:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 22/24] tests/unit/test-blockjob: Disable complete_in_standby
 test
Date: Mon, 20 Mar 2023 14:03:28 +0100
Message-Id: <20230320130330.406378-23-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

From: Peter Maydell <peter.maydell@linaro.org>

The blockjob/complete_in_standby test is flaky and fails
intermittently in CI:

172/621 qemu:unit / test-blockjob
           ERROR           0.26s   killed by signal 6 SIGABRT
11:03:46 MALLOC_PERTURB_=176
G_TEST_SRCDIR=/Users/pm215/src/qemu-for-merges/tests/unit
G_TEST_BUILDDIR=/Users/pm215/src/qemu-for-merges/build/all/tests/unit
/Users/pm215/src/qemu-for-merges/build/all/tests/unit/test-blockjob
--tap -k
----------------------------------- output -----------------------------------
stdout:
# random seed: R02S8c79d6e1c01ce0b25475b2210a253242
1..9
# Start of blockjob tests
ok 1 /blockjob/ids
stderr:
Assertion failed: (job->status == JOB_STATUS_STANDBY), function
test_complete_in_standby, file ../../tests/unit/test-blockjob.c, line
499.

Seen on macOS/x86_64, FreeBSD 13/x86_64, msys2-64bit, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
https://gitlab.com/qemu-project/qemu/-/jobs/3950667240

Disable this subtest until somebody has time to investigate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230317143534.1481947-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-blockjob.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index c0426bd10c..a130f6fefb 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -531,6 +531,13 @@ int main(int argc, char **argv)
     g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
     g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
     g_test_add_func("/blockjob/cancel/concluded", test_cancel_concluded);
-    g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
+
+    /*
+     * This test is flaky and sometimes fails in CI and otherwise:
+     * don't run unless user opts in via environment variable.
+     */
+    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
+        g_test_add_func("/blockjob/complete_in_standby", test_complete_in_standby);
+    }
     return g_test_run();
 }
-- 
2.31.1


