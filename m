Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8D4CFC7D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:17:09 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBMS-0004zH-MC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAiv-00051X-4L
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAit-0008F9-6P
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNRDJ21qQNR8GF8FAQrzMqLvaNF1Ci5U6M0TF4aeVjM=;
 b=dAo4Qcd/EUv0PZkvAOx0t+V8DzOYMd9eXWiYwZHPrgR/KlVxM+p3wbqMnaE+hHqXeOEpUA
 /QMsrngjHNTOrgLdBCbgfbk6hW4FIBKgxEkueEJOKlv90rziFR0zJF8c1w2h/B7sWlCidy
 xXvXvkGajJSWolWqaw9urKu5VVl2/no=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-h3iKIJ17Pxy36_0gd2wOGQ-1; Mon, 07 Mar 2022 05:36:11 -0500
X-MC-Unique: h3iKIJ17Pxy36_0gd2wOGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B741854E27;
 Mon,  7 Mar 2022 10:36:10 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D92B37FCE3;
 Mon,  7 Mar 2022 10:36:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/23] iotests: Write test output to TEST_DIR
Date: Mon,  7 Mar 2022 11:35:33 +0100
Message-Id: <20220307103549.808809-8-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the use of OUTPUT_DIR (test/qemu-iotests under the build
directory), and instead write test output files (.out.bad, .notrun, and
.casenotrun) to TEST_DIR.

With this, the same test can be run concurrently without the separate
instances interfering, because they will need separate TEST_DIRs anyway.
Running the same test separately is useful when running the iotests with
various format/protocol combinations in parallel, or when you just want
to aggressively exercise a single test (e.g. when it fails only
sporadically).

Putting this output into TEST_DIR means that it will stick around for
inspection after the test run is done (though running the same test in
the same TEST_DIR will overwrite it, just as it used to be); but given
that TEST_DIR is a scratch directory, it should be clear that users can
delete all of its content at any point.  (And if TEST_DIR is on tmpfs,
it will just disappear on shutdown.)  Contrarily, alternative approaches
that would put these output files into OUTPUT_DIR with some prefix to
differentiate between separate test runs might easily lead to cluttering
OUTPUT_DIR.

(This change means OUTPUT_DIR is no longer written to by the iotests, so
we can drop its usage altogether.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220221172909.762858-1-hreitz@redhat.com>
[hreitz: Simplified `Path(os.path.join(x, y))` to `Path(x, y)`, as
         suggested by Vladimir; and rebased on 9086c7639822b6
         ("tests/qemu-iotests: Rework the checks and spots using GNU
         sed")]
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/common.rc     |  6 +++---
 tests/qemu-iotests/iotests.py    |  5 ++---
 tests/qemu-iotests/testenv.py    |  5 +----
 tests/qemu-iotests/testrunner.py | 14 ++++++++------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 3bfd94c2e0..227e0a5be9 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -20,7 +20,7 @@
 # bail out, setting up .notrun file
 _notrun()
 {
-    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
+    echo "$*" >"$TEST_DIR/$seq.notrun"
     echo "$seq not run: $*"
     status=0
     exit
@@ -739,14 +739,14 @@ _img_info()
 #
 _casenotrun()
 {
-    echo "    [case not run] $*" >>"$OUTPUT_DIR/$seq.casenotrun"
+    echo "    [case not run] $*" >>"$TEST_DIR/$seq.casenotrun"
 }
 
 # just plain bail out
 #
 _fail()
 {
-    echo "$*" | tee -a "$OUTPUT_DIR/$seq.full"
+    echo "$*" | tee -a "$TEST_DIR/$seq.full"
     echo "(see $seq.full for details)"
     status=1
     exit 1
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6027780180..aff1b5d305 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -85,7 +85,6 @@
 
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
-output_dir = os.environ.get('OUTPUT_DIR', '.')
 
 try:
     test_dir = os.environ['TEST_DIR']
@@ -1239,7 +1238,7 @@ def notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    with open('%s/%s.notrun' % (output_dir, seq), 'w', encoding='utf-8') \
+    with open('%s/%s.notrun' % (test_dir, seq), 'w', encoding='utf-8') \
             as outfile:
         outfile.write(reason + '\n')
     logger.warning("%s not run: %s", seq, reason)
@@ -1254,7 +1253,7 @@ def case_notrun(reason):
     # Each test in qemu-iotests has a number ("seq")
     seq = os.path.basename(sys.argv[0])
 
-    with open('%s/%s.casenotrun' % (output_dir, seq), 'a', encoding='utf-8') \
+    with open('%s/%s.casenotrun' % (test_dir, seq), 'a', encoding='utf-8') \
             as outfile:
         outfile.write('    [case not run] ' + reason + '\n')
 
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0f32897fe8..b11e943c8a 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -66,7 +66,7 @@ class TestEnv(ContextManager['TestEnv']):
     # pylint: disable=too-many-instance-attributes
 
     env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
-                     'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
+                     'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
                      'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
@@ -106,7 +106,6 @@ def init_directories(self) -> None:
              TEST_DIR
              SOCK_DIR
              SAMPLE_IMG_DIR
-             OUTPUT_DIR
         """
 
         # Path where qemu goodies live in this source tree.
@@ -134,8 +133,6 @@ def init_directories(self) -> None:
                                         os.path.join(self.source_iotests,
                                                      'sample_images'))
 
-        self.output_dir = os.getcwd()  # OUTPUT_DIR
-
     def init_binaries(self) -> None:
         """Init binary path variables:
              PYTHON (for bash tests)
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0c7dc34a9e..41083ff9c6 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -259,9 +259,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
         """
 
         f_test = Path(test)
-        f_bad = Path(f_test.name + '.out.bad')
-        f_notrun = Path(f_test.name + '.notrun')
-        f_casenotrun = Path(f_test.name + '.casenotrun')
         f_reference = Path(self.find_reference(test))
 
         if not f_test.exists():
@@ -276,9 +273,6 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
                               description='No qualified output '
                                           f'(expected {f_reference})')
 
-        for p in (f_bad, f_notrun, f_casenotrun):
-            silent_unlink(p)
-
         args = [str(f_test.resolve())]
         env = self.env.prepare_subprocess(args)
         if mp:
@@ -288,6 +282,14 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
                 env[d] = os.path.join(env[d], f_test.name)
                 Path(env[d]).mkdir(parents=True, exist_ok=True)
 
+        test_dir = env['TEST_DIR']
+        f_bad = Path(test_dir, f_test.name + '.out.bad')
+        f_notrun = Path(test_dir, f_test.name + '.notrun')
+        f_casenotrun = Path(test_dir, f_test.name + '.casenotrun')
+
+        for p in (f_notrun, f_casenotrun):
+            silent_unlink(p)
+
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
             with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
-- 
2.34.1


