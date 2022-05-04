Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3984E51A249
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:34:58 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG5h-0000jr-Aq
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwl-0000ty-Bt
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwh-0007Go-Le
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8HRoTe5Si1EPm2zBxMmsdNODjn1RuROexxK2Q5XatA=;
 b=W+1xpIq8CHayNnv6Vo3267dRJDFUj1u107+0ReaxZgkJBZhyLPg5hjzaSDhR2vpUq73pjF
 6RzM8B8gckeDoLNhzIGtRH5IZEPas/hwlfChn08ZhGOYSQo/Wbjf+ITKUOMt951ncEhbav
 s7vG4cEdMlUCNng0lroW0hdW1HDQ/oY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-yre8KemCOgKaVZ83S9wxhA-1; Wed, 04 May 2022 10:25:35 -0400
X-MC-Unique: yre8KemCOgKaVZ83S9wxhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F81B3C62B64;
 Wed,  4 May 2022 14:25:35 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2607402189;
 Wed,  4 May 2022 14:25:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 08/13] iotests: Add regression test for issue 945
Date: Wed,  4 May 2022 16:25:17 +0200
Message-Id: <20220504142522.167506-9-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Create a VM with a BDS in an iothread, add -incoming defer to the
command line, and then export this BDS via NBD.  Doing so should not
fail an assertion.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220427114057.36651-5-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../tests/export-incoming-iothread            | 81 +++++++++++++++++++
 .../tests/export-incoming-iothread.out        |  5 ++
 2 files changed, 86 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/export-incoming-iothread
 create mode 100644 tests/qemu-iotests/tests/export-incoming-iothread.out

diff --git a/tests/qemu-iotests/tests/export-incoming-iothread b/tests/qemu-iotests/tests/export-incoming-iothread
new file mode 100755
index 0000000000..7679e49103
--- /dev/null
+++ b/tests/qemu-iotests/tests/export-incoming-iothread
@@ -0,0 +1,81 @@
+#!/usr/bin/env python3
+# group: rw quick migration
+#
+# Regression test for issue 945:
+# https://gitlab.com/qemu-project/qemu/-/issues/945
+# Test adding an export on top of an iothread-ed block device while in
+# -incoming defer.
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
+import iotests
+from iotests import qemu_img_create
+
+
+image_size = 1 * 1024 * 1024
+test_img = os.path.join(iotests.test_dir, 'test.img')
+node_name = 'node0'
+iothread_id = 'iothr0'
+
+nbd_sock = os.path.join(iotests.sock_dir, 'nbd.sock')
+
+
+class TestExportIncomingIothread(iotests.QMPTestCase):
+    def setUp(self) -> None:
+        qemu_img_create('-f', iotests.imgfmt, test_img, str(image_size))
+
+        self.vm = iotests.VM()
+        self.vm.add_object(f'iothread,id={iothread_id}')
+        self.vm.add_blockdev((
+            f'driver={iotests.imgfmt}',
+            f'node-name={node_name}',
+            'file.driver=file',
+            f'file.filename={test_img}'
+        ))
+        self.vm.add_incoming('defer')
+        self.vm.launch()
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(test_img)
+
+    def test_export_add(self):
+        result = self.vm.qmp('nbd-server-start', {
+            'addr': {
+                'type': 'unix',
+                'data': {
+                    'path': nbd_sock
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Regression test for issue 945: This should not fail an assertion
+        result = self.vm.qmp('block-export-add', {
+            'type': 'nbd',
+            'id': 'exp0',
+            'node-name': node_name,
+            'iothread': iothread_id
+        })
+        self.assert_qmp(result, 'return', {})
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['generic'],
+                 unsupported_fmts=['luks'], # Would need a secret
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/export-incoming-iothread.out b/tests/qemu-iotests/tests/export-incoming-iothread.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/export-incoming-iothread.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.35.1


