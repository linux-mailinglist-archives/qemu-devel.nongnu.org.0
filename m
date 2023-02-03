Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA168936E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsED-0007KX-Bs; Fri, 03 Feb 2023 04:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE3-0007C7-5E; Fri, 03 Feb 2023 04:19:19 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE1-0000ne-3K; Fri, 03 Feb 2023 04:19:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQfa8+Bo1BxBNFuXAM14A8Fo37bSot0ZhpHr0DZAmJDx0vLMFrp73xT2F/Ko8Fp116lU6DCY9daoxt4Bmo2fm7mP/4PrvwNvLHZgb6f3hAUc0B1uMIm064BdstldJkyMVySA1yEQMhz9zW9O5sB3S4hgXgXFvy/X/qYrqJnlwSxuqwFjsFXTdDTLvM5HLLHPCTTSN8/9kk7zdbghoBZ9hx/wMEnXwjCwsbMRY41PuDhuDXKtd6o8OMUSt4mi0WE9JC0Jjkocb9BOZPGxoZQhcb+jbIVnx1ESUqEDBhE9TWu0mUiRIDM0+k6cP/izcPaMBRqWuy9ISJypAVD5NB4ygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDPIoAoPKaBy2ZTB7r4RxcjS7Yi69Uh1tHT6M7uhW6Y=;
 b=cS/F+lwy+d/drFFwgesB5IzOAUgkEMiXIfZvwX1mz9z1xoRmQOw4Mc174f5ew249+xkS6e6AwYnwrMsIfIBsPJKNLchtLMu9OKb8Ztqs2HOj0A8Ku2HEK9J+SJK8E++syyxQ9BjU1W3HAnyPwDS6eAbgPIT26/Foivs9rOMAibQtXnknPR/RZFZ0mP21O7HkrMDNyoaqjWZqZxdRJhFC/Tjz0ov9540vS9ijXB4pIHEl1tOXgcUqAoWXVz7mAT3qyeMHciayUtz4pmQw5haKgyZKmGm5a30tOkwv8DyR05cB3F6EvPhLLRGcvzqV0JARVDwyF5oibaQkN/BW3KNb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDPIoAoPKaBy2ZTB7r4RxcjS7Yi69Uh1tHT6M7uhW6Y=;
 b=i/IWG6VGmCCXOo1WmziS0HUgDXLkKTEnPb8iTRsGgheLng6fI8urAj5GqZcl3ehigYe5kbpLADApVukN2I9AyIWfPKnQS63oTSrnOHjlKOgfBUtmhhzzfPFmMMk0MFe4xDdYfCOys0hS9oXgDWrmSevZPHv2eigNgu6U2FFztk8m9oxYkcxdKV8Qp2WxIJzidF5Q1BIXH7ZROwasF3onIvWzWey2DauBaMjw2kcOiWL9gsWMkjGgrUX3pVkS9kD/e+giZDbP3TAM/GP6A5qFnkFXsw6WN1NUqp2lM+i1TaCCDmtHIHpsAB1FPawOdMjZmOCTbvWsPzNOYGblB6gRGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:06 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:06 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 07/12] parallels: Move check of cluster outside image to a
 separate function
Date: Fri,  3 Feb 2023 10:18:49 +0100
Message-Id: <20230203091854.2221397-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d54c269-f0e0-4a55-ef14-08db05c7b31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUofL5qVXO0aBhUbci0X2XlimwZRPtTWgGBodne914sT+jPljPUi3bHyuzbvnRsAX9m/MPAlvYLzxHhwiVFTp3pWjGrGuAqsQeyjtcwTgwU5W6op4u43T4ZsKHiMRVKrV0yLS7QO73n7C/KsMropU5pqTm2G/KzmKMTs4opa/aFbtjOyfVDUJlYo8HBgKl0iMvWH7u0BZdw+I4AKG98fTW+jAHzuuao8Mukeb2TYNAJvqC6k108dKGOTJ0IFkhj96rp9HKB64UzkncHyMeY4/XYpvjfsspKAmTuW6nDvuEB/whkAKCyl61Kyoeyd+7L9tuj9hVL1e7Go4ZnIvI9xF1FjoRQay1Bk5aPDEbnCNkTIYd2ydx3AuZyMZ2QSZYsaiiK802BHLlc8XVdZ19Pp+ikxM1ZqpD/07a+aWFSfrRn6/YRqZKckRyWH1oWVS3KLrf5YFHufnc38JRDR/9yCfFHJ1SYb8EzUMmZt722R7VXy8eJv3pSFvjH5SR69qDUIEEiCACDZeVJqekeynQ6cKiaSelIRaUNsRqI1T8a/n6wt9+6gyWqN9YEafFTetGK9WzUejhp2opj96/eqUnKbQFq9RrPXmoUXWHszf30CPwM1661hndhWoQ1dWr37PVq/uyVQJLbpCHp58SuELDh77gXKX97kE9ho1/ytvpW/b16rfXqgkHJCVbzID2pyTJlUUhqJasmgd7t4bjgYDkWDYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jip7Yd1qKqL9LpnKAjI1KmY39v5eiFmkZ/8q9wh5t8ZtCsmTRZBn1xSRmlUK?=
 =?us-ascii?Q?iMk/G+FyaTm0B8fdcJxCfmNEYsllkvUPDz+uv+CbFYRBRxnQD4lewGILGAYm?=
 =?us-ascii?Q?lNV7keUNXFqopM2hXWirRb23sCUJV/oinuEZ6weaXEnqv/qPQ252uO8Kp1Qf?=
 =?us-ascii?Q?865IiGHIkAxzjGOr4bOnVwy899deC2vMLfslhd8LxQ+1ezu/aQ+8oH9/mZcD?=
 =?us-ascii?Q?TO4FxazJPmD+gzzZ0KBuvGBcB+1tsbI67vHe5gJ6lyAxpCu7H/68ppwIXE4G?=
 =?us-ascii?Q?QoT8mPdn3Iyiq0ohNcgovNmrTm97KwVJRsj9JfYATQXWkW3OyHuzfBzM3Cop?=
 =?us-ascii?Q?cyNbqB931yCRW+F0exxF5mR3VqbvIwFP0p6E7bAULBT/PQNA6zVCHQreIF7e?=
 =?us-ascii?Q?u0DTpUHvuCq1NMVqxQMsJvY7jKdH/KKQdFZDIl6LsnZI3htA1JE328RRFGVK?=
 =?us-ascii?Q?F+nAKIjLlRz18eCL1+6kjxfSWPP/jIJuWz+9l11SdQ4imaY7t6foDF6Lun+D?=
 =?us-ascii?Q?nxq+AR+eNPaGWPwznD7qij1DwpvVLHQXjpXNe1O02Hivv0X6OQBXYdmy0aS+?=
 =?us-ascii?Q?4WwK6sSK+zI3ZvCkHjiedHpqTz6ENM27tN0k/VHzids0DJ/fZzPYyyG5nk2p?=
 =?us-ascii?Q?hn7Vv43SdDDpVH2TAgFTexq8dpcMiGG0fNPs2YhOfi5cro+nfhE4KkYeRPxn?=
 =?us-ascii?Q?mtSndUTIiq9A6cCuO33Upt0INhluJDPPqnDZTAC8arwPRJe/EZ3otr4eDStq?=
 =?us-ascii?Q?fsak5MNUtl744urQX0hDU8VIsOJArEm3n040RwMTEpbBYOJoN/Q/fRRnz/ic?=
 =?us-ascii?Q?yLGDgWelTWsIzNXKUefzu6Af36cwR06c/cXHUzEYvXYXDgr+LVdq3j0X0ySb?=
 =?us-ascii?Q?fb40D0Dxuo6KksvEjMY00lkQOU/olsu1P9+zDcO0yElkrYGn9bHp+xebAlm/?=
 =?us-ascii?Q?fqtLS70glAolbB0Y9njiKxXJbie0YMQVEgTtv3esah0G6hPLLT8IR0qttosl?=
 =?us-ascii?Q?bwHcv/swS96InW8xryFaf8l8RiyfLHqw9UralDsgxniHOcd+nI3uzaIyY2no?=
 =?us-ascii?Q?C86gCcJd3b7NEJnaWaUNe4wcAbVqLYWx/vLFByAwQSIH6xTRwWHfFC2eBlA1?=
 =?us-ascii?Q?nmR3G8uF30s93+7PgGILSoyU1fsODqUZmhhHBglmuAa+n+qPbH9GYlD4IODZ?=
 =?us-ascii?Q?zXkGVW0wLf+Q5tjcDRqmsLT3ZpW5cCe1/86xj1UdIlB/Tlub+z6zxsvQG2fm?=
 =?us-ascii?Q?sQkvRylbhYfZQL9hkpPFa4Aho0L4uZmtsGIgnuqkJZnNXHnmWPp+pIdUXZqb?=
 =?us-ascii?Q?BqPLvMe1sXpAbdc4FmR3F4jJ5bbRnmFAfbOunshPPbCHgFSXShSDdSolH6Dw?=
 =?us-ascii?Q?bplw7XGbo9ZmKe2DXwKf5ekWak7Qc0mcJy7/dT84QEvCL5i1khhJU4Hyjc+m?=
 =?us-ascii?Q?OV1J68YZdkPg0woexJ9B4HH4gOOZ5BZd1XHLTtXJDEEPlGQNb6hp2IWJ+tJW?=
 =?us-ascii?Q?aMklZmhCJjNcEBuO+56JlhDv5ir0BJxFa0DAx5DCm229qR5Pj9Yhb2JTxMxK?=
 =?us-ascii?Q?I++SrirUAmUhe3ZQZk09zRFyN+dXbXk0Z9QCT+iBXtOchFfsPsvl3tyk0yvE?=
 =?us-ascii?Q?8iqgDy89Zpnl1TlRZRLyeiQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d54c269-f0e0-4a55-ef14-08db05c7b31c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:06.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3iYXMRqGAfUcLGsZPOxEFEMBvHcPBEQ2OHSIK5J4d8L0s5FB3dRAGKSDy8f2i3i99LIUn7W76feBwq+gOJfNiLlhdok8nXkRIjwuurC7cc=
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

We will add more and more checks so we need a better code structure in
parallels_co_check. Let each check performs in a separate loop in a
separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 81 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 29 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 02fbaee1f2..f9acee1fa8 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,14 +438,13 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret = 0;
     uint32_t i;
+    int64_t off, high_off, size;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -453,23 +452,9 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
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
-        /* cluster outside the image */
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
@@ -478,19 +463,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                 parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
             }
-            prev_off = 0;
             continue;
         }
-
-        res->bfi.allocated_clusters++;
-        if (off > high_off) {
+        if (high_off < off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     if (high_off == 0) {
@@ -500,6 +477,52 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
     }
 
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size, prev_off;
+    int ret;
+    uint32_t i;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
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
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1


