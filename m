Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95147D62F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:02:18 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05wO-0001ZN-PF
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bi-00011V-VJ; Wed, 22 Dec 2021 12:40:54 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bg-0002Xs-RX; Wed, 22 Dec 2021 12:40:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlQM2QIryIeTwMpLHHSYBrQiG+g2apGt+JzL/g/im5USo+0Y3wRFvqmr/B+8eNF03Os8jg3SRc37HGRoAvk9cCjMvQxP3ZC8QJdEbxHSqo2wkFEWXV2KUK5ibNLz8LqB1muxS7+gvXjJLxSoMpfAf4yLric8234BDDTKWsx6tMxSTfYztfQpiZIkXlR7LRHox7/GbUXrz/0DveF/16OKsK2pfKLFPC/NmxEi6A7+NQ46JkOOi2ZBPZkhf9wcSZZiJaFobOVt5d2AO+xiTY8phchpuCStWJlFd7R3xq5VlFhBSVnLaMJoNppDQSCwinRY+3qvBxePSugLppHZnlsZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd/qewr9SDzF23I/ULCRlytcdbAdS2Q58Z3FFjT66qE=;
 b=D+sNcLYx+1sgq//Em1YiyqOrnr7g4av0mA8Bbd2/Rk8S8TAKBK5KSKPlX+wcjEisQifUtoTILQwk3HNtLQPhCpGkjdQ9zKDO65YAwDONTXyGh65fUA4SzPUTuWc6BlUqtnU7gFJOd3C+E7yKSLD8+uROauHUHWAQ2zjmrzLRNcmeZFnT0HV69/iCst+DXVy8GqsgTC2os14Kv8t9Zsq1W55dBmNChSiWvv1rjovVsTcvV/IIk5RwwCJVnWur+23NzFVB7L8HSrB4huwvmsHCoHvHqa4IlVmQp87PsUkENfAOyVI7GjZoHNqGVR/DB90il2ebYI1xayUyOZsxIigDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd/qewr9SDzF23I/ULCRlytcdbAdS2Q58Z3FFjT66qE=;
 b=R113iBFFciCBh/KNhFb/wmrIVfwBVXmGpC3Gui05EascrcS6IDildwXbI+wi0gMpLn9EzShPlFdm8pLcAt4ACm5gWaSsmjGZ/es6vEimGcYS3oqN/hwnpBnkNtrTycxy/jFrXE8onKuf20Z+hfy3COX+jemhg+RUTjqg+/4AAmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:42 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 12/19] block/block-copy: add write-unchanged mode
Date: Wed, 22 Dec 2021 18:40:11 +0100
Message-Id: <20211222174018.257550-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb140f11-744c-4ce4-9b02-08d9c5722cdf
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964413A1BE99FAA9A419220C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Dr1A1JoIvsf/Qj/UBzRA1q+Ee+1kFhsfIZnCCjBjAdNcfwVTFItb3/fWbi19UKXmKYDow6aFlhzIbALwNc9gWPQrZb4vX02x2E6bFOCqN90msE4Vd7KAMYSuZxv5F0DfRLF949tqnnaqhiWg5uW5klBOcHsNE+Lt0gcfpqFRXY0p+E9rqXk2lFgcdfM4Mrha6rn7J8pzFkIY8mh+MoYdaY2uEeML4+Rhg5wgwn5MawOM0/X8rGaZD337U7NY5xqJK2ZpKWRgB3zzXJaxGDUiW15TJJj+h7/feWmszhwU8upz2iEPf6+T71f96EXwlIeR54sCtFpprorkOcEv3VekuPQJpwn8m2o+MDwGb/Mi4vpMDfUEXqLUQlg8+bnjkm0vWQz4/MOGLQM1qQt9oVGHTfu+fb8CGgKUXjTEwGsjDnZyCP/rmDfD+WoOATNSzuu0a9mZ+X4KzjqG9aCyhKk+5zXvptg9WOqZFGMO3YMZWdVAtrNCAd0IU1SL0U2KGw2k16far8+pzwTuDq+AMYz39qJqHERczIh4BubzdzcbmWmtsWwApLOzRZykhhFpVjxgq3wMwsMsIH0EDXLwV+xEwn7pFZkkoKc3tKzKJxsL4QedHl4yE5+qAMsxaGG4FSG9VjiQm9pDYlDh615ot/ERl37o1Wvsk56n59JOuHRc8RFxASIF0nHqSqVgEs4y6tNAyvpI+Ir18TygxVwwSntEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laDiibu6gzO1ZLDJCfteFjS/g+TSMs5S8MWnJOa2CP7PESi77VZlQ45nvzWG?=
 =?us-ascii?Q?sqgNH34HFzEptiUxnyrgS73ZXKRvcopbBdQ1NGdnzppfJFkapm+2kI1NHEtp?=
 =?us-ascii?Q?R+rYz5sm7/0ZzTA1pyvtUkb6U1Qu4I3a3j9nxEvPgW5985nvdNy2bOqmSr5s?=
 =?us-ascii?Q?GEK+v5/iid9AvWIxB5nQRAeqZgNiXgcgsb1/DY/HRA5KD8ywaJmJj+IbaJzt?=
 =?us-ascii?Q?vapmh/z20buXtIjZ+vJ3SzjEUPsB0YMwD9uQ4aPBXqTtWgpR/H9F+A50bqhj?=
 =?us-ascii?Q?EZlbu+JIp99UCeGLVx1lWmr1BEvvmvILShYRi/tGOp4ANkHyLeLsVI6H+bjZ?=
 =?us-ascii?Q?5jExKenQ3am0QTPKWGliScrnpEKTKZRhO/dYbpWAYFCMdUwbgqrbSHmQ1i4e?=
 =?us-ascii?Q?KWEZWpUZphik9Z6KwnZ5wMfgyzz2ZnwOSyJAE3OEAWusrk4goxk4o+uYyMOh?=
 =?us-ascii?Q?SZy4dTq7DYRBXpLaWwRbQdCp6biMFBGyLZotNRatBah867Tnf2I3ZcLmcBYz?=
 =?us-ascii?Q?dMHo4h1FBai/PHQmpVQgKb8KXHMyY/sDtwDnB4NsZcI/SPMcfK6ri2ABYOxM?=
 =?us-ascii?Q?veIHe1bRnJk8v0zQYzQ4rmxcrWOKmxr2vwLj4lcjSLv8n2ziO2o/v7lQiBua?=
 =?us-ascii?Q?+zvA2lrcWswYrzjtkOEbHvX2GotH+t54BYVPXwqVyMndiX/Zs6cUI21wUddg?=
 =?us-ascii?Q?I3uomslUshqagFT2WAqO6NOxRFqypXKyyF2qHobVc/xjyTFKPmFsU9TOYucy?=
 =?us-ascii?Q?6qHtasI59YO1cLB6osnz1bKS3qpbwKHety4KT+6TtMTmZQAU2McHItuAR/Dp?=
 =?us-ascii?Q?mhpJhX+E83xg2owxGRZaUi61JyhXeP4BW67f2Z6KPJo3DJzLXFXk0Fm5sh0/?=
 =?us-ascii?Q?n7AI/qvaFeDtBks2YXpdfFSViPDMHAPb9JfV34s2iOOEmi2i2wc+yzD18hDY?=
 =?us-ascii?Q?572fsqYbmmOstHtg+Yp99WuXdkH620C5T0qnt8/8zMkWfy/7A+LdpER/uCpD?=
 =?us-ascii?Q?pfSb5zwpAHdoyeN/mhUsgkuX7P5DMXxA++12Oz7fhqH1WSlCB2taVSZkaqHW?=
 =?us-ascii?Q?Od1zi1kHNe1GWYgbCUAm/CZTAfbx8f2jOVI8MKbi+a1a1bySFBkZ4vjrUQjQ?=
 =?us-ascii?Q?2RviNv39ixix8V6Hd/fGxILMVRCvvfuekztTbyu0OKH3TzCQbmVV/dE0aHSX?=
 =?us-ascii?Q?maTIewT71ZBQy5g35NA4dvE+RAbX1DUqjWrWSxBDPDtOCstHakXaREgunw5g?=
 =?us-ascii?Q?vLaB8+PgatjNc8If2dJDu0QYg+ItVngacyUeSx1ychN/trn98FXIz1iWeW/I?=
 =?us-ascii?Q?P16orugzrdU2xc66FSZbcP3QX353XWr3I2Xg/pkcQVVCT581dXy1v/2QKTyB?=
 =?us-ascii?Q?O2/QaDaJWsr9+shcQ5V4yidNK1EjjRd56WOdcO1OsSMs0iwDkFtV5Ny93W/m?=
 =?us-ascii?Q?PZC8D5LHveQKL3L1fUoAcJKSPU7xY1rOhkrh4bGBLxxLiaiE4PvPZlNOQlUq?=
 =?us-ascii?Q?Mmo9NmbBBZdPNfxZ4U54Zb0Q+tX7o5s4yRcOZImNEh9Vd2ed+JQ/U89Gvk0Z?=
 =?us-ascii?Q?0nlI5/bcYfcmmYdTnNQnWcYd0+Dr9rBm1FR1i7vpaQpuNifFtjmnz01o3hzs?=
 =?us-ascii?Q?A2680Cw/mSWtup7TjxVZ4hJmYXQ9vAuKAqMd1B/YhSGRMQt9AtnLUjcpvqWW?=
 =?us-ascii?Q?IAVmGsdcRymT2+gQV0ADba7fyYY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb140f11-744c-4ce4-9b02-08d9c5722cdf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:42.1930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikf17ZvRB4myIknWBnErUDnTSZFhx5Y9Er8ffudh60RFCejQL6kABI7waG5Wdf1SzdyCj2kTMdspc4K85i/RqESLnq68aRbY5bF+/cTwqck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We are going to implement push backup with fleecing scheme. This means
that backup job will be a fleecing user and therefore will not need
separate copy-before-write filter. Instead it will consider source as
constant unchanged drive. Of course backup will want to unshare writes
on source for this case. But we want to do copy-before-write
operations. Still these operations may be considered as
write-unchanged. Add corresponding option to block-copy now, to use in
the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h | 3 ++-
 block/block-copy.c         | 9 ++++++---
 block/copy-before-write.c  | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index a11e1620f6..a66f81d314 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,7 +25,8 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     BdrvDirtyBitmap *bitmap, Error **errp);
+                                     BdrvDirtyBitmap *bitmap,
+                                     bool write_unchanged, Error **errp);
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
diff --git a/block/block-copy.c b/block/block-copy.c
index f70f1ad993..e2cf67e335 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -280,7 +280,8 @@ void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress)
 {
     /* Keep BDRV_REQ_SERIALISING set (or not set) in block_copy_state_new() */
-    s->write_flags = (s->write_flags & BDRV_REQ_SERIALISING) |
+    s->write_flags = (s->write_flags &
+                      (BDRV_REQ_SERIALISING | BDRV_REQ_WRITE_UNCHANGED)) |
         (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
 
     if (s->max_transfer < s->cluster_size) {
@@ -341,7 +342,8 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     BdrvDirtyBitmap *bitmap, Error **errp)
+                                     BdrvDirtyBitmap *bitmap,
+                                     bool write_unchanged, Error **errp)
 {
     ERRP_GUARD();
     BlockCopyState *s;
@@ -394,7 +396,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0),
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
+            (write_unchanged ? BDRV_REQ_WRITE_UNCHANGED : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2e39159a7e..f95c54dbdf 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -213,7 +213,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


