Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B333F3A2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:46:40 +0100 (CET)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXRX-0006TM-0J
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHZ-0004KD-16; Wed, 17 Mar 2021 10:36:21 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHT-0006rZ-JT; Wed, 17 Mar 2021 10:36:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0rWasMT1o6Fhmki/B2jNLD8ciE2H/rQK2EcOo/6hjfZInGsx3n5CZK1WrW11syY5vzH2UszWBWe7Es3dN2AV2bP/+Um0nTosA2Tr2c4I1S6PN/TYdbDWhhVd8xNkWLQoqMR+wumfCa6mKOR+0QIQXOMjcw3GSKQrID2thG5RVfg1S9mrlC74lOheWTP9xGO1Xc9LD4la+TPIxNWXt++lXJfyU5hNqLCC4qD0Y/Cd+Ig+zNmwA2TzK71EkqB1eFZT+/FPunQzi1g1A2iTmARUWcqbw8qRm/c+Eczg5jBkRoNzqIS6D47BrbBC6bHSHK1/Ixn6ImGNbdv/S7OGVvXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYCntIuhTWAONDUsdbL/DKoFIDm9A8RdCqZNPDSsHVY=;
 b=XMFPZM/WE8Z3GH6RYME4Il/w18Z5WNr2ZhYeBfom8uQ2ZjK1fd7asMeDwh6PGvczjH8l/FVLNi5XE2DsX3xvv29tTsPUQ/o69v+ccjE4lNQCSVA+JjO5+nNg3RMNaIpQ7jYlmIsm8HNqbub7HiIu9zGNyfGuHc1YxZ3ij+U5ZcGQcvVc0VNa9bsJCHsXzdfU+0KB6z50rYnHr0g/vneK9AJB1Jp2+yr9j3LSDfacunKsWWWONIo0g35E8z8izzoP1rOeJIF4M9wextI/HGMjfBriEoGOmXHYTeN1l6kdCxdmFt9an92nXdnlH0jx8+OOVynGH5RK36m3TsmMYClbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYCntIuhTWAONDUsdbL/DKoFIDm9A8RdCqZNPDSsHVY=;
 b=PErWshqMEV1tPYZJqaMako4LoJpr2N/YUfljBTo3Y7vfMkvrCH/1akwUFpextqsrMIgC+4xQPk9wX/JP19AqqPRW2BL1o8cSqQaUrtCbbjP/aEwr5CwFPwIzFiJ9V/qLDR6XrTU2S9BE1VGL4LQcMMZIHI1tpxgL7FiyvnrhiAE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 06/36] block: drop ctx argument from bdrv_root_attach_child
Date: Wed, 17 Mar 2021 17:34:59 +0300
Message-Id: <20210317143529.615584-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 893c5a51-c0c0-4afe-3105-08d8e9520266
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35448EDA063F365371D8B920C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZlutG8D0euTrThj3WGEW9UgR/y4+AbZubgMi5kvsILpmah0Ege97LEwLyusZcWmptW3OrL5bq5tgRGbaRNOjKjF/a/iejVDqTijbi1iOOhcbB8cbNExGNUYQ7cOV+5AVFrXpZErLYmw1nWCuTlMqQr0rcr2/rkNYsF6XV0Vh2Rjl3MNJYGvbQ4Q1YICSGy3yo2jsQe94uly8wqByvBRZeT5ycasNh4LHGZnRD7RMnIqZ0/VEHBQfFKLL2r2rlR6EoC+KKCH2W7QoUapfXCKEPd7cEp8ILRissMHqrzv4qPEwRvB4scWTeX+kycgyR46tGgQZCCY4DKf7lEFPfwSEmrXJKcMF63t+TBwGqPG5sO/XZaDojKtCF381RIdlbEFWrGr6N68AE0yCVLPM81CUH7TBZYHO7fVOCtjwUsE7Y0qf/S5dW3qV9pUosMeDSWbkrpI7NI7W0H17hAtfSSQ5sLH+ccC03+XvjQOyQqRxdINzCVKQNq0+QbOXy6QU/g69qEazIvZIXzO2mLy+bk7Gk1ZowaBHDtFkTUIyAC0UXxg69t7bywaKF2ZMDwjx+loF9FUAEyLJj1l27tilJV11ewxTSgbdpJ/d3Y2bP05SGaFrdlXGsZvj7j+d8OnGK0w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FACuCsE79YHWH0lEQJ2+wLX1808Nigddd5ty8FZVjW/wU76fs4U1XLHhjb6l?=
 =?us-ascii?Q?PjlZq2zyu0sidcLYb70Hc0P6pqC7ekXlK4XY95YqkOIhLsyVVC+as78x6oeX?=
 =?us-ascii?Q?yYjf7Y8cujAMar77TcPyEgm6211FE1XFWOBj82rWBDrtXAKDR6Rck3QDMxqm?=
 =?us-ascii?Q?1em0JJS9aMH3WHTw/VXSt2VDhqc6IvJf+h+UmsSbELbKNd96bXU3Izvrtmy/?=
 =?us-ascii?Q?c/6vySIdhOk2kYNpz1DUuNFFX1DYJvBhVmyqzHfeaxu69YMmhvkV27yk4B+c?=
 =?us-ascii?Q?tZbYFsSCawg5m+gkX9ae/vs2FhYiiugfO665cm9iZKE9kiyxLMBHPA5nbBVi?=
 =?us-ascii?Q?zqTEmOY4W3x1A6kkQNJou1pWXdfZkiGA3fn8xNX3m++2nFFnWk9/uosJjkuU?=
 =?us-ascii?Q?T9oBGthpwS2aYTwB4xbs2qzxPOcbQzzz4Rwm/zXw1HKpH+SlWiLdclTPsPi5?=
 =?us-ascii?Q?YVSclcSzEztF1rjZ32tazIv+Nju7fz/FvohyGbtQ02wYR9vSsCkziAnu1lOc?=
 =?us-ascii?Q?K/XK+18fNw99WmqU01DcmBDzNPE6hbtQOyQK+bgZR0JGxDMCaL07AkDw5knm?=
 =?us-ascii?Q?X73VrS3W+GnwzzcI6xTB7Xey/W4IrEgFu/+pLJYV0w+YxN0GgTeDtJVcUJP1?=
 =?us-ascii?Q?raCcwTuxzXkwO4afa+RxVaCqzfN9EWYMJQBx9/9V6D8WcdsjMumdEJnZNmBj?=
 =?us-ascii?Q?KYmC3iWOcpGNke1UPz1oLq+Cv9ciNnKRI4+/ZFBnWr/XcWXSShq/p4JKHDPs?=
 =?us-ascii?Q?dPQ0rV9T4+Cs/GZMcBWuswwpPlRe0BHw3ffhTJvOe9FqAuNNpZh2qoWzq7kU?=
 =?us-ascii?Q?PN5QqAY8OULHLwyzDJUV4BOu6Y3SYDxvkW0gBk960v0Esu+sZXiQXrJIbdIf?=
 =?us-ascii?Q?s5g2oLW3e4NbcrnDuMl8eoPqS9piNmXUHQklCxL8nk+Zh+T8YP47tcBktq9G?=
 =?us-ascii?Q?+N0rpCw0nku936zGjeVR1Nbwc0ONfdsSBJeNWy9PbCp1ycA2cW13gm+zkHkc?=
 =?us-ascii?Q?5rloUQemy9jPKtqleGv3d5U3Z4/Nm2pCHpqDr9wbkzkOjHEyjxH7ybrEReRf?=
 =?us-ascii?Q?5qR0pXPol90HgJUz/HYZUM0EecOsJO6IGoJAKc4NLUNbgEMA3/siNDTxetQJ?=
 =?us-ascii?Q?aKTdbsFZBlldtpYXTcTlG74xMvxwgb2SELTRJVBC8kGDPaP3QjF1EokpY9CQ?=
 =?us-ascii?Q?z1AtvS4OssHDmho5PPiCBn8+dF/f5yWkgbTJ/z0QoBdec8aoDrh4egbL1J1g?=
 =?us-ascii?Q?ArXO/6+3uE50OPf1c+exY+LJ6KK8eRlhr2hIvOp8G0F5Raw2HNuIECx+Tjti?=
 =?us-ascii?Q?WhsSZJLZawaye0Xvy8lnh9zW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893c5a51-c0c0-4afe-3105-08d8e9520266
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:11.2275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uc21KAQzS7mYB2uUHJeqHgof+BFV+IFPrmtibA+eII9uMYF2XlYNYAvdWLFENddp+ezahNy/KY1GdW+1BjSQ7y4WsyJ/T9P8JoVkefnjggo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Passing parent aio context is redundant, as child_class and parent
opaque pointer are enough to retrieve it. Drop the argument and use new
bdrv_child_get_parent_aio_context() interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 1 -
 block.c                   | 8 +++++---
 block/block-backend.c     | 4 ++--
 blockjob.c                | 3 +--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 737ec632c4..dd2de6bd1d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1308,7 +1308,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
diff --git a/block.c b/block.c
index 2c80fc1639..61703027ec 100644
--- a/block.c
+++ b/block.c
@@ -2666,13 +2666,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp)
 {
     BdrvChild *child;
     Error *local_err = NULL;
     int ret;
+    AioContext *ctx;
 
     ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
@@ -2692,6 +2692,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
+    ctx = bdrv_child_get_parent_aio_context(child);
+
     /* If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
      * try moving the parent into the AioContext of child_bs instead. */
@@ -2752,8 +2754,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                     perm, shared_perm, &perm, &shared_perm);
 
     child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, bdrv_get_aio_context(parent_bs),
-                                   perm, shared_perm, parent_bs, errp);
+                                   child_role, perm, shared_perm, parent_bs,
+                                   errp);
     if (child == NULL) {
         return NULL;
     }
diff --git a/block/block-backend.c b/block/block-backend.c
index 3f656ef361..e4892fd6a5 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -435,7 +435,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
+                                       perm, BLK_PERM_ALL, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
@@ -849,7 +849,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, blk->perm, blk->shared_perm,
+                                       blk->perm, blk->shared_perm,
                                        blk, errp);
     if (blk->root == NULL) {
         return -EPERM;
diff --git a/blockjob.c b/blockjob.c
index 160bf38b19..2fe1d788ba 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -229,8 +229,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
-    c = bdrv_root_attach_child(bs, name, &child_job, 0,
-                               job->job.aio_context, perm, shared_perm, job,
+    c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
-- 
2.29.2


