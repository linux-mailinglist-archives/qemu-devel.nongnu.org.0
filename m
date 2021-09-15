Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5540CC57
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:08:33 +0200 (CEST)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZKh-0000Th-AW
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6e-0006Se-Dh
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6c-0006rH-9E
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7f8jWXwv/UeM2qL7zOLHTHGXiOIsI8zl10DcCWQrbtA=;
 b=CNu7Vs9ex96+Yu9UtVCmSxluHATeVJ7T9eQ0jmvS9EdSOSKAMqwRTV3iNhW0/cb+RsjZ9l
 fAqaxy3kEv0b/ZDnJsSoCQsTJjYTh+gHTPIfwPC8BSLHTvCRdqk4ZU1T/0y0ROmiRzelUc
 OL8tn6o/Rjd+8zRDbzQf87uTX6I7/iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-1Ao9B-FnMyC97usb_g3grw-1; Wed, 15 Sep 2021 13:53:55 -0400
X-MC-Unique: 1Ao9B-FnMyC97usb_g3grw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B151966321;
 Wed, 15 Sep 2021 17:53:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 828BA6B54B;
 Wed, 15 Sep 2021 17:53:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/32] tests: add migrate-during-backup
Date: Wed, 15 Sep 2021 19:53:02 +0200
Message-Id: <20210915175318.853225-17-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add a simple test which tries to run migration during backup.
bdrv_inactivate_all() should fail. But due to bug (see next commit with
fix) it doesn't, nodes are inactivated and continued backup crashes
on assertion "assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
bdrv_co_write_req_prepare().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210911120027.8063-2-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 .../qemu-iotests/tests/migrate-during-backup  | 97 +++++++++++++++++++
 .../tests/migrate-during-backup.out           |  5 +
 2 files changed, 102 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
new file mode 100755
index 0000000000..1046904c5a
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -0,0 +1,97 @@
+#!/usr/bin/env python3
+# group: migration disabled
+#
+# Copyright (c) 2021 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+import iotests
+from iotests import qemu_img_create, qemu_io
+
+
+disk_a = os.path.join(iotests.test_dir, 'disk_a')
+disk_b = os.path.join(iotests.test_dir, 'disk_b')
+size = '1M'
+mig_file = os.path.join(iotests.test_dir, 'mig_file')
+mig_cmd = 'exec: cat > ' + mig_file
+
+
+class TestMigrateDuringBackup(iotests.QMPTestCase):
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk_a)
+        os.remove(disk_b)
+        os.remove(mig_file)
+
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, size)
+        qemu_img_create('-f', iotests.imgfmt, disk_b, size)
+        qemu_io('-c', f'write 0 {size}', disk_a)
+
+        self.vm = iotests.VM().add_drive(disk_a)
+        self.vm.launch()
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'target',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': disk_b
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+    def test_migrate(self):
+        result = self.vm.qmp('blockdev-backup', device='drive0',
+                             target='target', sync='full',
+                             speed=1, x_perf={
+                                 'max-workers': 1,
+                                 'max-chunk': 64 * 1024
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('job-pause', id='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('migrate-set-capabilities',
+                             capabilities=[{'capability': 'events',
+                                            'state': True}])
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
+
+        e = self.vm.events_wait((('MIGRATION',
+                                  {'data': {'status': 'completed'}}),
+                                 ('MIGRATION',
+                                  {'data': {'status': 'failed'}})))
+
+        # Don't assert that e is 'failed' now: this way we'll miss
+        # possible crash when backup continues :)
+
+        result = self.vm.qmp('block-job-set-speed', device='drive0',
+                             speed=0)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('job-resume', id='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        # For future: if something changes so that both migration
+        # and backup pass, let's not miss that moment, as it may
+        # be a bug as well as improvement.
+        self.assert_qmp(e, 'data/status', 'failed')
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/migrate-during-backup.out b/tests/qemu-iotests/tests/migrate-during-backup.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-during-backup.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.31.1


