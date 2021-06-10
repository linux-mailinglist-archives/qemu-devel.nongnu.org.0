Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F13A2A42
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:34:05 +0200 (CEST)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIwm-0006TQ-Os
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpq-0003TE-OO; Thu, 10 Jun 2021 07:26:54 -0400
Received: from mail-vi1eur05on2122.outbound.protection.outlook.com
 ([40.107.21.122]:49376 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpo-0004NZ-Du; Thu, 10 Jun 2021 07:26:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+1Tb0d9UXERdB90ypAJctoLas73pKUNp6iDB4dNFGX+OsnBIgzu7nWeGh0h6Ftqt9LnYIasZC0EGrcf83c/a6VhbG1pkPIBuJYFsdHb1KSjPwNJhqPUe3tX3hL8H38dxpTL+yQEzGUUUX5LGN0w1gJTPsBIKEY28O1m37vxqJafORURJ2jzdz+lEVmo45++EEfdb2cdUoNcn5o1bD5hzFxaNkquv2ZeeJuDTeXeM9KHM5Hgkjc8T6sZAIllDJLEYDcC89AEh9WDCzRRjN9R7+hfUxnCHZkhfJvEWa5ynmWdrnkBB7q3Z4dOccKIbhIeH/Xquz/eXhXhsS6vGOW7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHoTvnykitucvYJIcFD+cBcXCIaLWhU7kSNlyjEqdr4=;
 b=OH6asy1FosZrjVB0s0zLS5lTkuLSr1N5pihpAwhWw3LuIE3wH8ovfSn0Xbnh8s1jx3z/5PTWn0Uvgw8no3MOUCu9etKyttxdGYWQXe/EP1VbaimhNG+zc2TkGHM4kFdR+pW+JkLJ2+yTA5fXebymR+Z9Bj5GJsIjb0N4jBusrh7whR1R/0rJAApnPZiwWAlu2L8nack9IV+dKbMW8MIaRGTdNyh5XBx7J2MRIRKz10qLpCadKqXoG8vEfpgKXuMJqMrzayZ48Mhaz9vvyPxomx1XA4UJ/UYfuLSNABZxzNO34LUhoow+/SqA0BrDdmKVDhj6EflF17XghlxaMDpoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHoTvnykitucvYJIcFD+cBcXCIaLWhU7kSNlyjEqdr4=;
 b=rOykTMde4aKibM8jgBnQXycs0wZPTmre4kn1qQcm6bjG+TEpDs+6zVl2ZjlRO55Qc4xmCKoQpXZM+bIudjsw0w2zPBfw+B+KOj1SCD+mfHgzEm7JvlHMMLLm4pftRMZ6OD6CrCxGdLilNrrmN3Q7zdIM60f8SWtInHtbSaJhKq4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:26:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 08/35] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Thu, 10 Jun 2021 14:25:51 +0300
Message-Id: <20210610112618.127378-9-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cfad9c9-d47e-437a-45be-08d92c029f5a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62801BC06E37527919F65E4BC1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2niSGdG066nfdT490nGzyNBCW0ad1uVoFdOSnFTQTh6EYZ/Ub6SD3W1dlPMa0dCcyZJwPqNXqdfh3oThPPRjWWOSEfi2hPEIepmFVKSrORS17TPE57S3em2RazHjNFL4bfAEKDm9eJ+VJdFUI7GdmHANnfZTwErnfba8vojx6EOOv270Ew6rOZ2+FJmt53dU/zAb6O4kzwqWpvFWTAECORnXrtrdFIFL8A5N+b7TRnXamvl/ecB8eVlGBQOX+sea7a+ugRwqrybggk52OwQmIIqBcrxyQR6qs5PgCk2JBFLAuz9OuHMz1TwPwMp1/jctyV1FFQNAXhQd0h002ETvVVFyaxgacZdjfnhE5wivsNeOiy0GBMVFUyXAbUiN+AC2f+xVJj/CCwFUNEUdaRDQ/eVYOIGF9pgszGpCmm3HA37RR0LW8M4so9NUFAVMHAAs9j6pYNJSitq8hYmN8dLD+Q7iAbWvRvXzC0slkJ+P2p0tOMLLcwSPK3TB37YtanUvdiQ+jI4VPqfhyu+RBBI85yaxwHxHkAVigFWE3g2YEabogvUUhJgDriiOnnIfJnYfDFvmYP+f/6E35UvRISz6J1IKipzyDHltaUMFSWtCi3qfqTS+LBGGE4fnIgf5rNEPsogYDlkkhbFB9tMjGWk5GVjm4TNCEPuaUQCLj8LFgxa0APouzUq0nhXG/0MtNoN6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F+5rH7UDvBKe9XcE6Eq84zMz8IR3FMntfToKfiSObTSKSvhZVnjCo+dgjXeb?=
 =?us-ascii?Q?b3ma9NhMboc8Aw7662NGdNlBAtW3mEzCDtFBSCzz8qSGcZ4wN1ThYfTRbCCe?=
 =?us-ascii?Q?8FcXHM5bAH57uPilHsnll4fz2my3fiGO9Mx3mebZr6MMNOz7zOZXISTJyBqK?=
 =?us-ascii?Q?QmXC5fA4Q2nxkkCZLui9FxZyNHzVtHy6ZhX/8nHBOsKfHfGAcMyAPXJkv4i2?=
 =?us-ascii?Q?25b2UfFm+z5K0xREDkgzPmeWiceKjgkuyv+jnCgCMPbvu0i9V3QEf6K37F8B?=
 =?us-ascii?Q?alfINbIWyxoFPZa/9yzquUTtcHMbz77zjxcP77K3muvDZ1HMaQaHbIw0l0y2?=
 =?us-ascii?Q?6SPzhVPeNCCsGlIudB/b154jAPlkIv2YHEfTFOYRo11tsobu+fLKzyoKHOcw?=
 =?us-ascii?Q?Jo3+vAdZahmeVCrkmpmdS0603CM52KVIjhZRlSLT5vnyN9FPGmBpj+XAk4BP?=
 =?us-ascii?Q?rCbJzSRHLVfhBQRnRFdviCrZvu3ycilf8XIEgiztu6vPTY39A2n1BP/hFcy1?=
 =?us-ascii?Q?6rM7VUJW2mdMjgxmn99K8SwBg96OBZsodMH4V9zC1jdhAXMeVU6o8s608Pye?=
 =?us-ascii?Q?5gTLmOTDSeF4rJbj4zZgjpEeQhR1p8cQKrqzNe/mHO43ar7QURQ0c/y11r3k?=
 =?us-ascii?Q?I4XMIhSJXQ+CGkaK4pT4M/trUR7r223cghGnY8q6fjnLUyOn34574O9sOdmc?=
 =?us-ascii?Q?Gm7OBHfWYmX+y2UJ7keXePs41xIRw9z+MRYCcq4cmdI+tBtEKoR1ngqYWfXd?=
 =?us-ascii?Q?wflviHMLT7AiM+8aWWl9ksxdhntBEcvhozEWMJ1ftminmg6FHFt2zqFG9xK5?=
 =?us-ascii?Q?qIiLrBmpEW50Ai4kyf8hRjxV5uxWUeLH0twe0WghestwoNoTiZ5b3dpADMz1?=
 =?us-ascii?Q?5/C3D7KHUD4RyqU1gXMzSa/5sxb4bJ8Bk8Hpa+y9Jf5WUtQwyELJdMXiZdwu?=
 =?us-ascii?Q?LBIeF7OqGWfVqndSBSqMEUhU5aHXNRGekHI7sXmnYjuKCXW8OwOc3HbP7F+6?=
 =?us-ascii?Q?pu3JlYfgHw9shUQCzpG4tK1+op/fT75YpIhdQJP3H2YYbZrCx3IUdZHhHvLw?=
 =?us-ascii?Q?kBR7gwQ1sf0+9R4NXXeUv3ExxZNQNpNLKV48eK6IFeaol/9lb1y/QFrtn5ep?=
 =?us-ascii?Q?XrQ2we44n5uFG9kcAtSe0Oo0lM+FYpK+Uyon4xFVpY3pxUhfNW8ZUG/xY1rz?=
 =?us-ascii?Q?WJY3EuJ9bVg23wTJpKrwobkyaxjR2v4W+r512nxTEj2fDJMCaXa8ecm54gpX?=
 =?us-ascii?Q?1C1g7oWrZNekdRkSgaS8cpVfn7ZqhH6O7DIkcBgLIXkcAJ+3MM/Hat+rfjn0?=
 =?us-ascii?Q?iaaud6tbULqc8l+vWNoetEQB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfad9c9-d47e-437a-45be-08d92c029f5a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:42.6199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xa7YLmWUf64XTdSuEGeUWGJjMFf8vjgpToYjrT1/zsuYORHAbEXMkLzrJAKm+suQ3KoZH2IBH+5ZISUgz5hF08ctXAWOer6Zlze2m04fQeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

It won't hurt in common case, so let's not bother with detecting image
fleecing.

Also, we want to simplify initialization interface of copy-before-write
filter as we are going to make it public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h  |  2 +-
 include/block/block-copy.h |  3 +--
 block/backup.c             | 21 +--------------------
 block/block-copy.c         | 29 ++++++++++++++++++++++++++---
 block/copy-before-write.c  |  4 ++--
 5 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 5977b7aa31..f37e2249ae 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -34,7 +34,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 338f2ea7fd..c013a20e1e 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -24,8 +24,7 @@ typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags,
-                                     Error **errp);
+                                     bool compress, Error **errp);
 
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
diff --git a/block/backup.c b/block/backup.c
index ac91821b08..84f9a5f02c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,7 +407,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t len, target_len;
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
-    BdrvRequestFlags write_flags;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
@@ -504,26 +503,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    /*
-     * If source is in backing chain of target assume that target is going to be
-     * used for "image fleecing", i.e. it should represent a kind of snapshot of
-     * source at backup-start point in time. And target is going to be read by
-     * somebody (for example, used as NBD export) during backup job.
-     *
-     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
-     * intersection of backup writes and third party reads from target,
-     * otherwise reading from target we may occasionally read already updated by
-     * guest data.
-     *
-     * For more information see commit f8d59dfb40bb and test
-     * tests/qemu-iotests/222
-     */
-    write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
-                  (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
-
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                                        cluster_size, perf,
-                                        write_flags, &bcs, errp);
+                          cluster_size, perf, compress, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/block-copy.c b/block/block-copy.c
index 5808cfe657..22a7c64c10 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -247,7 +247,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
@@ -259,6 +259,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
 
+    /*
+     * Why we always set BDRV_REQ_SERIALISING write flag:
+     *
+     * Assume source is in backing chain of target assume that target is going
+     * to be used for "image fleecing", i.e. it should represent a kind of
+     * snapshot of source at backup-start point in time. And target is going to
+     * be read by somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already updated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
+     *
+     * Other cases? The only known reasonable case is "just copy to target, and
+     * target is not used for something else". In this case BDRV_REQ_SERIALISING
+     * change nothing, so let's not bother with detecting the "image fleecing"
+     * case and enabling BDRV_REQ_SERIALISING only for it.
+     */
+
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
         .source = source,
@@ -266,7 +288,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = BDRV_REQ_SERIALISING |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
@@ -279,7 +302,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
-    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+    } else if (compress) {
         /* Compression supports only cluster-size writes and no copy-range. */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 0dc5a107cf..4337076c1c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -171,7 +171,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
                                   BackupPerf *perf,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -218,7 +218,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
-                                      write_flags, errp);
+                                      compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


