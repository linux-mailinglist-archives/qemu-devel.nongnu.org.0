Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540F4A611E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:13:58 +0100 (CET)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvn3-0006lt-It
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:13:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRO-0002kR-8w
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRK-00034G-PF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBP42+llKkf/zlfM9rVqtVCLG3K2hw9I/0giDQuALt4=;
 b=GY4EY4abaaEyyiP9cYzpFitN5JmJB0dSd3CGZdKDzAloBlBwzI+hj0okoX20hbHJvltnbH
 ePxR0syxGSTS5xk3HvzhFwQpHXmjbTvXn1jX714fnf5E0Vb4UNMK4tglOsaVaY2zMjxrLa
 aaAM4Ig9+z+JyoMQcM/1t3FvupcZDLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-Skvv6MmiPh-T6ygNtnCpfg-1; Tue, 01 Feb 2022 09:44:09 -0500
X-MC-Unique: Skvv6MmiPh-T6ygNtnCpfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4D21091DA0;
 Tue,  1 Feb 2022 14:44:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3CE70D2B;
 Tue,  1 Feb 2022 14:44:07 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/24] iotests/migration-permissions: New test
Date: Tue,  1 Feb 2022 15:42:32 +0100
Message-Id: <20220201144233.617021-24-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test checks that a raw image in use by a virtio-blk device does not
share the WRITE permission both before and after migration.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 .../qemu-iotests/tests/migration-permissions  | 101 ++++++++++++++++++
 .../tests/migration-permissions.out           |   5 +
 2 files changed, 106 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migration-permissions
 create mode 100644 tests/qemu-iotests/tests/migration-permissions.out

diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
new file mode 100755
index 0000000000..6be02581c7
--- /dev/null
+++ b/tests/qemu-iotests/tests/migration-permissions
@@ -0,0 +1,101 @@
+#!/usr/bin/env python3
+# group: migration
+#
+# Copyright (C) 2021 Red Hat, Inc.
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
+from iotests import imgfmt, qemu_img_create, qemu_io
+
+
+test_img = os.path.join(iotests.test_dir, 'test.img')
+mig_sock = os.path.join(iotests.sock_dir, 'mig.sock')
+
+
+class TestMigrationPermissions(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create('-f', imgfmt, test_img, '1M')
+
+        # Set up two VMs (source and destination) accessing the same raw
+        # image file with a virtio-blk device; prepare the destination for
+        # migration with .add_incoming() and enable migration events
+        vms = [None, None]
+        for i in range(2):
+            vms[i] = iotests.VM(path_suffix=f'{i}')
+            vms[i].add_blockdev(f'file,node-name=prot,filename={test_img}')
+            vms[i].add_blockdev(f'{imgfmt},node-name=fmt,file=prot')
+            vms[i].add_device('virtio-blk,drive=fmt')
+
+            if i == 1:
+                vms[i].add_incoming(f'unix:{mig_sock}')
+
+            vms[i].launch()
+
+            result = vms[i].qmp('migrate-set-capabilities',
+                                capabilities=[
+                                    {'capability': 'events', 'state': True}
+                                ])
+            self.assert_qmp(result, 'return', {})
+
+        self.vm_s = vms[0]
+        self.vm_d = vms[1]
+
+    def tearDown(self):
+        self.vm_s.shutdown()
+        self.vm_d.shutdown()
+        try:
+            os.remove(mig_sock)
+        except FileNotFoundError:
+            pass
+        os.remove(test_img)
+
+    # Migrate an image in use by a virtio-blk device to another VM and
+    # verify that the WRITE permission is unshared both before and after
+    # migration
+    def test_post_migration_permissions(self):
+        # Try to access the image R/W, which should fail because virtio-blk
+        # has not been configured with share-rw=on
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        if not log.strip():
+            print('ERROR (pre-migration): qemu-io should not be able to '
+                  'access this image, but it reported no error')
+        else:
+            # This is the expected output
+            assert 'Is another process using the image' in log
+
+        # Now migrate the VM
+        self.vm_s.qmp('migrate', uri=f'unix:{mig_sock}')
+        assert self.vm_s.wait_migration(None)
+        assert self.vm_d.wait_migration(None)
+
+        # Try the same qemu-io access again, verifying that the WRITE
+        # permission remains unshared
+        log = qemu_io('-f', imgfmt, '-c', 'quit', test_img)
+        if not log.strip():
+            print('ERROR (post-migration): qemu-io should not be able to '
+                  'access this image, but it reported no error')
+        else:
+            # This is the expected output
+            assert 'Is another process using the image' in log
+
+
+if __name__ == '__main__':
+    # Only works with raw images because we are testing the
+    # BlockBackend permissions; image format drivers may additionally
+    # unshare permissions and thus tamper with the result
+    iotests.main(supported_fmts=['raw'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/migration-permissions.out b/tests/qemu-iotests/tests/migration-permissions.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/migration-permissions.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.34.1


