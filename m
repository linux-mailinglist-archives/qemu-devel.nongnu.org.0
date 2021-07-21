Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8817D3D0C64
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:26:48 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69R9-0004TN-Db
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697W-0007Ir-81; Wed, 21 Jul 2021 06:06:30 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]:41470
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697T-00020J-VN; Wed, 21 Jul 2021 06:06:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPF2j7u1GbtxW0bzw6ecKnNH3kZcoLbwVJqxP5j4bWamtl7bw3nzBl7lQqhw830oVD/zpqGCHXa3r4wqofq5yvSnE+gmEyw6LR3OZKSKx1D9Xw+gc56pqwfImcpm82a2Vyf13ONJCJsyIlUUyb67kadyXr6DCrRouOXLW1mfPLneABDE5rNLL+EWwXIYRkfunqVWoTJ+OWAuEpxOhu4xXgilIAFk/ME+mSibPftwwaMcREJy/ski0jdiBriiDR+XEK/3gk/wxpAOl7MynfEkcJs1QAZJ/Bu66XC7JEIuf/z6Qrnh24Gi/kwIsCgRtfnTjaE0ISVD0jD7ek/A48ToNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrxJIBAyeR644JikwS22rP5r4fJ0r5GakJf8dTWZ3Y0=;
 b=fT6AC4NCn6P5wWYrL+3c5A9uOSN3klFAxGl6yPSbyHdokK5Kvk5azj7EB93kbRNmmXLMESCV31xLQCW1QD8soFQlXPB+70m9Uo97xnHxojRO1Ky1LiV0xObBp/U2QOYwo0iHg6/1f2p4gNlxciutmKmyrDGPXRpDIa/haCm9rAGc2xmiVj6t6OX6k/FNNXzNHAr4ta59J7Tu+Zb0H1HcOaW2dUVN8SlrgU3bO/CNvxlK9RpXvuUYSruSDXAZ7vkrtHqsc6zY9MlbI1YVYeD/wKy9n+egmPFY116au00DKdbz3ceIbj1K/Iw6GMSMd8sKdYa9H86k5fMGowKpHJRGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrxJIBAyeR644JikwS22rP5r4fJ0r5GakJf8dTWZ3Y0=;
 b=Rj28Av+ymt0cE3mchbKhuyMZuqWXSiwD2WR+GxbTc1/XBKahkyqE6dnKZ8wmcXX3/Cfd21FPiX7p3ioPFmYlQpuQzWKiob7ATTQmiD2OVwKM9V7wD8S9IiydqozHT/LoCvEZwLOBGO/h/Pi8N0ltkBSSzIDf0hm7yezRWlCFLII=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 10:06:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 09/33] block/backup: move cluster size calculation to
 block-copy
Date: Wed, 21 Jul 2021 13:05:31 +0300
Message-Id: <20210721100555.45594-10-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 191e1a06-3404-4c27-b7b5-08d94c2f312b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724CAEE40316018B1593271C1E39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjACMuDsedHQ7REThTI9tOWVHmK0OuR9DoFXIVEOiBmUHWMwNLCiMuu3Fm0Dy/90bJTVfMwnyNCxgWW2EdI8UxVSLbsAYmzVX4lVIT4FP6OrMyAvu+RdTEhQQ8ya0FO09sU1csashgx0kIt2pO2qLoEYa11mR9O0sKFmE3fm9CYImRnOLOxdnM+c5S99iVSdlZMHwXPTkQAeyNfn9NpFMxy5q1db2Tp1dMoysYbjRMTnfl8XH6vza9RDkCHqCnmSZGsY1iHSLCBY5hVnoTBgFNQTADgvMLq15EjAebWLcJejj8EbKjAUeVD4wa0Iu+vkfV76Qz9Rckh1CpIIFNOaaZqot2DHPg8BN76vqtBLPE7/fG+NDmncm4Wj3SI94C26SrCdh7G4JK+7irF9qDPCfZG+STbEfIodGAC+6NdSEs4R8OvrxXRXKjLy//tFwJ3MCOCOpGj0J7Qw92e4Vppou5GesDK96ExLN6UoKXJ/X7yjXec3+H/3w6Pdo90hR/IFECOe6Heyb39GH4UvWLf7Nj3vJCDJr1ZZTHuFEMzqCaIfwwyoc3oi54+YqZdH1ptlauzBgKaZKqX+ghLohLSiGLx9ltsO/N1ETx6xFNcqAqUjK4Z/5872Ij8X8lKy3Piouszc0TPPUAhVQJ056cmx6ZEDzxX9lzQ3og7kIRg6s2ksTgzBHBv93kJAUCGdKiA7qGng+JvX51KdDvzIXNOwhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(186003)(6486002)(6506007)(8676002)(52116002)(956004)(316002)(86362001)(2616005)(6512007)(83380400001)(5660300002)(478600001)(8936002)(38100700002)(66946007)(66556008)(6666004)(38350700002)(66476007)(2906002)(6916009)(26005)(7416002)(4326008)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9xAglhX77cVvPLWket/2BX8l6R+Oi2bnmFggvWWfhD3Z6WFqXHvQ/9dJPEE?=
 =?us-ascii?Q?+cr8qRpV38mrVTlaIMfu4SiEmbgQz0Ba6ziXARI8Udbfez+OmixztG9QKpqK?=
 =?us-ascii?Q?lRPfHlY9rsEel+eKzkLO6CZ1WPIYJrhY8Ge5zKo8ZfMYi9GKyAYz2wA3nxcZ?=
 =?us-ascii?Q?kwtF0+n6TVN2+bOSBQo+3I8HLam3EvbNhpcsIBryxIODjoQX9xx7QUtIkmXy?=
 =?us-ascii?Q?e69o3TyXJdwFJRf1WHs7TIbaFFgQAeoAkVsWEdGoG4NHYVUboEYWunR3zBpL?=
 =?us-ascii?Q?8EkD0Wl+aur/jR/12OB1sY6V0SfuvgZj1RUxplD1k1JutSAset7KfQ2NSNH1?=
 =?us-ascii?Q?I+GMi1bny0XUDXYA2Kwbsxiu2kgT+hzuc8qFSQ4uI8qzDtkbxmU2KB9bmD2S?=
 =?us-ascii?Q?IUDvIQyV63GeNvytik1S8SQJOq0y93YZ61/dw9xiwmCJtgZd4CKdTLQ8ZDkU?=
 =?us-ascii?Q?iCt1ORfm8fEblQlZPWmw3Q/iNgm/Caep5PZ9ISUvJt3CEG+fQ+i3hqU88w7+?=
 =?us-ascii?Q?Jzz29sFDUoxK3zNp6i/kK8X9H8akTPZwDMqJ4yx1BrOHaffhpNcOHppuz+4a?=
 =?us-ascii?Q?UOexvFbyI1ZTnonrOUL3joN1XGcYbH6o8YjcOHQoMzzCjxQ/nGrP8aOZShTe?=
 =?us-ascii?Q?MlgVJk4EjKSc8PwwRjNhuXrfXnCJkJAeow1q3TDRn9BTWlR2oV3pGTWf/vNJ?=
 =?us-ascii?Q?PvV51BFPm69s0RK9GM5I64lmfC8KgwgV34XLz5/+DoPA7ahnu29wUOyN8ClL?=
 =?us-ascii?Q?5mGuTGv/WgKoMSSix0Ir8lNYztAsnauNtpsk+DGz+6pUq6UVIfXDfxtUOY4W?=
 =?us-ascii?Q?xrR2to50pUHEYsUlMPWQsgE4bvRm0QLgvkr1vJ3rjOLjj3DYR5is15iLZTRg?=
 =?us-ascii?Q?fcHKa9uzg6mtgOaaoAzIei20T7bi7bFKVh/6qxRj3yDA9E+6W7dIuFJpB7n9?=
 =?us-ascii?Q?S+28akYYntwIR0WyZUAfM5m1kje7ramVjsxbSA2UpHwIWb4R6+/Y3CLPx8XV?=
 =?us-ascii?Q?lNpBohLEjk014YC4U4/PbSAclMcrYe+hdvlvLfRvY1hWvZvXObrbmiLKUO3I?=
 =?us-ascii?Q?HyFFODSBWi+IIrIdfYevTfYsb5xCtWx9LX1lNFUbgwokK+uFA1niql8XV3Gp?=
 =?us-ascii?Q?2Cd8A6T/Nx/z3G1ZZVCJ2TZtTpD5V7HAV0+AqbLY6oxvMHvDZBc67skcrL2S?=
 =?us-ascii?Q?eA8IowxzMJB0EhzCtRWiexzNEq7tOgMKB4EkwZbu7NdGKW3ojejQZxtCb+Xv?=
 =?us-ascii?Q?/0Nld/G/5jogEJta7VMziRI5/38u1C6JW6ViMbEtwpWqWizOcS42d1rhfZbV?=
 =?us-ascii?Q?pjuVRG+O6Tm+mox4Roq51WsN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e1a06-3404-4c27-b7b5-08d94c2f312b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:22.3212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPb2iRPph/QhDCkat08PPRwXKSGSbXQChIgn3kOUq8J9IhQgYXtiV4KffKz04ECfqcvKnjU8RmP5iBjw72WDW2XeyNHoYEzls3PzxM8GOfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
index f0ba7bc828..9c24e8f38e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,8 +25,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress);
@@ -90,6 +90,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
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
index 469f992c0e..40c4803033 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef enum {
     COPY_READ_WRITE_CLUSTER,
@@ -343,13 +344,56 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
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
@@ -966,6 +1010,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
     return s->copy_bitmap;
 }
 
+int64_t block_copy_cluster_size(BlockCopyState *s)
+{
+    return s->cluster_size;
+}
+
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
     qatomic_set(&s->skip_unallocated, skip);
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


