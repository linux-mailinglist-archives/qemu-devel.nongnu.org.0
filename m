Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CE13DFE60
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:50:13 +0200 (CEST)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDXQ-0001jb-VZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMk-0004yw-Bt; Wed, 04 Aug 2021 05:39:10 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:45925 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMi-0006Db-PL; Wed, 04 Aug 2021 05:39:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neR1wYpnHiLiCdb+TfhEmNG5BHFidyY64LrqVd91v/fnenW1gq/ZURD+lqwPlCu2deymRrB5I5gSgZxPiEwMske9arERdgjpJqv7pvadJnkxOtjY2nCBfGNH8Whmu6tS3jiGGhgYDnSUE/DlWLhmwLF4DJGKPdP5xHmrMX87k9WCshECO9VPzao8d5nvc8r8lsPY/JjXBfZvlDg4wvYhqQvLDQU3M4h7dkQY78tvGr9/UDpkhdoZjVawZn6ERjgebw9jkRoe+n0li5sDSZiD0P2Z/lpHtKQH5hVlERmPBDmL7W5r88BTWOBntr7XDICmLN+yi0+qmxolgxeO7JVlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=IjD8iC/Yguj8TjY0nT450n1zm9YzuKxDqwHCi4oqipikcQ9MvRginoNCSSFmhIz0KAhtQHmYzGusk5NQOC7/61UtARorrb7o0Zu2PtbNUYYYjRs0BMu8s+3s/FVUnGWBkrVmJyYn8DLyRYyZLFnpPNUYWKm0/IHBoUvVPMYM065dS2G/a4BeafTYyI8GFPhNq+NPvZNlp6fys8Eyh3vDE8V+z0LkhfDlRGTXOKmNq+jg7bi1x+HETKkrHJ/cExJPubQAV9Zge1at4XzrFOG9qIy29CT45KR0jZ7wkwjFq1X48iQvTzbJHFatfHNF+x44ZGoyS6n21kqbM7dTX7L40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=qH2uY3dbxw36o3+cx70gjJ9SNgFtwxMTdQWitCODGUP1Gkkg0cuHd5CD+rqnIwKGVqhL+6COxyPweH8HN2WzcCRjRn0H8/i4bYkPmgKYNdA2TVK4q0itvAUC9RwRiCVNObl+b8AKc/i8zG+bzkwOGcgk71vHoPh9CXIHOkLfCm0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:39:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 19/33] block/copy-before-write: initialize block-copy bitmap
Date: Wed,  4 Aug 2021 12:37:59 +0300
Message-Id: <20210804093813.20688-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7c288b9-8b5f-48dd-073d-08d9572bb257
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032EA0A15CB288489335B50C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DR4Q3VNefC892YSWuHO7FOzVwrggMPYpRjLYcC2XhVUK5NQPgYhbJZbdLJE6S/UniTmpZO2uoWz7rSyDWrKBE4Cww9Bnz5xAJzdVUrXLiCC44M7ivZh6ftqFHROBVplFF7WADVCcYUOcVsqamZFYlKi7GHxvBa4OoIUHshLtbCncLndndGA8pzba2uZtqncr+TF0WvhTtVzqp01hHEWOmDxRqWZoixS+7bdIcgNE60JiUB+8V6gtxX5vsFleWLwPIpv9GOwSf5NPPXvTuO15p907ngyfcdaGdixhnZUUeylAUlMT8xaEE+3xFzloaiwQ3XK5vu8rv+VpRe7hZczw6CaxZl89iVDPn+XTJpBqah55tN9j2nA7JDK/sEIRT6P9FxcPw5hyB7rWI5v97WB48A/F/6SzByS9jLbIHWAo6BBPrBB9bjdz63HafJ1PkdmOYuhauormzTHJ+T23TUCcTMbsvsgqKGGQr7sbDs5nd3+nQOmJt+WwCZZQBNZ3e2GdFh/GNLCjZN9wQynMPGIQvL/8VAohKSmPahcP3p2z6U1grPUtwIrMu+sr4rNBgtjHOrS3TgxCBY++RoplzYZvJREDW9b44JBfn28ebnP6gBt1EmuhiVv3MWmAYE+lBKl5hA2GI89WUxewdlXjjZ38re4IzENETWrFw9w5QOdBVPLqBseZRRIbG/CMXxSH13aDR2/8w6LjoPN1gOod5szSrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6666004)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+hCR6qo7RU50Ia0531ZYgVEDnYNH4KSl1nnkjghU6RJfvPl4q7AvjoMEIX0?=
 =?us-ascii?Q?99FZHPO9eV1+PSIdUTCP9qUXTOQdAZHwb+3LYB1gJxfKQ4GfWvenjtTzKfgz?=
 =?us-ascii?Q?JdrCxq6tOj0LbQTOTkG3Q4Qmw/ngACeXgWTRel/aHAUmWjOI6EoOsSky0bi6?=
 =?us-ascii?Q?GH6VALjAE4yRUo3IJTxv/QE5ZA9pWcUgzR034N2WtWvH5UkLYK5UsNOpjMrw?=
 =?us-ascii?Q?83/idHkaY68S+T9VpkUv429mklZznYJTfA8QtMtR0C43EUfwjrfMX+/FNDYU?=
 =?us-ascii?Q?5HnJuZnu+wBUVsuuwpCOpS3GnjjrOaMtTb2Ido8qD0NffSVisCLln0ybNqCV?=
 =?us-ascii?Q?pAlbor2QexNryWYmn87+1COsfdXVNz5b3gDKgUYNOOtJ7FXsmLrFAOgzPxZf?=
 =?us-ascii?Q?gezL6f1x+zt77saZ9x7g+t9n3s1DjQ5nQDr9stJ3fbZq0CBThutpFqwtqXj0?=
 =?us-ascii?Q?qFcjntOlH9WzjDDoUhmkiUcbi4nVoiKPqjpg+G3WDMeEW6nY5U7TkotEQj/9?=
 =?us-ascii?Q?pCxHJGsKF5Az8jDvjOpoWvFvcvomuM2Y/MAo7etBsm9PUYPqsXwGdzELjVro?=
 =?us-ascii?Q?jj9MVELwtPhiwQUnV0ZbE2B0BjPYGOu3vVgy9ipd5tgm62V4trzI+18msuVg?=
 =?us-ascii?Q?BmhNBBhZHhTcg0JitEAHS/hgvcIW0KatK/7d6QroT4Nz6cKl9iC+qvWneFkj?=
 =?us-ascii?Q?CU81czXxX94PYlG/w/Rfh+Ju6BnI/n5YdofXv515KQ2DQKluPz/7N9oKNsJ1?=
 =?us-ascii?Q?jb0yjsrb97wE2culbRm0toQZdSi1grtf+FzV+eRuhENZd66KyTpl10Rid27B?=
 =?us-ascii?Q?RjOwrHW28vwRJ1lJYoRri9VKf12A+IL+oD83FGZpaRT+40PnKytZNZQRT0jH?=
 =?us-ascii?Q?/SVaqasogmW4XH2dafi++/IqNJJ6+yOt2g5TOO875T2+Wl/vfNgynm91Z+Vf?=
 =?us-ascii?Q?naa//pzTyqFqfXHddL7ThO6g0D7z640ts08krIU4JNRmAJNMdSuaA/2JMF+R?=
 =?us-ascii?Q?SryCnvjrz+fn1dEmfqgr1N/P9VlHoyUU+yL0jdoEeIfm7DghByJVmrr4U3ED?=
 =?us-ascii?Q?rDrflOnO47wlxPV5dxowkqK3ZQ1sULCHkSRkIHi6b8qoMhl3phpkmnnRdEpS?=
 =?us-ascii?Q?5hvRgpqREZwjbtgkgw+kIIsq3iF7gDjlJgxx/iVbBuvAGtLKhPV01QjnrGif?=
 =?us-ascii?Q?N24YxEpvxN5Baf928QAyyGiFrR7Dyyxbv9tc1FQyaNRD3sQN1n3l/IUuFRQV?=
 =?us-ascii?Q?YBmquoEIn5gDi7eX4pIg/WFukrS639/Gn5Im5gzZ/JqHuGgMYb1fLEmKLQck?=
 =?us-ascii?Q?okoslkkUodvtag/D2eugB/o2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c288b9-8b5f-48dd-073d-08d9572bb257
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:03.8556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWAd8jxqgH5zw6hkBKEwyTdxx8OVDLzi+ovIsT/4swpMLrRvW7pkV7F5zWFO/5+nKTKJyrX/+A8pXzTf7UEBIXE5UAap+8h8oc95IiVaKNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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


