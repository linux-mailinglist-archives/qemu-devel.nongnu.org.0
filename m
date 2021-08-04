Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710A3DFE3D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:43:45 +0200 (CEST)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDRA-0005aC-Jc
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMZ-0004jG-6F; Wed, 04 Aug 2021 05:38:59 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:45925 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMX-0006Db-JM; Wed, 04 Aug 2021 05:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTCsvqAewseibE0XkztTrGUt7JTfLLiMlQq2pT3zkKxACOrYb629SgX/NftcG3v0+/K+z8kihtgBtjsltBPMsv/s2/rDfGGRjtkUV2V8Ch3sMJMca7oZzgXcYkmtswdcFhat9g7mjuOSse9XuFiHnvlbrLYE+YkxVJfzogzS5NnszEGFOXZOUOqYsGHVcMpBqAx/sXKCp9Tz9yzhPb3KptMFbZe2WKqufQkO8clHNo3ZTnQHLBSC6Oe8PP1FUDe2fqaIlb+u3MTFynifNYIlijwBP8pQLP6HdAh9jxDSzh1T0yqJbQM1gsYvTBowtbs5oUCewfDE9xgQblJsopRoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=dWZIryQPAFCsxoNkylqsD4VVn+b/tFyADdqfIW2wozCJNbEFMot62KAM9LIidj54SI0RvqVyoIp+aMK/eysXSdQ1Tpe/BKS6SgcwckHvvZSvNqBgoF5RiW0oCm+KD6Q2DqOApab2QxxagCF48aRj6pzLq10KG7zI1NK+8o5kjEatcKOzUKYB3kQcwCH37+sJ0K9f5/k91bFscw0uhk7FzUWPAhIHqwVgHmzQUedNJSyfrmUEcGJCiVZdleeKbwAzOPeqz6y1PCSzajgMzWlAfumEPo3O5+kidcllc9jVjAXj0p503QLovO2smWgWsn6twPXOREVHFg6qNGXBpQ1ZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=d0ob/6Jmugqcus3EvwAPrKFpFzfbqk16aR4KwO4FJ3glGqpGQWocfUnKjtdiwfwzNdVZb/jxSrCZNOuTgIuslez+Uk6/nbRcwoKw345IXzGnBlLt9hizEZr0WZ3LveVYvY/49elpju7gQSo5gRWVu3ti3KdmjZgCo8PHxz12NXM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 08/33] block/backup: set copy_range and compress after
 filter insertion
Date: Wed,  4 Aug 2021 12:37:48 +0300
Message-Id: <20210804093813.20688-9-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d30dd67e-ee01-4624-2437-08d9572ba83a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50326E90EB6B57967FA82C74C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6AgSurTnFdBi8R0z4Whod2Qrz8VSjvXmmjF+QT3dEpy6BSAmEhMjGyKzGP57Dg0hEnA0aD7y1GPcxoIj1iiLYxlOkzkX0CkVovZnPbhacJGLN6h+d9U+H6OVt2mGfAA6KT3AfXV5jGJjJ49akTPrXBFhMq/OpM2AujndXTg79cPczQajwLZqznltILrShddoJV87GA4Q6RwQVdaSZRZ+bLo+tI0wGpIMmoIebnogIcxacsmkHoZ8qvEEHloKoItgzysMXmDPY6uuSJ8p/J0so5SvnNe28RIJEcS0mCih0YqeSwYMfW6RtW2nAiC0z/rpZze09vwVDlhUo+huhXqBZpvVHB0t5+qa22qt60yWyRRu0sicvT1b4vkKwgnNu9yOKK1QFcqeQL8Xu8crZ+ultGGNgs08TNLOmy+Nz3X7XleuWaqbMadXE2tKmO+wkrD+auDH0H0MijczegJxks037+hvsUniDnmDX1lOQJv5eXAlNPnq1bxhR9q9eh9MPVvf8xv5YXTAXUrXTVQrxYxOxAXrNXjxUhKEyfroEEAgOLWym3ldB/vBUYZ/jdzTwlXpdK8tFgFIN6JsB/IUc+bkP+PS46/O4qiexBavXlKvARQKfN7oTEj662ue5hFvM9Md3mnpZ9P/UziioEpkpF97vgqPtq5kxhF2F2fRtLYRhA9CXLLigsABpecT2JR43cSHZOduza5dK87c+OlyXH9Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Y7tAdnE832V1yWVv2SnJpYGByDLnhFA19xPCWTCswQ7ksg7fw181EJRBikL?=
 =?us-ascii?Q?5xM259xIxO80kGX53WyT5RoDhLoO5IhqmjLBdYGPsZQrdjBogJzF7LWa2DY0?=
 =?us-ascii?Q?9R1itV8ghKabSmutQogyoA1MAUFGYStj0R/5jOT4fmNtS4WQuPRw6JDUKE3O?=
 =?us-ascii?Q?/32zZnpG4IT7YxyJvS3sPq27xD8kYnfXa5zQVWTYjKVCLSUJloSVwDasDM0c?=
 =?us-ascii?Q?yklDTfBGumx4czXLKs2N/4TD/Qbgjuu5gM1vaum5BvoMBZannREhMWUAdHxB?=
 =?us-ascii?Q?bp61IUnP8xFzfKicZqAhJ05fQ2plv9ffhpFkdXTKShjhmi3DthuTvi2zOQH2?=
 =?us-ascii?Q?+kyzv2AoEtiWaV3OUYKCuEZSm6KIHNPQtMhK959nPjaWxghlR8TZRTZRuu7Y?=
 =?us-ascii?Q?oRMPj/TjBMPVv4Yac1ujqu+W3JcdEED8tcoVhmlT86FXYme5tPeQdVP2BtVK?=
 =?us-ascii?Q?e0/bVbpyLlFfb9KIsWEujJCXndBYTTtaKJCQEDMPfkkyZ9MxZSViEyYNpJqA?=
 =?us-ascii?Q?/7yohYw1FvPRw4jb0OzXHelzRUx48MQ3HhNFNBUiF6jVsr8pglO3qq4pCB7S?=
 =?us-ascii?Q?V2sFYyL9rFobEdmjIh4AeVAFwR/6moy2gDfbbA34vRrs7s3JxUj2FJlsy2/K?=
 =?us-ascii?Q?aZ9YMcPmCk/rzvG7AxA/GwIgiOtzjiD/rjQLsSQa5JiObC+OenzRWuFtl5ac?=
 =?us-ascii?Q?vPqXJfrZZhNgdhQTP4xZdG7soBd4EzL/wJk6jjQRx2s1EAtaYll8/qg9a6tV?=
 =?us-ascii?Q?wt68macEFl4dQTkk8NQ641nLlnFEaO2/sYpVYzUJTdkzj2DDDjchBAvQkG6I?=
 =?us-ascii?Q?U/O3haNTtmIsz9IQS/4s+W6AbctDnIr41XLZfY4ogrq7FCjmtvglAQBM3QfB?=
 =?us-ascii?Q?BViLhZTFu3pAwuaTO2VLQj6TYI1ThznqDEjg9c3THequtkh0hudwOE0NcRu2?=
 =?us-ascii?Q?o+ex1B/6P5OFHfaEsgcWC00KqObHEYKswRrkEdupJ2+DgrtI9p4a8GjUT5gR?=
 =?us-ascii?Q?ymSn3Q0fJ7utu6bihc5PHNO61WFQ/TYZnA4ADqPAc8KD+icqcW9+X1gs2v28?=
 =?us-ascii?Q?4h8lrmo1lIPkSuGk2IkjifAZ67KdhdZfGsYd+8eoGCoY52S6+dtGgOajQ9BM?=
 =?us-ascii?Q?4vlkJp0LqQNsTNVW4hpsJP8VNu6/vsuXRjP8+TKqAKGrgoEH3VycJ4hJ6QUM?=
 =?us-ascii?Q?UF1EzlPU0SJiUZyLGLEwjZDm30BFwwqghHK3I3uqZLGvOrr/dW4wGPXWZbUh?=
 =?us-ascii?Q?fvO/TlZOMyjqePClCyGFHLIo0yLXZnvJR704oz11GMRSsiLCQ4fn4SPiRyj2?=
 =?us-ascii?Q?LGnXriib/5/uo0n0y8vvkOSh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d30dd67e-ee01-4624-2437-08d9572ba83a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:46.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEOlVcyOix8SmKK5/uNJJeefpbJgafE7vV94n6gKsjGvLjR/MYQgSfGgiujpIjhdnfY2hypJ/XnTHAAze/jVvFKHFzhcsfYy7gBdqq+PaoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.114;
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

We are going to publish copy-before-write filter, so it would be
initialized through options. Still we don't want to publish compress
and copy-range options, as

1. Modern way to enable compression is to use compress filter.

2. For copy-range it's unclean how to make proper interface:
 - it's has experimental prefix for backup job anyway
 - the whole BackupPerf structure doesn't make sense for the filter
 So, let's just add copy-range possibility to the filter later if
 needed.

Still, we are going to continue support for compression and
experimental copy-range in backup job. So, set these options after
filter creation.

Note, that we can drop "compress" argument of bdrv_cbw_append() now, as
well as "perf". The only reason not doing so is that now, when I
prepare this patch the big series around it is already reviewed and I
want to avoid extra rebase conflicts to simplify review of the
following version.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 ++-
 block/copy-before-write.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index f37e2249ae..538aab8bdb 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index 84f9a5f02c..b31fd99ab3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -504,7 +504,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, perf, compress, &bcs, errp);
+                          cluster_size, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
@@ -530,6 +530,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
+    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4337076c1c..235251a640 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      compress, errp);
+                                      cluster_size, false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


