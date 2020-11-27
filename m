Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA192C6828
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:49:09 +0100 (CET)
Received: from localhost ([::1]:43210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif3c-0003CN-My
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0i-0000yj-IG; Fri, 27 Nov 2020 09:46:08 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0g-0003DS-KH; Fri, 27 Nov 2020 09:46:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNSOQSRKT37oR5++dL26ynVRgSlxSgXhKyUy+G7FvvaGesuG2BBfIrZGRQzluIOakz53nSQH8jVVupzSBifobuAdkscEReOCCqE7furZ8x++OmQTG/kK6dBcIpjvjrGBx84XeyALLAhWgWfvRFmPdGMmWP3ZfzC105OhTv+l8e5sk3fiAPclm675uWp86aLVut90CuEy8TB7iSh5r7hxD7xkB1ZoA760u87f5sZga6yCtxQHbY7L2Gv7Fkts5tg1C5FoiLZOJBwZO6rZVwbsIit1TKiseqpXlgP/esumWNEP2OuhcdSEps/ZiwunG7KguAm3C6zoFAmEKHPYbD/3Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhATC0FnNbSgj1Fckf53Il0JbrsP3nIm/WMCen9YvHE=;
 b=Yxrrzg7BGUCiSi94LiZKOmqS9t/sRsiDyxRtyLN7KBrkuxVQFQYEMhgcWUdNUBqVOSYnF8lwK8w6oD+Badej/MOo64ZZeRxcKdsoq1nep5D8WjDF5CKq9sI6wcSGTdyznZIBX9fw6HPqFHhxwHgNWyiiEdtFb3XWaSxK93pLDb8QUE5AUj9QkzL8HgKyPsd4LJsbphZjEdopjBiL0edSVLux1zpoU/os26Kf9nleskDa7tem+59jPIE8pYKr53beVG4Cq/AzlPjeRqOzOolZOL7tLmNPpWlRy4hJaX0jXY59ienBYwJOst0QSh/Cfr54GYF6aOjMsyPpTOQrwHs52w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhATC0FnNbSgj1Fckf53Il0JbrsP3nIm/WMCen9YvHE=;
 b=OstFWz0q0CsqFdiND29LnRpCZpuQ6XcHyha17R4MAekpexce5gOjdCMZLVeIrxiRzsLzB71Y8OLWiQBGJhOxy44Tqo9Q2z6vpO0GxUbxXuJyomTgOM9PeQsfB4YGol7VMj3oKh/lbmVgTNDCIX9fs9R6NSYKSv6GnNsNQJiaGKo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 07/36] block: drop ctx argument from bdrv_root_attach_child
Date: Fri, 27 Nov 2020 17:44:53 +0300
Message-Id: <20201127144522.29991-8-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d69be697-1339-4fb9-25cd-08d892e31d4d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50785E701D8D2EBAB83A0615C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipIHVufVDjmG+ecI+uHEd+FXRDypCY/DFCHdrY8Z/5RI1H5lULLAaMvh/3i2eASz0peB8OWjndg+WMHtD7221ETQyWfizSlDx3qX7Iss3TUb01WO6KTjhr/NsyVIxUQlqboIULADTS7QrsygSGnx20/gaNd4Lfk0aQ3b77GjjaqUrZpAiUjY43enW7fWisx4SQ9QNSX9b4U6nJ1soGUVcxxQtgrnIFrMwa+FGskO+bXNRhSTwWCara7qdFcIIfg1kjeoq2wMvhdWYQkiE+Q6F8OSRaWpMDC/LcQHW1hogYkyMfR2Umv+dbmMdMTP+aq7cLgI6oGzYz/6HvxTivFhDc9n1gfL8QYM3ez2SfJc285Qi3tXJnnuX/O9d4hGCwyl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZqnxnIcfahnCcVMN7+PZHDzofgjwCnqVi+99C4XuNfw2qbxmXZrh4e3Vkg0j?=
 =?us-ascii?Q?ftn5SxAfsMS6GrEavSenkr73/CK7ATpFoLUz1jegGpqbcYLdcU/PKSwRZdYW?=
 =?us-ascii?Q?XgAu3hJp7Jor1t6F3fb7JcIGBk8zkQl5wMHrPAABMdTZgt3ObeuIRhw0yDGW?=
 =?us-ascii?Q?6OnCetLlHuSpsPaHscMX9Mbjg4BypoM3heWM1dXGw7y8PhEg+IhNYCEwm9VO?=
 =?us-ascii?Q?Hk7aReRRNDLHuxeQX+wIu8gELKPXdeKT6zrmri+X6LA66S8FgTht/J/JZcyD?=
 =?us-ascii?Q?gPI7F/wZF5eydnTK+Zx45P7ksjkAqm9dVy40N+Ge8mMXWuC5Vj/vM0xYd5+7?=
 =?us-ascii?Q?e6sc2kE5LYsIVRvXEyfHtbGk07xVnbSdHg2Ql6sKZH+tlyz6SEfOduqw9lAd?=
 =?us-ascii?Q?WuGOsJcEFk9SFNsbrfJFOVIWLoUw6nEPRbM9vcZTjwiwZLpRfiYtgA6oehRE?=
 =?us-ascii?Q?QLjHS7rXy3P+CQGKm56QK3BqfNr6tUHquKO2Bf2TdabJX221UQsaZOqQWntj?=
 =?us-ascii?Q?oonPteoOpRP4EH5Lwx5nFzVj83PUTGvUTYaZjk5y2IFwDpCp0Z0jXMrrHFIO?=
 =?us-ascii?Q?wMK+tcNmnlJhyE05FuG1TpY7c9VohoG8gnyhCRIV932/NEPjJAt9/8D7ESHP?=
 =?us-ascii?Q?J4aZPLkNTZ6l1P63h9SIMj7z75JXM8Dh9z8VYI+eDuu+zWhJFsBOj0jJv5SH?=
 =?us-ascii?Q?TEpqAReeMhI1nVPORo/tbQN/oZdES8fNCdKz0+bw9OIQ04Y7eGkvkfYBjg1c?=
 =?us-ascii?Q?NCR0JYks4qLjpA896Q5HR57j9LNi9r98CH6Be0KBDis1plUUZt8kT/j9WqNr?=
 =?us-ascii?Q?Z2F6d+oWfzWDClmRuS2r2UprH0byY2OcaCaxJthExRmX7LEQuSQsrwIlZhYm?=
 =?us-ascii?Q?HW6rX4OJiup0cHd7Ipa9/E+Eu2tVunQCs0zOjFkBVoAXi2jR6dZHjiwW3hMs?=
 =?us-ascii?Q?osovelbwMvMWzT/CFlgHo9ApUJqegb92PlC+N/IL9Fo4zstg0XqXO/j4Xi0B?=
 =?us-ascii?Q?5DL1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69be697-1339-4fb9-25cd-08d892e31d4d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:42.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPT5jyK+bOXhqZqSVBUkIz5Ys69XZLOMkkAbRGsVDxt4CH8cTUeV5BP9ytQOXXVKJUx+uEw2pk9+Gp35x1WQdNAfsFgtQLdhbJS6KCNJM0A=
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
index 943fd855fe..24a04ac2dc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1278,7 +1278,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
diff --git a/block.c b/block.c
index 95d3684d8d..15e6ab666e 100644
--- a/block.c
+++ b/block.c
@@ -2640,13 +2640,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
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
@@ -2666,6 +2666,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
+    ctx = bdrv_child_get_parent_aio_context(child);
+
     /* If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
      * try moving the parent into the AioContext of child_bs instead. */
@@ -2721,8 +2723,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
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
index 28efa0dff3..357931ee34 100644
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
index f671763c2c..01da714755 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -225,8 +225,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     if (job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
-    c = bdrv_root_attach_child(bs, name, &child_job, 0,
-                               job->job.aio_context, perm, shared_perm, job,
+    c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
     if (job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
-- 
2.21.3


