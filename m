Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2334B2787
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:09:38 +0100 (CET)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWcD-0007Wb-ND
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtD-0000eO-GC; Fri, 11 Feb 2022 08:23:07 -0500
Received: from [2a01:111:f400:fe1e::71c] (port=25931
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtB-0008IF-Ek; Fri, 11 Feb 2022 08:23:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB0FYFA97dXKVlV625Q9a1J6p0LQtwdZxpD9Tj2LWBTYMdocirKbPL2VFDRzaqfyVLjUB7DT2U9AsEibNkjKr1Uue4LuGkTDu+w8j9U7mr3JmpOweqIRCkWyIehWccJ03aJxKDCV9XKtDUK7ltyeNZ45ygDEoPzTjveEUULiYHqXh2tHn/2GQP8aOjXMkbktjdOZ3Xxo8qtyMnuHF4WGiPh+82GIvGCwLhH2NKS30CQ0cPT1Fg9K1QlQUTVM0mlo1mQqz4SWo1pl4U8opDISU0HFfsbqvFsZRQb+SD0F3Jci02n2yB2v9bWMGButV5GfT6IHIQsnP72o9KDMI+M6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+r7Jcl1f9liiDJ+itG2SdCjErdRw6UCoLXU+rXRp48=;
 b=X64qh05GWsQ+2ec0sm05fmViGK9HI6EU12CJdqHUkfLiISC76excwbGigG5nR6Ka2XLLarCk2TWO0j8/gaRSjI6n3Ap8N4fRHTXrgeZGbIQwGd+xSrRu2lbBsZzQw1BpGBvTxJ3aU8Ein07MRQ4qHej2PXvPOxxMqDSjmQ70yLkJ9iXUL9nZFnbIJX1rkhkmGTESgzgd5Xl7QoA2ouLokDBL/nEXTMj8NpWa1IOh3mZEfr8MyOTvodMh64mTNHIWVSIrWP0LQ+T0w4eWGfeXdL1P/9727j2i1BgZYCNZ2kL53PED+GQOVTwcfU8XJoYxPLr78ujhEwutu3gSKJ+JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+r7Jcl1f9liiDJ+itG2SdCjErdRw6UCoLXU+rXRp48=;
 b=JdQ16TgGWhy8FVppkxDBFG80AwYao3/sKfViLTErfjGza1YJq9YSU4xs5jpj44tvHZPl+RxbdLhiyaDcXfTGz6p7smU4Ih3lqYLo1yhlenTrwcmYN9zhD8SDKEJ/zKbFXTxkk9kh4OfCD5DK8XSS0H2CYIBI5/kiYuIYCOqkETY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 5/7] iotests/281: Test lingering timers
Date: Fri, 11 Feb 2022 14:22:38 +0100
Message-Id: <20220211132240.781958-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a3f0308-a45d-4865-23b8-08d9ed619b9e
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3865F34B6C36191D6BA5ED68C1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76do9+ZynDh2OMWCN/k8LocEvZtuCOUwoqYeEh9eWyl8HM6c/uMU32xDt956lfAJhc7E+uM3u6aIFw5FsWUwWABeGLDaM3sOBGpvXTf7LQI05pgFOQGYwUXzFjZkgKxmmNTt4K4sxQRjbh3IxXldoAnZsehPkoLOkzhjpne/XV1m8nx554LHx5Hdn+Jt4LwDs9b5gZ/oYrA1hlswfeaWXrr2HRhhIwIAXn28tPTDrWiAo53imIVIyov5cn6xTAfv32WfwAtFpXcmOjjOAwXMETTeaBGppJd9jqRwj4suP3TO89AcXvRSEK54UvrlBmC0vv/oFQ0L6TYb9nVQaEFIFVa9Co9snMG/xpxAZbNokkwfU0MHlhfSzoxM5v2vGvlYmXhbJS3jZVyZYDo1xNDqI9c2egsw75FxEeZorrLmZqYNH+Bl+EPY/SLjO6TqpC0OzE00yZtm1dhDNeyAe1vQQfz7MN+wHPBgeCebISwAzWKUdB5uz6irwXzvgYBRMa7Bc7Kd+eNYKTQwAGog36+9VY/8JUpGVC7zmfbhmlCR6h1ggGxpPImbt2dC01yzYddP1qmZ7w0LWNhbKamtBX5x5I1xf3b8BsndAkkJ1lLmAdeok57pX2fy1eg2oobYSTTNlRNI8KiGktdPJlI7mfMlroY21IZPZZjdce/6p1n+cZosz6tX/3iZN0ibzc/iQVnJQJ71Ds/fVfaty3MejrzgkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(6486002)(36756003)(83380400001)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYVZs0n5rAkW+3EaR2IDcnNxG945lnniJ8CuKVuBtIpqIEKHUxkzyH9DW83q?=
 =?us-ascii?Q?2+qS35IZHFSj50LpJ0WjuWicm3zpPj6sLqPf093iEjspLz/08NiyjNpgV1HC?=
 =?us-ascii?Q?/iYQDjCjxuHR56a8ADzfjj3jABFJoMBTg9dVzfo9XQcc6KdMU1uTVUpmKRyZ?=
 =?us-ascii?Q?DDSZjSwwf36EK5ZLwVH9GFIKJa1JMJ8hH7MugR/0OPWdocu+k/yVeDBBJEyW?=
 =?us-ascii?Q?TjUCahz2JbYzHRTshIy28dlr5i1KqBpJfrI9PfBUHYuPvJV7LAOJE4fQDvxL?=
 =?us-ascii?Q?fmWUX8JhUMz8OJqb5MwLF8wsgX9YMGjwkdOAhkMMA6FMkQarJuJXi9Y/eKC0?=
 =?us-ascii?Q?/swGxOU7DV09pMwWYxvqMlYo3KnF2VShUaSvu0g4AfWU4FYjgA0OIQJ0fWnt?=
 =?us-ascii?Q?e4BOQF/MY1zJpOFHWU1qHv8l5pQPD3EmOqyrY9X8Tv3/6J7NrNZFuCA+dHiM?=
 =?us-ascii?Q?SWtLGiVViexPStbulCMjt6PYdpCVqfvmmYcVUIk1xQzViiyA/m5L8NLyIE6t?=
 =?us-ascii?Q?rC/A+lwgykvS453qXhGxuMMOAhYafb3VXksATvyuqy/Gz3puwhNj5p5eJ0A4?=
 =?us-ascii?Q?bwCifYR3MdLbayXLmmtPXDYAHfWlUCVxjf5d5k6f6MknxYA6WQastSxrCPGH?=
 =?us-ascii?Q?z20pA40RFOgkDgeI3CLrUeWO0m2hjTfYyE5xZnwKjZr7AONcSdtdtTViN3aV?=
 =?us-ascii?Q?R54P/MHzqltZPSp8wxWPvZhJY5sclfP54wr/vnI4dKrfRxsnLcukb/+H0o1z?=
 =?us-ascii?Q?QuhN5qyaSau1dO6iAAXLxk9xB3AxZ/TKRXMQ2yb+26pTrBarYTqQqa/Bupkw?=
 =?us-ascii?Q?EZsfVUyWJI3PCl8iDTzthWSzLFsYaB8YYNoUg8Yuc6Pv2BfCjiI4rq4tlbwQ?=
 =?us-ascii?Q?M533QazikoFAwshCq/s9PBT8bxYdNVApQYPf2eOKEwtd+C9Zm+iyRtbms24Y?=
 =?us-ascii?Q?iRcG1a5eS57yLwvDohiLJUtg1H0NQOyVTav7+0gxODovseq0lP6dOU0zbgX2?=
 =?us-ascii?Q?yTqbQNMM1T/wJjdXmukd6AohUWqiwzxI/BEiMBdT+4r8t8LbCztef4BTiWO1?=
 =?us-ascii?Q?nj/HoHHM6eTHLUE7sF0AvPxndAQWp2+rriS9WiYpCLyvUQHrBcuUKhrQvNqo?=
 =?us-ascii?Q?EdlgBh5mEOs+iye7WOFju9K2hJhCIHmJvbFvNQWdLVWiI0RbuaG+HRzMzJMw?=
 =?us-ascii?Q?pM2php7Jv9dmCzfDKVi4gt7VTJ+wSnmMpxd/8I3JA01cyEcTg3GEYsDyefm5?=
 =?us-ascii?Q?6eyeikaGEcz0CQ4TCbEakcvxapvZ0WUGSvIQEcRdD99pbx8E7Gj64Sa4Ka0w?=
 =?us-ascii?Q?/CYhK0O3laAUfJhv0dcRXL3WiXkVqC35tgbMpJNCjJwvOZP938aDdzWZC+Vi?=
 =?us-ascii?Q?gXV649/shF2bNCaWGeQ+kUW5RhmnIQEFBqbubCtrqia4eYtqjHi8dYMlEuCP?=
 =?us-ascii?Q?3Q+8Zu01KIYIsXVDUZ+JdyzXIQHKwVdENTKh2RceQ8XW30edNp+Dh1+Vp93a?=
 =?us-ascii?Q?Sv902hsj8HDmeAhn9lhpdppTuQ8StFio42g57trMlKEI+fLDYthtk+LjlJBf?=
 =?us-ascii?Q?HE85SGvigp9AG2g6ecYr8ySJ3t0TzfA+RyvZ0QjAcMvpwQ8gYRnmeSzekR5h?=
 =?us-ascii?Q?7p/miw1kyACu6uSGz1GhBapOyZezU1WKjuZOfM/XIUQ6xqMhE8vOVrBx2+I2?=
 =?us-ascii?Q?POphCQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3f0308-a45d-4865-23b8-08d9ed619b9e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:52.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9n3+XmgYPzeUwOEL/bZLFgPHRi+fq5X+jah4T2KsMBidGWapWLQfjV+RewHN6jaKGx+rMsx7iXSDy0ymDrbbdBvkRvULE8A1rDSq/QplaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::71c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::71c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


