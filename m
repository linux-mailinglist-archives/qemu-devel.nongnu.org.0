Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E968D406A76
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:05:39 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeLj-0005WU-11
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHd-00037L-Pc; Fri, 10 Sep 2021 07:01:26 -0400
Received: from mail-vi1eur05on2100.outbound.protection.outlook.com
 ([40.107.21.100]:24609 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHa-0004Ln-SE; Fri, 10 Sep 2021 07:01:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDj0M3VedQzTOb3QFgXzt5/+awuyy+TXoR5YDw9nqrCOvvSvHzgQI93sXwnMXLry5wWKvGzZlpC6mxY8t4FMwPuoJwrViNHoDBcmL9D4GYpAXfcI6rCE5jDZxnlEUpGIaer/3F0g8ElfLBNsBa6H0h91iKeoG/D3984PqVezZD2pyMk93Y2b/hHYGizt7+YY9PqFICbDseF6NOOo8zSMSpQBBwn7yZdPdR83NmJ1M8Xw9zzb9mdjm3iq+LGKER1ERVKR01qFJdio6Q9HzXDRJuWdPjdB9C5wFM99yLUNz+Ep8pl2MSL2nEy3NTeiPlA/zxyjjDUx7CWhZ44u31HApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=V6umeBs9Avn2VLb+4agBQX6BpN9niMge1eUkeGy5Wnc=;
 b=kel6rjuqLJxeNMIKt/1ILQr1GF+0gEbOkWBNtn9RDQ9BSH4slEn7YFH+j6Yg7HHUbycZHkyBQciwinLt85ttWHl08U7qt952uenkLQgBNKz5Tk+tiKEAr667uMUNAya1n3j7cV6JMspbLtU/jqBtVQWJPAGoHYocRkCWmAEfUiAR8wtF6mZVukdz8zotK4JStctFCCoNSOC8kmIOzt0Yn3nEKA9swqiimpOnlPKEy9THHPq4U1NnW66ZsyXxTjjG89j5Y4onZAHngm7ycih+bfE9Sl+27+oUy9XawAezLYyAAycHYl1dpDTlhuBSHSZNJ5a2LsqQyzgeVH5fImSP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6umeBs9Avn2VLb+4agBQX6BpN9niMge1eUkeGy5Wnc=;
 b=fj5xp+QoP0Bu6R0YEO4DtIu4qLb3HVuL95ssBoxFuCTW5AthO1UR8IdCLjQVLUS3K3qyQO5mbuSDeKFfWMx9Q3ujIYKAzbiJ2PEWDZXrjMNXMtTrH512Bxfzh3eTX9YAA5cb9QXjkYI0z7pOt4HKSsCDy/+hESTkyKcJV6jMxrQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 11:01:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:01:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 1/2] tests: add migrate-during-backup
Date: Fri, 10 Sep 2021 14:00:59 +0300
Message-Id: <20210910110100.31976-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210910110100.31976-1-vsementsov@virtuozzo.com>
References: <20210910110100.31976-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0354.eurprd05.prod.outlook.com
 (2603:10a6:7:92::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0354.eurprd05.prod.outlook.com (2603:10a6:7:92::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:01:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85530a84-ffa0-4846-883d-08d9744a4f80
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2532C480AC9DA0DAC7671349C1D69@AM5PR0802MB2532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFoSexjicMXMygu9fIOWwS/L9kRXT84cj7STY9K8hLAWiFfAQrEgNAKsotRhYMTTDPZOf476N1m9PHnvDyZrzpoSHzlnMoZr6flJdEcTue7vZEix1RxtHEozLBBJ75cZWmLKrvDLqw3ETA2FA7ObA/qvFXK4DpddsqMSCGnC4RD3xgDxdpcJth442z1MXtgqtasGNiNq7igfj96QkJo47YzprI55of26W8YprpD8cxiRjX9/apgV9kpwi2rQvV8yA3fHyB2NuTRt0uhaUBUBEcG+xT6D6/uwe3RSedCTUv931mqODWSttssKuNCl5YqTjm7ebMRzCVFnU/9mT68E4/XOhXTaquVqNLojINLbR1NWRWmVgFiKEtGCKDBDx8ro/KaN+wHYTcXVuTwKt7OF+Phnt7KonMIexv+zc1+lsOOLNjB+HxHpb8GxqwpNLzlkoh9NAuo0BImBtSfSs49SP/2hny1rCuHV+kJXN160hWVgK/c4BhnPV7KRVLMnw4Cm9ykq2CbrB5u1KroZlKqhI12o9Vt1e6wPKfFapnwMKxE3I2CIHlRy3VCjBWxI4vWrQ8QxBye9pQ304/f/mwAkJT4w2NHRolom9oMHCNcIN2ihwjOgUA1ymboscDsGQMpsSSm2zAHEpFSrpeT+egs7XiRvYV7eZec/HKSa8MEmUVeGJbR6V7BAFAkY3xs7YK9515he3nQS+nkFXKoetnFr22fyc7bvN2cNEWyTZdgYLaed0Mv/CJ77pSiIweSv988zT7A73jJTydy1aSR4wckUZ8jCKKfI/m3Sh0++5NbVTnTw4+glILLp1mWWOjeRqjAN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(83380400001)(186003)(66476007)(52116002)(36756003)(6486002)(4326008)(86362001)(2906002)(316002)(6506007)(8676002)(5660300002)(2616005)(8936002)(66946007)(956004)(66556008)(38100700002)(1076003)(6512007)(26005)(478600001)(6666004)(6916009)(38350700002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ENT/YGysqRLFiYbxAKzEawDcX9a6ydombN7XKDGkk7kyLUAUYNADNqAl/29P?=
 =?us-ascii?Q?s7C/9iwd6QXkOyD4M6+Hnt2RKpBfeOA8UgZrn5hSKRDg9ajn5XGJF/Bp1ziX?=
 =?us-ascii?Q?LbxifGtSRhDWu50DCtnogR2V5pFnZtCmx2CFTxRCllyDyP8Hx3wqykYYNpI6?=
 =?us-ascii?Q?vYhdeWKt+HcnOUwg04yA5///R7CbQ0tYuL65Ywz9bykd3IxXH8P0M7lC9oU2?=
 =?us-ascii?Q?RwsTPJe/Dy5WW+oq3nV9b5pDAxjYH1xuudPw4EBvVjee2gSZXgyXL6mhQiNI?=
 =?us-ascii?Q?D7pTTuAnIh2OS3++bW2w2qyYu032eMDFF0Jqk6BWFI0g4D1RQ6mLnSHRsHSS?=
 =?us-ascii?Q?e6nnk3b+HJolfz6W3XVmN8Z/GXC2iKH5hnwFJnB5+yIUKcUTjVSIDdCNoZct?=
 =?us-ascii?Q?D7PWWRNiNMFLGTkja80leCZa1zuE6GS5TeExbA2BlUhQ/XND6J9sc3xzYzrv?=
 =?us-ascii?Q?HO9TJerV/jrN4oeLHflp9xdgZvYnI3p5U5494zEaMXGpTvahPS4isCRhFy8L?=
 =?us-ascii?Q?0kjV61ii9vDaAKuXiQlR7fHN6lvECaO2CzmP44SjyVDXV9uSKD7b6N/bQV+o?=
 =?us-ascii?Q?8eo3mYwklGpnD3aY5//d0XXZx++BxwHWZ+YpMO2ybxzHQT+aS3XqWmmA4q90?=
 =?us-ascii?Q?P/t+6Iy3hVItEdtfiHfoDL7UKMhcEUrOHPjcN+d5JLrKx0RRUwKUBfSZ8FWQ?=
 =?us-ascii?Q?jyO/aZqU0a+BXqvYsZqFlaw6UMeUIdOE+VObX2HFMidZ0Bh+rYca+xYkVU6a?=
 =?us-ascii?Q?M6hnIfFtysBZaZpoKpU3mGeTSN7Q2ClVBYWZXbmumzhyaYjZijxh038mgzVl?=
 =?us-ascii?Q?6KwMWNxcpd1PJhi8kAk/jI2KbN3DpwXy5ardLq23yreepHTXpRCqEQACKBGO?=
 =?us-ascii?Q?EHdOw81PoNywj2hZ7afQLvR1/rAGUMUL6Qeu1UKH/xq6sp0Ejc2/ykEaFNjZ?=
 =?us-ascii?Q?G5E3UZwnvYGv4U6OZtHadzAppLeyCYOaEkFEGffLNOyYBG2A1fWQZAwiY9Bu?=
 =?us-ascii?Q?wT2U2sZRWVYofaoRPHAbZ2K8yp6yBdwgoXbGZxmIIMidGLADVhEQTmC9fXFP?=
 =?us-ascii?Q?eamq3qUsjy5J3j7N30zA84OWK24qgH/uaUhv6MH/DGbo4gCBKKI9PEgncrl8?=
 =?us-ascii?Q?gO4K76USd3c0xoR6EsXlGbf7zsagYJegbkfAZNwqOcdVg3IVjhtTFtLVy23V?=
 =?us-ascii?Q?K4L+bZyti3XhpcqOVn7HjOVfSyNS558Mo+oI2RsW45CQ+Iqmz/sUxcEwljHR?=
 =?us-ascii?Q?4/4QDEVInEkGvR/WMGEsn9PUV+S9iZOAH1J5I3UOIjBg5z/lwwvHejb2tZNH?=
 =?us-ascii?Q?t0eB0sT1QMYasrKLr2VnEwR5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85530a84-ffa0-4846-883d-08d9744a4f80
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:01:16.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39WyJ+hrQVcYKP8D4nAEkRDSgqcFr76vAb6Rd2nyJCHTQk4XG6LuhKsF2/Vado8XLrpipRlmxqX6Pg9rt/MwaJ54X7qck5j2FrnyNETQLrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532
Received-SPF: pass client-ip=40.107.21.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
 .../qemu-iotests/tests/migrate-during-backup  | 87 +++++++++++++++++++
 .../tests/migrate-during-backup.out           |  5 ++
 2 files changed, 92 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-during-backup
 create mode 100644 tests/qemu-iotests/tests/migrate-during-backup.out

diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
new file mode 100755
index 0000000000..c3b7f1983d
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -0,0 +1,87 @@
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
+        self.vm.events_wait((('MIGRATION', {'data': {'status': 'completed'}}),
+                             ('MIGRATION', {'data': {'status': 'failed'}})))
+
+        result = self.vm.qmp('block-job-set-speed', device='drive0',
+                             speed=0)
+        self.assert_qmp(result, 'return', {})
+        result = self.vm.qmp('job-resume', id='drive0')
+        self.assert_qmp(result, 'return', {})
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


