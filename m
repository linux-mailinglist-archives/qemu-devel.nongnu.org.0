Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C55A4747
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:34:41 +0200 (CEST)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSc6K-0004ek-LG
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblS-000177-Um; Mon, 29 Aug 2022 06:13:07 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:58593 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblR-00066e-Ai; Mon, 29 Aug 2022 06:13:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP2w+E5/C5ojUkqQU5d23Wczj42Wnln1bNDGHu5J4bc8Nk7A/HsVdtVWzSlYhYLAsA2wjg5Ny5z08OMyjwgSSGIp35i5VXWmkj4rgQf0Rwtxlbsn8oYuJUahV1AP4QjQFBvGu+G+b8D4uZgcJUwlJIDjEu7Ff9V7DzWT8dLUb3AZ97F0JoExfDrUo+QqNYcXs/xFZ9AblheFB4XzzHZnGUsflOvu0q+4SVyuhyI0go2KctSMCKEQBgjjMIQEg55qKqXmrw22iTK3rx4fuoM/9rX7b/TNCBKIB3d0+jnGVl9k8NY57ex4waDBeUnO+F9b9/WybBvssys8nv3s0ySZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHDIe4Iu3ENxd+Rq6crXwWLf1mk2dxrBPElvAXWaSC0=;
 b=Se+IS2dva+qQb1i8wXl9pHuZufdQfcOWQ6aVthUHrNtr9dTbpA2EdSr2ajRxkGJb+TCPzh1ZvtGlDMa6xv3qNN7UVjHwEYeKFOmpCwr7MuZMj2mZwcE6OiJoeiFEQb2EIFRa6WrIrHwqkvA4Ivd75pODZbWKMZka6XIwz7tcUoVtgKVqZx4d089YqdUZ7/RDZFFxLia+nIf8eXa7vw/XwY0+AKnEEhN7BCOB9Tw835RTThPKgQQA0Y4lrxsN3OPXXBnUlJ45eM0gl3/ePvArU5F1hXNSaxOsW5mF0j9Bfl0kk7XOBXk/IK0D6brk7yymgITe6YITt3+esFiltPUlQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHDIe4Iu3ENxd+Rq6crXwWLf1mk2dxrBPElvAXWaSC0=;
 b=haq6ZmW8gcMtVDf3fKMXm4T666Jna1lwdhHgGbKJEraBUszp9we9KLx3mhRZeKt8STERzgUd+HqFv9dw9lw1cIT8bMgYIiDibVhgve2DtjDXNIW76dmHe7Mwwf2BveJiXO0bupW1tG08HhXtqegFh21aC3t0MQbkObmbMmKFV5OzhTbOF/8RMIfszIH4KFHSsAft6XD/U+qyYcJjELJjQRTOuyiRzhdgSnw/gR0MT68CurO+toxvuCF0U1BEpPmq/U98iki9t3LAkVWyPU7pKIMGuPKHLmJyGaEIL/fmNKEFKWRq9/YD2Kg7We+eCuheh0fYckB4i32EBt1veFQgxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:58 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 07/10] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 29 Aug 2022 12:12:42 +0200
Message-Id: <20220829101246.343507-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c384daf7-0c08-49c8-3828-08da89a70c1f
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHVyc4CLwAawmaMQ+wi9DDtdmuJBdUDnLRr3BYysxVw5GgZJ13g/djf8pwXPEYKCxBjhsNUPE288NGPXXlP78ngQonHfvNPBN27j13QEfMwCgZkIPahBUC3S733GTdEjEpI+uI4uZzOIlhq5eprzESJSsVCxcmK4pCGuQF1SwZZ8K9lozIPXpZ9S/Ikfh0JgcZghcCbtzmSfyArLjWtaTFOS23LCCkteLFf8AuXqYVfhD/4B9jFPRLj2qtt8xW83TaL+Goc6epSuJnmI9N9oDVwEg2tsA1G3KrKf6MBC3VPcSlfkju6OUCV65UUBmX47DABwxPoknsjJwlqf9YskP96jvOvAGiRHtRg+Oa9D1iFhpzPLGXOzsb2N0l9JB9GMg/wrR+ucHvPpjs5G2Peb+cv2ifgwnK7GPhnbfn0Zopfp73DZeIz4Qie0rwKPGsbiGXq3CQTyn83Yw/8SEtu/1SwcAXDsIfVp+yu0jJwPRn13pPDCxJuD0v9U3ETajpBVXtSU9jC6Z9UJrvjJHvPrn3wh9Be98J33aHdPJTGvEc9s6j+iJRnxAz6u/bx6b4HfigjIYAmsuNn1POAX9XjzxLtIcdlFFgJgVaN5xR8R16k6eHOGaCqJ7mu2AoCcbiMqwXit2ro4Chi8z/5luSSPRYKR6GTwWcO7OAvVuFetRa/PRd5dY1t8Q5WfoCbqb5fbqzNeFV3Y5Im42SfICAAazqbzEMFFnoyEbyNhoIlP1yivLGayRLEWR6wZZOhdzdmIRuUGoEZApjO8YSSqmEwL4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AmjTbOm+mTZtUkwjYN2MRfujF+fs3zbKY3WNh5LhfEIC66BxalQrZjJ9CVuk?=
 =?us-ascii?Q?ZGzkldASuMl05zd+ZbQQ9QbnwlssEDnzMBVK4PEUCAjj/hX//pFhgVcsY5uR?=
 =?us-ascii?Q?V4dy8KHL0iMw5yAGH6gte/uko0WMyILFw+eze5EPsV+adu54GefACYSNEbBT?=
 =?us-ascii?Q?AOkp8yCUE6i/k4Sdd66cVRgAYOBzBxbYEpOkPP2LTsEiGlTmd0JqV3HxjP2o?=
 =?us-ascii?Q?deuHYB+mbvBP0Q8saI4+cX5ssuan2+5ln0ZQTO7J0XnXrf3Sq9oGdsINK8eH?=
 =?us-ascii?Q?A8w+VsWD/ZIimXWO5iJ6B0xa0SQ8pK+Y28XIa7j2zp9gJgGSkcO+N3Cq9nk3?=
 =?us-ascii?Q?L2Q5GR+VgPkSNWWApONXh3TQeYW/C2X/Qu1Akgq1FWBl94xP0RAWy+exwX8H?=
 =?us-ascii?Q?BiWSOkwDIJT+9wq4v5IsIDmOe+9luixMD9KMZCRywOnSEKo54cOveZjJgrcI?=
 =?us-ascii?Q?m8WAgG3DitUtJgbLdfHQ+poZPgQ5u+JYSGOWTA8yZUtC8MOdR/mtsmokRS8M?=
 =?us-ascii?Q?udYEgxZCnpsXjuh+XszEtxY10Vgw5T8JWisKIZcD0CO0jP/VoGUGE4XRkGIO?=
 =?us-ascii?Q?sN00PS3/GeUs1QrceTiCPf3dsTGx/y4lynnN6qVO6P/ONOnfDUZL4Z9Hg8gQ?=
 =?us-ascii?Q?0YDSKuciG3NzBc4z08ylub3cH5Jh4UHp9AaPyH3FHOietqWrErFcL2VfEmyq?=
 =?us-ascii?Q?wC/jmh/0dWObefSFfS8FbtQD63r2A3HAx5ZjPTwjdz0Qtws3m+n9R+sRy2QM?=
 =?us-ascii?Q?BkxOq1CgxvMJGYLBTxL3UNVh1gcT75uJxguoV8DMJwjhQuNttINp8X7tMY3M?=
 =?us-ascii?Q?sg+88x/CuRQ08uYKSEjd+ImkOoohchImtKxKLGREPOcuEJEdP2urwJLqQC+6?=
 =?us-ascii?Q?v5fyaKpMXmHKhc7Pbynk4OY7UuFVCOzqDZA/XKvyyW8IOPCZYhFR22H7qIu/?=
 =?us-ascii?Q?QiuhzPU3diYn9ZyDKSQY7owADhDTVXDwRgBTXR7rV4QU0uKb+tgRKHzGocyH?=
 =?us-ascii?Q?zccX9b/46GZgX9/K0jyriJCg5vWxZncKCH85KLQCSkhGncv9qnfCLqKrn6Zs?=
 =?us-ascii?Q?lm67OVD55ibxaizxDz91Byd9rpSoz/YjS8OeB+KrxHtxfaF2t/C90xHkmAEo?=
 =?us-ascii?Q?JaFeh346ZL+fezYBIMDXbFtOa+WoeXeFhAacnuZ4ZzOy3Bcpi8zXGard74EM?=
 =?us-ascii?Q?9v6PRR+JOlqIw4Snj5cE6qnxxCn75Y/jKZGkuqxE9gn/9W34hnwjcjwudY3m?=
 =?us-ascii?Q?gCbe50M8Ckc0bxWnoEvKeSENBN1KABxhpIytl8w87da9kERL7NH5d2u0XCbq?=
 =?us-ascii?Q?afhuaRY8JROlP8ZTIv3kx+mYePiiTufXHxv0UqPpZMCBIsuPnvh7nLStZ33S?=
 =?us-ascii?Q?xHO2ejdrVUjPSlYiASEc5o5Rg+sGjsqCvOv3ICbrYjvT+ExKAU0uN2/MrBrX?=
 =?us-ascii?Q?k+p937Qi1/0qCD7nBWNjy/qyYSz/1IL20u+LzirxxWOtR07x9nIPTrTRWyt6?=
 =?us-ascii?Q?YN6WSTEI/rSYDJb5xJqX6iYD3ES8ynAhT2/CY+hwKGU7tknqyoujzm6gsQWN?=
 =?us-ascii?Q?fsmDaK3OSqrAJJefRzksPT7w69asnF1UEbx/MnnVbdFX0K/swtZD8IptKehv?=
 =?us-ascii?Q?Jtfnx9fyKl+DIk8ml3VDU6g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c384daf7-0c08-49c8-3828-08da89a70c1f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:58.3512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjtmiFcA3awxh0/Lk9jnmCKvug1DawNBus6TWhoDqACtJK1zeg6Tkr+WvSl/7yIIPJjd7nwphfLWcyqia4KAg2wy3iuD9EyUFtEVm8pLhfk=
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
 block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eea318f809..f50cd232aa 100644
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


