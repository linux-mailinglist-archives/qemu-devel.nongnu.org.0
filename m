Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8EA4EE230
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:58:37 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0wG-0000k7-63
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:58:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0v4-00079x-76
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:22 -0400
Received: from [2a00:1450:4864:20::232] (port=38705
 helo=mail-lj1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0v2-0005Wg-Er
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:21 -0400
Received: by mail-lj1-x232.google.com with SMTP id s13so1199688ljd.5
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ej+VvYc2FFYnKuTpDRtiFYixVr2tf61aNKcIz4bACw0=;
 b=C4xMjHOFZfLIW9+ukzn4Sa97p6BvLfaHekxARKvvJLTI770jdLje0j/AzGLf0JY8I/
 4CK/rZWpmfTIA/ldNpL1XQ3ltyNZhAYAck5Q+oE8NhcItAPXwWriuL2W+UySEinUaJyl
 pmhDBd0jHyKrHimyAQCM/3aLiBgppktZqba3oRQ9oZvWtiYveLhT7/b3g9MfSzsXXQsJ
 SJF/EmxoLWH5TY+4APNoiXnPEMMz1E/+sYU4f4iUYUvq0CbeTiRFSMC6kdkUrq+bj9ib
 iaRkitb/7z2prML3I5/9/GZcjq7wEiNA306rCBCRviiD7aX4GCJjvKobG/1e+O6CQf0k
 PlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ej+VvYc2FFYnKuTpDRtiFYixVr2tf61aNKcIz4bACw0=;
 b=yPq+tG1Qt6wcoXu4lgDjYLpBG68bgXKQcCSU3q5VyY2i1p87JCaWvr5NlJdkzoMMn7
 dgxsJrEz068ALdnE29vkLjSkjeZs9TlB89z3njynBCuHGb1hfPDQ6NRjGMcvcs32K6L2
 IVyr0GNLLDIAPYoWZhEgG1wetEZmz1RIt+Pzak/Q49Kt2aWagHI+HYQ1rUVuSyjj6JjK
 cNY0XZW5S0cZnFPpIvtXfkELANyjaPtRkjRUdQnKeXnXZs40OQiXU74d7yfnoPLmzUWK
 sN+r/cSkeLs5f9F5g0wBnvgxUtTzlqgMjcrh41obxD9k+0FdekNSqbZKJ6a5eTU5XxkF
 CI7A==
X-Gm-Message-State: AOAM532AmSSAS3zd3WSTfZpc1XfyGVJcFGQtpLxj1WV+RrID4n9aal2C
 LFqb9ymoRJwnIlrdPS58c24MKg==
X-Google-Smtp-Source: ABdhPJw6QHe3NZB3vyeFARqYmEKpqSTQe6XaSlq9f9qt6jAxuUpkqYV9nnXyBka6LjNaN8mVqcGC/A==
X-Received: by 2002:a05:651c:22a:b0:249:7c82:1669 with SMTP id
 z10-20020a05651c022a00b002497c821669mr11202995ljn.390.1648756635447; 
 Thu, 31 Mar 2022 12:57:15 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 z26-20020ac2419a000000b004484bf6d1e6sm30539lfh.233.2022.03.31.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:57:15 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] iotests: add backup-discard-source
Date: Thu, 31 Mar 2022 22:57:01 +0300
Message-Id: <20220331195701.220690-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331195701.220690-1-vsementsov@openvz.org>
References: <20220331195701.220690-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::232
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x232.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, hreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add test for a new backup option: discard-source.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 .../qemu-iotests/tests/backup-discard-source  | 154 ++++++++++++++++++
 .../tests/backup-discard-source.out           |   5 +
 2 files changed, 159 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/backup-discard-source
 create mode 100644 tests/qemu-iotests/tests/backup-discard-source.out

diff --git a/tests/qemu-iotests/tests/backup-discard-source b/tests/qemu-iotests/tests/backup-discard-source
new file mode 100755
index 0000000000..d301fbd2d1
--- /dev/null
+++ b/tests/qemu-iotests/tests/backup-discard-source
@@ -0,0 +1,154 @@
+#!/usr/bin/env python3
+#
+# Test removing persistent bitmap from backing
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
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
+
+import iotests
+from iotests import qemu_img_create, qemu_img_map, qemu_io
+
+
+temp_img = os.path.join(iotests.test_dir, 'temp')
+source_img = os.path.join(iotests.test_dir, 'source')
+target_img = os.path.join(iotests.test_dir, 'target')
+size = '1M'
+
+def get_actual_size(vm, node_name):
+    nodes = vm.qmp('query-named-block-nodes', flat=True)['return']
+    node = next(n for n in nodes if n['node-name'] == node_name)
+    return node['image']['actual-size']
+
+
+class TestBackup(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, source_img, size)
+        qemu_img_create('-f', iotests.imgfmt, temp_img, size)
+        qemu_img_create('-f', iotests.imgfmt, target_img, size)
+        qemu_io('-c', 'write 0 1M', source_img)
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': iotests.imgfmt,
+                'discard': 'unmap',
+                'node-name': 'temp',
+                'file': {
+                    'driver': 'file',
+                    'filename': temp_img
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'discard': 'unmap',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'driver': iotests.imgfmt,
+            'node-name': 'target',
+            'file': {
+                'driver': 'file',
+                'filename': target_img
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        self.assertLess(get_actual_size(self.vm, 'temp'), 512 * 1024)
+
+    def tearDown(self):
+        # That should fail, because region is discarded
+        self.vm.hmp_qemu_io('access', 'read 0 1M')
+
+        self.vm.shutdown()
+
+        self.assertTrue('read failed: Permission denied' in self.vm.get_log())
+
+        # Final check that temp image is empty
+        mapping = qemu_img_map(temp_img)
+        self.assertEqual(len(mapping), 1)
+        self.assertEqual(mapping[0]['start'], 0)
+        self.assertEqual(mapping[0]['length'], 1024 * 1024)
+        self.assertEqual(mapping[0]['data'], False)
+
+        os.remove(temp_img)
+        os.remove(source_img)
+        os.remove(target_img)
+
+    def do_backup(self):
+        result = self.vm.qmp('blockdev-backup', device='access',
+                             sync='full', target='target',
+                             job_id='backup0',
+                             discard_source=True)
+        self.assert_qmp(result, 'return', {})
+
+        self.vm.event_wait(name='BLOCK_JOB_COMPLETED')
+
+    def test_discard_written(self):
+        """
+        1. Guest writes
+        2. copy-before-write operation, data is stored to temp
+        3. start backup(discard_source=True), check that data is
+           removed from temp
+        """
+        # Trigger copy-before-write operation
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        # Check that data is written to temporary image
+        self.assertGreater(get_actual_size(self.vm, 'temp'), 1024 * 1024)
+
+        self.do_backup()
+
+    def test_discard_cbw(self):
+        """
+        1. do backup(discard_source=True), which should inform
+           copy-before-write that data is not needed anymore
+        2. Guest writes
+        3. Check that copy-before-write operation is not done
+        """
+        self.do_backup()
+
+        # Try trigger copy-before-write operation
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        # Check that data is not written to temporary image, as region
+        # is discarded from copy-before-write process
+        self.assertLess(get_actual_size(self.vm, 'temp'), 512 * 1024)
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/backup-discard-source.out b/tests/qemu-iotests/tests/backup-discard-source.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/backup-discard-source.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.35.1


