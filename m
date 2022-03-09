Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3974D2650
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:59:41 +0100 (CET)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnUC-0003uC-VV
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPH-0002bq-Da
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPF-0002vS-ER
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1T8tdz+epH8dDDhITBtvE6w+xIb3eKAPuipEJEtNecY=;
 b=aELkfuocZ9Bvusc9VTnjyVKArh3BjlM3UYybZvatAV0DGPoThlM9/2D3OljP7kuZxB0BeN
 Pr8sLNRDLBrHqiJ52sVE4X3r8hW/h+kcjJbD4doaufzktIzsDNfbVs9Y+qCcE3c5eNsmuN
 ebe5wfgZKjY3AGx5dyogPgmY9tud+ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-8qELQJxfOeW9_K-q3XjjJA-1; Tue, 08 Mar 2022 22:54:30 -0500
X-MC-Unique: 8qELQJxfOeW9_K-q3XjjJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 376B8824FA7;
 Wed,  9 Mar 2022 03:54:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FDB86C180;
 Wed,  9 Mar 2022 03:54:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] iotests: remove remaining calls to qemu_img_pipe()
Date: Tue,  8 Mar 2022 22:54:02 -0500
Message-Id: <20220309035407.1848654-10-jsnow@redhat.com>
In-Reply-To: <20220309035407.1848654-1-jsnow@redhat.com>
References: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of moving all python iotest invocations of qemu-img onto a
single qemu_img() implementation, remove a few lingering uses of
qemu_img_pipe() from outside of iotests.py itself.

Several cases here rely on the knowledge that qemu_img_pipe() suppresses
*all* output on a successful case when the command being issued is
'create'.

065: This call's output is inspected, but it appears as if it's expected
     to succeed. Replace this call with the checked qemu_img() variant
     instead to get better diagnostics if/when qemu-img itself fails.

237: "create" call output isn't actually logged. Use qemu_img_create()
     instead, which checks the return code. Remove the empty lines from
     the test output.

296: Two calls;
     -create: Expected to succeed. Like other create calls, the output
              isn't actually logged.  Switch to a checked variant
              (qemu_img_create) instead. The output for this test is
              a mixture of both test styles, so actually replace the
              blank line for readability.
     -amend:  This is expected to fail. Log the output.

After this patch, the only uses of qemu_img_pipe are internal to
iotests.py and will be removed in subsequent patches.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/065     |  4 ++--
 tests/qemu-iotests/237     |  3 +--
 tests/qemu-iotests/237.out |  3 ---
 tests/qemu-iotests/296     | 12 ++++++------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 9466ce7df4..ba94e19349 100755
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
diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
index 43dfd3bd40..5ea13eb01f 100755
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
index aeb9724492..62b8865677 100644
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
index f80ef3434a..0d21b740a7 100755
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
@@ -84,8 +84,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             '-o', 'iter-time=10',
             file,
             '1M')
-
-        iotests.log(output, filters=[iotests.filter_test_dir])
+        iotests.log('')
 
     # attempts to add a key using qemu-img
     def addKey(self, file, secret, new_secret):
@@ -99,7 +98,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                 }
             }
 
-        output = iotests.qemu_img_pipe(
+        output = iotests.qemu_img(
             'amend',
             '--object', *secret.to_cmdline_object(),
             '--object', *new_secret.to_cmdline_object(),
@@ -108,8 +107,9 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             '-o', 'new-secret=' + new_secret.id(),
             '-o', 'iter-time=10',
 
-            "json:" + json.dumps(image_options)
-            )
+            "json:" + json.dumps(image_options),
+            check=False  # Expected to fail. Log output.
+        ).stdout
 
         iotests.log(output, filters=[iotests.filter_test_dir])
 
-- 
2.34.1


