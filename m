Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F02E2C682A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:49:19 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif3m-0003Uk-Gr
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0l-00012J-3S; Fri, 27 Nov 2020 09:46:11 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0j-0003DS-6e; Fri, 27 Nov 2020 09:46:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQK4eLv63oLOORc1dMb3WNfTrQxjzDy4ySZOHmuwvqJKL9IKRemHTbJHuCLeE7oUp6ZtbuNM1w6t/OV2GT6l5/dfvX5EM0n8DQcjVPXgaVb8SSd5YnrsiHdwbJAU0KPW+WTsSwJb/Un8h45oQVGQg+IhA5Vknbf+yn7el0MFIBT0YyhKY5We2QnkkGehJ63UNEePWv+HXB9g949rXIEb9gJeXNHKcM3wG/LFzPxsTejgKSI+ZCFn3Ev7xXqQJFK/Y0IBqz+LlxTEdZv12C/2w+YlpcYcLDR1Z5Oz3xA2QUNNZ418JH0/4uf/YOGzKI0Ea+QBxH9aiPD/+kiD/nFKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovZlqQ04dAk/jEozZR5XpNc3Xam1uRubyD28uy37c28=;
 b=PjKgyA58/nt/dZLAAZoSifjDtXRgMXF6h9Pr2vm1wYvw4+ba+9+4N2I3uo2JoMOuZ0sjOa+beOxPQCIgSzpgmtKgV388IpZnhJDdx+pnv271tilX2s8oGsvb6bTKpW8MNIsGKS8LJxTQmN1XuQwDqDT8pRHwYMw+GDAb5pCYqMS+p2ic1ntDciF8Zs9csR6nUunAwiaqDKDSSQ8jkQyk0BAjH91g07dKnbBXGZPldnR5rHRUd+Uk1G4N1VTYadiYc+PvHqZpCkJj/WJSY68P2RPpujHg2SsWTXuCmrwnZ6IICCABBQrsEoI47YMNJ7jbafjU3Cn0hcx52qv250qFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovZlqQ04dAk/jEozZR5XpNc3Xam1uRubyD28uy37c28=;
 b=pTlfESiJRlpb0awldDxkCEEXAOpfTMiTnrqnHlhkaEPGsrl8FYiH5IimBfNI5pMj1aIj10owNTVa2sez/9vkE3NfcLiB8cQO2qwdrOg3bJYYZl0SNm2XKJ1vaTgT9ig4S/eAnesNMn1tyaL1S6pz8BKf+quxwtR5W5DOqNAa4WU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 06/36] block: BdrvChildClass: add .get_parent_aio_context
 handler
Date: Fri, 27 Nov 2020 17:44:52 +0300
Message-Id: <20201127144522.29991-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 920871de-3259-43b5-afd3-08d892e31cd9
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507830F9ADD42DE334A8AB78C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJNcyq/bvMww2tPc7eDjHk6J1NyEQ4eKWA4vT5OZgTVFNmrsEv5/HaqsCF4roxf2LdhsXaUv7dQ12EPjWj9VVIym/QhGWYOInV5Zft171LJiMoaI1JX1QcT01BtTGmv4jLg3gBmfUDf5l7srgPW2sGOxNodTyO+gkKwUq9nh3HoPydRDHRqvr2ZAiA9/VPHcoA2JiciJGmi6bFnBkvPm3lpmavnxbrCCV/EI3xxWXkbsOaZU/GsfkrmoDL9CzDUA2jva7I2RmoenP8EEOfz2XpYlR/fcCPzNLUsYxl5UgTfh+GcYDuaIL1R4RfFDzZohCctZw63Ws7RTLmnrcxcsnYv53Ncrj60ydK6sGONGnbHLZuuZnCbECVatKMjCuuKl9M5yvslRMA9d6tsd5Vi/Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KWWSoDyyp3OVl5U7YYPYD7KUt3s6iL7RKAvT4eBYxG1Se3B2rNbkF0Fjfxvf?=
 =?us-ascii?Q?0P4gG06+ntA6yB6Q2MD/tnZbHE5bWJ0N7QDwRdIk1OxeqAne/JmLaoIwDyFN?=
 =?us-ascii?Q?t9h7FT4TJckTJwgX6WGfONf9MGkMjieAfSGr7tBUXyFJ7jgC5046nDHdNDAV?=
 =?us-ascii?Q?fGHZDyoNzR6PbpKtiDKgtb1zwURSG1FxipoP8xzwiibljLaQzYCqS+MGXseT?=
 =?us-ascii?Q?xWMANgc6jYV1onuW1fl4cNQFzYf4Rda0dMy+UgMxnNlLCFpRMRe9hpezOHw0?=
 =?us-ascii?Q?8v0lkPm0unLBws3lT6tnJ7C7MVabFW26qX2tB4h8YCuTUg9kdRQdlJ+Lkl+O?=
 =?us-ascii?Q?n16eapX1q2pkfuELvwI+WnsY9PFl/27/iMW408ARbmuDNkd7dhHv7EgjGQl9?=
 =?us-ascii?Q?x0J3Qbz4gJ60/ve6Q8H0y4x2YMvqVSgBxj49V28yin4pgifN4MuI4fALUlhU?=
 =?us-ascii?Q?nqb7JP2H2W7m2xtdiPgepXgcAUuQoGoZDY3t8I6iA5euUfZ5CiG4UYYx4vqU?=
 =?us-ascii?Q?MY3cwuSXVPUI1bsBokPWfzVihzJGSr4siM3RKLetOtFCm9AwJlb5jUoq6EXt?=
 =?us-ascii?Q?jSTaNVeYbi6Jsd4FZlUx1rRIwKNqu1WDwIvziFu24Wfv11TBJxhz1QaLuX2x?=
 =?us-ascii?Q?jsVyNMbJx2uqzpMfAoXsiYIxcISpDB+KB79w7YFQQR78lSVVVKJWdqTwRQNC?=
 =?us-ascii?Q?AvCvVGiEOCeT/QZnlV6LY/vKDMoUpJ3OtLQEGZpt9S0JJTZD0MPN7467RcsG?=
 =?us-ascii?Q?stKo0rO8yv0rv5FjX20yZJ3Y4FfAU6Ayl5hexW7vB/G62HsDSRRJOCbRKyv0?=
 =?us-ascii?Q?rlbrUfYwXta1w40sRH4l7NkaSrkg5ckUDGjiQtgXfguEG1iw8rM4mbvLmkCU?=
 =?us-ascii?Q?vUpClZc5CPWF4MaEmWQOGFE96cad5bGFH8E+a91rq8xTZacyv6TRIeOJ2SZd?=
 =?us-ascii?Q?yD9ByxAR9G5BF4FiGG/+BsCOCPso3J18H3b5H7HHWjF845EPbpQxSjSbdWtH?=
 =?us-ascii?Q?swfH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920871de-3259-43b5-afd3-08d892e31cd9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:41.3867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbPZ9MlJBiANaRCg5ECGv69cFLG86Yc6GTG5cc1w5BpfSJkQfu7M2zxdwRIdmGgWnQ1TqiyR9AcbB/EuGhJsDxqjsv6WJxxSTcuascjm/+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 include/block/block.h     |  3 +++
 include/block/block_int.h |  2 ++
 block.c                   | 13 +++++++++++++
 block/block-backend.c     |  9 +++++++++
 blockjob.c                |  8 ++++++++
 5 files changed, 35 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 550c5a7513..6788ccd25b 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -688,6 +688,9 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
 int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     Error **errp);
+
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 9138aaf5ec..943fd855fe 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -772,6 +772,8 @@ struct BdrvChildClass {
     bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
                             GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
diff --git a/block.c b/block.c
index 5d925c208d..95d3684d8d 100644
--- a/block.c
+++ b/block.c
@@ -1334,6 +1334,13 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
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
@@ -1347,8 +1354,14 @@ const BdrvChildClass child_of_bds = {
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
index ce78d30794..28efa0dff3 100644
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
index 9d0bed01c2..f671763c2c 100644
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
2.21.3


