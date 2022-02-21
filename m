Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F1D4BED4C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:39:21 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHKy-0004WX-5A
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGa-0000m6-FH
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGY-0008DL-8I
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOQshHnPziXRN3DHEqr1VVyp8s3YdH2g/JeqiwGLYk4=;
 b=NAEK1LAMy30bcRNryMQ0+9UXF3NntMgSBkORQaRtxQe3Cyzo+8nWxZx61xs93c2YxTxAdQ
 cWOt/RSWxHghRrbkUfIvNerO7IQj+qnqKJewnEUlh8bxIBMfmpfC2CbetWFLq2O8jdoQOI
 JkvTz05CtKvX0XTDbKi6cCV916FCULw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-TdGKhqzLNdeexwD6Yt76ng-1; Mon, 21 Feb 2022 17:34:43 -0500
X-MC-Unique: TdGKhqzLNdeexwD6Yt76ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 715851091DA0;
 Mon, 21 Feb 2022 22:34:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 655D71038AAF;
 Mon, 21 Feb 2022 22:34:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/18] iotests: remove external calls to qemu_img_pipe()
Date: Mon, 21 Feb 2022 17:34:08 -0500
Message-Id: <20220221223413.2123003-14-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several cases here rely on the knowledge that qemu_img_pipe() suppresses
*all* output on a successful case when the command being issued is
'create'.

065: This call's output is inspected, but it appears as if it's expected
     to succeed. Replace this call with the checked qemu_img() variant
     instead to get better diagnostics if/when qemu-img itself fails.

149: If the check_cipher_support check activates, we'll skip the
     test. Otherwise, we re-raise the Exception and assert that the
     image creation works.

237: We are only testing blanks against the output.
     Remove them and use a simpler checked variant.

296: One create and one amend call. The create call is expected to
     always succeed, but it needs a print statement to keep the output
     file looking nice. The amend call is an intentional negative test;
     use check=False and log the output.

After this patch, the only uses of qemu_img_pipe are internal to
iotests.py and will be removed in subsequent patches.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/065     |  4 ++--
 tests/qemu-iotests/149     |  8 ++++++--
 tests/qemu-iotests/237     |  3 +--
 tests/qemu-iotests/237.out |  3 ---
 tests/qemu-iotests/296     | 13 +++++++------
 5 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 9466ce7df4d..ba94e19349b 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -24,7 +24,7 @@ import os
 import re
 import json
 import iotests
-from iotests import qemu_img, qemu_img_info, qemu_img_pipe
+from iotests import qemu_img, qemu_img_info
 import unittest
 
 test_img = os.path.join(iotests.test_dir, 'test.img')
@@ -54,7 +54,7 @@ class TestQemuImgInfo(TestImageInfoSpecific):
         self.assertEqual(data['data'], self.json_compare)
 
     def test_human(self):
-        data = qemu_img_pipe('info', '--output=human', test_img).split('\n')
+        data = qemu_img('info', '--output=human', test_img).stdout.split('\n')
         data = data[(data.index('Format specific information:') + 1)
                     :data.index('')]
         for field in data:
diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
index d49646ca60b..8b7dfb4e368 100755
--- a/tests/qemu-iotests/149
+++ b/tests/qemu-iotests/149
@@ -265,8 +265,12 @@ def qemu_img_create(config, size_mb):
             "%dM" % size_mb]
 
     iotests.log("qemu-img " + " ".join(args), filters=[iotests.filter_test_dir])
-    iotests.log(check_cipher_support(config, iotests.qemu_img_pipe(*args)),
-                filters=[iotests.filter_test_dir])
+    try:
+        iotests.qemu_img(*args)
+    except subprocess.CalledProcessError as exc:
+        iotests.log(check_cipher_support(config, exc.output),
+                    filters=[iotests.filter_test_dir])
+        raise
 
 def qemu_io_image_args(config, dev=False):
     """Get the args for access an image or device with qemu-io"""
diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
index 43dfd3bd40a..5ea13eb01fc 100755
--- a/tests/qemu-iotests/237
+++ b/tests/qemu-iotests/237
@@ -165,8 +165,7 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     iotests.log("")
 
     for path in [ extent1_path, extent2_path, extent3_path ]:
-        msg = iotests.qemu_img_pipe('create', '-f', imgfmt, path, '0')
-        iotests.log(msg, [iotests.filter_testfiles])
+        iotests.qemu_img_create('-f', imgfmt, path, '0')
 
     vm.add_blockdev('driver=file,filename=%s,node-name=ext1' % (extent1_path))
     vm.add_blockdev('driver=file,filename=%s,node-name=ext2' % (extent2_path))
diff --git a/tests/qemu-iotests/237.out b/tests/qemu-iotests/237.out
index aeb97244928..62b88656778 100644
--- a/tests/qemu-iotests/237.out
+++ b/tests/qemu-iotests/237.out
@@ -129,9 +129,6 @@ Job failed: Cannot find device='this doesn't exist' nor node-name='this doesn't
 
 === Other subformats ===
 
-
-
-
 == Missing extent ==
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "vmdk", "file": "node0", "size": 33554432, "subformat": "monolithicFlat"}}}
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 099a3eeaa52..f32ef037a58 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -76,7 +76,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
     # create the encrypted block device using qemu-img
     def createImg(self, file, secret):
 
-        output = iotests.qemu_img_pipe(
+        iotests.qemu_img(
             'create',
             '--object', *secret.to_cmdline_object(),
             '-f', iotests.imgfmt,
@@ -85,7 +85,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             file,
             '1M')
 
-        iotests.log(output, filters=[iotests.filter_test_dir])
+        print('')  # Keeps 296.out prettier.
 
     # attempts to add a key using qemu-img
     def addKey(self, file, secret, new_secret):
@@ -99,7 +99,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                 }
             }
 
-        output = iotests.qemu_img_pipe(
+        ret = iotests.qemu_img(
             'amend',
             '--object', *secret.to_cmdline_object(),
             '--object', *new_secret.to_cmdline_object(),
@@ -108,10 +108,11 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             '-o', 'new-secret=' + new_secret.id(),
             '-o', 'iter-time=10',
 
-            "json:" + json.dumps(image_options)
-            )
+            "json:" + json.dumps(image_options),
+            check=False  # Expected to fail, output is logged.
+        )
 
-        iotests.log(output, filters=[iotests.filter_test_dir])
+        iotests.log(ret.stdout, filters=[iotests.filter_test_dir])
 
     ###########################################################################
     # open an encrypted block device
-- 
2.34.1


