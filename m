Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F81211F8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 18:41:35 +0100 (CET)
Received: from localhost ([::1]:57920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iguNC-0005Uk-FM
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 12:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49772)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1igtrw-0005Dj-53
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1igtru-0004Vg-Kp
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1igtru-0004VD-Gv
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576516154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhavTerdPTQoYgu7CvuljzUleQArQqWB5x+i4QENFd4=;
 b=dC3BZ063Deg40dWvQqNKQx+vCijlsiXoTMj0J9Wy9f0EcMOYdL4EQPeWUVWZdWFQlNuZ27
 jVruHwaje4p1fjmxC2jjKJ6Y4k4lppLDqtiOzrjS8aID79J6cvgoTI2GYkWq7K3Ns26JPY
 SK/KhedS7+MPmDu4t+3UtQ/R0EbwJ4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-C20Yk-AGNzy7fxPf2NSzOg-1; Mon, 16 Dec 2019 12:09:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4C621005502;
 Mon, 16 Dec 2019 17:09:11 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-54.ams2.redhat.com [10.36.117.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C20757C81C;
 Mon, 16 Dec 2019 17:09:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 07/10] iotests: 237: Convert to VM.blockdev_create()
Date: Mon, 16 Dec 2019 18:08:54 +0100
Message-Id: <20191216170857.11880-8-kwolf@redhat.com>
In-Reply-To: <20191216170857.11880-1-kwolf@redhat.com>
References: <20191216170857.11880-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: C20Yk-AGNzy7fxPf2NSzOg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having a separate blockdev_create() function, make use of the
VM.blockdev_create() offered by iotests.py.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/237 | 139 +++++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 74 deletions(-)

diff --git a/tests/qemu-iotests/237 b/tests/qemu-iotests/237
index 06897f8c87..a2242a4736 100755
--- a/tests/qemu-iotests/237
+++ b/tests/qemu-iotests/237
@@ -26,15 +26,6 @@ from iotests import imgfmt
=20
 iotests.verify_image_format(supported_fmts=3D['vmdk'])
=20
-def blockdev_create(vm, options):
-    result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3Dop=
tions,
-                        filters=3D[iotests.filter_qmp_testfiles])
-
-    if 'return' in result:
-        assert result['return'] =3D=3D {}
-        vm.run_job('job0')
-    iotests.log("")
-
 with iotests.FilePath('t.vmdk') as disk_path, \
      iotests.FilePath('t.vmdk.1') as extent1_path, \
      iotests.FilePath('t.vmdk.2') as extent2_path, \
@@ -50,16 +41,16 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     size =3D 5 * 1024 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0 })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0 })
=20
     vm.qmp_log('blockdev-add', driver=3D'file', filename=3Ddisk_path,
                node_name=3D'imgfile', filters=3D[iotests.filter_qmp_testfi=
les])
=20
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'imgfile',
-                          'size': size })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'imgfile',
+                         'size': size })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -74,21 +65,21 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     size =3D 64 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0 })
-
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'extents': [],
-                          'subformat': 'monolithicSparse',
-                          'adapter-type': 'ide',
-                          'hwversion': '4',
-                          'zeroed-grain': False })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0 })
+
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'extents': [],
+                         'subformat': 'monolithicSparse',
+                         'adapter-type': 'ide',
+                         'hwversion': '4',
+                         'zeroed-grain': False })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -103,20 +94,20 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     size =3D 32 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0 })
-
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'extents': [],
-                          'subformat': 'monolithicSparse',
-                          'adapter-type': 'buslogic',
-                          'zeroed-grain': True })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0 })
+
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'extents': [],
+                         'subformat': 'monolithicSparse',
+                         'adapter-type': 'buslogic',
+                         'zeroed-grain': True })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -128,9 +119,9 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': "this doesn't exist",
-                          'size': size })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': "this doesn't exist",
+                         'size': size })
     vm.shutdown()
=20
     #
@@ -148,10 +139,10 @@ with iotests.FilePath('t.vmdk') as disk_path, \
=20
     vm.launch()
     for adapter_type in [ 'ide', 'buslogic', 'lsilogic', 'legacyESX' ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': size,
-                              'adapter-type': adapter_type })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': size,
+                             'adapter-type': adapter_type })
     vm.shutdown()
=20
     # Invalid
@@ -160,10 +151,10 @@ with iotests.FilePath('t.vmdk') as disk_path, \
=20
     vm.launch()
     for adapter_type in [ 'foo', 'IDE', 'legacyesx', 1 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': size,
-                              'adapter-type': adapter_type })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': size,
+                             'adapter-type': adapter_type })
     vm.shutdown()
=20
     #
@@ -185,10 +176,10 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': size,
-                          'subformat': 'monolithicFlat' })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': size,
+                         'subformat': 'monolithicFlat' })
     vm.shutdown()
=20
     # Correct extent
@@ -196,11 +187,11 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': size,
-                          'subformat': 'monolithicFlat',
-                          'extents': ['ext1'] })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': size,
+                         'subformat': 'monolithicFlat',
+                         'extents': ['ext1'] })
     vm.shutdown()
=20
     # Extra extent
@@ -208,11 +199,11 @@ with iotests.FilePath('t.vmdk') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 512,
-                          'subformat': 'monolithicFlat',
-                          'extents': ['ext1', 'ext2', 'ext3'] })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 512,
+                         'subformat': 'monolithicFlat',
+                         'extents': ['ext1', 'ext2', 'ext3'] })
     vm.shutdown()
=20
     # Split formats
@@ -228,11 +219,11 @@ with iotests.FilePath('t.vmdk') as disk_path, \
             extents =3D [ "ext%d" % (i) for i in range(1, num_extents + 1)=
 ]
=20
             vm.launch()
-            blockdev_create(vm, { 'driver': imgfmt,
-                                  'file': 'node0',
-                                  'size': size,
-                                  'subformat': subfmt,
-                                  'extents': extents })
+            vm.blockdev_create({ 'driver': imgfmt,
+                                 'file': 'node0',
+                                 'size': size,
+                                 'subformat': subfmt,
+                                 'extents': extents })
             vm.shutdown()
=20
             iotests.img_info_log(disk_path)
--=20
2.20.1


