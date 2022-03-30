Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F554EBEC2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:28:55 +0200 (CEST)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVZN-0004ug-Mh
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:28:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJb-0002Ph-Ol; Wed, 30 Mar 2022 06:12:35 -0400
Received: from smtp46.i.mail.ru ([94.100.177.106]:52088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZVJX-0007yy-GG; Wed, 30 Mar 2022 06:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=i53SiEufR/tgv7eUhZU/qZ/EBoMibuWBcyGrrv7d5gc=; 
 t=1648635151;x=1649240551; 
 b=UAC2gNY39hRZnpizoeUaaJ0WrfMuU89YVtYjAPXuvDv6jf+zq9XTlrESBLcLI+wfCXWnZKKbDF2sVc2AagiRUowP/z1NCnTLSwO5qBrai/Av273ckWTc6vLZEYPdCw4wzdB070eZEQLEaCfip7ddCQl37nrD62Xsf46fTFCX3tEQz4xkFmnGhfI1/WzWanWFBzRR6OFC9ebXyNMT+OaBc6Fzg7MXuOfmUHVPZFxYw/7zTMHCuf2TgTA5JlzzvfjtensDJh/rRi+kpODDFFBU3CBum7tFElgE0s6+UrassXtryFSX9XyN+KSPK6qTjcIJRJRcanUGiU5w6plO25LaIQ==;
Received: by smtp46.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZVJU-00048P-1e; Wed, 30 Mar 2022 13:12:28 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 43/45] iotests: add filter-insertion
Date: Wed, 30 Mar 2022 13:12:15 +0300
Message-Id: <20220330101217.4229-5-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp46.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB614C163C38C65CC3EA73BEA6060E4E357600894C459B0CD1B981A96237C1CE6629273F00296EF4AF0D338E05E3556DF6F75D748730268862CC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7548C33FFD72831AFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378629C75C8EFA8C148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E6D2B9A48B833175F6690A78E488D0526F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF2AB80D4E8443212D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE79C58D14DB1945D3CEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3F6F64B09A546065435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7AB91EFAE5A2C4071B43624140A33D887BCFFE757E10EC0C78B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34060C3C6DE316ECE42D546DB455330E102A3266CD3ED25C16E16C162A10027661BF2C128750D9AB061D7E09C32AA3244CAB619C05551D90E2E19B736140EB10E4A995755A1445935E83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UyizOmW6NUeA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEF59FC8FC90DF3869749234D0517BED3B18B196E0205D2CCDE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.106;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp46.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Demonstrate new API for filter insertion and removal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
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


