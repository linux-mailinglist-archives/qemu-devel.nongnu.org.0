Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D3C2CF6AC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:19:36 +0100 (CET)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJQN-0004Lz-Qe
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFp-0003ZL-Oy; Fri, 04 Dec 2020 17:08:43 -0500
Received: from mail-eopbgr10108.outbound.protection.outlook.com
 ([40.107.1.108]:31004 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFi-00024O-Ne; Fri, 04 Dec 2020 17:08:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH8m5iL+QuTBT1Bh7c4/0FOAztHbYqIHlGaKapaVjtA/jzu+ruwYQxIZpiqIsB23/5KntduV7wpFsz5q8/C+4qVEZvbMQ3/S7y8HYnCLFmtYRVi+ts482O6N/nlZ1dLY+fyzv2fxEJGs4E6qZ0/BXz5nJ6OE19FcNrogSZ/Yo5MyzBa2llD/b45k8GHCKiwa6lf5ArbWK0g38QqLAUN2YR8qtyYjnRJvRfZHXhs8zzIJcSNM9C6c4RbhIJYB8kGNH58QaX86crBdwvI6n5sFxUw7Dd3NQDQI3nR2hbWd9md00d1ylyk/FVjGIEBTXmMe0+kf1ypB8dXqRgSZxkXl6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9wC7kvISxz/8rl88BXgPPvsjQ3pB9fjiWfXET3C+bc=;
 b=F4ieRtmRHKnKmK2jOKJtSi+wlhgUX+XaSxVq3kWtkJ0El5rutImbGXoSwiSGhhryekTvBQUcrJNd8PUsx5GzQGZ6LPlZfPr1aGWflGTm8QjiwFlP8bSef/p21ewLwGtaBtYji4WwNgWOzB666SXwnVD6kKffN5j+OnKFNfnBe2dS2k0y0UaLJ9crz0c5ZaYyrHgtrdXEcQF05hYtdWWptNHPCvdalugR/acJmm/TaIQm+5zLYo19LmplUQ1ZRljgetU5c0RrUMq4l8KETXMVhFE3gz2pz4whIT9ctD4HYG0zwVQPBmJj2hqf5+oHwE4OYXKIhp+mA+6uZjcxCLDsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9wC7kvISxz/8rl88BXgPPvsjQ3pB9fjiWfXET3C+bc=;
 b=uOo0WFN14YTvzgbL5+Yj1ZybI/U2f+McV/qz2Ir1uQ5qQv5QKEOajD1mGBjJGcPUveI37IrPlh4584GJ9ubjfKz7AHaurUgIkbQ442lsXJg5a0ziIfu2ELuFSHxTvkCs7AtBXJ31rMaYM9k5SXOzMycMfIe8Ted9zAU3hJwZXcM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 09/13] stream: skip filters when writing backing file name
 to QCOW2 header
Date: Sat,  5 Dec 2020 01:07:54 +0300
Message-Id: <20201204220758.2879-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e80dec1-910c-4d1e-f799-08d898a11d4c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072648E26460D80ECBCBF5BC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: htYxFqpRtRw4AvFqC9y61gPEM+LB/zfIoLBvamqLk/zf4yjKwoovUdVDE2xIdaW4Eu0KySpwDXet9RVPk8iyitZROEFXwdpe5ROPSSbnTjUNWg/g/Wqnx2EOCuf8yfPj7tOWPJ8RhoOCO0yRF3DOJr8ktx2WHsmQ9ZuCG4em9wUqCWgfPKjyqtKm+iIwR4jT+84lXQl5JXVv1DTe/NCClU07oFd6maqW9pj8D8kLojdrNgst4j/qu4bZySYyPboEmM5DcZnPgtrD7oshcZpelFJU9OHkYfytx4yoNCjZrpJfEC2bAcrLRKM2nh0Bgeq8l2TbR4jdcbrUtW/r7Coj7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(136003)(396003)(8936002)(2906002)(6916009)(52116002)(316002)(478600001)(6512007)(6506007)(83380400001)(2616005)(8676002)(6486002)(956004)(5660300002)(6666004)(107886003)(66946007)(1076003)(66556008)(186003)(36756003)(86362001)(16526019)(4326008)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sk8ulec1kTvkMr9zp1XE3Ny1yjsC6L/e03ELQG11WypCdDjUO2UkVeqvxP+U?=
 =?us-ascii?Q?1dYpcqOEhl9UKw9KZNJfw+PCMMMy6NDRTr6ooQASRzKkTczz0X1hYdw/yx9q?=
 =?us-ascii?Q?/vtSmG/U8q344ooIEON353skb5gDQvNfdDf/dmROpgWJASBarJB58LgtXMGy?=
 =?us-ascii?Q?xNeUtCOB9NXgPcUGBsYeApITdBRwwW2m46rZ9j45qDcQe53SVmb49Gkji8J1?=
 =?us-ascii?Q?NtdekADKSJWXPjJlMawb7mloX3skW3M0DIGBy8PBN18yX7snLwGg+RPUxwAn?=
 =?us-ascii?Q?UvjGTrQZYrFP/uNe65rJXLDK8vG7JWdDQZCvuIj/sOJvD+eUdC7KrPErAOo7?=
 =?us-ascii?Q?fULOL9K/tCBqVvZH2BLKcL0nLycwVx4L6VWv5qSvG3Ya+F/e8xWV9fh8aHhL?=
 =?us-ascii?Q?3fBdGuljzYbcLYLITjpqxwFqel3xv+kLIr645tI6kIi3wS/ykocDB9kOu+sK?=
 =?us-ascii?Q?23FLhFkA/XhoHotS6wUK8572TJoGLDIj0R8D1+4HKb+46Vr56nVwBDjHXd/q?=
 =?us-ascii?Q?RgDAzlbyH9UgXQZoHWCWu+NCgL09tS3Oibj/ii3xcGsaOph2SwJyShX1fmBH?=
 =?us-ascii?Q?zU0rDRkZ+duIRVkOgLKYyaYNueSmuoWcCAmqtPyxP0ebRjHYGFGXsGIBGbcX?=
 =?us-ascii?Q?qbDeUX0iWLJeo3FcfTOVoFM4gAnPa8JCuu/EIU6oot8qhlshZyotdnOvkE8g?=
 =?us-ascii?Q?uMsNCQxFcvQ53pLWPt+zqtrm9FgssGG2zG+DJSRDwixKzLs46SGPTEZBnh0u?=
 =?us-ascii?Q?9uBxBfi6TrKu1+gyjO7rf1QxVnOt1xzSfr+z9ssV9NIRQP5hTFJgoqrhrcVA?=
 =?us-ascii?Q?7qOvvISs4lL5o2I+Rtbpwgfd8vPdfa02ynS+QVVLe3FZ1NtFpBTo8ty6ir3a?=
 =?us-ascii?Q?sj88qTgtdkKIPLefN7HvTyIRvZJlxT+5bxPRV9H7FMMYofv8Or90Kmmq/cvv?=
 =?us-ascii?Q?ahQulwZ89lCaXJE39309ne/zVDsofUZKb82any/s3Zc5XpSYM7BAgDl8kzCw?=
 =?us-ascii?Q?Eojt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e80dec1-910c-4d1e-f799-08d898a11d4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:22.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqvS88YTbrG7RolsX+kZSrpZ4PwTvxzZ2nkAZOtzzcOLEQUHnsPMBVOzXjPDUiuyum4+OJn7XfuDqXAI07qPIb7AzLnaj3kbA1I5A1tXOOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Avoid writing a filter JSON file name and a filter format name to QCOW2
image when the backing file is being changed after the block stream
job. It can occur due to a concurrent commit job on the same backing
chain.
A user is still able to assign the 'backing-file' parameter for a
block-stream job keeping in mind the possible issue mentioned above.
If the user does not specify the 'backing-file' parameter, QEMU will
assign it automatically.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
 [vsementsov: use unfiltered_bs for bdrv_find_backing_image()]
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c | 21 +++++++++++++++++++--
 blockdev.c     |  8 +-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 6e281c71ac..c208393c34 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -17,6 +17,7 @@
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
 
@@ -65,6 +66,8 @@ static int stream_prepare(Job *job)
     BlockDriverState *bs = blk_bs(bjob->blk);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
+    BlockDriverState *base_unfiltered;
+    BlockDriverState *backing_bs;
     Error *local_err = NULL;
     int ret = 0;
 
@@ -75,8 +78,22 @@ static int stream_prepare(Job *job)
         const char *base_id = NULL, *base_fmt = NULL;
         if (base) {
             base_id = s->backing_file_str;
-            if (base->drv) {
-                base_fmt = base->drv->format_name;
+            if (base_id) {
+                backing_bs = bdrv_find_backing_image(unfiltered_bs, base_id);
+                if (backing_bs && backing_bs->drv) {
+                    base_fmt = backing_bs->drv->format_name;
+                } else {
+                    error_report("Format not found for backing file %s",
+                                 s->backing_file_str);
+                }
+            } else {
+                base_unfiltered = bdrv_skip_filters(base);
+                if (base_unfiltered) {
+                    base_id = base_unfiltered->filename;
+                    if (base_unfiltered->drv) {
+                        base_fmt = base_unfiltered->drv->format_name;
+                    }
+                }
             }
         }
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
diff --git a/blockdev.c b/blockdev.c
index c917625245..70900f4f77 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2508,7 +2508,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *base_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
-    const char *base_name = NULL;
     int job_flags = JOB_DEFAULT;
 
     if (!has_on_error) {
@@ -2536,7 +2535,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
             goto out;
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
-        base_name = base;
     }
 
     if (has_base_node) {
@@ -2551,7 +2549,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
         bdrv_refresh_filename(base_bs);
-        base_name = base_bs->filename;
     }
 
     /* Check for op blockers in the whole chain between bs and base */
@@ -2571,9 +2568,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         goto out;
     }
 
-    /* backing_file string overrides base bs filename */
-    base_name = has_backing_file ? backing_file : base_name;
-
     if (has_auto_finalize && !auto_finalize) {
         job_flags |= JOB_MANUAL_FINALIZE;
     }
@@ -2581,7 +2575,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         job_flags |= JOB_MANUAL_DISMISS;
     }
 
-    stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
+    stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
                  job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
-- 
2.21.3


