Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42B38B1AD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:25:48 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjcR-0001jn-40
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZe-0005ln-D7; Thu, 20 May 2021 10:22:54 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZV-0005ik-Ne; Thu, 20 May 2021 10:22:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThCfbzf6wlAoVFG1ADQs87SX+Qa12tgqKgDXTEemoBOnqGsAeboygsLPSjzAskE7J5153TwGSLkyL4MZZp1yHfVUKnS/SXKQdBYWtVH1cq6p2afW8NQP0lTBm+UkALBa6GoB3XXZVwZFrlPnf0OrkRAKCXqoJYkGv4Ytj1g1AAnCYzWdEfJd9LshpSUWyuCo1USGDF9bwU+05OvyAZT0fihf9TwAtBr8P/QRwDaKw2WePU8LJrh8sZBDbtOGCOPDEgngCfp+IRr0yTxqqFafSymtDEeD2qeWKpeBFrREvjwHs7HS4V2d8pgNzCJ0kv/pjfjCeJ7KOt1fvMWS0fLRtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag6HkjN4ZORgbMSu/sVXWoLoxMRBtbVFZ1425eoP0wY=;
 b=BkKwWxg0uBd+R9Qp5oTEecFy3vSX/AZcAO5o3No+0OVMpTpPguzE24gnAFVlWf9ArXTxTCp8+GcnCj/EliaMA+DjR/bZhskdXeKLuhqlqadTPY8OA7rvDLVB+R/jbsXh6O35mZyj7xwcE9HvXJyjG2BjQDCR8Zt2W2x04utfjrUTvP7sCGl1SJ65P+QB9QrGVj31bdcW8nAX1iag5mE1Z1LIqj+s4XV/Es1Q3pO+OQPPgWUTioE8P3n1ty5GCk6JeFTh+sgkcJjmQk+gsB/SgYoxyRQDhkNivOxHzON8LU1gWOLw79QBkaZueFc/Bxiyj86LBxygHNCUVy0viKpsJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag6HkjN4ZORgbMSu/sVXWoLoxMRBtbVFZ1425eoP0wY=;
 b=YQzv2cjfgqCx6AZVI641FDnTo9T3p+xzYDgpqAPxyndE9kBzXZhrXcBOs13iLy77e3BCg/Y0UDIc/NI9boboEyIpkY353zdwzIYrKDVl2WBWVls6hzz0nkVlOwYKokXamVegDJAPoRAB7Vr7Hn72+fJJHA6oXN9TGoza1GliU5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 10/33] block/backup: move cluster size calculation to
 block-copy
Date: Thu, 20 May 2021 17:21:42 +0300
Message-Id: <20210520142205.607501-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdb14322-c59d-4efe-c1c2-08d91b9ab76f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544B5C8BDFE543C939CD8F7C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Fl5TZVf7HUT+5GRt7Qdi91uvaCgmEnWxA3UdYeOrrGVzyb9LtnrK5DLhfWoC6f0MvYZMgcBr+Nde+02w6+CUpr7H5HAo/g21zf9k20PgqSHj+Jx31tvi66IDcpMFmS+afrKrOGWKgpzWAaL7RkzZgosRxOMcG4xyJwnIAju28DbdMSlGIEGY6l8Res+wS3G0VaVrY8cU95pgWscAEYgjT/w/FrjEIx11axe6de0lRn3EcLZtCcroIZYI4Jt8rhy0guYi/maqS+j1NS+7wotz90NMAfyHK0jY/Q8Qk241wJcsrlQi2ZRhwsN2V85LfsHWA41j4zVwesZTMGG4A9Myk70l2Rhg75ySRuPtyngOqytWKUCVtYVUB3+MLWvc/yYomLbUnzqtBiRybJz+9ev7yOYAuPYn8YMBZOYfj82hOBjpi4eGamiotWXPzmB5FoxO9vlTUAo3NkMb5RQgnMb5YWimjqi1cATTXW5W/9wB97hS3jBrqa7pgJc3pC4RR40r6QAIJmhWqzdAvCY5auqbFg5gVYGmkYorP3bvtjSB1i8JhIHXKi/+RRJaEO3V4IdV74GN3OdWO3/CajCQsK5jbxEepnGGWpwMsI7fQtCP7tBR7gVptTX6TBt5T/0EoLabCID8sbFuFP9ERsrWzyVP5rmumTgQEQDGr8tx25j5e2TVFwB60RlSYoSBx4WpYSg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ROIoQS+Wt02CQSyJucB4sUGHNuTZjcSLbkpuSIJBizLP3jTbQ69uxWOGDGsv?=
 =?us-ascii?Q?Gf2QRAHS3ld5Sn4jW1bD+vlmG7D4lwj5hTXaWylny/fBflWOr4thI+wd3N/X?=
 =?us-ascii?Q?d+YOejDwtVTDA0AYYuTjV/vqk2uWQspNQjcuzGheCmtWHeH84WuH0aw2Wn/C?=
 =?us-ascii?Q?KZcDWpk8gxmUgrYsfLaMhqeJXCs4vn5n3wCZDEnTfeEldxe6YJwC0SsAo+4f?=
 =?us-ascii?Q?ruB2eBPixvfuAx3jZSDBPev1+gnKYV4u7kIDH3iGcLQlLJljxROMfkNKbn6r?=
 =?us-ascii?Q?WfeRmK9cF0BXc8OP9xes6Jvo5881twZ7u83Av/OKN5t6WC4BDUCjcxYa6Kdy?=
 =?us-ascii?Q?EBXvyRfv8QuRfA7/4eBME+ZaNGnIX6slZ8CTNHHYjrC/u05GFkRUyG3aozv4?=
 =?us-ascii?Q?WjtZi5ep+Hem+JkuIaFKppgakBczZhk7QDKVWKFDI122Ag/0cJQBlWFrvFQK?=
 =?us-ascii?Q?E+IHBbtpiYJRV3ygi5TsJyGrBg7KvNjsnuocqJEuuQ86XeRabJ2qDRDEMomY?=
 =?us-ascii?Q?5CLSEKZjRoIlQy5+Dl6ByHpw5euJvDCPs38eY5mFnARD0cHSAVKhlJDhbzPv?=
 =?us-ascii?Q?5SkDnApFVunxDfB8TlTFFWTo9YAWDKSIcP/3NlU8RjYmcZoJKIdKOYLkizqF?=
 =?us-ascii?Q?4DQttwRJq5ei/A4iUCw1FFAQaKHXb1QqXN821FHOkcb2WxmIe7ppDjVlpnXu?=
 =?us-ascii?Q?kA2T5kItp1C3UuWMDz47dH7/ejRvYQE/OcwpJi6bf05lN6a4G4KznnLgiSMj?=
 =?us-ascii?Q?LBIU8C8TeY8w6nkQpmC9dXVCzPwyD76I/Tc+Tb+QSXdo25/p5T7tKU7iX8qI?=
 =?us-ascii?Q?UODQAowXOTMxyER0wI/ME1UqRgE3Y0Sz+NhfSGgHQz2Hke04DoPFP/+YjYTx?=
 =?us-ascii?Q?TZzaAzh985VZ0qELndIBsIq+KmgBTOoFGV8Kr9Z87PfnRo16zAl0IkRc4AH4?=
 =?us-ascii?Q?36uW2/SovaRFERFux50ug/ZVP75xogmIu256NTfFtdZ/n6bB7xJ2eTchfuAj?=
 =?us-ascii?Q?rhEKAUzGgPwi8Wv1Td87eMpzG8F/68UDdOS1aSUgOLZDpxGZyT0zxSsL48me?=
 =?us-ascii?Q?U4Pbz5jGbHSzVtcoPsMlk+bDpCXP4PwfCOv3tN+Y7XSYi8G3EKUWIdEvnkyA?=
 =?us-ascii?Q?QKtplxMcsYeLc1x33eSbCcutGSYXUtGTyADGoiqcWSaDY+7wtjoII7QBpbYc?=
 =?us-ascii?Q?g+YG9Bfq4vxfxYxWKlcH1pzRtfMOTFwL6AvuDGoqAbHATvY2DIO+PRIO+YvS?=
 =?us-ascii?Q?7GyWQgliiR/GH2UQvCI393N843TiWxK0Fcfa/7imHaUUPxFSlYKjANBHU5/a?=
 =?us-ascii?Q?S+bMPzLMj2Tyb7JsFjkq75GU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb14322-c59d-4efe-c1c2-08d91b9ab76f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:36.7637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/K/wigVNioD/nnxN/nZxoYin5iBjqvP3/SB51cke4xj8MTt/cTWTriiGx7mV6pg2R6Q9wgum5jqDrz+r/rRF6ZxHm9uv3vN6a/wS6+dzcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
index c013a20e1e..8138686eb4 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -23,8 +23,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp);
+                                     bool use_copy_range, bool compress,
+                                     Error **errp);
 
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
@@ -86,6 +86,7 @@ void block_copy_kick(BlockCopyCallState *call_state);
 void block_copy_call_cancel(BlockCopyCallState *call_state);
 
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
+int64_t block_copy_cluster_size(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
 #endif /* BLOCK_COPY_H */
diff --git a/block/backup.c b/block/backup.c
index 29db3a0ef6..af17149f22 100644
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
-                          cluster_size, compress, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, compress, &bcs, errp);
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
index daa1a2bf9f..9389c7c6c8 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -243,13 +244,56 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
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
@@ -843,6 +887,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
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


