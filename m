Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A393586E5C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:13:20 +0200 (CEST)
Received: from localhost ([::1]:56814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIY2h-0005ju-7K
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlV-0003Ap-47
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlO-0001Nh-0V
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugZhdVI29kdk+nGGsHnjguOGlo5mLGU3fuPU5Yu+Ewk=;
 b=dpDAk7samKUa07vKp4ZeWWcf+z/9KYX1vIefdO+Pyd1XRmvuHoGEl+GvPOyP7XPCDNVezO
 3BtpfRTnBSjpcy9ZXYjlPvrTPk5gsd2cie8Wh1ctRMT6QjuGTMl1As9fKS9lzuidnDFvW9
 xW9Pvjn2jHZNX0O2C9UUuboa75vw66s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-5ekPSOGqNoONThwoQnV0kg-1; Mon, 01 Aug 2022 11:55:20 -0400
X-MC-Unique: 5ekPSOGqNoONThwoQnV0kg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 282D48032F6;
 Mon,  1 Aug 2022 15:55:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F65218EA8;
 Mon,  1 Aug 2022 15:55:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 3/7] migration-test: Allow test to run without uffd
Date: Mon,  1 Aug 2022 17:55:02 +0200
Message-Id: <20220801155506.254316-4-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We used to stop running all tests if uffd is not detected.  However
logically that's only needed for postcopy not the rest of tests.

Keep running the rest when still possible.

Signed-off-by: Peter Xu <peterx@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220728133516.92061-3-peterx@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 48 +++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c1e002087d..10ab7a708c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2424,14 +2424,11 @@ int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_uffd = ufd_version_check();
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -2460,13 +2457,15 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/plain", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery/plain",
-                   test_postcopy_recovery);
-    qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
-    qtest_add_func("/migration/postcopy/preempt/recovery/plain",
-                    test_postcopy_preempt_recovery);
+    if (has_uffd) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/plain", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery/plain",
+                       test_postcopy_recovery);
+        qtest_add_func("/migration/postcopy/preempt/plain", test_postcopy_preempt);
+        qtest_add_func("/migration/postcopy/preempt/recovery/plain",
+                       test_postcopy_preempt_recovery);
+    }
 
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
@@ -2474,18 +2473,21 @@ int main(int argc, char **argv)
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-    /*
-     * NOTE: psk test is enough for postcopy, as other types of TLS
-     * channels are tested under precopy.  Here what we want to test is the
-     * general postcopy path that has TLS channel enabled.
-     */
-    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
-    qtest_add_func("/migration/postcopy/recovery/tls/psk",
-                   test_postcopy_recovery_tls_psk);
-    qtest_add_func("/migration/postcopy/preempt/tls/psk",
-                   test_postcopy_preempt_tls_psk);
-    qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
-                   test_postcopy_preempt_all);
+
+    if (has_uffd) {
+        /*
+         * NOTE: psk test is enough for postcopy, as other types of TLS
+         * channels are tested under precopy.  Here what we want to test is the
+         * general postcopy path that has TLS channel enabled.
+         */
+        qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+        qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                       test_postcopy_recovery_tls_psk);
+        qtest_add_func("/migration/postcopy/preempt/tls/psk",
+                       test_postcopy_preempt_tls_psk);
+        qtest_add_func("/migration/postcopy/preempt/recovery/tls/psk",
+                       test_postcopy_preempt_all);
+    }
 #ifdef CONFIG_TASN1
     qtest_add_func("/migration/precopy/unix/tls/x509/default-host",
                    test_precopy_unix_tls_x509_default_host);
-- 
2.31.1


