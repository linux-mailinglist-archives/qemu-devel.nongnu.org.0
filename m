Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D513516AA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:17:18 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS00T-00011F-Bo
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRzyz-0008S7-Jc; Thu, 01 Apr 2021 12:15:46 -0400
Received: from mail-vi1eur05on2124.outbound.protection.outlook.com
 ([40.107.21.124]:20448 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRzyw-0003WC-8D; Thu, 01 Apr 2021 12:15:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKnQNUYm3UV/hpDSsa7OG/Ea38DwI7XYLGZidgQ+b4EMXvjcGdsuhB8nMGcMlrQEVtDbTo8sxTznPEBXATWG7FFb79SYuB6TZ+dmxbmYQ++tZ8Fpchz4DFn4Nvf2sILRCA+SiwHS5gjSl/c5Zve0pnz7H9geabg2JjbyYHX+KyxohvnfjoFWic984RXrJxZALNYaTMgoiyDOpeYW6ORNatbbz4wwAPzbEqmxb/8zAoAjkCYxAnP9T+KP+VZlrHedzGe87+HKH5o6kqQZO+XYsaNOmSSlzK2mqcGm5r+hm0HJm3h6pctTPpI2sd6czuQL9bi5JYwznRUKrnu6kd7/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZLYIo2hvlC4G3vxQ0eXB2p2wEU9LR/77YB0Ycf193U=;
 b=PH5lYHShRw3Ei3nMw2qUt39Pbr3/JHqC0tYubIyBUzh+treyH+vSvTHOflYquBh0+6cswwWyCBUM+hNBxuEQEy3r3tpvC1E+0NGaMV/OvQ8QJjARWfeo5Hq8XvLHLge39d40PHDQ5XC5OwHNWShdK2ko0qu/sI/aFjcorMcX0u4zJmHlNK1xY8z3I5zcfgtPwsfNmfaxJ753/VccBdKzye5MQyMkhIuuYGmEOAPRR4tQhpFyj537BC1uAlrhc02ycoqIMVASeLOKcLqVPXe3d0JCntdn/o0CPyi3guxYyrJqoedWWakApmoIOtdh8NUc/sDywu92NSJgIIjxZjBpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZLYIo2hvlC4G3vxQ0eXB2p2wEU9LR/77YB0Ycf193U=;
 b=QvaNjM/zHptjdh+Dieg5hPysunJE85yAxEfp6lx05QXPgY7Xj0r/DlI6nYJ3NYLQv21w6b85xkT4xFLqEIUAftge0d+F+OCtBKQeuy5h22/WOOirUzBbxX9PetDx4KLlqqNOQkb/IAXJqVIqZuhlv9DfJY0D0anphTK+2TCHCd8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 16:15:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 16:15:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH v2] iotests: add test for removing persistent bitmap from
 backing file
Date: Thu,  1 Apr 2021 19:15:22 +0300
Message-Id: <20210401161522.8001-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.200]
X-ClientProxiedBy: HE1PR0401CA0091.eurprd04.prod.outlook.com
 (2603:10a6:7:54::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.200) by
 HE1PR0401CA0091.eurprd04.prod.outlook.com (2603:10a6:7:54::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 16:15:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9421ff2-f6dd-4477-d71e-08d8f529637b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60084E7925F22B5D131B86BCC17B9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGB8BDsXu8wXiKyNjCwbUsdOtvYpnAE9xwebOFB3DKm3k27xnacSPRoyB144uuC5dS+JyaqZo25wQxJpZk8aCkTHyxHtR2lG4GqNoZpkjCaI8Vz/SG3vVhogtq9PBQOnDP+9HTM+HBQ1oVICExsQ39WvqA7xYSG4gAYwVOVwGP31C1oprw1AE0Q98NtO5uupy+GI+2ymFKjeZy2bAHdeaai+962qQG36+9MiKG++5LSiI6uQVBvMwGD1oIyINntG64wTEAaFrtt9lSa/G6HR+shse/WamMTRFqcauEBA0vVDPSs0KKpazzyAgh1QtOnbFWwzxXSAd9gWTWolf9oo+bi4Mkqdi4X3tqO82kC7NoTAjpEIi6g8njXGZXSJrkAPKknEtw6xrKTT0iZPbjF1sjE+mZaksQkisoWzzqBmpcZOijdYSta2xaepD4YpFa8lzHn6iR7VAK85CmCg1nFVCFLTniIXd2l6yVIP6gRFj4r7mUB2yAmqwEQyt6KK7ZDwbisstewh+VFoesuFwaNSmcQ+GenueJiQ/hbqXYLub5vzrBqjYfMj4qWmTZflLmjabU1r7y4jxjxjKaOQMCicmIJ0R5fBEs95jw5luYtmOttesO4HaJkNE4FqJP81AktN2Hw8l534OhqdRPPLAAeBfcKCrKMJ7GPXAnnwYK8YLmCaBfaTHV10Y4rSTiSy+LmRB23e34XLFqCPDDXCwa9Een1USNC1U0RIs6c81kSc2JavX1otmY6TiA2cue6MzSjKda3sb9Y9RZCuBv90wBA9pY37EbiMa5dW80/huRuxsAw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4326008)(186003)(1076003)(6666004)(26005)(52116002)(6916009)(498600001)(66556008)(66476007)(16526019)(107886003)(956004)(6486002)(6506007)(8676002)(66946007)(6512007)(5660300002)(36756003)(2616005)(69590400012)(86362001)(38100700001)(2906002)(83380400001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e3kM5sW23kxeo9uta9vzEjoF75j4GTguRqqa8R/1fDX3OKHFqyhzqyBLmw4y?=
 =?us-ascii?Q?wfUATySOhKdKuXa0YdCWLWeW0MbMDG4rIW6KWZszGFCoDPgHzeZWrZoldBM8?=
 =?us-ascii?Q?M+CGj9MWHohZDoAHtJzDEYBgvmbLxWGAO71MM4Zw3WtaS5Xg34n+CS0FMpL9?=
 =?us-ascii?Q?QhCFEwXDnhQtefTItU7p8o1zJp1VUDW/iGeyWsRiGFgRsd0QVC3Q3Oyo5zbK?=
 =?us-ascii?Q?kJi/xGHif4QyrPfUl43vKS6uAhXaanmV29IFXdYmMqI1U9dgqQHNi356TB1S?=
 =?us-ascii?Q?SLmDwKaMfmYcccbVgPvzw78lulWPqy9O4xNtss7hMpbfPQMU0IHIZF49e/Rd?=
 =?us-ascii?Q?LGOlQ7VSpSQaOQThU+bErstnmpucfuTr5giUCe2KnptJHWpDiibB571pbu/L?=
 =?us-ascii?Q?D35+7fuh9jkUQeo47YsmVMMoaMxLaCKlB5AU9+BCYjKzJdANiLc9QqPsc4aH?=
 =?us-ascii?Q?hvjp8DCgTYN8w34BDwwLq1Bxet4UqkCwfz4pv1Yl1y1tGvCjm86S7Yqo5lJy?=
 =?us-ascii?Q?t5ZZ8TbvnRV6mvSZCRly/7NXz6OHDrjJquah2wM/dBjrgTgE0UWxeKHDxDmZ?=
 =?us-ascii?Q?R1TjxjA/BvSoA6XAAW03D3WDPuXvO1L0UWBFWjiqXsO2oGMA1lshOUi8u2nn?=
 =?us-ascii?Q?VUFe+200hukKo73YoKG1J/wNKnHhSf4lvrDMYxZwIRpAICd8NKBLDt7D/v0e?=
 =?us-ascii?Q?u+rXGRd7k2pyHsEDz4tsS2W+AtZmqTRc/s8hLnWSimBc2OZZcOtZWJj3+a0X?=
 =?us-ascii?Q?cUeMQi6kbR8j0gEg7Gytd20YK9D6oHeCilBgDB1t5e7wgrabezPZOcU/BCIJ?=
 =?us-ascii?Q?k9jJY7POOt2tRowQZb/lTwNJwlX+OVexeP6tSfvwTTDQ4E3W0LYCqVTPZRMl?=
 =?us-ascii?Q?4gnn414A4D5soZE5rifWmevEF3Vix+LfRRXF695jtVS2TJwpnS1MTV8Wo4oO?=
 =?us-ascii?Q?Du+ktOg7xTRqIvMNXUlheikCQFhcDJPDPv99i7SsH3wXaZIsRqbu2oNdq7+9?=
 =?us-ascii?Q?5EQVtUEH7ql68gbdrTdMdJGGwsKbBrJbIg+7/n/Og675TTTCPoBMCCr45MLX?=
 =?us-ascii?Q?uQDkY0B/+bwT/jvOOWm0KccpWsCkWw/buKeON8AozGe4BesuZ3y6KgyZ2t9r?=
 =?us-ascii?Q?KqoPfxPD7YhPm0Rmr+Ts07cNuxWej8zu6/9mstNS+9rCLaFJVb8IHWRG5MYp?=
 =?us-ascii?Q?7BZQ5/iKzm48PB9nYUTvZP/hn9DZJFJJcDYYU3B3UBbM52fUOa82UeOm6EsJ?=
 =?us-ascii?Q?uIxBvU3AR+a1xmeT24GRiiqTLXq+ZJj1YQvNPRps9+x/MhEOUPoiO0An+A6G?=
 =?us-ascii?Q?FP4vd/M5lnR0CtnN136kbd1l?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9421ff2-f6dd-4477-d71e-08d8f529637b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 16:15:38.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjHuyQ69v1XUpsAeaQb+T+vtWj6O4qah5LYoB+zbpB+OGkcgHqc27SfixTqE1RQDmnCQYMLG79LqjaBbtflXUB7cLkaw+gL0B/pKCLXzD7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.21.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v2: [by Max's review]
 - more imports for convenience
 - assert that qemu_img_create and qemu_img succeeds
 - add -F argument to qemu_img_create
 - fix error message

 .../tests/remove-bitmap-from-backing          | 69 +++++++++++++++++++
 .../tests/remove-bitmap-from-backing.out      |  6 ++
 2 files changed, 75 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
 create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out

diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
new file mode 100755
index 0000000000..0ea4c36507
--- /dev/null
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -0,0 +1,69 @@
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
+from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+top, base = iotests.file_path('top', 'base')
+size = '1M'
+
+assert qemu_img_create('-f', iotests.imgfmt, base, size) == 0
+assert qemu_img_create('-f', iotests.imgfmt, '-b', base,
+                       '-F', iotests.imgfmt, top, size) == 0
+
+assert qemu_img('bitmap', '--add', base, 'bitmap0') == 0
+# Just assert that our method of checking bitmaps in the image works.
+assert 'bitmaps' in qemu_img_pipe('info', base)
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
+if 'bitmaps' in qemu_img_pipe('info', base):
+    log('ERROR: Bitmap is still in the base image')
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


