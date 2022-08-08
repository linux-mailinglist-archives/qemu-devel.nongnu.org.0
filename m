Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99558C83B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:16:35 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1gQ-0004qq-EU
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y5-0003K2-Ct; Mon, 08 Aug 2022 08:07:58 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:10881 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y2-0001SH-Nf; Mon, 08 Aug 2022 08:07:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5V5W8MK5I4OVDhMbgnNNXhk73UIi4Ej1wJgNMiCnOF12mwwRxwxjSH/LLwj1npUHDev69D5zQBwH53Xhou0K3SDMSQGRgVNfoCXoT2rZAcEeJbNkAnQbzQPNjGscAkGxCEXzkgqaGqtXUHafq74/u56BLgL6/jE41c2gWmmU5JmqNNe0TeB0renQllbQ6CWTIwTSxoKVUYMFP9Y5VGv4y0YmtoxgLc78IisDwk6AwElW673VCJc5rW8CaZnZSDvJaffZZH1pbEL/zb0m6bzI23U5t35cOnZ/vaw9lVmspescJmVNVBD3EzwSjyPOnOvuCFcxxSD3XmQLMHZFaTurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFcDfmR1Qjj78VRcQ8IkoNuTq9DQzoWLtIV/LUSDprw=;
 b=KKSpYBzet6Z1ahEgXE9XDUaIT2oMGqaxGygI6r3NvHNYsDxDf0Dc8gDGiDSV3fYPuMPvgTgsiu58A449sw/lUo2K5UgY6oOHZyvpIu9p+KWIeo9e5kF0gPqOGsmQLS+B98pmgIaWVDh9qo5du8DS7fObbPrwZ0QC7yMq33MclV6R5JHWYJSlsj0tdnl/nNAAf9FBHmxvNTpsstsH4QI934QEpRkF6LvunPhn+yQbd4rBrj49C4O9XsTM0cXpj2Xs2b7H9uKn7sRTvpMpIfOQ+ImJJYi2x7x4yXo8jmG3EJk5cidz/5aN0pGyk5bv+5lhxkwTq93ruA4ApNeZ88QThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFcDfmR1Qjj78VRcQ8IkoNuTq9DQzoWLtIV/LUSDprw=;
 b=CuujgKh/+MtwpJ34VsveFOKkr7o0JuFFaZJSBWVRKAqNoU9b+2jfZgSGETyd/dI4ZTmYmhESlzHKJtmfUKlyeek389n2SP/ZGNGIGrUkvik8GG1UcL5RTuUlSWORs1zbQt14a5jEezSW3wLTgPxDwJdr8VtkK2ryax69IboQBfStc+1zjJ52/T5v2dhzkYjphBPM8eeXsG4XW/7uK5BiQ29zpUipGItWNe9qYg4Rl1JDuZ6EUX30cmeGK94gqu01urPysq/b1PFIKSUgBHtRdE8ydQmZnmCT/8k/fSEA28mVUd3tvRdJOo0H2ANki/jz3pzdw2BSEziFHDHMRIumGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:45 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:45 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 3/9] parallels: Move check of leaks to a separate function
Date: Mon,  8 Aug 2022 14:07:28 +0200
Message-Id: <20220808120734.1168314-4-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3cc7d091-64ed-4cf4-8e37-08da79369a75
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tvYJ8I0zgXMYoPBzrtgnqz3musCqC0kL0sTWkhrw/Kuh5FfRETZTj3Xi3vSqJ0bBcZrsEXabhTqRVBOyVN/OpjQyK+o/pzf7PjyiCFs8iOdrm3//hROFG3KFMED4Yh0CnxwBIo6WuvMd2acJGQh4J3sPLLnrA1Rx75P8GNdyy41JNpDhEFUF0nR0TEnTrJiX8XoLAw3fwcJkt2sqO4LwV5VH/mPu1TCvWX2ciSJCf259/bbS3VZavp5M3yNiCyJ10p+JXDjAjnCa51XtPSN8RDCqaz4zOjx8J0iQX72YHu2UQ3H1KAyVra7cHdTREMk87ndbEmmCRuUnp43+DsG07CtTdj6cHSqdtdcv2czl9SkJw/zmqmRf3hRq/u8JoYy2M428canKooCejN18A0Xsr6vvB1aAB58Y7maEKwdUAsj1KXS+DNP3ugstgmNOBcuBlzdTZShuSvKBpH5TD85DtvBJyoAjLb//Yf1LYOrzZjqzgqq+66cEHeWEyy/dqRPKKgbV516UDkvFVETo/2M1BONMtaJjR6z0So/gvw7YgOa9hID2+oFU0yC50sQi90RU1Eezxg964NK8KceY2NTsGTv0JzGlvgEkdN3+pxiuBBQIIx+RMwxm31Q4Xp+/qpMkqR5BM8y7KCZ9L8qmYpawoN3oDYIzM2PkqaxxMiCsoyN9AD3I9kJSkkrHg/7g7GUDB6mGFJQHU8umjrkB4+XRoomZ+Hnm7dVQMK2z7d7rgKCl467prl0h95ZFaPUYgVnvaF9v6lihiBOlKdvpoOY43Z5ZKlNoU0nHgK8Buwp2B5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7Ww9MQyLvP9jBVvCAr9aI7WT1DSJ94eDzHtAtzLBCNuO0pL+1PGJ0wxRw3D?=
 =?us-ascii?Q?6a9J7umFBAZzGhtkyXMaa5aSOlfUMmOSYxcR0J6NS97YSs0ByWZn3RWJJIsd?=
 =?us-ascii?Q?1NaiHHg9oYHzdi6/RQzPqe1AB8Y3e43GWQ7iqncRM6H3Lly5k1RR5S3T+gJX?=
 =?us-ascii?Q?Clzex9DmsTw2u5Yw7+uCfR4TQcPBxo+HHNVikY8/CDmlxlGimUetBf0mGrpW?=
 =?us-ascii?Q?yzSRh0MDRQ8v7E6he2mch/hA8D3dk9GZwPUaiyphjl3AYng3qfobM3sWPQLb?=
 =?us-ascii?Q?NXrjcHsE8Vstv5XyrU4qMK8SAUz8t8rgDc5d6esVPKoZFJlWCUMpMhGuR0Wd?=
 =?us-ascii?Q?KHW0qv2eN0lHiyIKX0DYo6OOt5bY6FYNrNR/3n75x+Ir4/rlBblcCarAGp8D?=
 =?us-ascii?Q?yE+NcuJV3MIQk/I+7RfdOFWyJ5jZ8oxDiPctEDT4pGg0E6spxg6y855YfrhY?=
 =?us-ascii?Q?7siYMb+WNQK7YycBPcX/wnawLy8psX/kRUzVLJRQJK9PZAzzNux4GS9qjAWn?=
 =?us-ascii?Q?zbgSLQvSZGkehYUfiDMJbhuvmN/w0S2fi0uY8EN5KCWcH9ueHlDY0foV5GN8?=
 =?us-ascii?Q?qoklNw2QzSOihhDtx6gGmAx009uCqPZw00sryUxl0CUAHq+yubkpCzkj4M1J?=
 =?us-ascii?Q?SeMudViNOELT9ObtDXePpif0NhWn5cOi7v3gqcaHsc58iQLEO/SU9QlKbf4Z?=
 =?us-ascii?Q?4UDYIUhzZWe6wAOR1Va+kNO+CBHm0GKmSqj08VfiyQ8EvN9e2mtaS6kqlqIh?=
 =?us-ascii?Q?kKAAmXXnwFe94dBXWMzoqrWD26dntQkLesayNGfeiuvT4vkz45knBMoU3w7v?=
 =?us-ascii?Q?UB/Hymg7SN7lrabcyt/dKyvl103nTiuVEp/d3hqEeuoqy2lvi/ymuoBy6bXd?=
 =?us-ascii?Q?oiTljtJoqvYXDEwiosLrTTUrA/TY2+MPhgwz7dHf9ru7WbMF502b8amA5t4/?=
 =?us-ascii?Q?Nle9BqUewh8dK1caE54QIZitNhJejfObDkUdPg8Mf40sfe3wiHWVINre5pe+?=
 =?us-ascii?Q?XWlSHtQShAPx6v1JVplqhGAu8rPsZ3Jd7199cCFeMwbpKBIdR19KeE1g3u4x?=
 =?us-ascii?Q?1NX22PoA26IQqyiHcMqVpSEfLuxdppo/6LfjL6sUzUJJuZm6Em9wnfzgbhvI?=
 =?us-ascii?Q?7nSUxqMrE7XhSw9dD4tTalQ70vI6rw76UdJNnBQ+GgGcc4WU1SaXwl8LUnJ6?=
 =?us-ascii?Q?pjiOotJLYXkoVRhr9uNmWsPl8CwS46yuYLq70Y9Q0aFBCyHMh4XEIHa+WwWU?=
 =?us-ascii?Q?j2nJ7Ou//byQWuzixpk5ROVHngGRcGV5RGs2pEmgwxbIhapfnm2EppdARFwQ?=
 =?us-ascii?Q?SOiM2AxPFcxyugh2FjTqrXw57HXSqHTsb+tGF62poWkQPTyRgBuVJrApnQqf?=
 =?us-ascii?Q?aGQqr5Hfz5MtgJn8SLWKYBDsJKlEpSu7a8W0KbG8pEa4CD2Fk4aKEFLPTCJ+?=
 =?us-ascii?Q?LNu+EKHulTHmMCrKTzYceG93Mce5Mdmbl4QGTcjMf7jaFQ7briQCBmKYhfM8?=
 =?us-ascii?Q?WUWFRB5YrilXvVgnsC31Q+RmWl+UzppNrOiFbFtoI5AChlz/4PW8T3CdxDQ8?=
 =?us-ascii?Q?p0CWC/3USy36ufjTh2xZN+3UM76+jpPycyWtphXaG1CmjXIHed7FhDGjkIB9?=
 =?us-ascii?Q?oA9qqvQam38G0iVWyJUUCq4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc7d091-64ed-4cf4-8e37-08da79369a75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:45.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Adpe0hak9KOpQyTTBIEgVMSHHqZUVab6677itbIWXanLVGNgoDfXj0oN+meVPrX7GY7jCvW8Fwbdz8W+w/gamuc7YmqflRk3goWLRl0jvRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.132;
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
 block/parallels.c | 96 ++++++++++++++++++++++++++++-------------------
 1 file changed, 58 insertions(+), 38 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7b400ecdcc..6d4cfb738b 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -479,57 +479,31 @@ static int parallels_check_outside_image(BlockDriverState *bs,
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
     uint32_t i;
-
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
-        res->check_errors++;
-        return size;
-    }
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
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
+    int64_t off, high_off, size, count;
+    int ret;
 
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
+    }
 
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
     }
 
-    ret = 0;
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -547,12 +521,58 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
+    ret = 0;
 out:
     qemu_co_mutex_unlock(&s->lock);
     return ret;
-- 
2.34.1


