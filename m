Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5F6EC897
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJf-0006KK-AF; Mon, 24 Apr 2023 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJc-0006Jn-F6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:56 -0400
Received: from mail-db5eur02on20710.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::710]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJa-0002zf-VO
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kryP2crSj6fxEGRIj6WQprtrtqyTooWwoJ5m/oETa2rD9/O8E2i1j5Sm0uSKoi7Zw44JW1xUIB3zvEtiq+TDAZIMRMTmIK4YSllzH/jer6d/rYlA2+7Wc4GoFv9SqH47156bn4ykx9nHb146Hyc2CZH/6MM04BKl8tfgPTf3krTYX4dm4JGXbut1M4/h4rqGNKN6FUzyzb7mHqEEUoSz0wiuIme3I2ysqpj5zljRnJsfKhc0EZqCjrVGoESKtLylkyoyG14Lhq6yUACRRHuWDotliHbwSIVJxK5bS9tAmCrMXOFuQHXqc1X5N9bLZDljHhykvHcR1k/Ok6W8HIuaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK3P1C61R+xQsw5/2/BWqWPfe3WZoCYaX3UuCzBp0Ws=;
 b=l71Sys4+Qqq5rT7NfbFFO3gA6SPuLACvmeUfJvaGtDhcwf6mnd5xTVzcXWj/V4UKzldVTVqumAGFT16RT7woDZOpg0KIllwvxMhhNMsd9X65POZXJOBbmQ/Iq/t1xIcGaI24G4Ef8Zsgv2Vr6+7YzPuwBFA0mRDC6uCGravu9h09xruyByT3Kz4iNM619xWzODTCBPAfJkf1cIFDrUpDokkth6ja7UQ25kVOoVMv1gNZTIbRKJwPAN4oMFDIcrRxklHcwGAzK9CBcS+xok0YhhHUkqPJ0epnBGS/bg71AC1spf9TW1NDi29Mh2lh7cEgnWUqXSl6oMRC3LP3IjMvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK3P1C61R+xQsw5/2/BWqWPfe3WZoCYaX3UuCzBp0Ws=;
 b=hrmtJlsiXwUe8jyozGgUkKcaZLzU65YtHerM1t6O6qkhz0rQsfZK66YFXHWg8fd/as552leSxZCZ6jvthb2pzq/AEa/TmFCd93UDj+10+vaJIIdFSI3MHlik/oCzvvoVU6yq1EMpbsL5OoQQjfYR7nE6PnvoaMlZI9YvI02W1WDfeWRXFMQ4K5BEbCSy6Melu/GM4C7zp2A33daQXcCbF28mxHpwiOBC6/ni1tlxA3gFblePZGMz8xz21kGoySn8jdx0E+glNIHDPdiypcbSfFH4D7aIBlYnmpKPl/5PT+Hhd9WEYKP4ORyvB8W+eJPqEaENRe315YoF+Bcvh+sSHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:47 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:47 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 06/12] parallels: Move check of unclean image to a
 separate function
Date: Mon, 24 Apr 2023 11:16:20 +0200
Message-Id: <20230424091626.195590-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fdf6e3-8cef-4f39-5016-08db44a4a00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X4pLEdJP/L6ZTn+PNtFCUgUMCNYVXnL5eyRse3Ft9cfNBrKbROrtGhn5F5saAZCQzzqtPc1NgLuNMtY2C7xdWffPuCUbTpf6UlYxsfPAVGgQ0HiIT4S6UTmLsazMvG0FpjbGfBky8Z0N3c9/k6CfX2E00oWpmzxgUr697U31iGbb5cROJ5eAY8UosJs4uk1X6kcWQnX/pyVwu/pDXBJ16AoJxGhebfSWlji5SImi7gEKb+HRYOEv0aztos9K2wE/RYrdJpCZpFhpas+gBYOT+SYfTSuuky1z0AJDjqJPZYjaCfnQyCzywmIIfBfSu+Jv+u5RMFTdR3mrPYsEoGi5f6wN1nYxsvmcVGyT3F8XucyFN6KZefn/HNisYuEIlzhSDZ40KBLH2EZcSPK9Ucvw2uyJreQ2lNKEHLi2yH/FAVHgvv+6oKjJGUrTJlJTYb3J8XWK40tbjdaZefdlJIumjvNab+y8/Y6BTh0ZScWCKfzKAUZZpfEGZwleKBbeZ4NPAk21zgHAqNHAh3e5fd5wvDKuIUZTw1+Xkh5AaVvRvQj2whOADXW2JRomDQ/+RITzoqx1UpjLekC341j6eQm4fcLinXIPALakyPq1jDeJ0m0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+dBTqdoTKEUcx4WfjRvUsw1z7pTI89EuDvEuYu/OPeJbmxQbIgqJrPSGixj?=
 =?us-ascii?Q?Y8ocEROal4GbpP2aWxRyNaSdQk+NVhR9h9+4CkCuy4z4CCmG1WDVtkbFWUtf?=
 =?us-ascii?Q?Nlbg3qBgEJy0Sm5yY53UvUAukofd9AJlJQp6RO757X20RCoCLDwW+pnNKS5Q?=
 =?us-ascii?Q?xtTXdmHjILe2aSGwGKWKWt9O0znQQ2fgU9Xu+jOBTX/kdQH07M3odDB9gza7?=
 =?us-ascii?Q?6/Jf7MLpp/BNnYR6ol7Kp4E6zoAAPJsfVzLYUXKILcKEuzDEC5vC0Ca1N5FF?=
 =?us-ascii?Q?LwKsf5+ALPj3n61Pat6reNG9E1Auj2ijMjJGDEB9hH3rRVPgMIGZJfkKoniy?=
 =?us-ascii?Q?r8ghg4dzDxLsvtzVRlbljmNTCZ4yU/aqhXtxrAhY+7Ji4fMcCMi+bc00u9GN?=
 =?us-ascii?Q?77vnDtLjwStfZifqgarskv+haz3b8fGo1eOAyLQD5MOcrCdHemt1L6p21w1l?=
 =?us-ascii?Q?Jc3diLnWAAXfCd2PMVifZfVif8o+eZodsHOQ+yqUttbJNp1FHhEVYpPJYJ4n?=
 =?us-ascii?Q?FX2XuvfwE8QDiY7LErvdLZ4ZUsiIehB78laM6d0o1njwCW9RylMvajfDAwz3?=
 =?us-ascii?Q?NSqLUckPjt8PbdgbbWPLfyAj3WPSw8ayT91FOUWUy4IzghXa0N7zJQj5iO5k?=
 =?us-ascii?Q?zucY72mzEQUEuKvfr2IzurDVGzdcMCs0jFPP0KX/AOvB6aqNHj/POmnRcL12?=
 =?us-ascii?Q?1BvI5H0xEX26jCvNN7xsKs1o4fBM9ZZ7AGMWOaF02UJ0N8yeR3myWEDaGjXU?=
 =?us-ascii?Q?T49srVxgEPcw9QZg0zKYMK9D6GZAKhaNJc4+WEeFP+6Sm6r2jgICmCTtSpir?=
 =?us-ascii?Q?UIN18zhCn2DPmdHd7bvJeKlcWthryM9p/HhthPrM4nKxvZYi8RD1sqHruAbH?=
 =?us-ascii?Q?nDcG8lshIdaQ2kNpGk/inbijtlWdiquGf665MZGu/NZuSooiy+6WgUMNWdnh?=
 =?us-ascii?Q?Hx7yDa6mzh3kOCSK/tDhD1dsGGrPK8fyifcPs1UVD59Gt8XVT1xa1tgK3gjI?=
 =?us-ascii?Q?xBfb10iOeAXTOWWd7RWnYqHMr7AXwFMpmj6YIv1zHEc+PiBZDFlkawPjYU1v?=
 =?us-ascii?Q?t9nPWp1h7ng+tOND+c5xstxFPiaB8G2AcBibQi6I/PnVmkHgO4eMRlT8tH6Y?=
 =?us-ascii?Q?n9oZobxLt44cN5YguIBwPqgj4pnyGxfFLkv1GgneSoTez/NBYfIpqDDoYpIy?=
 =?us-ascii?Q?JJawrlSPCOFbwZZvl1xd9zV2hpTHDYRoLN5bbsFmGFx+R6QcV4ucBEEsrBJt?=
 =?us-ascii?Q?UiMuDbCiuZdIAy27fkbmMAiHMAxHAvO9MxLZu86NktIhbtPP/s1OPpFb9sFp?=
 =?us-ascii?Q?rAFmX+C5GA/tNBMY5tU5dNyRcL3OXBN6SD3k+F70fENS+3HVa7DGnB5LiWp5?=
 =?us-ascii?Q?PPoiVWHhm1KxFCjukSqVJJ0QPQVO2wJUyNWNx9CrLCv6u+FJ+fbLmKclADKu?=
 =?us-ascii?Q?Fd8jRMAiK4kYAAntkY4727isV4sIax75u6Wc5KmwezTnHXxhZvkSlCQ9G/kO?=
 =?us-ascii?Q?7nQ1KtxXJzjyDkzz44ceGndylNfjlxU6hkqwRq6HPxVZb41O9tYoPuod/1rA?=
 =?us-ascii?Q?0/Uer4URKCrX/0c8Vsvv2pRa5RlT+nECKQmA91aP8uYgVjKscrxqE9HJKi6m?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fdf6e3-8cef-4f39-5016-08db44a4a00c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:45.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7Kb3ycPh17Lw8eo8hEqdlhwnEYDlu+SCzEiu9tpuyU5yLvlL9bvgy0TG+HvefjqbbAmZPkkMiAJO2y5B+1JGjKCilbaa34KTHThq4oyRg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::710;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7f076db001..4f14bac616 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -420,6 +420,25 @@ parallels_co_readv(BlockDriverState *bs, int64_t sector_num, int nb_sectors,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn GRAPH_RDLOCK
 parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
@@ -437,16 +456,8 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


