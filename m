Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F2A39789A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:01:29 +0200 (CEST)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7lg-0007h0-71
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bk-00029V-Hq; Tue, 01 Jun 2021 12:51:12 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bh-0002O8-3A; Tue, 01 Jun 2021 12:51:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF35ZCl4QlSx4y6S93BKezEDMiop9d1WX+elRGMrZrTzIIXQrclb6SY6+ZRR//RYlp9Vgxiv21xm7eDAbSM3h8rcukQVSXtyRGyvbCpCEUGqggzsPS40EhqTmEkLhODo1tDB0G3gi2ikPGEIyqu7Rwb9/W3BpIjBP7KFAwBTl0Illv6uLiJLT8a/DJnHtX4Pz2gqFvieiO11s5VAfBsDaPlaMQDOHwuIlZz8teg1qyeuUdahYgGdVLs8qwA/bCEzGcXFzjUt4lTbP0UhQXZ7DCAtn/xc8Da4NdxedC4fmiIwWfGyIHbbtbwYtFwkqswZt4n9jLbUAg9x2Dq02ix4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfq5NcFoX6N4SUh0tZnCpQys7llmZWyHySQP7rjyac8=;
 b=l3C7C0a13qCbmf48Hx1eBmyc+16wYYhTvErS65YCgyhaUbSbeslAwxP7UGteMacYONevlrEH1w05ES20P5Cdxc0QkCEH6YfacirwHJ9DaIeMOU65qG7Uf9Ys4njhCnq84oxKCZmcdMCwR+fE9hjlPdS/klX7HOi50Xa+x/uedcx+/ioWI18ayXAnqMhyIKRrceVt/uPUkzJd7Ux1x/Qi6dzkCoJkiBmCtNZuZ0zZE/bJKr3w1YP58HEVjUcCNs2NSxUYfzjoiR9WZAvZU7JJusIv7rwNaXHE/NqfN/lhJwcN7SY8zEubRyCgsk4ZLNAd4fMBJFeBBdesLwulbFh+vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfq5NcFoX6N4SUh0tZnCpQys7llmZWyHySQP7rjyac8=;
 b=Zmqd17xgfIcbpiHQ0L7SirCQ9NmLf2/1QYK5qARWSqKAuDku8qJ3vQ84NnC/e00Y5/CH4lC1DQ1mGACVXxT+DC0XZ8Pt9QnU3l9U1Pjlt4RGYnvdgJQ7kplzf7JJCabINDiWtMddU+q9WOwo50GnHsgdNTEKH9MKLP1lLj9JQq0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:50:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 11/35] block/backup: move cluster size calculation to
 block-copy
Date: Tue,  1 Jun 2021 19:50:02 +0300
Message-Id: <20210601165026.326877-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02e5ff38-cde5-48fc-1283-08d9251d6dd2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972FCB6B0F6F41CE4245CC0C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2Gh4QEsPzIKvvbU7jEEJcZT9CDDpu9SwU7hbcvjEwAhY7POwnama0Tky7KnnGotVGlFib7P66QQnI1l114+uEARjMvQvNmEs4cM0RSAK4OtGdqUiwlB0Ylz3s/z8jtvURLk0COqFUY4RFOg9Spv/IuzDbzeMFnHJ0m6VqoDbTi7mNFGZmQ/TIfmKHdNcrHFK8mJWZTMndsauQrbccJwB4GyfblWT5AxgZ+piWsBek7EntyBNRbkUnjDhk2AY0GVv4gECCMr4Lnotenh0qgOR8cJb605V4+Mmsc9qg7ta2wgvbVR/19l2zwstjozvpbf9rfZ+hyDe6Gwev+Uc3kdaeu1li1yoDJG1m6vAe3RsgkItcdf67PnjbSJ1t8AuYU8W3JoyT4zkVVzG4B+0mix3tlRj0x2ynccUQeCBQ2H1I+SERZAMPpcDdI00IYa2O5q5L2Fps1luoIPFYZ5OY7z74xwGcBBo2CTp1lAgLuDWCnKYFg4kHLmrJ8sAplQKh7Qe5tAjUVrta3krnNodLAI81hfMinq6xJXHUE2C3WuuUj8U8efHsyPhDwT7mm9+3Ou2NfS0nA7k4KxFHWmbkiNahj98YXQ30mfMYfxoAjH/Y0cKYG0b9F9f7DPaX87ekS5KJJSTmD5ioqg/ZX8KcNxLUKXrEDFtIqDmV4SgmpulA0ypcgc2aKIXjBzuywkdEy5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s/IAMlnMIGQi0zrwVASaKDyp8Kg5wFyDA0Gpv/cL/Bh3Od5mhjFa4XMRK4Fn?=
 =?us-ascii?Q?VTB9jW6F9UiB0wYWiVRdCX8cgfVL91xDpbRMtoc3m7RlV3gX/J2cCHwAH+RU?=
 =?us-ascii?Q?SrmJeaj5L1O8tkEBsdez1/IgCf5L60+UBjUDabHCVLkFhT2H3ldnEYr4pa4+?=
 =?us-ascii?Q?feBEl9ZA0Et/SWvbrBNk9hogRF2yyTMSgEPC0HScYK9TD4TWS6OHrL2gGE+n?=
 =?us-ascii?Q?zShz7sM/q+/W5LzAclm0E9GAZ/QA65pbYaHTCGiQLPoEWh9jQ4I9XC4GK/Fd?=
 =?us-ascii?Q?eGwCwsJ1J16aBJiiOJZXzPcfXNmL9FK/QPKg+Bj1DKvpwYDE9YmyRDY8fcZF?=
 =?us-ascii?Q?Jo0s0OpX3qtj5uhc0gki0YdfL9xlHnncwS0Oi28QGp+itYJ1jFr4cVInHtBm?=
 =?us-ascii?Q?33rQxs4Rqxh7ew/so2a8ub7N7d1mAp1RS5pjRgallFB1vIN8F2zdfoLmYgwa?=
 =?us-ascii?Q?TkK/s0LwAZ/TUjbvIFWBUqS8XrvfS5kcEy9W5fop1bWZd/Zo2XsPT/ROzV6Y?=
 =?us-ascii?Q?6I/mEGGgdOpx/yG+JdOr0oqqHaxtVn7/uXaqc3gL8hQv9P3kI4ejKgBBbDLi?=
 =?us-ascii?Q?QfC1mBK0Hk4mi4uOPqIy5gRrFcBxXCX+KNAw017hpSwAP6nSKCCx4/yZF4wL?=
 =?us-ascii?Q?8U4/T9ltYi2JhqJB2HLwIsAjB9xFDhFxTCbXFybL9Vers+2Do/qjGLHymPF6?=
 =?us-ascii?Q?iZBSpMHkGr9YPC3aGjEjZ0Goz+y5wDjrZ4sQjD6MAm3fkDptqeJO6tyJJZh8?=
 =?us-ascii?Q?R1Jpgw8XjsiOxUt83naDg8YWjGdNNb16MHBZfWpAvwSJyI9cUB8GhxkssWT+?=
 =?us-ascii?Q?4ZJMh8uExULLZMhZoPOq/ZAK8s+G6iAgOjvMOVaYskVC3MhrFhH1yweYXHeQ?=
 =?us-ascii?Q?zT9aiGhokCfz2uf+xQLpUDbcuIDZ6HUJY0KupgrMKLlj/FU9w50k7PBsW+ka?=
 =?us-ascii?Q?4W8pvmOZ0/rQDuVqma9vwf7IVehMCn9hoc655OA3Z8cuBnYlq7WwanLN/h9v?=
 =?us-ascii?Q?XcjhmcsorgYiw6lDegsh6xTEaPFAtJTi9QiA4MvDs7Oo53t1Y7PcSRxBwiAj?=
 =?us-ascii?Q?PviFJaBNxqtsKA6xbnlFFfTaVwe7TE6lbuMSedzQf2KyXqFa0bC5UeCm28EF?=
 =?us-ascii?Q?xJIyYe68TF2rT73ogeLljqi6ySP+XolAVXzk9DS2J+RWx/+1FNS7H59Sb+lx?=
 =?us-ascii?Q?uZSpdyyS8PEcIS6FrV5K5GgtQmzYqHk9PX/YUdz7OdXP2eYTdusiJOBexgOE?=
 =?us-ascii?Q?seOWwMI/+Re/zkjvGvw04lsazx79BoCH0x8maXmgSkZUJJ7VACh4N0MXSLVE?=
 =?us-ascii?Q?de3aosju0hehfGmxCthJZdSF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e5ff38-cde5-48fc-1283-08d9251d6dd2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:57.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAgwpaPrgqkLGgZJA4xSNFzyvFeh7gT9SAhP/KmT13b0LLDmyAkFbislGmsZl57FHbBdDZ0gXAsfMy90pKoPPm0VR7xQIXTdepg1x/QZ3ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
index 4922e1654b..649dde448a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -27,6 +27,7 @@
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
+#define BLOCK_COPY_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
@@ -274,13 +275,56 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
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
@@ -851,6 +895,11 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
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


