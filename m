Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88DB58C848
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:21:31 +0200 (CEST)
Received: from localhost ([::1]:57040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1lB-0002Ih-LJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YF-0003eH-Hf; Mon, 08 Aug 2022 08:08:09 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:57061 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1YC-0001TS-67; Mon, 08 Aug 2022 08:08:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcLsM+4pITOHZdukQHNee+JK2BNYGZMc/RMGuZ7F6doW/1ftZCrua28dRCOKZLABsxtNN44aahhUYr6XrSpN4VvttirdVcQ4OAu479cehWG0Df6u3lnVx3zjlKWGhx0HZLOHtA7GO1c86TKrDpZE74mBXl+M3OQnVtQwKK89ev8JpC14NqW3rnuLjmerKpGq6bEWgqGZhjrhXVF/463jgdU+/vy/5ZjBk4u5NqpsQJyB/ZxJSkFm65U9Tk2aP7DLb0cVtmdecSSnW1CYCCBnCNfbusUZs0AMyGFtbTyyAx3fnEdTjBW5blEI1/HjHR4hxI6H+1hlvH5X8dTss+V8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1r3Wuv0aagv+akuD1n+bBJQFK2o1L/CZvJtNzv/Sck=;
 b=dgbhLC2R2EBnp/Q7tR5esmDwiHLctxviREDgIfjKcymtLElfhB8ipn4mo6XFr3MujqcszPW6ecVizlHAEXlmFYuFY45wFVsmc5K11bbK/dctMgJ3qy/EX9s2Aqn14OUYOtQHxpxiIZozyXhznL3Uv1I/Dc2bOjCJU8T1xQz1rQIFC35pIV3KJz5ocQex3w3fhNhe2nueOtu4UJWd5EudDNxoUrdEX1ilm726cv3b18hkOFv+HdNXOH/sC9Am/3sC0JwfNp2F6JEFSK//y+A1Qz9xjdLudRUutcY44EjOHHIS+tX1UVchqDn8wussSIKGi5eApqeJBQEVFA6kEm93zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1r3Wuv0aagv+akuD1n+bBJQFK2o1L/CZvJtNzv/Sck=;
 b=HJHzq2WRRLQU/c+I6d3ExNDHxUYfHUZ29DDjgWzekk6UIm78yvS1WDMPWu3wM2SMD+omYZv+90X8FE8gzOz0CAm3J4gekokgHP4LqlRUAkZqEsoCy60BisSFIO7reXyh95JTlG8hEFjsCGPRKF0chZn2yY1o1jm6oD1nG4fwfxUmRQ3dxTXPKCD/lcp6H8hfrnFKGtSR8eZvouXzippmy4aMmxyup6mmX57+8ydpdP7DWm/vlQT6pwus1S22QZRG6ROK1/yOzpP+geQoc1hTVkciWimug2V136EkCoA9TMc3ZyB7YPu8HYbBzBsIIlk9ZSix9p278wCYt+FINiLj6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:50 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 9/9] parallels: Merge parallels_check_fragmentation to
 parallels_collect_statistics
Date: Mon,  8 Aug 2022 14:07:34 +0200
Message-Id: <20220808120734.1168314-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29f5119-4358-422b-dcc6-08da79369d64
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYfhc1ZlarCQBhq1D5tLEI0Gval0tMoO1WpP/Ic5NK7FNQ2lNlkEF62Q0DP2kNxm1D4knFGOZwXl+K6AkvwrgzXhq0Mt932lI5N7AITLo1rtZ12OoI1HHroOWKLh2K8XO7cF9IPyyyzwQRYDqP9p9EErYQEC35RZ1MgEVxb5FLQmekSyTQepJ2hAnSlupj8xIR6+wSJ5JXCUZr5DCLx/PQIHmDmVD77HYq/d+AQz0EaBR8zZ2QGKGiaE0e6zkE1m5EQ4CIFEJmZQ8G57IoLMKFOkk2Y1ZyciznfCAKbU4fmTLYle5Rn0blwro7EF04/MMW0yUVObxSpAMjwuhb7xDaw/HADKDNJniV9ByX4YFTbsxJlG983ym6GSauN/KHyhtRIXyfW/q00NpVKv684MFpJ2OdUysKqfYLMEoNYAxad2oSpLqTEebKmQNDpX36S+3kqbNm++M5+eSUSXSJFtpHMUxyGGD3ZeFmENy/+zUGM+ppO8beC+3axNHYm3xswluVAeV1RHX4Zt4xgu/dJfo08Pg8Is4a8BssvEHg1y7/eGJfd4+2u7oFVAoMthptH7YYe+t33Aei1xqEhYK9TIOmN6RqSAd5QkOCYTXjMSXcMqxQJtFEjLSGkEW+Uyk0PQMWSajkVHFMHHbDx8P3Gg1IIO2Tnnl7sCshNrHBOQHlhMRwluRo7cf/kP/Do5l3Htv59qT+QvnYVUeNIDo0RM1h410u5wAcbWtvY+Bbf1dZUBa+kGoIvHV0qleUlw53gjBd/e7pHrUoZ+bHlM427AR33+/PyWAyc8fuPKWCqyOzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2cm7tWZQMeiSbwwPZ301n6x0CfKjA9ZGGYQdGwxrcjhdqHOvP83yf9Y9u0Tz?=
 =?us-ascii?Q?UdU0WVP+xn2qQHzHMjFHv0MQF1221Ebo98t7UUifMJXLPZZHpTLNPtYTR8I4?=
 =?us-ascii?Q?XlALM1ISqbUni2IZLt/42Z8K+1Y4/U9TZUmpTDw2I6rycBYVQJJJB1apx5vL?=
 =?us-ascii?Q?EfvSFOh36iKbTanTe+oE7YvNAccN07rJaIxGjbE/Uc6KiqzJpnABGm6+PhG7?=
 =?us-ascii?Q?esPZz2TL+Wn1p5CvD16THLgVRzkcPtgkUU76K4qCT691Y40Qb99+BBpMcdxB?=
 =?us-ascii?Q?fxaNyf4YSQ1g4KrmfYQCYZGiTBPPbv29EAiNbl7Bbx6ZHyFc5k1oKVV94fAK?=
 =?us-ascii?Q?zmmaLWBNFDIsf/4oiVnKH1xGpnhjyI7495utM1JWqBUePEW3HW2U3s7RcSfv?=
 =?us-ascii?Q?9xQ9zFBJL4ordU7ktIZWHv2DJ/G4mkzBkXhxNBxxKdaWn1ynbukfrHErhG/8?=
 =?us-ascii?Q?iefyW72E7ejxY6fDSDTLjNsw4z9VZVwt3s57gYmn9anR0GLZRTHe3l4/KIRp?=
 =?us-ascii?Q?uEnMUjiYbXsY74PXBmT6KaUXaV62x8XJzuuF+Y/4UmuwEdyAE7LYo7uNFPe6?=
 =?us-ascii?Q?ZN0xPr38AIv9kXPGNVhfKJ9nX2vWV5MLOkGMH4oqtVdRvPgIDPTVpFuBx15l?=
 =?us-ascii?Q?T+KdrEU86Kew6cxHM041tRCvOCSkUPZzGxAVqOEh3ozVNY6ID5s4BCO623nQ?=
 =?us-ascii?Q?eZpSQxCdQ2kBeOKAKlybcgiObu7AJvHxqxzU8R9K5qpR5M7JV5GvIUaXeW1/?=
 =?us-ascii?Q?OoMFWo2I11ukvIYqPuEKOtj6x5sA9PoTVyT96GzwMdgfj7i3q8JDLQvTt3KS?=
 =?us-ascii?Q?qoc/HB0bYVpK7JCKu+dpFKbFq4789MQGcMyll3Mrf2Moa/jOOxsRmoEtjkse?=
 =?us-ascii?Q?YWRkt14KcKuIalSuyWPp08ZDGHspe4kmRU9oU/GLRedcSV2KQU/01TURXBCb?=
 =?us-ascii?Q?4G/V2tZ1blyRYiVOf97j/KarDbNqSFrLrSmY3HdVDCxus5OKQkTdxFOC4kmg?=
 =?us-ascii?Q?GFJP5np1324qczlx9zZ4a+I9jt3qhDG1tDFSu/KNPQe18o3jpze/82/QP/lM?=
 =?us-ascii?Q?CM1diCzzjjvZ2c8xxRu9UNkQC/wOC6doK2CZskLCwm+YRWm3G464OtY1yb8x?=
 =?us-ascii?Q?/fO47I40JEUcxW/vZDbnTZstTpvV0ZWLQTp/ZybY74H21gK0aRFs0c9UklOR?=
 =?us-ascii?Q?vSgm2/qmrFsbC/C4D78u56XhddFpaYD7/Mp3583hk3LXsHlq7eVjRtEhLBxy?=
 =?us-ascii?Q?Tl8R/CNOaLELbLWA3ZckVzGtDUQrkj84biNZwQReUY6q+uQNLshToysjh1wM?=
 =?us-ascii?Q?pBFelBd8Fdm+m23U1Pg+KMRYDoJPyPphEycygquIzVxN9D8vPmmuhzTC2uqS?=
 =?us-ascii?Q?1lSWdpVqt56e0jUs/n3vdRjD8zFujwUCmmLa3xzgFNMc4fwNIWCLAK21t4Gf?=
 =?us-ascii?Q?lWfr8/Wb3phJHAvzFm6QcJ4ZeTQFj8awdKSl4QqXnGteaoE5jkM5cDpazDSn?=
 =?us-ascii?Q?B1iforusmwDfx9y5KYPfilaY2cPcESCFsvIyR8PPEhxEg5HmVuQxJt3KEmdy?=
 =?us-ascii?Q?5PinohMRCGrNYARXvDFdYl+5Si09DZ7n4IZDwZH0PXNMDwAa4eF2Ce1v2SFo?=
 =?us-ascii?Q?Fg5wYBmtGtebK/7Zzxw36zg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29f5119-4358-422b-dcc6-08da79369d64
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:50.3267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwDLDsfycGRjOrO3astlHnjwosO0U2kbWPn/7gPREGcZxa6ei6QBFcWW4ig/qJMdKIBIkKAbKajCcaKnX4lel1W4UoSksiE1Va5d6FgRepU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Frgamentation is a part of statistics so it is better to count the statistics
in one function.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 38b1482e81..11597c5dc4 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -530,13 +530,16 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static void parallels_check_fragmentation(BlockDriverState *bs,
-                                          BdrvCheckResult *res,
-                                          BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    uint32_t i;
     int64_t off, prev_off;
+    uint32_t i;
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
@@ -549,24 +552,8 @@ static void parallels_check_fragmentation(BlockDriverState *bs,
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
-    }
 
-}
-
-static void parallels_collect_statistics(BlockDriverState *bs,
-                                         BdrvCheckResult *res,
-                                         BdrvCheckMode fix)
-{
-    BDRVParallelsState *s = bs->opaque;
-    uint32_t i;
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
-    for (i = 0; i < s->bat_size; i++) {
-        if (bat2sect(s, i) != 0) {
-            res->bfi.allocated_clusters++;
-        }
+        res->bfi.allocated_clusters++;
     }
 }
 
@@ -591,8 +578,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return ret;
     }
 
-    parallels_check_fragmentation(bs, res, fix);
-
     parallels_collect_statistics(bs, res, fix);
 
     return 0;
-- 
2.34.1


