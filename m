Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A910F2C6847
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:56:27 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifAg-0004K2-O9
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1G-0001Uy-3i; Fri, 27 Nov 2020 09:46:42 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1C-0003DS-0N; Fri, 27 Nov 2020 09:46:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdZeuOBz2r0w9zzx84LB4QNCmLquT5u2SzmxNzvpW/g1Mo8EAsSC5nsPGuFKKDk9me6Z2tlTkaBhB1HyGlbTOITD3FbHUYabU6/GQskGpMLEn8UbSfEyrElMI+Z9mrml68Bt15yrNI022YqWLrpjeDNtTbja1L/zS/IzjyagjklsVUQ5Zt11L153x9wbqScq/6aErFvpz02kg0PokIZe4hxAewKwuYUgI6wr5LnpOL14D9ntchJjkJQpb+zrZzFvsqmKHrsmMVWshOvt7ITEyBd3JTNlBQZcSeMfDtR/4iG1nYIgS4NJQQ8LYPoM2DNmgXF5p9rz4RKiurw3OwAolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OheHyaMRfMYYcR/ah1/njMb6IkLTse8lLLrna9dz2r8=;
 b=EklFg9aZmd6sUz+FOSnq2y8F9jSNvTV+2olskdeOm185dMLcze9gyyAkwePxn+KFpyFkMC3StJXeuOirfdiLyn31M404Fbz5Ohxh/O+g8OBIxkrbsg+NgRIkTymwXSwNnSv08EWoojFJouR6+M4+XS9aQVRdTfi9Xorzr4gT2snax38vcp54ZrJrFmXLWrXMPT5TB5ZwsVofDl8rSiPfqrHyc70A4dx9w5ZZrzN6rpvMmhUq0rwUp6n5KrvndrWgarxJQqaNq2ev8u5+ylg3EqSZ/w3XzaB8TyzYdH7bB8Vhgssb43VWfIivNDmUaX4bfEZDfgN2H2wpmC9A87vVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OheHyaMRfMYYcR/ah1/njMb6IkLTse8lLLrna9dz2r8=;
 b=B/k+QyCbhQvZJba8IVLqa6IjYPtVkhBxMNGZL/nkfXsSsKr/efyRTTcCVSumvuDs3x7dNinvpK0BToNt2niSNas8QHcu2VJxRw759Wyo5DWCfGZrEv7JMxDK8N6QbBOZzYTeB0c6ROWnfhW7Xst8EIzsi7eMJpPLxbYQ2VxBRUs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 26/36] block/backup-top: drop .active
Date: Fri, 27 Nov 2020 17:45:12 +0300
Message-Id: <20201127144522.29991-27-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a57a6b0e-c00f-43ab-717c-08d892e32621
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078DDFD33D41A5A1D430C10C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bb1To5Sf698b1K30A6rJ22aFN+0/KLfYCEwcZ1puinFEkFBWGlkeQ4LX9vRhCsymVSb6fxMkqYlxq1V1nvj1NJTSLhgwnz8AxVWRmftE+aBOxhXtAFgqvqFLnItHj9ew3kb/Yyo89M8Hak/2muFOrj9JEu8cjz7XdirnM100K+36Jvy7mRODGwSMHjAt33Md0mcA7PBs5JfXFGuCeOu9bfjZMGy73G4lUq+AZGCTgHRXDjyDoa7KTz+ptkZxST3WI3ynWYLOsTNQBnphHd5FtFDzKrxpd75JiWIT2vT6IuRPPtKdMQdAkZbl6FeiylksP42g8Pf+/2YIxZPJbj+1XEYU/lfU7zQcBYBVcd/E0oK9neO4tJrqkRskoepy9nX5kDi5BETJW5zc6ZNI/j42B9Kwb687nCWLy2gPteRdKsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Dc5FKzn+Msvl8VNEctbnl6daQ2gg3+HcvzkypvjLHwMc6Kfeco7vaLsAvBpT?=
 =?us-ascii?Q?C5m7wR9PjqBINzB6H5DiBacWvT9sqOp6UekOmMjAovPq6k4eT+G9WRqZFxCF?=
 =?us-ascii?Q?/kG1K+/1mJzuquX2DGdNDjtpA1e/mt346ERv+8fYaX7OoJ0cwS5FxVBOaTbz?=
 =?us-ascii?Q?REKoMLrU9RkqRsiW+5si2lyAyHRC7+JF7I3g4ALRJcNfMvL5n7tkYQ85k5t6?=
 =?us-ascii?Q?UsUPgzmHdeQ3ztrerXS2vxEXQ4GjuwI66A2FS4P1Hee8ZbStfKbzZOwagvqe?=
 =?us-ascii?Q?RVYa0O+Rjuc2afLpu7HztqYUYgm7JMQoQiNWdvyDRQS6ReIWTmV55SSu2LaK?=
 =?us-ascii?Q?o3TFfgMaDINEHpBKUv7rUGCB/kBXaMhWHclkOrJ9iqc2Jds0hUGX0b5kek8q?=
 =?us-ascii?Q?bZKE7BT8jo4blYwWtsBLVQM96uKH+pg5YWlgrzuJjnmR5NNH3PY6rf1srvGg?=
 =?us-ascii?Q?gXcowKU9m51DVewupRpECl/wz6cTFErEV5AhLlYeOAHEc4CpsQg/mJPbCegF?=
 =?us-ascii?Q?BuzWJ2M+DRgQkPbX1jpcQk8qMa656Nk4lEYBVnwEHNntzL7C4tIyeEfNbheH?=
 =?us-ascii?Q?+TMCmhCi2J+4RaAxTZM/3Y5UhFhOz5OGQG3vUhqsSXRXKhYrkX+e5TbTI0nR?=
 =?us-ascii?Q?5pbpuZb5u0NrvtxnrBR9iQxrhdmk/DT5xz0wD/Jt9gnpQaTAEnH7wx8/kfHq?=
 =?us-ascii?Q?FEdJiO5b3zPLOlXORN62aJMii/q0WCLH0N0JlxET5Kq/utqKK7J8hYRZTvFj?=
 =?us-ascii?Q?bGrpI7/5cap1ijmuhj0snuGC/CYKbhJzFj8dTX7J/AHAKVIedmg28mnS63vK?=
 =?us-ascii?Q?21nJ8F8lZXmSXgwTdgAWpp4pRG4elq7FG7xa8aTklVLgBO5G4Nl4Hcm6pDu6?=
 =?us-ascii?Q?BOrePUeU3j7sz7wElqmsrlHrAOk7HiwOWdyuDAyIg/u8jVoZh94SVtV0TS/Q?=
 =?us-ascii?Q?h/i4Yc10cLwn4wiGH8hRRrJ88P4hxhtk8sLuOteBQto21nyju8LgYBen5jzn?=
 =?us-ascii?Q?ghTi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57a6b0e-c00f-43ab-717c-08d892e32621
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:56.9475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFZZEvOvmLjjvbBSNZ6Y3UywPqJfMGFBa4wuO7UvL+z3J6iPC3bHU4DulMQycgxZTYfhcp5v2gpBv/pF1hz2hFjTrEjNdbZMGSeDqn60+bY=
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

We don't need this workaround anymore: bdrv_append is already smart
enough and we can use new bdrv_drop_filter().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup-top.c         | 38 +-------------------------------------
 tests/qemu-iotests/283.out |  2 +-
 2 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 650ed6195c..84eb73aeb7 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -37,7 +37,6 @@
 typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    bool active;
     int64_t cluster_size;
 } BDRVBackupTopState;
 
@@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
                                   uint64_t perm, uint64_t shared,
                                   uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * The filter node may be in process of bdrv_append(), which firstly do
-         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
-         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
-         * let's require nothing during bdrv_append() and refresh permissions
-         * after it (see bdrv_backup_top_append()).
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     }
     appended = true;
 
-    /*
-     * bdrv_append() finished successfully, now we can require permissions
-     * we want.
-     */
-    state->active = true;
-    bdrv_child_refresh_perms(top, top->backing, &local_err);
-    if (local_err) {
-        error_prepend(&local_err,
-                      "Cannot set permissions for backup-top filter: ");
-        goto fail;
-    }
-
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, write_flags, &local_err);
@@ -256,7 +228,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        state->active = false;
         bdrv_backup_top_drop(top);
     } else {
         bdrv_unref(top);
@@ -272,16 +243,9 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
 {
     BDRVBackupTopState *s = bs->opaque;
 
-    bdrv_drained_begin(bs);
+    bdrv_drop_filter(bs, &error_abort);
 
     block_copy_state_free(s->bcs);
 
-    s->active = false;
-    bdrv_child_refresh_perms(bs, bs->backing, &error_abort);
-    bdrv_replace_node(bs, bs->backing->bs, &error_abort);
-    bdrv_set_backing_hd(bs, NULL, &error_abort);
-
-    bdrv_drained_end(bs);
-
     bdrv_unref(bs);
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index fbb7d0f619..a34e4e3f92 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,4 +5,4 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
-- 
2.21.3


