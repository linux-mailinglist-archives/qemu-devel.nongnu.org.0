Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E706EC88D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:17:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJe-0006Jy-Kz; Mon, 24 Apr 2023 05:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJc-0006JU-4d
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:56 -0400
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71c]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJa-0002zR-Fc
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPKy7N8zIqji1fyqdTzYoiClvZIvsHL0S/rwxXAgKdGI028tO2MYQ3whH8v1znuzE/aPpBpDEfcX3aLJXCZ0MThpLgoGKsG/iDYfhznJObM1RQHFQ5x6KgZBI98/szXGAC6QpmzFInWlV+C6w/W7Imr6AOQcxq1e7AezgMIW2DS6MrirqelqqGuyyo6UON44jeDPGLhpPwNCTOJZRPhoZIWKE21ka6btwTxpDqPfZ2V6N2BNBLXxNNAUquxyHiZY2PRSEPZsRORrJvZYIZ8zNPzYhito47exTCG0asKnRHz99FckwOTv8yDWYXZgxtMWjOwSJOJVvNDjk4ZXW3dEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlilXhw4n7l5bywa2l+Kq87+Ffa2JsvoDKGDo7EQJHU=;
 b=hYEpAjN3ZPXGAYLM6MnpsvBpTAEdB6L12px/4I/fNvYaM05uCLE3Rz0j/Lft8DAD2JZzsqGUgdetCgsnhJ7DChtYeFeT8KLDbDpp9X5nc6AaOyIdFsEVxY/bC9o3c4PtAi3QwnWNXTjBLf3J7WxpfjguvqUM7U5dEllla2spi86R8U1XC9P7gmp/rF6MQIUUbp7q8Vz/UkrYGuJgeZ3UZDveKsNA3vUFU/EaK5DdDMUPEpaWQ/MIiP04cAezUOUQCU1FPwLfAq5LXGFNMs1GHlpPJTHmjYgHmZ9/OOmbIFXLpW3ZFmN2aXH+3VMpLf2XZzLB/v5i1CMvjipIKjXEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlilXhw4n7l5bywa2l+Kq87+Ffa2JsvoDKGDo7EQJHU=;
 b=ObL8jf3155LDQ/qAfH/P/Vw/U3p3CEfVzSdezOEmKuVWtVeS9iYSAMaZ16B/RHSlWtwvXoHlJUnA9VGLndR3CIWMd+2IA0OMcZlbf2d6jYYJDEn3Qj6/7pUFJegdis1QKjbxyavdO0CEAgM1CwKSoysRYe/YzV+mG/PLfwwmyQu3JBNuwk4yTm2FACWHeE64B48elW9z3SLfWI99cv9IM5FOWAVKHzmd52ABC8ziHtoWlsw3zlVFwEr+VxzA198MGlmASD/SDL+r7Zl0BV9jRn5GJXy7KIdXZF/z31PHgpfk9Bdt+CXIW/caNQVZoHdfYsZ06YN9LF6/21oZgDGR4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 09/12] parallels: Move check of leaks to a separate
 function
Date: Mon, 24 Apr 2023 11:16:23 +0200
Message-Id: <20230424091626.195590-10-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: a0018657-7f96-4896-c6c2-08db44a4a1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGK7pgUrO7CS8HcMPny6mQIQFK6cxuLGmI5paUDQWzSzMZY8xc11/1fyEfKJJ1g8ufWhtZTWbXnccWuKBX1U/QwOaPGoE/oZEixSUODHbahN9TufkxHElTw1AioxT2g4DlbMHDhhhcVzCWLoIhgf+CWCJ3SFOyKUstqM1ly/wNkA2zWZDM+jRuzK+PFz/NUUYouqPPd5OdVNUrdjeQmAok9OtnfV+Hda6gUTRCx+ApwSjLa12TrsA7aekb2CNhsOVH0v338+JsXts6JTxepdS5Sje0jp0I5mE3ivmYYEkrNi1QC/ybzQbKPi1PXsp2vNyqc332WYzjJjxOg4/r6Dt1WDnvGAutTAZa4AQFR/RX+yFp3UDqPPvkzy1iYi72iImXomx3UrgUrsehkqxzM/RObKhTOjWK4ku6h4as8M+sbw8HFMsMOmmjh4kk1ptrd/ghDZY0+AmZtM2c1fiQVqgvtN12Gn2ATbjyHTs2zE0vM5KdEQ9BctqoXEYjgu94J+qIrjGGknOD2Doc4VEH2qUSZ4Rzh/hWWtAM7ujdXj8nKFn3A1q8SPcKFCCTAnhulFidsNZN+tr9oTITKV/vflq+jJ/tYJ5mir1xeFoWym1mJYFd6H5WF1hmqoufWgn/MQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zkkcteLn+4l675qO23V9vokzX3RMTcRZ4/0r/Bt6eeW/acC9m7y2hdnYUs+B?=
 =?us-ascii?Q?WJ/xjjH2krN61ngjBjLf6yAD3LXWCIviIY2etYnpGc74eycodquj0Q+3EDtS?=
 =?us-ascii?Q?HaSPWkcIoAdZQHc+ewjGvjDcie9OSBLZFURiiTQmjGtovDGOo4ZU1N3g82id?=
 =?us-ascii?Q?wAT7rC1/OgGZxgK2TQj7RHttEfy6h54WdmeAJzwRmHnV1G91NRzF1R0fE05x?=
 =?us-ascii?Q?P2gPCU/a5TN0nL9LcecnzdcHdbXJOoOwTLywHZ31yokt8yD8ECKX99OjGQud?=
 =?us-ascii?Q?bMcJGk0pO2bGhhiOMSNZ2lHQaDeqqkCX7JVHpDrysKozcIhG9GwyUjCRJX0m?=
 =?us-ascii?Q?q4zeD8QWJ515XfBtVQ9LbxxJUZnh9ftlPeTi0AWRGNfmTiuYMMY7mvoTWq8h?=
 =?us-ascii?Q?fZsDFf6Ka3u+bc7bBZnggrp7YjnrRa8w/O5hSGcxteYTnJH8mo1rAjWciwc6?=
 =?us-ascii?Q?XpO6hdpVmrKmd2VFbchiKccrbEg98RLb95MTmwL5CRAkZ2RUET9FE4uAk56h?=
 =?us-ascii?Q?IPs37K4QeVdi6NNSn/y+Mrq1ivVgEAqMi0TugPpgzFy/0u0pgEX/ubFaL4Ws?=
 =?us-ascii?Q?3x6A9YbR+gTvbvKbmQRPcZeThZsPCelN4ghKiqDRNyJw3QN9W8OeLaOXKiGh?=
 =?us-ascii?Q?Ia7g9GxGpktH2hDPw2rSnWeKS4RY4ulBkXAONv+qN1M3NlUXMnbAmz31pZNm?=
 =?us-ascii?Q?rtzBLzcrtinKq5M9C0WLO+p9wWekYavv2DWBfA7tK4D/vxg5HrrnNEZAT3c4?=
 =?us-ascii?Q?Zm/ok6A2RGKv3I7iFDIWzDRrCc+xWWR9q/oatkARh6Ol+N4zafWZFNmAygBo?=
 =?us-ascii?Q?JRHsBckqDiNVh4FsnMGwPvt4mHgisRzDTd+VNI1pAj3JUbFYGbaPL/Garw1N?=
 =?us-ascii?Q?QiDIE/JTRn3XPwGpok1yCjtgvaDzqPJUbj9N6Xe/sbzYZHtYkNAZg5QvNuWe?=
 =?us-ascii?Q?ashiHJ7eqknkjZkI4F04bcyaUmAkGqH+mJNO2RpJC7FOchAXO0ZFNJfkt7tQ?=
 =?us-ascii?Q?cTaEvSjnJW3kVYF3mkMggKm4v5zy6zAMQBkRDHPOL7DG5RgoN3d4bNCTIw0T?=
 =?us-ascii?Q?Xnb1BOHncJPq/juJudXkd3iXqGya4xf6TGqgWvzfXMvIKHxCU2tkoo1IM3r/?=
 =?us-ascii?Q?5XAV/Ae7ZvHMDipMQ6ag2EdqgniZn0Q+uNt5IUzZfYeTGrmh5shHCkQ5V2n5?=
 =?us-ascii?Q?a5InyrSKM7fKRLEnHD+S2Cs2JAg3ETqGJJYg7lm5tjufN68r90zZjpOpiK8+?=
 =?us-ascii?Q?1TEcbTemsI8RT0qoSaHEXwziL1d0UcZVBoL+hWSYz3cwJRFQsGWTbGB6whku?=
 =?us-ascii?Q?v/XmAu73N4jFZUy2Ecwt87/gj1MWUOsTvbR0leOnUjtCriEWSBzAW1eyQgVF?=
 =?us-ascii?Q?OT+7rlNjMyu1Qytyed1LsKYAQC6qkaiG9kYUdGI5gk9c/uyzEsfhNpV3fZeg?=
 =?us-ascii?Q?bG4HxvJ+9hvgXR5znz7gd8aVAUSSBCy7a9iGsfaZ0XXDwalMWNQJspPpmZNh?=
 =?us-ascii?Q?tMkMuYvKbn4KSvD4Gm3aYNvFI8Z5VUMnDLxKPWBfmgAEMAb7y/zI7oPzJ68n?=
 =?us-ascii?Q?9Jrpu2Kzq+wDa3VSlPVybxRenZC4TqeXyuTVa1RVke8stGhsPhtas5vrRMO/?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0018657-7f96-4896-c6c2-08db44a4a1bb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:48.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nJg8uodpqvN8nTcDfBx0fsr+zLPJ2Pq+cn4Y++UADSYGJkgJ/nd9Hrp29hcz6JunbLst0uv7ZfBbk7Cy2rimpwjubOW31F3yVRAnU6qA5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::71c;
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
---
 block/parallels.c | 90 ++++++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 37 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f389a74466..c3e220b60f 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -483,13 +483,12 @@ parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
 }
 
 static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
+parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
+                     BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off;
+    int64_t size;
     int ret;
-    uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -497,38 +496,6 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
-    prev_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        /*
-         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
-         * fixed. Skip not allocated and out-of-image BAT entries.
-         */
-        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
-    }
-
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
@@ -548,12 +515,61 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
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
+        /*
+         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
+         * fixed. Skip not allocated and out-of-image BAT entries.
+         */
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
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


