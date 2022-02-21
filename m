Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48754BED64
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:49:05 +0100 (CET)
Received: from localhost ([::1]:52924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHUO-0004jH-R2
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGa-0000lQ-AS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGX-0008DE-VX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+Gz6KY16YcGc4ARd3IXASz1KLMf4BRroWoEehnAAkc=;
 b=DYdk3jWLW18CrFLMFKCQNcrwA0mGxhP0gdhoNxOJIoCdP3p4FwlsCjPw37KtwBfXs6pQZ5
 128MXTWLOAT08pue+AxiDRU+0/+7arL56GmWqEBGZ9roJ7UBsIKFbPzHy8RZQ1VDdd83bQ
 uH7sfqXt6cqlABBaxP1rFvDPA0llaxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-m4EqkMIGNmamXJNdL6pazA-1; Mon, 21 Feb 2022 17:34:42 -0500
X-MC-Unique: m4EqkMIGNmamXJNdL6pazA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0E9814246;
 Mon, 21 Feb 2022 22:34:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB981038AAF;
 Mon, 21 Feb 2022 22:34:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] iotests: replace unchecked calls to qemu_img_pipe()
Date: Mon, 21 Feb 2022 17:34:07 -0500
Message-Id: <20220221223413.2123003-13-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img_pipe() discards the return code in favor of returning just the
output. Some tests using this function don't save, log, or check the
output either, though. Replace those calls to a checked version as
appropriate.

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
index e44b8df7280..68894371f51 100755
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
index 8eb5f32d153..b784dcd791a 100755
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
index ea30e504976..ab80fd0e44a 100755
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
index cb5f1753e08..a9f764bb2c6 100755
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
index 32d69988ef7..2294fd5ecbd 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -51,7 +51,7 @@ with iotests.FilePath('img') as img_path, \
 
         vm.add_device('virtio-blk,drive=%s,iothread=iothread0' % root)
 
-    iotests.qemu_img_pipe('create', '-f', iotests.imgfmt, img_path, '64M')
+    iotests.qemu_img_create('-f', iotests.imgfmt, img_path, '64M')
 
     os.mkfifo(fifo)
 
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 16c2e108276..93aa5ce9b7d 100755
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


