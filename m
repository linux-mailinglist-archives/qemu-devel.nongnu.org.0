Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43912687B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:55:42 +0100 (CET)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii01U-0001X2-Tu
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzYb-00074o-Bb
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzYT-0007yY-Q3
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21024
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzYM-0007t9-GU
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/b2AIr/cOuzJSHtHnyYDwN6KgFug4kXWEVCI5FWvKU=;
 b=CaxWOAqSixznosORmrXULyb/Gd/4i0l+Wty8pIDObRuTw9DPn13PHsX9XrCMwtx7GV8ZBD
 L2AQWzEkmeNMdELNau6pzt0EGf4vAtHF2OuaBfDv9znW4SNL5RGowtY9WhqfyGUlCE3DK2
 pFgE81eT19SdnVtlKY7HeUUusPKfPIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-FqieSac1Ouar5KtLyiJKyQ-1; Thu, 19 Dec 2019 12:25:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD8C800EB8;
 Thu, 19 Dec 2019 17:25:29 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6D3E620C0;
 Thu, 19 Dec 2019 17:25:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/30] iotests: 213: Convert to VM.blockdev_create()
Date: Thu, 19 Dec 2019 18:24:34 +0100
Message-Id: <20191219172441.7289-24-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: FqieSac1Ouar5KtLyiJKyQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of having a separate blockdev_create() function, make use of the
VM.blockdev_create() offered by iotests.py.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/213 | 113 +++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 61 deletions(-)

diff --git a/tests/qemu-iotests/213 b/tests/qemu-iotests/213
index 5604f3cebb..3fc8dc6eaa 100755
--- a/tests/qemu-iotests/213
+++ b/tests/qemu-iotests/213
@@ -26,15 +26,6 @@ from iotests import imgfmt
 iotests.verify_image_format(supported_fmts=3D['vhdx'])
 iotests.verify_protocol(supported=3D['file'])
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
 with iotests.FilePath('t.vhdx') as disk_path, \
      iotests.VM() as vm:
=20
@@ -47,16 +38,16 @@ with iotests.FilePath('t.vhdx') as disk_path, \
     size =3D 128 * 1024 * 1024
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
@@ -71,19 +62,19 @@ with iotests.FilePath('t.vhdx') as disk_path, \
     size =3D 64 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0 })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'log-size': 1048576,
-                          'block-size': 8388608,
-                          'subformat': 'dynamic',
-                          'block-state-zero': True })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0 })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'log-size': 1048576,
+                         'block-size': 8388608,
+                         'subformat': 'dynamic',
+                         'block-state-zero': True })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -98,19 +89,19 @@ with iotests.FilePath('t.vhdx') as disk_path, \
     size =3D 32 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0 })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'log-size': 8388608,
-                          'block-size': 268435456,
-                          'subformat': 'fixed',
-                          'block-state-zero': False })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0 })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'log-size': 8388608,
+                         'block-size': 268435456,
+                         'subformat': 'fixed',
+                         'block-state-zero': False })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -122,9 +113,9 @@ with iotests.FilePath('t.vhdx') as disk_path, \
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
@@ -135,9 +126,9 @@ with iotests.FilePath('t.vhdx') as disk_path, \
=20
     vm.add_blockdev('driver=3Dfile,filename=3D%s,node-name=3Dnode0' % (dis=
k_path))
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 0 })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 0 })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -149,9 +140,9 @@ with iotests.FilePath('t.vhdx') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 70368744177664 })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 70368744177664 })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -176,9 +167,9 @@ with iotests.FilePath('t.vhdx') as disk_path, \
     vm.launch()
     for size in [ 18446744073709551104, 9223372036854775808,
                   9223372036854775296, 70368744177665 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': size })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': size })
     vm.shutdown()
=20
     #
@@ -189,10 +180,10 @@ with iotests.FilePath('t.vhdx') as disk_path, \
=20
     vm.launch()
     for bsize in [ 1234567, 128, 3145728, 536870912, 0 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': 67108864,
-                              'block-size': bsize })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': 67108864,
+                             'block-size': bsize })
     vm.shutdown()
=20
     #
@@ -203,8 +194,8 @@ with iotests.FilePath('t.vhdx') as disk_path, \
=20
     vm.launch()
     for lsize in [ 1234567, 128, 4294967296, 0 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': 67108864,
-                              'log-size': lsize })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': 67108864,
+                             'log-size': lsize })
     vm.shutdown()
--=20
2.20.1


