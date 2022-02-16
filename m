Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583C54B864D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:58:11 +0100 (CET)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI0g-00052V-G9
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:58:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHxT-0007fV-Rw
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHxQ-0001ut-5i
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645008887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=849gBJAiwykPVe2w/D77DGqsxuXJuInNp1zPf+oUdas=;
 b=Q4ILtgN2RUsZQoSLtsLN1dqkHMWD9IViv587u5dB66lZdqqIjdKpcgOjJH3VO1KsjVczKq
 paHqDgvz6odEUBgnKAcst/3peWgiz/Yf69dcT+bWCk6HwfVCQWJT2cuKw4zUITUenuRG5C
 gBsCJmuTRBHzlCR8Ohupic1eKVy+v3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-ezE5t_ipNiCUdBM0XEpHSA-1; Wed, 16 Feb 2022 05:54:44 -0500
X-MC-Unique: ezE5t_ipNiCUdBM0XEpHSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A472344AF;
 Wed, 16 Feb 2022 10:54:43 +0000 (UTC)
Received: from localhost (unknown [10.39.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B3FC60C2E;
 Wed, 16 Feb 2022 10:54:43 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/3] iotests/graph-changes-while-io: New test
Date: Wed, 16 Feb 2022 11:53:55 +0100
Message-Id: <20220216105355.30729-4-hreitz@redhat.com>
In-Reply-To: <20220216105355.30729-1-hreitz@redhat.com>
References: <20220216105355.30729-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test the following scenario:
1. Some block node (null-co) attached to a user (here: NBD server) that
   performs I/O and keeps the node in an I/O thread
2. Repeatedly run blockdev-add/blockdev-del to add/remove an overlay
   to/from that node

Each blockdev-add triggers bdrv_refresh_limits(), and because
blockdev-add runs in the main thread, it does not stop the I/O requests.
I/O can thus happen while the limits are refreshed, and when such a
request sees a temporarily invalid block limit (e.g. alignment is 0),
this may easily crash qemu (or the storage daemon in this case).

The block layer needs to ensure that I/O requests to a node are paused
while that node's BlockLimits are refreshed.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
 .../tests/graph-changes-while-io.out          |  5 +
 2 files changed, 96 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
 create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out

diff --git a/tests/qemu-iotests/tests/graph-changes-while-io b/tests/qemu-iotests/tests/graph-changes-while-io
new file mode 100755
index 0000000000..567e8cf21e
--- /dev/null
+++ b/tests/qemu-iotests/tests/graph-changes-while-io
@@ -0,0 +1,91 @@
+#!/usr/bin/env python3
+# group: rw
+#
+# Test graph changes while I/O is happening
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
+import os
+from threading import Thread
+import iotests
+from iotests import imgfmt, qemu_img, qemu_img_create, QMPTestCase, \
+        QemuStorageDaemon
+
+
+top = os.path.join(iotests.test_dir, 'top.img')
+nbd_sock = os.path.join(iotests.sock_dir, 'nbd.sock')
+
+
+def do_qemu_img_bench() -> None:
+    """
+    Do some I/O requests on `nbd_sock`.
+    """
+    assert qemu_img('bench', '-f', 'raw', '-c', '2000000',
+                    f'nbd+unix:///node0?socket={nbd_sock}') == 0
+
+
+class TestGraphChangesWhileIO(QMPTestCase):
+    def setUp(self) -> None:
+        # Create an overlay that can be added at runtime on top of the
+        # null-co block node that will receive I/O
+        assert qemu_img_create('-f', imgfmt, '-F', 'raw', '-b', 'null-co://',
+                               top) == 0
+
+        # QSD instance with a null-co block node in an I/O thread,
+        # exported over NBD (on `nbd_sock`, export name "node0")
+        self.qsd = QemuStorageDaemon(
+            '--object', 'iothread,id=iothread0',
+            '--blockdev', 'null-co,node-name=node0,read-zeroes=true',
+            '--nbd-server', f'addr.type=unix,addr.path={nbd_sock}',
+            '--export', 'nbd,id=exp0,node-name=node0,iothread=iothread0,' +
+                        'fixed-iothread=true,writable=true',
+            qmp=True
+        )
+
+    def tearDown(self) -> None:
+        self.qsd.stop()
+
+    def test_blockdev_add_while_io(self) -> None:
+        # Run qemu-img bench in the background
+        bench_thr = Thread(target=do_qemu_img_bench)
+        bench_thr.start()
+
+        # While qemu-img bench is running, repeatedly add and remove an
+        # overlay to/from node0
+        while bench_thr.is_alive():
+            result = self.qsd.qmp('blockdev-add', {
+                'driver': imgfmt,
+                'node-name': 'overlay',
+                'backing': 'node0',
+                'file': {
+                    'driver': 'file',
+                    'filename': top
+                }
+            })
+            self.assert_qmp(result, 'return', {})
+
+            result = self.qsd.qmp('blockdev-del', {
+                'node-name': 'overlay'
+            })
+            self.assert_qmp(result, 'return', {})
+
+        bench_thr.join()
+
+if __name__ == '__main__':
+    # Format must support raw backing files
+    iotests.main(supported_fmts=['qcow', 'qcow2', 'qed'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/graph-changes-while-io.out b/tests/qemu-iotests/tests/graph-changes-while-io.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/graph-changes-while-io.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.34.1


