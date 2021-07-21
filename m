Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305993D10DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:08:02 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CtF-00064X-63
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqM-0002MN-43; Wed, 21 Jul 2021 10:05:02 -0400
Received: from mail-eopbgr80105.outbound.protection.outlook.com
 ([40.107.8.105]:17431 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6CqJ-0007Ca-IW; Wed, 21 Jul 2021 10:05:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdioR2sZYXug/v5pz37j5NmnNMk4ow+gikXFTKKuA1gO6NuzRKBMCyElHylHnhIB9qJyjewmQQ6M8nqnv78qE/NsZgs6lEFPj8REUNcRMmdYEto5m2tsOeBwCDmeyamLWRGl6iSyKLcV3TtFQkRAiFA/qPfQznRxlHHJokgyuGXfbNY0GlBZYpsnK1Lvism36GMgDv9ahY6lz7Cg0/oq7a47If+yOtqFpWXDoBzvMS307uAw4OAUTPOfWkbMtsAR0hk2N1FQfRNf47GcohMRbiV3dNyjaLimxdUy08csydvfiPfr6dnbPKb1RzkGgX6jfTKC2CBxyL8QtLhFBVXPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id6Ws+1vmuiK1ZDxksT5x56XfzH86Fg5GkxheV5RRo8=;
 b=hBOSlaNkEHChfu1zgSjupCeu2Gf24ihyKwitYzUZllWTJ5zssPeRvbsJBZtE+QgnV9cXITmP3ih5/97l3m+QAfjFA4y7X9THkFBH9C/Rm9ZGoIEGs03AyAjhNPZQuTC8O7BUy38DZghSO69D4HIOHnM7qBbF8lwarZ+fzMnMGtO0xzo/B38niMo2PHVETIqSbjwky0/kQQD6UlXMagPDjVD5ZW7EnOl7cXldPfnr15mwjIiSV/0qiPIb+xd0BooJGEYnoHjNfPofRDMsjew2RSCHT59DM5cqeVI0Qj8qvfVRgXexV2pfYn966E7gBOPJKFym3d1JC+iSxCK6Qac6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id6Ws+1vmuiK1ZDxksT5x56XfzH86Fg5GkxheV5RRo8=;
 b=usANF9acu0wkTVCnHm5K70e937M6B5ZJkA/sFM6NS4Yxm2hJK5yItxlGMyUJb/y6baV2oIftbYOJKDXBP16Jivjq1cYPEXiNxkkBTZmsI3p7PUVxkngwRpq9Q/EkekT5clroYQW3JhXF9V99Op3Oz+BhlxyO6hRhqUYImi/FsEs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 14:04:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 14:04:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 xiechanglong.d@gmail.com, wencongyang2@huawei.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v2 4/6] block: blk_root(): return non-const pointer
Date: Wed, 21 Jul 2021 17:04:22 +0300
Message-Id: <20210721140424.163701-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721140424.163701-1-vsementsov@virtuozzo.com>
References: <20210721140424.163701-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 14:04:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9c58a65-6c62-4038-1974-08d94c507de4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63744411621830A477E4994DC1E39@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGzAnvj2RDdqgVYHden/SUi6hxSCpI11s6Ni398bam5e6P/jJitG1r8a9RHoaSCxrXXUYQVYEn1G+Arhi+hqkBhhw+R5wKtY1f3HRuQaNvbO7Lc3zt3dPZmJV6BOGhns8rXVWZ3btbgLIZM0FdDV63V/qhqZ7hnzw/ijiqYENqQnqMIu3H7TIPYdTKchAVBUAcwqelp0/wFSWBROG2eH72cTBApYqUptoN97BKmuqFZ9LtlG2XXjVmlz7XX1QQp1PLJGZcqUJh4UQXoS1zQzLPKrWyViunDee137EQ6Nfp6XGGwyu8QReUy5EnZbG4BAp2vbVcy/hj815s+V8WcOjx2vxfW6EkJuVMFXaJoPQl2FPLyVbpxdc5yEPFBFtFJkRAflMleCKUNos3NCy6dIyC9yJfV8/rLvyXBMgeqsWXyBApT+SRltPKy5P90a/+S1zOwMZfMqJyRIc+knXZOV4EraxRzfjWLM2oNRxMRW9u2l/Ut+DDu8KXEI7T+P0EDXNL/wd0ewCVVrvZEtOm/dFbf4Xt/31IU/xKnljDxVPK4eIOt7jNuxpqgqrBVAX+3r6qQ/cQ4qdO/Zroo6qVoM72tlMmk95KULviEU4YT1p6YXnELY54F9czSsusbKU+IZfIFA0W+fEucBV7cF7D1wfP3blIH6MiQv4m4oCsrUFrBCGqEqAqJAll/3SYxJylw7YqYfH+mRrAvhCotjgDaE8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39840400004)(376002)(38100700002)(5660300002)(52116002)(38350700002)(2906002)(83380400001)(956004)(1076003)(6506007)(6916009)(316002)(6666004)(66946007)(66476007)(66556008)(478600001)(186003)(4326008)(36756003)(6512007)(86362001)(26005)(8936002)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ay/K7qw6y/pF3I9BXxO611GmiUKJuEm5PKph/nqOb3bSYNWx5YDV8WZziSZh?=
 =?us-ascii?Q?xmWpn1JydyldmyVkiyOn8uGF4hiN0md1yMl2Fy4Eo+aT2e/OfNXXHhb8cDxY?=
 =?us-ascii?Q?aCsOlX9SDbF/yadPq26Q2XYtN9Mw/qgsBtQstzvy3dvers7FMur8IB2nLE2Z?=
 =?us-ascii?Q?FJOSgTpuzfozRI06XZHLvUDTSr3Md6ZfPH+hBDgP+BO+uXgW0YdsYRNd2UMY?=
 =?us-ascii?Q?TZPUbRFSBqRhOAdr0U5H0z9RazvRTAh6chMkbnv20sgRyOWaW3Hkgbty7bN+?=
 =?us-ascii?Q?S8Wh6XcJ1ibqxO2xxGH1fuld1qdtgIVVPtKpm6M8gD8u8KfCBxBprG9s6xMY?=
 =?us-ascii?Q?iVe6pHkzhWicWxlVvahGcQHOAbuzes5zoAhjYGvSBHAZVK6RcI7IJ7VHQjEP?=
 =?us-ascii?Q?ILiXe4eQuboDL/d7tPynxSNHZFWl2TYLQVYxTGxLVSa9T+Rvg0EX4/5S4Qux?=
 =?us-ascii?Q?FXXWeeK8D8JK7QZhvUODYECuDKvDjnpLdYScUEz5X52hn82B8dBTRxzinkou?=
 =?us-ascii?Q?QqHRode+ORi7P/j63H1xV2cnwkyka00yEzTzw8h7l37VgrAI4xmM049/VR4Q?=
 =?us-ascii?Q?ZnJdJRpP0hti2/NiOW7JAwAXMffNtO3TM+AeDutCZhzOwnO4lv0QAqFlXUV0?=
 =?us-ascii?Q?CMgqhbzxyWjeP+1M00vXvosiXtbuYjC9Zl48QX2Pnxk79zaoay6St1LZqsGV?=
 =?us-ascii?Q?5gfdUz/WEjHqCozNgsKOqr3MZbc4J4erWhUlNhMh/1fZfAmYiiOJxjOpYAvx?=
 =?us-ascii?Q?5AkyI3KRGjfxmB36Bk0p0ETnqMhJ8kaES4QUQzBDPy3kkuRRSp46rZKNS/wb?=
 =?us-ascii?Q?T7t8m/hlyVV+m7NyufGy+ArQw3F2hnW0Vkx4l2eYfWMJM1uN+UqCvsG3cMat?=
 =?us-ascii?Q?+c8AS5VGLt+lhCFkUXnpMpAshxMgPwZm1tO5XRnQyLkbdM3LyVxZlJZO/K2r?=
 =?us-ascii?Q?oDtLVNprZ2x/QsAtqWjNEngVUvGHrM1PCHq7TZmEVhimpIwDX9hyTSNOpviH?=
 =?us-ascii?Q?bg/Yt2MeiHEH7aUIO8YXFx6NmV1OVkwoNNG7XQ3d9k/fatOo4RWK3OyT9g4v?=
 =?us-ascii?Q?Ub2KbU9RDUO5BCGztIIYpO7mY9wkwmoCJQ93e20XfEvNdUabXDP59p9btjk9?=
 =?us-ascii?Q?uYiUfaBfZQYVxpcHSGqhKLgkttsGmnlkIpYDMjpRASyk6cbvQzq1PlcZ86hM?=
 =?us-ascii?Q?fRQ180Z+u8xiW/EYSycqNesO0DJfROjOLIZc+LcWbQIYlc35PbasjsI1Xfdd?=
 =?us-ascii?Q?UofLWmzFM3nu2YCysw5I66rvDb7ntmSVHGi9VqdENgxFWQf2KC4QKG9bpcbu?=
 =?us-ascii?Q?nrSKHRityv+qMFDdAaxiyzSp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c58a65-6c62-4038-1974-08d94c507de4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 14:04:44.4493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXy+8zy5yZtswD4qlBihm+tngm88YOiABSVGmBlvJxlIP9Nf0XSeqhlj3wWNbty3YxLJ2oKGqfWWV6ph4jUGNgGMNi1SW45+A2Uqy/5hRaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.8.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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


