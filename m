Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D615868E1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 13:54:21 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIU04-0004Xm-5p
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 07:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oITst-0006Te-HM
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oITsp-0008Qs-Md
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659354410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ya3VeLtj/3HgXQ1hZzCDtK6OFYfwrDh0g8Xw5nuCeew=;
 b=GJBX/tMsfEY6sYgiG9gMhvEdFQLYRKw6p0wLiV5c1HN8NC6yAt8v2gbGM0jhgZQtTkrIv8
 RSQMwSHkk8fWfnBK8OfIr51yOBQGgN1KLELfflb1RAx+uO3FnV6dFwbTbfxo3tOLZWkphL
 9WiC+8vPIDRWKYaIZfGjXBdJMd8+GaQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-T32fT5jWPnu4WXDgN_HfyA-1; Mon, 01 Aug 2022 07:46:49 -0400
X-MC-Unique: T32fT5jWPnu4WXDgN_HfyA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 220B8811E75;
 Mon,  1 Aug 2022 11:46:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C062492C3B;
 Mon,  1 Aug 2022 11:46:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, peterx@redhat.com
Subject: [PATCH] tests/qtest/migration-test: Run the dirty ring tests only
 with the x86 target
Date: Mon,  1 Aug 2022 13:46:44 +0200
Message-Id: <20220801114644.208197-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

kvm_dirty_ring_supported() only checks whether the dirty ring support
is available on the x86 host, but it ignores whether the target QEMU
architecture is x86 or not. Thus the test_vcpu_dirty_limit() test
currently fails with the assert((strcmp(arch, "x86_64") == 0)) statement
in dirtylimit_start_vm() if the users run e.g. "make check-qtest-aarch64"
on their x86 host. Fix it by only executing the tests when we're running
with a x86_64 target QEMU binary with KVM.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 71595a74fd..f83360e0e0 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2439,6 +2439,7 @@ int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
+    const char *arch = qtest_get_arch();
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2452,7 +2453,7 @@ int main(int argc, char **argv)
      * is touchy due to race conditions on dirty bits (especially on PPC for
      * some reason)
      */
-    if (g_str_equal(qtest_get_arch(), "ppc64") &&
+    if (g_str_equal(arch, "ppc64") &&
         (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
@@ -2462,7 +2463,7 @@ int main(int argc, char **argv)
      * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
      * there until the problems are resolved
      */
-    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
+    if (g_str_equal(arch, "s390x") && !has_kvm) {
         g_test_message("Skipping test: s390x host with KVM is required");
         return g_test_run();
     }
@@ -2572,7 +2573,7 @@ int main(int argc, char **argv)
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
-    if (kvm_dirty_ring_supported()) {
+    if (g_str_equal(arch, "x86_64") && has_kvm && kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
                        test_precopy_unix_dirty_ring);
         qtest_add_func("/migration/vcpu_dirty_limit",
-- 
2.31.1


