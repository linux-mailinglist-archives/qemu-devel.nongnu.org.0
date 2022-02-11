Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370394B277F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:03:31 +0100 (CET)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWWI-00012N-71
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVtA-0000bM-Co; Fri, 11 Feb 2022 08:23:06 -0500
Received: from [2a01:111:f400:fe0d::72c] (port=1174
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt7-0008II-JF; Fri, 11 Feb 2022 08:23:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bav1VtWRlFC+WKICAK9fa4COaWkLMN81msrTsE8Df9cTQAOU9fnjzoPztbZigiP89Ij17HMPu7zaNPx9fHabdTLscX/PLqqiggcy5mNd3DHd8AYOROMlEwq3DZQCWfyPcRUtN0YpEJamo8Ex8OimBL9p8vl0xGpHvjVyFBSYpyBUFRRAyBew9vJZYJSCOdqt4b1Uj7P5lIj/1WGGuqDaSKrP8jJCXjNTfWCohDeP+kVpAmKyC9yt5Yn6lKA/LBeoHMisyI+wqQHpW36RY1BpPevSp/XThVrQRDpVVxK56Pj/V+b04THtyO/5+EVtjGKgWtZoLzlG02gr66jdl6+w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gLXUxXMjQLSnpkOFKVP9jMUUzno1SOvkvChwjqT/e8=;
 b=DryctyVG+3cr3NqVlISC1JlRphhYAlu6uZbBXwnG3AmJKmacoY9ZPCX21ruMKSGnyLS7qQvpYoj29Dr0KbHbj2uWIxEiTiyRYuGlK5XBlS76KjFP6x+qOt8Or1RZ1CeRhrK88HZ+4hSmCnBVvnp6WNxBrwdP7+i4PX9njPFT96ZHLkS1kIjqbnxIHfd7V92GlrQquW5g2tYGo3cnWypfP/ezAhYEo1Av78KCoIjOlZ4E6soJGLwSlfKjmeN6Itr/rW6VqlgrguUKmdmgUxFWBqfqaNDz8yM1DQf7SqTBITRVxJbNy5xJ5gHRVWtkTanDkNyGQ50rMuSdvcHCeq0KWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gLXUxXMjQLSnpkOFKVP9jMUUzno1SOvkvChwjqT/e8=;
 b=I7n8rlEc60n6y1bvzsioG/Vc+lZweHeagZepBZexcE8fKSpJGyy1AtHcNjbfSdgIUKjCT3JNmsveTEm9TkiB/21Vy0Sy0iw3fmKz58o2P3kSsNJKdLMgoQdDvCheq8kPZCTTEmKS9sCm+Kze1/JWaiFSm7FF7RXvXL9TDoGLQ7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3357.eurprd08.prod.outlook.com (2603:10a6:803:45::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 13:22:54 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 7/7] iotests/281: Let NBD connection yield in iothread
Date: Fri, 11 Feb 2022 14:22:40 +0100
Message-Id: <20220211132240.781958-8-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ea70fffb-c8b0-49a5-99c5-08d9ed619c28
X-MS-TrafficTypeDiagnostic: VI1PR08MB3357:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB33576AA63BB5B968C7A35451C1309@VI1PR08MB3357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awgxjugs6t8L45NM4H7mNVrusQ1lkpyMWpnBO2+OolQ3BAvhqf27OnAGoettHZCMtNPC7+5MEJdXkTsN+y3Z/TcLyyTRS95yqY4OZbcjNVbjpWjkymI3NON+xX0lNKbQcld7bNeEHZVob8FRH7QcibHYSABNWyP/8My8+0oxTXfAOqK4Nk0FZlshjLdjxXOQ537ZF8y3Hb1aVXZyI09rgRn3hvYzWuNUfg21MydKV1F10jTfB+ZUQ48PwQqYmt5VoiFZM6qGTNFXc0HftC/J8T+IKc+egdfxb5PPPFCOjJ8j7FBxS3SLPEzqIPi+y/wAE0ykAxngS3JKhYGcmuqCX9gO0ToAmrQesIKRpI6rfVX5Sa/VP4REDDkF8mUCf7mwKAG9eYTAhC9vTsSeEnp8mLyXmPaFrDwzCI/+cosg40aJnP83c4bC4XOqRbD0J9maSrxJh9rLQ/QQDEw830BdwyNIRFiG4ZEPk9fvHpcdECPdZ4pkr1gQyXG4zasR4RfJVyqcRTUKTrTdCXxjxgmWtkdPP73Jq9cvsa/EVHuI36nDq4jXQ6wHJrArzM+ZTFSK9R1WHLHx2GJHER47uV+o6v0GF18kcuZvwpdSA/p2gcl7No2qXy/aTsvy/zYoxCz+TFh07fjbpjc/m92pZlybQILhEYZkZJIs7SA0Yz4/Yt67qoLFcGC2j5r1wREbdmtv9u45z0DHCZTzCI8PCm8ERg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(66946007)(66556008)(66476007)(6506007)(4326008)(8936002)(8676002)(52116002)(5660300002)(2906002)(83380400001)(316002)(36756003)(6486002)(26005)(2616005)(186003)(86362001)(38350700002)(38100700002)(508600001)(1076003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SNw4V9yYG4LBdxZGrN5eYv13YwV7OlpiRuPQ/VBa5kCxKFZfI9Huw+XWy4yU?=
 =?us-ascii?Q?KcuCsOQwe/5aEiwJDZfyrXNyemyxdShABvayE0gzGaoa4eeZ7vBdwhiRH2cc?=
 =?us-ascii?Q?UzshIcjowuEDxeZKUXQmmyhzH9jzd+7En+6BvPy0SITPnn7ZBzcEpKE7uE57?=
 =?us-ascii?Q?5qDZIZjwfJedo343oJXtrXCqMzvLd+CYnARWqKp2UcBLxdyiVPyhi2qOeCaX?=
 =?us-ascii?Q?+crcdx+tY8n0VFLld91L40WFYDWlRlo+VJNOKaO29Xb5KiApN+Gl8Ol2axuW?=
 =?us-ascii?Q?BBMsvTw6qHMtgIZWvXwPO603uT3VwlPkPQgxistUSIv57UJoMK0gyOqFjoxX?=
 =?us-ascii?Q?F+7jvkSlSunz1P6a7eQgwtawDOWbde+qD4zDo0izU++UIv2YX5tiwgG0EyZ1?=
 =?us-ascii?Q?SM+RScCiZ+dg4XsrTX/cn1LavY+LuvNasyvLp2//YGBCDPI+7WVNYI2x/jaV?=
 =?us-ascii?Q?/3ohIvlHS5P6IMQYqg8HVrAj5De8YvgX5vTLym3s/YYbJbApQIDpVrPfiv3I?=
 =?us-ascii?Q?pdLAPNdqXuSGjc2JWuypI4Aex063MKiTA4LsA7kFoVHwICM4JsPSMO9rnKYP?=
 =?us-ascii?Q?kFIQtVhdnuAMhl4nrJnw99ayNR2MjDhtEvaJcIe4px9wwNFYSRF0LGCDbgjh?=
 =?us-ascii?Q?Tc6PjuuUx/6w2X3lu+oG9Uo2IfZI6zL8Og/rKBnJA2oj1DgSRwLTq2YHFrJr?=
 =?us-ascii?Q?WUjcbnohQWqHuOxLciWWVUkPHs/H2u6IzMg6he/kaOlNdz0NtrLQ54rMdge8?=
 =?us-ascii?Q?geDDZ9byHG974XKAH6C7s8wiKQqRWuR+ID0jPYE8UK57+xENdGictn4HUgJV?=
 =?us-ascii?Q?PV2hfktcBTo7qOnkvjXDWSmQHzJ2jLUiDoG77w9w989sgcayaq8VHnCYaFwZ?=
 =?us-ascii?Q?91Uuqs3KtRikg6NsnuCgSoL1Cvu1PZtZnv4R3Nc06wgmRcRE/uT9bQt5cqsj?=
 =?us-ascii?Q?tA1PkiUlmoc7q5LeyR4gi2BOFFiXzVaewD0OhedbdGHOqjBn2VM/WxEkBbbW?=
 =?us-ascii?Q?QdnYDIHkCLGEh4eqhU10sYWDTZA/jjIuwr7BIc2bMBSxF8sEZXDMYkdaDtS3?=
 =?us-ascii?Q?nxRevnvY6sTMQpWFERzFuETIhhQO5nussvvsX7KqP86VXgiBMsmMWL8ql5bN?=
 =?us-ascii?Q?Jz4kXUJhPt8/CXfL5BoiQj+2Id4NqmoxkibmPXlyquXozkeM8rsys4U1mGYY?=
 =?us-ascii?Q?QTxCpITMHvlW5hOXXG6cLT8phbD/SLFoegGQW1KNii4RUtr2kIJKXp8j7wTt?=
 =?us-ascii?Q?SNrVpjb0LCXmDf8g0oG1bsrqkIaLAxvwERKoEsY020U2idbdV9A8eIfF2S8X?=
 =?us-ascii?Q?v3DgpQCHScghTB+f8JRz/Kf0t52kMrZCcUgNJA6ZmmNCiPzWhV6BWlBPdvBr?=
 =?us-ascii?Q?y0vL0rhQcripM02GHmu7SgrnqDr/XBTFE4h4wWAmyarfIemeXoLjpyP2lbX2?=
 =?us-ascii?Q?PcQjflfbJMht83MmNpIT807sCn141ZJUs9ZS0DvC9BQYS2stXs/ePP4fVpSe?=
 =?us-ascii?Q?fD51Iy47qtKUE3fzfPOpAteOxLEf/JuwD/85DlSHWFxqfqRv//k6p/R8MRmI?=
 =?us-ascii?Q?1+NelJoBHHs97CxnkquZvPqAxrGzi7UDSfLqWKilX+vuiriBEX9FixgiBs/r?=
 =?us-ascii?Q?uJmO/+XNNx0cvVpcR1DyOoSxLZzXZNN0ZiKe24SADI81KuS94D0oxzjGCNu6?=
 =?us-ascii?Q?lyikrQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea70fffb-c8b0-49a5-99c5-08d9ed619c28
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:53.9496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqv7wsHuF99sPM/YJ8NsqLYqUGeWmPHrVeg4YljyPX6e3lF2EsL20znCwKjvFRrxc8c597Ns4iWJuoyolejrVBnJfvEvfyv/lSFmV5eXkJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3357
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Put an NBD block device into an I/O thread, and then read data from it,
hoping that the NBD connection will yield during that read.  When it
does, the coroutine must be reentered in the block device's I/O thread,
which will only happen if the NBD block driver attaches the connection's
QIOChannel to the new AioContext.  It did not do that after 4ddb5d2fde
("block/nbd: drop connection_co") and prior to "block/nbd: Move s->ioc
on AioContext change", which would cause an assertion failure.

To improve our chances of yielding, the NBD server is throttled to
reading 64 kB/s, and the NBD client reads 128 kB, so it should yield at
some point.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/281     | 28 +++++++++++++++++++++++++---
 tests/qemu-iotests/281.out |  4 ++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 4fb3cd30dd..5e1339bd75 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -253,8 +253,9 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
         self.create_nbd_export()
 
         # Simple VM with an NBD block device connected to the NBD export
-        # provided by the QSD
+        # provided by the QSD, and an (initially unused) iothread
         self.vm = iotests.VM()
+        self.vm.add_object('iothread,id=iothr')
         self.vm.add_blockdev('nbd,node-name=nbd,server.type=unix,' +
                              f'server.path={self.sock},export=exp,' +
                              'reconnect-delay=1,open-timeout=1')
@@ -299,19 +300,40 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
         # thus not see the error, and so the test will pass.)
         time.sleep(2)
 
+    def test_yield_in_iothread(self):
+        # Move the NBD node to the I/O thread; the NBD block driver should
+        # attach the connection's QIOChannel to that thread's AioContext, too
+        result = self.vm.qmp('x-blockdev-set-iothread',
+                             node_name='nbd', iothread='iothr')
+        self.assert_qmp(result, 'return', {})
+
+        # Do some I/O that will be throttled by the QSD, so that the network
+        # connection hopefully will yield here.  When it is resumed, it must
+        # then be resumed in the I/O thread's AioContext.
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io nbd "read 0 128K"')
+        self.assert_qmp(result, 'return', '')
+
     def create_nbd_export(self):
         assert self.qsd is None
 
-        # Simple NBD export of a null-co BDS
+        # Export a throttled null-co BDS: Reads are throttled (max 64 kB/s),
+        # writes are not.
         self.qsd = QemuStorageDaemon(
+            '--object',
+            'throttle-group,id=thrgr,x-bps-read=65536,x-bps-read-max=65536',
+
             '--blockdev',
             'null-co,node-name=null,read-zeroes=true',
 
+            '--blockdev',
+            'throttle,node-name=thr,file=null,throttle-group=thrgr',
+
             '--nbd-server',
             f'addr.type=unix,addr.path={self.sock}',
 
             '--export',
-            'nbd,id=exp,node-name=null,name=exp,writable=true'
+            'nbd,id=exp,node-name=thr,name=exp,writable=true'
         )
 
     def stop_nbd_export(self):
diff --git a/tests/qemu-iotests/281.out b/tests/qemu-iotests/281.out
index 914e3737bd..3f8a935a08 100644
--- a/tests/qemu-iotests/281.out
+++ b/tests/qemu-iotests/281.out
@@ -1,5 +1,5 @@
-.....
+......
 ----------------------------------------------------------------------
-Ran 5 tests
+Ran 6 tests
 
 OK
-- 
2.31.1


