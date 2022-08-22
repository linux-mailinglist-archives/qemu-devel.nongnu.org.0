Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B259BCDB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:30:05 +0200 (CEST)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3kv-0004bf-7d
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NW-0005z1-W5; Mon, 22 Aug 2022 05:05:51 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:44801 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NU-0006xe-5v; Mon, 22 Aug 2022 05:05:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJLAPVjg5khdG0/3KXKlIwhUqgpuBvJ7cfVUE1Ji4I0uLnOguoI1cLg/eu9QOrVuky3Ez55VveHiyY/tBEM2Y4iYKQ9UhCz3jHdhytTGvLUamuOuxHKmVe3zc06QDq9Zq4cL9oSaOvwjZRLJvDSoEZ28ns/4ZPkigO6ZkkWV1Vgvl9QrhsqX9i6rbXf5FbCdNsQp6I4++CBtkRucOQgRwPXttmno2fyXGJqOoKkfIf1o+IIbeVQjVzIkQN+6ROOWbj/IVQe/kcLANrLs9cd7MJF8MnXekAJcKOA8jCFH15s5F2lCfTDnP66txbxKt5qDdFpQ69ooFXYQM4MeRzEbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4xOgP6Mx+oZfmDjMMRf+8vtcgPH3bMCkqWDMW37x5Q=;
 b=Ce8S7aUVWOwHRQi3bqdyRkbCI/uB0vN7266umLffT5JXZdOH561ViYioPMjyqymIpY54QmDcdjQTQdaKwHKYgQctlrVXjakBX1VDkFgnDPrkazs7dmZVY6By8zfoamMVB3hvn0nNgTMxtjbqQMajqXFUL9T1kaZ/nwhgtoZVQtoPRvwxI3OBlCa5QsUCUqF3CNNLsh5spCR9i6CbiyPJg3HXlFCaaNqFTYnQEoYq5LXi8h7BLNzPxgINQFCGbpqT8/LiKdIor9OibLFnzGu+CfskR7+vFa79mVLUHmj2wOXVYomn6QzNEchh+POa8UoX7fV8Mlhu7Q3tsyFxMbUNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4xOgP6Mx+oZfmDjMMRf+8vtcgPH3bMCkqWDMW37x5Q=;
 b=0dV/pKmHrizFlgmqSA8GjjmHFSWixoC2jJCrXYX6BHeLQ8s2EWfysysTTO4aFdgA2S/OFdw7KDg8MTeG1cj1rrvZfx3u1bcr5OKoHgMvYU/1k2Vq5wI/C3au0y9ZU9Xbv8s9/mlFOv5+ab0fog5KkSjLRh8c/mOY2WbeZ2W8uHlYTPGY+nDE2XQzA6Z1J5g1KK5sJxsb4QN53w65MkIbpXndwtWEDLKJSbNhsRpdD5LoOIgJ9Y+BKtdOFmATZSlcQOCmQb2Q75XyO/gsrH8z9jtj9QaoJHPcZu1qxYLQYhhJzvlqWc0VaBMYXItnQKl1oQkB0174cz/7iz1n0Em59g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 7/9] parallels: Move check of leaks to a separate function
Date: Mon, 22 Aug 2022 11:05:15 +0200
Message-Id: <20220822090517.2289697-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c441dd81-85e7-488a-d7b4-08da841d7924
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJixuNhX9wf+KJvNsR8jfz/Hz231Z1Gr9j1MsellKZqfojOFTf+RfyKG366+7Y3Oc4JekDFibV8xMnzdlVT8Rmayx/tuIdJEDhbdzLaGzPYQk+6zq4dgW1FkfLeiIr3Bi8G4VMGbC/bswquD/hiLKb5PM2rkvCq0d3l02gUgaPXlClD7OX6+RIDyW0tlhvFEkAtQR1TjkQIrK42FLb5Fq89phsyPo2Cc51eAJsMtjYsTG8P2oVoSHsjAJ/HisBHALvJSncfsUy4uvqMaGyGYuOTKObsMowgY3nEiS59xTOMH7x+YBTbbw1K7RPCmecJwEKfB8alDCFLuUZd7zQ9UUeu2cjDxIeJxydN54E6SwwK/xNo6dK3rMOzd8VakffPhN27AeLjaURqPOlMuK8BZNJWERo/v/3uA2rgoD2nU/poMdRVtpD5OwaejqRFCl+Q9/8E2v2wnHoEtZunMLy2OKdUMdAOhJnBZFIcdG6yAbEyqbqkDoFZy5MSrQe7ltHxLbNowtI4ob4PDAbSCiNBFPG3H0kDEEtJ5+DMyJgYddRMaBvnPQVRv9T5E+YAiYX/UBTG5QJJGjHRTwGsuYz7zyzt+wBTzGDtvCh0LXLvBkni97Cj+4WhEOM0qGaPjkgvhljL8dFgkCmifvCPiWVz0EhqLjc0GPzKq+l7eC7KnwhxAD4oXR4J9HgO9QCatk2b0BuFTqMAE8A6d8O2wG24mJ5mV4RGzLYWLCdXcKcBRvJ4uHGHrWCTbXb8dH7G3LejsBVxyg8vL3Bwuit6YR6N0Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xrKxvcLaPlMiVJh6j0/3Hq7rO+Wh4SpkfwJ0F+uhVlRgLwRKLojM9iQBf+ko?=
 =?us-ascii?Q?ETgDFVuNOe5D4BI0qUi00eBlt27H/oVEyVvuoOjRyhCEAkrhGL4OL6WYjanl?=
 =?us-ascii?Q?zJHtSjaexLPC4M2qo7fQ800MqRnDkCXkCCq5v1z3cncAbAImLNi33oXVkiqw?=
 =?us-ascii?Q?XjdJVnh3XEQMlfTU36oAmNY+cFn824FyjaYWE6crweOnx/XhBI4LekOTQByk?=
 =?us-ascii?Q?QS+NR7saHxqpKhD2A9PB8+RKi6pEHqnWxQ55M141rOihidgTXdVB07q+gVog?=
 =?us-ascii?Q?k9pAFfbz57wFm9Qd1fitmh2tQIuPMjdjpSvEBje+iPWBi2fqMrK89AIOeVP+?=
 =?us-ascii?Q?jtSGgVN7Pq4ZvbE2uf04ATyb+nkZ10MP0mhLhP7MSScaXcE5ZyiOQ4v6xR6l?=
 =?us-ascii?Q?weG/l8mjWz2hd1aoCvHhka9cIVaDH5fR5V+qWZwDw3LH6WaFkP7O/xw7vNK0?=
 =?us-ascii?Q?KgbUwbffkn4juS0e9rh1XQjau3DmZ9qsSS2z4XrExuyE7sh+NUupb7cu5NKY?=
 =?us-ascii?Q?YD/E0r2DJs96d42xfye/65wcpk/HJDAAPJwpEtj2FMo1nnlCKPxyzHOLLwvu?=
 =?us-ascii?Q?Z7IMsxAnOn9+ZWGx80w5Yhn/+2ui8qzMVEnAjYihiM6KpJfqoVTDBXeVBj+L?=
 =?us-ascii?Q?5knx7GLsKGzft7x3g0KqGzNC1ZYA3Mb935JhzadMPITiylXcrDwm3G40Y88i?=
 =?us-ascii?Q?f4Q1q4l0g9tTvmsYHunfl1RD2LihpT2LbchW2cTSBvaFN34jQDQJ6dRmw/Fs?=
 =?us-ascii?Q?pmu3XS3CnTo9qWHUM1x8J7okfFHlQ9OaEoS+4+tIytR3/Xhv0rvpT1SdiYIw?=
 =?us-ascii?Q?KCse3YZsHI7yHkexr71E/GVxez4U+3mFp7Zny1L4rVco/ITAK6VkCNl6FvIj?=
 =?us-ascii?Q?76e55+RWIl6Vc+6Y2rlvySxGIA3+ON73H7XF1gAuvsEmue4M1dJW5LH704pL?=
 =?us-ascii?Q?f0xrp6j/qeNDfWlh+8ah6qtDg+aPkyyyuwlKsXk/zrOXfN+/mqh680e0bjLr?=
 =?us-ascii?Q?quaJu/iftST46I9m5nMce24YViN83GGuFy4LrUOrfcnIYuLUcADqkvOAjrGa?=
 =?us-ascii?Q?Pai8TUCBUiCZNKyWkQFcTZpCVJ+PY5hGk6VEjYkUGWiKiPsxdPcZeG1aQ9tC?=
 =?us-ascii?Q?PNJK0uAiDqJ4K0Qcrvtb7XQdK2cHQ4UUJDbkC/o/MXBHQhx9wM3pZCBndpoO?=
 =?us-ascii?Q?sk8ovpuzOa93/LMHswqo2TI0eZBP5o5c8FXS3UCZxYRj8Z/p8Len5NCsoQu/?=
 =?us-ascii?Q?jXCkHpcTQ3ysjRsqN2kAYZHjDm/xYXNiIopJ0/C0qpUufbaz7wYP0SHJTVFD?=
 =?us-ascii?Q?dhAfX09dlDwFDXIaTEjUpBtRy8P7E+r6HJfB9lZsPmbSDg/KE2jMm8fcoyXl?=
 =?us-ascii?Q?qgiquE4hpioDSfzfdIv1/O6xYFdzmPTMFWi2QeJNHZpUVzymMsMfzVNOjqhU?=
 =?us-ascii?Q?XIKNrfnyKDVBrUOvueGU7rAr5aM6DJtPW6DgcHnsEsoMI2Tjb8Oj1N5eZp0A?=
 =?us-ascii?Q?0tCgYPNitDPpyEbgRDnGVJDaLXh0ZVOMcOh5jEiHlKcQE8LwHlGB4txvKGCf?=
 =?us-ascii?Q?R+g5/S3iqD7SAnmKMLJwgWn8S0TL+zlpnTYGRL/E3yrcylO7ed44YeYodfez?=
 =?us-ascii?Q?HQ3bB1CrMhw+qHv+PPO7qZg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c441dd81-85e7-488a-d7b4-08da841d7924
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:34.8971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usFnwItEI8KeX664VQsMJpj7wZ/hso949dR2OIE1K+taMF1wbQSWsxpfR+ZfkbubOYGhslSib30y1P79sVWN+7FErsN11XttQpLoTvpGBPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.133;
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
 block/parallels.c | 87 +++++++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 33 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index bf074f247c..12e8d382f3 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -468,14 +468,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
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
-    uint32_t i;
+    int64_t size, off, high_off, count;
+    int i, ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -483,41 +482,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
@@ -535,11 +509,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
+
     /*
      * If res->image_end_offset less than the file size,
      * a leak was fixed and we should set the new offset to s->data_end.
@@ -549,6 +524,52 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         size = res->image_end_offset;
     }
     s->data_end = size >> BDRV_SECTOR_BITS;
+
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


