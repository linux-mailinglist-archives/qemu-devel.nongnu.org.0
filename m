Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A978D6A9B61
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wk-0007pp-Qo; Fri, 03 Mar 2023 11:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wh-0007jI-A5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wf-0005lU-QF
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g081gxg4TZ4oy1nAGXBSfCdUr8j/qtgE119mN5AvAgA=;
 b=NCwmwSbp9cYkBjnx7J36vJuyjcW6T9YX/9ugati4nQhDK5xpYuVMLiY9BElsq+XISznurN
 bBuUk77x5nbHV6G8UfkM8VVxwO3CUAXxm31mfJlA7xypEnlk5+KM77tHib5l6Ng09HrOdJ
 iZflZ+4IfKGFNwNlfNdbfjCxqqZ3tHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-TMbQ7gkFMsi4XRQ9z902dw-1; Fri, 03 Mar 2023 11:07:40 -0500
X-MC-Unique: TMbQ7gkFMsi4XRQ9z902dw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57328811E6E;
 Fri,  3 Mar 2023 16:07:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F281A492C18;
 Fri,  3 Mar 2023 16:07:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 6/8] iotests: always use a unique sub-directory per test
Date: Fri,  3 Mar 2023 16:07:25 +0000
Message-Id: <20230303160727.3977246-7-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The current test runner is only safe against parallel execution within
a single instance of the 'check' process, and only if -j is given a
value greater than 2. This prevents running multiple copies of the
'check' process for different test scenarios.

This change switches the output / socket directories to always include
the test name, image format and image protocol. This should allow full
parallelism of all distinct test scenarios. eg running both qcow2 and
raw tests at the same time, or both file and nbd tests at the same
time.

It would be possible to allow for parallelism of the same test scenario
by including the pid, but that would potentially let many directories
accumulate over time on failures, so is not done.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 81519ed6e2..7b322272e9 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -228,13 +228,11 @@ def find_reference(self, test: str) -> str:
 
         return f'{test}.out'
 
-    def do_run_test(self, test: str, mp: bool) -> TestResult:
+    def do_run_test(self, test: str) -> TestResult:
         """
         Run one test
 
         :param test: test file path
-        :param mp: if true, we are in a multiprocessing environment, use
-                   personal subdirectories for test run
 
         Note: this method may be called from subprocess, so it does not
         change ``self`` object in any way!
@@ -257,12 +255,14 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
 
         args = [str(f_test.resolve())]
         env = self.env.prepare_subprocess(args)
-        if mp:
-            # Split test directories, so that tests running in parallel don't
-            # break each other.
-            for d in ['TEST_DIR', 'SOCK_DIR']:
-                env[d] = os.path.join(env[d], f_test.name)
-                Path(env[d]).mkdir(parents=True, exist_ok=True)
+
+        # Split test directories, so that tests running in parallel don't
+        # break each other.
+        for d in ['TEST_DIR', 'SOCK_DIR']:
+            env[d] = os.path.join(
+                env[d],
+                f"{self.env.imgfmt}-{self.env.imgproto}-{f_test.name}")
+            Path(env[d]).mkdir(parents=True, exist_ok=True)
 
         test_dir = env['TEST_DIR']
         f_bad = Path(test_dir, f_test.name + '.out.bad')
@@ -347,7 +347,7 @@ def run_test(self, test: str,
             testname = os.path.basename(test)
             print(f'# running {self.env.imgfmt} {testname}')
 
-        res = self.do_run_test(test, mp)
+        res = self.do_run_test(test)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
         self.test_print_one_line(test=test,
-- 
2.39.2


