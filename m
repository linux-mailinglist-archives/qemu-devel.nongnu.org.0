Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B622D620E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:37:07 +0100 (CET)
Received: from localhost ([::1]:39098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOwD-0001uN-Vc
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrO-0008Gk-Ut
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrL-0003SN-IT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2wwPuSl14SkVhCrD25fUmPdd4iak6LJGh/FStpFLRI=;
 b=eVymfct8lqzlcfG5SOp5ZrxTQDQw6KZbaw8lri28dxSlUzYtuCptYOd66nUQRYGqSYyzJg
 jSFbzdxGjsaj0COX1Tzs5dscPkf31pXii8TK4QBNSI95C+XSBGFxPXuf5KKXHuIAAaoUtv
 7ZWF9Eo+kDQeQItNpS8yBSoTzjBOyS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-LHgbaGYyM3Oe62h0zaEAKg-1; Thu, 10 Dec 2020 11:31:57 -0500
X-MC-Unique: LHgbaGYyM3Oe62h0zaEAKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6062801AB1;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A12B6F965;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C6ACD1129953; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] block: Improve some block-commit,
 block-stream error messages
Date: Thu, 10 Dec 2020 17:31:23 +0100
Message-Id: <20201210163132.2919935-5-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block-commit defaults @base-node to the deepest backing image.  When
there is none, it fails with "Base 'NULL' not found".  Improve to
"There is no backing image".

block-commit and block-stream reject a @base argument that doesn't
resolve with "Base 'BASE' not found".  Commit 6b33f3ae8b "qemu-img:
Improve commit invalid base message" improved this message in
qemu-img.  Improve it here, too: "Can't find '%s' in the backing
chain".

QERR_BASE_NOT_FOUND is now unused.  Drop.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-4-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/qapi/qmp/qerror.h |  2 --
 blockdev.c                | 15 +++++++++------
 tests/qemu-iotests/040    | 12 ++++++------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index c272e3fc29..5d7e69cc1f 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -16,8 +16,6 @@
  * These macros will go away, please don't use in new code, and do not
  * add new ones!
  */
-#define QERR_BASE_NOT_FOUND \
-    "Base '%s' not found"
 
 #define QERR_BUS_NO_HOTPLUG \
     "Bus '%s' does not support hotplugging"
diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..d05a8740f4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2531,7 +2531,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     if (has_base) {
         base_bs = bdrv_find_backing_image(bs, base);
         if (base_bs == NULL) {
-            error_setg(errp, QERR_BASE_NOT_FOUND, base);
+            error_setg(errp, "Can't find '%s' in the backing chain", base);
             goto out;
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
@@ -2703,13 +2703,16 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
         }
     } else if (has_base && base) {
         base_bs = bdrv_find_backing_image(top_bs, base);
+        if (base_bs == NULL) {
+            error_setg(errp, "Can't find '%s' in the backing chain", base);
+            goto out;
+        }
     } else {
         base_bs = bdrv_find_base(top_bs);
-    }
-
-    if (base_bs == NULL) {
-        error_setg(errp, QERR_BASE_NOT_FOUND, base ? base : "NULL");
-        goto out;
+        if (base_bs == NULL) {
+            error_setg(errp, "There is no backimg image");
+            goto out;
+        }
     }
 
     assert(bdrv_get_aio_context(base_bs) == aio_context);
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index caf286571a..dc6069edc0 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -156,7 +156,7 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % backing_img, base='%s' % backing_img)
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'%s\' not found' % backing_img)
+        self.assert_qmp(result, 'error/desc', "Can't find '%s' in the backing chain" % backing_img)
 
     def test_top_invalid(self):
         self.assert_no_active_block_jobs()
@@ -168,7 +168,7 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % mid_img, base='badfile')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'badfile\' not found')
+        self.assert_qmp(result, 'error/desc', "Can't find 'badfile' in the backing chain")
 
     def test_top_node_invalid(self):
         self.assert_no_active_block_jobs()
@@ -208,7 +208,7 @@ class TestSingleDrive(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % backing_img, base='%s' % mid_img)
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'%s\' not found' % mid_img)
+        self.assert_qmp(result, 'error/desc', "Can't find '%s' in the backing chain" % mid_img)
 
     def test_top_and_base_node_reversed(self):
         self.assert_no_active_block_jobs()
@@ -349,7 +349,7 @@ class TestRelativePaths(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % self.mid_img, base='%s' % self.mid_img)
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'%s\' not found' % self.mid_img)
+        self.assert_qmp(result, 'error/desc', "Can't find '%s' in the backing chain" % self.mid_img)
 
     def test_top_invalid(self):
         self.assert_no_active_block_jobs()
@@ -361,7 +361,7 @@ class TestRelativePaths(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % self.mid_img, base='badfile')
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'badfile\' not found')
+        self.assert_qmp(result, 'error/desc', "Can't find 'badfile' in the backing chain")
 
     def test_top_is_active(self):
         self.run_commit_test(self.test_img, self.backing_img)
@@ -372,7 +372,7 @@ class TestRelativePaths(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
         result = self.vm.qmp('block-commit', device='drive0', top='%s' % self.backing_img, base='%s' % self.mid_img)
         self.assert_qmp(result, 'error/class', 'GenericError')
-        self.assert_qmp(result, 'error/desc', 'Base \'%s\' not found' % self.mid_img)
+        self.assert_qmp(result, 'error/desc', "Can't find '%s' in the backing chain" % self.mid_img)
 
 
 class TestSetSpeed(ImageCommitTestCase):
-- 
2.26.2


