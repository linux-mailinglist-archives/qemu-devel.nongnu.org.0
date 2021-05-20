Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519EC38B1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:28:34 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjf7-0000Bw-A4
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZd-0005kL-1s; Thu, 20 May 2021 10:22:54 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZV-0005ij-O4; Thu, 20 May 2021 10:22:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ0xueFitIevNgg78/X/Y2jd2/Ntndy9ndxen5kODTXBYT5yrclMcv+XfN5E+pZ4FqcylIfxEyE/661Ks2Az/hyShqRCa0q9VrjuovLPe8PH5F6ro5ArM1ZFVTfOBjjbHhcxzW5ESDkgreybMf0g1640nhSHD0Lg+w6CXBssB5JUwUrF1iZWZ2S6/tEbFp38cRMITTj1MfotXaDiTDy6EAG4xItQGppPGJdbM0WbMFGAwzZli2VCkrpw5H3m9EYbSTltv6vhpNH2F6oVTRtdzHDgWtExozbGt6jd8PiqvNW5/+7N8+1UaIQT6uZk8DNIP2XvkFQQ3jZMJe12iRgP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxT6FWcotG79jD05nMEM7Td+0QQE4Du0GrafUXopPTc=;
 b=mXnKPmgcxIp6BcOGa8qlRGgtF7c1HeiBA3JouwNoQ0xwjbnrbgZwE8IoBtlIdw02KzhoGyL16xWlE4O7IT2DrN4pD8v0HsYvaXE8N538srOU0Cag7DSECmPb6rX7/mceR7BaWjszDr6e3l0Ch6eU6SwFDh2nGSMqVFhDXaPgfYIQz48rci2MXP4U0Xo9DMcQ6KLW2l4iHG7bm1VJjRe0ct5GUIlXBdV9cBBzsrkxV6BbAhvu/EK14mnqHdkIOSbSk3bVr1cBq0wyuyO78egr9gf9/MyRKiqm6+ilvewdayasyAkA/k/NM8bHVMR29SaIs1rh/q3w/k4mBSuVGCBxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxT6FWcotG79jD05nMEM7Td+0QQE4Du0GrafUXopPTc=;
 b=MQEk8SUufXCT0k6qlZAjmZURSlBrkxq2aNXnHAjPwTRm7hL1T2bT9YoqgFyNnOoj/+f+gjmhQzURmWtfRmYefW+AOS6OPsJ5Rn6jU1j7bp4gC4+oJ9EdmT4Ramfsu6vu+i4dcFyTOdIigyCDFFg5zu+0+YkU/Am275GjG6qpRX8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 09/33] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Thu, 20 May 2021 17:21:41 +0300
Message-Id: <20210520142205.607501-10-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cdedccf-a83c-4eee-7f1a-08d91b9ab691
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35442FC574EA2DCCB6960915C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MktdVsnGj5CX2Met4QTo66WVBurvcJ8D0Zqte4rqLVNhdl9mrxdpemD2ojVCQq7nPao4pxKZT3145emE8DEcWx4y6xW9gmPUWgBq4xW+cuGUr8fgx4WjV9dGAPU+TnnuH98rsrF7oqVoF/nyumfHYPsPk79fRXNclK4o7eszDuRPas+YtWseJcU7nLwFjrkSQTt55B/y1LIaOO2itOYgzl35dMIEBg1EeWpdZexMz1OlqqIcS8cM4y/RIkQozdI3d31mt1wMHMNOZwP1cnKsr7fKBI+LVzUpmxV94U+Z5Zw+056ygrbbNX/ujLh4ogSpB+7loXXMVcCTWWofvSDG8DKe3qKOb5qDr3WD9RKBXkohd+qr7Ln5zPVmCYNnD7qSw7Z22zCOcDrNNOK9fUJb+zBPhTldDIYJ8elbP9vfpVl1w0eYMqc1JeQlGOqqx/1AKPMEf+ogOsZTkd9+WnzX2V13/FBB/x9XqnNf2hpsY7osbxAMagDiTpytKklSd5xMym/OTK/qYbrVrioV21dNPUMazTjv+ZgclT6ImOSlWz/OEd8PKMAeWO0terYDT5f7eJzfGMUvZhLSSda/K3pUFl0MGardwD9IxJZrxEE/RbwD0nhdN8ZNDTgmkqpVQqNxeVBHi0Nr5vBtqFgglVRCxl/FyowFEw9R8IpowYxydKL4R4jsgRIQT3gGni3R7ZX1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QRUDt3xvW71iQBHHBbwd3vOB4yQJd8EP9UdPzHoen7h4k55t9NVgaChvrYRn?=
 =?us-ascii?Q?zXkMqQfH5OiSJIsxWNKMP9WKk+Y8jqqj1tRFoNLf+pHI+GiJFABD3DU3+dW+?=
 =?us-ascii?Q?P9KvZTQbrp+P3RaxHP9sG4TObPKL2tuihKRe9h4+5V12pImsmqDGMfvRMliT?=
 =?us-ascii?Q?P9kXqfxj1HOsSTOz6QH5sZb+EaoOkhgyH+r07OySYGI9Mdrg2rBpxuxbNDgg?=
 =?us-ascii?Q?rE0E6iz8rjeQjH+PXvhHxXtNbk7pH8OFuyms4H+6SEcbucUyvJuHh9F0k3x6?=
 =?us-ascii?Q?3+xQdYox4rP5e7h4GBF2osZe3cdVhodUC7qL+4fEXnqhUXETh1P1/7nk+c3Y?=
 =?us-ascii?Q?EQb9l8H2sl38omfay1rY7fHiWdp1cDawkP4okTq1r8d4vSifajTXF8Sn37PJ?=
 =?us-ascii?Q?8zePyY+6d9wbVrTvJtvchMVHgj4zDE4zv9Ko4e6iWpRiAhEy+D8mIdFRS8ps?=
 =?us-ascii?Q?EfgY3ZIl1x7N+zZLQtOX071wft4ZvIwVoJEqHKVxIhYyUWhuWxvyl9ql6yRM?=
 =?us-ascii?Q?C3fh5FwNLNXCGg7QQXK5jeW19Tse02cuFrVsRR02NX/rQtbAiHgWPDX5TDCx?=
 =?us-ascii?Q?RkQ1o2uTQlKg53BO3HpRLanTHWeHqzT9d2bkSnIM0uWREnP7GpzHBDCDo5+/?=
 =?us-ascii?Q?S4o/4sKu8CEvYsuuxQJPAZoko/Z6lwfcI0kzBzKInpP8fQSqjZiowmR90rf4?=
 =?us-ascii?Q?SZFaxCEwyGyIbaKo67OAwzVR8AenpFRaVQ4XVsvzX83Y/7FjS6laDEykMdnq?=
 =?us-ascii?Q?6hPsfwhBn8mmzbc8SbK4G2O6YBxLHnW60A29eer0CiU24P72PmIkeYEYaXjy?=
 =?us-ascii?Q?/YjBLYjCouqtc5ukV2/M2D2R6/G9xaYu+TSF3qvHQhtI5z0ABV3KSNd/X9at?=
 =?us-ascii?Q?FDfsj5bcgtbAoDkPiGT8tKuKDW22c7ezIU7OQoSsVO6TU9PCr6WdqzZAQbd2?=
 =?us-ascii?Q?QvhjcBlNB8YZy7zLrBFDolqrL+6BrZ5hadz0XtJMJRkI/dpXO9Dpdu7sdNc9?=
 =?us-ascii?Q?lqfFX3wdX9T2ZjfVP3fkYzuohFQaepRqYoyCE8s6dKEm+CvbZsJRaBWJoq0c?=
 =?us-ascii?Q?2rSIMPjmsMTtRyNPf1XJrQkOAJF3wnOQbZGof+Eg55/he1xtvMy6P3ESlkAe?=
 =?us-ascii?Q?h/oKTyhaaOxfauJZKwbMo7/OSZ7oKXo/i6Nfw8fblxnTgkH8MSTgAnxevUyQ?=
 =?us-ascii?Q?TZ3pwBb5Rg9X7bN+LTFRq5PFGdoXmhIwQMUhCScGqhJuhEYn2tdW6GcV9rsL?=
 =?us-ascii?Q?Clt1r4wiR5eaY7O8TsYTkw8dJhLW7VIwGG1/t/KsBG+HMvZquyLEWsLxJ/ul?=
 =?us-ascii?Q?rEi3VoVYLsWHvmYbtoIty0OW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdedccf-a83c-4eee-7f1a-08d91b9ab691
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:35.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i44tIXvEVMKymDO4dMunpI0F1auLzk1vdB0ZyZpMevOehWGxZ5uQ/C0KCbQUw7AfccV6iiGmj3VsC3daHGPT/z1f+AwHtpBnCg9CqhnW4Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

It won't hurt in common case, so let's not bother with detecting image
fleecing.

Also, we want to simplify initialization interface of copy-before-write
filter as we are going to make it public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.h  |  2 +-
 include/block/block-copy.h |  3 +--
 block/backup.c             | 20 +-------------------
 block/block-copy.c         | 29 ++++++++++++++++++++++++++---
 block/copy-before-write.c  |  4 ++--
 5 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index e284dfb6a7..538aab8bdb 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
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
index d41dd30e25..29db3a0ef6 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -407,7 +407,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     int64_t len, target_len;
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
-    BdrvRequestFlags write_flags;
     BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
@@ -504,25 +503,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
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
-                          cluster_size, write_flags, &bcs, errp);
+                          cluster_size, compress, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/block-copy.c b/block/block-copy.c
index 9b4af00614..daa1a2bf9f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -245,7 +245,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
@@ -257,6 +257,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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
@@ -264,7 +286,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = BDRV_REQ_SERIALISING |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
@@ -277,7 +300,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
-    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+    } else if (compress) {
         /* Compression supports only cluster-size writes and no copy-range. */
         s->use_copy_range = false;
         s->copy_size = cluster_size;
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index bc795adb87..235251a640 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BdrvRequestFlags write_flags,
+                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -216,7 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, false, write_flags, errp);
+                                      cluster_size, false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


