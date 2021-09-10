Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF7406A7B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 13:08:24 +0200 (CEST)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOeOM-0001RB-Vv
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 07:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHj-0003Hs-A5; Fri, 10 Sep 2021 07:01:31 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:26817 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOeHh-0004St-J2; Fri, 10 Sep 2021 07:01:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxDZK4oQ1FKGT9ueGT+QZoJSQNce2iqaw+jtWooKa3Y5iRhIWeSEMXgAFeyF0qTcujjl8JDdzJGPOpAxa0iVsAAX8YLE0sva0mdC7ZkrC5Ez6bqIhMeKzSTTkV17CpXjaKHk1xPvnttQ6J+qmel1cEgjE6qhkGbKfQFmPSKHr2F6aa1r4MbskIqnfR0NPrAKROay6k75zZuBVo3iRoL1IH8W8Ce0DqijjlL8pWfUFMP2x03qqCFTnH2qk+5t+pcu6/6gpBZS6m/3fCLPkW6SwGWQC+IVjpIMWvbI3UIiyv+DUJd7B/Vw/vcmAulDo2HzJLyCFl5rHD15RY/VidMqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZjoIcXjOw2IHFG5IO4ZgTzpBy3iQEyplsP7MD8Ngw4o=;
 b=eaUYFeyrKx7yKMHqoHkI/gg+CWHuCmjwsiIlq+td1cwbAyg5iBmWoP+f7XEuzwiRAZfKFIOr34jpWHRj7F/lXQwqjpuL/wv8BjzeizRo52zzE47XevmQDfx6A08XBZTmncU6V4pBiTsDLxX2X37QyamKrA9QmffRHE+zywbycYBxcSRmJWFgSvG+maY3lvVVwICuO1om6lvNPMP7yIygOtanXVJIBz3F01R8DziHNvtFp9R6AinKsN6Cm6HNaq8IujEuQ0BSN3uvfcdQ1FI2Jv7ZnuPGYNQFjS/KxGHFoGSyEcVa2ghA5AxWVjfBrtTDRoQMkYIOk90liZSXymIhZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjoIcXjOw2IHFG5IO4ZgTzpBy3iQEyplsP7MD8Ngw4o=;
 b=pVoS9xy+DYsL2azG453qHu47oFtd7PuWFN/L2Ew4KHlzFSQj4L1v+FR6a4inyxpdysMqSnuLwuFArCofM7jnjYiWHrM07CsOWUgySjmKCoHzVzF4le8uTm/T6bkjyC+JnIL9v4ryc+j345MCWqKsYchDLPcZ9XlxT7lpDOxP3EU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2532.eurprd08.prod.outlook.com (2603:10a6:203:a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 11:01:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:01:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 2/2] block: bdrv_inactivate_recurse(): check for permissions
 and fix crash
Date: Fri, 10 Sep 2021 14:01:00 +0300
Message-Id: <20210910110100.31976-3-vsementsov@virtuozzo.com>
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
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:01:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6de260b-1456-4a62-d510-08d9744a5012
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2532B66E58F6AC5C0823B4D4C1D69@AM5PR0802MB2532.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQULGzH3dtTZbUXHt/WfftggcO/sZIr7IWGDGs6E82FQqGxMRQ82Rz7dz7EQk2S4V9BcbCuOoaFEk1g0e3tz8UrX1Dl6mcnqew7F3D8LmSJEtnChzjrBfoB9hmNt+SZ0EIUcXwPZuvTPGuyzIfuLH4oCHtWruZXnrZaZotB+TD+8mmOkh5xndB68X8dB88nzzEZxfikYJzYlCxGaEWyJwuTZ9vdBQ5aayn+sxHgX8BslxDOPRRr05XcLGpIoeQUtr4deKhXdFlJIcN7nMBAqpnFWegecZpmZa/xcEKTst9WuywWzELK6+01AzIqgaW7qUoiWWlaXdXLIYL+evqZF924DXM6ZhTb9wBIhbi3au1KFTO1aEIq6HyclJvaYNWqHUitPsASpAkS1oXckta14HaRf234mS0wveN+wHkVWi06UH/qspewuMVOLxXpYTfE7qbLob39tAyWRj0yJDPClFyuSDF3NLnQuFfXqb96KMJcJzgIy/67iGDMis64nM+DOMcNyHhidnvpkh9fn4HC7ArPn6HjV6yb7LZcPvF621wekJFKSF0NwaYDTaswv8ufsXpc+l3WtzmBWx/Xw76Pe1RDt+HhkaYt56LtdpL0yfBNpOs7zYnDJI7aYWpSGEsZpKnervMcTjtKTCBHVBjb4IHU+XEfVWuQZ9TG5XTR0pYkhRDJk+yutNzuDpAVkmKdjJK/51R6sphpLtEwEinzxkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(83380400001)(186003)(66476007)(52116002)(36756003)(6486002)(4326008)(86362001)(2906002)(316002)(6506007)(8676002)(5660300002)(2616005)(8936002)(66946007)(956004)(66556008)(38100700002)(1076003)(6512007)(26005)(478600001)(6666004)(6916009)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8t+HZhDQaFh/6jj+NpFYUrwiTIsAa/znZY0wzCh5dCjBCpGDOWM0r7ntrJ7P?=
 =?us-ascii?Q?j0yzpmXccvRj/ThAMG6JJ0QzCU6o6o9ks+j4wELlx5rG489tlTkeY/8g51MI?=
 =?us-ascii?Q?BIlNx1n8gnOiIKHECg3dwhk9NQ3XBxfDVImW5KNNZz8VxE+NJCCWnn/0GHZ5?=
 =?us-ascii?Q?loLZXva1EgPHh92W9/+0519vKqBw2eds3kdRFIBJwSTvbZCWUHimqOskh46S?=
 =?us-ascii?Q?JOiS+szGc7hoLeaYQ9nkVyl8dM1xbvLmMeYTu0CPte+zk1Tl9kVrJ0wfqnve?=
 =?us-ascii?Q?KVtk72JWjubmyxS3MstVQ6WrQtIp+htZKq5JKsjgI5cCOEX5cMEuSsuUDB32?=
 =?us-ascii?Q?Re67RkP77BWmhHZpaVSQul2658os/whVlKAtckkvgQvgLYDTNRAXyHQZHEgu?=
 =?us-ascii?Q?CjdtNHLl+sRwx6XbmskOcfipl6b+KF5eivolVsOpSyhCMd3/bAxO1oGIH5e+?=
 =?us-ascii?Q?uGrz5TBrmTJNBJLJb7C6SLXpzZuTKOo5BqRmT6H+znAgcNPuJdLqq6JADy4n?=
 =?us-ascii?Q?ojFfn/hF9XE/hDSuldRiYKPK5SP422irXRCHtG7Kojzb0UMMC6qDPV6SnFl1?=
 =?us-ascii?Q?HZBpLri8pT7zFBDOVwaj0l5PJJWR3t/ObQHiv0jBIY+ZzzcaM6GD6zqxKGXq?=
 =?us-ascii?Q?R/UmAyBWUI08xmClLHmfYij3nxkpSoZqIc1Bl76/9QENDw5CUWtrwf4QRT+T?=
 =?us-ascii?Q?9w5oQ9Ol3L+rJenjzl3T+fIy4waKk/ST4jQfSjHvgyjmmLpfJwTqZueW61aA?=
 =?us-ascii?Q?nWlFqKcDGUPBvM2MeAsd4mKuKvceQwW6ESGrpSH7cDB/OEO/MLC1TptJK7mB?=
 =?us-ascii?Q?JdEAZuXe/R+MPn9QyqyCdhI1R9cqHlyzwqDMZMgbaP+vFYpK3J8/iq5Ih+/+?=
 =?us-ascii?Q?Uhaps1z94bhXmTPaH5KZhsgNCG6a1+JMY7EHzXPBvEXX1Okb9jXzyqMqyun1?=
 =?us-ascii?Q?C0DzYxWUP/i05qscv8JBrVDebk/jhl0c7qcHON3ldkGFHIBVZrfAJH/7DZHM?=
 =?us-ascii?Q?wCsmAW2RjuokIsBqWObB7uWZyahPBhUxNd5POiNPNmihtyJgNsTfoFFASdiz?=
 =?us-ascii?Q?JJuBOEHr0MhEzNBToldYaHVcNSWj6kuvtuX46w0RfjOTxl6AHh1Bo480fJNk?=
 =?us-ascii?Q?fjZlEcFF4NoeBOQop5oRrwA3UyvDrNSQHKhtAqgj480p/LYHB1l0AWrJ8EB2?=
 =?us-ascii?Q?Gz74lGlMvT9AF/mrZtLzxJEt6oiXLmOiIEzsp4I5ncXj5dduLW+I1kzZWOLg?=
 =?us-ascii?Q?gIckoYbrOBg26OAhX10n29s4092XGsWkGa+DHK/529tHyfX+93XwFtYF1VTk?=
 =?us-ascii?Q?7FcXhBQychOyCjPQfIFVnSZb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de260b-1456-4a62-d510-08d9744a5012
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:01:17.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NPrdt7+Y9IO5pqu6hDSeTDF3yEHfa2qn7dz6g0Y5dTmdWiJ6gmbZ/RzwQvOG+sIQE2eL9b8eA7ZYY9TPMNUt4AdAt1J2wY3lsiGBbu3Lys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2532
Received-SPF: pass client-ip=40.107.21.123;
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

We must not inactivate child when parent has write permissions on
it.

Calling .bdrv_inactivate() doesn't help: actually only qcow2 has this
handler and it is used to flush caches, not for permission
manipulations.

So, let's simply check cumulative parent permissions before
inactivating the node.

This commit fixes a crash when we do migration during backup: prior to
the commit nothing prevents all nodes inactivation at migration finish
and following backup write to the target crashes on assertion
"assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
bdrv_co_write_req_prepare().

After the commit, we rely on the fact that copy-before-write filter
keeps write permission on target node to be able to write to it. So
inactivation fails and migration fails as expected.

Corresponding test now passes, so, enable it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                                        | 8 ++++++++
 tests/qemu-iotests/tests/migrate-during-backup | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index b2b66263f9..ceb2b66afc 100644
--- a/block.c
+++ b/block.c
@@ -6319,6 +6319,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
 
     if (!bs->drv) {
         return -ENOMEDIUM;
@@ -6349,6 +6350,13 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
         }
     }
 
+    bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                             &cumulative_shared_perms);
+    if (cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
+        /* Our inactive parents still need write access. Inactivation failed. */
+        return -EPERM;
+    }
+
     bs->open_flags |= BDRV_O_INACTIVE;
 
     /*
diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index c3b7f1983d..d18e558fa5 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: migration disabled
+# group: migration
 #
 # Copyright (c) 2021 Virtuozzo International GmbH
 #
-- 
2.29.2


