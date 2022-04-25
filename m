Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91C50E2DB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:18:09 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizXU-0003oh-I6
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOG-0004uz-Jl
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOE-0001xq-3y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0Fcydka+X+mmfSb3/NTzj9k/TVIQnb0A+MrJ+7ad5Y=;
 b=ewi25sj53eqAZKdGJ5FNcGCJqNQv+ZEQn0CDYua3UhwwWghYwb5qjPf9c+6glJ8R6piiWF
 OWc17y0OOZuFU9tuUCIwrMWCO1TXaY5xsWUSRW/0Qb0wDjM65dr13gDE23SjapFVvAhcnR
 ZOlBH5gT3UlT3MZYGUfh/bUdj/yCDGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-QByXPohJPQuuRCtnyI34Gg-1; Mon, 25 Apr 2022 10:08:30 -0400
X-MC-Unique: QByXPohJPQuuRCtnyI34Gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9D57802812;
 Mon, 25 Apr 2022 14:08:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748082026609;
 Mon, 25 Apr 2022 14:08:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/14] iotests: Don't check qemu_io() output for specific error
 strings
Date: Mon, 25 Apr 2022 16:08:11 +0200
Message-Id: <20220425140821.957511-5-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

A forthcoming commit updates qemu_io() to raise an exception on non-zero
return by default, and changes its return type.

In preparation, simplify some calls to qemu_io() that assert that
specific error message strings do not appear in qemu-io's
output. Asserting that all of these calls return a status code of zero
will be a more robust way to guard against failure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-4-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.1


