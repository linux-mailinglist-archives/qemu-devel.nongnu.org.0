Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CD58C830
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:13:03 +0200 (CEST)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1d0-00018e-6n
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y7-0003LB-0E; Mon, 08 Aug 2022 08:07:59 -0400
Received: from mail-eopbgr60099.outbound.protection.outlook.com
 ([40.107.6.99]:57061 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y4-0001TS-DE; Mon, 08 Aug 2022 08:07:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiIaTWxad+Z/I3tsns8+HIiXrqKUpEa29JraKPvzA7b/gYgj18oSUIgelrmveFsnSYz8EdA8jJh9q4IaV76+LeVr6lzHP1TBjT2PbCdeRc/0wlZKnKUsbcOz5SLNGrix/AJcndAWtQ0k49BoBIieZKq0KFl7HT8oVaIdkLnuKmF0Mv8WYONNAUHjMowDsOJMofl2PDH2RC9Y8kkB1D8MEaq60vQGxE/7qpqKG2PVwXbetXO65rlTQRLozEzFVuoo2NyG7oBWLvnTJrzwvCN+KfdbViPmsSoU9YNsenbevL/PG24RFwDl5T7r6RD6ujZAzj9xxmiQkrTnmQuFlLbMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnQBcDLmLO/jBSPAmuZLQWh9gNsQBDW125BevzusMuM=;
 b=U8wuH8M8xKbAmAGTowc0dPuZBybSew8zRY7fBh3kk62al7+gUWmkLmkV3CQM1jNcbJfPppt2hq2xHTiGNel2K0B2GGdwg0by+d/9MfM28bJOYJbYA5iWivHiRvP+THoHLU8dtyExxmRJiJm99BO22u+GWrudRvirs/Ww/jVf+WItmtkR+pKWwgW7khff0NXYM5ZOT7LeLamiITvoE7L3gcpZl9fVIl6IT+ePqUAEMAPg5qD8BZXD9UDDK/k00Rk5jfxmqPLqu+jYSrvejhMCURzaCIPrMF9Is1eJ6CYiC9aLLp/DFXE5Kl1VPGpeJPTwwhBnZsE0Be08Knl6eKO61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnQBcDLmLO/jBSPAmuZLQWh9gNsQBDW125BevzusMuM=;
 b=zAWWzU9oXQNyb3f5hTFWKXoAXEfi23eulYhFxoa0eiTYHLB+qjI6MBQY+foqEV5h5MrbZgEHBZ2nAg51lb4S2ZP1Nou39k6QxzE2aymn+E0rQaeHmiy64jK+3mrXIb281NchYc079UHpsnc0Ucd3/SDHQ4lGgSf0nlwN+S3c5vKebCojqfw3zM5u1ZJO4wb8Cgvv7wwiMiOVXboiBjijwChJWSK2H4GJO4qjlfG4epFTpq6geiuFm12VUV81afOwlJe3NXRRn69MmAZdgw3VFmpUnkoSqC5pxpVvKAtmBR782fcTbpkDTbJlmxl0f4HVN8w0eQiUeMZdy8dzlnURZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:44 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 2/9] parallels: Move check of cluster outside image to a
 separate function
Date: Mon,  8 Aug 2022 14:07:27 +0200
Message-Id: <20220808120734.1168314-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8871d6fe-8432-45e9-6332-08da79369a02
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: imRmzQhrJTpXUa8uOfjOfMeZSOw5dOppFsrsyVuE8cjBV9rOsf7N4GTJMdNEfN8/ntF8umt+RPAiwiu/QdgG2Tnln9TAIoFGTkLdRPRpLAyjQKfyLa7EpSGFLijiW9Hd3ZzX9FX5u42UneuvcS9h3/ltMI/ZQu96Oh2YWqq8BERtZtZsWFoAUOg1sy7dWqKhLFi/FzMMsJCAkmjGMle+32q9r7zdkZfzM2ow7Cjm10dT1yYQQ54YvTsVNOwtt4oETN5TLsIG4U/GS8HkARQ+h4Ex5YNLu9ozOSQV2CmrbhUnpiMMMGhKoxv30SbU3bWI1H1DSmS1gKge0wS+rRD46XGbH9Rf/U9Dwo/VFpj9+FPkscm9YnAva1EAtTNsEssqoikJTKuH8a97/q71kCyfaNtCGwhJFPo9YfeeFzdWK4VPbQG0uZgb4SYvvyFE33lengOtgL/K1HG5DTqpPPD9fSq7n8HrjqCW40XbPOFl9SGR26zRFvCEtpL/8UnubpVi4FX0GdKdcfQGq0ucUhHwF+X+vQNvVnl2HxbdPLumufRchsj/mMzMUhmjmiwouZGM8Abq6F8Um0I2n0eOeCpsENer5Rsz4L7aDCZvzIwTxm+gjc44lXgtyFR8c388XZxuHQlmDeRDiT/c/9yYHbEjsyXzKHsQdmoREKqy0gkFMbY5i3TajV4BDCpwb+U319q2t3yFvQL/R3lXnVtHS7OuOnAzosCODDaVo8KXGaXpPM/SBvYurc6jzpehUMdRgkSb12sN07GN5/VMrHKSlAHz6yhld//EpP5WwDtMLbyzSMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8N38wQ8+l2izZqZK4bZc3fbvB+AxT4CugqYnKQ5I/6NjqmhZEN2dP66yECZd?=
 =?us-ascii?Q?Rkt0Ryj6zlBlNVuxBAl4UOMlZTYhMteZd/6IqQxCX7ih7RIUo/kV/KG6KT6g?=
 =?us-ascii?Q?sNq+0KEikp2pNNr2L7dCR+7Eak11T+WpMgSSiZJZFD6fza1Du6zWtclkTWD5?=
 =?us-ascii?Q?vP7OwgDVmEvZ610Vl/EM8dOYUOlodraOOQEKnkTVHXG54QSMmE1+YaWQcigd?=
 =?us-ascii?Q?9lIWFyYWSfHI/iBTcJQiwOM9vJ7s8XzZrp2ySwQse3K2nXt8g470m8pJLp/6?=
 =?us-ascii?Q?gYQb5qgmf8YsIXsbddScZCqU21zmhzcBQ7QMawFxyaE2TmvWpRdyy1m7um5b?=
 =?us-ascii?Q?lDP3yAmbbEJqUL53n/SVLj+crO+zF6BQeCANGUYJefsBE7pSNQLVadMNs2pE?=
 =?us-ascii?Q?W4Xg/SW8fQeavxBhNvyQAn6IC0+Io77h4yfP4GWMztrjvOFn3LC14S+cV4uj?=
 =?us-ascii?Q?FXzV90h1OxzZuHUjww1h93Ou6Rudqot8d9HWjsnJr3yUCSnqb6ONLxeie5AK?=
 =?us-ascii?Q?9IxcCVfr5kD6qkXPbgXejL+WWNrNr7nWzqrHd7oVnaFGAx3XmVYHANOhhrkp?=
 =?us-ascii?Q?AN/3/xFP4qian+lFeLRSGTRfMeUSNTpkit2mxvBrkOrBcdFP7ee0wWAWErcC?=
 =?us-ascii?Q?jgfbjAdqYq3f/d8h7kB9ZeRl0VEea+jUupU2YUagYLEW+uftuS2RCEeMSFRB?=
 =?us-ascii?Q?aLgqw4eMBf1pfP+ob+Bzn3VskUyLByAu/u8FdvN8nRZgYusuthTtf9FOb6WG?=
 =?us-ascii?Q?9RL1PXimPIh+9DxG5Epnv8RwUabalKNjGA0/NIOXSlANJ0vGZgMXTuh2cOcT?=
 =?us-ascii?Q?gYO72OcRGN/tqUkC2Dhv7RwO+Nctz5U3PcOoJm+M5DYOx+ZqUACK2C7745pD?=
 =?us-ascii?Q?EgLNWUqev8UkDR8gcHq/vhwvEeUHoGwqU20GF3m3m+STilUQZYIoMg9GrrGd?=
 =?us-ascii?Q?w/AEuFlPKcfLxBkTfu79OLtwFPhOfv1lQPLQi7GO92Fvvkdvkj47H73hewdX?=
 =?us-ascii?Q?zMo1XZJJlsC19jonHhq1VhpJ1NKbdbwAaep5qT0qmJ+ERwjhhl1fTFy439sa?=
 =?us-ascii?Q?4Jmf4Zkr0TQVyOBTB27NSmqhuAiZ+ZuePUCc2H9fNZ55NmFMawaD8IPK23pt?=
 =?us-ascii?Q?fnYfiTVZQ7YrKqdEf+kGyxACIV1t8jGvKGgzMrGbFOCJknbZumaQdmlylzkq?=
 =?us-ascii?Q?awpXjTvfZ3gkwKqckEtfzniMzHp3Q6xm9vGgA35HlhYKyA0uR4I2cTC4JdQC?=
 =?us-ascii?Q?P5tWtxr9PK2HaHDgRVdhOdLMNY0U7SIGsuo2plhz56Kv/xTewPepVTU3gGp+?=
 =?us-ascii?Q?OKJkfMx5v2rF10/+qy9QDEuynUctuw20QFM4yaZ6JAbMs4v5pDtFl3GW3PnH?=
 =?us-ascii?Q?L6K6uQWTacREYdMVUEtTZwJzE+g5qJ/KWZchsaXYxUQqvFZFewl6QfKDnHf9?=
 =?us-ascii?Q?KxrZBbM2/C5v0+YRRv4x6SHBPgmFYOC+TwgZt8wfMFcK0yZrk3W8eMuHo3cq?=
 =?us-ascii?Q?1tTCbLy+U2oCraiwy+oMdRkKQJDxvgfJyhLy+oB78LZGO5TScTkNdH/TbdT3?=
 =?us-ascii?Q?QGDo80v/5anX9Eu9qG2uzgHEdag2p3fz95Vk2Bsj3h+3+i0jOCDS73dbqfnG?=
 =?us-ascii?Q?f6O6YR11AI0lytLLETVPTpQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8871d6fe-8432-45e9-6332-08da79369a02
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:44.6844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmAzwJtmny3r6lvXwXZ8SQLdQewlH7mWKewSJvWqU0DLJ4izzkTY7J23XvZVzWWqY9EA/jGbWBxzGJj2YwXgvtL8AzEnY9iYkGfxj3QsKbQ=
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

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 76 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 23 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 108aa907b8..7b400ecdcc 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -413,6 +413,13 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = offset;
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static void parallels_check_unclean(BlockDriverState *bs,
                                     BdrvCheckResult *res,
                                     BdrvCheckMode fix)
@@ -431,6 +438,47 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, size;
+    int ret;
+    bool flush_bat = false;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+                flush_bat = true;
+            }
+        }
+    }
+
+    if (flush_bat) {
+        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
+        if (ret < 0) {
+            res->check_errors++;
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
@@ -439,7 +487,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int64_t size, prev_off, high_off;
     int ret;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -451,6 +498,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -463,20 +515,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
-                s->bat_bitmap[i] = 0;
-                res->corruptions_fixed++;
-                flush_bat = true;
-                continue;
-            }
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -489,14 +527,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
-- 
2.34.1


