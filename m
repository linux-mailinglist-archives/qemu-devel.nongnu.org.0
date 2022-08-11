Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0558FEC6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:06:21 +0200 (CEST)
Received: from localhost ([::1]:44106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9lL-0000AA-WD
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gK-0002YF-2a; Thu, 11 Aug 2022 11:01:08 -0400
Received: from mail-eopbgr130137.outbound.protection.outlook.com
 ([40.107.13.137]:2827 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gG-0003bA-JJ; Thu, 11 Aug 2022 11:01:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRuroLhYdKI8ub+L1gQXGp8jmAieL0SygVVLDF4zhfgP+ABnjsVEJ3kUhl1lzYicyPSwTnMO+rOjl4mlivwsbf23Tl1jXknwAeOsAv/0Yt2bc5cUfmeFXIQcX3vCHFpamLdoRIOFxKenr2DukBV2lb5kRCzlUOyD/Jtk53yImK1McsHeE2f/K2kH/S08tu6Ndwi7Dm4OmAsw+zzA1/v9Hf1BATOFosbbHpOF+Auq0WbJysp53hFMt69TAq4m1jnQI06EDu12o7mAG6LOyAXbicC7tmWY3j2M/XZ+A5S9wBqd6fS7+ZNOinqnVtiWxdWJoHLXF3p4eIrfnMQtrcJp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kC9qoiiTk5aho6nh9kG1e63iqErJ44ltVWzsHb0Z/lE=;
 b=Y1Xs3KDUT9A7XOgSxV0JERubbDlGku7ALsJNtxfRRaR3026icsYigVMQpXlbGl0GSxPTn042lvYIJWceGDB1+/AXKhNg1TWro7i71XpCYGhJ61wjoINWW8O/AN3Oa7JSDbNC81CLVnJDFIylK1nmcviwiNvCnEnFhWXlp+pX8sik/9yLtwPYT2dvDjze+7m7N7+tqW6RcEnzLPIASoxeo0Xixy8QDh0Nw2zjLrPRT825TOFmRXErc0R4r22BowZ6bYbo26v0jXh+swLO1b22koN2fmBREqYWuvQbbovlmmLEy2SCATmzBs8pOrJmOOClgHEqRhoVmftpL0O9f0pffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kC9qoiiTk5aho6nh9kG1e63iqErJ44ltVWzsHb0Z/lE=;
 b=KM+HQK+YflPwNgK8GSuf33B2RsXjxax/sR1wsryVWkQkkIDlETI+KU5Fe3IwvdvYj2Ep47dZGTBy7np/OP0iAyLkF5xpuUgNbUXXxPKDAQsE+ZB3dBRZmY2vJtW73cYiGMMehFKhWgqPhDH8RgxWjUdWxUj+yVTgnZAooXuOkDwgjI4zGLztk99ya4h2SHiuGO3JigWSsPmkPwI+0pQKTiXbHLdyLoYm1nlBAVCyHo2jkDA1n6jEEFuxP+yGr/s1sRH6fWAIJ9gVjcm/TyRVhE92294COw3yCuBGPk7swICziDAL1X5EAsPOOaJYUrkUZupzizVO8vXHg7B1sKBfQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 15:01:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:01:00 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 7/8] parallels: Move statistic collection to a separate
 function
Date: Thu, 11 Aug 2022 17:00:43 +0200
Message-Id: <20220811150044.1704013-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 909deec3-db40-41f0-3643-08da7baa4d79
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yG8eW8Aum8kmY8HNKF26EFSGLFavvf74CNLAb9+5Aag9wagXEIK7e7c/Ojjh823xVBHyKXRsA3GMVilQnqh7sN9f4uh5Z0XQcnkXEuUo1elfbOkGtK0tqBAA7cxRRw8vpnCNeoLWM/LDdlW/0G76V12RmD08nTQufkZlygFrLnGNvs7ZEyCS0RweB5xGD1sXqeZ++i2E1+01Jui76D6R/zwLii9RaVZDsMcZ4bt3vyD4fzWMkaKb/UeEGDizHyMnvMxAdKsezrpMkknQpPHviUSs4NQpaRkU+0jacHj0EPIYAg+skYwmSTkaJF9jNuM05pfZrX5B8i/5hX/2MkOycsX1cMff0W/dhEEPH1qOQD1Eb4VrzvZ9Qd9+qwJXFIrewX107h5ua5GCit6ijbytdCY07Aw8GayTzYXj89/03rPGFWh0Z1TIDYeQ183gNoIktOevh+N01EWDJggNALikv+okMpGMMwS/0gRtg7n6gUhLibWJOsw3cNbcWD0GL/MBCuPuhlTT2J/iGR/vYwPAvoeamI6OAKounOSOzjqSf4j4ATbxAF8xyEnlrpRb20ow62qQHbFcScFoPEac0UdnC6wAghPRKBj7CDeOMT7rDoghuNb7sdsuzih/7VzYnpragV2e19ecEi1SJVSRRFsOvAOQlNkZLHAry61bXYM0oj5ZHMqLv/AMUT3PuMvx+xgIbyglfgAive1RG4ye+4XK3LbdBTmb2g3O1Pw8h+jKgvX2m7bpMkK6NwicNav6K5QGvgpQUOgbaswDFmJBxwEzg5bVTVPNbrl87YEBL1fv1z0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(316002)(44832011)(8676002)(4326008)(66476007)(66946007)(66556008)(8936002)(38100700002)(6512007)(6506007)(36756003)(6666004)(2906002)(38350700002)(86362001)(5660300002)(478600001)(6916009)(6486002)(52116002)(41300700001)(1076003)(186003)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xh8OcxcfeiZvwXTdvfnkNwDnluAuBUkJVcHkr1zq1Co4d3mhPAMsr+zYmIfE?=
 =?us-ascii?Q?hnmRy1emnGDUp953jtoOLHoCmxNDwIAw0aosCYZyPKAcv5O4oZBOSZNnGosQ?=
 =?us-ascii?Q?zao+IwsC3bYN0G6iWWUlrJcH8bJJulXiyZqKWY/sepYMQbdD+IcmfBmRkRrc?=
 =?us-ascii?Q?lHReOzia7C2WGbVFB47lEjBJHMQ+n4KzSkyXSSale8/4cPXL7L4l62LkDW4k?=
 =?us-ascii?Q?kWV1MK4rsMOdVO6KLtPYtoOWemGVAfbzEAifW90Q9Xi4tj/FlYkpGV8Y9ZAl?=
 =?us-ascii?Q?M/X8wzcbL08OOvaSuAXKSdROPnVv2QboL/476plD4/Kvw4wgcoA646/lmyzC?=
 =?us-ascii?Q?IVSUeEpoK/9NeJLnSxGjnQPt6pXuF93xWwAz7IpPMk6E1KFixlQZMwMC+8Ds?=
 =?us-ascii?Q?5/5mv4dsPk9VWl8fsm/iVKtKTFXOyLgLkMeOC5SWFZGd46MORnrIdzoJsYxq?=
 =?us-ascii?Q?Zv9M4DjOySJ1ky3ZelzkucFhKeq6V5jRXqfp55Ox5GJNHmz0birrVBYZnq+c?=
 =?us-ascii?Q?vFnRgJmpIhlufHbq9k66vIHoZm0x1zOgMMWRe+9zWnZeLZehvD7y7FMKUYkO?=
 =?us-ascii?Q?P9N68QB0ZTI3nAJlDFMfxdNQBonPqbNk9a7Kj5UXLz/GvZok6/3YkYY05ALn?=
 =?us-ascii?Q?F3LIu3fvnxauIrxHuWtZkSpTZV7IewYfRRHz71EWSfKPNK87LtAZ9EscV0vk?=
 =?us-ascii?Q?WjjJKry59/w4zqx0QRsU5d1Lw/ijtgOZtMwW1Ub6+nWmty8Q7G+obh+PBxsM?=
 =?us-ascii?Q?vuRb19mDTJti/WKZVjV0JoMukyBllYyRPD44whsHaUXZlnAH+Of4jhoQ28s2?=
 =?us-ascii?Q?3ng/tNoX61jXxzu84qQzTOcUA7uuTdqHuXfO2fWk3rXngC5IwOi7gxRVMlIH?=
 =?us-ascii?Q?AMNJODXjLfb37KIl1YqUnIon2J/aNlT5ncboSQoXL1Bf3FCCky6bKbrKuR9I?=
 =?us-ascii?Q?uruf2hmG1xbGWrV8N/u32dDmuMv8e8zOL87C7BkW0hSX7TNJjl252/eVZhdG?=
 =?us-ascii?Q?G35B0a2rfR1xolI+MgNzetJRXaa4lqSMJGFXCr2EDUna61EYIWU2nhpS84++?=
 =?us-ascii?Q?XrhTGZGc2GiG65KaD84/x9Lr/CKDrmVgBfQYloHCM2gaGrq98zGW2qe7j72/?=
 =?us-ascii?Q?CblTsOS90avGLTTIdU/VSsktv324Kr5HvLkszykUiowl8IEKcmxy1Mlx3/1O?=
 =?us-ascii?Q?ynpHLGVm8i1FN0YECdTY1EIDvOhRx341GrR9Y5FiYPJkB2ONXfpDH8zt3AOd?=
 =?us-ascii?Q?mnIl0oKM+p2wV5zIsGDhEEUO5xk41+7VmrwEPW8GWyAYhgq7XLmO+bRDbfz3?=
 =?us-ascii?Q?ZcCxFXkmLPP9mdM7JA3xC1f24BaOWwDMLeJ4VsxVAmj5gvnGsRdYWquKRe5N?=
 =?us-ascii?Q?55DAz/yebH9X5reFj3AhI5LZJJw6DKUVhefkK2AZh3RxGQLJzmCp7Gk69Iua?=
 =?us-ascii?Q?IL2M9wex/lQ+B0bRlw3n6KIbz4RxDl7/7ZPMDSGanFcZa4xeRNkgxI9zTcHv?=
 =?us-ascii?Q?iSyLBIQUohE6zKUB1LdHiatNmQVNBBWfsQtsxG4f7uHgROGvvZrKYMxVi0bY?=
 =?us-ascii?Q?C1GHfEx0BU5vuoKvNtKRxdXM0hV6y31mI49VSgHqIDh1SDofJEgrfGbPo0OP?=
 =?us-ascii?Q?lrKgEDhe51fKlsP5PNZTtVM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909deec3-db40-41f0-3643-08da7baa4d79
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:01:00.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6UXy3qT3FSQbkwbm4nbG/JvbNEHdEvTX3rTCCd4hOOril9vJ3Fg+jY7Mzd4CUQ5KGIkxDLwCq9HfSZ6JcWEWZTsUfNN+A5KdwIx+s1IHFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.13.137;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

v2: Move fragmentation counting code to this function too.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 54 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8737eadfb4..d0364182bb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -518,48 +518,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


