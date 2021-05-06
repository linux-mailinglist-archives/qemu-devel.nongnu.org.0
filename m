Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B337557D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:18:25 +0200 (CEST)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leepc-0007YF-K3
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelr-0003bC-Io; Thu, 06 May 2021 10:14:31 -0400
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:13665 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelp-0004Fk-Ln; Thu, 06 May 2021 10:14:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1dvq5MgRwTNwzGopAOCIpWARgZKF6rnXD2yODsn1W5Otko9zjgW+018NKUDMVrs4mHauP3KrUocCXQyVxzlUtQFMeX9X04e60k9+5CsTH1l6wn2iO8OD/nKZ0fKJGi4wzvIiD0MuFtqaBeB16S7tavJWgUd0vVxV4Jn8GMzJVFqWwnUURYCOEvZ/ufZIDS6O/uArXi4KZlEdx4NxL66DGFhuQl6VPcJqVz1Axukk0s9e4HV0uFOkNcd3Rj1P6CAHVby+sF4PWCK6HVeCNRpVxkkfe4B/RcBaCI0m+5CrH3CueiKJ4SPFj2nv3c3bxlxQmNKx9wE5lKGPUZ/AhUxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo3g7xaHM9CD8H9r/pGIn/ykJvgAQrNGaTFt+QISPo4=;
 b=ms/B26oXzdyZYNqG+jLMaBPonRLetYQoWZDcjeu4eJUgmXodX77Dvkr7pL94GZGK+B/jRB5RtCt9kS2PL2QlOFzktlX8wd2DrMBIlzEzeIHt3pPOhou0aOg/9ktqbYZO0FQOr9NsXLiLZLAug5aQC8XbvZw8W8NDhCYBvoUaX5vLIPXsau6Z4tX3/FBDPMpc9TpNe8EJjgZwXV5zTU19LyxEC9chgmQUfPoZ3MsuMpcnRWTKix0pYV+RJJv9uCYlUdtC1f+I69S2vYCozwIlxHxERGTNg2sRx4ygpXKGOzWT27lJp7w+4EvyPa9e2uYec0RgpvszQfi+HUx0WHrR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo3g7xaHM9CD8H9r/pGIn/ykJvgAQrNGaTFt+QISPo4=;
 b=DKyuiaQx6EOb3+tp0nafpAbJr5FM3LMB1yIqf1wVXxDhan66+Q79XgOL94pd7LsHHy1cjQYLlAfWkupGmDoJYWlACLxvolCG68gAAtcq37IWE2ixLB2fn9TgV+JzE+pUlHhp6JkJQzdBOirbuSYt3NiJElRGvrldA4pCKQELsIs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5205.eurprd08.prod.outlook.com (2603:10a6:20b:ee::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 14:14:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 3/5] block/stream: add own blk
Date: Thu,  6 May 2021 17:13:55 +0300
Message-Id: <20210506141357.314257-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506141357.314257-1-vsementsov@virtuozzo.com>
References: <20210506141357.314257-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0501CA0037.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0501CA0037.eurprd05.prod.outlook.com (2603:10a6:3:1a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0060f0b9-f8b6-4992-7f07-08d9109939fd
X-MS-TrafficTypeDiagnostic: AM6PR08MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB520560D4663964CC73A9A7BCC1589@AM6PR08MB5205.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baDzb9CEQ2XrNJXDXjljoePOKoT+8NuhsGbo+rHCLkxfBO1sXK6/WNydNECLWVtpNonq6UhJKq5p8Heqf92l/sSf/Az9KCTwBgAYw+9X9d99D9bn3mnzQuCCVjFCL6aYsYS592X5Y9NaygM4o1BGUhGql0VNiaObrukyS+6W6XeoQSo/zCTltDDvzp2eRTPq7Uc5wovPAeboJRi0W97DbMO1vJSGxt2sAhEjOvSLTyIpMDgKV9HJLeatq2Jiybr7lnO/MXxt6c+t0v5vSxnkpIf99+hkyHcokn/67k82jFwzXcIsfJMZPGiTVFPCmx9W/ESxw8rRgQk9i/IEjdXG/iZpjqiSefSOaJ+OGmUxO7TmvVc1EA9HAiTnYg8WlPXTBW9ft2RO7b8qTYlqeABOQdWoTL9+/57wWckdQzHtb6sxvw1nI0rldUiCIxYpHGqgb6u3amKdycdP0WRnT9wlu+Cci/J+2hCemOtHeLqy/mUd2YcLraW/qmige8CNw+UJ7r9mzOX1K3TAMNDOt6k9JFEOxRFffJlvoVUy6K/EfbLmIqYYHQInvI1wOHgsjm7tfWICYGeQDJLZU9BwoK698hfGZkGTnPoITcQQBqsbNl4gS92Tet1iHazbNBDl1EVYuotb+/Z63y/P+IZxTg379U50C3tsIroRmQ02X3uOsojwVU+cLhbbNDyjCkpoQnFk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(66476007)(6666004)(38350700002)(1076003)(16526019)(6512007)(66946007)(478600001)(38100700002)(2616005)(6916009)(956004)(36756003)(2906002)(186003)(4326008)(316002)(86362001)(83380400001)(8676002)(6506007)(5660300002)(8936002)(66556008)(26005)(52116002)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d/WPUjiwhZtQd/c8pLPjNM7wqq7wYu90crPtTIv7iCn9vHWsofiR7P/XXWPz?=
 =?us-ascii?Q?7d9g+G2amU1qWs3sE4i3Qpf+Btb1f9/PGNr+u7G2ACoslfrERkf7Cv7Wx16S?=
 =?us-ascii?Q?wLH7ruJTZune4UuZVOaZdvT8gmf54q+pXB3pTwCwWcJRwtIRi1hOQqdzByRr?=
 =?us-ascii?Q?99K4F7mw1Ftvm9pwCb1I1SiGuzg43KOqmAii7uUYlIOIwAamQ7HpKkjzK1OO?=
 =?us-ascii?Q?/+jcjdxeGcx+A5YqkTKW4iBroaT6Uroph/5Pt4AgIryRT5Tq2a+9AqB4mTTt?=
 =?us-ascii?Q?zap7OxEKWaDqi0Ku6lyGXBxwgR9YPtDnZXNqGISwkRAl4KhI5aY6PBI4La8s?=
 =?us-ascii?Q?EIGnbY2lMZjv+dcR9sumC+FlMUckmL+h5HAnUIJhD+MOdxedOg3MjnK1/w4/?=
 =?us-ascii?Q?/xp7RTD7qGxhUWwH4iGQiJo5wZdcvKlEOhlBbXpmP9yBVnY1Vf6AAj38b+7E?=
 =?us-ascii?Q?7MUJLdzTCSuNVySPqsMvn7AdD4xP8n/iFQCSjS6hmll3CT8MGNR8uVnj5G9U?=
 =?us-ascii?Q?CBpKMdj5a5jRe+4pVtc6EMdxaJtf11CYc9S9XCFqNKWFG+w6vIXrR14R6F5n?=
 =?us-ascii?Q?azbGmrVPy+DMP5XISKWu8rA5BNsZSOP0FC/oBvJNmW8l1M42yvpqgcPzyeQM?=
 =?us-ascii?Q?7qodnPiMIDGpLT2n3XrFoeRp2DfDd+SpvhuhrY+tc1kSGh+gMjCjV7zfm2b8?=
 =?us-ascii?Q?Z5ePkGGgEu8wIGbRNGBAmjp2QzCDsCinyaEZtltPc96tSQ33w20GHmAeEKwH?=
 =?us-ascii?Q?pB5gAqg9r7NMWestPzOkqyycO5iM5YelDsivDqWsY43eVxhisOO82CorKT+X?=
 =?us-ascii?Q?4RIu9SUzXh5xNAA9XnKHk3hevxTmSJrrlTJ1JV+Z9zI+WwqiNAv+hU/YXXtG?=
 =?us-ascii?Q?h6HDSEEOuhNkisNER1I8ByDruTgeutfeAL470e46Lkg3gzSfTT/U60PruUJg?=
 =?us-ascii?Q?Lifodx8qyTo9bigbTzspnHFz2KvYKu99dDOhShZt8FLf/aRX0A35KxxfgcVR?=
 =?us-ascii?Q?ai6/i4DzwnSqprlhYVq4OwzYtl9brBzzt+C36oZEcUecJLWepkN0mJ3oSvqg?=
 =?us-ascii?Q?3YSlE3q4FhUL6gS4cPzbou36LNEOXBc+2w+Yv9W2DD6iE32pdfj4imQzlpf2?=
 =?us-ascii?Q?Z0+jrnwCvCb4rLCaLWli8o5uPVx8m8qa9IMuBruewIg2mze/ghaVmd0gLl9o?=
 =?us-ascii?Q?WB+m9hWnlC8nk7GLuPfyOfnSWImDuI8lWnaiSqBj9tuI1ac97tMhCT+DZ9N2?=
 =?us-ascii?Q?3yawUG7RNNoh4HVtUHkBOfxojJJvxkvcAVAC2BOOMJvxIJTszkLmhuAQloHZ?=
 =?us-ascii?Q?S9iqAnru13od4XLwTC59s4xE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0060f0b9-f8b6-4992-7f07-08d9109939fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:14.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnzNnUXtWuDZlSd+h/qePpdeKwP2WEw3FUT15rq+qFLRY8S62HYTn+IWs4rw693WoSOJ4Do41N5wi/LEfN3Jgt2b1LokTtqj1B1kcZRWPKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5205
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

block-stream is the only block-job, that reasonably use BlockJob.blk.
We are going to drop BlockJob.blk soon. So, let block-stream have own
blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/stream.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 97bee482dc..01a8afc48c 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -33,6 +33,7 @@ enum {
 
 typedef struct StreamBlockJob {
     BlockJob common;
+    BlockBackend *blk;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
     BlockDriverState *cor_filter_bs;
@@ -85,17 +86,18 @@ static int stream_prepare(Job *job)
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
 
@@ -105,7 +107,6 @@ static void stream_clean(Job *job)
 static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     int64_t len;
     int64_t offset = 0;
@@ -156,7 +157,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
-            ret = stream_populate(blk, offset, n);
+            ret = stream_populate(s->blk, offset, n);
         }
         if (ret < 0) {
             BlockErrorAction action =
@@ -291,13 +292,24 @@ void stream_start(const char *job_id, BlockDriverState *bs,
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
2.29.2


