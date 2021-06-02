Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDC398A76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:29:54 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQwT-0007WH-8t
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfR-00019h-I2; Wed, 02 Jun 2021 09:12:17 -0400
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:46453 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfO-0003E1-3P; Wed, 02 Jun 2021 09:12:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hREY+7KIcJvUrvmVW81l8B7xpT+KRFHaDiSWiAD+oUP9ugK6h5lo3KEfdF96zB2bRC9OKp2r7m74u61n5fBnSp3/O+Oil7GSDxp+nXErc+D5N4MeUBSmm+iFk8tlgrmL10z7junXbRgF13lIjmHc/NPfQxUPH3tlXqqUVPZaRkUNPaHi6/Mk5xiSc5ZZ3x69jpoVY9lJINT9mMlUc9QAoi7/lSNQay1KLWoqnI/jQ3vtRRwfr91/oOt87QHkoF7HIrtpXW51IvKBFkZNZ12+B+wEscGIOb2zSmC7X70ZN0a/9UwDtunFk9hxZpWPEdPhadbn0o3GNrchjbH8woGajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snuZrJ4K7ugYjwrH9/gsziimm4n01+9FkrKglHOGwIA=;
 b=kQvO0sMq6EaOyq2xwiUP013+e4acxyY4LoKefOcWdLmIyKDU2DuZAHnYY9SlvWiL4xY6kwI35VEB+zx5w0EwzcUGh42zAV8Dswy1Nlm/dhdIwnLNuUDGq9RYX/67EaNS94BF2Pt+5mkmMK7yFeam+ydUQ34G5Zn4I9ZlORqvSxD7FHrk8we/Lbx5jFMahF58sG675zlm3NHDZiwZUzjxiHgoXDSnWAMP/C190lUKJ+jWHGD0DDIT6REIqv+0MGg+Ug9JrzHOt6E/vt1twlzb9RrSn7TsDUdLquhK9GSp5UANsNtGvhQJ+7i6/6i/0o6L/c7HgSQCz7xdQJmg0VC6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snuZrJ4K7ugYjwrH9/gsziimm4n01+9FkrKglHOGwIA=;
 b=rqR7+e6BsVk2kgFOzNiQK20tg8VfTXCfBGzIARpxX1ri6OysXs5iUe/8KQ1FDOoFkVG1sDxyNI0D37l6PIvnFSF1wCpgR4LmiwtlG7qUFCH3pZAJOsrNSFUddvbZWQU4TZ9D1+qoYdM1RbK6iZ7+DL/N6DrX0AR0EMM0QGTK+iM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 11/35] block/backup: move cluster size calculation to
 block-copy
Date: Wed,  2 Jun 2021 16:10:44 +0300
Message-Id: <20210602131108.74979-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d218c831-007e-4d6c-31cb-08d925c7f675
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376702CD0DAB285ACE908AAC13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCtx9oRSIvV9IqvqFvT0r3xEQYNJY3vlenaODTAqAE+e9UQvrQuC7ei43eUzRQmF4lfcf3zqoGwSn3qx6cJfaWFeSXmzcIA78sjT5wW4zilgUjN7k6g/2dhqqG/2C3AoS+nrJPUTkCGWZhC/Bb/39lxN/jWR/gfbDgA6JMIrMstiVvSUpeM8TZS655fMern7IcDqM4GtFGkcRIgERghA1GnNoBJMI4N9XazfZlFAnODl0C9kLFYFGLsVyE9osez2dY33R6ttpPEY5q3SJmecB4TJjHkurXbDi8O0mpWL3EdmT725oKZ6au6cA08HUE0EtqudIxNpEfbogAOsqckiYH7h2DjmASzpxGDIVGthB3PnQnRpqeXUGgypijTTvmYzQmUX9i1uc26VEzcuIWi0DSFHjCruHdPhTDRWPKllA+gJvmtcZJH7Lch0fRiOGBMKck1D9MwSVp/9+TxnOOVOCfSHzZMAreler9O29c13ek7fi20uz/dZoK1dMhljXOjP8zPErLysk65c6iK9YErdhapQ3KJKtkcf9RLTpxdJ2onov5nubmGDx5W7w22AlJE0xUXx+VPATcM04jer8i08P/zs7zZ+/pPVhenAaPlScKPr5m/DAbOzAqOo+PIwsS59SGe7IZUR6WBMkG4ACGjZSbpnVAAMhiYjRc5YoqMyWpm+xlSY939tQZkDrwqLgs75
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wKUCT2ks7c5aQL402Hk4+KLl9YmqHAzhKMjW4M8k2kZXq+JFBn/TMKRQVzjL?=
 =?us-ascii?Q?tMWb6iWGM6Mg4s4eK4T/KaW/KKPzeMmJEVf5WQ/mOSvUBohpuYgf6hY+tqLX?=
 =?us-ascii?Q?HFXz7K+uQjQJzFsmrCaOOtn2CpcTFqKcgVV96cv2JryuB+B/jnX4S2/LLA0+?=
 =?us-ascii?Q?gPT7ZpQg3CwWxGG0TK62eqI6vP5tQ0bX9Ptsxrn7hkP6SFDDKSFRczjOrXW5?=
 =?us-ascii?Q?oM6qMHEcf+kq/1a+V+FpyygFRwhugP23HvKJkjcliEC1THK/6lN8mGWnZiBG?=
 =?us-ascii?Q?qJtdCxR2TlEaNGWubI+ZSsEnFE0BY1n6ideIMBZxuGZwpLfdcbLPGvRFRPqw?=
 =?us-ascii?Q?Ody3Eb6hHNxXzMHi3LLZYmLNtg4qmCIi1bjCMBHCoEMJH1hzk7bZPUuPRLJP?=
 =?us-ascii?Q?BUYVoJ/KjhXg4I7HqIWBCAG0L5rHoPRUnbGCEa9Y0ChZ5kP43iD2eguGtEe4?=
 =?us-ascii?Q?dH+UN3T2jdc0EqWZpSasfOzg8nqnNjMtYfzqW62ldta8Km2WJT0DRmPDrSUg?=
 =?us-ascii?Q?WuS15fP0Ytmp6PMnQYLbF4u1t65pDAaP6pLxfaKpyL9sZcD///r0l66YPTUF?=
 =?us-ascii?Q?elgCbUOsWJzzmUSdLp7N/DfwArWitl5i7drKJvqXzUTkClOXVjowSiCse+cY?=
 =?us-ascii?Q?XQRoaFsZpQE9JbXTLxocs01bey43k9b1yTWrnTqPwufsDIHAwsMTPFuWCNJ9?=
 =?us-ascii?Q?VNEm9wlfJKv/avnoieRBIRlAAVLNkFJs5fZxOdtkMRYSk5WO6p68y15nmtMt?=
 =?us-ascii?Q?S8b6kQxaAwbLX/VtF39xZJ3hx6ieHSdru6ATL/kJ+EI7slHOWXMFwtihquf/?=
 =?us-ascii?Q?aJDvFNrjIgzM5rMr+4wNulnGB5H3XbricJYRxEVEDwQxfrT22xRAQJu90smm?=
 =?us-ascii?Q?hwTpyScbGIfMewxcdmHamCQQpatm7eAKTOiWrsCaU9W04XwJmL48Hl+gcCie?=
 =?us-ascii?Q?JTZAlPLPCFjHLgzmS8RbKLU3/yK5zSZ8syL6WCokRZ+fj5vldJtZx2dPjFHt?=
 =?us-ascii?Q?XRRJIm5MZgzi2hhfSOkYzjjH1U4+nweaiYVZS1//iOKE8WHpDgkTSAjxFZYO?=
 =?us-ascii?Q?up4kUbZOqTmouWw3UdyBdzqdZn9YTOK5Mj+rU3t+VtFfQXJWfoCL5Lk66GrS?=
 =?us-ascii?Q?94fYZF9kebJ6q6GJqvuC79PVyZXuybph0r2CCNPxCotlWCi9/OJpv4dW2Hdd?=
 =?us-ascii?Q?GF12P22b9rZuSdIJFONygEIJEMpp/yTCW7rIvzJuKC/CdIm2kqQdOp90lgA3?=
 =?us-ascii?Q?WTDuqobU7NcO7aSd9eXfv0GKp2Qln7/jR1eSw6vi2C47egV1Kr0aaVvDeVIN?=
 =?us-ascii?Q?eNp2JLHuPxhprCzbSlYy0LAK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d218c831-007e-4d6c-31cb-08d925c7f675
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:41.4724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8etGXnVUaIOE+UK+OZa3SoAgLWd+GFQDq1fGzqndAssOyTWsKPoBtuV5h201f6OtPK47vEvRK2YqZLoKQfY9MtnwB0bN4ehVTmkfHfWlgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.91;
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

The main consumer of cluster-size is block-copy. Let's calculate it
here instead of passing through backup-top.

We are going to publish copy-before-write filter soon, so it will be
created through options. But we don't want for now to make explicit
option for cluster-size, let's continue to calculate it automatically.
So, now is the time to get rid of cluster_size argument for
bdrv_cbw_append().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h  |  1 -
 include/block/block-copy.h |  5 +--
 block/backup.c             | 62 ++++++--------------------------------
 block/block-copy.c         | 51 ++++++++++++++++++++++++++++++-
 block/copy-before-write.c  | 10 +++---
 5 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 538aab8bdb..b386fd8f01 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  uint64_t cluster_size,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b74fb80067..e81cd952f7 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -23,8 +23,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress);
@@ -88,6 +88,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
 void block_copy_call_cancel(BlockCopyCallState *call_state);
 
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
+int64_t block_copy_cluster_size(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
 #endif /* BLOCK_COPY_H */
diff --git a/block/backup.c b/block/backup.c
index b31fd99ab3..83516297cb 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -29,8 +29,6 @@
 
 #include "block/copy-before-write.h"
 
-#define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *cbw;
@@ -354,43 +352,6 @@ static const BlockJobDriver backup_job_driver = {
     .set_speed = backup_set_speed,
 };
 
-static int64_t backup_calculate_cluster_size(BlockDriverState *target,
-                                             Error **errp)
-{
-    int ret;
-    BlockDriverInfo bdi;
-    bool target_does_cow = bdrv_backing_chain_next(target);
-
-    /*
-     * If there is no backing file on the target, we cannot rely on COW if our
-     * backup cluster size is smaller than the target cluster size. Even for
-     * targets with a backing file, try to avoid COW if possible.
-     */
-    ret = bdrv_get_info(target, &bdi);
-    if (ret == -ENOTSUP && !target_does_cow) {
-        /* Cluster size is not defined */
-        warn_report("The target block device doesn't provide "
-                    "information about the block size and it doesn't have a "
-                    "backing file. The default block size of %u bytes is "
-                    "used. If the actual block size of the target exceeds "
-                    "this default, the backup may be unusable",
-                    BACKUP_CLUSTER_SIZE_DEFAULT);
-        return BACKUP_CLUSTER_SIZE_DEFAULT;
-    } else if (ret < 0 && !target_does_cow) {
-        error_setg_errno(errp, -ret,
-            "Couldn't determine the cluster size of the target image, "
-            "which has no backing file");
-        error_append_hint(errp,
-            "Aborting, since this may create an unusable destination image\n");
-        return ret;
-    } else if (ret < 0 && target_does_cow) {
-        /* Not fatal; just trudge on ahead. */
-        return BACKUP_CLUSTER_SIZE_DEFAULT;
-    }
-
-    return MAX(BACKUP_CLUSTER_SIZE_DEFAULT, bdi.cluster_size);
-}
-
 BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *target, int64_t speed,
                   MirrorSyncMode sync_mode, BdrvDirtyBitmap *sync_bitmap,
@@ -448,11 +409,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    cluster_size = backup_calculate_cluster_size(target, errp);
-    if (cluster_size < 0) {
-        goto error;
-    }
-
     if (perf->max_workers < 1) {
         error_setg(errp, "max-workers must be greater than zero");
         return NULL;
@@ -464,13 +420,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
-    if (perf->max_chunk && perf->max_chunk < cluster_size) {
-        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
-                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
-        return NULL;
-    }
-
-
     if (sync_bitmap) {
         /* If we need to write to this bitmap, check that we can: */
         if (bitmap_mode != BITMAP_SYNC_MODE_NEVER &&
@@ -503,12 +452,19 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
 
+    cluster_size = block_copy_cluster_size(bcs);
+
+    if (perf->max_chunk && perf->max_chunk < cluster_size) {
+        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
+                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
+        goto error;
+    }
+
     /* job->len is fixed, so we can't allow resize */
     job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
diff --git a/block/block-copy.c b/block/block-copy.c
index 8baf8b9403..774f5029bb 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -276,13 +277,56 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
     }
 }
 
+static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
+                                                 Error **errp)
+{
+    int ret;
+    BlockDriverInfo bdi;
+    bool target_does_cow = bdrv_backing_chain_next(target);
+
+    /*
+     * If there is no backing file on the target, we cannot rely on COW if our
+     * backup cluster size is smaller than the target cluster size. Even for
+     * targets with a backing file, try to avoid COW if possible.
+     */
+    ret = bdrv_get_info(target, &bdi);
+    if (ret == -ENOTSUP && !target_does_cow) {
+        /* Cluster size is not defined */
+        warn_report("The target block device doesn't provide "
+                    "information about the block size and it doesn't have a "
+                    "backing file. The default block size of %u bytes is "
+                    "used. If the actual block size of the target exceeds "
+                    "this default, the backup may be unusable",
+                    BLOCK_COPY_CLUSTER_SIZE_DEFAULT);
+        return BLOCK_COPY_CLUSTER_SIZE_DEFAULT;
+    } else if (ret < 0 && !target_does_cow) {
+        error_setg_errno(errp, -ret,
+            "Couldn't determine the cluster size of the target image, "
+            "which has no backing file");
+        error_append_hint(errp,
+            "Aborting, since this may create an unusable destination image\n");
+        return ret;
+    } else if (ret < 0 && target_does_cow) {
+        /* Not fatal; just trudge on ahead. */
+        return BLOCK_COPY_CLUSTER_SIZE_DEFAULT;
+    }
+
+    return MAX(BLOCK_COPY_CLUSTER_SIZE_DEFAULT, bdi.cluster_size);
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
+                                     bool use_copy_range,
                                      bool compress, Error **errp)
 {
     BlockCopyState *s;
+    int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
 
+    cluster_size = block_copy_calculate_cluster_size(target->bs, errp);
+    if (cluster_size < 0) {
+        return NULL;
+    }
+
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
     if (!copy_bitmap) {
@@ -879,6 +923,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
     return s->copy_bitmap;
 }
 
+int64_t block_copy_cluster_size(BlockCopyState *s)
+{
+    return s->cluster_size;
+}
+
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     s->skip_unallocated = skip;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 235251a640..a7996d54db 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -37,7 +37,6 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    int64_t cluster_size;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -52,13 +51,14 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
+    int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
 
-    off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
-    end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
+    off = QEMU_ALIGN_DOWN(offset, cluster_size);
+    end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
     return block_copy(s->bcs, off, end - off, true);
 }
@@ -169,7 +169,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  uint64_t cluster_size,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -214,9 +213,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     appended = true;
 
-    state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, false, compress, errp);
+                                      false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


