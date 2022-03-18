Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA394DE2B1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:42:48 +0100 (CET)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJQt-0003Fv-UE
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:42:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLK-0002Fl-Mn
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJLH-0005VV-0Z
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647635818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+arT6JCSGhKqJ7wfuQkr0z7Iyo3ZiuWhnNod+ki/a0=;
 b=XpmF6UcTCESwWc9s8soLkMcLz6Ya/0ZdfdMFWBxZWzooeVy3XQVUQCUZZ+0V53OGtllgYA
 JfLY20eBBtEj9+J3nGCqVFYriNExHoqQrhW3xR9E4K9HjqNzyJsy8HFcddHxXcmP2/CzB3
 gmDTdsFKBT8gbFS1eIsuvsSN7XV1Sxo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-2jM8ilDFPY6q27NQC2EfRQ-1; Fri, 18 Mar 2022 16:36:57 -0400
X-MC-Unique: 2jM8ilDFPY6q27NQC2EfRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E05E1C05ED4;
 Fri, 18 Mar 2022 20:36:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4729403373;
 Fri, 18 Mar 2022 20:36:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] iotests/040: Don't check image pattern on zero-length
 image
Date: Fri, 18 Mar 2022 16:36:44 -0400
Message-Id: <20220318203655.676907-5-jsnow@redhat.com>
In-Reply-To: <20220318203655.676907-1-jsnow@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-io fails on read/write with zero-length raw images, so skip these
when running the zero-length image tests.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/040 | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index adf5815781..c4a90937dc 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -86,8 +86,10 @@ class TestSingleDrive(ImageCommitTestCase):
         qemu_img('create', '-f', iotests.imgfmt,
                  '-o', 'backing_file=%s' % mid_img,
                  '-F', iotests.imgfmt, test_img)
-        qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img)
-        qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288', mid_img)
+        if self.image_len:
+            qemu_io('-f', 'raw', '-c', 'write -P 0xab 0 524288', backing_img)
+            qemu_io('-f', iotests.imgfmt, '-c', 'write -P 0xef 524288 524288',
+                    mid_img)
         self.vm = iotests.VM().add_drive(test_img, "node-name=top,backing.node-name=mid,backing.backing.node-name=base", interface="none")
         self.vm.add_device('virtio-scsi')
         self.vm.add_device("scsi-hd,id=scsi0,drive=drive0")
@@ -101,11 +103,15 @@ class TestSingleDrive(ImageCommitTestCase):
 
     def test_commit(self):
         self.run_commit_test(mid_img, backing_img)
+        if not self.image_len:
+            return
         qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
         qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     def test_commit_node(self):
         self.run_commit_test("mid", "base", node_names=True)
+        if not self.image_len:
+            return
         qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
         qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
@@ -192,11 +198,15 @@ class TestSingleDrive(ImageCommitTestCase):
 
     def test_top_is_active(self):
         self.run_commit_test(test_img, backing_img, need_ready=True)
+        if not self.image_len:
+            return
         qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
         qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
     def test_top_is_default_active(self):
         self.run_default_commit_test()
+        if not self.image_len:
+            return
         qemu_io('-f', 'raw', '-c', 'read -P 0xab 0 524288', backing_img)
         qemu_io('-f', 'raw', '-c', 'read -P 0xef 524288 524288', backing_img)
 
-- 
2.34.1


