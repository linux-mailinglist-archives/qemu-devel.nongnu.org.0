Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DAE4C5253
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:56:51 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkSA-0005Qx-LV
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFg-0007Ed-OR; Fri, 25 Feb 2022 18:43:56 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFe-0005gS-IX; Fri, 25 Feb 2022 18:43:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEy/xqfoMGnP0+q2E+p5s7Cw2I+IRPnhjD4avBv+y4p6OfThTtObgN0OG+DXN/1JPePjxd91svyZhD/G6dDFb6NfCPsPr9EN6KWCmC/NPA0FxZVvPpAKC7Lhz3wAgZmPPkzVP7RNBRUDLICVahEkF01txoempI2RvTXDRAIx8CBfqjko/jLOaCLDYDTPEPrmgH2Js0FLISwmSaV21/8VVONivio4yp8oWBgasTkyzmEUuJY1YKfJc1lcUYvEp82UA3T6oKhmPYLtsW+mYO57WvWQSRwajgyvdlYeeo4Rq6A9LMJ1IIXdmLjH3m5FZh3ACrcCpcmaWIr9WvLHm8uzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcqavZytIBWrKKHgJpXXj3Smp9XmAxkiH4DX1+L2RjQ=;
 b=bX6b6A2QBYg7eEu9ws1mxTijji2wMfLZBLZPEg62Y+FI24UIx00/fZbQykktLsjYuaX9/RsMDPYLjdoHdIxBjkQnYxxFRT9dBVauv91zvxFu6BLwYeL9bg1rDq+Vr4O4eA1eZLAK7APqhbxah/KKpWqaB566vOheBIJvJitqg5tVYEHLXFv8CGkL0xhTSx5DFTsl1vSBy+YOEJRmzJrRfKxjPxCrts51Qa+kJdtnjQ1VJQXBTEbdntR5jdRaNON+0L2mpkRoIMif0SgR494p4qVJ21/TP7crwKDFJ76USqvIctSQqlrayWCv3U18Oc4apH1Ol5W9qGFaJ9ikpF3+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcqavZytIBWrKKHgJpXXj3Smp9XmAxkiH4DX1+L2RjQ=;
 b=v/YUA9EmbaVO4wpgqNjl4EIC72SmzE/x28iC6XK0N2ZlVw+49SZhZEIjFmcuzgAkCq6nqI3wXxQUKLQJ5ZKyHzu6GzhyTw/lcCNBgK0mTY6vBnYFzOqVZzl5GhvnNnIEn4fhrrxgIafmDXjQzrfh1oDO6r2/YTDud6zcZSB5/Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 11/11] iotests: add filter-insertion
Date: Sat, 26 Feb 2022 00:43:08 +0100
Message-Id: <20220225234308.1754763-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1181dc66-0401-40dc-af5e-08d9f8b8ab58
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172CB0739EBF7B3AA55992FC13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f24uvEAvUrlBLzzQqCvlpZAXLUllKKr6kpG4h9CjRGJJUMk4i9TOeKN+f49QasgB8m3OzzoylZAyKO0Hy3sYu1uhXhXFad1f49GozYIyUD/9FxO8OR6DK+XGdoqMkv0wIlX21HhCk4Po83m5jB9TqUgaR7SzxsGqzoDzvLIIz/dTky/p5F4RdYrIFha5olTxRAY7HxAMLUigrJtlUC0wzFnJv6BlHjXjJd580R2KBlxWSqVLH24yMyTgR5yqMv0Yy3CsRF5/vfQlJQ9Y1EreUVN8qU3Lgj8fUIgIJioBu+sjT9tzOGYk7/0B4JstJxn0EgrtRPIOlug1j/PrwxYA7poZa44NbPnsR2+/NnDTKdSmPa9/qrQqotYRf2/KWFsKt+daNDhNDxqWuWhxyxo/QcAPhJze6l8yBs98530ENN1sQ9fSTnFwgfwNK660vMBV/4Pss4N48ZjdEhZHxpvPcm/0nV2VxoduC6jGYf2Djbbi6CFwiJgjNc7Sdb33iTob5b44xTlU5cv1098DauFpj8LUi6VwuO/QCtEUXVBNrVp7P1Y5xbuQBv05TklVjGXaRLLYbEgFDmyl5kufSAQ4qpUY9IcF98dy5+1hv7iG5v9pkGOEm51e+2I/oDWEu76Ft78oAyCdvPz1TwYZKix0zYRW+IoeVbatRfGNWjXxpYKddjBm9hwJLt/wwk9CuVHW2x7rIeWiROfxNdrdAJq8hqNTtyKqsYCao1tYUx83NAZhg3FC/PZ6yECQpzMfmtSf6oQf4TB46Xf0dYFTg40Xewm8wOKH9dTcEhhPR8wWukqSOjplliNy1wc8rqRReYzo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFFIbWdQV2hhPYQZdnhir+x2aizoBGDNJLNb6670Atq662tF5MYSFvukyZof?=
 =?us-ascii?Q?ktHgpwEKsxhEGTbJFoNrDvfF7+rXzoywTNwI/i+P4rWbM/OwjEYEA1WjN8jC?=
 =?us-ascii?Q?QXKtd6n7DeImLvXt4Qfah2R4MSYOolDTwDa77eIv8FQweK64wWojqzsr4UFj?=
 =?us-ascii?Q?PuB8N5pxpl2l9jz3NV4/6w86xq6GYcFF+Fl5RasX2kFE3gRMZeUBkZ53UtCW?=
 =?us-ascii?Q?oqIVfdgs34357KvlAfQ8L28CncLU8DaBwpj5+LWW6ghG5Ius5OnlwoOQq558?=
 =?us-ascii?Q?c+n+b7oT1j52IXcksHmJFUtw9lDp6eM9t0f+xuk4wO6BBLiW5N8cEuBDc/WS?=
 =?us-ascii?Q?IEvcgcITqVCoC0EXSDx7tBHg5PpL5T/foHEpWQlVb9soNGnTQYGjdxX2BLwQ?=
 =?us-ascii?Q?8gF61VioJrrInqZERtNWEoS2pm818Ecwqpwg65HbbYQHIonBlSqyGe0PYG4s?=
 =?us-ascii?Q?ZJc5jjLUv6AhC5BTsXYeUJctHb7SYNsKQbb5ZopbA6ZzrUEZql+vTX3ysIrn?=
 =?us-ascii?Q?Oinb2uZHKr39RCZ1lxqq6uuxRkaifUqakiMSZcSs/0bfagejEuV10f+6u7JM?=
 =?us-ascii?Q?5vWziB19MjPBwClko7vgr6jNsRmJfKM8S+2WBcQAH/bzvC/wcBbX2e4qS42f?=
 =?us-ascii?Q?gW+VELTM7GTx6M6wV1Mke3lT1s2DMrft0N6JOpEImkbkQdmsTUPs9XIwuOaQ?=
 =?us-ascii?Q?3JCqdZocNu3WDa4FICriQimKowYNpQx7O/vfbRIRWzoAxB7m70FBTgw4a4S3?=
 =?us-ascii?Q?6iVvtygvuZbuTSJOxedHytTIv2BHYACw3iaPbmc+Px0d5kd7VzoNH5nWUcUZ?=
 =?us-ascii?Q?Z4DmBHcNPdXp9/N/evWv9zTyCCGEelR2Mkt1jJ2KWgJDikgitesCv8VxVOhc?=
 =?us-ascii?Q?8D5wLzUrlA86UGbz5Ytj9/RP0S0/yOC2dv0DZewgA+xU01LZiqBi2GrzO9hF?=
 =?us-ascii?Q?sGfWOLsmLSa3hGL8X9A2Bu9tjxpP2uG9wwB/WF+T8OuennUctEB/9XIMZdPg?=
 =?us-ascii?Q?IH0+6FTj+7kWfSUQ+TEA3tDS929Cg+rnOyt4qApIyq3SS3MQ5lsWVRnzAaqB?=
 =?us-ascii?Q?ltFjFgaG02Y5PQL5jE21owfScP2snDHfDiptNG598bYyaPFKoZ+2IkfdeOO3?=
 =?us-ascii?Q?10D/YdNCQXBpbudgE9ZGwJUS8jBf4UlgcdFEO6wU/cFzJndLLEw17lh4aZTb?=
 =?us-ascii?Q?RqHDC/tZpHQgpDMx60nJf/2u9mJglt27xUjHWnlhPBsGmb7Tw6TbzpGHE1S4?=
 =?us-ascii?Q?ybcQMCujdRVkhnGvuXAx1m4JU7iTx4sPDVs1z4eXCPuMyqI/chhSAewJQwUv?=
 =?us-ascii?Q?OPVrr9ChEpTyc+eI9Hqa8DH4Iz+IALUDtI9LiOMOSCPlprQz32wYGDTTPdjt?=
 =?us-ascii?Q?+O2j852vN5LNFcDE1bUBxa22neawZYxDSkCo0kkKCyvYGe72sd9ROyKgKWKc?=
 =?us-ascii?Q?uu+ilAS5oCpnrGleDuMyZl/U7XvxhffiWQfPKQq8kdeen8Pu2fpR9DvukabD?=
 =?us-ascii?Q?OOxPvEaaDK/ei5ek95x1qU/Q6EOkJxNKW+UFTrIX+P4CWwn2XOCfsLTW3j98?=
 =?us-ascii?Q?iXsJT2+29TidaC2MUC6Ra/BfiF7PcAvROcETfTbhFfwhXxVp7mY782Nay6MJ?=
 =?us-ascii?Q?1phg5oSUw63vVdTKB8j3e4dU4cKFki7tC/mroHxjog9SaMODgt5OroOwdR7t?=
 =?us-ascii?Q?QSfLrw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1181dc66-0401-40dc-af5e-08d9f8b8ab58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:48.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVO6qh4wG7pCGkfrW9833XQNl3AZ6DAxBNubZ6YL70gL9rLMmpyf1FNdg6FiNAt96u999KRt404Ik2kiAyozO9PD/xHucqVz4YeBALJn7QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Demonstrate new API for filter insertion and removal.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
2.31.1


