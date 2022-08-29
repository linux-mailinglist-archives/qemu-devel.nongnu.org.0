Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F485A4633
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:37:37 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbD6-0000QW-Ay
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0j-00062J-A8; Mon, 29 Aug 2022 05:24:49 -0400
Received: from mail-db8eur05on2109.outbound.protection.outlook.com
 ([40.107.20.109]:39455 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0h-0006h6-HU; Mon, 29 Aug 2022 05:24:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+QIrntkg2X6GYQ9y3IUTGW5dm/HXTurGdl66Am/IT+5+Mslk16o2uZKfD2d16vhnKBk33aQRkITRc273J3idhyxF7UZzUmAOorxs0OB6QiR6eeCec4mefW/GvwaRzBqVKKnmFSFINfl0qunNpPGL1vhkmy+bAeH3Pwev60T7Gl9jfi9TMpXxwUIiCw1/kshyEcH73cR6228sh+gk8C9dNhzmTo2rjN08zWOeUogyPGrZcTZk/j6x1nUBoTF7zbyZSGbttvQxDF18rjNh8GJOSOfMtREbWHYgSUhp03SwikTjjKP511SXZkXDFyRrRNrlL6za4NDCFQlD8ULnQAX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4Te2roYcHG1HhYssh3Reheea3kGA2fWHp/VW6Fo1bc=;
 b=fKL/t0mF+z+0lfTBwKOc6mUJLFsq23BF9anlaGigYbyZ3vrM+HQbSobkosoNGaScpvqNKTdfTtYuhNI5+p91YBb71/4xbzJTEtqpjXB5LAlo7po1myDn3glbKsvju8oBw/h3MHmU1sGx4Y+LP+DQxm6EK9Xfx7sOkYzz9oUFADY1W4f0Mll2SwMoLozDCtk17r7piJvqOWvqOoVGMMdLNHnlbpzfCkUh53V180CM1uDNkN0oPqQrkbSuGoMON1MbxbOsh6M4uXExtqrl9dNUestcS38owmYHpYHu05bvn7NRd7P9Sza/cKct2tUtBoaXlCEo8zHeFpWBfi6LAxzN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4Te2roYcHG1HhYssh3Reheea3kGA2fWHp/VW6Fo1bc=;
 b=zMODTQEd70JdxWRwwsU6PXoaD53DpQrHsJaUtn8TRwtGU3jAcQ8vpsP79jaCG8jItEOhBfN2tNu3GODIERF9U3iscN155XT1gB58RlRK/cC9kDn5HUnObCS7T4yBIkZjpBYkyajqUKHhXrMDgEtR7AjAVLgyJCxb0L8XF6GLRxmv3RTft1y//HfuMZFrYP083ZlfQs7/7tG+JhAsQ79roFsusbU18IjINXOUOyRWCXD85JFQGjaEBp4eZe7vUfLNumSmrpZ0K35W4Y5WH2B59xxC+ShV6hxR9Tig/ioMOjTXoJ8KW77n+SKS/gsGVjxCF3MGQQ7s/MmTDZ2WznRm1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 08/10] parallels: Move check of leaks to a separate function
Date: Mon, 29 Aug 2022 11:24:17 +0200
Message-Id: <20220829092420.341050-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8abcabd-088e-44a2-7463-08da89a04914
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZQwMbvflz3Yy5pRqwdYJrFuZ0qPPlzb1ZAvQt0iaHaWPewdqhusTcV1M34Um8e5pgC3P0IIngRXCTNM+dpK5gma7ZwVATmjIv7BC8fY58GsR3LrxhDW8fdjul6GPg85d1VAyhevs4hvz1xfrbzlX4IiVbSQ+N5FTcNN9oDY2vQFppEUXb67cn3NwsS4vn91GR2GowgsSEu5C/2eMv9X48hpXj7jlte8yVn8OsSbon7cQ+LuzbTXo4QfIgrbBigfOCoMq2WWXfYirLNuRP99QnAdsWiLIJTBzV5xlFPxa8TQcFVCErDb0LIQsuJPIOUCw8BxqvRu5jMzztWti9CsjMV0sl1NsuOXGrxQLeGIOQrvjb9ZiIKfDjSnSHRJ5d34yvRLwCl3BNC3zHO23sBoJj+1KmrKY1gUBDiRCAM7rV7IBRx/JWbWbQVh65KF8RvRYG1nFhZBusMfv8w1mTuaCP/3Z9tS707pGKtlwGDCO+tlodU7/RD3QxcghNcSp0xmm/JoGwc6+Voe0TGQioYn7tqdWQamSBWGs6D/21OmAs9NHXWLDWlTg2aqzmZLIwSKM/y6TYMPyj48yc1TKwle+UFEDDYSXhx4tPUuTSfc/TXf1c29FjDHKr4aV3f6JhnblQOf+mPYAzNDwwmmj3Ut/WXYcu/BEbOFJb4BTAcFvZbEeoCFnwzEIUNNwsD1+UFoLBqqPvfwkML7HGVwwos+MzIeuA5VprLgLFurjq1jslDG2I/Bxuwgzp2Yi5tx4gduPR9T/Ttd7m7HqUEkWuV9SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WX6CALXCLgz2yMibelrDa9o5fuQBEgJBYbH7S36KXeNLSzaOWc0KiIz8P2a7?=
 =?us-ascii?Q?bZFhfC6mZtnUW5OZv6uIThymubl4pnjNlqvirve6DBJGseR37wrJDq3p6ZRq?=
 =?us-ascii?Q?Yecj7R75cUs+9rHDpYEegD6GTnLtbJzbPbzW9rz4CB1WTFD4nj5hzaovQhAy?=
 =?us-ascii?Q?6qzaDLcQpb5Xq7U8YqydpDivfJcFFH6jYW/tA7UgOXdbeWQz4mNI69aMdK7G?=
 =?us-ascii?Q?tdlNdU//CzgXh35ywL3loaTedk6r7ZpRlbtzQxOs7zfE7PeQaKtpui9PDZKy?=
 =?us-ascii?Q?g6GjB/01Q0SFHhaUm0IMoEB95T51hkD3qgu4StByxKX/YJmwMRbulqEJvEzS?=
 =?us-ascii?Q?cmjjbxS5G3XKPoYlZI7ukz00+T9QOndKp+m9xVuGH+0pEeMWRV2ZFbMCY5pw?=
 =?us-ascii?Q?Gc9M+ZHnN84ZupnC88Hr1FPpGAxSUn/7D7ot0WV9k+eaU8fFZRWqpZp6nsjZ?=
 =?us-ascii?Q?NIgrbeu5okM6cgptuihnRYb9tV24v86YE3fm5B8xbv367/Ckxhw9xfhZd7pW?=
 =?us-ascii?Q?dT1x6YXpH7Lldx/DGBWjf8+Ja9gjUpBH2oSH2crcKfr8JMPbbvYflL/ZQACu?=
 =?us-ascii?Q?8z8L5ONLZ6VMnN31J48tYrdLmy9RlFp9XCntsei/BLfcSJho/NDxnsLUrmJE?=
 =?us-ascii?Q?ZX/+ZPvkudin534i2ldBKj+i4TUzx2M3nfrenqvf+xQmjjP89Dk5/GxFlSyt?=
 =?us-ascii?Q?fe/FhMsbb/NT97/Yg9NXFv06KGyiWMVtZrKmBbv0pfxI2GM5eTu76dACvMjO?=
 =?us-ascii?Q?KzJJ6i3I3OEDGHe2H4CFT6qsZzvA3Ad4VM1g89h65oZKio9Xyu2QeEIUN4Au?=
 =?us-ascii?Q?oNrz8vmd2yi3sBcxHXnIK49zHrB2Omiu0ryPa+JSVYBCp20kswQ1DURlZzBn?=
 =?us-ascii?Q?M49XecrCximV9wXuQvdXpkBVPuY8tTG0jd+YKo7iaaqVc6xY7cNAiidEovAM?=
 =?us-ascii?Q?SxzrqoUgzTSTcQVoxrABkcD7lmXDFYOD2EwdGIc8z6iQ00hdsKu3ejLo7WdY?=
 =?us-ascii?Q?CPNmppGRL4ahUvdIPAhIiHNgrB09EeK/hO1LnhjL+8ywSyVCvP1WG8bS9Zs/?=
 =?us-ascii?Q?pCSPcTT+bNVgqQDSD8U6QMANUrw0uWjdj6cQhKyCNdQpNaOUzA5UPwd7D/7z?=
 =?us-ascii?Q?trewfKlfJAko4IIbkPnw6U6guz+4pJBwDxTZ5IcHC0e+WVrhhHwelqOaO9N6?=
 =?us-ascii?Q?YBd3/r57Djd/yHijvEPpnbz5+Sw7vtLLoO5igGkK7KzlbGmsdsCnm+/AkFAE?=
 =?us-ascii?Q?xENs9dWgKeF6KmskA5d6ZX4pFjUmdwyoR3yo7D5IX1IT2GfutEsSHtEer3ev?=
 =?us-ascii?Q?jF9eFj0CX3aT5hBlUHy8XB6nQlE83AjjZkpihrE2oKjIJGGakAfrDdfws7tx?=
 =?us-ascii?Q?l9lYXAX/8D6RZT6/nqOLOZAJSNRrC74zOX+kPGSzcOP0YmLhOSkq/sxvQTHm?=
 =?us-ascii?Q?96ut/8CBC2wepG3xGwvSxnUh7DJ5g9xOM49CE4wxb8pX2ep9nm+t8unehpQe?=
 =?us-ascii?Q?1P9tBkDQwDVyqe7kJqPhhkRrzuU4Tws0S/tEB6cOk+c+9KO3qkEy+Rpt++BX?=
 =?us-ascii?Q?PVRsEmQJC4u7k1eJqdMy4q44ReKTOGQsABwt9hfbW+dqShRHy4uzBw0WuPaP?=
 =?us-ascii?Q?Uz/MutNtZKhkPn7aZGEyrvY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8abcabd-088e-44a2-7463-08da89a04914
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:34.0977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUcwc2hSG9ZlrcZZAPlUGda+roWRX/pObVB501/cyyTSIhLUejaOjnGBGTV2Ceioj+qwt2qzqmYTEr3dJG87ccO3flK9ByQcVnWNqI6x8e8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 84 +++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 32 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f50cd232aa..1874045c51 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -475,14 +475,14 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret;
+    int64_t size, off, high_off, count;
     uint32_t i;
+    int ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -490,41 +490,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > high_off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -542,12 +517,57 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
 
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t prev_off;
+    int ret;
+    uint32_t i;
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
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
+        }
+
+        res->bfi.allocated_clusters++;
+
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
+
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


