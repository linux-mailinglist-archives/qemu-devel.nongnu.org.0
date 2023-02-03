Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F1689379
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEE-0007M4-Iw; Fri, 03 Feb 2023 04:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE5-0007EC-M3; Fri, 03 Feb 2023 04:19:26 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE3-0000ne-VG; Fri, 03 Feb 2023 04:19:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2pytdnIJachnwwhSrlMaACu4tbEInjkwMNXMQWLOSljDgIvU9VuT6MIc1Sx7Qc4tRJoQOfnQbwsNL2xxJd21u/97ZyavXmu8t49MHse6H/kT9VI6d1+TfuMfvhkXP3BthYp1u32kkn8GybwDMRWx44og7Y8K5XaoJZZzIJFalbp1DIB7eutNxDG7i7t3QsyPLcPvNscB/ihFyVy5TXSJ+w/GB4VmKg70vlL6sBol0YtkK9/FiEQq3/6VWtWFvRGPm1Tti5ACPjT0nslBnjcHwh8z6SeAMsIhZLy74M+SjQFq7DJdGDLUwt+sHZP4umAOTZuAROMmFTvGZHhZk3ZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohNuCGbA5uuIg5QyRWjWb1YRZRCkhuONT3UJeWEuXM=;
 b=RwCXtTLC9BwlDN639o3UUlA7JDOXg2nfvzqUd96C5bBE//h5B6Mb/cH7dZuDD1uS1xM1fIs/MKcJiuD5+O24BFbhde2mpLdzoGrlVK4F+aYaDAcz6Y1Rv38WcnwwP4p+C8IqKqXIyHyFzUhlzqdgXep/nmKLXg+NbtHTUfIDdbJ1MV9qTWcXOyOsYrTt2Vg6OCKhsluK9wM9KpF/10S5LURFxcb8AqjzLYflJT65nt1onC42asfRxDM5fNNznA2ZuS56xFiBIJCRNI6mjLF6ehVzz60AMOhOObK4xbnIFp+sYb2rLKD8cHDM3eoaie/55jHrBnJBlUSwt4ZpYJXAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vohNuCGbA5uuIg5QyRWjWb1YRZRCkhuONT3UJeWEuXM=;
 b=kUyVAWBnntenoSactlFEzjI6RP5/arBT5dy0UqlEiQ25/6QKsyflZl6JHK01/CGrrzqRzNizLPIwqcDKMC/pj54aXo1lCQeegLE/AgA5r+G8KBTY1UnZJSgOKrcofh19VsdWMXemzXNVpb6BG6Q3UwtpGSlM6sm9n4gbI5ymLhPHS4CCArUajp3irvuxjTBmOqcqf7C6lTJdadxtwX6hs23+gPRjrYGiaVsgYryvOKefWq7PyeeCOSHv/U/6kFCgJy07qJgmbfY56i86WfhJCm1w92UrKXi6yuU0pRkZPMkn+u14tr25D5045Ei6r2qtdsF5JYu7Thaiwv9Q9s68xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:07 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:07 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 09/12] parallels: Move check of leaks to a separate
 function
Date: Fri,  3 Feb 2023 10:18:51 +0100
Message-Id: <20230203091854.2221397-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e255a1-d688-4b7e-a24d-08db05c7b3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxskcE7SHFTV4yMY10vwsrx0ujeYaDmSDH+YMBSAaj3dt9OSc8JCW/G+yA+1bpFVu3FqdWAVY3HzPndHFWRTlXu/85jQhckkdlcoertuRNzKz5MaAZ4CmCjKThx4dOuqrfRDow4GSPrrzZfpbMsTpyirCyMwcuMamMInTvI14/ppUFgcT2WsjayQxWCwphx5C7I1j6RVOwxn33y+37h8vlfv4u1KqxHDTHqXL0hv4Bci+y5u0JaijlmbBlk/zmq16xRzBrjDKB7O7HQ//cqA1jeMVT3bljCUIxdJ0z0caHsJwVGL89AdN0ktZtaelV7x41IUhwdmj1uqjwcqdTSr9WU1hg3RpXieCHOuWLippfRnVJPToUxF5grc3CUPHvrk1EwsktSitblfJmPBU38GVnO8MO6AWrH2uwWa+wDhu7Kzku/V1dkJk3k+/i2I3HwD6hkIftwYMy6YZA4+gx6125JHTh5esEuKWlK+IImZ15IKIqLvbqJOqTUWMtDy6UNVR+eTpa9Fxcoo2CilcFXigxnfKJ8g9dFs0lih+AcsRIE8WxfHpknPF0/UCCUJ413l0ryEpOFtegmO8/HgZh/EX0tKZHwvJHn4ex+dKvBiTN5JQ86sM6VXYKfdpu5S5BMaHK07uR9D3KBlKNt6/bevFIOX79c5pk9b8/UjHMNgvtO4VRpFUP6iZWtVgvCCmLlxRr6R+IXB7qlGvCq+dW8Bfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HRrhx15Xg3adQsBxkUpy1kASDmFdIdu5og3F4AXbvTY9XRr3FprCfKQAHjRB?=
 =?us-ascii?Q?J6+9GNsIH/G4c1S/g+2fs/AU332VnBOmOJcxk9Fsw0UlGf96VTFFS5dN7ksa?=
 =?us-ascii?Q?586Gp/zMg43jzU/6/1QZVYeflkP5OZFXpyow1eY31IXIdpASMRlowRrGNNJc?=
 =?us-ascii?Q?TvWD4ZhNrrSwCTGGwUpB2hfv5s3QiK8DwTgpw0vrkkwGIbBh+0vUlVzpZShb?=
 =?us-ascii?Q?5M1tuu31SYg0Zqk/HZIbfw4fgBhy+MQPWfMTVFBpg3btWnBXmXpjoMV0v330?=
 =?us-ascii?Q?Jw1C5dQVc/xqQHQIrcU2Xrp8sxt8me282T70TYbvenmzdwK2ABIAP/ySsQgo?=
 =?us-ascii?Q?/uSZq+pHhzHyDI264Va16XKwYhzGxRDsu3goNoyPVicy/NtPN0qyAqVRHnEe?=
 =?us-ascii?Q?sI24vhg5dziwdOTAuZ0IY0rTUtp/L1CALzDyCg4AuqPI31SGlIqoMXwxK1B7?=
 =?us-ascii?Q?LCpkpDvSqCGHdrr22UGAAx1+8XdAi6bbh+Clxi17WNgKvVsBArLy5xotMjU4?=
 =?us-ascii?Q?NLAcyRSp72jCdt0U/9LN+223KTvXmzeDiLCzLHCVuPSEstMA41tw3Z1n5179?=
 =?us-ascii?Q?sj2e2moG7IGHrdarWK2ksQo71t9M2Vr7f5MrmvWBoR1hsmfeaWBt8Pk2DwGq?=
 =?us-ascii?Q?PfzLDZA4Re7hpQVtVIVG3HUxSb9J4/328BAR9if/MqdVK1FfCcsIw0SbqlR+?=
 =?us-ascii?Q?vprCj0R3d1IgepOx50DCZpaJwkLo9GfbD75kRnHC3l/o1XPtqKKDJ99gVgzp?=
 =?us-ascii?Q?YIboLVJIrYP3FDDoBqMEp0oU+AUkE5TgttWMUDJxCwGnLImD0ol6bCo/qWzi?=
 =?us-ascii?Q?gk0FqtnFHeRSFamTRyWCIUqeNpOse9XLOrv9mB79z4Af2+tG1K6fH15oxYXu?=
 =?us-ascii?Q?41UsIh3kJxipJfQBDZ9OxneiIgCMJp+Pe9J4+2VrDN0HNpqFpzyloCzqGn67?=
 =?us-ascii?Q?R17a6drc6uWVvhdg4/NgVmJa4+d7zRwIGEnQWFXtVkZCCWUnFNVKM0vJ8w9B?=
 =?us-ascii?Q?bE3n+F0IaWqKOyZXRR4cPCUPIcKQ3NodUkK82vEIuGzpySc/teRERvBUqcOf?=
 =?us-ascii?Q?mSPiRVZgDA6Mw3zM+yV4GnlifbtsKJxSnw4kdUXj1VU78oTwNHawLDsDyCr4?=
 =?us-ascii?Q?+EMoe3sNVnBOSYhJirKVONryyuzb8NMBj/mYrzvlYH+iyXpuNk30cFq074b+?=
 =?us-ascii?Q?Iek70vWn7Dx7byuB//Z3ttW27661rIocqHmNj58HyeHarHzS3SKyQqhg13p2?=
 =?us-ascii?Q?oxr/+2dKmTwjhWVQiHhZYP+mZHDxkukGEqVByfT505jqNKNylUlbJZcjhZ1E?=
 =?us-ascii?Q?nkVp9UgpfMCEluhmA0c5EI4hjGlhO1ou7SGo1wh0LIANxAGEQX1d9TPyfgQ7?=
 =?us-ascii?Q?s/35qb7W/+Aoo+N4Fh8+sdFLPdUcqwJQJFZ/fpY8cv+i8SCqQwUBQjvUpiDz?=
 =?us-ascii?Q?J8huQMa5RrORWQBm2TtdzSEwh/VVBWPumQHfsSXNsDJ0qIsio7LF1n85BmZJ?=
 =?us-ascii?Q?uPfTDJ6PtzaIeOolGr5OKg/urrWU2+kotF14EBDUNk66cTO6s2+D3stEVNi5?=
 =?us-ascii?Q?1ibBKQnTMNVKymek5QNs31WLOVCAYq69LhUDI0jvWycnlkqlyB1Yag3A352q?=
 =?us-ascii?Q?oMNyFNsVCdikU6sBbJwp82c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e255a1-d688-4b7e-a24d-08db05c7b3db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:07.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DPl0ADw4WK1PvJjkR+EL2ir7YtxlbIvT7KkxZYV5nEgHbnxD0kDVj4HILUqE0BrXNAqGbXIuXRiTYRKstSV/5a9k4lfzgQYnpPC5TjEB1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 block/parallels.c | 80 ++++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 32 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 994528d93c..c7d37c4580 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -480,21 +480,57 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size;
+    int ret;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    if (size > res->image_end_offset) {
+        int64_t count;
+        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
+        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
+                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
+                size - res->image_end_offset);
+        res->leaks += count;
+        if (fix & BDRV_FIX_LEAKS) {
+            Error *local_err = NULL;
+
+            /*
+             * In order to really repair the image, we must shrink it.
+             * That means we have to pass exact=true.
+             */
+            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                                   PREALLOC_MODE_OFF, 0, &local_err);
+            if (ret < 0) {
+                error_report_err(local_err);
+                res->check_errors++;
+                return ret;
+            }
+            res->leaks_fixed += count;
+        }
+    }
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off;
+    int64_t prev_off;
     int ret;
     uint32_t i;
 
-    size = bdrv_getlength(bs->file->bs);
-    if (size < 0) {
-        res->check_errors++;
-        return size;
-    }
-
     qemu_co_mutex_lock(&s->lock);
 
     parallels_check_unclean(bs, res, fix);
@@ -504,6 +540,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         goto out;
     }
 
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -527,31 +568,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    if (size > res->image_end_offset) {
-        int64_t count;
-        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-        fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
-                fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
-                size - res->image_end_offset);
-        res->leaks += count;
-        if (fix & BDRV_FIX_LEAKS) {
-            Error *local_err = NULL;
-
-            /*
-             * In order to really repair the image, we must shrink it.
-             * That means we have to pass exact=true.
-             */
-            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
-                                   PREALLOC_MODE_OFF, 0, &local_err);
-            if (ret < 0) {
-                error_report_err(local_err);
-                res->check_errors++;
-                goto out;
-            }
-            res->leaks_fixed += count;
-        }
-    }
-
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


