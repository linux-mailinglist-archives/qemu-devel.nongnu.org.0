Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7247EFD7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:38:07 +0100 (CET)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mdy-0007pm-E5
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcH-0005q1-Jw; Fri, 24 Dec 2021 10:36:21 -0500
Received: from [2a01:111:f400:fe07::712] (port=55270
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcF-0000YV-Kd; Fri, 24 Dec 2021 10:36:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gltt8DITptCWm1EdGJq59vF6IuamSdU6wX6uQXZI+h3EFwwAlXH0V9FqlpY+EiyRjzwXKDj7jJ2350cj19Vy8g9qIrg1RbvGq4veZuPWcJC/20mgebPaGny7rixsETQxE6zrevWS5kyqjQoDHLiNnqzKPL6nBqcUkeVgYWKgQl31G9hvdSW6W5OkD4eYKFlPO7mbKeYBZNqDwJrY0I0UICIcVfmhBaD+SSZD6hN15VIQQwxlK0ZO8/+4LuBMWlVsU8z645b1MwDJAL6dufqZTf2l1TodiWRclTbr+h/xK6aGJ21bLuxv7/wDbTILkAEuXvxGgZIuRx+VkH9p5EyW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhfTs802s5lvkMdah/POtNRkTw1/pQ27yN+AjxyD318=;
 b=RI024eXmi2W0BqahEpdDN8Q7xuKgDX7ld9d25MVgwof6z1UgWVOEdCZN4rlaAtOFCW9HxarAmyQekWaCQXaXfjzFkG4Rl/dTXXmpd4A/HOFWpevS8vahArKgNg6MROti7C1JwUEfRJ8YTq2RY3+S83ehgjqeNKAYovTqXVEsQs8+acrMPrZ9hrjMrsHrVr02D4Oa0Jsh2kgpWuKbT6J1qq+AIspZL8TWBI6O9NWtRDDhuxxwbBWdYhAZIFWnsLO7vIrXCSD+t2a8Uedpc69qHQYLS9U0Ekc/ffHawsar2F5H3qCFUC25pV49oz76FweUBbTLz8Ugw2zCalPtodgCWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhfTs802s5lvkMdah/POtNRkTw1/pQ27yN+AjxyD318=;
 b=tmrcVooEdHrT1jUxsHBrXkdhgzcSynj9K0PpxPoxfPq71NhrGJN8qkr9p8vGGYlazXvxGM25p7cCAbqlrtJRectBRE7Y1nqLKowAOpxNIaMw3KOFEShe70CqY98Dhqhn9J822CRLogk4bZT8G7jlIJLUzrJdelidNNM2Ozf/NAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3955.eurprd08.prod.outlook.com (2603:10a6:208:12d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 15:36:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 3/5] block/stream: add own blk
Date: Fri, 24 Dec 2021 16:35:50 +0100
Message-Id: <20211224153552.2086061-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bbd03de-72e9-4a8c-d604-08d9c6f3203c
X-MS-TrafficTypeDiagnostic: AM0PR08MB3955:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3955D8B5C0EA26B0ED574806C17F9@AM0PR08MB3955.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1c91Ic3r1Ukbb56OxfTAzWtzC7He2lcto1T1uvMwoqlqrNWnyzPTl27C94A5GQ9hsJLkQPoFYG6r78acU5X9T+da05Yao5W0gOGKIRE4xSGepAx2EbP8eiL94EqEJxaK3bjwh2H0/3qTVx3rZoql+WoRqQ4TTiraYl+ibLH7iwcEoi+A++Ek71H8wyXWoPp+i55oKv3tp+toMt1fQhPqdSixY9rIra4AJgMKKVlQzyj6CTIPkQG2ncaxQ9m++eDY9Q9dIDdG69eJ55EU+k8PwvIV3YBB5An2NXlelAsJWG45ng+l4z5JBKwkiA4Bky6x+MjHdp24USUfdhERAOFHMbVN3B9yG4dTASp1DDrOLMET6QM2eKwcYbw0+YJryOW3DyrGzbsRY8LRx1vonLrKLQYN1CdmKDNhmjNrPnG2xlzHGPnjlsjO/SSY2+kSQWdLc9/sh3+q2GzHPnpUEP1qxxNN3zq01JT3KDXVj/917Dpa6T4HidKNlcClc2QX21ysgRdkHveXXpLo7i57x0vqUeXvFZJ2+bdZiO/NOYBFYVIQ4gbKuZHkscPa/O+q5VSkyRLC5HTCzfM67siciKtgeVFh8AnsTxrgIiNp7ij/TGvdwKIAXgos1bXdYT2uo114v3KfZ9I/REucmRVhARqOS1tnaz1z+YN9fr7oWp9mbrnOSDQDRnEbOPVKOr/EtfxtVOjYt11yxNV9R5mXNoZtTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(508600001)(86362001)(2906002)(107886003)(66476007)(26005)(186003)(6506007)(66556008)(2616005)(38350700002)(38100700002)(83380400001)(66946007)(36756003)(6512007)(52116002)(316002)(8676002)(1076003)(6916009)(6486002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fs1N0cYAhev3zLOr1/mfYrp28xrgRAR9n6tHr3O5WNKktY5gQkOEK7Ftnbi+?=
 =?us-ascii?Q?sVW5i4d+UWDVBNHbief/r9n6hCjuU2+g1zug4oiv3npMglR6c4iEg5YeECvk?=
 =?us-ascii?Q?uCQohmnPX4KUxdqGmjg99b3kpB/NORqeBmx0ECcxncgygRvGXPlVjoaMejiX?=
 =?us-ascii?Q?dKlAgNGfRVDgihnY/DrcJUR8NnAirdKMNIJ5z3DdPUVn68GlqPJtR/vmAx0N?=
 =?us-ascii?Q?xMKvG9R6gZET9NQs1FuyOyaNNrARiorCkhnMwLNCD9PS0zw2cPXg26zZaUaz?=
 =?us-ascii?Q?GtrbZz2lIALujRjLAW/9f3WxAJZKKOFRsKH508MkoiFACiH/yb7ZEeOcNiiY?=
 =?us-ascii?Q?FVgLa7YYNqNhU375C2lvMboMddZw3nSb+SUG4TT/5ul/GlKAWkusrMPlcs59?=
 =?us-ascii?Q?IDN85+tUxRyq1tKdq+fI5GpuE1MzKt1riBbNmLjpAsQkPtNOb53zF7cuZMEX?=
 =?us-ascii?Q?nIJot1BR9yB1kyAyBbHpv/guk8/d7d2zjBAg3egAeQJs7P7GFwkhjMaPR3dD?=
 =?us-ascii?Q?biTTQplMqf0lLPadA9uJBm+NpUBvV4v5jpGx3YUr4oDqRTxyKyxwrrcCpKw3?=
 =?us-ascii?Q?vqS3fmf7ZvMXHVoHYiBIcpDva5zT6usIblbMQQCTpYHJTFxpiNfPqATTji20?=
 =?us-ascii?Q?g56s0+t6uoxJ8rNQNWz2fVyuyC9IdsJnI4sQUm8DE92n1kPB0CeVIu1hdq8K?=
 =?us-ascii?Q?bp0xsm3fpttghfADGmK7RS7XeszSGFCpX5D1uXH3hcNA3ou7rdatxw6qp8cz?=
 =?us-ascii?Q?kY5xTG6mR7aPZKHghPnxhK1u+fsuFIIU2MDzdL4+t4NMEzPBXjRWpm5qAdXf?=
 =?us-ascii?Q?nBZN1m3juxOhiqy3oWjRsP1OelP3jQIyj9tCNGZlnJPkK9nVOeFjBrtZdlrB?=
 =?us-ascii?Q?8P6J3tdE/9dGq7XQO6s57P1MA1Mode1fuldNfZ4VBt0zN9gPCn5OBsduNOfH?=
 =?us-ascii?Q?CE8GZcThQbqTHtkCP4SjRmZI8DRXUfjul+lHQgATsP/vT6h1eF9wbqDXETYJ?=
 =?us-ascii?Q?vycHo/aYPz9MR+Y5RkJ6u1tiQ2JQm9mLUr/K9OTGNedSr7oy/GRjvgrhH1QA?=
 =?us-ascii?Q?iDjU6+3n5O+KK76vq/3H+MG60UTVFrvMFp8V2bE+Gli+fwg7fjp3Mm17kGTU?=
 =?us-ascii?Q?guZA+3q7n6HwtXUQpoOqALnEvgOK8gUJDOIER0Fz7W72Jxp1WvbnB2DDQLRY?=
 =?us-ascii?Q?2HtisAZDiOh33l4QL/iRc3MVOYq6WdGPvaF5Ho1C0ERhWmwlBhG/ablZXWEZ?=
 =?us-ascii?Q?Bst4Ds9gRnZHvscBw5D1MMEGkpsKdIvlwoUC6tXZL1tiBuFFoanDkDpuhfZE?=
 =?us-ascii?Q?CM42DcrNWeDIBfDsb9I4ACnGkY0HXYPU8mc7BSlIpoz5ecRF25pjDwNYxmOd?=
 =?us-ascii?Q?Ta84joAzxmakyX5O5m3f/YCqHeFI6AnGbwUWT8h3ZkBzt2BmNqhyOPkv5JXC?=
 =?us-ascii?Q?+OAsTakK0aS8j3hgv6ppjEe1Cxx3Gv678aKFM+G4qtO4J6Y28W0VtIe5Q+1K?=
 =?us-ascii?Q?lKCEDboietOZjp40A6palMfWW+Hq6OOLWO+BUaUtVxtVtI3spV7nSLmHJUS5?=
 =?us-ascii?Q?MOgyJzS5Qo0Ctl7I2R8cnHzh17QXyM4upRS6W89mZVsvL9qtvs2TFkg5r52B?=
 =?us-ascii?Q?9OT9mVhW56JyIWbuN7G5mklyHiMhbLM7C3yHBIdrMcIQk+wW/xzldm8wBoFd?=
 =?us-ascii?Q?wZ84ASdGdrh1zuLDuulRIY2beEM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbd03de-72e9-4a8c-d604-08d9c6f3203c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:17.0940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QR3HOCM3vcUCF+4cztfQedVAPh9cS99006H9ToHdoyjsQPdLk9KTx+JNFNgU4HfOSh+FKPX/82SfydW3cHXZpNvtnSy7/EHRIOcgxio8Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3955
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::712
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::712;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

block-stream is the only block-job, that reasonably use BlockJob.blk.
We are going to drop BlockJob.blk soon. So, let block-stream have own
blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index e45113aed6..7c6b173ddd 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -33,6 +33,7 @@ enum {
 
 typedef struct StreamBlockJob {
     BlockJob common;
+    BlockBackend *blk;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
     BlockDriverState *cor_filter_bs;
@@ -88,17 +89,18 @@ static int stream_prepare(Job *job)
 static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
 
     if (s->cor_filter_bs) {
         bdrv_cor_filter_drop(s->cor_filter_bs);
         s->cor_filter_bs = NULL;
     }
 
+    blk_unref(s->blk);
+    s->blk = NULL;
+
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
-        blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
         bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
@@ -108,7 +110,6 @@ static void stream_clean(Job *job)
 static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     int64_t len;
     int64_t offset = 0;
@@ -159,7 +160,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
-            ret = stream_populate(blk, offset, n);
+            ret = stream_populate(s->blk, offset, n);
         }
         if (ret < 0) {
             BlockErrorAction action =
@@ -294,13 +295,24 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     }
 
     s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
-                         BLK_PERM_CONSISTENT_READ,
-                         basic_flags | BLK_PERM_WRITE,
+                         0, BLK_PERM_ALL,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    s->blk = blk_new_with_bs(cor_filter_bs, BLK_PERM_CONSISTENT_READ,
+                             basic_flags | BLK_PERM_WRITE, errp);
+    if (!s->blk) {
+        goto fail;
+    }
+    /*
+     * Disable request queuing in the BlockBackend to avoid deadlocks on drain:
+     * The job reports that it's busy until it reaches a pause point.
+     */
+    blk_set_disable_request_queuing(s->blk, true);
+    blk_set_allow_aio_context_change(s->blk, true);
+
     /*
      * Prevent concurrent jobs trying to modify the graph structure here, we
      * already have our own plans. Also don't allow resize as the image size is
-- 
2.31.1


