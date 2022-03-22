Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F14E3E10
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:05:40 +0100 (CET)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdGd-0000hL-6P
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:05:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8H-00029X-Ta
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8F-0006OX-Lw
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLErHhAIi5XpZjFmOH1NiP4uXeC/QEa+uKzYplPrjd8=;
 b=TuqZ2yeZ64NvQHSB7l/rCvLj72KMNdPQ8Arps3fnZZ5Fgja7ZrGiPnEFp888KGDSyGXIeh
 3zRPJV7QJZ74H1YIkskaw6zZZWKcNELivUSIVz9T3VDMGs9onYNaAflEpBLgoOQLqhpMJR
 ri0OH9/N50t4ImH3NYgvScasXMnuWAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-_L69XSR9MF2sl7c-P6_Pag-1; Tue, 22 Mar 2022 07:56:56 -0400
X-MC-Unique: _L69XSR9MF2sl7c-P6_Pag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 980A13C16182;
 Tue, 22 Mar 2022 11:56:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 552D4400E881;
 Tue, 22 Mar 2022 11:56:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/25] tests: Do not treat the iotests as separate meson test
 target anymore
Date: Tue, 22 Mar 2022 12:56:26 +0100
Message-Id: <20220322115647.726044-5-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

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
Message-Id: <20220310075048.2303495-1-thuth@redhat.com>
Tested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 meson.build            | 6 +++---
 scripts/mtest2make.py  | 4 ----
 tests/Makefile.include | 9 +--------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..f71e1a1468 100644
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
2.35.1


