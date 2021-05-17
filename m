Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A523824F5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:03:38 +0200 (CEST)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXHt-0002Bb-G0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0K-00042M-L0; Mon, 17 May 2021 02:45:30 -0400
Received: from mail-eopbgr30113.outbound.protection.outlook.com
 ([40.107.3.113]:13457 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0G-0001tv-KE; Mon, 17 May 2021 02:45:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f13O7tKv9HjO/EESJA0bMYC0yMATe3gSWTTpEmHBRn6zJFQodRFVSMK8XIW6q7TDCFu3vBeLD5EPEjExYccEhUREO5LbM0S5+SCrts/sIYftS6qTVaQTaIqmR7+mgPJJpM8440eaqnW9reNulwS6lB4zBh5MbIf2J0APphLG35pDxFOXQ8lVCrknyT/vd/Uailu2oPLhoA4nXb5oVyMRJ4/h00bXzGUYBc6u1BmuWAi1s0oq2MuY04Lts0E4QI4/Es/4omKLO1rc36+ZXCQtIdXgZFnyqrdl4emKYn5D9TcRbmUvVwlOh6uy13xXQ5YHxJLDDstHMvc6pZGtD0RgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evgbeTfleSmHr5WcDRoN/G/ksB+mNOJ5jIOX0QZbVc8=;
 b=VkcL/wkf1yUDj0F65jeRyqX5syFbTwJE63EpRChc37JoiGY1YkImo0yIMeHS5fC5TiZqq2iwX+fh9N/noJvFZDC/SeNHOFeD2NbzbuA4U8pZ0+jostFdhc3rC/Bd1XbOvS9eGjc01wXpfPl57rv/8tF/xKhywobOMaOwUN3YAES2CoxjBK0cZT7GUDKDbRWBJnDUb9VvmcyJ0E0IsALBccTMpvwRPQo57Vn5usCSz8QicluUWAawWStc/oxJe0js8Fe4Pd5741z0sRUGW5rB7d0O3IBn7Id6kBSHBfugyI8je4tT3u/B1qbdhQZC9vM/gnIB3e4fgQa9bCUV/JHv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evgbeTfleSmHr5WcDRoN/G/ksB+mNOJ5jIOX0QZbVc8=;
 b=LGngjRXYs82iUpBu2NbHJDzEEaPt37rw99Q8gR5fgKki43uwS56RojurF3iP6847UTXlb/E3iEhijUdK77Bu7F34oHZFQLPx2XvS1wTYjpmr+zH1+MVgUHWwuWnIW+hntrAnLDImhq786Fgp5+avzj/pcQliNYVtJQzvxFe91pg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 09/21] block/backup: move cluster size calculation to
 block-copy
Date: Mon, 17 May 2021 09:44:16 +0300
Message-Id: <20210517064428.16223-11-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4de805b-9258-4fdb-294c-08d918ff4958
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338271BEDFC4375A2902A820C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FGIWCTJVbQekYYNexDBauCLkdz/s6FR85zkk16Pn3EkIs2ysro2xBz3m3Uee8V6NSA/W+Amom3/gTZ3yLO7ut+cg9+nJirBm7WPpCTPrniIu608egQhfhtvVox3XDQjOI6+kL48pyozHlP5jZcpuVnCwXNGgzY6ajrUlUVNCCpRhR6M1xfYbWoEEQwaL0/g9WUn/VZjASeGMtwJKq2ZfwpxnsJDfwdrzt3SFcejgCTpMRShbi+yg2CFz7Q68YBYyQmXKwC8eB3IzvvKSD4+l4xnsLHToueylB2O+tko3aZiYTRsa3pBatKk0AZ6jrI+3bDGACKTR7D1l9h24hKk24CISPZM07N9kWIGD6p4Zm0AiehY7MgQnasM1lyjLWdyGLAY08QIOZuWCW4bqDDt76RX2PUXEc1p8dHYdWyXG2hw5vTlZ7OflqAyrR3dj3V271an4iyu8zBOAKRpZdlTBr0aKUfm1KYk9pIWthHmHwje+QLd9NHq5iTXtTjNgEjAzhJR7mXrcVyrFaQV8Ascf7ADr2Uiskw/dmM1P1ppOX6732DXa2n/qiQvwwV5l1WYXMcMJLfRolm08pGQUND4feSU2mW8+juusODKNZWI6lx1KnSI3C0Dlu8T0Rm5tKRAiIUo5Pt4RSNPXQS95fsWDREsgjmcJAMHaTEN3+GG4gV2WDoWieuncx25PABulVJPf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vvVUyGpRMqek4EgMskbhYjE8y4RVHqBBEyQa2uWX+OjtXaRKy4XeaNYhkEL0?=
 =?us-ascii?Q?UmYQINfi3SyqZE/yL2+1QNtl3wlVlXuCFNa88nyor4BQN1vwmmpjPGCnYHOS?=
 =?us-ascii?Q?uftBkkPmSs1fIbcXU3JxTnIk113Zxb1GYEuWBNUIe+Xh4rBJTEKuQ9w2zgnQ?=
 =?us-ascii?Q?2exfjJysDZ9lyr8DYO2mCGSOdkuVfS31YGr44QlJN/dD1/5PKYgg4X8edDP+?=
 =?us-ascii?Q?GyURqNO/PwjI6u45kDN/9XvpXyZFV+2AndhNl6nVaTCbR6RUCLJ0uYN3RgQu?=
 =?us-ascii?Q?/t8FzFUbz/p95OWUe9YUo/Fn7SoblYkqw0TYcUoa5gAG7ypfAELn1GSVX4OF?=
 =?us-ascii?Q?Uwjo4KP2u9mJDh3RezEOElmDAeoRJ9q1gLCWflLkVuXqkoPqzpFu/9gzOIdW?=
 =?us-ascii?Q?hwtc0LwfD6k61OJy06vdnxrWUDHJzsbgVr25fNs/pv3F9l2lp0JMVvBPx9/w?=
 =?us-ascii?Q?0rffuYCzgK6cdyrGjU/6bpeWEY0cy3g5nGe9QGriKeRaF2voaWpVcQ6ncDTe?=
 =?us-ascii?Q?oLtxiRofcAFYvq3zZ9wMQ0qxebjjy/xI++maf7lxg4en9X+/V8B/OPH8m3Zo?=
 =?us-ascii?Q?026kTb5kFHsQqkVhv2S9niLhOEafWRu8M5+mws+qtr7Pc6PEF5CTwcbqIEcC?=
 =?us-ascii?Q?fDKztH6JoBnYxz5GLrOb1IMUK+s2Fv3wZl2++E0Zr72mho7u0hJkHbE9pKfs?=
 =?us-ascii?Q?gtQtk0Y4Dbu+MDcUBMnILBqzaS++3Vx8sjIz+TO7VLLNchjujXOETH2Mg1bq?=
 =?us-ascii?Q?IZitAC+rKXiobo55mxWut9GwKPSQITMMxRTr5/C6Cx90EeohMsoqHVD/P3IC?=
 =?us-ascii?Q?7J+wcoeL8JIr3gCzJMP3rwAFmg/SAfdcur3oATYrzfwT4S6V0hGSATdI6nI7?=
 =?us-ascii?Q?6DAtntdmoUErH0scZr8extS8GcIFr9s0SPaFXGdLOxvRHhmlskiXOAOL3IB5?=
 =?us-ascii?Q?zXjlyJipox3dj9Na3Gm5bRHWp0uKNZ9z5G9ItasEixMOp5w5BPyduQH/d0JR?=
 =?us-ascii?Q?kO+DFM1gQIWyJMQP4NxqhWmEIoBsQ77+TGzyhVlRoD1TJCapnzURY0gqqMn4?=
 =?us-ascii?Q?4T3X4o+Ph/Y49fKLBFnoGjsf8KyTJgzEPOkkP/isGfdSdOX0V+qXuM/vTLSc?=
 =?us-ascii?Q?WZE3GepdEHm9lF4BjD88g82c1LeNnNaYurVirIuDygrWb1Jp8N46z9nbBW5S?=
 =?us-ascii?Q?lIJEi+iI4ZtkAAmpDLRRvl1F3nD+LA5RoCSuiqNkDFomldaUo/MprChebS9L?=
 =?us-ascii?Q?J4qOgqxVl9piR1EzPOnk2iiNol7LsBqUgkcH4eOxAkFZlQueZ90y7Y+afc/K?=
 =?us-ascii?Q?M59I7WZnCCGyfIdSrkd9H1my?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4de805b-9258-4fdb-294c-08d918ff4958
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:57.7321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di8ysJvMzwqWtnOxQV2O/q4RmwVNRYX0MLrwFxx7tc7lFApa1aRzH4cVvPFVWqeZ8Mt8y2TtcldwVNSQzmqCXXK2ylhQhXl7fLhtqjtgGSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

The main consumer of cluster-size is block-copy. Let's calculate it
here instead of passing through backup-top.

We are going to publish copy-before-write filter soon, so it will be
created through options. But we don't want for now to make explicit
option for cluster-size, let's continue to calculate it automatically.
So, now is the time to get rid of cluster_size argument for
bdrv_cbw_append().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h  |  1 -
 include/block/block-copy.h |  5 ++--
 block/backup.c             | 58 ++++++--------------------------------
 block/block-copy.c         | 47 +++++++++++++++++++++++++++++-
 block/copy-before-write.c  | 10 +++----
 5 files changed, 62 insertions(+), 59 deletions(-)

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
index fe7a1f1e37..90cca1ca30 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -29,8 +29,6 @@
 
 #include "block/copy-before-write.h"
 
-#define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *cbw;
@@ -354,39 +352,6 @@ static const BlockJobDriver backup_job_driver = {
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
-    if (ret < 0 && ret != -ENOTSUP) {
-        error_setg_errno(errp, -ret, "Failed to get target info");
-        return ret;
-    } else if (ret == -ENOTSUP && !target_does_cow) {
-        /* Cluster size is not defined */
-        warn_report("The target block device doesn't provide "
-                    "information about the block size and it doesn't have a "
-                    "backing file. The default block size of %u bytes is "
-                    "used. If the actual block size of the target exceeds "
-                    "this default, the backup may be unusable",
-                    BACKUP_CLUSTER_SIZE_DEFAULT);
-        return BACKUP_CLUSTER_SIZE_DEFAULT;
-    } else if (ret == -ENOTSUP && target_does_cow) {
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
@@ -444,11 +409,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
@@ -460,13 +420,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
@@ -499,12 +452,19 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
index daa1a2bf9f..9020234c6e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -243,13 +244,52 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
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
+    if (ret < 0 && ret != -ENOTSUP) {
+        error_setg_errno(errp, -ret, "Failed to get target info");
+        return ret;
+    } else if (ret == -ENOTSUP && !target_does_cow) {
+        /* Cluster size is not defined */
+        warn_report("The target block device doesn't provide "
+                    "information about the block size and it doesn't have a "
+                    "backing file. The default block size of %u bytes is "
+                    "used. If the actual block size of the target exceeds "
+                    "this default, the backup may be unusable",
+                    BLOCK_COPY_CLUSTER_SIZE_DEFAULT);
+        return BLOCK_COPY_CLUSTER_SIZE_DEFAULT;
+    } else if (ret == -ENOTSUP && target_does_cow) {
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
@@ -843,6 +883,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
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
index 19472912d1..4776172f77 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -37,7 +37,6 @@
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    int64_t cluster_size;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -52,13 +51,14 @@ static coroutine_fn int cbw_cbw(BlockDriverState *bs, uint64_t offset,
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


