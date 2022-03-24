Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A251D4E68CF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:43:10 +0100 (CET)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSQP-0003ai-Og
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:43:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEI-0000E0-Sc
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEB-0005fq-5R
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WssQk+2T0vBMSu+xPswDkCX1BKz3NSTQkMjKnyPNb0=;
 b=S1EtFgW5DG9N280v3vmqeAx0l8lwut2ob8O+T8q72T51XQHeFscl7D4ah2fDDFP2KrI8fB
 hhxmMcxm6w+fmUiWu7FCXpzYUpHeC1j6clhPinG8D3ZidrTRpjcehwOizBKgJ7YZRU3FSu
 bZg/Q0g+eW69okFiBjGGd3CYXII3aDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-KzdVCCOnPU6tAPIDWf1OJQ-1; Thu, 24 Mar 2022 14:30:26 -0400
X-MC-Unique: KzdVCCOnPU6tAPIDWf1OJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505AD899ECD;
 Thu, 24 Mar 2022 18:30:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BF4AC27D8D;
 Thu, 24 Mar 2022 18:30:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] iotests: Don't check qemu_io() output for specific
 error strings
Date: Thu, 24 Mar 2022 14:30:04 -0400
Message-Id: <20220324183018.2476551-4-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A forthcoming commit updates qemu_io() to raise an exception on non-zero
return by default, and changes its return type.

In preparation, simplify some calls to qemu_io() that assert that
specific error message strings do not appear in qemu-io's
output. Asserting that all of these calls return a status code of zero
will be a more robust way to guard against failure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/040 | 33 ++++++++++++++++-----------------
 tests/qemu-iotests/056 |  2 +-
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 0e1cfd7e49..adf5815781 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -101,13 +101,13 @@ class TestSingleDrive(ImageCommitTestCase):
 
     def test_commit(self):
         self.run_commit_test(mid_img, backing_img)
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     def test_commit_node(self):
         self.run_commit_test("mid", "base", node_names=True)
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     @iotests.skip_if_unsupported(['throttle'])
     def test_commit_with_filter_and_quit(self):
@@ -192,13 +192,13 @@ class TestSingleDrive(ImageCommitTestCase):
 
     def test_top_is_active(self):
         self.run_commit_test(test_img, backing_img, need_ready=True)
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     def test_top_is_default_active(self):
         self.run_default_commit_test()
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     def test_top_and_base_reversed(self):
         self.assert_no_active_block_jobs()
@@ -334,8 +334,8 @@ class TestRelativePaths(ImageCommitTestCase):
 
     def test_commit(self):
         self.run_commit_test(self.mid_img, self.backing_img)
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', self.backing_img_abs).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', self.backing_img_abs).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', self.backing_img_abs)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', self.backing_img_abs)
 
     def test_device_not_found(self):
         result = self.vm.qmp('block-commit', device='nonexistent', top='%s' % self.mid_img)
@@ -361,8 +361,8 @@ class TestRelativePaths(ImageCommitTestCase):
 
     def test_top_is_active(self):
         self.run_commit_test(self.test_img, self.backing_img)
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', self.backing_img_abs).find("verification failed"))
-        self.assertEqual(-1, qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', self.backing_img_abs).find("verification failed"))
+        qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', self.backing_img_abs)
+        qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', self.backing_img_abs)
 
     def test_top_and_base_reversed(self):
         self.assert_no_active_block_jobs()
@@ -738,11 +738,10 @@ class TestCommitWithFilters(iotests.QMPTestCase):
 
     def do_test_io(self, read_or_write):
         for index, pattern_file in enumerate(self.pattern_files):
-            result = qemu_io('-f', iotests.imgfmt,
-                             '-c',
-                             f'{read_or_write} -P {index + 1} {index}M 1M',
-                             pattern_file)
-            self.assertFalse('Pattern verification failed' in result)
+            qemu_io('-f', iotests.imgfmt,
+                    '-c',
+                    f'{read_or_write} -P {index + 1} {index}M 1M',
+                    pattern_file)
 
     @iotests.skip_if_unsupported(['throttle'])
     def setUp(self):
diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index b459a3f1e8..bef865eec4 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -102,7 +102,7 @@ class TestSyncModesNoneAndTop(iotests.QMPTestCase):
 
         self.vm.shutdown()
         time.sleep(1)
-        self.assertEqual(-1, qemu_io('-c', 'read -P0x41 0 512', target_img).find("verification failed"))
+        qemu_io('-c', 'read -P0x41 0 512', target_img)
 
 class TestBeforeWriteNotifier(iotests.QMPTestCase):
     def setUp(self):
-- 
2.34.1


