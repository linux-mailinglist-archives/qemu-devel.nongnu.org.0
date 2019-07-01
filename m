Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F233326
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXobA-0004ph-7N
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:10:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoUz-0000iy-5J
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoUx-0007wP-OI
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:03:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoUq-0007jT-LB; Mon, 03 Jun 2019 11:03:36 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33889308404B;
	Mon,  3 Jun 2019 15:03:25 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1B6A6726F;
	Mon,  3 Jun 2019 15:03:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:12 +0200
Message-Id: <20190603150233.6614-8-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 15:03:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/28] iotests: Test cancelling a job and
 closing the VM
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This patch adds a test where we cancel a throttled mirror job and
immediately close the VM before it can be cancelled.  Doing so will
invoke bdrv_drain_all() while the mirror job tries to drain the
throttled node.  When bdrv_drain_all_end() tries to lift its drain on
the throttle node, the job will exit and replace the current root node
of the BB drive0 (which is the job's filter node) by the throttle node.
Before the previous patch, this replacement did not increase drive0's
quiesce_counter by a sufficient amount, so when
bdrv_parent_drained_end() (invoked by bdrv_do_drained_end(), invoked by
bdrv_drain_all_end()) tried to end the drain on all of the throttle
node's parents, it decreased drive0's quiesce_counter below 0 -- which
fails an assertion.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/255     | 52 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/255.out | 24 ++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index c0bb37a9b0..49433ec122 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -35,6 +35,10 @@ def blockdev_create(vm, options):
         vm.run_job('job0')
     iotests.log("")
=20
+iotests.log('Finishing a commit job with background reads')
+iotests.log('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D'=
)
+iotests.log('')
+
 with iotests.FilePath('t.qcow2') as disk_path, \
      iotests.FilePath('t.qcow2.mid') as mid_path, \
      iotests.FilePath('t.qcow2.base') as base_path, \
@@ -81,3 +85,51 @@ with iotests.FilePath('t.qcow2') as disk_path, \
                 auto_dismiss=3DTrue)
=20
     vm.shutdown()
+
+iotests.log('')
+iotests.log('Closing the VM while a job is being cancelled')
+iotests.log('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
')
+iotests.log('')
+
+with iotests.FilePath('src.qcow2') as src_path, \
+     iotests.FilePath('dst.qcow2') as dst_path, \
+     iotests.VM() as vm:
+
+    iotests.log('=3D=3D=3D Create images and start VM =3D=3D=3D')
+    iotests.log('')
+
+    size =3D 128 * 1024 * 1024
+    size_str =3D str(size)
+
+    iotests.qemu_img_log('create', '-f', iotests.imgfmt, src_path, size_=
str)
+    iotests.qemu_img_log('create', '-f', iotests.imgfmt, dst_path, size_=
str)
+
+    iotests.log(iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 1M'=
,
+                                src_path),
+                filters=3D[iotests.filter_test_dir, iotests.filter_qemu_=
io])
+
+    vm.add_object('throttle-group,x-bps-read=3D4096,id=3Dthrottle0')
+
+    vm.add_blockdev('file,node-name=3Dsrc-file,filename=3D%s' % (src_pat=
h))
+    vm.add_blockdev('%s,node-name=3Dsrc,file=3Dsrc-file' % (iotests.imgf=
mt))
+
+    vm.add_blockdev('file,node-name=3Ddst-file,filename=3D%s' % (dst_pat=
h))
+    vm.add_blockdev('%s,node-name=3Ddst,file=3Ddst-file' % (iotests.imgf=
mt))
+
+    vm.add_blockdev('throttle,node-name=3Dsrc-throttled,' +
+                    'throttle-group=3Dthrottle0,file=3Dsrc')
+
+    vm.add_device('virtio-blk,drive=3Dsrc-throttled')
+
+    vm.launch()
+
+    iotests.log('=3D=3D=3D Start a mirror job =3D=3D=3D')
+    iotests.log('')
+
+    vm.qmp_log('blockdev-mirror', job_id=3D'job0', device=3D'src-throttl=
ed',
+                                  target=3D'dst', sync=3D'full')
+
+    vm.qmp_log('block-job-cancel', device=3D'job0')
+    vm.qmp_log('quit')
+
+    vm.shutdown()
diff --git a/tests/qemu-iotests/255.out b/tests/qemu-iotests/255.out
index 9a2d7cbb77..348909fdef 100644
--- a/tests/qemu-iotests/255.out
+++ b/tests/qemu-iotests/255.out
@@ -1,3 +1,6 @@
+Finishing a commit job with background reads
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 =3D=3D=3D Create backing chain and start VM =3D=3D=3D
=20
 Formatting 'TEST_DIR/PID-t.qcow2.mid', fmt=3Dqcow2 size=3D134217728 clus=
ter_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
@@ -14,3 +17,24 @@ Formatting 'TEST_DIR/PID-t.qcow2', fmt=3Dqcow2 size=3D=
134217728 cluster_size=3D65536 l
 {"return": {}}
 {"data": {"id": "job0", "type": "commit"}, "event": "BLOCK_JOB_PENDING",=
 "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "job0", "len": 134217728, "offset": 134217728, "spee=
d": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"=
microseconds": "USECS", "seconds": "SECS"}}
+
+Closing the VM while a job is being cancelled
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+=3D=3D=3D Create images and start VM =3D=3D=3D
+
+Formatting 'TEST_DIR/PID-src.qcow2', fmt=3Dqcow2 size=3D134217728 cluste=
r_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+
+Formatting 'TEST_DIR/PID-dst.qcow2', fmt=3Dqcow2 size=3D134217728 cluste=
r_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+=3D=3D=3D Start a mirror job =3D=3D=3D
+
+{"execute": "blockdev-mirror", "arguments": {"device": "src-throttled", =
"job-id": "job0", "sync": "full", "target": "dst"}}
+{"return": {}}
+{"execute": "block-job-cancel", "arguments": {"device": "job0"}}
+{"return": {}}
+{"execute": "quit", "arguments": {}}
+{"return": {}}
--=20
2.20.1


