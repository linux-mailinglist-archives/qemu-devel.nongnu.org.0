Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20A4AF412
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:28:54 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnxl-0001nU-5F
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:28:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZD-0001Gu-OX; Wed, 09 Feb 2022 09:03:33 -0500
Received: from [2a01:111:f400:fe07::716] (port=28271
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZA-0000NJ-V3; Wed, 09 Feb 2022 09:03:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyrJ5CfdajTqjZ2HfsGuj1rojEb2nfuEZDHliu82Vdl0KVTvFAMhVosQlCHN7CoittwijMjU6P/qNnKHAGB9zjSm2X2MXVImYCHrSCabARH5ou9eEn/UuTRufwCaAE8+0whMnVI9h9XYFjUQCdqWD3VS6gVZ2lHRM6fIAhdiq8N8NkNy+XkhGLQ+1sPPDCmutOb9iKIAhRS1ueJXjYJmWX4ZE5mgBhLvux+RmqxJ1xmZmLb/lKCGFvYlj8OKB8WXu2Kt6ryKj+rv0GG2kYQEopQxJW/3VCIEQxoyCFs2t3phPymHxPor69f/GSXcA7YAdJESqtPFuMCWE+JzwDYipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58SathTNiJjLK1kvKcTaLJEKMQFocyHEuD1xmtF3GXI=;
 b=GJMtVS4YI4FDTI86bKwqsp5CsI6+hf0eMCfv2I8xwR0S4kU9HUMAi0CWxzD9IHBDNs52qjSF3waYml0QjWpaWdgpMrk6ShDvg7Tuw8waAnzL2s8Z2gPIyUQehRSJ0vrX/A7Kx1X7IbrF+sGDEYcmS4wok/FkLr036Fyrx6ffKGZk11Wz+/8S9i6MHWATTesGa/YNhjZKS+j9iA9e58kQy5l9OpytEYDcmut5QJid2TF/ruAHKBG9Qkp2wPnQ4VNO/Tm/v5avQyTjEea3n4Ie2KlqHJGHwDDDpDmJUfueANMmI3ZBk/PA4d7kIKiX49gtlhIxvVVgqsEuW+zf6EdlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58SathTNiJjLK1kvKcTaLJEKMQFocyHEuD1xmtF3GXI=;
 b=mMZ5Nzeu6p+mCEgQg5WIST0RETpCDPGo24DnH4Iom4SzD0N9Y42ENS20qMU6/pfH8UH5mYg6lrpG/nNG55zGJOW/rEBZ0aPEg6nYv+4ZWYnlEMLz3WFZx8S2zZAaMbs/B5ai8myZu707c/zdeMI4x1z9T5yN4t02sNufYJr+KzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB4460.eurprd08.prod.outlook.com (2603:10a6:10:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 14:03:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 5/7] iotests/281: Test lingering timers
Date: Wed,  9 Feb 2022 15:02:56 +0100
Message-Id: <20220209140258.364649-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0962b4a2-f720-42aa-1cab-08d9ebd4e92f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4460:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB4460346CA668195F8E40D701C12E9@DBBPR08MB4460.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruHxTRh/FjaOg1yjPCdenefbkJlOEQdL1JjwExYrN8n4Fo8FQioj/DpRRTzNMHcsfWdkCdmBZ7CcowXb76jOVvpgGOWYsaEdzY8yXQ2GVz4+W5utfuUVBMsGxJgNTyX7y70CD5kewRvb3W06TpBqj8UhVoBpbQwUVV0OMUkw18wGzb7MzJ8pdLFLo+ZUvoDUIHl1ZF7kUF8ImrSXObFEc2ngNijRjmiQ9X9uNW7oEjUvzB6ILBfheX7KhFBMswAxwBRIBmIy6TkTd4mobbqIJ1M2jS+tsx6VaDTU3g7Z2aQNuqPimswdtcrwSU/Pxk6Ep5EThdjb4Ou+WUiBgBrqK6grUF/J1wddtQWWBijLRqQq2RWhMe0S1vDWhOJ1OS/EeSE1M3/lXCWeJUilcNiQlPMT76ZtMR5XUkoaWF7fsyHmeZkghQesfF/1+P1CMWEAkp2JmnV/pJuzpbuVDJoAUX5Z1xXSw7G55vP5X8pIlpPfzqJzgsdqzNLkz+ewPHdloTbGh5U0YcdnwP2KwylTKbi/9BB0INoQp+6Y3EMPNeP63dD2SG9z/Pnp3Mtoqeo11l1gUwUCYq463/hwVC0Tqo0tSDKXpacERpsy3Hsa7a+uQ9z8kYPZ0fQqnFuU7tXg2CqsJVlTs7/nqz70u73jd729AOaEf+4+PTcMEczbpRPn4D5PnqRiNcLtgcV/xNL9iU+TOhtZHG/DsqMUtVOPiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(6916009)(2906002)(6666004)(36756003)(316002)(66946007)(52116002)(38350700002)(6512007)(508600001)(4326008)(6486002)(86362001)(2616005)(66476007)(5660300002)(66556008)(8936002)(8676002)(83380400001)(1076003)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IeL0p/bOfd7vA5/AJo9NfM3og0GI+URg8U6kPSK/2+3OLa0k5HUXudctXj8o?=
 =?us-ascii?Q?cGFeVo1DmeMSPMQ1yyvnfqqZz5lwhR7u2huFLel98m88RCqnyIaxbimvOCTp?=
 =?us-ascii?Q?2listhQQBnXfBSK/UZ4/tyJdxHSvr+jFI65jXJh1FpWpaMMpFGweJFVPXXXn?=
 =?us-ascii?Q?+yCUuR3pQO679sTlwEnSZEGqcSuTfnCbgh/metWeB+jw7Crdsfh9Epwlb6RY?=
 =?us-ascii?Q?qQIM0ZJPp13W4kZZnTmH2LlceL7Ewi0jTOvyKXdbU2hUwot4VENrnYK6XL27?=
 =?us-ascii?Q?neWxWlWuo7F08XVehj8Xy8Vyp+Zx+OABFJdyTMeuw9Xmnk7RULu54VH8nL11?=
 =?us-ascii?Q?/E5X+wvTSrluZujIcFj+TBottJbGtMdl/FL9FWnlGA2hvz0wgbQ/xx0KblMc?=
 =?us-ascii?Q?BA1bu7Nyg9l4Qa8BWF0d8Ig4SWopUburrXYYbuebcXasmNZ+SLPFS49/AfS9?=
 =?us-ascii?Q?XCmjYWy3aqTVnKqJ1P3TU9rJxXAKyNUubpZwNFd9WFyFb0AvuJ5vK9hIPFsC?=
 =?us-ascii?Q?7Th3WQQ3HvytMR4f23UX8QvtAxGA6RunMr6+V0Ub/o2CtC7RpoWaTnj69Ri9?=
 =?us-ascii?Q?VBCr+GzZ45F5aLLgYyuXDMpUMco2I/Qwm81TeVKbNDc5Gm3NmoOcYXtTXTfM?=
 =?us-ascii?Q?ARVVFxsqhgSyqrLXdkDwieEXctIf0KpjxTbHeQChWStk5baCbPHTTfqpqwkk?=
 =?us-ascii?Q?DFrcRc1J7wB1+VgARmG+8ii8ETp0lpSwn1CEHO6nqxQ+ZDsyfn5h1jXrj1mY?=
 =?us-ascii?Q?1VrOiKrd2+1eP5V6t9NHcXG7qo9Iy9sRGwYb9cJDGYBbQ1TcddJTXM66PK1Z?=
 =?us-ascii?Q?uRlhiA6OIo4ppR4YOboghyooiXT4ZFKPPGKVARoW8qBvxRBZ6BMlwjLqLO1J?=
 =?us-ascii?Q?H/ZZCzJV2BGvUiq5K2iq3JrfCHdI5X5psv5yU5U2m0ZZFjJcIBQtC0fQ3H5J?=
 =?us-ascii?Q?xUcFdE3XiA0gBTKO5XqhEKF0RcL/x6mgCBOkNvfwLQ3/KmzQsAN/Ddv5WI/6?=
 =?us-ascii?Q?IkUk2wfILsUPC4G48vgDXH/PlcBgNeqiB6Yd0E+UOK3QT7XbaD8GtCOSO1Rn?=
 =?us-ascii?Q?78yTu2Hjee/mJ9hVrvFnoopbEYb27ywpDf2fygiQnHF05PICUp+Vs2W1Iofu?=
 =?us-ascii?Q?vQ7qnWOy8lv/WG5HeK+w5ot3n8/rGTsOSAreurOaBvGjaFjxVJa921QEMFdH?=
 =?us-ascii?Q?nEg9VO8Ue66qBDpNcRIkZRv82gxlwZctQME23585vJ+jaK0zPTIxgTh+8gq4?=
 =?us-ascii?Q?MIhgvzRtpUFGjw/GNi9Iu90bcOxVv8vAnkONCFOMOXYRtE87WWIrGhUY/v+C?=
 =?us-ascii?Q?lrwV0ver6Y3AcA7/HzeUruMX/xux6n05KXSNwGLu+msD8IOZjubqzdw39ZhW?=
 =?us-ascii?Q?hGOvqQCrqLR9mdoKTE8WwXrTkXkL9lCJ1GUHVsrcTL69JCgSDbsClCMV5RQz?=
 =?us-ascii?Q?6KnF1C2GySZ/mkfy4HbimgaozM3XQ3rCf4IvdCS0CyTrxBsYZLIxydvn9CCz?=
 =?us-ascii?Q?ybDk8BrMDN4uqQVx0gtyrRz/WGwuaxEtG/WZQuZoZYi7gDWAbQTkA6rKzbvJ?=
 =?us-ascii?Q?bbiYiOrm5OFAG8ajwltTbB8bn8y51Um8H/yp8LV0w77CaCphWfRtRS1PdzlQ?=
 =?us-ascii?Q?yY0TyOy4m8uL/nk1HT5aGfR4HueyhcNCOPfuu9JWmk6NOO8tNQhMzI4OYcqs?=
 =?us-ascii?Q?n2mpDg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0962b4a2-f720-42aa-1cab-08d9ebd4e92f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:12.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxVgZwmhkGsgysk3AlWnizDCwKJwzDnB9iynDZMUfwCtDEzL/cqytfPCk/kxTFErAS0TR/whqRfBoaXGgY4pp3EY8rGZFjzOhlQoGdL5liY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4460
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Hanna Reitz <hreitz@redhat.com>

Prior to "block/nbd: Delete reconnect delay timer when done" and
"block/nbd: Delete open timer when done", both of those timers would
remain scheduled even after successfully (re-)connecting to the server,
and they would not even be deleted when the BDS is deleted.

This test constructs exactly this situation:
(1) Configure an @open-timeout, so the open timer is armed, and
(2) Configure a @reconnect-delay and trigger a reconnect situation
    (which succeeds immediately), so the reconnect delay timer is armed.
Then we immediately delete the BDS, and sleep for longer than the
@open-timeout and @reconnect-delay.  Prior to said patches, this caused
one (or both) of the timer CBs to access already-freed data.

Accessing freed data may or may not crash, so this test can produce
false successes, but I do not know how to show the problem in a better
or more reliable way.  If you run this test on "block/nbd: Assert there
are no timers when closed" and without the fix patches mentioned above,
you should reliably see an assertion failure.
(But all other tests that use the reconnect delay timer (264 and 277)
will fail in that configuration, too; as will nbd-reconnect-on-open,
which uses the open timer.)

Remove this test from the quick group because of the two second sleep
this patch introduces.

(I decided to put this test case into 281, because the main bug this
series addresses is in the interaction of the NBD block driver and I/O
threads, which is precisely the scope of 281.  The test case for that
other bug will also be put into the test class added here.

Also, excuse the test class's name, I couldn't come up with anything
better.  The "yield" part will make sense two patches from now.)

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/281     | 79 +++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/281.out |  4 +-
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 318e333939..4fb3cd30dd 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: rw quick
+# group: rw
 #
 # Test cases for blockdev + IOThread interactions
 #
@@ -20,8 +20,9 @@
 #
 
 import os
+import time
 import iotests
-from iotests import qemu_img
+from iotests import qemu_img, QemuStorageDaemon
 
 image_len = 64 * 1024 * 1024
 
@@ -243,6 +244,80 @@ class TestBlockdevBackupAbort(iotests.QMPTestCase):
         # Hangs on failure, we expect this error.
         self.assert_qmp(result, 'error/class', 'GenericError')
 
+# Test for RHBZ#2033626
+class TestYieldingAndTimers(iotests.QMPTestCase):
+    sock = os.path.join(iotests.sock_dir, 'nbd.sock')
+    qsd = None
+
+    def setUp(self):
+        self.create_nbd_export()
+
+        # Simple VM with an NBD block device connected to the NBD export
+        # provided by the QSD
+        self.vm = iotests.VM()
+        self.vm.add_blockdev('nbd,node-name=nbd,server.type=unix,' +
+                             f'server.path={self.sock},export=exp,' +
+                             'reconnect-delay=1,open-timeout=1')
+
+        self.vm.launch()
+
+    def tearDown(self):
+        self.stop_nbd_export()
+        self.vm.shutdown()
+
+    def test_timers_with_blockdev_del(self):
+        # The NBD BDS will have had an active open timer, because setUp() gave
+        # a positive value for @open-timeout.  It should be gone once the BDS
+        # has been opened.
+        # (But there used to be a bug where it remained active, which will
+        # become important below.)
+
+        # Stop and restart the NBD server, and do some I/O on the client to
+        # trigger a reconnect and start the reconnect delay timer
+        self.stop_nbd_export()
+        self.create_nbd_export()
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io nbd "write 0 512"')
+        self.assert_qmp(result, 'return', '')
+
+        # Reconnect is done, so the reconnect delay timer should be gone.
+        # (This is similar to how the open timer should be gone after open,
+        # and similarly there used to be a bug where it was not gone.)
+
+        # Delete the BDS to see whether both timers are gone.  If they are not,
+        # they will remain active, fire later, and then access freed data.
+        # (Or, with "block/nbd: Assert there are no timers when closed"
+        # applied, the assertions added in that patch will fail.)
+        result = self.vm.qmp('blockdev-del', node_name='nbd')
+        self.assert_qmp(result, 'return', {})
+
+        # Give the timers some time to fire (both have a timeout of 1 s).
+        # (Sleeping in an iotest may ring some alarm bells, but note that if
+        # the timing is off here, the test will just always pass.  If we kill
+        # the VM too early, then we just kill the timers before they can fire,
+        # thus not see the error, and so the test will pass.)
+        time.sleep(2)
+
+    def create_nbd_export(self):
+        assert self.qsd is None
+
+        # Simple NBD export of a null-co BDS
+        self.qsd = QemuStorageDaemon(
+            '--blockdev',
+            'null-co,node-name=null,read-zeroes=true',
+
+            '--nbd-server',
+            f'addr.type=unix,addr.path={self.sock}',
+
+            '--export',
+            'nbd,id=exp,node-name=null,name=exp,writable=true'
+        )
+
+    def stop_nbd_export(self):
+        self.qsd.stop()
+        self.qsd = None
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
                  supported_protocols=['file'],
diff --git a/tests/qemu-iotests/281.out b/tests/qemu-iotests/281.out
index 89968f35d7..914e3737bd 100644
--- a/tests/qemu-iotests/281.out
+++ b/tests/qemu-iotests/281.out
@@ -1,5 +1,5 @@
-....
+.....
 ----------------------------------------------------------------------
-Ran 4 tests
+Ran 5 tests
 
 OK
-- 
2.31.1


