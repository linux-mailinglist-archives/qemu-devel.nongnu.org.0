Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B396C310E05
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:41:25 +0100 (CET)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Ae-00031g-Q8
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847F-00008X-Vi; Fri, 05 Feb 2021 11:37:54 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847E-0002Vt-0Z; Fri, 05 Feb 2021 11:37:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp67XcGQ9+fev5zVevM7v2vy7SnG/w0vslbaDBnHeRNaR/MnS8ngv3xE3Y3BFLYRiJoqEyZuKeol7d04eUiAwwcdNduSZN1KDxUt5Y9tIn+krk/tOa1Pmdbe5JJhYVix2ZKnfnm0ntyRX4/K15+b/ZeRo4wVjdWpHgGaRLPcqlAoiGQHpk/WK8t0vGfyqLdp7mn3E7YDC94968GxN/HN49ody6nOpM4JIOPUQI5uPx4hpN6Dj2IP2OVdlBgIhgVvtznOUBnKazq7poaiDYxTcuYjKpQmlP6bbwH6vRTe17VuEOw9kL+y7wXLxTN00WcdecMjj7I29k4r+vAfl4bCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51y7D3MhEC9G0aDfAeaSFXFETfOB0ad+Y2fHOJTk8D8=;
 b=Fghl2FSxL3OFw8K4YaTMQl/5vlcSneyYRUQgdlfY7HCbYQ55PP/frKyOJL5GerA2GdYBK/5JqQutWwkhqQmgMCd/8e6foBnyPCdvKNuhDhGF71l5Iz2nauK6Uc8bSC6Lav8dyyDsbHtaXXSg/sPsxHcV+4QJFGE/o81/D3dx4B7VPAvLVjCcpRF/yBGdthY+FpKsKfftRVNb1PfMaP8smmFODPtP19916EbNpTx+ttkz68M0S4JYGNs+tO6JZ39wXvu6kEAru5zhHAQdb3AE/KA+Wwpr3pcisb2ktw9teXpua2DJ2XJBcy5ag722WHYbFdBGug0HY/Yf71uN15B7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51y7D3MhEC9G0aDfAeaSFXFETfOB0ad+Y2fHOJTk8D8=;
 b=YICVUPYtriegvfqX60LvEu92nOQYr8w4v8FMk9cQihm7DVJMMyu+OPGO05S5q/oPnLSrAJI9t9DTs4rfFBlSBPu5XVYRoG8DU5/p1PVyZ9OHJm9hDRUTLn7prs+T+A+A8VuajMEkXXontaQ+cjysby3c1r1aWy0aHwJ53dCkzb0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 06/10] iotests/264: move to python unittest
Date: Fri,  5 Feb 2021 19:37:16 +0300
Message-Id: <20210205163720.887197-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5660bf7e-9e43-4950-c903-08d8c9f459d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470F12946B0ED7EC950D7EDC1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4cazu5DpPF48mn85c0Png+WNCy7OjBGVXuSHUpH5r+hRzuqhNB+PEHL9PDUgKgd7GWKy9Z4jTajmUVnRAigqvcvWVpDl2stIeYVMEmyURuGXtnCZrj9xE3wOTezQCCa7nVgXR37IurO1YMN6Akfb3LTpYroFZxAFPIrOmEIEefjSBZ2ugCVViw80/qHf1TM7j1gtwucZgWbOOb13AgBlJM3grp267RFd+x7Oi5ZgnrBQ4yXqxprP2/WkxdjANi8h3VPrloXe3Z/XC6XtDTJuM0XZq/10qmyIPAmkfg14wNNiXnullW1Z/u5uDnCOHDUyYWlLYFBJBIH7TjmRlJhCMnmQbKqxUS+GDM0ppKiXklTAdho0r97HFvVnKrenF746pAO7wqW5AZ9wkHel1fjUkBnRzdOWNoqClmiaDf/9RIdl/r1sez6ybc+Yq/SsSW8gp85q70ZkKbwrsRFiyN/KHkLFOt4jVDPXB2D0JdmeTiTUfy8Eol9FlIjiSSc//2YnNCUUiPK87OCOHFltD8oradNegkHYqihQB89sYXwMXscrdYNdzUrWmtg6AX3MvIyxMxF+HC8ZuYQRL0i46UU9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HHg8+G1E/4oqHfHLqGojdQZOC+GeJnflZV81WHbwVUFbb8OEJNt0ky/PdyCW?=
 =?us-ascii?Q?NACc/asyHcuilgor5BTB+7kdil5WUI+RExmxCbu/JGEL6YysyfAUCFlRDuT/?=
 =?us-ascii?Q?I+6uXryU9n+zFNdZKEtuBrUf7Hw374O8iP5NCRlWpLEnLW4QC8bvVnn6RxE7?=
 =?us-ascii?Q?FBLt6JQ+KJMSj0IVj/L0w5DLRwOTLO9UMIH+SNoBu1A7aoyRzJ6PhvnJ+w4Y?=
 =?us-ascii?Q?BNdB6xSG/6nr+vaWz0hhuaBp9bbyoQgw5IUUZGBwLXban428/puJiFaBE8qO?=
 =?us-ascii?Q?WtXhMJvaUXyADkHeJ6LMFnfk8Glrs3QalHpBicpk/ZpL85c9gt0yTbxYts8P?=
 =?us-ascii?Q?TTF5vuljMPDD+Ba+bYuEGCB+ICJ5kSE7x/ThvV471gwKXKU65YRW2QmkqvZu?=
 =?us-ascii?Q?mY60eg1SPVlX/GGZ0h8bo3eXN18tCPjWOZzm6T8AvruCja5UC9IF7R6nl1O5?=
 =?us-ascii?Q?GJ55eP77RTyBJv5+8wS5k6h2jffRhDHvhVoEA4KThR1pV426xwaI6J8XmIkM?=
 =?us-ascii?Q?R1cAvzNRKA4dZPy+GGnghVumrQvnhHcoiIwyaymGEeABT+ODGOpb2dOPjt26?=
 =?us-ascii?Q?ad7+omAxntWTHOgK5vRLBVh44I8UHK697ToQQRGqJ8T6B1gPNZo+1B7CzoOj?=
 =?us-ascii?Q?SF4/DyhV+7Z90XSdbD7//i2i9WBBX5qd5RGcDlQ58fZIzVMVCSHWQFnObECR?=
 =?us-ascii?Q?j404fK+yMNBcHIHL/wVfW3PtCerhm/8osZ07FJU34dUIDlAD1/3N0nqoDI7d?=
 =?us-ascii?Q?d209v9CwXdw3WTUxK1pXbtNvqqk176w6HlAUVzwrBwUsUSPtBzuo2Tz6jJe3?=
 =?us-ascii?Q?QBWcQpxCfaIlMLgrLnwtE3+Ywsmee/3db5SdXmcy4lrRJHdwHTC0C7wqgZ5d?=
 =?us-ascii?Q?2l+O6JBFrS6bu2irIRGQJ4CBlGa7Co9GycVfZcFFw4wKJN7g3QgQeURZE3Sd?=
 =?us-ascii?Q?/tF0APwmxO60LAj+cjWBT8Uzn8Hft+5qwoZ+P8uyNQWZsgcTjnAcGA46jBLD?=
 =?us-ascii?Q?qh4kgg/wrKoDF/tAvlTHvbiZZ/cPAuJHcHSLlkmJ763K0kKoZ5Pnf9ybDwKr?=
 =?us-ascii?Q?vBwPa/Vytyi+3fyzK4M4pFmg37WMpjHJROB6A4XZVRTkviR9KmcNaDnrrub4?=
 =?us-ascii?Q?koyzlJpJPPgCA0c+4piGLKTtXGAkphrAxclX9g1rXISI33lhZU/e7L8q/Sfw?=
 =?us-ascii?Q?qXxLNvwDn4z4PzYrsQeD6HHHOaPpv9kDbfsAXoNYBXgrSWEepwq9JBC4xIsw?=
 =?us-ascii?Q?+OymTdc6lUISof7qtBjEQUe354YEa721l2eaz5d1IyrwpqyzFSro81gZAvEI?=
 =?us-ascii?Q?5rLxx/IoFps4MGz6ayoztRFv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5660bf7e-9e43-4950-c903-08d8c9f459d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:39.1094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmPfJ/4zKQpjQETNfRKHzFULV+lUt43hRr3Gh5l1SB0weWw3JciA/1OnYmyuzHWBBAceuzHm6iJTwmGcQ1AdL7mEadSfyrOxYkjTUvfR+sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

We are going to add more test cases, so use the library supporting test
cases.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 93 ++++++++++++++++++++++----------------
 tests/qemu-iotests/264.out | 20 ++------
 2 files changed, 58 insertions(+), 55 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index e725cefd47..6feeaa4056 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -20,13 +20,10 @@
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
@@ -34,46 +31,62 @@ size = 5 * 1024 * 1024
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
2.29.2


