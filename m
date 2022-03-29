Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB94EB51F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:18:05 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJE3-0003Qo-52
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:18:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgu-0006Wb-2D; Tue, 29 Mar 2022 16:43:49 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:37738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgq-0006ui-Pd; Tue, 29 Mar 2022 16:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=HhmfmMSCBOxQPJQY99sDIa305o/pP2wmLQjU36DyQKY=; 
 t=1648586624;x=1649192024; 
 b=IOS2zPf4361B/g0TDmJArKb2vLU502VnTAD1KCrydJnep4BInaSTo4tziCryej3za/usuoPY1jkzN7P4N3T+0jJTku5xhANQc4pj2xA5L9tbOjY4JMm+PUpnSGUKD8AU6hRxjY2+CtEASyH7ty9p8yT9YNaupAdQ+TOpR6YUcjJkXwFoV0hQH9aVHW+sKYUNPOJgvRcSAl1uaK9naqpoRChHTSPPbVrfvTScDDL0u6HVfxhyYIERUz7slhsNAX3CXKHpvJk2KnHaZwlTmcg9HBt2DyPSoSuF8s3M4kTagVtmYuyUu9p0iuLupKcsnOqaZP/rbsxF5rZj6UWiRoT5QA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIgS-000374-U5; Tue, 29 Mar 2022 23:43:21 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 32/45] iotests: add blockdev-add-transaction
Date: Tue, 29 Mar 2022 23:40:54 +0300
Message-Id: <20220329204107.411011-33-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B9312AC9C40832D313E4D2A3E6DB16D6DEC206EF2094F4D7342F7B8F85B30CF495
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7548C33FFD72831AFEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637ED2BA022FBF94AB68638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8659FAE6794D20ACBCE2E3141DAFA4F1B6F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC2EE5AD8F952D28FBA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE38D4DC57D478E6882AE38A8E97BAFFB1D8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE360910C30DCD593B1040F9FF01DFDA4A8C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F790063703AFC36FC312010EEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5C633A8DF60F7CD89331CA881A6C333109C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AA13E2DDB906786202BF1D6572892E0F2446D424ACEFCC034CCF7612EEFF4C1C3BCF5B6169A590CA1D7E09C32AA3244C9D03595BB05404135BA0ACE3BA9911CD05AB220A9D022EBC83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGbPxGmXGE/WSQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE336C705384C873167546BEA4EADCC61F2CADFABBE525F35EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Add a test for transaction support of blockdev-add.

Test is format-agnostic, so limit it to qcow2 to avoid extra test runs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 .../tests/blockdev-add-transaction            | 52 +++++++++++++++++++
 .../tests/blockdev-add-transaction.out        |  6 +++
 2 files changed, 58 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out

diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction b/tests/qemu-iotests/tests/blockdev-add-transaction
new file mode 100755
index 0000000000..ce3c1c069b
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction
@@ -0,0 +1,52 @@
+#!/usr/bin/env python3
+#
+# Test blockdev-add transaction action
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
+import iotests
+from iotests import log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+with iotests.VM() as vm:
+    vm.launch()
+
+    # Use same node-name for nodes, neither one should appear.
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
+
+    vm.qmp_log('transaction', actions=[
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node0', 'driver': 'null-co',
+                  'size': 1024 * 1024}},
+        {'type': 'blockdev-add',
+         'data': {'node-name': 'node1', 'driver': 'null-co',
+                  'size': 1024 * 1024}}
+    ])
+
+    n = len(vm.qmp('query-named-block-nodes')['return'])
+    log(f'Created {n} nodes')
diff --git a/tests/qemu-iotests/tests/blockdev-add-transaction.out b/tests/qemu-iotests/tests/blockdev-add-transaction.out
new file mode 100644
index 0000000000..7e6cd5a9a3
--- /dev/null
+++ b/tests/qemu-iotests/tests/blockdev-add-transaction.out
@@ -0,0 +1,6 @@
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}]}}
+{"error": {"class": "GenericError", "desc": "Duplicate nodes with node-name='node0'"}}
+Created 0 nodes
+{"execute": "transaction", "arguments": {"actions": [{"data": {"driver": "null-co", "node-name": "node0", "size": 1048576}, "type": "blockdev-add"}, {"data": {"driver": "null-co", "node-name": "node1", "size": 1048576}, "type": "blockdev-add"}]}}
+{"return": {}}
+Created 2 nodes
-- 
2.35.1


