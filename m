Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66814586E86
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:26:57 +0200 (CEST)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIYFs-0000NR-Io
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlb-0003BX-WC
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXla-0001Qg-Gb
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFqc/nNPDWhWfFZC8SljVXPbsUa/yxO8SSc2AAOM91w=;
 b=TRc31MBPQlOcR6MnaHUyIh5wHt+de7iA7ESixL6U+T33A1DvgzoCoZn4A6PJhdBPBZ7rym
 BP3V/2t7ZTTOQEd6zaW7qNKJFyovIdlT8t45lM/TCWcLOqSN4yr9eNWA8BNI7ZIJetWKxc
 dXDErnrMxEsiQrCYbg5ATOIAnyktyOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-yIrLv12sM4W6XRLdUUH32A-1; Mon, 01 Aug 2022 11:55:33 -0400
X-MC-Unique: yIrLv12sM4W6XRLdUUH32A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B317D185A7A4;
 Mon,  1 Aug 2022 15:55:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBBD6906B9;
 Mon,  1 Aug 2022 15:55:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 7/7] tests/qtest/migration-test: Run the dirty ring tests only
 with the x86 target
Date: Mon,  1 Aug 2022 17:55:06 +0200
Message-Id: <20220801155506.254316-8-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Message-Id: <20220801114644.208197-1-thuth@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 10ab7a708c..520a5f917c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2425,6 +2425,7 @@ int main(int argc, char **argv)
     char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
+    const char *arch = qtest_get_arch();
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2434,7 +2435,7 @@ int main(int argc, char **argv)
      * is touchy due to race conditions on dirty bits (especially on PPC for
      * some reason)
      */
-    if (g_str_equal(qtest_get_arch(), "ppc64") &&
+    if (g_str_equal(arch, "ppc64") &&
         (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
         g_test_message("Skipping test: kvm_hv not available");
         return g_test_run();
@@ -2444,7 +2445,7 @@ int main(int argc, char **argv)
      * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
      * there until the problems are resolved
      */
-    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
+    if (g_str_equal(arch, "s390x") && !has_kvm) {
         g_test_message("Skipping test: s390x host with KVM is required");
         return g_test_run();
     }
@@ -2559,7 +2560,7 @@ int main(int argc, char **argv)
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
-    if (kvm_dirty_ring_supported()) {
+    if (g_str_equal(arch, "x86_64") && has_kvm && kvm_dirty_ring_supported()) {
         qtest_add_func("/migration/dirty_ring",
                        test_precopy_unix_dirty_ring);
         qtest_add_func("/migration/vcpu_dirty_limit",
-- 
2.31.1


