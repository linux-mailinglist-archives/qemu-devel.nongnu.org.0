Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96273A2AAC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:49:21 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJBY-0006PF-U9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqF-00042Y-TC; Thu, 10 Jun 2021 07:27:23 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqB-0004Ve-2H; Thu, 10 Jun 2021 07:27:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEax5TsGZkANuIHlHkpB8bdPLwBwSdh2N6wb8dwjOp4x35tBQBaca2jkSnMb6wTPpjZmTV1WO0i8xQ+X4agd/JdRqJdjMmqqvErGmiBkCYVvovJLzV56dSQjpv5rlojIgg1jYlTJsoXixkyPrrFg5GVMwIYgCONkwnOCG2UEemos5LHuo/KRt33B+0660MWtiHHwGADJ+aA5qTzUuUkieOGeG423g9dWeLmA7OBd6yDgpKVOyP+2cLeowIqqHFplmRWOoJSV00bQrzPis2f1AqD3an3IoEkNxAXG2yohY8yT4rblc0oMNTyjx5hEFDffJ0r8EdvrZYga8HoeIoToRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=NYhfBN/UVvrIzf/uq9EEiAhzrzgihn7ItY5zICwdtAoGTavk27JGRIVioORIdJokW8tSKmjHS/RmLQLd6USl7oKUU3eyaM/dgh6JpNcSAjKxCFHFqJeZAVMT65VUqwU3B0xf37rlESucw2gaAQkOVvqnFcdzriUVLNf0HuXfGKT3K7EUS4osgEKvnbOWDkUpcB9BR7Y4g3hhPhWCZJIV4tppvUc1RahNRS4fZXsCIuz42HeG5RK7VB+P6Qeruxlr0gtkE8eE28xIwWcQY/tVP9DC9McWDRHYmCL69Ssuevfy6sCvrTvDRDlPuCUzZL14rbuaUZpE008BYxIXj3/Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=qFehPKET+MS7GaZtyxzLsYWrPEZavrxw5TgLZhZ8UtwipwHK2lHPkcTyTW0c8o8oak8W8NYgnMTG4fuzQGGC3isVGM+qUeMi+CkrcRB4AD2ZMg0Tt1cK3vWpKuDXsrnFB0KmINs7chaCD9QsiQciYf5jGo0ag7x/35d0g+lyd7s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 21/35] block/copy-before-write: initialize block-copy bitmap
Date: Thu, 10 Jun 2021 14:26:04 +0300
Message-Id: <20210610112618.127378-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf45345-0a4b-4831-9496-08d92c02a757
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381908A4A394760B18DDF24C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3LZlObp0NNcBZDvdZtU+Vs0ftSmF85or/5FDJO8np4hTkRdRquMoxsCFgPLVNOaBYLMmvN/FKnV8UNU6Xzj5v6P+yXCd/D2YoKY69ayAsFe7KSKfLMEln6NY2JfhrEzfgpqbk9bbwRLr3RCBZHGCMv5T2YYZzf5PnPeXu/eYbTocOcQqAi48iqAfxcyW/HpboxYfiHmJt3c52rajtJR+ZoiyM3haAzQ4T3tr6ZG8AxyH0Z2k4gjQ5BmFT7nQIrtaOyCZw3q0JiNqZMvDrffKvdaDWV9yhvHbRESCIGpByxXfk8/ml4PtiLQdNeHtDHUTRw4Pe42F00SeVpa1XANsMY6q+om5r+2Ilq8dodcRtw2Ihgy8KAmqQ8fOZERdonSNJWG7XMTHTyA2h6Z0cN9TQR22j7sJ4+23mySTMwPJ3RV9R3xowLfP7lIZ2bic9IBP0xc2Mv/urn2e0AzcnMgOf3f3Y9lyiPLAY1wJmzdfZPyw7/d4ICc5MtxOypvgotYlG0xbf9eokyTR1TU4pEmrrN5yA9BLP5+XA/2az5g8GorgNaKeJWfEmcA3O2nuNseF+OXVOXCE3PhvHCFp0tZPQZfagNf/fT9Ep6NugcMpfXL/+Ik6Qdpfsj52rDxpdL71rlUtHAFpiSNt7oBHnwI3RGsMGhnk4sbB05I58EX5x9t8Gr+MrNxK/NZz1mhOCGO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CEHL18ITqfTiMoI4CKG1rgri9e1AFTQUYbDbhG7E60++jYpapLxXQYx3XZd9?=
 =?us-ascii?Q?MCznVedpZunYAfSbaRgkoUb73yScWsdL4H1eRRIpIsExBNLe95TSkrmP2J1b?=
 =?us-ascii?Q?oICbMHTF2k/ZwvOSEkniCv8PjBU5O36oFaV/gAl6he0FXS3Zu6YwiJ3LkOW8?=
 =?us-ascii?Q?xgnG6bVSe/Z3aLK1MTVUJef8qDS2T74ektSkebe0CObQ0wGgsYSxml0i7zc4?=
 =?us-ascii?Q?yjedEXuVQrP2GzUZRdpPso4+hmgZDRL/mI9joGkAnrpa6VX1/9kEd+qodsYk?=
 =?us-ascii?Q?GbcdRVyZgojz71pciGfJ/l5f6RfYJa0Qmw4U8gsDq463fSMetoKcVSl+TIHN?=
 =?us-ascii?Q?1Vx6fohectmJhZbH2uAEF3sudsjxCkw1e3tzC2OsGXYgN7TFei2ag1TGa4Kp?=
 =?us-ascii?Q?DWUQrTFDtKe8udZKdykxJTgc4N7dSfQvzPy4bziwymrL7kCt/OH9tHU9tsnt?=
 =?us-ascii?Q?g8mpOi+I4AX3KyHdR5ZnEpbtyn5/9tGQLLNzq2qQRETOIm6aAv4dDu61HMes?=
 =?us-ascii?Q?upbJbyhyIFaGjEx/WV3ogwlnNwdlROiYHrT5lEsn6ZdN+QRblN33q0gX+mC0?=
 =?us-ascii?Q?xBNZKKKIUuVl+UqCbhuyP2g5QEcESaJJR1/dcDwNoLX+7ibDJb5qVISdUOuO?=
 =?us-ascii?Q?fbYeVKIyouwZcfh21STIi6/9+UsT31t/TuMziC8vu9E/Sm+H1t8O+gu0DdPB?=
 =?us-ascii?Q?HnxYNAKvPFfxEHbyGgvI/d8S2lE/NQh+nemU/nm8gQnzlkuDPq3WCbGDZ5cs?=
 =?us-ascii?Q?mGwbVT3oadV1cUZY+iDTX73eigDbj/jlPuhZbBX6+r++HRigTx18cmqIDNbH?=
 =?us-ascii?Q?nC+pNz81DI37GaaoUS7/WjIFArSyMxQ3037CwBxwb20/SM/KB5e0ESCeL20/?=
 =?us-ascii?Q?uF7RLfG8teLf9iVDrr3v7JGqylF8sZQzSMR+SFt8AEzMRSF/JRrbmU1uBfCU?=
 =?us-ascii?Q?yUDUyQCb8riWYBWEMPXNq2jZvtxwU4ct+j78rssp+uGamoz/4Sw4qHbBRbEf?=
 =?us-ascii?Q?EDk4mKW195DeYYIoFQkG1Qv1tw1hvJ5CHGxIl75MLByodDb1YFnh1Km2ozHI?=
 =?us-ascii?Q?W6usCyJJwoSe/l7g2dRnMWSl8EfOc3yW7FtpmocE0HFPg4a6RhvRY/5ZRCyt?=
 =?us-ascii?Q?cmWyrcajzN6zDCtwUEiHp6bsWfRtKHii40tVyMUbL8RyuJIkmWpVTAPX9vPo?=
 =?us-ascii?Q?D6fnF/lT3g27kqXj7icZ/c9JxUSl7gaRnZHAj/9aU7CoNWqqvKbqSDkXfoAl?=
 =?us-ascii?Q?UEWXDdIincIB8k2JU1YjDLLSUXe8b1l8RRMHjFm3jzVcyaJwNnqrPo5gAET9?=
 =?us-ascii?Q?0G/q4Nf7RK0BAOudGdx5fJFG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf45345-0a4b-4831-9496-08d92c02a757
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:56.0021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggjL7DBchb/AvZMjqV0aUYpxnmQfg3FFJEPSsdZ6UAvR1S5pm0yFCTyzFViO9/3XopxojoS55Uk36mq6gygYfKVq2MPVQ7Nq6GxJGvC17JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


