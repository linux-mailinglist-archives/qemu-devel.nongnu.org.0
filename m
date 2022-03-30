Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC704ED076
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:56:03 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiAU-0007rd-Hu
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:56:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftE-0008MP-FH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:08 -0400
Received: from [2a00:1450:4864:20::22f] (port=37709
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft9-0003SB-Uc
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:04 -0400
Received: by mail-lj1-x22f.google.com with SMTP id r22so29480787ljd.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hjRTt5F+M53fho4ildO8xWS7G1G7VABYjwPC+axBAnc=;
 b=ig/yo9xT5o4OkTkKo2SM6qfKYmatv9O/U82iurBzmpYuYLd8wvszb7XdFshcVwITeT
 mj7ZaT241Oq79GtMiHfzebuHl7Uo6ecabPVRRDb4HMO+f7LZKTS7M4R+HcxTneQijfGe
 mLK8rc9pw9B4dj++WYoAEUQM//6t8QS4NrxQtfadd+3Dsu97csbrUYytiClgx8YFvum3
 0w9PwAJwH2hcCXO6FurxHWKHTFh69sg15g6hPNCjPqRwaHJddZFLS0D/Q94CtzZL1WZU
 A9NmLTUOi+gRzAQ/ICnCtxJ3oheK+shhxWsuwVWnKVj7sws5Sr/Uke0dz/leuB3m3ViN
 G67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hjRTt5F+M53fho4ildO8xWS7G1G7VABYjwPC+axBAnc=;
 b=dfSLcNfCnqJNOzLiUc4u8FabGnXD/IvPptGcxHsY28qDpH/pW5xr0CVlDh1vWYhQIu
 gc/CfjkCWb6bG5D5tggyHpPzvY2WDL1ioSlf1m1F5Y46J8munTCW9dh6Ikza4h8xkzGM
 P9L5HBs2Um2nQaNx/I2TezT3gqrPIn3OjhYyPi5vNflehD8OFUp/77OghCEg7ERLo5v8
 2T/uHMNpaBA8NPIgvA7jrgcLWn+DaJBRNOGIpYl66N8sV9/XiF1fnHEjDiseXBEFdg+7
 Ye+bO/N2WJIYCtE3yU4TtohkyKU//5UMWRaLqL/+qzCMBQxP1FvsrqTxfsc3NOqUJF8v
 eAOQ==
X-Gm-Message-State: AOAM530LsgLyKUxondPpS0ZU1G1FchtlY9eV0lTlPmFhbF4zs5P3BqHP
 T+Y+wHcVEM/IphOpx09r9Zxzsw==
X-Google-Smtp-Source: ABdhPJy4UFyEAq9YXDqO5Xmhep3Il2mZFTCxy8bAa55XdI3h0D2GgvYI+o5Zyxfb7e5mYp7ajx3GXg==
X-Received: by 2002:a05:651c:204:b0:249:832a:12b with SMTP id
 y4-20020a05651c020400b00249832a012bmr8362145ljn.473.1648675798279; 
 Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:58 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 43/45] iotests: add filter-insertion
Date: Thu, 31 Mar 2022 00:29:00 +0300
Message-Id: <20220330212902.590099-44-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Demonstrate new API for filter insertion and removal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/tests/filter-insertion     | 253 ++++++++++++++++++
 tests/qemu-iotests/tests/filter-insertion.out |   5 +
 2 files changed, 258 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/filter-insertion
 create mode 100644 tests/qemu-iotests/tests/filter-insertion.out

diff --git a/tests/qemu-iotests/tests/filter-insertion b/tests/qemu-iotests/tests/filter-insertion
new file mode 100755
index 0000000000..4898d6e043
--- /dev/null
+++ b/tests/qemu-iotests/tests/filter-insertion
@@ -0,0 +1,253 @@
+#!/usr/bin/env python3
+#
+# Tests for inserting and removing filters in a block graph.
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
+from iotests import qemu_img_create, try_remove
+
+
+disk = os.path.join(iotests.test_dir, 'disk')
+sock = os.path.join(iotests.sock_dir, 'sock')
+size = 1024 * 1024
+
+
+class TestFilterInsertion(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create(disk, str(size))
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        self.vm.qmp_check('blockdev-add', {
+            'node-name': 'disk0',
+            'driver': 'qcow2',
+            'file': {
+                'node-name': 'file0',
+                'driver': 'file',
+                'filename': disk
+            }
+        })
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk)
+        try_remove(sock)
+
+    def test_simple_insertion(self):
+        vm = self.vm
+
+        vm.qmp_check('blockdev-add', {
+            'node-name': 'filter',
+            'driver': 'preallocate',
+            'file': 'file0'
+        })
+
+        vm.qmp_check('x-blockdev-replace', {
+            'parent-type': 'driver',
+            'node-name': 'disk0',
+            'child': 'file',
+            'new-child': 'filter'
+        })
+
+        # Filter inserted:
+        # disk0 -file-> filter -file-> file0
+        vm.assert_edges_list([
+            ('disk0', 'file', 'filter'),
+            ('filter', 'file', 'file0')
+        ])
+
+        vm.qmp_check('x-blockdev-replace', {
+            'parent-type': 'driver',
+            'node-name': 'disk0',
+            'child': 'file',
+            'new-child': 'file0'
+        })
+
+        # Filter replaced, but still exists:
+        # dik0 -file-> file0 <-file- filter
+        vm.assert_edges_list([
+            ('disk0', 'file', 'file0'),
+            ('filter', 'file', 'file0')
+        ])
+
+        vm.qmp_check('blockdev-del', node_name='filter')
+
+        # Filter removed
+        # dik0 -file-> file0
+        vm.assert_edges_list([
+            ('disk0', 'file', 'file0')
+        ])
+
+    def test_tran_insert_under_qdev(self):
+        vm = self.vm
+
+        vm.qmp_check('device_add', driver='virtio-scsi')
+        vm.qmp_check('device_add', id='sda', driver='scsi-hd', drive='disk0')
+
+        vm.qmp_check('transaction', actions=[
+            {
+                'type': 'blockdev-add',
+                'data': {
+                    'node-name': 'filter',
+                    'driver': 'compress',
+                    'file': 'disk0'
+                }
+            }, {
+                'type': 'x-blockdev-replace',
+                'data': {
+                    'parent-type': 'qdev',
+                    'qdev-id': 'sda',
+                    'new-child': 'filter'
+                }
+            }
+        ])
+
+        # Filter inserted:
+        # sda -root-> filter -file-> disk0 -file-> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('sda', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+        ])
+
+        vm.qmp_check('x-blockdev-replace', {
+            'parent-type': 'qdev',
+            'qdev-id': 'sda',
+            'new-child': 'disk0'
+        })
+        vm.qmp_check('blockdev-del', node_name='filter')
+
+        # Filter removed:
+        # sda -root-> disk0 -file-> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('sda', 'root', 'disk0'),
+            ('disk0', 'file', 'file0'),
+        ])
+
+    def test_tran_insert_under_nbd_export(self):
+        vm = self.vm
+
+        vm.qmp_check('nbd-server-start',
+                     addr={'type': 'unix', 'data': {'path': sock}})
+        vm.qmp_check('block-export-add', id='exp1', type='nbd',
+                     node_name='disk0', name='exp1')
+        vm.qmp_check('block-export-add', id='exp2', type='nbd',
+                     node_name='disk0', name='exp2')
+        vm.qmp_check('object-add', qom_type='throttle-group',
+                     id='tg', limits={'iops-read': 1})
+
+        vm.qmp_check('transaction', actions=[
+            {
+                'type': 'blockdev-add',
+                'data': {
+                    'node-name': 'filter',
+                    'driver': 'throttle',
+                    'throttle-group': 'tg',
+                    'file': 'disk0'
+                }
+            }, {
+                'type': 'x-blockdev-replace',
+                'data': {
+                    'parent-type': 'export',
+                    'export-id': 'exp1',
+                    'new-child': 'filter'
+                }
+            }
+        ])
+
+        # Only exp1 is throttled, exp2 is not:
+        # exp1 -root-> filter
+        #                |
+        #                |file
+        #                v
+        # exp2 -file-> disk0 -file> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'disk0')
+        ])
+
+        vm.qmp_check('x-blockdev-replace', {
+            'parent-type': 'export',
+            'export-id': 'exp2',
+            'new-child': 'filter'
+        })
+
+        # Both throttled:
+        # exp1 -root-> filter <-file- exp2
+        #                |
+        #                |file
+        #                v
+        #              disk0 -file> file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'filter'),
+            ('filter', 'file', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'filter')
+        ])
+
+        # Check, that filter is in use and can't be removed
+        result = vm.qmp('blockdev-del', node_name='filter')
+        self.assert_qmp(result, 'error/desc', 'Node filter is in use')
+
+        vm.qmp_check('transaction', actions=[
+            {
+                'type': 'x-blockdev-replace',
+                'data': {
+                    'parent-type': 'export',
+                    'export-id': 'exp1',
+                    'new-child': 'disk0'
+                }
+            }, {
+                'type': 'x-blockdev-replace',
+                'data': {
+                    'parent-type': 'export',
+                    'export-id': 'exp2',
+                    'new-child': 'disk0'
+                }
+            }
+        ])
+        vm.qmp_check('blockdev-del', node_name='filter')
+
+        # Filter removed:
+        # exp1 -root-> disk0 <-file- exp2
+        #                |
+        #                |file
+        #                v
+        #              file0
+        vm.assert_edges_list([
+            # parent_node_name, child_name, child_node_name
+            ('exp1', 'root', 'disk0'),
+            ('disk0', 'file', 'file0'),
+            ('exp2', 'root', 'disk0')
+        ])
+
+
+if __name__ == '__main__':
+    iotests.main(
+        supported_fmts=['qcow2'],
+        supported_protocols=['file']
+    )
diff --git a/tests/qemu-iotests/tests/filter-insertion.out b/tests/qemu-iotests/tests/filter-insertion.out
new file mode 100644
index 0000000000..8d7e996700
--- /dev/null
+++ b/tests/qemu-iotests/tests/filter-insertion.out
@@ -0,0 +1,5 @@
+...
+----------------------------------------------------------------------
+Ran 3 tests
+
+OK
-- 
2.35.1


