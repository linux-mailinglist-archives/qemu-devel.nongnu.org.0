Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950503824C1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:50:44 +0200 (CEST)
Received: from localhost ([::1]:41826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX5P-0002x7-LM
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0F-0003ru-T6; Mon, 17 May 2021 02:45:23 -0400
Received: from mail-eopbgr30113.outbound.protection.outlook.com
 ([40.107.3.113]:13457 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX04-0001tv-V1; Mon, 17 May 2021 02:45:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVXwD1Pg0qyFmy5NvflSRNAHvrF32R1ynrIXtDQTo+8+ZoJ61MgPa12r5SY71Srvw2qbditveCajMe11HKhjO4fZe7PuqX/6ONwoYkn0F0l1ue35LAGk0mAV8safGSGBnaUsaivXbkYkPn5OMALUS+qFX0NBYOp87PI8IwH6DQdEaoXTR3vs8JmuwMIsYxfnH7FhPCNs4TZtOnvxm9gdRsvO+u8Zx3pF6XpYKaFbZjCx+Lt4PX77IPRST1k/dcarDKTEgzG3o4+STw/dIXtuN0SEAQnX0gsdSxwodV3BaKYvswFJYJaiBiM6eLYTJXvuax7w2ieumusUmGGTRnZsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/TMvYmL5sdm16WtH2F/ZOSQmT0UNIT7cqYJwuZyc2g=;
 b=V0ADq0+ytm2YBSHG09Z/FLZ0+ap5j7KO6MMWXqOspRabsVZ43bkxAgBWg3y8AgKrh2f0Se768fxuETxexaUjB+vqDLJ0CxDmg3FW74+AF6nbL7/7Dz1YWdG8mCwYWFh4mHz0odV9lZ9NmSXzwS6/pX3h7FZlQn7Fvfzk5KGzEiFV4okUBd2ZHPX3bU+RZFtsvnVgtwz8pbMtBl1RT1T0XpToplLWGHordQwS3wI6S7tbjJlpsTgbOhZ2xMnQlyMayetEGwYSnI+ku+wfuDHTHT13sNuSw6TvMXjHo8hTd6q5eBCIgxFGKw6WjL+676Q2QCM/WCTCouS7UWeq+Tw87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/TMvYmL5sdm16WtH2F/ZOSQmT0UNIT7cqYJwuZyc2g=;
 b=TerDgpzMcGTRGVwhbF9lA0LsePsdoInnNTEkkfWSUAh5XIq143xiTq8RUCQ7hahNEpIgbE9CSDVuF7Jn146zy4Tkujhh8QP4wyOIH3Eh6Hx+zi1qDPk6TTzauMnwmnltVeLQ7oNM5aaRyzukNa5j+8C7PrlMPoWAHcQYag7gWpg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 07/21] block-copy: always set BDRV_REQ_SERIALISING flag
Date: Mon, 17 May 2021 09:44:14 +0300
Message-Id: <20210517064428.16223-9-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 009a4d83-144f-4cc4-44f6-08d918ff4782
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338283EE1D57B5B439424897C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKcA78BC7o9CqIxuNXwLB8CJG64zJ4FzdUfVa1cHplEzDqZQMrrkNUsqDpN2r7o2DUjcGz+uJe6NLjhA4XLYymBcoAby3lDsOfx4ueZNTaW3l5PzuFfY1e+nR0h+1nAUo72fGWQ1ZNZfy029dd80fSZd2TLiywGnkqyApjCajI/B6Bn+YlEyDRA9GXM7p8JuwpSGCJPpGjSTDv/UGJ5QlmEwZJiIoykvbV2/dRGVv5TFgixuuvFxZfNA92KsQE+idqmsJyT9jYSyK0vsjvun9z13C5eQKLBTcULu3fzFfHmdZI2SkkW3DPNUnxQkEHhOjxGp9EMDa3m5cwRFweTgO9tlyXmwyQy4YlVdCoBbKV+jrOt0x+arfxdwGh1GzQikwB4SMGptRVxuTBHF95g/BxKfFToXZ0mv5TdS0lNKKVbbuuZmqh88S0zSYkD/De2f2AZ0/5gWamdwiklFYg0LrgqiNpBnNV8dyCF9LD7NiYreJv4cgUGaJfiRSbxUEniXOuVKOzaeDPrUt9/+a3vndYaqd2at2LH5/jBflde6EQpKIRn6iWdcVN2dRNgnJgxQ5RetWIXnj6BFTrW571LsLG2tCr3P3jPUmZO9uxkn3VbfrJo6lVRGeQia9LoeovpwnaC2ug7afGYQ/PLUqwjjznYnO83dsfKUuVgjtENzLvr4PeBOQPjNZl+GEOjMnVV7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yOShxwjmoWIjZ1eBZkTwZcjO/X9R2eJ3WXIaKJPGOtZrYpy0t4KmPm53np1o?=
 =?us-ascii?Q?HX2vIbxptGz9C2EzirjnM+ts8/dCB5FawKsJry8IMEa92H1ukvhJ1n3uWp+Y?=
 =?us-ascii?Q?cE8CJze47K0gW8VTScgX5vX2KFBASRDCIXlpCsdaMGPdZnkJiaEOmoDp//RD?=
 =?us-ascii?Q?y9A2Kg/yFKw5Rtky8LnCZBv2nRaGKNzZl1Sa6ERvxCCD7njPwZpjAsWT7vOM?=
 =?us-ascii?Q?bMQ9pDqKlSPybWIj0cEaUsDJ5xc+LIeQLWLWeG7GvhE0UJIhfNkpko5WB3xm?=
 =?us-ascii?Q?5Ks3g3aLEBW0zLrX5Hw7OKLirF/H+h8n29HP4yjys7xkfPfIYIGhFfbfECms?=
 =?us-ascii?Q?RWH3gzR9eO1oTZfbgB1xUEGcpeWMCoKjW7CWXGzaZOa10erT9xO8SBjofR+f?=
 =?us-ascii?Q?8AFJqlAXC8dAJsHabws8/jVihe239uYnHnuJrmFRG6t/QIDPaYIqCJ5ciICt?=
 =?us-ascii?Q?KDAcyrvYSO+TIeysciV8K9Eln7wc1HQqGfqOOo+gUEeZX9JJiYcXLwkHIAXT?=
 =?us-ascii?Q?9f8MaL3lLREE9cNdtw+4Ak1KqDYfRiD78UkmdWrWCTQr3xG7M4sEsKhuO7HE?=
 =?us-ascii?Q?dGsMIyoUlTIxBVw5Ufw4av3WxbuR47yev5EQKBeODAJx1MNJRFAJzGrToJBv?=
 =?us-ascii?Q?aruhGwC0nV5ycCauC7ysLNrRInLTbC+hJYN5oMZ3jkzMoy+PkbWIg9K+F/Ak?=
 =?us-ascii?Q?PalzzZ1HO+6SulIeEm20GggEvWZanfhkfnAnCpiqXAc3jvKOjeZq7JkBs+Uu?=
 =?us-ascii?Q?JjzxA1L48rSHuRFcoXvyn8T7ExZP7Bvq764YvpSVSFaEt+2ZFJIXS+g3ugGP?=
 =?us-ascii?Q?eDRyh0Rg5upJYCs8bQHRIpT2jdwPpjnNJyjdwT0P4onTbsg4jly673San+W9?=
 =?us-ascii?Q?7/PENd3qIV1len68YibtkNOxpu14rx96lUapJB2NX5XZ1VZ0hz9qZMQW/wx9?=
 =?us-ascii?Q?HE7maYBUBFlQRv1STheIINR4oeDSnSZZ3XrvoMW2IVCnWjrYPJvcl2EgbeT2?=
 =?us-ascii?Q?pghp0Cr627y51y3Hw0BDMvwJR9d0gSWAGZjasQqP69oWboKxcoIep1hu8c6z?=
 =?us-ascii?Q?X6WsTZjzBSKB+a/FcbBrNfZVIoq5tEUgBCRoPpoHdIMK4ob9p8I1JBwY19mY?=
 =?us-ascii?Q?NEj9wWLQGebHjv8GHeIuXNPheUZP2esNKlhiuz8j9xC6f7wG6mK/wiQ1DJ5i?=
 =?us-ascii?Q?ITez1pAdM0zDUpePY5NNrFB7yqvxjClV6B3FVkttAy9zN6IKxX0K2wkgnYc7?=
 =?us-ascii?Q?NxVikP5UqdpMjza5+1HXx0osEDRv1EOJacaD8D6ozxAe/+tF4b2ixw+q9cMx?=
 =?us-ascii?Q?VgGgSIJjc6NC5C/MgnDbDvQI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009a4d83-144f-4cc4-44f6-08d918ff4782
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:54.6635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5rpINXUe+RM+uBCOGSwQtaAxS3qRckEDxP0BBMbJUB4UhF9C2/oSobBWFGhqdqZnMm44WCEMKpQc2D9ydJtRlfQsxl0hrsOfoJjCQmJanE=
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 7c7a88a0f7..fe685e411b 100644
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
index fe087a7347..19472912d1 100644
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


