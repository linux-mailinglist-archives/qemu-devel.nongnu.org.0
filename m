Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED5382509
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:07:06 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXLF-0001cf-JZ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0Y-0004GL-5M; Mon, 17 May 2021 02:45:42 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0P-0001ta-1J; Mon, 17 May 2021 02:45:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRlCnYGdta+QfIqWyNDVQxJuP6C32qshRLXxoicELwpDeO92hBJYCZcTQzdwDPiXY4tSMlSrQWgfnnQUmpQQnlw7iCaGtENhysWCCHbIrpqHslA3ekTPMsSuUOCATFSjuFBoeyBXMnOwws5r7EzBGR2Apyk2hobhTXQe4ZAS8R7hSO43353B/Cb1qWcFDGcGEKmCMulyfyO5AIrEHtHSB5VGFnbo0aMYmuWBoTRph/vKyGM9EUEIFRa8A2ze7UigbvXVadLJlRQyb97qELI8Ht2nA073p0VGY1QbasXEG7rs0XYENF2F/tW+hl5NKsyStURellX8vTWhtrWVYGD7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qqFCkSVRF2NTbV4K4hKBtI6Y9GbWBAgKZcbi2JnzXg=;
 b=fkUomIod+ChBLWkXz9PH1RwoVOSaDAXyPnl1yoOLn6aIk0qR1LPk2J6gJFecVYHiE22RT/E79fJFv77nCJV/zb3bMrmmKUHa8giYZZ2LlDRiYfp0RELMfdBPHbCtRdnuHNZmbM1/jL4jyScUvc56yxJgUnXxhELqoTuSNvdjV/f2n6o/LeQRqGo2KKERBuSdVnfaWIrTQZGn9YISjSyqz2w643UnV2XQ46M5LQsj9rhkTn9bjFx2N9w1UA4U0LGwQgDCeY53oYEt6mMFHQxQO5Gbpub2rshjV6lW8ZVqdjsti6/fEp9GBE6hyWVRUKUZ3YLY53PPhQKu9EaUtuiUvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qqFCkSVRF2NTbV4K4hKBtI6Y9GbWBAgKZcbi2JnzXg=;
 b=sltBHynII4SKwGZAmK/wbzJMPXrtGnHPNQyT+QXpDLESBdcYp50KjSAsImw/0BQ4yiAh5P8jHzPTi0JTKKAElwRP/LDgk+vU2TcABfmwBVOho2VdqyXDf6GjrPQ11y95YP5S9dYRu8Sq0LZ7noHcBVyQbvI4WbpIMf+pAQwyqko=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 17/21] block/block-copy: switch to fully set bitmap by default
Date: Mon, 17 May 2021 09:44:24 +0300
Message-Id: <20210517064428.16223-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b562e5c4-b453-4e67-5bfd-08d918ff4ff8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43419C0C426946C0E2CDA474C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 66Va/0WyXx2mOSbQVyhGbtgAA0ulyHiGfdJFXoWOU91RXlCTrIKe3BRjrUN3H4N3QH7Z+waW2GqcQf/qmsj1px/sh6/WngoRoAhRiuqm+mLvqLRk6i6Frpt3e4fhXaa0mH5yZqj7d5opleo7Gq46q/VwEW2ylangDhKpK+eVIQLZkrRmdoQ29Qb8L2Mv9HJ2gt5Os4sB0jKkTIgphota4/V9RqVKUZhtaAcUdHriuqRjt7jaG5wom9gGGYd8WM549b/sE0eSBWQQwj0UBrFxLkGF2timB/JJTUIJ8oIIORNN6bLZbdN2kj08xCISxdI9u6OpR+FbJgeew4PiSzqPbPQolD4uh+0kSgwiHCZ9MpZSJ/LoVk7UZb3aBlL51ypi0efHSNHv82Q1vwadAG4gwPucaXv+JKRhlIn+cXB4E9uDNHXqK9Rhs3AfJIM4ut2G8oIyJz9EZsZvoYe0hwfRzTasXPJGz+nuOeJtnpIRRrXx4oZ+AWkxz16sVH3o5iaehsj0VyMFc+sLV2wPcpclLPJqAOXny2J3t8VqAvAbm615Ni9EH9Tv47tn15Nd4l6Bf/ZbRGrquzFkD+YTLVbVXn3g42AYNngoOquxhWDDXRrpspvHcFtQPQ9ZbsS+RluvGO8ipx9K1CJtj+CcZGVOkFxOOCWeQRE+MSbGNNiLcZW0ejFxV8erHDU/oL50xy5z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1sQwaZPzgnkuwgcJWDXdibr/8Iqnkgk/6EWAfXHkgJ2B49kkw9UuFWtClA0d?=
 =?us-ascii?Q?gsbwQ93vTdiJR7jSJGHliCixGAIK3NJTZ79lePb1Wk+/mTr3dZbcYGQ7HVHB?=
 =?us-ascii?Q?nM2W27H7EM5kDCHO4UkI7UJheMuPrdr23jA+CEkhQD7EGuresz6SoWxCGS1a?=
 =?us-ascii?Q?lwC59yMlDDj9ABdJ87HoVIJgWuxkxzk0e9OtO8ndaBxLAgE7vhTHDs+q97/a?=
 =?us-ascii?Q?mJiOyrcETORbQFvQGguHW03ocfm0eKkU396qpRofpAjbw7Idz+VwL4qHUYXq?=
 =?us-ascii?Q?o10i/szNs4rn8YYHdFuZgWfJtciLHB+wvyEm0aMqelKx1WCvDkCZtDCss2tE?=
 =?us-ascii?Q?e+l8gUJBBE1WJPmNfO6OoZNO48xGmSOKlObkmPtWzAph/DidpmtSpxDOzo42?=
 =?us-ascii?Q?CPlzdWTJUo8rWj0XR2w16m1PEJ6mPHnbxNqpg/73wJOQSdo37A54loA1PqNe?=
 =?us-ascii?Q?VM2malGk3mdkMNlSR224BR8JMHh+x4fysLRyP9EcyIsOU6GLcixwBg1cVxmh?=
 =?us-ascii?Q?XqGQx33COnyrqqjJRCf8QSJgu+FYJFj9sA8SdA0WgJ5vnaNAk44dBUctegui?=
 =?us-ascii?Q?nmtutOVtC6hB5hMOegU+DaOzVjwxeLcW4ipDxmwxgg0Xn/RL3/Y1un5AirC+?=
 =?us-ascii?Q?WcJKSTL92tqkqRbNSb/S9FQwjx0K3TzdjTAfC5B30358ec5SEBv1p/vXJ+oN?=
 =?us-ascii?Q?tMZi5sfAquhFNiGsvpxlllhDDhpKv6Gk2xO+uIY7M/PxmCJpvh5h6d3IuRfk?=
 =?us-ascii?Q?yRklchitAhx7NchNPx7sy8EIrBskBOcGBo1UGCRsZbsVvQ0RKXfjiXw/qFEF?=
 =?us-ascii?Q?0B6MbAe7q7pqL9Flrr7aYSV3YD3iXLKWyI8crj4kgZOtyvyPbTLYmCXYZXR6?=
 =?us-ascii?Q?43B6b1ftSzKpu28+AfDTn3SMuEq9789NamhLmhdFEdcAXQPuFGlTduN4m9ws?=
 =?us-ascii?Q?FSwDZISgFmsuVB+lVpQaNcXtgB3kBds7chsVAWtfYOc/r1d1J9Xpx5xreney?=
 =?us-ascii?Q?Crppgq/58V1UK6OrAFfJ78pvgMgco7kx15JMRi7HO2D8KFx2Cfex3YKb+0y7?=
 =?us-ascii?Q?SOjk60p4yd8whVn3YQ0o2M4BHJfnpu68tq5v0tTdlxpZsMdnFZwQ5gs0NeBj?=
 =?us-ascii?Q?CDI5WgEQzt7Q3rmONNKRlURJTjAXbjsjP2bOBboa4OXFmCjX3Hp3BoT0UTQE?=
 =?us-ascii?Q?xz4Orh/llq0sxVtzBJ8QliC8nyWx3t1Rc7xCp4h3GxxXO2EwD1Q5XLhS33LS?=
 =?us-ascii?Q?om28IInFCThM92bEVcDM2P7KWSQ84Md7pVSkMRyVFgAyYKYf3KjJwGV8+5Bq?=
 =?us-ascii?Q?L7ffNjEGrqoCurHW8X9TCmX0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b562e5c4-b453-4e67-5bfd-08d918ff4ff8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:08.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yRqXZigdiu9pBDLxsrm+ynBMWl1LGH1Se6lgr6WHTkWrf64+Jatmp/7PbMXOxrxtAJoo5nPIR0ziELfE1PFhZlgYmeiW7Rl5UjEM4Dkm0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

block-copy has a bit inconvenient interface around dirty bitmap: user
should get pointer to it and than set by hand. We do need a possibility
to share the bitmap with backup job.

But default of empty bitmap is strange. Switch to full-set bitmap by
default. This way we will not care about setting dirty bitmap in
copy-before-write filter when publish it so that it can be used in
separate of backup job.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup.c     | 16 +++++++---------
 block/block-copy.c |  1 +
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 90cca1ca30..706c54fea1 100644
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
diff --git a/block/block-copy.c b/block/block-copy.c
index 9020234c6e..4126f7e8cc 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -296,6 +296,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     /*
      * Why we always set BDRV_REQ_SERIALISING write flag:
-- 
2.29.2


