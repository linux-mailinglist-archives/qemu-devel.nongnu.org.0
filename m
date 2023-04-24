Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346DB6EC88A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:17:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJj-0006MH-MJ; Mon, 24 Apr 2023 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJg-0006LD-J2
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:00 -0400
Received: from mail-db5eur02on20710.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::710]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJf-0002zf-5w
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPF6YHnalMO1swxIdR4ec4jrHLeQiZD6f4/T4jcr0CWs2M2azL2UAxerMi1IsalHZ1wzjRSwOTvRAJ8D8FFKsD7KKw0F3Xt4eulsixiffAWEQ9Id9v0YaPfW9LkOgJ5CX3ECrNrOmdAcICDCVrU6uo3kAdc8dx2Nl3hM/4E1mOu0TFMyVlTq84qK3nR38DIFt2d2V3hB8OcotJAGCSXll8f/7uKVNOPDIt/9VsO6VxYCzrl4XSd1Sz4ZhsOumF4vyJSwtrh/M1ffJMNsLp0SitHq5YjrFFG/vpUpEXEFTDWXU1bSk3OovtTn4ZC2prCOXhW3DyGrulVBQI6cX22DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kedXKnE+fbWyxSCs+643SW7HHz6rEerQzrdQaqVHiyQ=;
 b=BZQ2N4CGE/SuibgcEMEbLtSeyG+8Ez5NrEQtl9UOxMElzX837fJWDg+K3OgOC8RkX72O4Ey26QEJe5+2RvLv7RvWd08tI9/1iaK7bA0RqhfHXjKzTQAkJXhwpestVo47XRpl6rHxSRJXK6lcEpxz3sX+chjYCAdUkpOQXgObF805oX9vA9f1TE44e1OzOTUIi5UjqdAcuqXq8SXsi34qmLq6eex/+uRf0hS8/SFrdYvCLyPfz2CD0v88OjWeP2fUF2Qr2/dEh9IN63Vu7lkxQlOY5Zs9uIZHfJCRXhvFYdtP+eEnXnOZPxLHokwHZ5k4cWd8bBUWz5pn4eQ6yRsJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kedXKnE+fbWyxSCs+643SW7HHz6rEerQzrdQaqVHiyQ=;
 b=tgxB2t8p6ZadppavrsLHJch8PAXXWm+FwA5g270q74QZB6KSeXBgl5qE36QEJ5Jff1/VvlMCR6wZIUH9geFTXbWFX+/mJVglqZ1Jlxta8Zgmz/sdfm5K2fPHpH5xA9CPDwSnH3EyqpLhqDA18HD1VI/8XCUbJ5Iphmaixhm2418YaqHEGVmaJgGJWXL230RZYr9cLRprlMeUXszz/jr8kZOX4M3ao/x2ObpmrDnItGJBJGHhWGy+NNcRQM7XEKz5qiwXbCcb5Fkv/RxWNlKGe2Y/NPHG2QcrRbjGE4X1da1xuFArqMBriEnftSorFYEYK/+UMtDF3o2dwn6k5Q4sAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:50 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 11/12] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 24 Apr 2023 11:16:25 +0200
Message-Id: <20230424091626.195590-12-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ec027952-5ce3-45ce-3b28-08db44a4a2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AJ5zxdQSaJH+5LgjBJa4Z7s0yszwG8OnsIDMf/U9DabeEe5JwgmPaG1brgEs1jIpExNw7F13SKf8v7csUSZPRDBF3prGOSyJYsxobxebina8jfsY/0mJQNBZ0z50/CcOlRlsuu1pJaat0aIOPTlyrF6Zaj60DY8wOCZN9U8sficbpofDXfS3gUTK5qbzYxfrvRgXpJH8xLVZ1dQneVn8O6tIEM/xYYRBMli/6WA29gPoIFLgE55TBTK4Kr/HAMQhT2yboSDRLyII6LKFx3CmSB6NVjJvIYFrP349yyvCGzsa91x2+VlNmCuGHy1c6Brtk1dsEkwhEyjOcI7zJT6cdGDV7ajFaxJDZ6IgP2AFyhiLp9MARLRrKKNCOZeyMKCPPpH7aj8tStOKPVKvCJ2Fa29h6LJkhIHTRuUW9LIu5hkTvK3JRll3zJU4LbmYTcior0mJ3+3iIaFl3AePjfirMH/bx5w27raT1G32jm+v4wqBLYjU9eR2XG0oG2gAkap0KJADKJ2hMQdp4RwuiKBDAiGzyGatN9NPbNDkLiNjuJwXpuz+xVtwSw7nxKwNTxzu4qkSTnsFG7bi3MS+oLgJTg18lVus5o9lQzWpCnK5DndzfkmlajqtM1LOFedbkfZ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ur7rdU+1LkBS3yAFq80BPPbFT4eADy2pQaOuw40Qfg/EgaIpCdmjKAA08XJZ?=
 =?us-ascii?Q?ysKcaydpOKi/Dj3rAf/LK4+OcKW2ez72k6Vcz4Q52PNVF2kS8cpowxk87rBt?=
 =?us-ascii?Q?qmvg/H3SfYn7+3DOob9Judxg/Pnq0305jIuqLJZhccSyZv3wK+yWxTvxtoxS?=
 =?us-ascii?Q?4iiiVmBycbF0jxJOZWtVsBPUCfytdORtbfrGMl04jFOpP/mHi+VfPLgUQef2?=
 =?us-ascii?Q?6rCLUKgTuFPvCGCPsuDZ8zA3pQVSgm277gHA06qXrIVhWvKl7714pykd1shB?=
 =?us-ascii?Q?v8v6K9YVQjQJnvbgpQP25yl2Xh1Akdt7RsebmG0VoAUyWc+ttnafy2o235Cm?=
 =?us-ascii?Q?jim7Qg7w8lE3OmehoGeMbcApsueWBJILjMEkUPjJoljv10JW0VRzHupxk5LO?=
 =?us-ascii?Q?eMI/8FDXSFvdS7XNtDsRdOk1JtJBY7uPDakR/C7bXXqN6r3/uZLHjVa55tpp?=
 =?us-ascii?Q?vSTUgQ6nWb0nAbvDyIpTsRHJVylty5m90nMum2EdqvJmelJXIbLS93ZzH4Bu?=
 =?us-ascii?Q?nQpExoEx9lePsvMG/UEbM9gi99J8DvBMh3OO4yf5WCdj9IvNiRUm+6ZqIh9h?=
 =?us-ascii?Q?OqkvfLad07dobYt/yXdXmxX/abIN+jOWrUjUS7N+SCqy/B/62l1+24wcbW+5?=
 =?us-ascii?Q?7etvPH7+7fBzFxI+kvpAZoxv6Jj/WPSSmHqn4CClGZu3Vd3RQoMBG0Kwpaao?=
 =?us-ascii?Q?v9X/RrzpDDJ4Rg8XgkKWM5vW2Fe02p4IG3ZhmX9xG+YSZ1fNb9IG64/SeZ60?=
 =?us-ascii?Q?oFcGUZ3OZQT58Z0gUabkAyql+204pL8Tc54SNQK4IMrR+u+5W5lhUyA017ZA?=
 =?us-ascii?Q?+Zlqzis9BfN08US7OuaySLTv37+3Lx5JQgCeS3qEiDo3XDhVFEXYg2hHoQht?=
 =?us-ascii?Q?SwxDjO9c8PrsDUm9IOntf53BeRedKyZ50prnwMlkrCqhik4j24TI5iv771YL?=
 =?us-ascii?Q?+iygu9q2CvaeaKLb1Wn33udEiU+5F8xLZODprQgdcFpe5wpjB8S7pUqtoFE7?=
 =?us-ascii?Q?7M38mUnR9Lq0XvN32nOaScln7DGNf0pvz4Pl/dFRRMGr4hjmWqinqiL9JYBe?=
 =?us-ascii?Q?tc6OsF+jVQA+wdGLCuDNGJXjhOUEwnHMKFn5dLcawFxmc0zlIsr7TTZ2/P72?=
 =?us-ascii?Q?f6YA+L9ns8KShz00SrZKpmVhvOC8TqSp0if//g5EdAsm8s+oA1bCz7RryQ0b?=
 =?us-ascii?Q?kSfoGcoeqj/pIQUvsoTHe/pjTHA8vzUy+FStIkaL0u8kE/hx/GCQqTLKAp6v?=
 =?us-ascii?Q?34LRhz8omdnm10be0qLvG2DCH3c5jHRSjA+j5NcxzGFlCeDdGxoBcawfa4jg?=
 =?us-ascii?Q?i66SyN0b4MMNz3nclz0y7sJw6hptBvR42WEanHcn35kyXeuaNEl/2KlZsQyg?=
 =?us-ascii?Q?GnJJfyvUeE4tjzYxqRKR1kvQbPsZQwYkPGCrx/fNnnVPnx3i/1BG8ofQheRN?=
 =?us-ascii?Q?GZAd0bn43b+DF47JC0WzGFTHis7gR2SlMuYb5xG2hroNg7xsaXax1oli7u+9?=
 =?us-ascii?Q?PKfLzrN4JUM2sFeqJHrArJtzcoJ4Bnz/sf3JZbV8J1IxeHazk+Z141syf9IK?=
 =?us-ascii?Q?LZeFnamh7paPPQLJCq80KxXrp+tjGKT5wpVG3O5Yr9xfJnYDcM3dDYdn9H5P?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec027952-5ce3-45ce-3b28-08db44a4a2bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:50.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZt2Jzpz2SQwtXrX72GF/FmkgpTWtJzXaG43iE2OWE4NkCRX/QnlgGHRtP6FAya+1r/pR5Y+vWw/gZFuik+akFlaTeepnxM1k1DmPYeGtNU=
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 48ee5224c7..a6a1c7ce0e 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -562,30 +562,25 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


