Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FB3F9EA9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:21:31 +0200 (CEST)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgTq-0004EZ-Kv
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR0-0000rL-QZ; Fri, 27 Aug 2021 14:18:34 -0400
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:12641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgQy-0006Un-8v; Fri, 27 Aug 2021 14:18:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag6RWeZsoSMxXBIfpZIDMIdzCAg7Fq9y/Ki9Vp/oC5qyuPx/L2465N53jjvdJkD3HtrHiuk5be293jOWLb+0jpBc+kzU3Vm/KY1MPN0jpVFcAjXcEKnSJN577kLhiNDsqJPQC9fBAwb1/aECoii26DmJ+6RSP4OeEae5sbIi08zf2dlHeDqEo5Kg31JhlwEoUAe2fB0TNZN/rRMFN5Ghs5aIVreK2nxZTaZBn4tJJF5Lrosnejboy4Nm5BVa/aAAxX4bzP+omj8Z7FUodRedUHxkKmwQVZQGvNbX7hnUwqFhHa0v1UsDyxI5/45fkgxqExzenmGdNMlXjbK7GmJ0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERx0QOyKgDuRLKmP5snkSgAmYfq4Ol1OvZ28qxkEEJs=;
 b=lYIEoX9ivGFIQ7eaQ2OxZY8P1rqi6psCEYobrvjYRVEhMOwtntwZwwQB711kfYhgmP4glbYkB/xh1Q1ZoVBOte4/vEhcZufyW02TB3r05Zq5E4rqi0UEEureT+13JdwlFZUhEGTDjjGPiXOGLRZpGsoHyQbG1Wf/9o/OqltqbBUvJKqDWmIutA4HfC3aLYksYfhAqcstCOgkhU7ZLR5SbZsUGMXByVtWXMhANAk2IlkDPJCL1ZRsv+NYA+u7uRqtGnzX2VKKE2wF+xX/XoY+wTmtvx8iIyiP4YZ3wGJWodqFPhelMz1tQ14D7lYwjpxDLBptJmkGxIFeoo7X/a4a1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERx0QOyKgDuRLKmP5snkSgAmYfq4Ol1OvZ28qxkEEJs=;
 b=bL6lbXya9MrFtyVcGfCQ6ODeZGvOcmwAZJBU+4lm7239ZdHQP6Igk5I1sye+oFSns00smAj9Yf2IZTW1sAVolbOp6WPP68MgX5tQUaXEx6WGRALSUEzO+cDO58P2vcwsz38yN5p0wbKwNATDGj4L6MbE9ew8rwLt99u0r6DE3jE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 03/19] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Fri, 27 Aug 2021 21:17:52 +0300
Message-Id: <20210827181808.311670-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6075a9d-324e-4a40-22af-08d969871121
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB376547C3980717A159965091C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvI7aqRROcgXiUCxDnGf5O1K93WSGtUdIz1bMqpAo6572SXHjwTkLwKGIyf/FsyUB9sxg8C8/nUS69INmUOnUE0DoB6IWK0cTKtZ988ORlnYfQnXRY9VatA++mlADxuDKJgaZoEy+ZEfRWXLB278MEAMexNnS4GIwbMt9SIZU6Sdy6hJfvMtdLioJiJkNn532rsdv4gNrXXXYoYMm++v0TmQle4+ZUp8JAqvju+vXRRrvL9E/6MiQ+AtTkfwCB2qFQA/SWh+t28KmkV9oHgRcVYHGsnpUiJt7dIr+1b9FinDv94ukTi+bY10S0/4wrXFI1z9qPOHVQaFDQXPwiBD1f0dHa2TtzWq5obDRx2L77QFTp7G/PFMbeXYcpiQI16Ra0Sk9j6VFrWk+7mfEy9L4Rj6mCOjfu0W/GfGOL5z77ByJg/a5kEHZb/f/jRPazvtzsFNpedwFfp6S5FuEFd3npmhd9nGwYbD75QRGy9EV1H77AY6c3N+O99cMPlO9/xYC34CJduLtrHFoqA6g9Oi3bkdoRRm+ADZcz/vwPwqicFTpOkpF0k2hDpVYAcstSPOyIg2/LZ25k8oEu/Rs57ETN8POIL+Lb0jxMWqepsypSYu+M2Z9Meu8wUiXrHkMlkweYzFr0opWb0qE+L6MXilItXFVyUmqEL3yr0GVYp2o/BoVJImsCmSMJczX5UuHdlVXQayX9oageHiAR1ZSQ2BHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QwV95izIWbSTEYnDITi76vZUJK8G/wGKSbg1v1kCgJKkhdK1RuLZumrX2TFX?=
 =?us-ascii?Q?muMaXg5Uf1TCdzEU22UFKrJVGUYGUZot0ExB/KXkh43/Ug92wagBqAf+6W5s?=
 =?us-ascii?Q?MZICo4/qXE1wHVTvvXxE+4iT0SusOlDNetJdN0wT5y9TSRHiM2E640h8K8W9?=
 =?us-ascii?Q?FgmxlLHXGWsj7bMhKF2JMGz3PYCvprnTpFzfvxTNrqq4mPD462uLr7GfwHtt?=
 =?us-ascii?Q?4/1+r7PlGpY6zKLTS4gaS5MZ7oeIBi9GKRBXON6E7+GN9KcMu82ksIQ4c6FK?=
 =?us-ascii?Q?W/SFYvty0c3gOJGRrgFqbA8uEkk0PLX/tm5cy3+ZhPqtqSIAy7ud9hKNHSEi?=
 =?us-ascii?Q?b+OweGlzMI+yb3Se0hDgjkXTnt0WWoDM/+NniFDwcYmKnPlhcW53XnhkREOz?=
 =?us-ascii?Q?LLJq3adtVseh3JzGMJosxGJIMay7ZxnKLabEfV45hyu/JGogV7+ntpuQ74i5?=
 =?us-ascii?Q?MFwStMjLSA10XZiQV1y2rNgOCML3t3V/32dL/q58PAvdfW/oK1JnN9YhgSbg?=
 =?us-ascii?Q?uX1mnVSM+/xOd7KYPIAyP6oVQQ3JslRDX09adC6EBDdDhllP7r7WNTih9AFf?=
 =?us-ascii?Q?h0Z2cOc5+aqu7s9qdTj/zXtFly+TAKhSi0TW2CgoKL2qN3zZd4trYjs5fg85?=
 =?us-ascii?Q?d/N8ySUsno/3m8YFyjlfKiLGSjE/PpgN4n6zbk+2NdDiNQqhMky0W7eCCgBG?=
 =?us-ascii?Q?3I54Tz5t37DWtlYsWV1sKceg4JffDaNT3GLP8WHicrLHHiyHvIMlp74OtsZT?=
 =?us-ascii?Q?P6i5qTnd0EAv/3Lx5D6gAR/Ij0HbHJlNqZv26SB+lbPpG+k7gJNhKcvU6AWB?=
 =?us-ascii?Q?FxCO88pf6za9gzFn8XW9dASntqnBzWMdIfCrEDfeeO+eFAFcbP8J3zkWoJtR?=
 =?us-ascii?Q?59BI7zmt4xcSAJcu+VRB4hzHspGac+sP+tbZgvMXDZLweSATeSOYX6xOGVZR?=
 =?us-ascii?Q?XFWTphz5D08usnvn8kwRLwJ1RJ7rAThln5aJLA/q5b787EcDnecW8QuIzl22?=
 =?us-ascii?Q?m/7LwkyGquBoDQXQVFJclPKj4MOiqLgeq+rk8/a66UsMUuSFJqdq21f0t+wH?=
 =?us-ascii?Q?gmon6UIl8bhvqo6Pt+UbzB7W3tLHuuK21irQqm6sLF5+gGBfX0qqz0xa3Umw?=
 =?us-ascii?Q?MQRSW20vrBaDXBYQXhiMD6cXtgKDFbZQFfRpoZn/vmwZ4KopDlelbddxVjmP?=
 =?us-ascii?Q?Yp8aPDHQn93xnZ+Dy87/KYY6SlN0pFsFhLf8ewBG1jT11IgoZDDdPPRi9Z1z?=
 =?us-ascii?Q?VINoqNbT7ruXu69Z6eQ6VGRalXTAaP4EI5s1ccUmajabkLSQfMxNj1GoJC2z?=
 =?us-ascii?Q?3hsocqqEghdZKaYY61ezxS63?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6075a9d-324e-4a40-22af-08d969871121
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:27.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIMHejyvh6T7XcvsvYKyzuoowwBoWmoGQ6gswLWErJYeV16i+Uei3vPCeF+gg2CEPVNlVbQ94bd41aYefc0QgLj8GPHsHyo1TlC0HBxotTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 +-
 block/block-copy.c         | 14 ++++++++++++--
 block/copy-before-write.c  |  2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..8da4cec1b6 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,7 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     Error **errp);
+                                     BdrvDirtyBitmap *bitmap, Error **errp);
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
diff --git a/block/block-copy.c b/block/block-copy.c
index c39cb5fda7..65019d0d1d 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -383,8 +383,9 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     Error **errp)
+                                     BdrvDirtyBitmap *bitmap, Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -401,7 +402,16 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index f5551cd15b..d31ca61111 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -169,7 +169,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


