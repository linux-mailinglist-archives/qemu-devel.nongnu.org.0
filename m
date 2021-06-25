Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183883B4090
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:31:48 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiBf-0003BV-3F
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzP-0002Pw-If
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzH-0006k1-SU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tN2QgPrlMI4LdV8X78Uet3cSbM2O+jnK759uoMySS9Y=;
 b=Hgxy2m1/82xldDEYf6aB3HSK410l9+8Y0jmbVKjEIYCa3zs2rnbcME4U7us4lyR/HPxK1i
 nINhEUS5C3vxUM7UTLfQ0F1M7ibWVX3/x6cV6kE++m2mb58xlTZx5fGVaLp8PllLP6ammJ
 WpnKfrjDShNZltXGe4HETpqpURLNO88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-Vonb8sKCPzyICVJyezLY2Q-1; Fri, 25 Jun 2021 05:18:56 -0400
X-MC-Unique: Vonb8sKCPzyICVJyezLY2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01E771019984
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:18:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6C1E60C05;
 Fri, 25 Jun 2021 09:18:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/53] tests: migration-test: use qtest_has_accel() API
Date: Fri, 25 Jun 2021 05:17:42 -0400
Message-Id: <20210625091818.1047980-19-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 2b028df687..eba18433bd 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1372,6 +1372,7 @@ static void test_multifd_tcp_cancel(void)
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1386,8 +1387,7 @@ int main(int argc, char **argv)
      * some reason)
      */
     if (g_str_equal(qtest_get_arch(), "ppc64") &&
-        (access("/sys/module/kvm_hv", F_OK) ||
-         access("/dev/kvm", R_OK | W_OK))) {
+        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
     }
@@ -1396,16 +1396,9 @@ int main(int argc, char **argv)
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


