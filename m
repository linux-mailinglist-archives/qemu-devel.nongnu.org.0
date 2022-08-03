Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003B588EE6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:49:43 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFgs-0003AZ-5I
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oJFcG-0006St-Sf
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oJFcE-0002es-R8
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659537894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPTpJKQmJ5CjbixxfOK6/Br8MhSadxcQXbhjhetEHPo=;
 b=adBuMmicnvLAM9Q8EAt7ta6cPVmrT2q309z8qEH9KUrBlR1aXEoOJZaRiipY3VHupvlc0H
 4Viig1A8SCkgFkqre2MNI40ezG4bszlcmaOIHqJF0aeqlZwAe2lKF5l+R3csYb7adp7nMA
 Es4XGMcmEU9NtQPphsKJK7JJdMtocLU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-r0Myhr5DOnaQ1I_LidPrQA-1; Wed, 03 Aug 2022 10:44:53 -0400
X-MC-Unique: r0Myhr5DOnaQ1I_LidPrQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABD19280400C;
 Wed,  3 Aug 2022 14:44:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B2BF1121314;
 Wed,  3 Aug 2022 14:44:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/3] iotests/backing-file-invalidation: Add new test
Date: Wed,  3 Aug 2022 16:44:46 +0200
Message-Id: <20220803144446.20723-4-hreitz@redhat.com>
In-Reply-To: <20220803144446.20723-1-hreitz@redhat.com>
References: <20220803144446.20723-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new test to see what happens when you migrate a VM with a backing
chain that has json:{} backing file strings, which, when opened, will be
resolved to plain filenames.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 .../tests/backing-file-invalidation           | 152 ++++++++++++++++++
 .../tests/backing-file-invalidation.out       |   5 +
 2 files changed, 157 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/backing-file-invalidation
 create mode 100644 tests/qemu-iotests/tests/backing-file-invalidation.out

diff --git a/tests/qemu-iotests/tests/backing-file-invalidation b/tests/qemu-iotests/tests/backing-file-invalidation
new file mode 100755
index 0000000000..4eccc80153
--- /dev/null
+++ b/tests/qemu-iotests/tests/backing-file-invalidation
@@ -0,0 +1,152 @@
+#!/usr/bin/env python3
+# group: rw migration
+#
+# Migrate a VM with a BDS with backing nodes, which runs
+# bdrv_invalidate_cache(), which for qcow2 and qed triggers reading the
+# backing file string from the image header.  Check whether this
+# interferes with bdrv_backing_overridden().
+#
+# Copyright (C) 2022 Red Hat, Inc.
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
+import json
+import os
+from typing import Optional
+
+import iotests
+from iotests import qemu_img_create, qemu_img_info
+
+
+image_size = 1 * 1024 * 1024
+imgs = [os.path.join(iotests.test_dir, f'{i}.img') for i in range(0, 4)]
+
+mig_sock = os.path.join(iotests.sock_dir, 'mig.sock')
+
+
+class TestPostMigrateFilename(iotests.QMPTestCase):
+    vm_s: Optional[iotests.VM] = None
+    vm_d: Optional[iotests.VM] = None
+
+    def setUp(self) -> None:
+        # Create backing chain of three images, where the backing file strings
+        # are json:{} filenames
+        qemu_img_create('-f', iotests.imgfmt, imgs[0], str(image_size))
+        for i in range(1, 3):
+            backing = {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': imgs[i - 1]
+                }
+            }
+            qemu_img_create('-f', iotests.imgfmt, '-F', iotests.imgfmt,
+                            '-b', 'json:' + json.dumps(backing),
+                            imgs[i], str(image_size))
+
+    def tearDown(self) -> None:
+        if self.vm_s is not None:
+            self.vm_s.shutdown()
+        if self.vm_d is not None:
+            self.vm_d.shutdown()
+
+        for img in imgs:
+            try:
+                os.remove(img)
+            except OSError:
+                pass
+        try:
+            os.remove(mig_sock)
+        except OSError:
+            pass
+
+    def test_migration(self) -> None:
+        """
+        Migrate a VM with the backing chain created in setUp() attached.  At
+        the end of the migration process, the destination will run
+        bdrv_invalidate_cache(), which for some image formats (qcow2 and qed)
+        means the backing file string is re-read from the image header.  If
+        this overwrites bs->auto_backing_file, doing so may cause
+        bdrv_backing_overridden() to become true: The image header reports a
+        json:{} filename, but when opening it, bdrv_refresh_filename() will
+        simplify it to a plain simple filename; and when bs->auto_backing_file
+        and bs->backing->bs->filename differ, bdrv_backing_overridden() becomes
+        true.
+        If bdrv_backing_overridden() is true, the BDS will be forced to get a
+        json:{} filename, which in general is not the end of the world, but not
+        great.  Check whether that happens, i.e. whether migration changes the
+        node's filename.
+        """
+
+        blockdev = {
+            'node-name': 'node0',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': imgs[2]
+            }
+        }
+
+        self.vm_s = iotests.VM(path_suffix='a') \
+                           .add_blockdev(json.dumps(blockdev))
+        self.vm_d = iotests.VM(path_suffix='b') \
+                           .add_blockdev(json.dumps(blockdev)) \
+                           .add_incoming(f'unix:{mig_sock}')
+
+        assert self.vm_s is not None
+        assert self.vm_d is not None
+
+        self.vm_s.launch()
+        self.vm_d.launch()
+
+        pre_mig_filename = self.vm_s.node_info('node0')['file']
+
+        self.vm_s.qmp('migrate', uri=f'unix:{mig_sock}')
+
+        # Wait for migration to be done
+        self.vm_s.event_wait('STOP')
+        self.vm_d.event_wait('RESUME')
+
+        post_mig_filename = self.vm_d.node_info('node0')['file']
+
+        # Verify that the filename hasn't changed from before the migration
+        self.assertEqual(pre_mig_filename, post_mig_filename)
+
+        self.vm_s.shutdown()
+        self.vm_s = None
+
+        # For good measure, try creating an overlay and check its backing
+        # chain below.  This is how the issue was originally found.
+        result = self.vm_d.qmp('blockdev-snapshot-sync',
+                               format=iotests.imgfmt,
+                               snapshot_file=imgs[3],
+                               node_name='node0',
+                               snapshot_node_name='node0-overlay')
+        self.assert_qmp(result, 'return', {})
+
+        self.vm_d.shutdown()
+        self.vm_d = None
+
+        # Check the newly created overlay's backing chain
+        chain = qemu_img_info('--backing-chain', imgs[3])
+        for index, image in enumerate(chain):
+            self.assertEqual(image['filename'], imgs[3 - index])
+
+
+if __name__ == '__main__':
+    # These are the image formats that run their open() function from their
+    # .bdrv_co_invaliate_cache() implementations, so test them
+    iotests.main(supported_fmts=['qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/backing-file-invalidation.out b/tests/qemu-iotests/tests/backing-file-invalidation.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/backing-file-invalidation.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.36.1


