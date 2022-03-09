Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5A4D264E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:59:30 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnU1-0003Gk-FG
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:59:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPE-0002SA-CS
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnPC-0002uE-A6
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQQt51M7XYJHxuO5nIX3wj9N/R34oqLZmz9EMgSPiuE=;
 b=VceEbfT8qikSx4zuBwiQ75JQiUnQBJIOP6y6DDs9qVuknSQjhZYu9fFsaF2p3zaMV6aDs7
 U/2CXBZpwzE6/plA3Hd2I5wB4Z8Fp+0MJhfFDHZlbRwrQB+S++u8ozoiwpK0pNZDzFp2/x
 cxBQpJNUtNnQD7XJjtMVBcYs+uEmScg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-6zed9cF0NHqgaQ0FhwINEw-1; Tue, 08 Mar 2022 22:54:28 -0500
X-MC-Unique: 6zed9cF0NHqgaQ0FhwINEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751A6FC81;
 Wed,  9 Mar 2022 03:54:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A03427010B;
 Wed,  9 Mar 2022 03:54:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] iotests: replace unchecked calls to qemu_img_pipe()
Date: Tue,  8 Mar 2022 22:54:00 -0500
Message-Id: <20220309035407.1848654-8-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

qemu_img_pipe() discards the return code from qemu-img in favor of
returning just its output. Some tests using this function don't save,
log, or check the output either, though, which is unsafe.

Replace all of these calls with a checked version.

Tests affected are 194, 202, 203, 234, 262, and 303.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/194 | 4 ++--
 tests/qemu-iotests/202 | 4 ++--
 tests/qemu-iotests/203 | 4 ++--
 tests/qemu-iotests/234 | 4 ++--
 tests/qemu-iotests/262 | 2 +-
 tests/qemu-iotests/303 | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index e44b8df728..68894371f5 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -33,8 +33,8 @@ with iotests.FilePath('source.img') as source_img_path, \
      iotests.VM('dest') as dest_vm:
 
     img_size = '1G'
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, source_img_path, img_size)
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, dest_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, source_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, dest_img_path, img_size)
 
     iotests.log('Launching VMs...')
     (source_vm.add_drive(source_img_path)
diff --git a/tests/qemu-iotests/202 b/tests/qemu-iotests/202
index 8eb5f32d15..b784dcd791 100755
--- a/tests/qemu-iotests/202
+++ b/tests/qemu-iotests/202
@@ -35,8 +35,8 @@ with iotests.FilePath('disk0.img') as disk0_img_path, \
      iotests.VM() as vm:
 
     img_size = '10M'
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, disk0_img_path, img_size)
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, disk1_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, disk0_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, disk1_img_path, img_size)
 
     iotests.log('Launching VM...')
     vm.launch()
diff --git a/tests/qemu-iotests/203 b/tests/qemu-iotests/203
index ea30e50497..ab80fd0e44 100755
--- a/tests/qemu-iotests/203
+++ b/tests/qemu-iotests/203
@@ -33,8 +33,8 @@ with iotests.FilePath('disk0.img') as disk0_img_path, \
      iotests.VM() as vm:
 
     img_size = '10M'
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, disk0_img_path, img_size)
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, disk1_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, disk0_img_path, img_size)
+    iotests.qemu_img_create('-f', iotests.imgfmt, disk1_img_path, img_size)
 
     iotests.log('Launching VM...')
     (vm.add_object('iothread,id=iothread0')
diff --git a/tests/qemu-iotests/234 b/tests/qemu-iotests/234
index cb5f1753e0..a9f764bb2c 100755
--- a/tests/qemu-iotests/234
+++ b/tests/qemu-iotests/234
@@ -34,8 +34,8 @@ with iotests.FilePath('img') as img_path, \
      iotests.VM(path_suffix='a') as vm_a, \
      iotests.VM(path_suffix='b') as vm_b:
 
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, backing_path, '64M')
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, img_path, '64M')
+    iotests.qemu_img_create('-f', iotests.imgfmt, backing_path, '64M')
+    iotests.qemu_img_create('-f', iotests.imgfmt, img_path, '64M')
 
     os.mkfifo(fifo_a)
     os.mkfifo(fifo_b)
diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 32d69988ef..2294fd5ecb 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -51,7 +51,7 @@ with iotests.FilePath('img') as img_path, \
 
         vm.add_device('virtio-blk,drive=%s,iothread=iothread0' % root)
 
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, img_path, '64M')
+    iotests.qemu_img_create('-f', iotests.imgfmt, img_path, '64M')
 
     os.mkfifo(fifo)
 
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 16c2e10827..93aa5ce9b7 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -38,7 +38,7 @@ def create_bitmap(bitmap_number, disabled):
     if disabled:
         args.append('--disable')
 
-    iotests.qemu_img_pipe(*args)
+    iotests.qemu_img(*args)
 
 
 def write_to_disk(offset, size):
-- 
2.34.1


