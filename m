Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC74D420F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 08:53:57 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSDcR-0006RT-Le
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 02:53:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDZg-0005YY-DQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDZb-0005mi-9I
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646898658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mqGzftMbKNmdQoE9Jf1ClTHrAS/THt5h+UG7Kjd2L90=;
 b=f87Yck0asjqRhavkmYVVD/+3ffGpo/kiZ6ZHSOtjsFi3fwO427ZhqZiQ/tudl0aSbAw2qI
 b2lT4sQR+etZWcx/O9bSCOHirNidk5jfmA11Hhe3qA6VZSh0mC+CEK/nwk0WtqBBWv/4ID
 MnnynfITspAFmCiAL5HsS/qyo7Qr8YE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-n0R2kXcpOvmp91jnDJpXIQ-1; Thu, 10 Mar 2022 02:50:52 -0500
X-MC-Unique: n0R2kXcpOvmp91jnDJpXIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DDB51091DA1;
 Thu, 10 Mar 2022 07:50:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4446B66E34;
 Thu, 10 Mar 2022 07:50:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
Date: Thu, 10 Mar 2022 08:50:48 +0100
Message-Id: <20220310075048.2303495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If there is a failing iotest, the output is currently not logged to
the console anymore. To get this working again, we need to run the
meson test runner with "--print-errorlogs" (and without "--verbose"
due to a current meson bug that will be fixed here:
https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
We could update the "meson test" call in tests/Makefile.include,
but actually it's nicer and easier if we simply do not treat the
iotests as separate test target anymore and integrate them along
with the other test suites. This has the disadvantage of not getting
the detailed progress indication there anymore, but since that was
only working right in single-threaded "make -j1" mode anyway, it's
not a huge loss right now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v4: updated commit description

 meson.build            | 6 +++---
 scripts/mtest2make.py  | 4 ----
 tests/Makefile.include | 9 +--------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 2d6601467f..4f5b9f5ec5 100644
--- a/meson.build
+++ b/meson.build
@@ -3,9 +3,9 @@ project('qemu', ['c'], meson_version: '>=0.59.3',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
-add_test_setup('quick', exclude_suites: ['block', 'slow', 'thorough'], is_default: true)
-add_test_setup('slow', exclude_suites: ['block', 'thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
-add_test_setup('thorough', exclude_suites: ['block'], env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
+add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
+add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
+add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
 
 not_found = dependency('', required: false)
 keyval = import('keyval')
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 4d542e8aaa..304634b71e 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -101,10 +101,6 @@ def emit_suite(name, suite, prefix):
 testsuites = defaultdict(Suite)
 for test in introspect['tests']:
     process_tests(test, targets, testsuites)
-# HACK: check-block is a separate target so that it runs with --verbose;
-# only write the dependencies
-emit_suite_deps('block', testsuites['block'], 'check')
-del testsuites['block']
 emit_prolog(testsuites, 'check')
 for name, suite in testsuites.items():
     emit_suite(name, suite, 'check')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..b89018cdcc 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -147,16 +147,9 @@ check-acceptance: check-acceptance-deprecated-warning | check-avocado
 
 # Consolidated targets
 
-.PHONY: check-block check check-clean get-vm-images
+.PHONY: check check-clean get-vm-images
 check:
 
-ifneq ($(.check-block.deps),)
-check: check-block
-check-block: run-ninja
-	$(if $(MAKE.n),,+)$(MESON) test $(MTESTARGS) $(.mtestargs) --verbose \
-		--logbase iotestslog $(call .speed.$(SPEED), block block-slow block-thorough)
-endif
-
 check-build: run-ninja
 
 check-clean:
-- 
2.27.0


