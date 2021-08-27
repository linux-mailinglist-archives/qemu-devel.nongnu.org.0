Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611683F9F13
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:44:39 +0200 (CEST)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgq9-0001WM-FY
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRM-0001Fg-Oo; Fri, 27 Aug 2021 14:18:56 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRL-0006cC-9Z; Fri, 27 Aug 2021 14:18:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkoZr5qeL/HNLUECZPUr7tMhROWb237mZYyYSETqVlJMOgyfDPPVgZ6d9/lyPMw73I94nATW7nQ721QAyef1u+JAmicZ82N7yNSLjpo9grwbvD4dHYr8lMqX/oS7xu+LXxXikOM4PjOMkj8xMMyd0vT47vQIqC5qPXI+x444sevbgDdSLAHy3HAqB06q63PMbfPkA6Y2CPL+cWTK2ZrMQrgKqifYfCprVjvRQX5CTNmBlY4Ybfbg0mPsuB98td1WHoC4BMk1GZlP7ok7UGuVYYJO5sondi20B+7AUl00pJJfDUGV90gC9r23yqSLrk94+Czj0U/4RQg9zQuNsaa6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id6Ws+1vmuiK1ZDxksT5x56XfzH86Fg5GkxheV5RRo8=;
 b=AixkWqeg9Wckc9FJsCIQCflykJyEhGIVRzi/p9+OvBCLUUI+Bm9tl99/9KNee/vm65/xcM4Euvds/58BLPE4JGd7K3tb28J8OXVy5KJcULZdABaFFFVZUcXuU9JmoI8t7S5Q9pajSZUgvwB924x5n65Cf7nvVsn+PJ0yj1/z6z8i6MR3wPUK55kgcYrFmLdPC3qqnXsvkjPoCaJy5nxABP2v4U59RRxDpzFr02vM7OQc6c8mmvNDkZwsFT0vmYHzv4QIVBeykk0HMp6mI5tO/ZIBFrh0an1EQJCvNVYiRG6JMvH/aq3w32V3RD2lWN5Y0CGi8V0qfHAY51oarE6LIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id6Ws+1vmuiK1ZDxksT5x56XfzH86Fg5GkxheV5RRo8=;
 b=s8F9AAdl5xjQxYk/xqqpWIrA78VYCPbiN6dR/8WPfiT3rBZSYExOJdDEczzrVbrgAUT0fDndS+r9CWXNRDbJqkFgDFfca4tE1hSNwZqEbHPpqbNQ+RgYuL9GBy9NmDWOLWUwj/cWys9Nnch0lGoZngf0HgpJpL5GHgQ0LvA83eI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 17/19] block: blk_root(): return non-const pointer
Date: Fri, 27 Aug 2021 21:18:06 +0300
Message-Id: <20210827181808.311670-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6fb75f5-87cf-49eb-3738-08d969871b59
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37659080A3CA0699B2942E32C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bRB9YN8Bv9k9I5cTZn0n5e6dOFAv1rj8tWio3INZGEZATpXhwVHnjowZrGhtC06GgrK2P16L2lFU0m1MjQHiOMYvBfB7ER4scVOe4ik60tmhcYDImfmM/VJYwIfBLvh7Ec7UfhhLWb18JnSpkJ0Tn7xFkSzyKPjc73MNjewIZn8VnhIW/oHOiDat8Km53wAQOwJBpkjoQYaQmBvB7GCWaie4EqthH5XIk2WxAz6jP7N6qBXU9hB/ndX6yOFQJzg5DEC9A8Wel+/cJcdx1Qe6GDSzDtb/fSG/ztA3LBqgT+l7Hn3b+70bckQZUZOdBACJKS7dN7KrneqR2KzFED9jXwDwOZZSwiGwL2GmwUGFWvvT4swP4VFupql4q82usf1Bw7V1IDBfeoHUOC4wuqkCG9flMnAlWSpigSiNjdEcywzdywwOGiR0JcynARCX+XW6do/STOHcwfRi47QwEHnDqZtmp/lDIvrvnONL12N5GnnXLdoeuHguSljXEasKKABNcZOfMfCxOw4Zcsn4CsnGkz4OYa/+7vEwDN0w28gP/HuRWuIhPDtQyvbVnIybYxdVQxNhmueGc9OdV/3bxSE9Y+EYKhgeU2JE77mJBu2T88AdF2BkvIBPP9aIlEdWPtQ5SFlueMA0NhAr7unPPgeJcaJqVQOH1VS7ZQPhQGz8G946jMOcmJ2zROp64m1AbrDmri+eigNA2bqjihZUr/LCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2kI8X20elvHFtTafuJN8n4j6fpgboD7tu9xkA2BOv5LmJmIkYAoEkLHFtJA?=
 =?us-ascii?Q?XWc8lz94CD8Vg2wSyqzlIuUJGte0a+hSIBpLtiiAQhZboz4P1it8XAbyKsvK?=
 =?us-ascii?Q?4F39mum9aCesCCImg2/DquOwbEw+tv5FDsM5PDSTuLg+nuVVmpVO1LMkWN0s?=
 =?us-ascii?Q?9L8DoHnUBhHfD262OWKBEVfTlK6yWQCUw+Vqz8qidWJI7c6he3ZpCR6iuEt3?=
 =?us-ascii?Q?TG0qySDdiDK80ndUDHOI71o0fQ+6WDmnk8eI6GNElvAazD6Sqdg4429+MDE8?=
 =?us-ascii?Q?Iv3KesuL7G/0FYdQT+ilh4lJhlvp0CszrL3IohBil12Zl1oMO56ae9ccByrR?=
 =?us-ascii?Q?ztE8hEaHXmKBbf8DKRTpl3TKs1yShErkXXwsCEHFdvo4dT3dXHihouzClv3T?=
 =?us-ascii?Q?NhXU6ZKWFbXz0fmugBfqFmfpO05rsnJwqIe7GjphLIIifBwnnlOeLy1rAK/5?=
 =?us-ascii?Q?xTYKONauuevd/L9WIIv48Ir6fQU/AnQ+Mp+DJknUFN+SHRXOckGoAtuKXJdN?=
 =?us-ascii?Q?0PpEpLODieVFoJ0Xi0clrppNCG3d/ySfe21fJvOn8Sxa0euY4b/npxelQ772?=
 =?us-ascii?Q?4GbpAnHD5q07+58sUMo0mbo2KNgPQiQKx7eXtp14JWKYhWiXf3a7eI3aaBaf?=
 =?us-ascii?Q?zXdt32fXpxjckFqH/pLn1b6hEowYO8iw53IK4Ds8wJTZBmpF9piGWa1bshuh?=
 =?us-ascii?Q?GrFOm19aPP8LQqeNwbNcKvdens6kovEDCdX0SbiXVF91X9ic2ntXbUOnzbJV?=
 =?us-ascii?Q?TN35BqWRD/24fMk/e0/Pfqqcut6Xg+oI4PEhur9wBM8ps9fl2fj8VTriLJNK?=
 =?us-ascii?Q?+3OkIM/iZqzAt1oIpjLKLbelG/GLC4A2+AvnwmR/PI2eQrq6gnFy+av4JjwY?=
 =?us-ascii?Q?AzxRXm6DxflQvs3rBjeE6W2/W4xEhPGXude+DNnF+qRuBexA6926aTbt7IgB?=
 =?us-ascii?Q?/1c3kguamN6biq23D/ABZlMSSVlkKZopv5Zbg+GSbGFK4/VJbrIfPpcqpB6k?=
 =?us-ascii?Q?xmf1IguDHRrCfFfBlnI83jALmoYSAErOnfP4Ps2mnF45NqCHfiTP0oO63rHN?=
 =?us-ascii?Q?INHXkWUBj2hObxpMy+/Xf8yK90ISSoo6BjlrE8NtI3tdlDfCKFsQWM6bgk+F?=
 =?us-ascii?Q?2RdVvt/cA/cc7344ha/YI22zCMTe7oVm6ANq6Umt0z3MVWFDTBaS6s74JQgm?=
 =?us-ascii?Q?3ZNAMSzugGZfJTUny2ePedeAUOu7wmc/MyWM4BHN/EZoqAGqNJkEYm9wKwig?=
 =?us-ascii?Q?u/q9etYlKusEthtQsN5byvlsnckkxcGGuT4Ik6edshQbok8k6On07cKSnFXD?=
 =?us-ascii?Q?1gyFJotxnjHE0i9tUkFarQmK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fb75f5-87cf-49eb-3738-08d969871b59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:45.1502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lK4H9dV8YLYM8Ol9r0xr6A5cJNGLLA/VR9Rzi1Gz+o2H0c0pYjE5G83z1tnIjSQKLpTZNcoPegSLs/0vkOb8Kp901Ozed2Ufx6bs/jtLUdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
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

In the following patch we'll want to pass blk children to block-copy.
Const pointers are not enough. So, return non const pointer from
blk_root().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 29d4fdbf63..5d4dd877b7 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -271,7 +271,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 6140d133e2..b167c630d2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2463,7 +2463,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.29.2


