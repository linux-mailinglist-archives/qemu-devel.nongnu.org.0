Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F74E31A9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:23:44 +0100 (CET)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOZ4-0001Gr-Qi
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:23:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS9-0006GU-Pq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOS5-0001ky-DU
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkH+C8mNxPTyzaTC0UpTEijOQ4FucTj9rAuTgnPH3B0=;
 b=WbbLXC4aqje8dshiqGuJ00t0D4o9f6YMMzYXJJQuLN3QijM0j/Odzq5JMVDgXNI/CWdBoe
 9cQoB1nuccObM1ZZGmI4FSM6g8TAskNlyrFUommNCAt/z1sX2YV8eyZcV7N9Z884nJa60C
 J+uU3BDXmU/61cveocKp1AudYwScsoc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-nbH3GC7zOCuF8xXMmHMALw-1; Mon, 21 Mar 2022 16:16:25 -0400
X-MC-Unique: nbH3GC7zOCuF8xXMmHMALw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C1C12999B2D;
 Mon, 21 Mar 2022 20:16:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05437454D60;
 Mon, 21 Mar 2022 20:16:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/18] iotests: replace unchecked calls to qemu_img_pipe()
Date: Mon, 21 Mar 2022 16:16:12 -0400
Message-Id: <20220321201618.903471-13-jsnow@redhat.com>
In-Reply-To: <20220321201618.903471-1-jsnow@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img_pipe() discards the return code from qemu-img in favor of
returning just its output. Some tests using this function don't save,
log, or check the output either, though, which is unsafe.

Replace all of these calls with a checked version.

Tests affected are 194, 202, 203, 234, 262, and 303.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


