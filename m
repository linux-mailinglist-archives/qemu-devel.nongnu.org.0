Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7A4C0FE9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:14:32 +0100 (CET)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMofH-0005PG-H3
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo73-0003hz-Sm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMo6n-0006rE-9q
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645609132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8ew1PBtrjnnwvDGKmcp6L/l+r15vz6y4Mrs4U+PNhM=;
 b=LE2M7IfLOvaIbVCWaw6q1gy9OvTq3HOaxi/OFxk35vPLtpTVAHuvR9RMMY5crByjgh1uvZ
 XpWB156a4hrd8/Jvv5H723kjRUy4WFBKkFtbqzjISrHdq639SCijbzWyNF/75atTUfQRcj
 zzqeWCiDVQCk6ZeRQnmw8jdm8tnPSj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ZWPtOoTcPMGMbMpK-HfdNA-1; Wed, 23 Feb 2022 04:38:51 -0500
X-MC-Unique: ZWPtOoTcPMGMbMpK-HfdNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 698D71854E21;
 Wed, 23 Feb 2022 09:38:50 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51F647610F;
 Wed, 23 Feb 2022 09:38:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v3 4/4] tests: Do not treat the iotests as separate meson test
 target anymore
Date: Wed, 23 Feb 2022 10:38:40 +0100
Message-Id: <20220223093840.2515281-5-thuth@redhat.com>
In-Reply-To: <20220223093840.2515281-1-thuth@redhat.com>
References: <20220223093840.2515281-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If there is a failing iotest, the output is currently not logged to
the console anymore. To get this working again, we need to run the
meson test runner with --print-errorlogs (and without --verbose).
We could update the "meson test" call in tests/Makefile.include,
but actually it's nicer and easier if we simply do not treat the
iotests as separate test target anymore and integrate them along
with the other test suites.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build            | 6 +++---
 scripts/mtest2make.py  | 4 ----
 tests/Makefile.include | 9 +--------
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 8df40bfac4..556479c785 100644
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


