Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7A36DBD2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:36:45 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmF1-0003tC-Rv
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxj-0005m8-QF; Wed, 28 Apr 2021 11:18:51 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:16352 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxg-0001nK-7c; Wed, 28 Apr 2021 11:18:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AphroLkzChhfqK8xEBwXuzoW+Eyn+THNhxVnZVVGUTHLOSvMce1StepZ6fEAWmnRS7H7t041tL8sYkn6CT4pRXApqn3n/PsIfirfmdWEl8QZlVG1U7r/otOw/BGU7COYDFrl+onmfjWGaW55m5sq127p7bFW1OqetlmJQBqUC9e0x9fQrzuXRPkt9n4f4IX5VWcNs39OSS1ZFEWvQ176h4zI0QZwM3pKksLxzCW6BmQsqS4cHB215AnFYoCeTemjWCXDpg4PO0CQ35H24+0pG25bRv6Z4FOCBJtXK7bJLiVaG1spt3jsU1VhtfCyVO6F2/gESZmCBk3vmy+X9IPVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZWiUiLbDBPSH51cYG45BETE4Y0hVNBIrv+eT9F7UTI=;
 b=JjDXwaUm2ewmka6SEYNusjhW2YwTgUyKT37FolzpkGxJBrzUMoRlNQYnFRwPRPNvfUVYgFBnAr+znClBzjjwkGvr6QHlFrNIHs1Ztu+7TBNzUGm/CA/gfbeiikmheugD/63IdYiZ1mGP9MeUz5KvRjnujBywgGDfklNRdNFVslym8OejDpFKxsv4D9VpugKleblxMyZzGr5+oOdeDsirQ3+yHU1zaR48B0VcnaHY8dSG5p9F3CF4eyXGXJgbe4+hidhIdPgdeimAojmUEF5u0Y4l5Sgm+GDfcylcYNXdt9MgkphTEG/IezNf6xWe9kbfd6KOe3gM5Hvs+w51F1uT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZWiUiLbDBPSH51cYG45BETE4Y0hVNBIrv+eT9F7UTI=;
 b=HdSOMi5W+HjclRO4TckWQ6lhFcUdLcAf0wTbraTwIUdEHhxivMOHf/ffIqpTurs9+j74kRAH8lkew6iOMuq3HZekTMN5eAbSWFnrFgVRKU2f8ITTvTtWqRqwGF1nvmzzNPvrNpvTOlY59pgJEdehWTVGwO7XbHhGN2gr6f/dRx0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v4 05/36] block: BdrvChildClass: add .get_parent_aio_context
 handler
Date: Wed, 28 Apr 2021 18:17:33 +0300
Message-Id: <20210428151804.439460-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ff5ee6-c081-43f7-798f-08d90a58df95
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5909019BF1602E19E4DF5732C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZwvYAJC0sCuBNZmpSWhOK/mH1pJYeLV36/gl2ckuuUPXO34LtW+SvNs0CUEImdZ6fNCPnTqS6S7+8tAGRV/BACATeO7sFbL2vr79o+rJtuU9LoWC/rsY71kOdCsSuJmhmB4rpC13yyK5Iuec2B6z3qj6eko8JFG2HIkoKdtWFPBXVQ3FJNoS6EvsC+GxsdW6vXsb54pyUn+KkjhsYkEmR5StBd2+pHBcO/paWEDOqrnzgX+Qu3a2iArx6ICM3JCPy7OduJGMKMEisV8bh53ymzxDdmLtLbqkVw2XDOQSKsreBqZhXEf8YhG/tKK/8lwlbmCSWhy0XLTxXvq6FOMCslH4Q98LK2FXxwZ1ZOmpJHFDPDv6Mxq3ECx4svyiI+pgEkSBnckTiMyAi9wMkapCUZG0ruDyCryGGnd8fDKVd2BaQem+rVzuyqIaPrn5EPQ/N8A2hsxq1aR6xHx5643YOI0NCeuSl4h1pf/eh9PvPwwUq/3gW4cH1T37jMFdMXfhC1CKyPMAiZxnaJt4i4UktTzaIfyTt5Ex8YNzC+I60qju/AWygq/UPAkhHsq1FaT9s7o3PaQ4EaDgwTAXBs3qkCrLh4oOe0dOcJAvye6casrBQv424j3i1/Re/PIHstHXPa8wGtL7lQ48p7sAEUOasdTWSGgcgbZS+9dcR3+i1cd3xSofNvWgYF82SYCaCc31M9LOmZkYvl7dLNZFz2qCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DXXokVg0wE+ePPNRObz3QkQRA5k7kR3bMcKzCvPvO0Bz88o00srPTnttPj0T?=
 =?us-ascii?Q?Rl2J7EU6gPCNuIeQ/jGoCZ8CpIaNH5UA7FnXfSj1JCj/bhAqF/QJlcnX+UQK?=
 =?us-ascii?Q?PTMrTQEgDL1BxP5w9My108DcRY2rb5AXTycWaXNqP9hbgv1H0szSWDy5aUL3?=
 =?us-ascii?Q?J5n6rGESP3aGefMhGYiOGohHhSNdu2jYBA2bjm5BuyLv2i2s4Uio0+metjki?=
 =?us-ascii?Q?ErcWO8b7pgMSix4yGbrERmniW85+r2eSaWgS+aKcjazOMx6WjW+NladnNc3F?=
 =?us-ascii?Q?PKZ1iXzgZwyvsF3RHpNk+/rh5IZmsqcBY0To+DXH+pxwAbcz9ZswYpsV876e?=
 =?us-ascii?Q?4JmIqdXFJ70GBaiJgpIzSXsAQqPl/InhsTXzV99NAEh2dB1L37x/1CjWApbZ?=
 =?us-ascii?Q?CCJ+Nhn2c6aqB6BlbsE93tsIo6I/SsDO6grlFWCveT6l9jIDLNz+k4aZhkc3?=
 =?us-ascii?Q?YwKOWmFy4cfTgBV4gKB7g+Cb15E7jb3glKfeD2//9D2mJIasWUwPGq0+ypcP?=
 =?us-ascii?Q?c4MzMCNyai0kUvKTxg4hiyyHhpGMiy6ewytg3Tj3cpaZKhdejfQ6qeVNR2zC?=
 =?us-ascii?Q?aMWr3SYeQe5mHDLdbYvQ28nexU/3gKfHqlrhnODpIHbhDmiM+ZfP3Kh9zPnc?=
 =?us-ascii?Q?W4LK1/9cr7y8YKi8pqSej7LN1uBOlid0bxb8QDh59R63Lu3dIUsUqlzuIw52?=
 =?us-ascii?Q?z44KntoR/aWgIAIJHgjlCrh3ln78e9iSSUpTxjjzrHhA53hSOdAU530CNaKH?=
 =?us-ascii?Q?F+LkfNCY81oNGQHS5t3rWf6S6CQZi3tsftf1yt+wjMJ+lBd7NZCc6X/gDDCn?=
 =?us-ascii?Q?rbptl+wYGCYW1QlauOOAfpZfXKCLcmwOIrLuILtqqR9KUryPcWtIu1japHoV?=
 =?us-ascii?Q?JyukSL9wYeChZ5abo4k2rhQoIRoXJGA4Ys2+UFNlJ78lXdnytahmGo+6tU8G?=
 =?us-ascii?Q?s46iP/kIIExKWFjT4tHWhv74/c5baLfmb+F+PyWxwF7h9qI4JozknjfTrFOR?=
 =?us-ascii?Q?TwJuYdjOkIfUDJLbcyNoq5cuROSN3I0o+kjW8E8TIWDHgVbOSwZkR/yk1SYs?=
 =?us-ascii?Q?xjtTrtBnSr4vUXbnw6oZkmj9JxbLO+MKJtl9HCYwLGZ5BCJ3ad12z1p6Cg50?=
 =?us-ascii?Q?X/7Sm4rsNrTIlcJBl9ekEuMDuJ/RWN9Ldi13mSWCncBwrAld8+mwpX36iPg6?=
 =?us-ascii?Q?iUJvhgCyrXKyIrCLnZLFRnTlvaJkPm6bE6hyweHtiT/cc+wJT4QoWHwa9/YM?=
 =?us-ascii?Q?gu0ckJARWltI///WLAbXWKduVJ49TYo8klgjXel6MIMaLr4k6DV0HJSmT4JM?=
 =?us-ascii?Q?pS8PrV7sKLYpSZdbATKTrZ0q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ff5ee6-c081-43f7-798f-08d90a58df95
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:27.5494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPfVAmURASQ0htPaDs2NCmnqZQ75nr0qt8QbjCqA3oE0fLTSuIkk0aDI43dX2A/Yyf6ONe8qRSdu6CzuK/4YKp6ofDgoS2hHx7QXLSk18IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add new handler to get aio context and implement it in all child
classes. Add corresponding public interface to be used soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h     |  2 ++
 include/block/block_int.h |  2 ++
 block.c                   | 13 +++++++++++++
 block/block-backend.c     |  9 +++++++++
 blockjob.c                |  8 ++++++++
 5 files changed, 34 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..54279baa95 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -702,6 +702,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp);
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..737ec632c4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -789,6 +789,8 @@ struct BdrvChildClass {
     bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
                             GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
diff --git a/block.c b/block.c
index 1e7e8907e4..2833912436 100644
--- a/block.c
+++ b/block.c
@@ -1394,6 +1394,13 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
     return 0;
 }
 
+static AioContext *bdrv_child_cb_get_parent_aio_context(BdrvChild *c)
+{
+    BlockDriverState *bs = c->opaque;
+
+    return bdrv_get_aio_context(bs);
+}
+
 const BdrvChildClass child_of_bds = {
     .parent_is_bds   = true,
     .get_parent_desc = bdrv_child_get_parent_desc,
@@ -1407,8 +1414,14 @@ const BdrvChildClass child_of_bds = {
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
+    .get_parent_aio_context = bdrv_child_cb_get_parent_aio_context,
 };
 
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
+{
+    return c->klass->get_parent_aio_context(c);
+}
+
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..3f656ef361 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -298,6 +298,13 @@ static void blk_root_detach(BdrvChild *child)
     }
 }
 
+static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
+{
+    BlockBackend *blk = c->opaque;
+
+    return blk_get_aio_context(blk);
+}
+
 static const BdrvChildClass child_root = {
     .inherit_options    = blk_root_inherit_options,
 
@@ -318,6 +325,8 @@ static const BdrvChildClass child_root = {
 
     .can_set_aio_ctx    = blk_root_can_set_aio_ctx,
     .set_aio_ctx        = blk_root_set_aio_ctx,
+
+    .get_parent_aio_context = blk_root_get_parent_aio_context,
 };
 
 /*
diff --git a/blockjob.c b/blockjob.c
index 207e8c7fd9..160bf38b19 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -163,6 +163,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
     job->job.aio_context = ctx;
 }
 
+static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
+{
+    BlockJob *job = c->opaque;
+
+    return job->job.aio_context;
+}
+
 static const BdrvChildClass child_job = {
     .get_parent_desc    = child_job_get_parent_desc,
     .drained_begin      = child_job_drained_begin,
@@ -171,6 +178,7 @@ static const BdrvChildClass child_job = {
     .can_set_aio_ctx    = child_job_can_set_aio_ctx,
     .set_aio_ctx        = child_job_set_aio_ctx,
     .stay_at_node       = true,
+    .get_parent_aio_context = child_job_get_parent_aio_context,
 };
 
 void block_job_remove_all_bdrv(BlockJob *job)
-- 
2.29.2


