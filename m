Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569A34AF460
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:47:29 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoFk-0003Y0-6G
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:47:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZL-0001Li-QR; Wed, 09 Feb 2022 09:03:39 -0500
Received: from [2a01:111:f400:fe07::716] (port=28271
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZJ-0000NJ-5m; Wed, 09 Feb 2022 09:03:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+bv8v6ENXVTYVYPFnmfpKLasn73SlvQ/zlDcOgwQymCUCPTyCI6rDhlYsVdstASidpXhDnE6NVXDkkqIed3FKMDwsvq5vFSvxKCHJWsZ8u3g+MAmcrHd9qWx4IGjM2ZDDODhJMK62bCTaWp5236pm4R/4OZ9Gw8Y6JsDm+4nmKe0hYqtwxZyyMpLD39F6LL975PVRubwzcyjJX3aIko4K/6meUFWcz7P7f5MnPZF3YzwEpseWDmieHpOZwZydmhFmUeWtg71RYAeCZwrrb16AyTs7mKo5B0cYrqpUms71AkenqadiuY4C1Wad0r4HmmXaHUATC/ok68sW/I7MosxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiR5f1LEZiOIyA8eHKsqtoRFzNR3nbBjrifBJqJ3OSU=;
 b=A0nbybTCvGvdKzAnFF35GoPAXX5gD9b1wb7TT6Ysg8vGeMH2e/OxyopqfF78dRjLCtx+dPI6b6kZ5zL7KfsyogG4T1QJ1S48cgOSg7nDNuS6B09LXWUNOou4fTv9hva3jaeJmI4vQ0llvrDIF5rEG1LS55CMbPjVUreLrEpUikwyk3i5LAVbEI5C29h/kkEG2d7IYJ4QPW7h12wAvBOfq1kNYnIGGxZHJAt3v1PFdcv/CLPyuzju/3U7Nv3m0a9ofYKcfuD2PGycU5ZMG0rcx/QLTp7YhTXi1Qz056L5RHOnv8i4QOkDYrMKoC7l90fdVOXBWpLpG374YyHp9QIyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiR5f1LEZiOIyA8eHKsqtoRFzNR3nbBjrifBJqJ3OSU=;
 b=EB/SeUKSYRO9Qzx0fYhX06+DJMlM1BHD9Tx28xeABOgYBC8kyZikquNbIWa7YhCsMSfyF+Gd0e1cK51UNfezFIHC7AAV33dUi+Ml71fdsG1zGgJLOPNb/Mdnd1uiiiMb6o9LApXtk3XCsmsmONhbnu2UY3dsFUVn0EnDlapNU2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB4460.eurprd08.prod.outlook.com (2603:10a6:10:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 14:03:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 7/7] iotests/281: Let NBD connection yield in iothread
Date: Wed,  9 Feb 2022 15:02:58 +0100
Message-Id: <20220209140258.364649-8-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f165f321-5079-42e5-0981-08d9ebd4e9b7
X-MS-TrafficTypeDiagnostic: DBBPR08MB4460:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB44600E73A832684F19D7EEC7C12E9@DBBPR08MB4460.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mW3HzwDrzs/pATh7FH1wpA3gQ67o8Aj9IZqfm93qFDR/m/3a2JzBvrWpRDImxzGptUVbVgGQYhh8W843xjKc4eTebtmYibHDhh7GRA8PiEBjGILnNm+Zumw2+Kz6lB0XQEyedXHuRaa/a/xmayGezSCnA2QP3qjibk/uLYOHRIYv7ka8Hcby9imQFr7QpohsXCX1H76j1CFDdp1ONE8cVr7I9wbPK8rHrO47lhJYrIhKEkeKswVocSMLFOIBje+YNXC/KTvUpKU3boNVu6dgFq1NVtcWy/4pEFAvQhbO3EGpPMLxQqJW9Q3B75XrLU+9KRoEL+h8lHBFTXb0G962y9ICeeI6ZUT5qspc1DCeB4EHuLDJ/EgcEIB3CMTxG5ZKDI5DzDVGn5/SpUaS7C4yeZmbRRydtsA/tIv/+idkzOvGiUcKD0BR2x9V3akgbKnGAlzryUG1FtzibuehVIwRXYiP+8W7XBR9mcCjvVepOY5bS8pZT2Sq70UEvkEkeSSqvNSh4Z0jUOxifnjjzROl5NP166ylwsOGYizpSJXEQuzNt8hEB5Zovy5CFbrftkqvJuVsj/D+I/i4T/dwBLCv+yIw3MEuVg32ULAo5QGQoQ/05tOBoWKu4f69JbHcoVe/gEQ/7368J/5UtPObAh0gwz3fzD2nkTerwn7GFA5uWfea4poR0s0YJ4gEvNr1PY7YE8Pk5BEbyisvvyEHaB71jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(6916009)(2906002)(6666004)(36756003)(316002)(66946007)(52116002)(38350700002)(6512007)(508600001)(4326008)(6486002)(86362001)(2616005)(66476007)(5660300002)(66556008)(8936002)(8676002)(83380400001)(1076003)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pesGNgTNNPaEpHe8cOrldJPA4iHWMkq8zkee9kGssvWSMU5yJ3Y2d5Oq1RXw?=
 =?us-ascii?Q?plR3NjYez11YuO1F42Cjuttvzt7CHlMBzYQpqWFaABwOoc7uMx4Rl4D36y4d?=
 =?us-ascii?Q?DimColD58nnk58A2ianbIvVDrPjzoAd7NPULwfl3vzVDCqge+bsJo7LuRIqF?=
 =?us-ascii?Q?tBlRYRPZR4bWdkc375E+hO9aAwKyzHupmiyYesbQSRYsa8j99Z9toaej5kRb?=
 =?us-ascii?Q?avqWb+1cjbxLR6yfHO+TaroY6pi1dmo6WmpRqHnBcRl31X5OsZBm0J1nnWRZ?=
 =?us-ascii?Q?XyZnkn1IJICyVROgpZX8Om2EC76F0eyCtEFVpG3lN39m4EToDutcpy2BhkNo?=
 =?us-ascii?Q?CTYxt5lfumaBnLOkrsd1AaGV37P4/XoiIPZumRcTVtvdKaAk/Cu+XM+x7s5L?=
 =?us-ascii?Q?LCqZ5fkS81wSqU7W1/yD+IEWdbyJJ9sauOSsBIMAlKWyLDzJe/w8bARC8K4B?=
 =?us-ascii?Q?AkI8p+UjxZr0sEIPOJkq6PdHsotzJ8Hvt9uj3ARxJ3GwRVgxoJua7sue+Ah+?=
 =?us-ascii?Q?pUthdE7FuQWSXTInje7Y6qXnWYBV8oc/LimIQ1L5NL1sRcrVc1J7TKf0EBou?=
 =?us-ascii?Q?PcQvEKT0Wy3h8mFjgTlYc3LoBdYh4QzcBB0pfiEnVg6eeu0buoMJaTO15NLQ?=
 =?us-ascii?Q?64X/aQW4xAiKRd+UwhvugXIl11AWw5VG4tCac2fnJ7PnWVTbOFmdT6TD98S6?=
 =?us-ascii?Q?iV4eJJZwz83PzFJNaHA6DWRMEzDA6UoFx9Fwp1MCdjiq7kWkdZgzbsjxgyQc?=
 =?us-ascii?Q?pldJSrXFmWYww0DfhwuzUzRHfTcNkhcYexgyjXUdSuEWqFMYOmTfSKgvEzxZ?=
 =?us-ascii?Q?IrEMdfzNRrjrLdMculeKT4av/+Gd/DK5ABpKsMofBmOLyzbYqh95ArMV2/Tw?=
 =?us-ascii?Q?dP933OUwk0HTcCd7M3PtSEnpid17ZCuzmoWoVSDBO83aaxrHB8Kg3cuNcXsw?=
 =?us-ascii?Q?4M3bSGpumkCPC0nMv0HKXpYxcgrC7jGknCUXzr58aXdaHyKQx5Rh5P/PNhTE?=
 =?us-ascii?Q?o5EiJkN4CJxb/3DKqlGsEev6ikfr7FKxz08rNXCLFxkRkKJ3PLiL8l9oHK4l?=
 =?us-ascii?Q?ltX3k9myBGEti2HuZU82DAb+ZkXNN5ywsc2OGkKGXnYYch83f+QYf6nkzjid?=
 =?us-ascii?Q?73CyLfY05FncHRLdSyYCxMNhf6fyGM7ZXaE6O4ecgud6351CaFE6udFTebSP?=
 =?us-ascii?Q?S3+OttAIal7Bkt2bjV6rq8m+cm7DBy1Qaz1B5D2bPKw6TmwmakXZYlJzcBSA?=
 =?us-ascii?Q?HP3atMqKkTtQLEc4og9afjnnDHXH59PcQW7An0zT854uFS7XAeq+F12PRNxl?=
 =?us-ascii?Q?WTRPOQFOad4aO514Iv3qcQUEPc9D98NHRtD9uqA/3vzrVpCaYdyjsCghkA2B?=
 =?us-ascii?Q?refFrR/PHvB2ZrYjcQfMa7Bphvn6RwCMW3FrdwDjLVMQnu4dcVPw/GyHycOz?=
 =?us-ascii?Q?rW7gNkrUv1gIpWTyePN2h/K9J2LgOhB4MsebJRaL2WZajPzMcSCBtN1NzuST?=
 =?us-ascii?Q?JrCUcs3/xNaigODHS1wB/ADOWSxL+lGzkm8T0qB6RxRbr9n8jRWGXlyfGasu?=
 =?us-ascii?Q?gsn0ecTzOf3qakMxqvDMWjo/wdcU6rJJ0ippOdNWF4/+fZ7tbc7SNAdAmuvu?=
 =?us-ascii?Q?+4kDpILOuE+1Te1j6fACzFVJ6lvUAyF44Lh+CyTebg434XSBRjJBF8rJMMzZ?=
 =?us-ascii?Q?GGyRVg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f165f321-5079-42e5-0981-08d9ebd4e9b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:13.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf6EEV1plGjqze+CgW/NsItJXr3AljLMLmSytJI8VkMNRj9xgykPr/9w43jY9u5ZXoiByKU+v+kENykvfL3lgo94FAJ/nfsJ23uIxm0e3aw=
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


