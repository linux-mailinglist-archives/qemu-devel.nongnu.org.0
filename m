Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916EE90B76
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:35:29 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylkm-0000T5-CX
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylQ0-000727-Jz
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:14:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylPy-0006JD-Da
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:14:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylPt-0006CC-9w; Fri, 16 Aug 2019 19:13:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5476C308427C;
 Fri, 16 Aug 2019 23:13:47 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A120C19C6A;
 Fri, 16 Aug 2019 23:13:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:13:08 -0400
Message-Id: <20190816231318.8650-27-jsnow@redhat.com>
In-Reply-To: <20190816231318.8650-1-jsnow@redhat.com>
References: <20190816231318.8650-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 16 Aug 2019 23:13:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 26/36] iotests/257: test API failures
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190716000117.25219-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/257     | 67 ++++++++++++++++++++++++++++++
 tests/qemu-iotests/257.out | 85 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index aaa8f595043..53ab31c92e1 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -447,10 +447,77 @@ def test_bitmap_sync(bsync_mode, msync_mode=3D'bitm=
ap', failure=3DNone):
         compare_images(img_path, fbackup2)
         log('')
=20
+def test_backup_api():
+    """
+    Test malformed and prohibited invocations of the backup API.
+    """
+    with iotests.FilePaths(['img', 'bsync1']) as \
+         (img_path, backup_path), \
+         iotests.VM() as vm:
+
+        log("\n=3D=3D=3D API failure tests =3D=3D=3D\n")
+        log('--- Preparing image & VM ---\n')
+        drive0 =3D Drive(img_path, vm=3Dvm)
+        drive0.img_create(iotests.imgfmt, SIZE)
+        vm.add_device("{},id=3Dscsi0".format(iotests.get_virtio_scsi_dev=
ice()))
+        vm.launch()
+
+        file_config =3D {
+            'driver': 'file',
+            'filename': drive0.path
+        }
+
+        vm.qmp_log('blockdev-add',
+                   filters=3D[iotests.filter_qmp_testfiles],
+                   node_name=3D"drive0",
+                   driver=3Ddrive0.fmt,
+                   file=3Dfile_config)
+        drive0.node =3D 'drive0'
+        drive0.device =3D 'device0'
+        vm.qmp_log("device_add", id=3Ddrive0.device,
+                   drive=3Ddrive0.name, driver=3D"scsi-hd")
+        log('')
+
+        target0 =3D Drive(backup_path, vm=3Dvm)
+        target0.create_target("backup_target", drive0.fmt, drive0.size)
+        log('')
+
+        vm.qmp_log("block-dirty-bitmap-add", node=3Ddrive0.name,
+                   name=3D"bitmap0", granularity=3DGRANULARITY)
+        log('')
+
+        log('-- Testing invalid QMP commands --\n')
+
+        error_cases =3D {
+            'incremental': {
+                None:        ['on-success', 'always', 'never', None],
+                'bitmap404': ['on-success', 'always', 'never', None],
+                'bitmap0':   ['always', 'never']
+            },
+            'bitmap': {
+                None:        ['on-success', 'always', 'never', None],
+                'bitmap404': ['on-success', 'always', 'never', None],
+                'bitmap0':   [None],
+            },
+        }
+
+        # Dicts, as always, are not stably-ordered prior to 3.7, so use =
tuples:
+        for sync_mode in ('incremental', 'bitmap'):
+            log("-- Sync mode {:s} tests --\n".format(sync_mode))
+            for bitmap in (None, 'bitmap404', 'bitmap0'):
+                for policy in error_cases[sync_mode][bitmap]:
+                    blockdev_backup(drive0.vm, drive0.name, "backup_targ=
et",
+                                    sync_mode, job_id=3D'api_job',
+                                    bitmap=3Dbitmap, bitmap_mode=3Dpolic=
y)
+                    log('')
+
+
 def main():
     for bsync_mode in ("never", "on-success", "always"):
         for failure in ("simulated", "intermediate", None):
             test_bitmap_sync(bsync_mode, "bitmap", failure)
=20
+    test_backup_api()
+
 if __name__ =3D=3D '__main__':
     iotests.script_main(main, supported_fmts=3D['qcow2'])
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index 0abc96acd36..43f2e0f9c99 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -2245,3 +2245,88 @@ qemu_img compare "TEST_DIR/PID-bsync1" "TEST_DIR/P=
ID-fbackup1" =3D=3D> Identical, OK
 qemu_img compare "TEST_DIR/PID-bsync2" "TEST_DIR/PID-fbackup2" =3D=3D> I=
dentical, OK!
 qemu_img compare "TEST_DIR/PID-img" "TEST_DIR/PID-fbackup2" =3D=3D> Iden=
tical, OK!
=20
+
+=3D=3D=3D API failure tests =3D=3D=3D
+
+--- Preparing image & VM ---
+
+{"execute": "blockdev-add", "arguments": {"driver": "qcow2", "file": {"d=
river": "file", "filename": "TEST_DIR/PID-img"}, "node-name": "drive0"}}
+{"return": {}}
+{"execute": "device_add", "arguments": {"drive": "drive0", "driver": "sc=
si-hd", "id": "device0"}}
+{"return": {}}
+
+{}
+{"execute": "job-dismiss", "arguments": {"id": "bdc-file-job"}}
+{"return": {}}
+{}
+{}
+{"execute": "job-dismiss", "arguments": {"id": "bdc-fmt-job"}}
+{"return": {}}
+{}
+
+{"execute": "block-dirty-bitmap-add", "arguments": {"granularity": 65536=
, "name": "bitmap0", "node": "drive0"}}
+{"return": {}}
+
+-- Testing invalid QMP commands --
+
+-- Sync mode incremental tests --
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success"=
, "device": "drive0", "job-id": "api_job", "sync": "incremental", "target=
": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'incremental' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "d=
evice": "drive0", "job-id": "api_job", "sync": "incremental", "target": "=
backup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'incremental' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "de=
vice": "drive0", "job-id": "api_job", "sync": "incremental", "target": "b=
ackup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'incremental' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "job-id=
": "api_job", "sync": "incremental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'incremental' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "on-success", "device": "drive0", "job-id": "api_job", "sync":=
 "incremental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "always", "device": "drive0", "job-id": "api_job", "sync": "in=
cremental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'o=
n-success' when using sync mode 'incremental'"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "never", "device": "drive0", "job-id": "api_job", "sync": "inc=
remental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'o=
n-success' when using sync mode 'incremental'"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "dev=
ice": "drive0", "job-id": "api_job", "sync": "incremental", "target": "ba=
ckup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitma=
p-mode": "always", "device": "drive0", "job-id": "api_job", "sync": "incr=
emental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'o=
n-success' when using sync mode 'incremental'"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "bitma=
p-mode": "never", "device": "drive0", "job-id": "api_job", "sync": "incre=
mental", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap sync mode must be 'o=
n-success' when using sync mode 'incremental'"}}
+
+-- Sync mode bitmap tests --
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "on-success"=
, "device": "drive0", "job-id": "api_job", "sync": "bitmap", "target": "b=
ackup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'bitmap' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "always", "d=
evice": "drive0", "job-id": "api_job", "sync": "bitmap", "target": "backu=
p_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'bitmap' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap-mode": "never", "de=
vice": "drive0", "job-id": "api_job", "sync": "bitmap", "target": "backup=
_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'bitmap' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"device": "drive0", "job-id=
": "api_job", "sync": "bitmap", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "must provide a valid bitmap=
 name for 'bitmap' sync mode"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "on-success", "device": "drive0", "job-id": "api_job", "sync":=
 "bitmap", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "always", "device": "drive0", "job-id": "api_job", "sync": "bi=
tmap", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "bit=
map-mode": "never", "device": "drive0", "job-id": "api_job", "sync": "bit=
map", "target": "backup_target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap404", "dev=
ice": "drive0", "job-id": "api_job", "sync": "bitmap", "target": "backup_=
target"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap404' could no=
t be found"}}
+
+{"execute": "blockdev-backup", "arguments": {"bitmap": "bitmap0", "devic=
e": "drive0", "job-id": "api_job", "sync": "bitmap", "target": "backup_ta=
rget"}}
+{"error": {"class": "GenericError", "desc": "Bitmap sync mode must be gi=
ven when providing a bitmap"}}
+
--=20
2.21.0


