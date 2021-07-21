Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2D3D0C79
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:35:57 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69a0-0007iD-Ch
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697g-0007aT-1Q; Wed, 21 Jul 2021 06:06:40 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:21413 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697e-00027t-Bp; Wed, 21 Jul 2021 06:06:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbNpq2Y+TQaVT3d/Prv/37NozaMaYukpe7ZdiaXf8vwzpO4k4eKUHyCMUlxwybHKw2Z6Xf5DKGH2iff+HCrqAe6YW2Rv1+n+G4j60h7c8UlZC4zNoiudM3PFf/7SbL5B3O5rKxBuP9a1vZwlRWv3WnEE12veoI6Kd59wNrCsxc74LN6iX1t5cnkizgK97FnKJEg/uVey1LYZLd3B5JLo/6joWM0Df4/aMs2umv664ZzblpMWDwsFVcZ98YVezHiM+XZ/4fExFW8xqK5sZQp1OzWJeBRjmhDI9s3Tb4UOAAnQC91BO6pdeW72mwH0022h5JvmeB9Y72/L97BjMQCcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=TkgsUqViNvouudSI+Amj7omR1ngZ2dEG6tNGkwPRs9tgeEI3w4HrlMAcRcC6w/622wUjIS/b67B0vKfWib45SIFgoBCdbfYZdYqYOfj0HHHKcbH9fRyiGyqekgPOsUNiOYnz1tvmqptjj4aVCrzkKQeM9+t8jLrJhQlUHEAX+IaogLf5skRmNDK14qbCHUSNL7Jdk8uSMUIaHnnKCLpxEtPhhWLslgUS3LTmDJphbn515rSXW7Me4bkFi44oQ5FxfLJEW1EWTvkFlIiFdfN8mjMh5oG0uO64RE6NRGI8UL8aEgUDrsdyCGf09SYcYCf6Gcu+pZa27INSSh1r+EOtxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=r3T8haUgQC46+JWqMO2RWKxTVkj80ByT8KEOG9z1V7TRmy0fzPWOGB2xKFzt8PttqfZ2HPj+EB+FM6VIhV1ypnMCiVreZUDThID9QowsZXL+YvQl9ILNOGloAoT8YFVQJYI391jcMGW+rhbaagBslWos0wDa6A1BzGrM285puWs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 17/33] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Wed, 21 Jul 2021 13:05:39 +0300
Message-Id: <20210721100555.45594-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 635f4574-8e8a-4dff-b460-08d94c2f3831
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494E1D0DC28B1DF294768F8C1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5YqVBhcvsrL6t8giP+aW3hSuyJkiXabkIS22QI0p31Kr5NR/BXwACoTH8/GnV1x8p/xkx7JIwM686wIU1K+um54t6hO+aqoDaQnUMvp8vP46cH69GMkzxak19+z8zXoVnITO88+7IrJbzSMitI+8WG8EU/3y56B459iWg8AORjJvrbLcFJkr7n5z3MFn5M1n2xFgHP9xwVLUF5JLvUbBHZbzDpPYldTbGPVIrw2S8sJ/DYxaJGzXYJpPAv0dab9i7JssI/sVocj9FCt1chklYqLlrSwqwG+LSu4SQRttp3U9HtM5ujKMok3T9mCfFFxq2/EPC/cv2ZJNOOh6BWwbLl2KhU7ykQKLX4ALDXVUuC8LI5xlghxN7D6ENFcSuwFAqH9AO0Oy/ecAlQGntIn9FUPFKk9hho1CN5hAC9bjv+sZfeoTPWOGftWjs4XeOWtUGLqPNmKDHWoV1P/3E2VbhKhRE6DMEa4iqRWT8Xk2xBs8X1BgD5uwLD/CatBozDcqJ8aXwuMRCXlYXd4rm7GqVmxcFcTWwOUCRYNIaDfnyntNA4eCK/DP1iEcxFNmhvGogqG2+WotL/vToCyo/lJeJDNUlZnnsrELCoq8BMOrIt2V/K5yLbBEyrXa4jN1Y04PuqmXbpNPjpqM47uyLQeRfGBILcu4Ca+YEVP8IEQpnqBG7zLYtdba0S3P09VKvqOIi0Yd/RqNnfIyve+OM5q0Eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJOI7bznXbmVjWXDZMLoOBysydQ5doadzRZoE7TpPUYup3P//9pZHTiF17GC?=
 =?us-ascii?Q?zSV4T3hGrYfqYYY0S66m+33U5Wmj6nqkmHvROt6n4P+5TmxmH22dtKek2R47?=
 =?us-ascii?Q?9VyrVgCDqCp6ulaSYnFKA8KPx5kHeJxM2GQGV9LfmDP5U7oryHKxu0EnT8qM?=
 =?us-ascii?Q?vGeWwIvyM4MHzOmuksa6apAktoJO5DujKIAQcvjFh+X6CXFVYSqrGZDIn8C+?=
 =?us-ascii?Q?4eHQc0cM2yvPMhCF29hdaHjQFMHh/UhEPQVYtTM/kjHKUZShZaa8wYoN9oHd?=
 =?us-ascii?Q?kGqFR9OW3DzyU+V8oQv9jzhBgCuUQYDoVJcc1QyqSyDpbiPqFBv2HnSiOKLi?=
 =?us-ascii?Q?mxdjrzd4AtllA0Ov9DR6GCF4quz2gWK9f1SjB7IR3QnpWocYnx8s9fnAuSZU?=
 =?us-ascii?Q?9WMv7JePKTizjCsrDlfDm4u6aLxbo0WW0FffFk1QqpX8pVCy/bJXLxAj2y2d?=
 =?us-ascii?Q?kmD5K1m7HwacF798vJjb/CjxJBzQ5z3MDc1K+9U1seFbB9Av3g+ncRnwu/iY?=
 =?us-ascii?Q?plbL1roNI31z9snCT2lT+/NKBMdx8AVf1azUMc6iNyibSKwaU3m4078GbWxq?=
 =?us-ascii?Q?LtXVPChAG0bzCa7MmRDu9klkp1iMUqZG4lNmr6b0fUc9gDCOxxWzxEGOPeoW?=
 =?us-ascii?Q?8TzxWo0fkgtNRp5NYu+aB64kb5fqLv50mnrjyEC0OXDC+56GxY/AKRnXgIcO?=
 =?us-ascii?Q?Osr6opb1WE7fbuFTvqkwVus+WNOFxIKi/ezHTVzy0tFna9aoEiQZO0RL8mRy?=
 =?us-ascii?Q?ymaIkFmYY4Ss/grsO853+p2dZQSssoRq1tNUa95AD0I0NsqCnmUCOQv3rvYz?=
 =?us-ascii?Q?10v4tOVo9HwnXm0zScR/qP7MtSNZ1mFPZuG99k2eIAAh/cHIhzzllgwZiU0z?=
 =?us-ascii?Q?v/gpCV7oyv+AeTo8dhhuKytzbGhPWHtZMb9guf6+l9oG26/mzuPBm9byjcDh?=
 =?us-ascii?Q?0bCr1CwlBvWcpniwUBKYW8HAgKQhGO4fcsgZ6HQRJj+ngA78XUI00vLLKcNq?=
 =?us-ascii?Q?outuhJfqww7ARZ5SfXyEUyvB3u3mNmGZPBSPlHfqxxuCX/ZxBgNaAcdbLe0Y?=
 =?us-ascii?Q?yPaIMevGQKZ4sMEMgigIbkbNSsucReLV204yaHZizowZJvit6ZLXZkxxrgng?=
 =?us-ascii?Q?Y5OmFDGU2bMjjHXj2BkDLU+Bjp8g+e6+M8Xa8JEVNa3CRsrKfeJNPybWKdgK?=
 =?us-ascii?Q?ZcRKdcsZzgJSG0TL1XhbwyQe6MBxaaK6zrzEuLoORTI6jv+JaRUsnzHyA0VS?=
 =?us-ascii?Q?pvs4oIkmau03jZ7u0oM9jwqnY/UJ6hrI/XIQwN8pgpf8zqajKVFj5KHXxkr1?=
 =?us-ascii?Q?Rw4TodtZ8sAcZpIoOIsAfuRw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635f4574-8e8a-4dff-b460-08d94c2f3831
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:34.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axQ7m0b+Op/4jGGGCjyjOYX/ohZUSWXfWnNVwsrcHkzNbN0z0WhMCFPD7G2H7R6NHTyg8q5ccaO+r8Tw7C9hO3QgcNT43KnAuf7xHQg6qh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


