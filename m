Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8CA126850
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:40:26 +0100 (CET)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzmi-0006Kh-NB
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihzYH-0006rj-V7
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihzYG-0007ZA-0F
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57879
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihzYF-0007XL-PS
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576776327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9w/18jZyLV30S83YZql6CNRQOdsnRN+w62k/NbVivo4=;
 b=JKHzODpauz3J6YglXqwW3E5L9Zoeufpgw4gVfZNT/P/KBEMTGVhFn+3iJIlm1pyrS6ITu9
 rIUwIKYGcJ8w+Lmg08i3+wNaxMGAnxyivIGvjsR6YCa6R9WWWE7jypSmtKMu1GOcTAiFhG
 6EL/ycToPRmWY9AbeDQQozfcagM78eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-EZhg3sk4OhuzY5FyWRtGXQ-1; Thu, 19 Dec 2019 12:25:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E99E2800EB8;
 Thu, 19 Dec 2019 17:25:22 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6CE3620C0;
 Thu, 19 Dec 2019 17:25:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/30] iotests: 206: Convert to VM.blockdev_create()
Date: Thu, 19 Dec 2019 18:24:31 +0100
Message-Id: <20191219172441.7289-21-kwolf@redhat.com>
In-Reply-To: <20191219172441.7289-1-kwolf@redhat.com>
References: <20191219172441.7289-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EZhg3sk4OhuzY5FyWRtGXQ-1
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
 tests/qemu-iotests/206 | 232 ++++++++++++++++++++---------------------
 1 file changed, 111 insertions(+), 121 deletions(-)

diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index 5bb738bf23..9f16a7df8d 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -25,16 +25,6 @@ from iotests import imgfmt
=20
 iotests.verify_image_format(supported_fmts=3D['qcow2'])
=20
-def blockdev_create(vm, options):
-    result =3D vm.qmp_log('blockdev-create',
-                        filters=3D[iotests.filter_qmp_testfiles],
-                        job_id=3D'job0', options=3Doptions)
-
-    if 'return' in result:
-        assert result['return'] =3D=3D {}
-        vm.run_job('job0')
-    iotests.log("")
-
 with iotests.FilePath('t.qcow2') as disk_path, \
      iotests.FilePath('t.qcow2.base') as backing_path, \
      iotests.VM() as vm:
@@ -50,18 +40,18 @@ with iotests.FilePath('t.qcow2') as disk_path, \
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
     vm.qmp_log('blockdev-add',
                filters=3D[iotests.filter_qmp_testfiles],
                driver=3D'file', filename=3Ddisk_path,
                node_name=3D'imgfile')
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
@@ -76,23 +66,23 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     size =3D 64 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0,
-                          'preallocation': 'off',
-                          'nocow': False })
-
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'version': 'v3',
-                          'cluster-size': 65536,
-                          'preallocation': 'off',
-                          'lazy-refcounts': False,
-                          'refcount-bits': 16 })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0,
+                         'preallocation': 'off',
+                         'nocow': False })
+
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'version': 'v3',
+                         'cluster-size': 65536,
+                         'preallocation': 'off',
+                         'lazy-refcounts': False,
+                         'refcount-bits': 16 })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -107,23 +97,23 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     size =3D 32 * 1024 * 1024
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': 'file',
-                          'filename': disk_path,
-                          'size': 0,
-                          'preallocation': 'falloc',
-                          'nocow': True })
-
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'version': 'v3',
-                          'cluster-size': 2097152,
-                          'preallocation': 'metadata',
-                          'lazy-refcounts': True,
-                          'refcount-bits': 1 })
+    vm.blockdev_create({ 'driver': 'file',
+                         'filename': disk_path,
+                         'size': 0,
+                         'preallocation': 'falloc',
+                         'nocow': True })
+
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'version': 'v3',
+                         'cluster-size': 2097152,
+                         'preallocation': 'metadata',
+                         'lazy-refcounts': True,
+                         'refcount-bits': 1 })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -135,20 +125,20 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     iotests.log("")
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
-                          'backing-file': backing_path,
-                          'backing-fmt': 'qcow2',
-                          'version': 'v2',
-                          'cluster-size': 512 })
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
+                         'backing-file': backing_path,
+                         'backing-fmt': 'qcow2',
+                         'version': 'v2',
+                         'cluster-size': 512 })
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -160,22 +150,22 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     iotests.log("")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': {
-                              'driver': 'file',
-                              'filename': disk_path,
-                          },
-                          'size': size,
-                          'encrypt': {
-                              'format': 'luks',
-                              'key-secret': 'keysec0',
-                              'cipher-alg': 'twofish-128',
-                              'cipher-mode': 'ctr',
-                              'ivgen-alg': 'plain64',
-                              'ivgen-hash-alg': 'md5',
-                              'hash-alg': 'sha1',
-                              'iter-time': 10,
-                          }})
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': {
+                             'driver': 'file',
+                             'filename': disk_path,
+                         },
+                         'size': size,
+                         'encrypt': {
+                             'format': 'luks',
+                             'key-secret': 'keysec0',
+                             'cipher-alg': 'twofish-128',
+                             'cipher-mode': 'ctr',
+                             'ivgen-alg': 'plain64',
+                             'ivgen-hash-alg': 'md5',
+                             'hash-alg': 'sha1',
+                             'iter-time': 10,
+                         }})
     vm.shutdown()
=20
     iotests.img_info_log(disk_path)
@@ -187,9 +177,9 @@ with iotests.FilePath('t.qcow2') as disk_path, \
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
@@ -211,9 +201,9 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     vm.launch()
     for size in [ 1234, 18446744073709551104, 9223372036854775808,
                   9223372036854775296 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': size })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': size })
     vm.shutdown()
=20
     #
@@ -222,20 +212,20 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     iotests.log("=3D=3D=3D Invalid version =3D=3D=3D")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 67108864,
-                          'version': 'v1' })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 67108864,
-                          'version': 'v2',
-                          'lazy-refcounts': True })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 67108864,
-                          'version': 'v2',
-                          'refcount-bits': 8 })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 67108864,
+                         'version': 'v1' })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 67108864,
+                         'version': 'v2',
+                         'lazy-refcounts': True })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 67108864,
+                         'version': 'v2',
+                         'refcount-bits': 8 })
     vm.shutdown()
=20
     #
@@ -244,15 +234,15 @@ with iotests.FilePath('t.qcow2') as disk_path, \
     iotests.log("=3D=3D=3D Invalid backing file options =3D=3D=3D")
=20
     vm.launch()
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 67108864,
-                          'backing-file': '/dev/null',
-                          'preallocation': 'full' })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 67108864,
-                          'backing-fmt': imgfmt })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 67108864,
+                         'backing-file': '/dev/null',
+                         'preallocation': 'full' })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 67108864,
+                         'backing-fmt': imgfmt })
     vm.shutdown()
=20
     #
@@ -262,14 +252,14 @@ with iotests.FilePath('t.qcow2') as disk_path, \
=20
     vm.launch()
     for csize in [ 1234, 128, 4194304, 0 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': 67108864,
-                              'cluster-size': csize })
-    blockdev_create(vm, { 'driver': imgfmt,
-                          'file': 'node0',
-                          'size': 281474976710656,
-                          'cluster-size': 512 })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': 67108864,
+                             'cluster-size': csize })
+    vm.blockdev_create({ 'driver': imgfmt,
+                         'file': 'node0',
+                         'size': 281474976710656,
+                         'cluster-size': 512 })
     vm.shutdown()
=20
     #
@@ -279,8 +269,8 @@ with iotests.FilePath('t.qcow2') as disk_path, \
=20
     vm.launch()
     for refcount_bits in [ 128, 0, 7 ]:
-        blockdev_create(vm, { 'driver': imgfmt,
-                              'file': 'node0',
-                              'size': 67108864,
-                              'refcount-bits': refcount_bits })
+        vm.blockdev_create({ 'driver': imgfmt,
+                             'file': 'node0',
+                             'size': 67108864,
+                             'refcount-bits': refcount_bits })
     vm.shutdown()
--=20
2.20.1


