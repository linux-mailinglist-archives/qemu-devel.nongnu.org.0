Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B0505F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 23:18:46 +0200 (CEST)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngYlh-0004Do-L6
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 17:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiV-0001Io-Sz
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ngYiS-0004nf-1R
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 17:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650316515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjcOA1eMddBCuXyHWdqVd7/MIx6dAoOWYgr56ZoRZcA=;
 b=c274USfB4YZgUgbztKCp/vdhku/DMPPAhT6eqCtg9CEF/EV9ZLadi9Ql/R+QQy41TClCbV
 1U7DeY3GMctXubXMabqBCxrgP3QeCSTvOqkejI7IY+W0ZWROaSJ9dNg169lgCvauDjf98u
 Xg4QFnWjjx92Mw1ZtFy/t9YgA2OZwzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-seJvKPHtP1izu6o-PfbAkA-1; Mon, 18 Apr 2022 17:15:12 -0400
X-MC-Unique: seJvKPHtP1izu6o-PfbAkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B126101AA45;
 Mon, 18 Apr 2022 21:15:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB622215CDCC;
 Mon, 18 Apr 2022 21:15:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/12] iotests/040: Don't check image pattern on
 zero-length image
Date: Mon, 18 Apr 2022 17:14:56 -0400
Message-Id: <20220418211504.943969-5-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-io fails on read/write beyond end-of-file on raw images, so skip
these invocations when running the zero-length image tests.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/040 | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index adf5815781e..c4a90937dcb 100755
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


