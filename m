Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1C75A14BC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:44:54 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE6C-0001gv-2X
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtW-0000dv-9c; Thu, 25 Aug 2022 10:31:42 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:64553 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtT-0004oN-NY; Thu, 25 Aug 2022 10:31:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD8DgZVP/8VAQ4CmKXaz4t4AcV7lm52xh4nVCKejD3d9cUcCD/LVPrQH5jn5t9xYxRZbIU7UeY9bxVCk5sDTBGmcgnY+tukp1qTHEoLifJL2Yce3w/GRPI0RZGIWaPy7rlDWTXzAZMZd9YhXQiNd+YiDZWhUl5AYZwXev6jVN5+fih4ZelZjo2CFnxs5BEaFEpcdu7/9Qf6tRHnbKwLvQe/V1/dUUPWIfCqi+TDR1zf1OnE9Z19hxika9TiiR9OFONrS7swec60I0CQvGfiO4ZChaWLoNkFTTjWYUSXw+s7XJF1lkkurqnIAus7kVLLU+bf4kstcTdlGGdzU3tGMZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RLosViAbk8qUg9WFjEWcSmxFxVuJbbxPqveCA4kGgY=;
 b=gf6a+SjsxcrvBEY5Chq/nZP9O7dqXLk+R7seaEgIMNcOmGYmiasVXG8sYz3N6OSCzrjyqWlNd63gJlUWSx0KrwBvJm6gdmmZIFPx0B3dLZJcLkeEHX4wAi96So1TchMJt72ZzSFajACx/dy9Pmn7pM6pPmfMaTlenYQ5B53nvGGL9uzRzBmfTAdSKH3GbRqg5GKkkBdcwZtzDhMvnzYfsAk1CGWpBJq6TPzdM29hPQY3Hnk+pbWqzei+yGc3IEXpfMQMNfNuKJAc01e27446XhXunzQgBUwCE2ugXUI7vmBsPWb2yjvhZgODpsaJ/hJxbgD7W5Px9d+Gm6BqQu50Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RLosViAbk8qUg9WFjEWcSmxFxVuJbbxPqveCA4kGgY=;
 b=nTq94feWYACMPKT9iq1sLfoAQQ2Qw2iNrNZAkK0fmXRBjgKraJsauLjxrwIRIDjeBcBi7oI+SDFn8wy6mpAeZnEYnxPREOfED6tLJflVQPUJi6dA0GJsE+nwCt+fxCJzov9b3LBZc/I3xYe7uKbomCkIlIPe7hAIPftbawVKeG1+L/WLKRtquxVJHHwRVcJPBLPSXQ27SfEIGxTl8fgGFiqPC2X7pGlBEnBy61t7z8kmSgO4WOlDer8vIPWXRMb9bc9qG7SpJMyEvF3HpmAcObm4Hy8r4uOz3PqsnIO0HnIT/z9wPzmcw8bTqLDIryU8Fmqio99MhdBmvnJiuJjhYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:23 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:23 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 08/10] parallels: Move check of leaks to a separate function
Date: Thu, 25 Aug 2022 16:31:07 +0200
Message-Id: <20220825143109.176582-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 241a1a87-05f0-49a3-a024-08da86a67c36
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsAt0xEolwig5gqZ9UsFeaQViq2VgzdMnS3RtQtNrDDUDkkAZVxvQbyggLyQXgp4pjzwbL/Vd6TXt0tQ/AbMJEhYxdZSxyiYwmUoQokaiB8YCw5vw/tXqje7IV5pvKLFy6GMNkDeUMKXujf2PuDNrGGm4E0855VWzI7TbXaM3Kk4zu8l1rmaMcxUsvgHlO03/6gzbloY9RnIqH5zOYhs1kFWOlomlx+smw496aSQJTNbT5yHb3BLuZY5argztCJdmyrAb69hWZmWe8K1YeBTkwvfdfNFiPHRq0ufXNWlOKQAdU7aICHB+ACq84QItRCuqHXr+2GJNrxPL71cXH/eCrvnFDpSUyrAmsctM/rJ3QtSW2gTo+8lO6rvoucXthlIs2SlbHRjb/IlAV14zPRJsl8cBtLNUVsaHmZYSyn+LZBMIqTcauq8aPskU949QQ6itT2gMcf//ygNzTuu1BOA7c8gSF5YIUr2f9p7Ul36IsYaSD7IER3RBIDZDbSQPzNFrbjqdeAIL5RTzcTNIhhh19iZtb68A883xAwkRxvZV5i8c4sesCK1/NFCyvp8UpXcN3cd+PohCrWJ/qO1TgnC/fjDTcfoyOFJyopE0NJSmuUpOYzy5xkEIzY/uycXeL4SzhCV0ojFNCX1CTYfk9wkFkb51nS8iZwsBS/xKMZ96uLegjbbkyUZV2z6IvZOZb8nS25BkK7cKwxGM8k32kx1uaTPi73UBIPrG/P9AXFeWPRBQg3wJSPc1axR9KM7ptM02hDVHi6gxjZP/wkzHm7LTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9BYcu6X5wnYkzcqIqAv/3SQ+Tt+eQDe2sOoZkh/5Q2MV/tXHsWb/XMDUwDA1?=
 =?us-ascii?Q?vUh+VgDImZDXj/J2lR956ZrHgG7VKeAx6Vcsgibg4of3jPy46dE6iYVLbu43?=
 =?us-ascii?Q?hSFqfNEy0KgKUR3H4P6mtfip9Q48rB3u5fsVZpMwglEZn1AfrBRgG3SfdJO5?=
 =?us-ascii?Q?mG6+gyqTwry38MvyD7KTMwSPFNYYUFwALQUJelpbovAgLswh/c0zTh1lNHXt?=
 =?us-ascii?Q?csS2xZSHzrSN1jshmv1wD/f5HPZLNXtpT2qTL24PihopaKfLPoIlEHaPYu+Y?=
 =?us-ascii?Q?2NrCBsjMlzlTt4LzmHyQc2vLbkevS4CCHHZ3/4EeCrhTpTd9F3khvTCsDz0S?=
 =?us-ascii?Q?qeYqA9eP6pxTnnE/nyabQcWn/iIZmvAi6J8fWiSODn5bYv7aUASpICUK2mVc?=
 =?us-ascii?Q?+qfwlszeleg71PpXf8lLuQGkxCLVPf7qWoTlpQEBesJTKTraHoh8TZFNnGYN?=
 =?us-ascii?Q?qKuk/EYaGrRldaNhwcjeKqiEK1oLdDGCTrnIC1z/lV9Ho0wuaX/Ibrpw4TGV?=
 =?us-ascii?Q?VFXNx+KoNakykhzLcfkWVqdzJnZJLL5gohnfljQY+ne0UL4Nr0TzF9lUFaqX?=
 =?us-ascii?Q?twZrA8HLd20R/G6ho+l96sF7H8VaY4EJUQcF0OrUqG/X4fkNJohjRDCHlIaw?=
 =?us-ascii?Q?sM4+lyjLtiuoPhRmD8TpfXFt1Z0+rrm0JAjvjrqaS0uvKqm7BqX0Y67ZkdDr?=
 =?us-ascii?Q?Ulu19SJjVJC/m8Q+QOqkuzLk4io4tRlZkJM5AWpPdnyfEeYXknwRDHyd4Twu?=
 =?us-ascii?Q?boQvjCu55VG9m2kTbOXReHiIpfIHAdJNMUGgwHMl3Rlh6TOQY7ep57iSXUfr?=
 =?us-ascii?Q?qzE/BAGQRX/bbappXWZqshp7SH2rlCksM6SKDk6zhY//6EqlOUW5F6HXqcV6?=
 =?us-ascii?Q?svqv7SgHzOxlMQte4Hkmg3XnwFUHkTPzTqtIo1C2MIbZy63E2+u3D8mn0ptl?=
 =?us-ascii?Q?vwneTlg5Zby9umEOM71mIEfaOv6Qz4E6ABGXPP2ntz09yE74VpPrYYjj0HFu?=
 =?us-ascii?Q?GaTQpmoJBCIdKRnY51IbvS05Jf0aXwMV5eun021EhX7KTu5ZqfL6jvuZsJy3?=
 =?us-ascii?Q?GinSXllqSGtcPVbQUbY0iQf3AlkuY2VoxA8WiJ/rqFKqRLoc1s5XVkqYwxWm?=
 =?us-ascii?Q?vDFQx95ptp/GK7Ngit+jq66hTxnwr0JK28QLiXImACe9QdzQO3zUSSUa2Ddu?=
 =?us-ascii?Q?rAZHeLKYKPObAqmfKh3R+6wE+VkWJ1HU1cTuS2F/iTI9Y00NVJPM30lRXMfz?=
 =?us-ascii?Q?HX5WtJ2dSnq06QP/DHUexHyz9qbjs8AMoqAX2akQQG8Z8GshR/8c0LXAkw1N?=
 =?us-ascii?Q?vkj6iGdprZskXKrjzM8iHT19MzowilFDMmQtOv5Hf8Z27Kktt+PB09WPu8Jx?=
 =?us-ascii?Q?UrkpG2Y+MP3w2Z0aal4oXZ2EMKhDdBR+wbWR1AR4AbvfPiJHrQYHf9Xr3zTZ?=
 =?us-ascii?Q?kwt2ZOBllu53PzRMKjJ+ILk25y+WReuC5iHotCVDY6t1Lwt0ErlIu9SFyHW2?=
 =?us-ascii?Q?9mwqpcGtPGoPGfaYf0aVbqCqMiE+k0fO7L+Y5JciRJUjSt9VOh1qQjFmZU4E?=
 =?us-ascii?Q?wyjGJYnxUx1hRzJcxUk36Xlrpvoboj4byU8a6GBgWnxHHVb54Yd/KlQnTM0M?=
 =?us-ascii?Q?b8n3XTEz9ChRbGvDd3s4C1k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241a1a87-05f0-49a3-a024-08da86a67c36
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:23.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Glw227lemmX2xd4HYmb5nOjpiKpZ3QY15U0zn0Ov7qmFumt6tkHO86hBdfQO+bXv/N45Pbzdom5xpwYryus5e1TO3CzQx4NOAS0an+RJgdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


