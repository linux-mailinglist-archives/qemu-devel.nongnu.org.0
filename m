Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC333F316
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:40:21 +0100 (CET)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXLQ-0007C1-Mp
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHY-0004GO-9N; Wed, 17 Mar 2021 10:36:20 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHT-0006nM-70; Wed, 17 Mar 2021 10:36:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxLES6LLgP4AtKuzi5S5EYv7iLDOlFeStX7dGlKHoiTNc7GFa+Yi8f2k6cBk08OAzv9wqquh2FHEIAkxcp5PhyPBVfvU3FOiYtdqZQXH2JW99sUlHxUIGG4Sv4vc3XcYWY+UYJuePsHpv+zNEhIRegg7V7vVEelA/BJIyOYU8KbAesZAAgvwJJv0ijVgcR0RJMqXgD3oLFGjF+dUTiVD2PCvNn5ff3UOBZ0UkgLrBt7PZWspByUAiRBppjo6nEZoaWe0m1fnFT5vmiQBJmyNesTKX7vQ1pGMbz+Vt7WYWjQ8/RVmYinik5YHRag/u3txqnrZJmHxrMqZ0mJFJN/DSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=249H0QJjjFlknMSfPWwdFnPO52SpoOOnQCVFSTVgICo=;
 b=kv7vqK6gN3r7bzckAFWjMPqSDFCUyFsFrP55/mFSaQ9oKRHBeolhaSrIMQ61pipEcbD9KK1qgUci8O4PvWcl/WAd1uHuZLymDJShQgKwRhrwzE6Om35fYLUAiYOf9HFOhrYjW8AdVQyPh1ii1sEvl2d/HDLe5q2u532E0rpfY1l9Y5MPMJRCvRwTEdMYmaYvzz2FGwSGXbbKCOxcxSKuZ/6aQWggu3g0QmdoWn8gWytEygO+c6ZWnug15nj0wxuSOZgfamzR5RQ3R0nyW0HIjEY7KhYbtvb1GMPCLlV1gF44yKYhcbFa0DWAlG3S5zjrX7xmIcsYgpjAZLt8dTwOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=249H0QJjjFlknMSfPWwdFnPO52SpoOOnQCVFSTVgICo=;
 b=HG+7E1/sqGYvo3E6VXOWx2lPpaaDGY4XgBGQ25qyvSJQLXoE2dCirVYbKnWwphTFoD9kusvRoN/oEbq7aMAGbLQDsXkRpPzrZNJ/mrXBpHlP7xIsNq9W5BWntkAUVEzQeL37ylpC9zH/AAmBB1aBIQMOyWtxmwiyPhry+Nx/0xc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 03/36] tests/test-bdrv-graph-mod: add
 test_append_greedy_filter
Date: Wed, 17 Mar 2021 17:34:56 +0300
Message-Id: <20210317143529.615584-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d368e17d-878d-45b7-9368-08d8e951ffd0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650FDB7D52E70F6194E83E6C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gz2K7SIFDv8CzGxrmJ0o92Q41HfwRbmQONHf1Aa8PRf5uPvNO4pu2SSF0NCSLDfUPBwR0xrnKjtV1Vv6q49wbRR8rk4A7kAd+QiCbpL8cASNPiZpB+MkXjGbubmY/aRlKpTTtBACRSfCXvYvpEKNOHcZ0fUOF+c0q6WljV4rdId8H55AnEezqdLP5RAyfiGnQWZ7yhg6ryzwE30ho4y6AGYXuvakS9uk2eADQjAJGLtz/cvXB7UqU1X0fA4riTEpU/PClhDChxnEtmjy0AfPhixUiuM+gaXPDxC+McR6FcjfPSnGt02LZJqIB4J103i37KYj0uypXwIbqqf03t+5dv6rx3A9BpIiyZq7hTNmAgxFW6Akf6V0TyFCxHuRq7sfbQ+/+1BlwKHN35U7yBVaOiJZ0sJRnyfv9uKLwNGvfP+Q+Ff27vWAhuUfVaODU4RodXIu3Ju6XOSTGgCHOc2tMDQDn04eoIA/uo1PHS8mbCsYdYaAde/opXENCbECDefP1k4a4mAZA3UHvdMtVBJm3YPIDklmqp7Mn/hSHqOdnuIvkTlLHR1AXe9vtmwxoRvQUPHcHoO9sm++GHE17ffCUy5m1MUB1WS8p579nGAttcmzGmdcmDHGB3ucV24q+d1B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wDyuHMXWEPEJPzBuqCW4T66CQjtuZtuuqDphQleGsw6aFzPM8wdNM64X894x?=
 =?us-ascii?Q?ZQip/dDipyAPNXtjtuzMLLz4c8Xj0rzqjHl2Ut/6dI4ZcKiAwhjZAyX1xMwZ?=
 =?us-ascii?Q?kfeQIfHc+DbjUlsWdQHVDS64NSDtO2BEI3lwO4Jgqnn84kE/Mpy9agWHi+kh?=
 =?us-ascii?Q?LmpAWf2nMkB+2LRhb2592LbMGflZWk/7qrNU+FMkwdU6fNt+hr7pDyCScRnA?=
 =?us-ascii?Q?NWKXEGZbhtzXDjNdci8qEN7uMx2RSn9H1+Dlyth5KxasLDuRjW3Ofnuk07W1?=
 =?us-ascii?Q?Tw0QYG6LuCjAnXpWxlXAxlIgXebzEFZug4QChWjIZbbgU39e/eNZybaudWw/?=
 =?us-ascii?Q?FHM5AOZIL1S4FxtUJdOJw4u1IvFqjuYasyT/s+k96wgH5qbwGNYc5huT3gsH?=
 =?us-ascii?Q?lRaVOXph3ae53tbGmuVqnoPPm4tLle2i0Kp2Mz910YxyeUvMNxkUZPzlbYmx?=
 =?us-ascii?Q?dx4zbMtAdL6N0no+JZN6bqLFRkMduWNzaQiw+HwpVpWXybvDRgnkB7PhFGrh?=
 =?us-ascii?Q?TwkHE36tzI+wTodDwy/mFd948oJljmse5/MmRM/B203/Lv3lTIWckFt4v/7L?=
 =?us-ascii?Q?8pwYJjBYXpgGHVdFVAbZCKj7m0s7Y4l2Lj00lYsWmvVPpuZzYkGikWMO9cu9?=
 =?us-ascii?Q?dBWqZ7otSiZClda0wq5eMX9J5dAnYE/jxBVHjVStymHfPBqPf0ms88I6aD8J?=
 =?us-ascii?Q?E7wHF/QEAcmb8bEVYZ7y6E+XS1n58YbFazqWYZ3PuNrUTFTuU88Q/oTHy7Ae?=
 =?us-ascii?Q?HPcv1sLKxPsxb9ma7te44gY0WS8UxB4p+xXRMRAkBuREDr9vMMqbenRaPAAN?=
 =?us-ascii?Q?GIslyOdw3IMzGYcblcHvDTsANxwfh6HFVc6lYWGhPOHjLuUhA73KtpcxU5jm?=
 =?us-ascii?Q?rDmyPW4IeLOts1aHj8MAbWAA+Q0FK8EcDWD1fK/tEOAAZQYD2sdKUyXw3nZA?=
 =?us-ascii?Q?mFwS4ZMcuiyqxEtFUVUGs3NwsoSan/i0jd6FmbVvZ9w35c/VvwnZhgdLkoLe?=
 =?us-ascii?Q?bD6CLDORGipRQe83k3dkTgqIcety4uP6ADsEg3YzRDJZFue30QJ0JTmZx6si?=
 =?us-ascii?Q?lh1u3vpSxVKsijuGy1JSAnw5pumO/xuunLTA7BDnthBmvg6Jiqdk3s/YVe96?=
 =?us-ascii?Q?4gVSy0zOz+9QT59Pxm/o+c3PMVRmOXKWIBUy8c2fDkSOgwrSXiA0mQNlEIph?=
 =?us-ascii?Q?4gkdphC+zCgEyko0Vr68MQLwMM0vDbwkGR/UjAFtikZurs+sCNtwhKls+Rqv?=
 =?us-ascii?Q?QK7aB+lN1QJ4bnmPUHXAQVwk184b13m92Wmh8Ypvj8MnWu71hpdrWarqsxJS?=
 =?us-ascii?Q?HxZKecZumuc8jHQ3cNglj9Rn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d368e17d-878d-45b7-9368-08d8e951ffd0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:06.8508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13E8dufzs+2p4DFoFoBYjjHpFeALLuBxN+vm5cTOhABbdCuHIeQWRjRKK5hi1r/xY1TGVG2/lO4scfIbfRGKZgcjlaqwB+JfIbXPsL9sLQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

bdrv_append() is not quite good for inserting filters: it does extra
permission update in intermediate state, where filter get it filtered
child but is not yet replace it in a backing chain.

Some filters (for example backup-top) may want permissions even when
have no parents. And described intermediate state becomes invalid.

That's (half a) reason, why we need "inactive" state for backup-top
filter.

bdrv_append() will be improved later, now let's add a unit test.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/append-greedy-filter

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-bdrv-graph-mod.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 3b3bba1ee3..65c69b23f7 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -352,6 +352,37 @@ static void test_parallel_perm_update(void)
     bdrv_unref(top);
 }
 
+/*
+ * It's possible that filter required permissions allows to insert it to backing
+ * chain, like:
+ *
+ *  1.  [top] -> [filter] -> [base]
+ *
+ * but doesn't allow to add it as a branch:
+ *
+ *  2.  [filter] --\
+ *                 v
+ *      [top] -> [base]
+ *
+ * So, inserting such filter should do all graph modifications and only then
+ * update permissions. If we try to go through intermediate state [2] and update
+ * permissions on it we'll fail.
+ *
+ * Let's check that bdrv_append() can append such a filter.
+ */
+static void test_append_greedy_filter(void)
+{
+    BlockDriverState *top = exclusive_writer_node("top");
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl = exclusive_writer_node("fl1");
+
+    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+                      &error_abort);
+
+    bdrv_append(fl, base, &error_abort);
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -378,6 +409,8 @@ int main(int argc, char *argv[])
                         test_parallel_exclusive_write);
         g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
                         test_parallel_perm_update);
+        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                        test_append_greedy_filter);
     }
 
     return g_test_run();
-- 
2.29.2


