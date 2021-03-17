Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B433F549
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:17:39 +0100 (CET)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYra-00039t-T0
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMYd3-0002n3-JN; Wed, 17 Mar 2021 12:02:38 -0400
Received: from mail-eopbgr60095.outbound.protection.outlook.com
 ([40.107.6.95]:15876 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMYcv-0005v1-Go; Wed, 17 Mar 2021 12:02:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxHtxrQe5mPfr6K/+96tYFC/c4rf5mMQnNys0XWbBq4/Odf+V/MJhlJA/OgGUkdt9MStLE+BQp20te71+CRshH2NdWIaQcBEp1k9wXcRymvGfpDLopbNu7ZRvOhdKZd9q+SMtZ2L05RysiGnfSSj/HhmnwUypWJENdHKnvzG+OSH4Nja77ybLV+SDRRszhYJcppQmloz5Pp6ihmDdSDHPwavH/SJn5tHxsi80B6Z1GLegpxmqwVG3fa9w7/te3UsRwvXbCiSPG4WZpOSsUxMxyKVg0nruggFmBwjBpdnV33pQHfiRzrnbpETmKNUwmuyQVcOzVxuJglcIdBqR0llRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o042FA9i9M8WmuRb+ZkgErzVeCF304WY1vs/d1Whe/Q=;
 b=mXtdGI4YEkZeV7+FGCLhvONKNHF+ll3ycH8LLrL17Nznla90T8xdvTYUUQVCNryx1kqMYYUTFvuybP/r3/lvxXD2BonFgklX66ppeYzANqYzTyH0UPP2wp0mOhwJz/Rj8kNGlAF67EciJQKdBTFbliaP01SP3/GM0FhZ9VllBteyzhI8PtxM33JiC3GGdbDl1iZzG9s+Dp17FdR0OkfJwZNaLnomgQWOCyRuUn84oumM5+T8q9oprLpICZl6UkBP7dnwKqU1ttag+VKSbfZc2++U6VNQ3WhfV+YuuTrGKhuiMpofOttVMg4tk+EpPpRdlFcPNBewb3gcNpLx1SKrbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o042FA9i9M8WmuRb+ZkgErzVeCF304WY1vs/d1Whe/Q=;
 b=TSmbBZlqhWLCvanVswfSq78S+hERGgLwtaJiNWobZjaSsL964brZyMsxydpnsMfY+sxt0Y5xiRaHiN/8d9djMXesApsBKnYbyNX/Bt4g+RfOSsr5I+/X802KzE9F9uDe5LmUnMkcRnbwO8IgrKT6o9u/QyXWOuiJV36EIYTvDBk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 16:02:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 16:02:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH] iotests: add test for removing persistent bitmap from backing
 file
Date: Wed, 17 Mar 2021 19:02:07 +0300
Message-Id: <20210317160207.626468-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0292.eurprd05.prod.outlook.com
 (2603:10a6:7:93::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0292.eurprd05.prod.outlook.com (2603:10a6:7:93::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 16:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d0476ba-d009-4d2b-e57f-08d8e95e0ed2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB66319E7FF1F830C3B08356B0C16A9@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6+jIE6ygITf/fviyqCQ6uzOWM3XwHTj4HtRVjyYy6uT24nXbtClFBEha9mmKGQuKPorip6HYYvZ2CkmgmNdMGj7uIJW6r4/yWxTZn4K9lET894vF473cH/1S6vNX9yxhDF6ubJVmgHvw31gMP7esben7vqejn+ehV9xB1rYUxoeZqmCSD9s/yRUK0knllN5daZ2sMsKabE3zfP+kbMis8jJpSJrECUt5BKpek7lO8B105nha9Ulg3fFT/oDlgR+E4DMMnxs9a2MZaJV/kWIZRmLDHz2i39NrJGUbOdzL0OGwsGocom7z36QGEeoz+/guhBiqC03huluuez9kbpZvUkDcLcQQvGpo9MuCYTufY99iy+j1IjMxJSNGMIdinf+fB6/F1N+5PtJP6GT/5OEmd+hRwPvFOlJ7cWVVleaW15QrkqK0mK88QSumBNHiwTBJCmx9NT5nbi0RzK9qJGFXU/TdtQQCSnuyYJypewNNOSnxbIDuVzbPL0vfNon8Sc0H+A33RoB2M1NKDPh+SMbWR+Ro886nwD51KJlAwmwxKLw00r4gSpxRuDR1uK8A1Gjym24hGtuWdoLNmVyZdShxN9IKqGjC+6vQAndBASPdazBrLlk/OG9P329um67UTOkeD09U0WukoCHt82zxXsWf0yVvkeJKGZYBdgxgOXHmEgHGi9B51bmsNDG90dyey0+PUyXACbuWJQJ5x+rK3bUtaUiTojTlXGG4txd1YhLqk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39850400004)(376002)(346002)(2616005)(69590400012)(4326008)(26005)(6506007)(6916009)(16526019)(83380400001)(86362001)(956004)(1076003)(66476007)(6486002)(8676002)(478600001)(8936002)(66946007)(316002)(5660300002)(66556008)(6512007)(186003)(107886003)(36756003)(2906002)(6666004)(52116002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jUrBApNro/JIyxC8NV2sjnSkVvw3hVw+K+u5kFpRwAf/tL6INaPAM3COGF/N?=
 =?us-ascii?Q?MZc/uMnpCr+UVV6Jo7qsEaOnmQkiMFhIPLTmPc78Jjeuy5rFMXkIUet2kfgV?=
 =?us-ascii?Q?fpOWo4Hbv93Mv1DBCO1zLM4DsSglIjd4+OF6aff/zzZ0dNzRGbK3NJwZ4SA9?=
 =?us-ascii?Q?3ljJ9HyAxyjWOBEb8FHeTH6GfwXncMBGip/7f0gYuiazUL81AB/gdaULFXHA?=
 =?us-ascii?Q?ir3tRjgpkXl0GI7HmNNNQWq8vZHdRPzDlns5hTwfp2FpxrFsPv62id7jZkBB?=
 =?us-ascii?Q?27djlXrSj2gYYsV0yH3aBJNNq6s8Ui6OS7o/25bMx4kKy3xMYZy4gUEd1fwx?=
 =?us-ascii?Q?TCBd86c5CIgO6pXoXugTdnIfU3zKBy70X29iLzFphH9zLtBawRihCfa8qNd8?=
 =?us-ascii?Q?SvdYz1Tg3/zP9vsRM1QkdB5VHZ7k5YfJ22KeOVcoYUL7QI3pvrGny17btQwE?=
 =?us-ascii?Q?lXnO/Kb54jJlWGihpg0/m0YxdCEEOr0XVkIUdfCiCUXeSJjVqobxmik5IZh4?=
 =?us-ascii?Q?XAwlGWtSwjHcTFoyw3GMxxAkBVGrTncm1cXXWjlrK0X3NhlLJK0e6q3gGc3E?=
 =?us-ascii?Q?/iQ3Krzu4r2wbXeq71kPZr++7jzx09yXd6O1XOvfJRbMPMOAqv4G/QEgjzkq?=
 =?us-ascii?Q?rGK8Yi8iFjnjqNu6ufWiNbaDG9hu/3t70+euYDVQUozGfBOzqLkGqEU0Mc7Y?=
 =?us-ascii?Q?XJPrSu1wXrLCQK0mdf1XqbxUT5xjCtnOa27p354HrUbLSTu+fZvn+k1CYd0O?=
 =?us-ascii?Q?ku6tLwAfCa5VuHf9tNeKcHzjRLJdfr0Mff6nmyx1nvacdzNrBRBhHtjQ+mZJ?=
 =?us-ascii?Q?23Pq34aBKv/4wWZYlMzg+iE7218n8xX+DzB6tHuz8F8z0oIKHkH7ed0/63bd?=
 =?us-ascii?Q?MzWt/A9lrKJ61PMV8J8UvHViFIDgNoiUQ3Nhfv3nRBlCoo8s2sLsg/6Q2a9y?=
 =?us-ascii?Q?d08XQxISYjEEeRLr0iBY7WltfCu0pnV4R1hPwFmaO+GDzvW7w7I3et83nXdt?=
 =?us-ascii?Q?eMIX+dgZizCHstKYZdo6F0+7cFQh5rzzAgsmtFeGuHva613D6pt477bU87O7?=
 =?us-ascii?Q?7LSm9+R/TPGqVcVXnZvcOxVX0kaoqA7w35fbuKVpTuqzJ8jdDBAO5vj5RWpQ?=
 =?us-ascii?Q?4UICTmWBqi8BE3CS7GBN6r/l5hlMtFKPblg1zyC0SOqgvecXBa6Xm64xvfMD?=
 =?us-ascii?Q?SEWm8LDIeeSs7U5sP4EhYFg2VXE66+6AT0mNDVelwzU16BYDeJPYrUtG5u7q?=
 =?us-ascii?Q?K0FTPaZ5jdBtkNQ8rjZM4rpvBZDpuhbCUR5c7y0z+thmTAhakp2zbDE8YV4M?=
 =?us-ascii?Q?cFVPAnfPIvNDinhaHj1qVCaz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0476ba-d009-4d2b-e57f-08d8e95e0ed2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 16:02:26.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /x4v+KIgtAHJK/5RhHhlmR0f3+oBynCG5HROF5eSnWU2YYrM7LDL+Cqwo4mQhCCsjD2GjtUPuXQgPY0PWjcVIsGB1y9RijIqGZU0d8ZN+Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.6.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just demonstrate one of x-blockdev-reopen usecases. We can't simply
remove persistent bitmap from RO node (for example from backing file),
as we need to remove it from the image too. So, we should reopen the
node first.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/remove-bitmap-from-backing          | 68 +++++++++++++++++++
 .../tests/remove-bitmap-from-backing.out      |  6 ++
 2 files changed, 74 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
 create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out

diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
new file mode 100755
index 0000000000..121860d035
--- /dev/null
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -0,0 +1,68 @@
+#!/usr/bin/env python3
+#
+# Test removing persistent bitmap from backing
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
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
+from iotests import log, qemu_img_create
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+top, base = iotests.file_path('top', 'base')
+size = '1M'
+
+qemu_img_create('-f', iotests.imgfmt, base, size)
+qemu_img_create('-f', iotests.imgfmt, '-b', base, top, size)
+
+iotests.qemu_img('bitmap', '--add', base ,'bitmap0')
+# Just assert that our method of checking bitmaps in the image works.
+assert 'bitmaps' in iotests.qemu_img_pipe('info', base)
+
+vm = iotests.VM().add_drive(top, 'backing.node-name=base')
+vm.launch()
+
+log('Trying to remove persistent bitmap from r-o base node, should fail:')
+vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
+
+new_base_opts = {
+    'node-name': 'base',
+    'driver': 'qcow2',
+    'file': {
+        'driver': 'file',
+        'filename':  base
+    },
+    'read-only': False
+}
+
+# Don't want to bother with filtering qmp_log for reopen command
+result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+if result != {'return': {}}:
+    log('Failed to reopen: ' + str(result))
+
+log('Remove persistent bitmap from base node reopened to RW:')
+vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
+
+new_base_opts['read-only'] = True
+result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+if result != {'return': {}}:
+    log('Failed to reopen: ' + str(result))
+
+vm.shutdown()
+
+if 'bitmaps' in iotests.qemu_img_pipe('info', base):
+    "Hmm, bitmap is still in the base image. That's wrong"
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing.out b/tests/qemu-iotests/tests/remove-bitmap-from-backing.out
new file mode 100644
index 0000000000..c28af82c75
--- /dev/null
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing.out
@@ -0,0 +1,6 @@
+Trying to remove persistent bitmap from r-o base node, should fail:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "bitmap0", "node": "base"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap0' is readonly and cannot be modified"}}
+Remove persistent bitmap from base node reopened to RW:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "bitmap0", "node": "base"}}
+{"return": {}}
-- 
2.29.2


