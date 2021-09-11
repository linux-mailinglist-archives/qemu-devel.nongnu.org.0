Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F679407664
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 14:07:50 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP1nR-0004fn-8l
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 08:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gh-0006a1-DE; Sat, 11 Sep 2021 08:00:51 -0400
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:45662 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gf-0000VH-Hd; Sat, 11 Sep 2021 08:00:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnXfgbwRG44pbs06v1c5kNbMnCFtQXAEp+P7bf4ElbBDPSOJOYMpCPPxqF2ToC8THR0Fwt88NNdHy8nypjOCyd3Enz0zCkflrvDi2ImE6C7IDNABdNEMUCutlMYrsL7xAU3gwbNvBiKmNCOBsYtKEQO7B4HinbKNRCsZMyu1FeDPZshVTkudBhpRAjqK9AmNiFzfcLpr3D6FBqCtlcxhggpQGjNn7gX5RmdFaZoo+QiBlMRagTxjQQbMH4cIankwpJwXUzzX60M9xG3/qg120beqCpU6sbp1exUCBpDsfNJy0DjaGsRDx+K2EQl5GmB9+PqXjfIlSvTc81A+wEjr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DxqPhr9w4tWbIrB+wmh0cSPL+nDFz+LoVrf1NP2j/E=;
 b=cQ0taxdmVJLu1WbyIwrnU3C2XtTgKTF1r3oaYYBNei5fg+5+FreZgts4Re1UhnoQr5s43PIY1LAXgpJenOyY0BYZvkoR16/IITM0ZtCvNDzsiNeWmd0W6FpJvmPAHlZgTzpUTLWJ7eeQoRec4a+HoalPXCL2efnneT3U499bFB61iB7spsn1FPhqHik7JaCkKhmrL/QxcJO3UWh9zfeRZ9jZDs3M4UcVLtKNZAv5itC94gWC0rBcxocJT4yXupAyduOebc9T5MqbtzejK9OmeWo2KRGiXgOnTpQPp2e/cmaGzSRQbc0y9uUdCmOPyNaiFugrllhfwWgjkmCgnn6ULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DxqPhr9w4tWbIrB+wmh0cSPL+nDFz+LoVrf1NP2j/E=;
 b=VzbqroSi46l80ercJqaMcCWVYMFoH1BhuimPpjdavJZEAMYuz/P6yl1Xw4SL6qa5dcOf2fUJDB6p5eZI23GNrFaxmFQZaHhwoQ4+CB5iMPMehVxdR7Gm5ZnhxAF5zD2Q57AY85fQLK0WijqaFVfyQr8rJlM0ZdDuJoWHoDk2NCY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 11 Sep
 2021 12:00:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.018; Sat, 11 Sep 2021
 12:00:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v2 1/2] tests: add migrate-during-backup
Date: Sat, 11 Sep 2021 15:00:26 +0300
Message-Id: <20210911120027.8063-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210911120027.8063-1-vsementsov@virtuozzo.com>
References: <20210911120027.8063-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Sat, 11 Sep 2021 12:00:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbea637d-2295-45b0-ff5d-08d9751bc71e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080CD088160BECE5C315DAEC1D79@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuKSJB4T3Nh+wbZVKePoPrmE7e1kCUpshax88XWCUYuCaO0Ge8vJpWQ1xsru7FVjLG467MWJ7Oj8bROu4bXem7qncxoiQtSEuuWbAvN70jb59DuuaLgsAtY36t0PWPpq0pGkiyiBRHNRuFR5MHX89/cYMMBeAm6kEo/oZNwBJGnle/S+IZjxIBgEkZ3SP2rZS7trsFVKd0Y+vAPQHVWrlcnC+21DYdzwu5n4ntWOqoMjzi4NLR1irVy2h2XPFN2m8+EA2f5pnzqn/TA8ZxcL9+AlBhy5hHj5xzCrzBmdPmW3C7UVTPcIp/2N0HyAO5aDC2FxxItgk3dArmHrUCNgDT5yRi4NEUJiIR9tX9KToG6UPdg28TYeV1BQuqABkjHTH3WI5PeZo1nO+jiRPGZpYjlesGQty832+NPI4O1NdBMiU6QmUMsRcGfMlYDCLSmeTU+Jaf+9QNkbuc9Ol3V65yq7aNxCcmKPgTHV5Srl1xm3z3Z48JPyeaKbvkLLAgpwH0okReEp6mjsV/sZndW/gZtwIBRBaV2+BQtRMFUyAiafRH5Dqz8mHbxURfMlHqJDUCDr6vIbGFW+tr8fbPmIj0XUH4AWv4DMvgHLFMAkjPyL9evpV+VRoZHIOMatlX82kOijM1laJz8ey/i4QWzEm9hrK4osvTvQs9n77wQxH+r+WF45iIIh/haY7uKULHkwJscNb70elLUM77X9sGt7qmVKz7KSMfK79qTLHr37KsNDsgjKLDckLlQ4hPQM1Mq3DSfx5EAKViyplFvdbtqbN4UNsT2+vYNjGIGvNVVMMDwzIUAIoa8ifNtjQR05j57+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(6506007)(38350700002)(4326008)(6666004)(478600001)(6512007)(1076003)(83380400001)(2906002)(6916009)(66556008)(38100700002)(8676002)(316002)(107886003)(66946007)(2616005)(6486002)(36756003)(86362001)(52116002)(66476007)(8936002)(186003)(5660300002)(956004)(26005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zmiSZ6VnUYVDG5QkMzL+M/mIHz8eNfW1A68Hb3PE0h1SX2ME0XYjIhoGFpq0?=
 =?us-ascii?Q?gQBo0JTDbZXxsRNwQZHqqSolo1UbdChrgdCaEybOjZlP32Q/+b8S7xOXYdY+?=
 =?us-ascii?Q?1AbYhrqckn+kuqIAt3SBSunCPKgatN7p1kn+JIS4yQ7N438fT41zJ4HhnKnX?=
 =?us-ascii?Q?J+m+6UFsw3lFjrsgrJPKw6HLNF6jZSS1blDZXYfw7x0ak0FCS6IYeAc/Fnwh?=
 =?us-ascii?Q?x5xzQ8FFb5zGKLKGPbj+W8EQb1m1Sg1gJl3zlsEAlPZ4Z0jf0zAGBG/WDwMB?=
 =?us-ascii?Q?mO9jIoo7yrrbIeenJosxenZTV9bWjxe59cKplmypcV1ttw4lbexGf9R541Cl?=
 =?us-ascii?Q?zc1+ro0FUbEtFm9pQkh6Jz5WDvdYae+BESq2BKxMtK5WpFaaE8KT0LzcTIjM?=
 =?us-ascii?Q?gaw14To0ki5VnJRk0l1Kr8lD2z8b5jnzgXen7Eb62o0kQRaQJAnH5Xq/R/eZ?=
 =?us-ascii?Q?1A2AC9/uL1cb9oCTh2Lf5dC6LCBjAPfmOOaBhLFo3Bv622X72kyDiBaimLWE?=
 =?us-ascii?Q?7QlVuiVBJpuURNh6HHKfJ5l7XL4JH8MDlpe3e6adkus35+kUP6IrYSlAaBPL?=
 =?us-ascii?Q?Mt1gLitRebgZoj8DGO4+RlqqAkewF78u6QB13XwJWTCwcoIAjaDT0dCboTX/?=
 =?us-ascii?Q?heNeBejOgl4wcmJn2oj//+KjrwvtdKI7OWcqAxvWyS0reVzl7XiwVsAfleFe?=
 =?us-ascii?Q?6yunukT1NylEPQV2iyl9hoqOro57Mylkg+DoMOsu6TJk3Xb/qg/mgeCXNgO4?=
 =?us-ascii?Q?ST9VbdTcIPXL/r8Y71jC5DLtNS5nfN+5Fi3FUQMqTqSmpndZovUaolvJtTJf?=
 =?us-ascii?Q?kSLLl6oSzhU2L1NKRWx1zOLDYPrNWy6nxi9Jo6QH4/89ijiS4g5D1UcxbJtI?=
 =?us-ascii?Q?fer6c6yhgM44xOtRUEH1/dvmCkTcfkDvqeyu4FnczigINohHUmOXyXuWCpO+?=
 =?us-ascii?Q?z3rz+DQylMAL1V6a3tBHzEX2rJBnay24QeRJW/rTnFzAZKVjFzfOXWOoM6kv?=
 =?us-ascii?Q?z+rxqIrf3OYYBny1dHSnG+oOHMcZ9HD5lYxEfoZySN1yaPyWX4OWPxBwJBkV?=
 =?us-ascii?Q?sZcQ7vW4W1Uh066/zYcXGuv6DsJarFiO3P0AmgcpmCTmZ7sdYPhYsXpE5tHy?=
 =?us-ascii?Q?2hFxOlWyAu2KzgDSiazpwqaLf1rFXwqlQf4louq7VN+BH9ekGJ7iiLb2Xo2O?=
 =?us-ascii?Q?FVDLhysn/fkpzB1AVB0UNGUGG/GQc65Hf+g8ZPos/jw8qYkaS/ej9/U/uYO8?=
 =?us-ascii?Q?FKK/BaZBSPActz4ozqmH+e0lzmkH3QBdlT3rnSEddH63vK/U92aj8w2ZSJEg?=
 =?us-ascii?Q?Nmg/Gd6TB3TFOneRAwiWxGxY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbea637d-2295-45b0-ff5d-08d9751bc71e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2021 12:00:41.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izmbCLHTqr5vBz07hsg7Mk3ILfXxd8mD4NcfbESysPG6l1QhsxiNQRlwOlmDWoR7ELHW4BYeSepmsj6G/OjTuyvsGtmZflMSAsWSe7cGrGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Add a simple test which tries to run migration during backup.
bdrv_inactivate_all() should fail. But due to bug (see next commit with
fix) it doesn't, nodes are inactivated and continued backup crashes
on assertion "assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
bdrv_co_write_req_prepare().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../qemu-iotests/tests/migrate-during-backup  | 97 +++++++++++++++++++
 .../tests/migrate-during-backup.out           |  5 +
 2 files changed, 102 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
new file mode 100755
index 0000000000..1046904c5a
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -0,0 +1,97 @@
+#!/usr/bin/env python3
+# group: migration disabled
+#
+# Copyright (c) 2021 Virtuozzo International GmbH
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
+from iotests import qemu_img_create, qemu_io
+
+
+disk_a = os.path.join(iotests.test_dir, 'disk_a')
+disk_b = os.path.join(iotests.test_dir, 'disk_b')
+size = '1M'
+mig_file = os.path.join(iotests.test_dir, 'mig_file')
+mig_cmd = 'exec: cat > ' + mig_file
+
+
+class TestMigrateDuringBackup(iotests.QMPTestCase):
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk_a)
+        os.remove(disk_b)
+        os.remove(mig_file)
+
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, size)
+        qemu_img_create('-f', iotests.imgfmt, disk_b, size)
+        qemu_io('-c', f'write 0 {size}', disk_a)
+
+        self.vm = iotests.VM().add_drive(disk_a)
+        self.vm.launch()
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'target',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': disk_b
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+    def test_migrate(self):
+        result = self.vm.qmp('blockdev-backup', device='drive0',
+                             target='target', sync='full',
+                             speed=1, x_perf={
+                                 'max-workers': 1,
+                                 'max-chunk': 64 * 1024
+                             })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('job-pause', id='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('migrate-set-capabilities',
+                             capabilities=[{'capability': 'events',
+                                            'state': True}])
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
+
+        e = self.vm.events_wait((('MIGRATION',
+                                  {'data': {'status': 'completed'}}),
+                                 ('MIGRATION',
+                                  {'data': {'status': 'failed'}})))
+
+        # Don't assert that e is 'failed' now: this way we'll miss
+        # possible crash when backup continues :)
+
+        result = self.vm.qmp('block-job-set-speed', device='drive0',
+                             speed=0)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('job-resume', id='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        # For future: if something changes so that both migration
+        # and backup pass, let's not miss that moment, as it may
+        # be a bug as well as improvement.
+        self.assert_qmp(e, 'data/status', 'failed')
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/migrate-during-backup.out b/tests/qemu-iotests/tests/migrate-during-backup.out
new file mode 100644
index 0000000000..ae1213e6f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-during-backup.out
@@ -0,0 +1,5 @@
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.29.2


