Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63FC66B242
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:00:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PF-0001nf-78; Sun, 15 Jan 2023 10:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PC-0001ky-5S; Sun, 15 Jan 2023 10:58:46 -0500
Received: from mail-db3eur04on2130.outbound.protection.outlook.com
 ([40.107.6.130] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PA-0001Kk-JZ; Sun, 15 Jan 2023 10:58:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTa3EylP7zSTVuDQTnMlpYvnz/NKeNGPDfRCAFPJ9copeOrc9LpHqWaxbYbjIe9/mnQmyorfMhFdbzJRBaderJzKTNveRcnh80/JuZX6LMOtYmzADJM6J9OnqyTuYt4mQkKGQWymEs01r8q+YcyyjZuf9RfwIoQBouKe82tCCQvmnUFA3NC0OdEPG27bUDFS5tjnHJZCEAQDV7mjEHz8W9J1RQl+Q2A2lmMKF9ZGqHY+mT2lOkObRAgonwd1nZPGPevp/c8UkxlwhLYs9IlZg1Yr3DmBYKKwgM/jIMkMozvYog9d+hvi6BEGwj3XbjVisc7SNRLYvaTDYIAhQczPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX82eY9OVKTk3V+WAd84FKsP02/sy2KoJqSwNxgWuVA=;
 b=FaasdAiwnkkXAJjXvf9rhAUKY0eRPk/iO8sZhvVQWP2iI9zTRi2lYrSa211vPdjBgw/AH6DK+ziJCDJShk+03T256RgJKXl9CEMqiajjr31/VO6W6gez/WReud92X1PV0XoCM3XTRBX8+ofnlWWKrDW8cl88sMiYFYGHg3dmobqOxhFqNO0oXT37c4fLY3dltmYGCOojK3XMdBniTe2WOKYOXlY6J6UDKpEwM9l502gFvV1Wlx7+xNIJl8xkgK8TNqJMvFC17RMY9eRJ+SGSf6s2zOxqM1V5b7F+4x0wiGxPIf5YusIPpF5jlsoGfvzCAgKWYpDcsDxWCo+S6kBHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX82eY9OVKTk3V+WAd84FKsP02/sy2KoJqSwNxgWuVA=;
 b=K8msVTa0dMRqjeh+6Or0XgpYAQVYHmKRFkpLka9pes9nSIdaddWu81OkAQTkMbvZCKN3VQkBb3pJL9gxs97k57x6r7B1ywBMjdyHW1dUiYaHJWeOBdwaa/OSi6qYpN+BBQ4Yf+SkruMqfzpc4Ds8TlVc+P+o+TEZWygaD0tVid7GpV2dfjn9+781mkSROtJ6iuqkPgA9WbM/r74lVNl3Pu//iomV5MXo9Y12yf3mZ+qcYbbrhiyVdExFT47UNTjLDvGmhvvFR2TpXLh5wFpXQfR520VN6ybyHvku6eLSx2Zyism7UqF8rhUu2aCwgtnZx1fyxKtYyb4zuJoYPBB2DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:33 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:33 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 07/11] parallels: Move check of cluster outside image to a
 separate function
Date: Sun, 15 Jan 2023 16:58:17 +0100
Message-Id: <20230115155821.1534598-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d928ba7-834a-4219-5227-08daf7115a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXyPy9nfVIMXGaPUICkVZUKK7/0wOfk6RpUEWahqFRvmiTrtXF5VJ2dbYYgFxqLVgALeoK3MiADHCHySPOU8yy/YyBUKNl23Qmui9yvEDRG8gya+dOb3x5L8rHPeEzS/EAMZuluzEMjYb6MDOT8+Ypf6eztwLYtpl2HYKpEMOj/TOq/s3HFJ97IXoXCTpzEv6UuyulDIGb2nNrGQ9gBtJrhvmkY9UcTePtbMUR3xXz+eMZIAZnl2PLav3+j+VG9iFPTjgPlJ8QaVXGqFqz/khzjLKwADQeFmNkBbyYX7P5ouHPOWhmMrGZTrJzhZfnQmYzQEIBo9KLZH8WFrgyIBBSvD5Aa9bg5tsjcXnow3USn8O8jwbxi+QE0zvvpRs2HcR5pBrpJO5xNFs/GTFI09LEtzTJzrQOAj5X5zBGVFDcf98NNiitiGT2rVbjkq1nqS9mdu1xO26ysX5cMA+Fb2PEmuD7NcVufs7qzgP/+kHccdxZGWJcopZQcVwBX1jikogTkhPHdfzK9Qd52h84WH2MrNTpZRm/P/Y24u/8NRCMRSA57tbJHKeXt6td6vTikPbibM5x9XrAYef8UaM49xxXMpbZAHONdeR5eRaKbkxmu9N9VUWQ7Vo7Kr2+7h4rO4X3Dw8p1UjOsl/V59NL+1Jh1B9sFi3sbMdAqDJUe0VRi60AqXYy6EnNjj7hWkyB5QCxTQNpuFfDpYF6R0EaHYDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z6o/SASaOyb5rHEcPNeCLKc2OWQZ05bhKuHhWoS0vXpftogO91OLuIFb8mn6?=
 =?us-ascii?Q?eg5+Sm89sMc83KGAiUtMigFlQL4Kg8X1EGIM17n+dlKUe/ks8eH4hR430XQT?=
 =?us-ascii?Q?+B/KLCYmWHG3uF/hLgH4qAp3TmZPL2+toPxoOCl/SgJ/zubwvox3BcLhVHob?=
 =?us-ascii?Q?GEaPz3C9UO/G20w79gGrzTh0WyABwNXZv5vjESKbSz9eY2eg+ckPsNnk52Hp?=
 =?us-ascii?Q?FjwbS8yfaBq6fgQuQHqgx9quzRNr4NTkNHsvagldz9mIHLe6bOfb7nENmlGp?=
 =?us-ascii?Q?BeXojZVcd9FnNosz94BeYYX2psXG1kg2G3cnUO+agVy2FSZ2n/jADZcwTucD?=
 =?us-ascii?Q?ISW7mDpZBe4ylvAQdNtqURl6beTxGOFDEEM4tKH/YjokrgwM1I6x+Qj7IY8I?=
 =?us-ascii?Q?60kU0vdG9R0W8CwNFnEVG/Q/kz/tf8Q/yq0xYLcyjRku8qQ00CbJcdR4coKS?=
 =?us-ascii?Q?bUrOlOiZQgsVkONwVxV1+sQvvenmfxJRPYZk77oX/o86A//v2JhrXmj1ILeS?=
 =?us-ascii?Q?VG5a6xBUYYDHAi3tCjLhSMpk3a72gxyy8o9StsTYPsWZGzto1kEhELAOH9zg?=
 =?us-ascii?Q?AY4rvHVtG1JS9iNTD4qyshJDhpsn3Fodn45zEBqpBAQgm2+gEdl49uxM8/qJ?=
 =?us-ascii?Q?38sjUoiHgx1r4XgZNyhsGHB6DqfQr+yfROUkCVtmZbI3Ud9S2rUTXsBnrqyE?=
 =?us-ascii?Q?DUOYHg9bWACBzD++OwceHnJsFwLGv1+EHmsvySIM3T9Opr/azxmAo9CEEims?=
 =?us-ascii?Q?JKGoa64KuU7xxyWQk36MVMJVjMfgG6Z5Fiiah4dr/thusDh6Bq5wuQG5IOXn?=
 =?us-ascii?Q?txV6CHL/F1QdhUf6zlhqfHPZ5lONG8gy5sCJmqCynoBKBHRIYoaclNrN0+if?=
 =?us-ascii?Q?yPEXDUnZeXlVvjAKkMRvhQdp5RQxV+iBPw48JquLcTKiph83TRqZFI+10R4P?=
 =?us-ascii?Q?Jjw+cAmkTgEN+Tu3z1CILMwDU5ElJnvDfbec8oRUANlFCw9XDSpaU/IPOsR1?=
 =?us-ascii?Q?E3I9qydchUzWglb06+CgzWymm9v55cE3IZ6l20rSFGAlylLCuK0HdGzCJBR7?=
 =?us-ascii?Q?+rW+0UkoUOFcn1cxnUhY3mBNouLsuxFxe291o8f0sPF/EklGl0AFsRFViw63?=
 =?us-ascii?Q?uFNvwuXSbDCE/VRACckMc2P+dNgc3miMYhMmKtO0L771CI9Zlze60qX7V46m?=
 =?us-ascii?Q?tBqOl2aLlsaqJvVkSwhj9ALoIANPXhb9T2w9tAzucDV+EiIL0HzUZJvR5OZx?=
 =?us-ascii?Q?coNJowpENK0T9ZfaCnRPSJW5pWwmbZ/no4yY/5jJ2U8hXU5lgu4r0mONlQ6L?=
 =?us-ascii?Q?X48Pratm77TJwyH5CUZ6Pzsgi+f9j0422GLIhNQzY5CFM6yqYpDh9WgmB161?=
 =?us-ascii?Q?lIgWWmrsDBIBmv0VvIc7/yp60tdtq9sVhK3KcY8suYdMsHmfIIo3Q+WozFoC?=
 =?us-ascii?Q?uCicrt+RjrXlQ3hCw7V1Md9KEzvLpCpTztzMcCDOJi93CIfroRJIm3yff5lQ?=
 =?us-ascii?Q?Lk1AvuYTcbhl1rlwURKPjzEbcrCdi520YWfIlTLRMlgOPqy9QPY4kxq7OY6G?=
 =?us-ascii?Q?NaJRglbW4kCMi3XcaorGWE7Q5yXx7ajTmiP4T/nWgNBzIFHrUBPKIA03Eo+3?=
 =?us-ascii?Q?pVPYFrLRFiMsHmWLlaN6A6k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d928ba7-834a-4219-5227-08daf7115a3c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:32.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZW33nvpYEq4wI34vJodMZYm2FgTxOrrGDR/FiZHT4cRuS0N9allEY2yQDxQg9uJhLVYZ8flN/mkOfBXJHnMIrRUmzqE/OYoyoauVXu3AMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index d48b447cca..3d06623355 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,13 +438,50 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, high_off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    high_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+            continue;
+        }
+        if (high_off < off) {
+            high_off = off;
+        }
+    }
+
+    s->data_end = (high_off + s->cluster_size) >> BDRV_SECTOR_BITS;
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret = 0;
+    int ret;
     uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
@@ -457,6 +494,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -469,19 +511,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-            }
-            prev_off = 0;
-            continue;
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -519,8 +548,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
-
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


