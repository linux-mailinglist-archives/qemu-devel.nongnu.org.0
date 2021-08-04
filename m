Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6585F3DFE38
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:41:35 +0200 (CEST)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDP4-0008BI-Cr
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMS-0004cD-86; Wed, 04 Aug 2021 05:38:52 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMQ-00062H-FR; Wed, 04 Aug 2021 05:38:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQa4Js9kQi/m7JFpDoLuLYQ8Cswfv/I+9K8kn4zvP0ggGYP779K2ykg2LJC5Vra/otMk0MQvOq5jvzkhcHtbYkqOv8iI6WnOSTgI3grEsfw5TI6zpIeIu1OsZ+StXaTKRUxsta6HRtVjjFyxjF9538JpqtOBMmK/wi4nvngtNoKUaZPjv0ndkSkn9wPOu6mpKy/S3cQiecsG8bb1JuMBAEDCRUf9DCP0ptCSUPltK5AXy1IBIe6U5aW/Q1+lv0s+sIMHI356WP0Rj/ZepJnwSV1WSG8Poo+Qc+kiWUJu5AnOyLojbjdgoj0BPXCEkklbto6Sl2AVQEDsV2gYBG+GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05MAVweV5CiN4ggqV4td2AgnTto2VmyFPIVQQ7M95jQ=;
 b=Z8HKc+lpthiz8Buut73GSZ5JD6X1ReVXCCUF2huMqRm/VyCbfEhUE3y5BXfjLrb1Qi8WoDwLNFZt1ebEQuyONx2A/zkwc0A0KZLUygUMbxg7m/egwz7bQdF1EAuTKTInEOFp0hsDdJYLueXJOrNiM6CW258mOLgZTbSfqV3rXdsKbPz8bESpFeA2IbKu7BWpyoNz0kFcMm4b3hJaPzsUQXdvy7jZ1e0435rgTBjsdu2mT42X6a2dwdHvnGBrgdtrHFfUUx90M3xpud0e+6HTrMAP06ohoOpylZpSe9c6u4jSr64AhgYnD0uND0Zu6azizWCqoRXsCaJ8UpAI5VUNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05MAVweV5CiN4ggqV4td2AgnTto2VmyFPIVQQ7M95jQ=;
 b=rymg+XU5SmMcFJptpy7y6wy3gllR9QxuyjQBU8etgfZrYWQGX80wN18DHg2gPnsNbaabSTxQ7ICuYVwNPRBRShKIg+Zq4lpoYLDCKpowufbL23wbz2RlX1N9Xycy2/IedsCAMEaXHXUVWbo9OVAUVf4UGxEw4BVLd2kqpVb/9jw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 06/33] block-copy: move detecting fleecing scheme to
 block-copy
Date: Wed,  4 Aug 2021 12:37:46 +0300
Message-Id: <20210804093813.20688-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf1a8e38-6747-403d-02c9-08d9572ba671
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50322C1AEAC6A690C38F6228C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yG7O+uvWdWViqJvwKfZSRrlaov6QbhNypJMHACyZv1D/yDG/qgi8gAZW4cT0GK+BR7RRUJP6MzD1iGryMLAF/Nsd4R5/b5AyaY4yP/zhvSMNbaaxTXicqk9ecT/U0ATk+BG0lCwtO0ein8npUMH/CD597BRLvK0J+k2O3id7SitnlzgwYTZRWOqXhygqNXTl35UmlM0PfCGxGeHMIe4Te1hsKQhBs39dY9WslbriOYylYD470w5FKu/5dIh2iZmG4rfYplJjIQZXd1bZO8PB3v4Ch2kPbAqYnhCFO0pWiOt/5gBCPk5HuFA592ovF9MfbkRZk3B/RuuuVfyfA0wqyA9+ENcEFyaZFt8p9//MC+oIr10CnsrkNRPfqrARQzE6VEtXa34pW++DhzlUSgRcukOLd47mQkSW0q15U+7Oj3IIOa7MwomSMrPSuoAHdG6KYdgURKlQKvNkjAabQunUqPSlRqATgPi868c0u1OJNPbFMHrmIHYgcu8D3KnrO0jMfsyrvK9PWMVQUXgMZSISBwJO8YDr4QERA3alBjGx4xZElPdmZ/qrHiJgJ++gp1x2yvHKHRbgDHEGTffTkRUg8e3l0nhUeCCBtCqoQwleiRSI/ThLfu+S5yE4SAqFG5gmzJ+FI4Z8uz2LKqtMs2QbyrPeglHcU7mWSeAMnK5Un3p6XHrEPYu174rROI/9VA4Egd12fkk/q/ha4nb+n6XE+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8h04zQ8RiHpbZ4H59Ejd+faMr51SRdjhGZ1UOG5kbskOcagMXYMHAG265TQ1?=
 =?us-ascii?Q?TJZ/OaXxhOLIlExTU7GSKfhIrhYtRiaRO0ady9Fsoq1hruu8VVXlvrYdJFRz?=
 =?us-ascii?Q?nMqCEUrweMBnPgGgv6m1idulclfJm9SHB2mc7DLa26p3TP5uAhzzCalHo3/C?=
 =?us-ascii?Q?JAZ0UGqSIoeQhYh0w12kisRorjyfSOuY2+ZZjHnHz0ezoFWgEd7FWlNGErGY?=
 =?us-ascii?Q?7GoQucE+uBnH5pIuPVtKfWOLCvsCcirzjdhkxkyZplin7S2PNRIIgsgjKC+h?=
 =?us-ascii?Q?HjLZZgMfV6d12cpzmMLJdxId5d310RreNiDCGkHBUA2SA5C+UsWijCrxbcSJ?=
 =?us-ascii?Q?xf7KVF16kXY10X+VBV5INHNMbtwzSXA0e0zPIOB4e3zZ0vJ+UldRU3OPMtoQ?=
 =?us-ascii?Q?rZbsqITwwqrCpImCpdGBO07PT9chVCCqam6uRyZpMQXGn2f17Kj/DMjXstPu?=
 =?us-ascii?Q?raqam3ap5OhXzgs48N4vBUY9bxVgwc2AexQTjjAbhWF0IjWR73OA0SUGZON/?=
 =?us-ascii?Q?vKrsZrOWRi0EHwGVyIsfZIqFx4Dg2Ip4N1yjAebueANUy+kav9dg5X4oNKwt?=
 =?us-ascii?Q?YmgA1AZuiZjEUxkT04Vv0sN9TGWTTgAIE8oRVU6FcbZixvuBH1uow+Th7oyX?=
 =?us-ascii?Q?bRwox27iP/54tqn9ZMFCXlZDzQ3OUXRcQr23UPouNyh47UI6dy/gnNu5XyD2?=
 =?us-ascii?Q?5ovmVoqKlr+6bMBgbzbzqlADh+bihPramSCK0Rr6coLSApp1XbzrdjQZbsq2?=
 =?us-ascii?Q?WQX7+IfH6TxfemBvKym+ckVg45UVTMMWk+KbHVt4aAxQmeDZJ50MStqStnGr?=
 =?us-ascii?Q?fDXSObZLckkyDou0hW3TPGIpKk/zxe/mhr8t5tWGDRFmufJSdWYWsWywoSkI?=
 =?us-ascii?Q?md7Nu5QbYieuwIMO5MBmRrQpWOaCYLrmIOE8fO6UXcZEuXZjpoRyf/T9W+qm?=
 =?us-ascii?Q?Tfm8/r1vTT26zrs0z1007QzT0sQ9R4Va0M8DPZkjFKOLtlEkn06BTgURYfgS?=
 =?us-ascii?Q?5AIFmHk1/lsWDZZFH8StgMX/hG3CGKBqVWoz4LbMNJ0kd+d35biCoLRrwLzA?=
 =?us-ascii?Q?VrsKgvWI2GOt23B3PpVg6SNXVbcyNCX8lmjlHVcQ3Sgd0JJxiqRDEcAZhH2f?=
 =?us-ascii?Q?nxjVIWS1zQhuJJmlgu3EuBzo92jtIX76WA0zfBwQqgvptAIzmkiuF7NjYYEX?=
 =?us-ascii?Q?Y/ZEzitKGoksI0zoGut4sas33AdMTJ2tFxpKvB9y1y8fen4Xq3nEG1sRMepH?=
 =?us-ascii?Q?e1rhsbhnZB/F759cNnPDnFJwLSNcXSNpLIav91QMWU429pWq1I4Oald09XFB?=
 =?us-ascii?Q?zJuSPeZZyQuocsOpxc+i8oJI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1a8e38-6747-403d-02c9-08d9572ba671
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:43.9072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhE7I+bA3cMDQUWGORkxnq09EMxg7SymlwIjQcPhDINiCpn+ytfl9JKVIbbcdJAITCw7fIHDzxfXPLJWaxxnLh8BcFWs9cEBtMIFgyvy/ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We want to simplify initialization interface of copy-before-write
filter as we are going to make it public. So, let's detect fleecing
scheme exactly in block-copy code, to not pass this information through
extra levels.

Why not just set BDRV_REQ_SERIALISING unconditionally: because we are
going to implement new more efficient fleecing scheme which will not
rely on backing feature.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h  |  2 +-
 include/block/block-copy.h |  3 +--
 block/backup.c             | 21 +--------------------
 block/block-copy.c         | 24 +++++++++++++++++++++---
 block/copy-before-write.c  |  4 ++--
 5 files changed, 26 insertions(+), 28 deletions(-)

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
index 0becad52da..58b4345a5a 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -317,10 +317,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
-                                     BdrvRequestFlags write_flags, Error **errp)
+                                     bool compress, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
+    bool is_fleecing;
 
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
@@ -329,6 +330,22 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
 
+    /*
+     * If source is in backing chain of target assume that target is going to be
+     * used for "image fleecing", i.e. it should represent a kind of snapshot of
+     * source at backup-start point in time. And target is going to be read by
+     * somebody (for example, used as NBD export) during backup job.
+     *
+     * In this case, we need to add BDRV_REQ_SERIALISING write flag to avoid
+     * intersection of backup writes and third party reads from target,
+     * otherwise reading from target we may occasionally read already updated by
+     * guest data.
+     *
+     * For more information see commit f8d59dfb40bb and test
+     * tests/qemu-iotests/222
+     */
+    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
+
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
         .source = source,
@@ -336,7 +353,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
+            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
@@ -351,7 +369,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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


