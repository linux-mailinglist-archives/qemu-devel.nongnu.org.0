Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8B3D0C7C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:37:59 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69by-00052W-2D
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697l-0007ms-3F; Wed, 21 Jul 2021 06:06:45 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:21413 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697j-00027t-GC; Wed, 21 Jul 2021 06:06:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3tS2xaVH+BLJrLjDxDnQVkKEIxJfMP7qpnio8MeOsqOVeERmLBRS6cD76eEmjKPOB5eXnxsIXwTkrRliDzAI0mrjMQ3oF36kI+qLukNJJUmshKDLzste4Xk5nAQX0JFZGf9JOsMfKrjJySHuShXSJz+IF5v3xWgtIHV4sQDuLRTrmNOKkKwP5FGHSEaF0P+d6prBNBavemHI9ia8F2wN03QrwNP6vONzvj9Gzw4EwCJrwuWH8ESfc6TGMPrQg4yztPURHP3/LvugYsqfv0JOKTyoApoukYvtJTDUDOKvxX44OWd/cljXQ/l3K+TAkmi2ctUAmSBijzAqpel2wz1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=hsyKbcfVj6eKFVUG9tLJnCXyh+8q6T7I/gZ+evOxIcLKk/fMV9uzh1rKnVnQQUk0raFMC+m0Eh+NrruxNWrWF9Z1uQ4ZxPSeGmN16j38XxbfhYqAXhOQycSUR6PG0qmpiFSAFcmnvh5Ctx+AyacRshrVq4ooEoT0M1n0DT7ebuNNKgYo0Dt7T+0MPoSEf0qh9BQQ7MXPRSAyRNCr7ugshIlp56Gyu0w7rK5bcE39aah9uJ3gohOQ2mFElT3tQxMeXz4lDT7oSHZVlcYlRj7wIaoWfjHPWGeBcG9UUK/r7u9r25M+CDoFErSWWHbXTitStPPmHProd3ViZFv7Ql6jZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=rUeDgRatBmwMrCxsFO+N6p4xNRYtb/UcisHKs1XLjDcy21QWO8+evS0SnGPjRHPGs48nhOXqjIycZv5hiUAkspAweiPIpVHrD44nGN3NcoraVD1HHt8q5oznWfq/9vcf7Z9yreBSyOT17Mizk9GQWw0MOLPnK/E1AFLqqnNTqH8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 19/33] block/copy-before-write: initialize block-copy bitmap
Date: Wed, 21 Jul 2021 13:05:41 +0300
Message-Id: <20210721100555.45594-20-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c77f767e-8627-4092-e823-08d94c2f39dc
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54946732DB6E3379267A1DDFC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fN7XbtZ2u/42gbcZEy6Qk64pNC2tbbqtU31a0mq+djc5AmhVuzHnl9FlYi1lWT3g0qwFo8h27DN/tVdIUIHs8fzcx8otan94OJdh3zeqgmeXUyVMrCiiQpl2WAYL+MoBtcm9URkCW/hvttMbbHUmqljk2CPmRfDDIntPU9YxwMFyu2ec3zFuBiXDZqRfTIBbck6sHlwzC000J9ecZ7i2Q8bekrob1ZxYF3yYMkBt2YlzBqHuuobMiKNndMCnaK/DObPfDUlB59J/Ve3YU46lB6LvwbVw6XvY9zHfsiqs2ZoDINcmXXEH17Xd4TbguCcD+smnILeEP5tPMZ5QxhcOXYohOAyrWbcnyRra6cJ/mL2+l9ntGlEhXeqDdlRQ1AU1FWwSxbNNori5inKc3JQp4fTtBZ74CK7a4M0iUfmmtAgorkDqdAuG4Rw0Gm0gUBLu2R3XAGatfIwhNC3rYQ/f3bF/vTrBL8Jk4gWeOKBslHYwuuK5zlPpTq9RN/oOJJWhibAIJqsnwbVuNutvssRc2Tc8UouxyUFZ2rbRgb8sumBx+tTHtDRKrIi7eRz9OzielxtWlBzMqkK2X1WGbVfGc2gt8Cfvgi9eSqZQXMjiNwDmEmtJmI6wkSGG/q6LZ64G6m8BLPP4p/XyxIkkQtU1BLGALMS18ZHSmCbMsKehDAeR86s2xqbus2lwZbB3XalkUiKlUj/X40dDwhmyU4nxEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQj1soISwYO87pgN13coDjPCecd1RqMSMM39TGXKLOlCTHlrctxhWVzGuJfz?=
 =?us-ascii?Q?YAaWDKoauesiRIs7y8S4b0o6Lmd0DU2awPSwA6GwYZhe0M25USJdnTjfkLkG?=
 =?us-ascii?Q?TpNiVWygQwyL0j+WsPRLfs/4rgwcL6cOhBqEmh0ML9Ux3bZ0skRJNzwkl+fA?=
 =?us-ascii?Q?fArJlxrrDrNuKl8DzlRtBqQqUdGIKLiM5ZUIBz+hOeiWCH47G9X2wa7qQe08?=
 =?us-ascii?Q?x4S5/IbnOWpUuD6orz3wafu8Tx4P4gZXMBlO+jnw2lN6i2kvb8jus6Uwfev0?=
 =?us-ascii?Q?AV6GtdYoiM/VDEymXjk7OU46FFTkO7aiwoClA5PqrPtmGiTAss2cPTDybFLy?=
 =?us-ascii?Q?+K2Enope7jVvFTPhI/3Li22XY/u1JckUSHf8pXPy5uUQLaK2yMQ5DTg/VVcJ?=
 =?us-ascii?Q?5HbkPMZ57hA85l5Qquc9vXGXwdPJwXj9i3AtOshI4MZY6kVK+Lbt7m9i4ji/?=
 =?us-ascii?Q?YHfQexOQKxXwHhNniS0GdOn4w6E9szL38mpyzWs2YAipUn3eT1f42jJ1XHLX?=
 =?us-ascii?Q?yb6jE+UfRKrWpOHNMrJNut+tMhddO5MY/CXaJPcZ6P1UdI2aLiAEiZsPzXiF?=
 =?us-ascii?Q?jhSY0GmK63TjsFHcz2iJyQdkAaLIDz5c+En5HDhtr8j9K9xjawf/WnaJuF29?=
 =?us-ascii?Q?0hnrrRTeiDOnaY7LVnUp9HumPiVxULY+k9a9G7vXpZL1/lizh87FR+NuYbRx?=
 =?us-ascii?Q?FsmwkhXGkzzTmUzBo9/7ekKvUNuoex8RTIrz979AhMNA1IsP9Hrk1f7xECmG?=
 =?us-ascii?Q?pFsxA/64bVThvq3jCPsQxwAORL1stMztiHDuztGL4vA+/wxEZKlxMsu7rTCu?=
 =?us-ascii?Q?Xg6K1Ke73vi7xdn0mvciI//vBRn/uaiC3m7z/9BCrfG+BAt2Q5DZUWVoDy/E?=
 =?us-ascii?Q?SvK/KHkFzLKHNcHfqO1JqOQpUQXCtB8P9ohU/ND6+CPKkg9OpCua+UOZDAnv?=
 =?us-ascii?Q?bJ71UrtclEVMBTMSqN9nC+T8Druf3C+a5Mpuf0BRkRimdchmFUNxHmd0/lIM?=
 =?us-ascii?Q?6zAq9z2T+wsBV189qQ5WhsyBWDZVUo5bMfTkpozBlMFfpII7EDQb/sCcfI1C?=
 =?us-ascii?Q?zm3NIQKPuYwMHN4BCTXXLKgp/cEzzIVSX5JrZmjZMKX420xtJWRNVNCcRPYP?=
 =?us-ascii?Q?NgnwGkS+3lh/jeGCMy324mNndrl3GSOJW1/0h7iRnp6eF0phDvi21n99CJp1?=
 =?us-ascii?Q?wDfDkm9M+c/I9F7Sarq1v2g5kp3BDEnmr/Zu6L1cvCGUET2+4+ZCapz0zAfe?=
 =?us-ascii?Q?jwkZKWWcQCINQg/jng4p2SM0MSyR47mhgmyvpZOGRpzG20qp6PuyyjLZ3BjZ?=
 =?us-ascii?Q?04D6mf5ke/4CWS/1r53inASo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77f767e-8627-4092-e823-08d94c2f39dc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:36.8872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR1VJ5Rflk6gkHKuXWf1Jig1xGkip8Uvl+/CO/L1/ZCSFzA0tRaKpUnzO0u4kyx7jZx1XRDouUQdBhEwuabdbRertALE5h1o5TG5fhzbu1M=
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

We are going to publish copy-before-write filter to be used in separate
of backup. Future step would support bitmap for the filter. But let's
start from full set bitmap.

We have to modify backup, as bitmap is first initialized by
copy-before-write filter, and then backup modifies it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c            | 16 +++++++---------
 block/copy-before-write.c |  4 ++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 4869f1e5da..687d2882bc 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
+        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
         ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
                                                NULL, true);
         assert(ret);
-    } else {
-        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
-            /*
-             * We can't hog the coroutine to initialize this thoroughly.
-             * Set a flag and resume work when we are able to yield safely.
-             */
-            block_copy_set_skip_unallocated(job->bcs, true);
-        }
-        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
+    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
+        /*
+         * We can't hog the coroutine to initialize this thoroughly.
+         * Set a flag and resume work when we are able to yield safely.
+         */
+        block_copy_set_skip_unallocated(job->bcs, true);
     }
 
     estimate = bdrv_get_dirty_count(bcs_bitmap);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1cefcade78..2efe098aae 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -147,6 +147,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -174,6 +175,9 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
         return -EINVAL;
     }
 
+    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+
     return 0;
 }
 
-- 
2.29.2


