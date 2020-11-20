Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD262BB02C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:23:27 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9C2-0003iY-U9
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95c-0003lo-02; Fri, 20 Nov 2020 11:16:48 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95Z-0004qy-DG; Fri, 20 Nov 2020 11:16:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt5u+WwyeopEad9usl66GWWpjPyrhKFPyNi1TM0aD55e2sIIEmqPDBrIJVk+O7XPS/GfTXdyvqNTkj95okXFF+ruREgP4d93QmhtV00a+YrDfp7CHMeAQPQUrLc94OuAP1mLLdWcV0V1yVz4wWoZbgm9A503Jsg1PJZvbUQgQwrMF84/nTjRcWEskGqqhKSPn+iiVHh1iKjzNa4Yzf7onn+SLHQTLNcuxz6VXY19RfqbvJqnlwFHk7AKP+0YoSXa7jjNjTo+HInm67pWgs5zqGC/TZUMwNN+QgWs//4/XISVy8YXilLT+u8YlCFRMy11c5N6o0AYBQh13IY859//8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzklPuQgaY8GtbZwGNAlnHUKMDmqe45TItkylDwk4Ls=;
 b=Dd8L8e23gXkA4r3kxs584mlRZlO6f0u8rWKjlLUhEjggcYUMJhaClgCdIWWdK/cs+NQOqJxKmIXLMI186Mcts8/AvrvnKIgz0hRAlFTMHWwZpdlNxG9y46C3jhHp6mzyCNW/pOMeFRN+lYtyz9RB6NLvsz8rBmTkWlP3VvcUuoGbE4Ip0XTF3Okn/oYOpW9nxEN1Z8ZAtEDMonZ5obNr/UXsqCqA4PGtXEbHFkDB+JLtVRb0m+1kVJLKVoALptS989h0qCT2Gtdb63l5u6ZTsC18GUHarc9nBs86GU3xBPbPLkwG801Ca6qfiBMOc4tSNNcQcihNWJLLOY1sMvh0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzklPuQgaY8GtbZwGNAlnHUKMDmqe45TItkylDwk4Ls=;
 b=rgm236HsEhAs3/DSGkLTBf1jW1O8Qqbvk7SGncYtL+FzZPO4PxwON2rf3pReIEgFmQr37jBlEIBKgBci0EwBULJdZpFhlf2JeZu9AVNBUz8Y+9yS1qHdtb8dN+m90DSkLA0J/QXsLriJk4TyOMe77YKav6jboiI9NfaJZ3ADwos=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH 2/5] iotest-30-shorten: concentrate on failing test case
Date: Fri, 20 Nov 2020 19:16:19 +0300
Message-Id: <20201120161622.1537-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201120161622.1537-1-vsementsov@virtuozzo.com>
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.108) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e843fc6b-a876-493c-6352-08d88d6fa898
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533322737ABDF0748E307349C1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TBuhbqN8OuZ3nLUF1SHvExf/cXqGRKOJydovtiDb+R7zYHZSd4vZz7CPS32GHWZMVKzbxtPGQ9qY5UzmgZv6lWAdYD/HIWMnGplf2sF1gj3VePsB458j11YKC7Vm2uV7SJYq4TMFNASwvG3xJK/xScAQhVOey/bPTJjgcgpK57iR5Mohb5rpFCjjJjx0HffFviZdYCXIVVO3+pHabg3E7SHb1iYOe0D/ZscAO5kLCNDCyVN64JwcP6mYz17lLzbEYGJ9BtYRRXRbjpZu55a6R2KbR6Oky8xollsWPhPUi8dShDnjsEYoZWuK1vOWKFOzQtoWgJLMSMounsuXprDuuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: HqfcYm6Lc78lvkueACGNKBZ3OkR94xpFq3CV6G4oGVk2NyoEAWxiBhCoyJDi+jx4/HNA26CqiENXT6TEG7Md1tbAOcIdW8VbhSppp/XNQesqF2U2NXs9PgDmzJNyIHsguYUvbD//xAzZHC7pPCBf211YrEZPdpaPd9rmzYLFG/8/iT1UIVKbvR3OkWPOaUZ+JUPMiuJrahfc5Jx8PQiOKO74SqaGdTJLBu1mbV2wxnapnIopZUZWgo0TBUjyrQ6nqxyeA0M7jhqfmK6k8EZFjWpnY6wIbxuziwtIZVnipzl9R4/OewFooJTDTCSf5eRkZWO62xQuwWlSqvNCFz37SlGgBQX8p1QEzZlbF7gKE/KHAOlIc1n6AuuIiMNLbCECnB1gL7+5q/HgSYXIRZq3ZzyYf99750KOsIfK291Qn9dCdmfQS5ECW6tdKwp94cNEVcfFokfe0vPAh2/jsrP7LGSGmx715hZ1w0ERA/x5/T5MIIBCm20CPco+i5MGgGFES/LOi79CoFE74X4qVXLfhBkDviQfdjQMOtsGonqcTCP0jQ3OSkoCXPOwFdm9x+Jnn01pLqMU7pul9yvqhvQ1yof6GAJzUnDw+6d55DcotZuuAdcew/cUfTLIYpOrQLuJvH4YuCB/5a5cimdCsydeDw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e843fc6b-a876-493c-6352-08d88d6fa898
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:38.4222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKSRlDoByr1PAEEFfPtyiJsk4tKs+Q5/zamjizyGixFwMun114qR+jprXQUFgs9aPmL5MEkyvnZTB4jM7Qz8PHTQxXKz1HqsXvi/Hx9Mv7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/030     | 52 +++++++++++++++++++-------------------
 tests/qemu-iotests/030.out |  4 +--
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index dcb4b5d6a6..9e92ec3dd7 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -52,7 +52,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         os.remove(mid_img)
         os.remove(backing_img)
 
-    def test_stream(self):
+    def ntest_stream(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0')
@@ -67,7 +67,7 @@ class TestSingleDrive(iotests.QMPTestCase):
                          qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
                          'image file map does not match backing file after streaming')
 
-    def test_stream_intermediate(self):
+    def ntest_stream_intermediate(self):
         self.assert_no_active_block_jobs()
 
         self.assertNotEqual(qemu_io('-f', 'raw', '-rU', '-c', 'map', backing_img),
@@ -86,7 +86,7 @@ class TestSingleDrive(iotests.QMPTestCase):
                          qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img),
                          'image file map does not match backing file after streaming')
 
-    def test_stream_pause(self):
+    def ntest_stream_pause(self):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
@@ -116,7 +116,7 @@ class TestSingleDrive(iotests.QMPTestCase):
                          qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
                          'image file map does not match backing file after streaming')
 
-    def test_stream_no_op(self):
+    def ntest_stream_no_op(self):
         self.assert_no_active_block_jobs()
 
         # The image map is empty before the operation
@@ -134,7 +134,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
                          empty_map, 'image file map changed after a no-op')
 
-    def test_stream_partial(self):
+    def ntest_stream_partial(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', base=backing_img)
@@ -149,16 +149,16 @@ class TestSingleDrive(iotests.QMPTestCase):
                          qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
                          'image file map does not match backing file after streaming')
 
-    def test_device_not_found(self):
+    def ntest_device_not_found(self):
         result = self.vm.qmp('block-stream', device='nonexistent')
         self.assert_qmp(result, 'error/desc',
             'Cannot find device=nonexistent nor node_name=nonexistent')
 
-    def test_job_id_missing(self):
+    def ntest_job_id_missing(self):
         result = self.vm.qmp('block-stream', device='mid')
         self.assert_qmp(result, 'error/desc', "Invalid job ID ''")
 
-    def test_read_only(self):
+    def ntest_read_only(self):
         # Create a new file that we can attach (we need a read-only top)
         with iotests.FilePath('ro-top.img') as ro_top_path:
             qemu_img('create', '-f', iotests.imgfmt, ro_top_path,
@@ -230,7 +230,7 @@ class TestParallelOps(iotests.QMPTestCase):
     # Test that it's possible to run several block-stream operations
     # in parallel in the same snapshot chain
     @unittest.skipIf(os.environ.get('QEMU_CHECK_BLOCK_AUTO'), 'disabled in CI')
-    def test_stream_parallel(self):
+    def ntest_stream_parallel(self):
         self.assert_no_active_block_jobs()
 
         # Check that the maps don't match before the streaming operations
@@ -272,7 +272,7 @@ class TestParallelOps(iotests.QMPTestCase):
 
     # Test that it's not possible to perform two block-stream
     # operations if there are nodes involved in both.
-    def test_overlapping_1(self):
+    def ntest_overlapping_1(self):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
@@ -313,7 +313,7 @@ class TestParallelOps(iotests.QMPTestCase):
 
     # Similar to test_overlapping_1, but with block-commit
     # blocking the other jobs
-    def test_overlapping_2(self):
+    def ntest_overlapping_2(self):
         self.assertLessEqual(9, self.num_imgs)
         self.assert_no_active_block_jobs()
 
@@ -349,7 +349,7 @@ class TestParallelOps(iotests.QMPTestCase):
 
     # Similar to test_overlapping_2, but here block-commit doesn't use the 'top' parameter.
     # Internally this uses a mirror block job, hence the separate test case.
-    def test_overlapping_3(self):
+    def ntest_overlapping_3(self):
         self.assertLessEqual(8, self.num_imgs)
         self.assert_no_active_block_jobs()
 
@@ -377,7 +377,7 @@ class TestParallelOps(iotests.QMPTestCase):
     # In this case the base node of the stream job is the same as the
     # top node of commit job. Since this results in the commit filter
     # node being part of the stream chain, this is not allowed.
-    def test_overlapping_4(self):
+    def ntest_overlapping_4(self):
         self.assert_no_active_block_jobs()
 
         # Commit from node2 into node0
@@ -401,7 +401,7 @@ class TestParallelOps(iotests.QMPTestCase):
     # filter node.  stream does not have a real dependency on its base
     # node, so even though commit removes it when it is done, there is
     # no conflict.
-    def test_overlapping_5(self):
+    def ntest_overlapping_5(self):
         self.assert_no_active_block_jobs()
 
         # Commit from node2 into node0
@@ -457,7 +457,7 @@ class TestParallelOps(iotests.QMPTestCase):
 
     # This is similar to test_stream_commit_1 but both jobs are slowed
     # down so they can run in parallel for a little while.
-    def test_stream_commit_2(self):
+    def ntest_stream_commit_2(self):
         self.assertLessEqual(8, self.num_imgs)
         self.assert_no_active_block_jobs()
 
@@ -492,7 +492,7 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
     # Test the base_node parameter
-    def test_stream_base_node_name(self):
+    def ntest_stream_base_node_name(self):
         self.assert_no_active_block_jobs()
 
         self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[4]),
@@ -568,7 +568,7 @@ class TestQuorum(iotests.QMPTestCase):
         for img in self.backing:
             os.remove(img)
 
-    def test_stream_quorum(self):
+    def ntest_stream_quorum(self):
         self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.children[0]),
                             qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.backing[0]),
                             'image file map matches backing file before streaming')
@@ -601,7 +601,7 @@ class TestSmallerBackingFile(iotests.QMPTestCase):
 
     # If this hangs, then you are missing a fix to complete streaming when the
     # end of the backing file is reached.
-    def test_stream(self):
+    def ntest_stream(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0')
@@ -659,7 +659,7 @@ class TestEIO(TestErrors):
         os.remove(backing_img)
         os.remove(self.blkdebug_file)
 
-    def test_report(self):
+    def ntest_report(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0')
@@ -687,7 +687,7 @@ class TestEIO(TestErrors):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-    def test_ignore(self):
+    def ntest_ignore(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', on_error='ignore')
@@ -720,7 +720,7 @@ class TestEIO(TestErrors):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-    def test_stop(self):
+    def ntest_stop(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', on_error='stop')
@@ -763,7 +763,7 @@ class TestEIO(TestErrors):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-    def test_enospc(self):
+    def ntest_enospc(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', on_error='enospc')
@@ -809,7 +809,7 @@ class TestENOSPC(TestErrors):
         os.remove(backing_img)
         os.remove(self.blkdebug_file)
 
-    def test_enospc(self):
+    def ntest_enospc(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', on_error='enospc')
@@ -870,7 +870,7 @@ class TestStreamStop(iotests.QMPTestCase):
         os.remove(test_img)
         os.remove(backing_img)
 
-    def test_stream_stop(self):
+    def ntest_stream_stop(self):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
@@ -918,7 +918,7 @@ class TestSetSpeed(iotests.QMPTestCase):
 
         self.assert_no_active_block_jobs()
 
-    def test_set_speed(self):
+    def ntest_set_speed(self):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
@@ -951,7 +951,7 @@ class TestSetSpeed(iotests.QMPTestCase):
 
         self.cancel_and_wait(resume=True)
 
-    def test_set_speed_invalid(self):
+    def ntest_set_speed_invalid(self):
         self.assert_no_active_block_jobs()
 
         result = self.vm.qmp('block-stream', device='drive0', speed=-1)
diff --git a/tests/qemu-iotests/030.out b/tests/qemu-iotests/030.out
index 6d9bee1a4b..ae1213e6f8 100644
--- a/tests/qemu-iotests/030.out
+++ b/tests/qemu-iotests/030.out
@@ -1,5 +1,5 @@
-...........................
+.
 ----------------------------------------------------------------------
-Ran 27 tests
+Ran 1 tests
 
 OK
-- 
2.21.3


