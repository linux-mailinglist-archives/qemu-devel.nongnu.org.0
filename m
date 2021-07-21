Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9103D0C61
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:23:38 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69O5-0007VI-Mp
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697W-0007Jg-Tq; Wed, 21 Jul 2021 06:06:30 -0400
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:9313 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697T-00020O-EY; Wed, 21 Jul 2021 06:06:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjAzizFYJvEaW/QomNjq0JG0pidO3Aec20MI3XniNIdTL5A++/k62eaX3Y5/6M2AWENxYQW4swG/fBljeBlrfFjA5TvTlDp1115+A4ErJ2kyiWvN1zgKNPB/YjHJNA1XqJx6FsRWFSnsUwU+WfVfXb4gFmqvEVvynBFu6DsBPQBQxZeUGWdVcxwHL9s0nCoCMJPW/VqJS15R3nB+ND3vWesLOfvnNHiPL3rcUrqat+Zh3WlZATvuSbzp2OVbT4vQunzJoQ4naOSKz9QJP9Zh+zgtRYvizyzMBxZmT3kOc9rB5e7PwZLPkPzcq0lz9SXEpk8d9XJ4EZFmI13eKGS+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4aN5/orgwC1M6UZWEqRhMHxu5pFiPA4YnMeeC2oSlU=;
 b=caVwKXF68NRooUrcUiC/M6771bkjQjavQNbYnFXWS31FOeMigYqK+g/M9gFtK/fcrHPS/Shb2hqJv083oJBPjcVAz/KaFEVXu618cboqi0meah0Exfqi3IT+VGMLZktk/tkwrprY/M8fIPZW9stwrVEg6upfyYRNDBE51O60IUOGzPYG7MPSgHNyALp79JxNeTiu7bNxa9cH4O9mC7hA1gu6nyKn1QLEYEFOcIpXq9yVMmhE/n+2njvkIuIUQfmpX73Ylb2HQ3u7fkFEE4sPsGQHsOIPeFXfMf3YOf6J/6jdccRn9577mY1y6pZ9d5nYEcEQFEhmAbH/E2Ble/387g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4aN5/orgwC1M6UZWEqRhMHxu5pFiPA4YnMeeC2oSlU=;
 b=upGXYKcuSqC2ZfCFgPhBhtyxTcoc1v9nQyMpkOGFWTJfuDZSUohhZzJkQHRhulaIeArSIC6CYwoeTQjJ2nFrvhRIXuidYBw7xoKAkuFnSP85uyNtrxH8sfv3s/cDw20TFT0ulnMujk0UePEqEyhQlPm6IQC+d63EFvAEP7TciQE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 06/33] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Wed, 21 Jul 2021 13:05:28 +0300
Message-Id: <20210721100555.45594-7-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7688bc-cd54-4637-2883-08d94c2f2ec2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168AA97B658CE1B7E78C7D1C1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:57;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giPE0zgD91H/KX9UVLTB34MKjaOvBzw3L/QXhmqkgl+sK5nwRA+0Gv+jYem7SWCV/tK0gbZHOIYnEBlxE3oYSSme3z4spsGVhnxwHFmWGlFQOLS/LU3UjpnpScpYj/vysqm5wCpRXpkPaX3U0YinB/eoVRYdNxHppTYQA1XKN72T7hF20YOuAO6mudp1DLtTUrc+sjXEnnrIp/KOl47jxgwM+uh4SjcnYqE1R4TDxICjEB4MPvm4XuBr1gSffnXoMXC1sTZmDLFgMqw/TBKd0UjxMcYIPnDr6PEEoMtVAxs7df3/e8YWh4zJIfR8uGCosTXM7MlVU8m1PQ5bQhJljzEj6wq/PZI1Kp2EIqtoFcQ6WhzG6ACkSOCo3Lu9AFJWAes87hg710E5OVF2mB0RPq9+uvl/9xijmv3G/qdHSzI2RHZn5r1Y5tg8NnYPs3nV6C3dfh1qO3vNmb3G6jtv7PGN07QSnwvG7VnypeAhaVBfdUFeNqp5k84WAe0izgehATMmYxcz8q/K8Ax+BMo6ZzLfgYivLLPFg4/lClySTSw9uwgCTMQ6tHkY+KJI+xknFO50Jujdq7+w/CylQ8UrT+zhPkrDWFks2ujM8QvUH/6EBWt5RRQK9hJ08So9a/HXbJqLWe5SOJZcHFn+K2FyA4FT+R5SoW3kkqTnmED2l1yUh1RT9D7Ugw7KoIBC/hH/Ted6SQEEEAi/acNvAryMcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6uNXRm9ZDmu02MGrscK8VfAtM+mWRrEUvoSmGkOKghyg87n4T+J5rCAfDWWg?=
 =?us-ascii?Q?JTtP+388XCQ+06TUjxFBWJ+awPYYOK7wQw35I7wJA9EKHW0zIHN2qv7i5j22?=
 =?us-ascii?Q?WUDG7rnustkmAZjZj6wgaajZ/41RQzeSIQDHZCvUiJVBwaiyARiVNxZ1WS9a?=
 =?us-ascii?Q?BRDUoU3A5YNGRuReBq9b3g4P+nQqj7v9ee8UEDIBmMEZt5lXvke9vatNAZ1Q?=
 =?us-ascii?Q?HfHiOJf9X3LK/CwqQJPoGwiSfsBuwlF2AL+zyoF1pBROVP+atI9H/jKMKdzv?=
 =?us-ascii?Q?3lXmdzahTtmJKMl6XcQqwn0MyKSMQvnSEe20nm7Ir+oWLhoH4NbCWulyvI7s?=
 =?us-ascii?Q?7UjCJ3vJarv2LuS41uSef6x/xRU2RZPUfh+4wTP+kb3Wo5CKYwkuXdAhw4Hh?=
 =?us-ascii?Q?sisJlPseB6RfWH8rePDP6FcfApIHvxO/UFOLoATwTpU+QNBA8XH0127D9un0?=
 =?us-ascii?Q?N2k566MJs+e/muQy0rDHiSIsBKkL46vdrXsg5/7KhzOljICLm8at/aEKB9hI?=
 =?us-ascii?Q?smMgzw/NWadJpweVkwF1fHjIp9SvUdqYUmHIbezBZMapkh0bK8NTObZeOXql?=
 =?us-ascii?Q?y0uqv2bYhyPSuDYMBsHDbT2jM9RPD99D41A3nOpiwfQxI6MQ3hNyqSpD7sKa?=
 =?us-ascii?Q?oW8OJHFtlVbMqICca8VmVbXyZr+2sc+KpQ0BqlTIq3cqkTM7tIEayaeaXomO?=
 =?us-ascii?Q?O1xcdxlMOGuGj3Le1NYq4mov8CODecsetX5xDKcWQFKxYnNa85/6dbb9HKhc?=
 =?us-ascii?Q?v11OKMCUyv4EA9EmlQr9eXJ3O0Nr3jRSsPYE2ZhFWfN5G7S0nQeMwZAFCGzH?=
 =?us-ascii?Q?eCDA9FjpZ02It3Cljhxav6cpkZk+sTdTM1pKoMnjMmXyRLcfjN79qkLaPTFx?=
 =?us-ascii?Q?WxVL5XzteP6wAhngjw4Mh7SDrbj/cv7cgdPXGvkS5v1OxQo98+tW126jxJoT?=
 =?us-ascii?Q?ZAm65tmgR86cuZ9nT/xn4uJz0FUxWEIayBrPwa8CVtFgiXXmGTHrlcWP+Rhh?=
 =?us-ascii?Q?AUZ7A93RgYbr1RQob7rTwggyEWv1NQRxKKrMvagSQ0PQkiVNZ/DIDQsqpqUk?=
 =?us-ascii?Q?+pfxthRN9y2M61gSTXE1+0JZs4x14JY6MqBQxWls/btR5sAycb/hn0WTi4hM?=
 =?us-ascii?Q?B026xf1kGyqnT7ks7eT9AN4l06zZTH1/Zj+icTRC2/F93VRcYrE1846vGg2s?=
 =?us-ascii?Q?SH/lwUNhnyTC2YYVPAPOphSm1ztJf6Mhr5ZxQno+4NyEvxgtEp4FLCTwxToi?=
 =?us-ascii?Q?SG5+A0UsmPPt/fKdllRKzLyZC243maeJCJle5RLH3HEfEWjJ4hHfc/W08pQ5?=
 =?us-ascii?Q?qWVhNvsR1UdJDd0WRcmkbC3b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7688bc-cd54-4637-2883-08d94c2f2ec2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:18.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7ItYtT8P8Ze/VQaz9NGZ9jSZlRazJ8KJ7waQYEz6AVovuxEP+NEFaNAZcQdVglDt2a5LNippeoRLUS3Y8yOD1GfS0hqfQvjiZVI3iwAz/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
index 5c8278895c..734389d32a 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -26,8 +26,7 @@ typedef struct BlockCopyCallState BlockCopyCallState;
 
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
index 0becad52da..7ce5e3d657 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -317,7 +317,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
@@ -329,6 +329,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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
@@ -336,7 +358,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = BDRV_REQ_SERIALISING |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
@@ -351,7 +374,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          * behalf).
          */
         s->method = COPY_READ_WRITE_CLUSTER;
-    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+    } else if (compress) {
         /* Compression supports only cluster-size writes and no copy-range. */
         s->method = COPY_READ_WRITE_CLUSTER;
     } else {
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


