Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702522B83D9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:31:46 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSF7-0006wh-G3
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpg-0004mc-Cq; Wed, 18 Nov 2020 13:05:30 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpZ-0008Rp-NX; Wed, 18 Nov 2020 13:05:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwACOA65poDnESxsElF5u2joQj7gSnvzrXkwWIqdq/TfQ6KBiNBAk0Lxsjt7VaC1XXPJSpKN1+xlcbtMOaBzsd0+q087XVlXfS/iR9mSwpWFzq1UfpSsAn97eh/5NREIlRPP7r6nT+Cs98TNB2H9h2sqR7laJ5qpBXLX0iEQgigUSmVOvQx03MSanMvUwoiX+43n5yLGVxEYUdnAFrGx3OsOCi/eEE0OZsXyHU30JJSDt3HsjVbdef3zguDCfD9bk27pQF9TCXazuOhTzyxDyhZTQX5njB/YCNWYg3IneIggz4XB1S++vMmuB4XDrgsOZoiRLHmyUMoEmPIzSjBlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPMOpEZ2f2ZkOmg59xGaiof8g7i27v2VaWcQiP7MnbQ=;
 b=aSQWxw6TF/2dRSRCTbTWHRAJQFymUEaaQUtwpoajIS5vp9ypXko2FNEn8mIfyLmM/yT4o24SW+bnRtEIH+ngaZ1jEytWXPkoa7VxSsPLZbghDZhoMQHauc4Zi78aWGqezDHycquapifxu76+6W607MZp/2ZCNZErGfKj3ilk47y0DOI/q5EQ7HlQdFhXTOi3+FZtFeUgRAapzwDP9Q1MvLWJmLNawNPxJBw/5+ZRa/olRR1mEPQ/BMg0duRnHQCSXjBqiSzTAYHcKFThzMPuBntj8LM3WEfl/3kwRiP3r18DF5vS1FempqHl2erVFeNWir69NEiFFWUvQfaF0h03lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPMOpEZ2f2ZkOmg59xGaiof8g7i27v2VaWcQiP7MnbQ=;
 b=TBx67zmtLtU+0z2C8qr7nvEbkZkHqAiP/AXU35ylP5clgBsXYBwhq/BBqeQ+fVx0YfMqkH5WbnBxjcTGWgjBH7gxaYe0KRu7bKvxgSgPkq2s2lbAvXLM5bSPDhvACGf9TMJM76D9RjbthHFltAboEEHLGzQBheJCSYI88dKD8z4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 09/11] iotests/264: add mirror-cancel test-case
Date: Wed, 18 Nov 2020 21:04:31 +0300
Message-Id: <20201118180433.11931-10-vsementsov@virtuozzo.com>
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
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bb16074-2c3f-4ad2-7860-08d88bec736c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591223C32D7C24A402A5F7ECC1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 036xV1eYkEuE7BW4cIeZdEMVKwCfNYyIteYCurzBJsS7n4mZ5PYJjHRhUc5MuzHPo5/iaaKmgmi3FrUafSlDxK1CCRRx+5qPIpmEe6U6aO3DszDpEWWVTUDa6w2KwK8Biawy63sy98A4D7/yCOli+rPh7gjG+tBLMk4wki3+GjWMoDngfsarY7NDvf3aIUzdjYS4rhlyj+3cXxiYDCJiARWPO5dORRC2uCHmY5EBSrw0P3s9etnpoyCVHy5LZnvTP9rhy72pidJeDmJFpBpkkMts/IFEtaMsicl1LlckdGl1K8sHElA3+pv6gauCfLeeHkW3G2RwUNWTAT6Crq/bdyVPgZ1bCl0PD95+nqFd1P/Jmggyjo3HO49Yjkir+BB8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003)(33290500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: IJHnFNTNr5GdQ73EZXwNBZCYUVup/hB0XSmgeuhHwvt6egKPfl4miJWS5yCZS6IYo0BPpbC50YP41p+cwK1MVel9wDcorLlXA4qze3zqpwMBa3SClt38G/7YPfJnQqWlvNQ0xyDp8C6KBYz9RrUQ5VQq589ihuW9ZcEPG68LigXcMT6jgfqvr8WoFtAG4ILDzxpaV4WXldy8Zr9jRvlY5O5KIipPElVIuaKP5knpvitwSXiWisGah7ZTN0eOjVPoXgSfrkVtslfJtY3JLHMf8hzMC0gkIHV3FQ0EPBYPPPireCTAT3+6RWtChNc2fIid7weYpRf1HGlzDkYCcEWta7c5YIoH+cprm/fhJxQqXtT+nGqWA8bRU1LLVZKWbQrvuie6bQXcy9ldBzUDhdG4AndJHVAMpx8zYi4ibhWMH6G1zJSdmRBKB5uk9kK+oRWXlkx3FU415m3X/IOQ5X6HTfgoAuunvW8FO5KqJgOf35hAyQgGgezlB4PjjeVtN71KFglt8n1uTcb07SJvuVv3vJSVeTWMBiGiixeJ+3Rl+WVBS4Ph6/7lL76hO5zyD3zIx0JIh1Ty00BTqEUQ4SeRS+IE9McIJw4goiFobR9tX9+d6AUBw+lfLw6Wj34c+q/qCSRNGUXKLQQUyt+Qj6b5uA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb16074-2c3f-4ad2-7860-08d88bec736c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:53.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/s1dzSXyLlfKY1fnrIu7MgS6xdoIOplRQAHOoClbznXUxirEMG4nsXPBD6HsjVOlc4evLuJ4HxsNina4qqkrg8IzwJVgqqG32v2ErmA8jM=
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

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/264     | 38 ++++++++++++++++++++++++++++++--------
 tests/qemu-iotests/264.out |  4 ++--
 2 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 8c61628921..3c6f29317f 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -26,25 +26,26 @@ from iotests import qemu_img_create, file_path, qemu_nbd_popen
 
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
@@ -54,7 +55,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
                                                         'path': nbd_sock},
                                              'reconnect-delay': 10}})
             self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('blockdev-backup', device='drive0',
+            result = self.vm.qmp(job, device='drive0',
                                  sync='full', target='backup0',
                                  speed=(1 * 1024 * 1024))
             self.assert_qmp(result, 'return', {})
@@ -72,7 +73,8 @@ class TestNbdReconnect(iotests.QMPTestCase):
 
         jobs = self.vm.qmp('query-block-jobs')['return']
         # Check that job is still in progress
-        self.assertTrue(jobs and jobs[0]['offset'] < jobs[0]['len'])
+        self.assertTrue(jobs)
+        self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])
 
         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
         self.assert_qmp(result, 'return', {})
@@ -80,12 +82,32 @@ class TestNbdReconnect(iotests.QMPTestCase):
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
2.21.3


