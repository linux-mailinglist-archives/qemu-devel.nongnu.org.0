Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DD310E2C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:52:21 +0100 (CET)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84LF-0005J4-1z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847I-0000Ff-JK; Fri, 05 Feb 2021 11:37:56 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847G-0002Vt-L3; Fri, 05 Feb 2021 11:37:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvrRRCG1D7ddv00IHs9IxFql37JRT+xYNaZ2jtkmcR3KNEZfOKCL4YYuaPNaiE34ob6PQn5fpLMSdIExFzUnexcoNSbJ31MfW5ErTZcgcEIImORCv9Jwd/6DcZcYBBj3XmW0iI9r+SocSYjKu8Iz/b1snSp9jxeImyIVF2vuPDvh+h/fg3G0RRCIdMTdSh0JChEcRScugbMLNCajp2qp8m1Au5xeaxg6Js45mcAOB6RZvB4Ak/9P38b+m1c0sB0TG53xkgHNoqNamWJ0QSIli5hzRfCPl8IllaMEK9xj7ZiNdaB9ZQXWsi7eA7PgBoX41csMj+n2nf2F0M7DKE2K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiAs6Q61dv4GsiuNiyIaP2ALz3noiqbE7Te+bccjlCo=;
 b=jRQsPn5P7IxFPHFlJgd6IZQzFUjuyvUMS0ZUu2RBVY92T0CypWe3PegwgI3l2YmMCjTvB8GOBjiVu0WYEAg2u/VSEcoEoYVvVTDS79827Knc78KpsOAtf/i2LhLkZN+BRQhVhPTGyJWL/8WNjINO8AiHF+NEnxCBtFrXtbrnAE3sHVdkiZJ/uBFin005z8B9Bs/aFiA4ft3oaiBuDjD5q1n18L3hO6X2amTv6y9R72v+TeIusJLwauppc/PatbeQD4oSwXY2kpETEg0La1+pRttfqBPw6m0IQR4vs/BRrnvH5XhON5z6HmJWg98sYWWqtzD818zrppYJrnvlv0SXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiAs6Q61dv4GsiuNiyIaP2ALz3noiqbE7Te+bccjlCo=;
 b=CSQ9G3fFSOO8egXeqGYzd6Jz3SNqINdYAeqW2NXMrlgo3K+eULtXclzouUOx2M6VXzMH+nUJkXYFKjxJPRlL3jXqMRWclVagkUEVf6zcRRXdE+XwDOpDvm4EvMYmWrQXtXaKuXHS4lHIliVQ7IcwF1sgszrt8ETJXzrThntsjLI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 08/10] iotests/264: add mirror-cancel test-case
Date: Fri,  5 Feb 2021 19:37:18 +0300
Message-Id: <20210205163720.887197-9-vsementsov@virtuozzo.com>
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
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bd594fc-b40a-4f97-e022-08d8c9f45b2f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470A970DE2BEFD878EAFDB8C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmljLuD4GjqKrQoPYBIekOCJG+PsoTH8MDYbbz6NRlMeeSvhBfEjRlvfWvuiy2Vb0Lyd4h9VKeQ2XHIjSDtDjxuEInJnWgfgK1pHxOjkv50fqQi9jdzL1gB5ohFpGgbpjaCjFN1zMygeEXkb+3KIkPN3D/4evoCpbc5XfIOaueN+JCb72vC1OX68Isvtdr8k4Yr72z6mDCGUgnLyPPGq4x1v6uj9WORZsX5NiAqhOjcjNyZBzN3WZViKhqMKWsVyQTQNRvxVS2OsuCpkl9i1Y74YgjWwJEgk9/AOfoYVZicbBo1yLnz0I3buaX3R3IaK+xxKBE9ilhW8MGB5L0Xwg3RkPBb1OIRBxgpuhQjXM6jBU88qLFNTIDPAlkAQzWARoNZfQqe1mRJH6oW6uMVxnfEOXounK58EFi4lFo37xkUfs2eeMyK2b/sc0IDCqGUYkflx8U+MOQwYOPeSOAU/DgLRdBDst6PdpZFOptTT++3WSgbBxcblpxin8mTOmw+64LBrH1qVFq4UHcdV/MTOAt23fJWS98boauzB/cqWtJkVtdQNX8pjdtIDBLygaF8LMMLcxmKPyYwDVfOGTx8h3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zEwLGCwUOONH5qI+c+XYUHxnkU1jaVN4tHbEyxc9E/p1i72s1d3zW7xZuoKJ?=
 =?us-ascii?Q?Od8JYkgYovLVk6Mb18A5izDGe4uVpO6dTDVwqIt+Zyjupu++pyeDhlh1s1KY?=
 =?us-ascii?Q?odDZ+tru/cuH3OFqJJLHxnSRupJMO+x8CtYs5w3GFMeIykgI4Y9YGA08JI4B?=
 =?us-ascii?Q?iFnXkyG7iAcG+P8Yrws/HYO8c83XCfz6GRczbHCL0HJtlsD9burBTiV9COU9?=
 =?us-ascii?Q?Gykvlgqy89/GMI/tBYw5lX7gTEFieTmQ/AiC6ydh7nKzHVsshL/MoT/6xq7o?=
 =?us-ascii?Q?JYfflD7xp1b0Va0kVpJBLQ2acqGnbJ/Nd5VYcwru0y2f0gKsEsotw4qyqBwR?=
 =?us-ascii?Q?eV980zrh05sCj+/oejhqgP/yzaKI3Q5qfsrXhOwGGTG3JRLfJf4Llxn1nQBI?=
 =?us-ascii?Q?WKZiLccbcU45YLXpEtvxDBbdffXnj0CFbifLmA4aV8Bk61cNsIxPCLpVwUza?=
 =?us-ascii?Q?zY0Ip+plXVp84d8QNWTcU/N60DGal57YY1QS01RNSvs+oKZiUs05DNY+qZpc?=
 =?us-ascii?Q?YCEPNCVXR1PlUQ0hRXpgtQWDjXgNPkNkFHmY+85Z5nhqb62fNMcyhjAiT1TZ?=
 =?us-ascii?Q?CBR8IePYo9fDr4+mE/hYvnXnKghGFbvwQHInbApd9bWn/791yJUdtuLZNMxl?=
 =?us-ascii?Q?mGM1qv1IQGrQuTowT3ds85mL0WMumhs701Xv3YGlF5UioVMVMXdHzM1sEM78?=
 =?us-ascii?Q?uvuYhh1+rFotDBdms9bEMydqdJ20iettNvy0NUX2IpQpKFyaUd8cE7L4hrNs?=
 =?us-ascii?Q?WagXj492Bm0n2B0LlyBNQE/E3/E6yRLYSrMwF+A5SKD5n/jqMhKVexYJY/fu?=
 =?us-ascii?Q?pxEiw0+5P3Xh3zcEIO5+/kRZ5Q+YIGGkSg8ZIcnQqofELh4A0owT/p4L7Jaw?=
 =?us-ascii?Q?+XoUDHPyQjVjI8VQPSbX3L+7bG5WcTts+jCfHmkKVU8UkywB14lSdf9oMlpa?=
 =?us-ascii?Q?UwT/4LQsN+1sFPuSURwe06wWlejOLoBX7ekN/LlLX9BpDyDwHl6EkZFvsX18?=
 =?us-ascii?Q?kO4f1BY6LAtkyejLp6QyYmO1hRC/xcoB/0elPs94Yq+1TIv9Jbalbow/m4Fv?=
 =?us-ascii?Q?V39sLp+pVo0ISJlA8pB1yRRm+t5SJuxg4lXNWvQD4TN4B74lFiP4PN9KItLV?=
 =?us-ascii?Q?8pRQ9C7lD0bx9Mz2hlEte1pkr5RARvcCR8XVf1bcvwLraoePgd+N040ZJsW7?=
 =?us-ascii?Q?xH4R7ebXVe5fj06Y8eNjHECP9+O8WsyY2aSS8aUd92PxaeHs3+20XVF2wM+w?=
 =?us-ascii?Q?LRSiyW1j/vFZyIIiqb7wVEX3xU9ztZrClmL7NBUyBP+GHq3z2gvo9LPpiUC3?=
 =?us-ascii?Q?Um2u/NTcWpodBAxHJAAKRbJh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd594fc-b40a-4f97-e022-08d8c9f45b2f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:41.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2LvKak20Q5XV4G3p8jngyuOhZlwgqH2tTo/ADq+23vuGOII2c8H5GN6VXomYqeEu3LCJc2ppXWKh+N8hW6FC8zj2F2rcYOlhaXhcJ8DKyI=
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

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
 tests/qemu-iotests/264.out |  4 ++--
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 6feeaa4056..347e53add5 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -27,25 +27,26 @@ from iotests import qemu_img_create, file_path, qemu_nbd_popen
 
 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
-size = 5 * 1024 * 1024
 wait_limit = 3.0
 wait_step = 0.2
 
 
 class TestNbdReconnect(iotests.QMPTestCase):
-    def setUp(self):
-        qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
-        qemu_img_create('-f', iotests.imgfmt, disk_b, str(size))
+    def init_vm(self, disk_size):
+        qemu_img_create('-f', iotests.imgfmt, disk_a, str(disk_size))
+        qemu_img_create('-f', iotests.imgfmt, disk_b, str(disk_size))
         self.vm = iotests.VM().add_drive(disk_a)
         self.vm.launch()
-        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(size))
+        self.vm.hmp_qemu_io('drive0', 'write 0 {}'.format(disk_size))
 
     def tearDown(self):
         self.vm.shutdown()
         os.remove(disk_a)
         os.remove(disk_b)
 
-    def test(self):
+    def start_job(self, job):
+        """Stat job with nbd target and kill the server"""
+        assert job in ('blockdev-backup', 'blockdev-mirror')
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             result = self.vm.qmp('blockdev-add',
                                  **{'node_name': 'backup0',
@@ -55,7 +56,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
                                                         'path': nbd_sock},
                                              'reconnect-delay': 10}})
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('blockdev-backup', device='drive0',
+            result = self.vm.qmp(job, device='drive0',
                                  sync='full', target='backup0',
                                  speed=(1 * 1024 * 1024))
             self.assert_qmp(result, 'return', {})
@@ -73,7 +74,8 @@ class TestNbdReconnect(iotests.QMPTestCase):
 
         jobs = self.vm.qmp('query-block-jobs')['return']
         # Check that job is still in progress
-        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
+        self.assertTrue(jobs)
+        self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])
 
         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
         self.assert_qmp(result, 'return', {})
@@ -81,12 +83,32 @@ class TestNbdReconnect(iotests.QMPTestCase):
         # Emulate server down time for 1 second
         time.sleep(1)
 
+    def test_backup(self):
+        size = 5 * 1024 * 1024
+        self.init_vm(size)
+        self.start_job('blockdev-backup')
+
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
             self.assertEqual(e['data']['offset'], size)
             result = self.vm.qmp('blockdev-del', node_name='backup0')
             self.assert_qmp(result, 'return', {})
 
+    def test_mirror_cancel(self):
+        # Mirror speed limit doesn't work well enough, it seems that mirror
+        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
+        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
+        self.init_vm(20 * 1024 * 1024)
+        self.start_job('blockdev-mirror')
+
+        result = self.vm.qmp('block-job-cancel', device='drive0')
+        self.assert_qmp(result, 'return', {})
+
+        start_t = time.time()
+        self.vm.event_wait('BLOCK_JOB_CANCELLED')
+        delta_t = time.time() - start_t
+        self.assertTrue(delta_t < 2.0)
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index ae1213e6f8..fbc63e62f8 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,5 +1,5 @@
-.
+..
 ----------------------------------------------------------------------
-Ran 1 tests
+Ran 2 tests
 
 OK
-- 
2.29.2


