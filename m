Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F98A5A4750
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:39:10 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oScAf-0008Ta-Gf
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblV-0001Dk-C5; Mon, 29 Aug 2022 06:13:09 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:58593 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblT-00066e-Ml; Mon, 29 Aug 2022 06:13:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCFSSOLH7vQY4g/pwD1CrzANawIEHltnnU+juHkTUYeOAYRlKBxj8pOlBKWHqAANu99IUeC/efn1iRYD8leNdf0Fm6bgxlpA01o2U4KGTm7RJd/WaiisDxqaXp5epjL3IUQE/DyJZ8c/wolmTnvWLzQ7B3Vp7ZRdAcAOdOFqwPYuNHdMEM/P41c/S3JL48ilWDgXorB/oU72LQl4YQSy66CxvRPvEYmB9nDHpCZi6t1sgbIUf9eNCmTufqsb0vRKItga0PT7I7bJoYkRw5rcE8FKdZcZrnOzAoYjvZ1ag4WokgjmcRfnOtAJWSm0g9i1Za1f0qbI20JVtPcdgGjJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4Te2roYcHG1HhYssh3Reheea3kGA2fWHp/VW6Fo1bc=;
 b=CczIxBG4DBa6EyU7tE0gHPO7WrWPhBRf02HiHUTGApiMWwX/TMYJjSgQlQ2p9OIO1WCfCHydIjxCL63H+q2L4giDArIYyq8a9kP35lrGyTn8s+6ebp7jpHKRS8EIhjyJXvXd/p6FrgRiyKlskJXTznAK3rIT0d9eZbUuFP3vRVpxz9AHzkSf4NloUakbXGXGJUzL5Zsex3cXQQ66fZ9SW5cCxN3d0wJ0tP76n2r2fa2OGkGteP5CeqcULfjqOvM4pFoW0NzGbsVoDKIElHqMgIB7dFvAQJEygXi8hv3bZTiuuKAisZ/z1fIT12/yTl7ao4B6brdy/tBoSUikliK7NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4Te2roYcHG1HhYssh3Reheea3kGA2fWHp/VW6Fo1bc=;
 b=EX1Vse4XEkzctAWM3xIkfoo0NkwsYvyTvok2eIefV5HrIDCKcOFGWpHWOb/55s8+EAfWkV+1D8Q6CpAP6He5WsO9WoiVYjwfIU08zLDPiNW7fxphVdZxxiEYkB6yCJt2SYf7ECQFbyocAzKt1+ZSl/Sfl2mDrcbO7pnQjqdC2cO8sdxLuFObT2p8LICuDx4BJ0tBmKorbECARuSYagfXs8ZmuiZa7E8HABcEchgd6U04XsVz/qggkYEdZEsKr9FAB5n5XNQwZlUnonuZN5P5GxukOnPjbQpRci/AE3mc8v+j5Gq5txmo+QcEODlHbo/egCXGrJ8TIwcv4/R3uOwY0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:59 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:59 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 08/10] parallels: Move check of leaks to a separate function
Date: Mon, 29 Aug 2022 12:12:43 +0200
Message-Id: <20220829101246.343507-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46d6fc5f-ff95-47f5-2108-08da89a70ca0
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijez3AIB+v812CNzFdd13zBBSP5HiDIIaOqov52yzwYBjsnarJqEPg9mpF+clL8HS7kGJQXLW4usXX1m3Zirme69cezvZRoB2K0gH/x5y0FDYnsLPuakxY7PXAuxFy8rLm6jKE91tGz4z2mF0N98104o5ERaPbujlNXlWb7HVnUr0ikoigAXuI5bGZwCUXcchG/ycL3qe8Sh+i0di4fNYG3Z5dJixpbm8o3DI1WeBbw52qoxTjD+P9nabcVdVet6KjK82XIKc/j7knDMbA8rSCLUvVpPgJ4vQYTf0vQixS/dwCeukRqmaQtmQTM7CXJr6KnwtpRmzfTA7lSsn2HPcAbFnAvyvzviIFejja+3GGSl0VPBMPuUkXon8bbWP+uItSFRYPUdLmiTZewljXxMlZ7ZBUSsIdRaF+KL05ypjU32gAILsgUppAPKYa8Hj52MFvVuNJYMaKvKWv6S9WCTQoWGB2sasJ+yKCtuI0RAtFd5yv12FhjppT5o/6/0qQ7wgXD/BrYnKPcFKbikc3OT6odB2GSqGMnIUhQC8FGSBwBFsK4ltK33pydFVqlLQHCCfT/yFDaste+PV+j8Rrzoqu5j0uErlFDGiNspWWAa34/w/8buJ7/8zPUhMVE/XJYIlHG0yVe3/mFF7uRhfqVO3WGRPX1an59okYLsEQ5KT1hCb48oq78x7Rl5ocwkciEFTHL0XtjI7V8qQUzFbhSrJ3rArBzLq+NRKSMn7x/ckNTbSbQQT5191ovC3Cy6NbQLditsaABgb2qNZaz7cpa6Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWieq6UmYH+F/3g2cwiWRQ4mOm+yg5wsfUfL6skW5EYuuhwECLgRiaZYEbe4?=
 =?us-ascii?Q?7adRnPN1OBakscMv5avt0ubVKhsIRxPMdqtlL34jIk6/DbZeZl6SUG/6FkYM?=
 =?us-ascii?Q?8fhWRWh+/O1qvLTzW5BdlbKPqdgKInWfl2QbePEc34aEBQv1fnFBmT3P3W03?=
 =?us-ascii?Q?UKKWsoCWGZFcK4dNtLkoQsL9LZOST+D4UeVaG+U0cEfhsw8RZI0tOhkkE3hh?=
 =?us-ascii?Q?vSm1f0uh+wYeAE4l5fctVYh7tCjM80pu+9+Bkh1rCl44ogGCGRAA1cOFqyOY?=
 =?us-ascii?Q?Lz7Kc787Vqi9EhrtzwLaNNs1bOzHhbidaAVImWFfWLfcn83IbjXkjV7n8Ukj?=
 =?us-ascii?Q?5OGTJ4ec6GjTlTWp1WFNsqawDPPeKcd4NQ21BvdIJIFV3Bxt6xn3anZo8ryU?=
 =?us-ascii?Q?0xJcB2uFhaXpvdZ8qKLJzI3Fztz1PshsABuB+u1TWe+kPtGk+Dvd+S1mi2ii?=
 =?us-ascii?Q?ecBQIOc44v10I7O56bE6y3sqIlqDrCUGBc+B+VyBc4I1bSYnExJWfhD82xVF?=
 =?us-ascii?Q?o9pWKRgt72um4vnmB0lpzgq6MiLLKuTAPhNsjl8dq+2cl8CqzvqPmKwhY2Bj?=
 =?us-ascii?Q?XkZKn/9WBaSMundsTfSS+AY+uYP1I5lfVqVjVt8yCL4vb9gz8ztskbo20svA?=
 =?us-ascii?Q?IEoNPyK+zlFb6vbsYUBBoKM5xHsK7a+PWI0Ulzy+eaUoye8sEA61J37T7AjY?=
 =?us-ascii?Q?1P+R8nnXaLXk5W41NY6GD7cOsyjOLc7BX3DhwiRfhUj4WqLeK4GDLwEo0Bx8?=
 =?us-ascii?Q?z6Oj8pnDU+jvai6aef9A/wq2P7wKmGFxOJjiU8LIdWc6erCu+l3dLkgLmaiA?=
 =?us-ascii?Q?sET4aL0MbY5d3QiYdEUKDs/r8UZiePnY3RdCyIsBM4zb1d+KkUyCxYK28koS?=
 =?us-ascii?Q?PoPkyHoWsmjUn8zOyAbXw+W2QTPdthb5tvMXT6Rv/u42MKgeIaCPxNP90Jv1?=
 =?us-ascii?Q?UAhXx9y4MuM9Ow9RkHjSjuatVlN8cusVXm2CEjZk41F1UujQlxWrrf0y4j5D?=
 =?us-ascii?Q?NRcY4OlakopJ4ZMWnpMBQ7RwSTGdVPmTdr9JOFiXhC6D6WFrAu3hFka7DSbf?=
 =?us-ascii?Q?mv504ZEeL0SviFGRJZdut+AbuKxWf11jwmtjgJgiiYYLu93MAzjm4BRcFqLw?=
 =?us-ascii?Q?IKkHk4UssdGJEOxtvaobsOMHnIJgWZW+Zgl8ZGaXzRnn5QFFEFTCC4Enp1tu?=
 =?us-ascii?Q?NYTOCELt3Gk+2ejvEXxXBEa5VTymD9x/LJV1n33CNSaPjd4KHOMIvBn5p34f?=
 =?us-ascii?Q?MCHR0ozMMaArINbZKNNLvPea9q5MSWlJnVVboQsnTyUJrw7kxWoqsmxy0fba?=
 =?us-ascii?Q?YlwQZ+QZVYadBijIwLayr3De9tIyZ/0DCLCmU+b/bJNK56K8QyE1+NqhsCkm?=
 =?us-ascii?Q?d4rHbp34c8AHwQQivgPOkTrKR4JMau8EFSqf1NZnkR9/gMQ2rtZZLB1XeSQj?=
 =?us-ascii?Q?QOUQUmWaqvU2SpGKK8FpD3qIXT00FtEdIivQ1UE8IoYS5mE9WnO09hRvuD2H?=
 =?us-ascii?Q?kQ1uiQNnYhHlKQhbhd6g5gBWu2+gBS6oEhU+DJU7h84d9WVdptUzUW6G5XkN?=
 =?us-ascii?Q?XC1NW67OqLdOIZYCkBa9CZyj7Rly5+OSYv0+/QDPEnQIWBvHnDt5u31qTiid?=
 =?us-ascii?Q?C2SjyaaIc4OWQb0FGdMmI64=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d6fc5f-ff95-47f5-2108-08da89a70ca0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:59.1960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+bfYUt6zkvYw5vDXQzEx0exwZsdlmN3mENSku3DaTKlg4g12wGahOfbND6o8+idxPFb1pzCBN7D7tzjrISW1WkOdXderr0+txmS+3DIGNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.14.108;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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


