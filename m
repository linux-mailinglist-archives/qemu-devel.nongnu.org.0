Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE663FED87
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:11:25 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlYy-0003qf-Fg
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0z-00015V-If
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0x-00051z-W3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VLUJbvcmSiVB3yjWRU37IAij7geppr70LiGoenbNYE=;
 b=PERH4ixOiyoGwmUapP6XBBGHANDn4n05G+gFhNJmQUGfzBB9BRszIuks2aFYaaA0aYCgTN
 mJG3mS0wGWjACKxqqmL5g3/9V1eVWzYcvCApHlQl+0gJkgvXbkP0om21bidm2O+JdQyXmY
 O2ZJqV94eZXifM4LDxJQ1o1HAT+yoas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-I8T72AfAP4OXAKSnvzrgYA-1; Thu, 02 Sep 2021 07:36:14 -0400
X-MC-Unique: I8T72AfAP4OXAKSnvzrgYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E7521009446
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 11:36:13 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2286A8F8;
 Thu,  2 Sep 2021 11:36:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/15] tests: migration-test: use qtest_has_accel() API
Date: Thu,  2 Sep 2021 07:35:50 -0400
Message-Id: <20210902113551.461632-15-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
---
CC: dgilbert@redhat.com
CC: pbonzini@redhat.com
CC: thuth@redhat.com
CC: lvivier@redhat.com
---
 tests/qtest/migration-test.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc5e83d98a..7b42f6fd90 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1420,6 +1420,7 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1434,8 +1435,7 @@ int main(int argc, char **argv)
      * some reason)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
-        (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1444,16 +1444,9 @@ int main(int argc, char **argv)
      * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
      * there until the problems are resolved
      */
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-#if defined(HOST_S390X)
-        if (access("/dev/kvm", R_OK | W_OK)) {
-            g_test_message("Skipping test: kvm not available");
-            return g_test_run();
-        }
-#else
-        g_test_message("Skipping test: Need s390x host to work properly");
+    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
+        g_test_message("Skipping test: s390x host with KVM is required");
         return g_test_run();
-#endif
     }
 
     tmpfs = mkdtemp(template);
-- 
2.27.0


