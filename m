Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C7505F5B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:30:58 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYxV-0006ju-Jc
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYie-0001NO-QE
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiV-0004nS-Rb
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKNcNQEMTS69QkK6REuC1HQUJhvXd4668JTyIluLtLk=;
 b=JsCRIJ6/WSjobBvxrFxVsw9ngDmlLVd3xRXSMaahenki7wYdkk+oMaTNuZwnIuggF6/AH6
 LUTPaz8VWjqHAQsj3Ic3GOd/9AzZihpc1zc9LajtTlX+1GULmA2aRjSvSFhsFn7EYDObnl
 2ySsHn7RckKpZ5rfwi+bSDilDqjCpFs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-Qs1biDE3PCOe0bKZzNmxwg-1; Mon, 18 Apr 2022 17:15:11 -0400
X-MC-Unique: Qs1biDE3PCOe0bKZzNmxwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7E4101AA42;
 Mon, 18 Apr 2022 21:15:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B907A215CDCA;
 Mon, 18 Apr 2022 21:15:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/12] iotests: Don't check qemu_io() output for specific
 error strings
Date: Mon, 18 Apr 2022 17:14:55 -0400
Message-Id: <20220418211504.943969-4-jsnow@redhat.com>
In-Reply-To: <20220418211504.943969-1-jsnow@redhat.com>
References: <20220418211504.943969-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 0e1cfd7e49d..adf5815781e 100755
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
index b459a3f1e88..bef865eec48 100755
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


