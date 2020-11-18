Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E12B83B1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:19:40 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS3P-0007UO-Io
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpW-0004ke-He; Wed, 18 Nov 2020 13:05:23 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpK-0008Rp-QR; Wed, 18 Nov 2020 13:05:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYq5FmzP25cMio1q01V08fNB0/XYXlu/5YNiIuD5agmX0XubQixU+v/Qiz21zDu3Fe0JzLjnREplqdVbs0hhbZssi7YhCqFGiyf7iYiN8c3H1a3gVx5nGTmnl4rBo7Wlt4BUHzNsdSdY8Q2jq/YPSua8412Xn+iS/IrBLPcQvusJAPZwmFXSH6GNoPFGL5t0svVbVxBWqPNpF49XQ7sa1bj8tnOZW6LDgZSXIlLNCUmy7OV0XG7T9wKcH9+mAcM5ShxRhZ76L7A/D8OcVgb1bxWcOtdeImGiH998P8J1HkkU5dGzFn+ANTmDspN7jUXnmCi5hb/0U1EmFGnj0X+tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myxHsX+SpXCtoHU4M9bq7h9RTSwhY8RziHIURbEsyrs=;
 b=GgbPe7JppqMSNm5DVa3lMzmzYw0KGdLBjTag8/tzx+5MGmwNcHRrRnWlIoWemz2D8pfNqqBHcN/FNBcHgQxpKv5oAljZDWzofWh1HSd6h7VkJZxHKw2IokZLloPDt3rPGLBQl6jrupd2h3sQjalJdP21XEnUp1W2aNA34RqOJ0/cNvNspiohfPSxxKPC4pVDRLhzOed8+lJrntPN7YiSSp5/oeFglugGM6/+ent9WB80zMRHIdMf9jp+ipNiJVlOkYtyrP6okSjO+o0EPhibyuh3EjglX17O0pxl+3LjNoawD4aNPAPnv9EcFzjlFcgAT0L06qIUMGKl36SMPyT92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myxHsX+SpXCtoHU4M9bq7h9RTSwhY8RziHIURbEsyrs=;
 b=jOTkhsnWrzHdYusvS4Komk91CLb9OpnCAhfuZCSdITseQF1QjwhQVHbdQF6wtliw+1VHVS27y0kaoQ1e78S3irUuyVI1yoPJMWxlW9LjmXql88n4swK/IphfXyiJxPKKNJiIbnMsUPoenPta6Ec1/MLS8F5WcnXWSwjNywaZpSs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 07/11] iotests/264: move to python unittest
Date: Wed, 18 Nov 2020 21:04:29 +0300
Message-Id: <20201118180433.11931-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0d2be1a-da83-471f-3df4-08d88bec7261
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59128CDBC6C73CF7529224FFC1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roe+46w5Va7/VIjVnYvADET/HF7VWZNlrqCjvzDLJJoiSh/fe4AsdlpwGOC6DzNxxwlZk4XSSQytCyhWuWaOevuFyVEn6t+LwUs5HoketCSCgWyglVox8M92Hoy4oxw6KP+k91mgAegRCMEp5GkUtxVChdsoXPGpbV2Kqkf/FEXA5BzLliK24SQpl3EFELDwVSHqTGQgI+wQc1pNJkGPfsfotWV7CK9CvQJoh7bDZdjq4dsnsrBKFL/uMYcnf/22Tyw7JeCTk83Vyj2C7qv+5dPJMPahskvDbaiUqwcyvN4fEtwhtx2ZZ9jR9LhMr6PqEyVx34yh+c6rkKlWoX3LYoO2DH/ZHVx3mI3W/xmcTsr+jLheykSh+l8A+yf0L+a7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 9Z05vc5TLUXLy0aTuKCIMNIknC0TlYTuVjnDRNHd6/JOTtT44Dj8L3rb8YfQ3eJJD/Pa605aY8PgEDqxYfayNbqICLR6sdwCeEmNsePoN93CSVjXdU+rUcCsFzWnqa6Af06Wqj3KXv/bm2Comw05Ysv7Cbw1fV1OB8/DHOBD1ma38e/R1s7iGjoTUniKz56jZALpfcGA9Sp1zQU8T6fmMZkF0+2xbnP5d28+3Omkb/2hmHbkosyDy8JP8Pkj4QYFv1kVdnzWQqY50v0ULhSdrJbwu0yqIg5l0P3kTyfVJm/aczus8R7gyaOGt9dFNA/xs++aqvrRf8NBg3c02QXN/4YOru89SoPHz7xlYL66pRWHPzERZnqFY/3sF1/Htzhdd0sMonqNKMG357w4b1jGOWKe9UW7ZBdDDsAUVyEvh4BkZrL1LNz5X4ns1Hg/J37caiVf1vcmkQg2QgeIwvUCr4HgFYB/kBtVN8kTBwjZN3cTd3D1gVPrKHSHTycI2SUNNeynPiOa6mtb551sMl32H5C1YAT7v6W+vWJF7AA29LIACPm7iCMLUHj/ud91K0yYRCgZNswnRlBQ+Vvythx3q3yiJOTDaj7ui8rq5MFGB9GL+L8VbC+nZjNK1OdmxI/BjopVvITq1Wz2lgLQEK07AQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d2be1a-da83-471f-3df4-08d88bec7261
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:52.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fXYBt3rc3BsZ8eyVIrjIkFeLCKpzzvEJV5botLrYgAdplSGiHb0Zm4ZFeu21PuE6LLXtgoZpg4RDW6vHWYBaRbHPFTxMZAM1jx8vBViB6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

We are going to add more test cases, so use the library supporting test
cases.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/264     | 93 ++++++++++++++++++++++----------------
 tests/qemu-iotests/264.out | 20 ++------
 2 files changed, 58 insertions(+), 55 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 0e8b213657..8c61628921 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -19,13 +19,10 @@
 #
 
 import time
+import os
 
 import iotests
-from iotests import qemu_img_create, file_path, qemu_nbd_popen, log
-
-iotests.script_initialize(
-    supported_fmts=['qcow2'],
-)
+from iotests import qemu_img_create, file_path, qemu_nbd_popen
 
 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
@@ -33,46 +30,62 @@ size = 5 * 1024 * 1024
 wait_limit = 3.0
 wait_step = 0.2
 
-qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
-qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
 
-with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
-    vm = iotests.VM().add_drive(disk_a)
-    vm.launch()
-    vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
+class TestNbdReconnect(iotests.QMPTestCase):
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
+        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
+        self.vm = iotests.VM().add_drive(disk_a)
+        self.vm.launch()
+        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(disk_a)
+        os.remove(disk_b)
+
+    def test(self):
+        with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
+            result = self.vm.qmp('blockdev-add',
+                                 **{'node_name': 'backup0',
+                                    'driver': 'raw',
+                                    'file': {'driver': 'nbd',
+                                             'server': {'type': 'unix',
+                                                        'path': nbd_sock},
+                                             'reconnect-delay': 10}})
+            self.assert_qmp(result, 'return', {})
+            result = self.vm.qmp('blockdev-backup', device='drive0',
+                                 sync='full', target='backup0',
+                                 speed=(1 * 1024 * 1024))
+            self.assert_qmp(result, 'return', {})
+
+            # Wait for some progress
+            t = 0.0
+            while t < wait_limit:
+                jobs = self.vm.qmp('query-block-jobs')['return']
+                if jobs and jobs[0]['offset'] > 0:
+                    break
+                time.sleep(wait_step)
+                t += wait_step
 
-    vm.qmp_log('blockdev-add', filters=[iotests.filter_qmp_testfiles],
-               **{'node_name': 'backup0',
-                  'driver': 'raw',
-                  'file': {'driver': 'nbd',
-                           'server': {'type': 'unix', 'path': nbd_sock},
-                           'reconnect-delay': 10}})
-    vm.qmp_log('blockdev-backup', device='drive0', sync='full',
-               target='backup0', speed=(1 * 1024 * 1024))
+            self.assertTrue(jobs and jobs[0]['offset'] > 0)  # job started
 
-    # Wait for some progress
-    t = 0.0
-    while t < wait_limit:
-        jobs = vm.qmp('query-block-jobs')['return']
-        if jobs and jobs[0]['offset'] > 0:
-            break
-        time.sleep(wait_step)
-        t += wait_step
+        jobs = self.vm.qmp('query-block-jobs')['return']
+        # Check that job is still in progress
+        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
 
-    if jobs and jobs[0]['offset'] > 0:
-        log('Backup job is started')
+        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
+        self.assert_qmp(result, 'return', {})
 
-jobs = vm.qmp('query-block-jobs')['return']
-if jobs and jobs[0]['offset'] < jobs[0]['len']:
-    log('Backup job is still in progress')
+        # Emulate server down time for 1 second
+        time.sleep(1)
 
-vm.qmp_log('block-job-set-speed', device='drive0', speed=0)
+        with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
+            e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
+            self.assertEqual(e['data']['offset'], size)
+            result = self.vm.qmp('blockdev-del', node_name='backup0')
+            self.assert_qmp(result, 'return', {})
 
-# Emulate server down time for 1 second
-time.sleep(1)
 
-with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
-    e = vm.event_wait('BLOCK_JOB_COMPLETED')
-    log('Backup completed: {}'.format(e['data']['offset']))
-    vm.qmp_log('blockdev-del', node_name='backup0')
-    vm.shutdown()
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index c45b1e81ef..ae1213e6f8 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,15 +1,5 @@
-Start NBD server
-{"execute": "blockdev-add", "arguments": {"driver": "raw", "file": {"driver": "nbd", "reconnect-delay": 10, "server": {"path": "TEST_DIR/PID-nbd-sock", "type": "unix"}}, "node-name": "backup0"}}
-{"return": {}}
-{"execute": "blockdev-backup", "arguments": {"device": "drive0", "speed": 1048576, "sync": "full", "target": "backup0"}}
-{"return": {}}
-Backup job is started
-Kill NBD server
-Backup job is still in progress
-{"execute": "block-job-set-speed", "arguments": {"device": "drive0", "speed": 0}}
-{"return": {}}
-Start NBD server
-Backup completed: 5242880
-{"execute": "blockdev-del", "arguments": {"node-name": "backup0"}}
-{"return": {}}
-Kill NBD server
+.
+----------------------------------------------------------------------
+Ran 1 tests
+
+OK
-- 
2.21.3


