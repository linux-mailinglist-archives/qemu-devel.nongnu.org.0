Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EFD55C079
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:57:57 +0200 (CEST)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68uq-0004Fv-6s
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rs-0000XB-Ke
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o68rr-0006XE-3X
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656413690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMHKYNA+glh4I0uMHgBY5dUYGmUujwoTHdWDTL53EV0=;
 b=FiawDveUN1ZIH5hvmMDSW0heJ3iuhDg4X98T3syNBEUan93VJvz9tp9eIaphfSpnsc737r
 prNOB19z+ISqtIOz3hhekWAecPY0ODXBW9eFFXilN1ocgcizD4oRW5nFMYBvt9yyBOljWC
 VJ+cWUMT2aXgm1gJfMu6zbfbt/+QzaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-8omwsF04Ofi14cKPaE7QEA-1; Tue, 28 Jun 2022 06:54:47 -0400
X-MC-Unique: 8omwsF04Ofi14cKPaE7QEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0823D801233;
 Tue, 28 Jun 2022 10:54:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75C18112131B;
 Tue, 28 Jun 2022 10:54:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 5/5] tests: stop skipping migration test on s390x/ppc64
Date: Tue, 28 Jun 2022 11:54:34 +0100
Message-Id: <20220628105434.295905-6-berrange@redhat.com>
In-Reply-To: <20220628105434.295905-1-berrange@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

There have been checks put into the migration test which skip it in a
few scenarios

 * ppc64 TCG
 * ppc64 KVM with kvm-pr
 * s390x TCG

In the original commits there are references to unexplained hangs in
the test. There is no record of details of where it was hanging, but
it is suspected that these were all a result of the max downtime limit
being set at too low a value to guarantee convergance.

Since a previous commit bumped the value from 1 second to 30 seconds,
it is believed that hangs due to non-convergance should be eliminated
and thus worth trying to remove the skipped scenarios.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9e64125f02..500169f687 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2085,7 +2085,6 @@ static bool kvm_dirty_ring_supported(void)
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
-    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2094,26 +2093,6 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    /*
-     * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
-     * is touchy due to race conditions on dirty bits (especially on PPC for
-     * some reason)
-     */
-    if (g_str_equal(qtest_get_arch(), "ppc64") &&
-        (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
-        g_test_message("Skipping test: kvm_hv not available");
-        return g_test_run();
-    }
-
-    /*
-     * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
-     * there until the problems are resolved
-     */
-    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
-        g_test_message("Skipping test: s390x host with KVM is required");
-        return g_test_run();
-    }
-
     tmpfs = mkdtemp(template);
     if (!tmpfs) {
         g_test_message("mkdtemp on path (%s): %s", template, strerror(errno));
-- 
2.36.1


