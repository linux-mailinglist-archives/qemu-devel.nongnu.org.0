Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040D59874D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:23:57 +0200 (CEST)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhNE-0007KI-CO
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEu-0005pT-Dv; Thu, 18 Aug 2022 11:15:22 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:10693 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEr-000726-1m; Thu, 18 Aug 2022 11:15:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ga/Bf/2q8LV+skMbTrq8cslEL0IzKzGP5lSub/uLiouRUYvBK5GHo4E98/OPpUgzzD8HV1Hu61dJ71AbHYMVITCd1PwnGdrrP8t4+3VqtLpHdc1R9qu+V6I+LstgYJQ36+uWNVCWEffJWZYxj89RFwshvEfxPLVyy2WZK0/W+AqJsY6GF2eveY4sn3bnn8GhDtuxm6tlomNf7NWtSD0XejE1BbC9yoSjxEC+uES3hgsYzUi76bGWqz0MiY+k8MSaUyrxwM4zKQ0lQRwfbzDPqPcOgpwVRnI8nFBz2t4R81A320CQ12UIbtlrRqhmFJsT63yFUP/5XzZRkIoTFFValQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCoHrF5ZQlZn/u8sCfQKIc5seuWTtcxwjp35H8WVCkM=;
 b=Na8wfngIwcc5lsPcj1cjVpTt5InLT8UrUGWDw12FSR4ORo2nhF9D51s/JmwSgGNE1F1g+/i7W4bli12nOJQcpcbHJ51l9nl/ms2aE7MSxov8min51xDthAgRV8CsSrwd21Y2hSqqPvlJ02xiaFcrMwv3OSpAAhefC8u8mCjZtz6XYNF5mrElAlOhiYWOKxzC3r73eIzdC+ZXqU0Y1eckge/R01d+BGcGMArfaOnTv4eSFLqEEOFE0zfq6fpzyH10zja2tABu6K5zDo1Abxfctnp+iP7wCTC7prdgu6NuQWCxXVu2GNnjHVestGW0Qwblm1E7xeifuPTBBNTdLSRFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCoHrF5ZQlZn/u8sCfQKIc5seuWTtcxwjp35H8WVCkM=;
 b=arlzI5JPv+hMycwoTZvtdqYXHV+Ry8G+ml7EJkc2idhYuenSxwX/yjqTMi6ripN0itSnF8nl1teGDFxd+xVVM/Xv5TR/QmnakP/8jekAZ3ay/hFvGWljlnzvf95tFgqCX+r/Cf8x3QhFr5cXC9K2A1+5vXYLzS7/9uuwiL8lVHYYr6J73LaBJKuTqf3ZxwESmTj6/3IYPxjDWL60MS1T/TCiuIzAbNMWJvDtbfbaYabZ4hE7EMvpMQoo2jQ33fAU8R+CwKOI/gfQM64Tkt+eONoHot/KHZroMA0wzSyKbawQkTmovd2T7+IRUZjfTLCzHItUrYfkd8+1U2NgR8cxSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3335.eurprd08.prod.outlook.com (2603:10a6:209:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 15:15:12 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:11 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 8/9] parallels: Move statistic collection to a separate
 function
Date: Thu, 18 Aug 2022 17:14:55 +0200
Message-Id: <20220818151456.2118470-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c68329-928e-4131-a576-08da812c71f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OzWw+XFcHwRZTF4K1+thc+ShnCZiuKAUmumBMzbcv8ecsPLFiBr80OzN3FneOI79I+fRzJ1OXQlFL7KSyOGz8WijigEmHuoMiEHG8Mft1ocjeIxp65wOzWgxXmH1gClXIFVIWDGBW4G2IyeHWIiKZozb0vzzkxHpT2bE8vMruqo40AFoN8Lc7T9kXcwZHLcCMx3u8fvK88N92jPD8NW94xdT9e3Y0h3RipFdctBR29kgdSL72udDAuQxjAxtSAuyZ4JcLke8y3DBk+xUNGMdP3pv5nGiws8mcTD5EtmVPWPu2jz+lnaz0Dr61oM7RgkTww2JiN+KFeb8H6xPadvrNY5saz1J/qK/QqkCEnP2Uc8JTvVbW7IRXbo1tKaRc9QEiOWWlhz6uEpRw6B9Bg/hNoFbwXwH8rJJ3so8BIMcRvBFqMcE0z7v0XpQUC+bMOE6FSK4dsRYsUP6CBhGwfqYZ3gRENmkMJZoyMtFSgUhv3nKsgB9dbTNFRfcAPTQ6qI8jndxUJgTEgjvCjzi1MPR83wICYRpUvgDwQUKRQmWaejIpb3Hwgyf5NYaFUciEOKK6pbkjc+q5syENFFK4N1dtdj25oU6F3iuDbcRVdXN8IjY5eZk/zDM4lhbQj05DfGfkZYqTI/FjiwVh2Ykz5D+MYH7iqBoLTwbrIWWO4GMhT7s/4Bq7gYQQtv/L7IJm0O9J/uGM5JZiCHjSPhpZ/Y6o7msMa5WYYzEp9VF6gyuc7gpaWx8BNwtRSTyLT6UxNbh6gHOABweGbzTH1/Ea9OeJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(26005)(2616005)(186003)(1076003)(6512007)(52116002)(41300700001)(38350700002)(6666004)(316002)(86362001)(478600001)(6506007)(38100700002)(6916009)(4326008)(83380400001)(44832011)(6486002)(5660300002)(66946007)(36756003)(66556008)(8676002)(2906002)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nyj3n3+EJY1YmFX4ewvDOQs22fT/kyuwXpQncw6Ylg8Ip/LCx/wvhSOX2UzO?=
 =?us-ascii?Q?W4ekjb7x6iJAt/XI5PZKy3W4OK/S2996lruPPUkPWFNe6QbCYo+lU3CqegZB?=
 =?us-ascii?Q?Q8B1Fj5ncuk8/+gSDq9zXajDfv8BMDXlKjsl0/CjdGvxO5JECzIIhiq3Aagr?=
 =?us-ascii?Q?2T28+oIZCfOTx5KllTuFXa1BNPhCedsRgHk6OLYIJJZez5WH1KBkH1UJQPzX?=
 =?us-ascii?Q?QzzgaCMwjBNw7I0wloJ/RfDki1NNDzfWYTFX3D5jWV1z9i1AV32/zfXG6hHz?=
 =?us-ascii?Q?92H98ZvkcegU5b0ZijrFB8XeZCsgYqZpl1kRnVA89gzSZAeENmZai/GW/DG4?=
 =?us-ascii?Q?1Dy/n9eajkm+xferwjtp5KISsC1hrNIwRoJiGuuiSzOD2SpclAn+20h4IaKP?=
 =?us-ascii?Q?bSoTmcMvQrdHTUKllq2dyUC4MVDSzgb1wp7ot3F4YjgG7ZOfeyJtr5179cUy?=
 =?us-ascii?Q?F2GJlY92iytB64P9vN10ndZOIStadBE7ldRhC1INizA31f9TpwjoL7mV+dtH?=
 =?us-ascii?Q?r4ZPRYv6ORfFExwmLjaGezw1nMLmtiesdrcuEpmx1hh1GpIYU/v4oblsAjOB?=
 =?us-ascii?Q?pKLtVjKtCeHqmSN3yt3pxxY+Taf7lH/tfY5uwWeL2Z+6F6t+9zeqmYJIldk+?=
 =?us-ascii?Q?IMJjm8IAWTqjn9oGlvCTAUx1Z6z1GiCQW67k3lvIciE4rYWsw9iow4XHSG0O?=
 =?us-ascii?Q?F5gycRTqpAK0Dw+RylJXkqsrHlq6HyFI3pihkIVAfuGQMjgbzbcSQm71Il3X?=
 =?us-ascii?Q?vjhZJAdEYCSdkmO7egWOTDF/3U4AVwOnkyO3HVd8EHNUdFrefRct+vfojtpD?=
 =?us-ascii?Q?ZbYzUXr8uHpVVaoojMgyuy2yIcsC/J0dh5nJZLM/ARIJfegaHRaSRC5Z5Gao?=
 =?us-ascii?Q?gg8dWizij2B/DDByHVQlBZv4+HHReREhGd/dj+Rs16O7WbJ3JgIiYC9yd3M3?=
 =?us-ascii?Q?5pLZfwrCZgNU9dWAmZj2vKwOqT5WNLv5tzAWvlz2Fro+Y8atKNlMYxlnqTsT?=
 =?us-ascii?Q?efjYDGvX1Vm0+r4ATwWdvUm1UyRK27XpdZ65pa6TBzHJj2EeoqeKt+5I9vDa?=
 =?us-ascii?Q?nTyYtl4Sy30VSt8eWUcWR0x9cwQ3aJmMtw5So1RkccGWdsqWbrj1MalYZKqD?=
 =?us-ascii?Q?UY1QVRHawZAPwy//pImxm2eTm+jAboGp5RlkMZez6v9m8vaggVeSRypwOVYj?=
 =?us-ascii?Q?pVG4scSCq2JXPp7WH+UNtqwkctXOsOSvuoVOQzBf8Mb2ENNAhLHX8FtAwK9l?=
 =?us-ascii?Q?iduRSfppbRB2qxnVZ/nPMlA75CUwoErY/43jdDkDaS5alF7munSsumErqaaE?=
 =?us-ascii?Q?KZOpwR0SxYahVCrKCnOOspL4eMi+Ck0pF7sJs6TW4O5M4/hgfSeS04lQAPCx?=
 =?us-ascii?Q?zFD9gRsaHLdwJkFH7pnDv65mkRDkBXWDEGA2AlWZS3KN1SWITIqkrs27Xsoj?=
 =?us-ascii?Q?GJLmakGF6DI7by+Oog7M9h/UvF5o4DWBzeeSsLxMg+byQqzeW6qs37BBwU8V?=
 =?us-ascii?Q?fQ8AGqv5mA7lU3+dy/oGJGi+Cw7E5f7sW6n1qS8oeiCONFlcv4HCnDOKKK4T?=
 =?us-ascii?Q?rgZZobi2/q0lREWxxMuoh1iAVNJkE4WB6llPVDCtp/oZQOKOqLel2uhU8/wi?=
 =?us-ascii?Q?rGX99xG7gtuIEV5X9nY4fwA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c68329-928e-4131-a576-08da812c71f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:11.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Cwu2P7NTutK2DkwHh/ikJmk0pVp3jmc443AsPeltX15SQxPvFJ4LacQZMzweS77I66v3+5VXyVrgWRQdjmwru6HILQUntqg2CYXxMwUtBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3335
Received-SPF: pass client-ip=40.107.6.114;
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6a5fe8e5b2..f19e86d5d2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -528,47 +528,56 @@ static int parallels_check_leak(BlockDriverState *bs,
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
-    int ret = 0;
+    int64_t off, prev_off;
     uint32_t i;
 
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
+    int ret = 0;
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


