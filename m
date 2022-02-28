Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30AF4C6B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:49:52 +0100 (CET)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeXH-0004ye-W2
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNk-0002C8-UW; Mon, 28 Feb 2022 06:40:01 -0500
Received: from [2a01:111:f400:fe02::714] (port=28447
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNh-0002NC-Mc; Mon, 28 Feb 2022 06:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkgh63shdASSq6TjtHQi+cVihpSXp7oNE1SEsDVtMCL2MtfYVah6XnWfUBG9KxBOjOa7AqvS0GfohCkFdXKdJul9gIZQ7QhOTZg2kiTFjmXtzNq5zHgp8QGTldi6FwemPjhfJpMb9rCoOmqVNSwRi7+PKOHOZU6be2YrWhOCJOs3G+sWj5CcRtENjZMuGdGoveqTSzOLbnnQV/3ZrOI+BDCWFYUTvrWhv9f0m1heerIXZYSivw6/4EtnyPW+XdFL9/TkO4uvQOaVWFpMQuUDghv0Lv1JZIjeZvzxgQWd+8eohjUF6tzTXaEyooAYS5VnSsSpe7V5OmWtJMWa5IEckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQJuR97fa6FiCUtWQahNlOBLFee18TTvSO1rbHVvPVw=;
 b=gAiWzS0ETC3VGwPna1GWZ5Fud156vei7SOqFwpGaNBKfB6W9FRGz45SHNyKBpVCGpbUuF+HpnK+ef9SSdSszIaSda3lI3Py/otVHvrKWCCVtB1AkF6CMMEhQZFdMWJwnyhoRNJQfWwcle6JFKN0vlxti6vCYav7D8NJl0CSPUUTehAZK+oweVmcOfpaAt38SWL+HsupPEn7jirki7DuQQbwDsDX4ZjuWi40V2VEtgiERZU/VcNYViiynNOTrzwABFCPVLrDo9ZCSrjnCdi5cgyateNF+qr6zyngWTaHKAgzgo5cAgQNWqTeD4hW+rNwjN6rR21rzHPuZioJHOYiUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJuR97fa6FiCUtWQahNlOBLFee18TTvSO1rbHVvPVw=;
 b=TTghKN0KtoG7WmvQzTzIpUwaIx2vph2vMzu+2NNWUH/NXDyU4YA+J0f5diIWfCluF9uRK7XOTU085ZGt0lG720TZZUQvSO5NIbkE5H0RUDCs3HlhcuvsS2u7UW12fIZTZZmet0t3E0tYddEidL09w/qlEOz3IYnMQxzlJ6ArQxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:48 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 04/16] block/copy-before-write: add bitmap open parameter
Date: Mon, 28 Feb 2022 12:39:15 +0100
Message-Id: <20220228113927.1852146-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72bca627-fe95-47ad-cbef-08d9faaf0629
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB22727752EAAA4D24E5178065C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YguXD/5eEv3UpteO8UEVi8x/vGBxNlFy1zbXOGKups+6FtkcuCRQw2mcoEgHJmVo+c6tq8CU/rm18ri1sXY4i1FZK/n/ZOD9M70AQ8QCnw56MrIurjTGpnaK7BPbismbqGcPV+YmbruQABw9HJ8qiEoO4EKzifiMHYEmnpx0Ax7XrZOhpdZwU+zTrsOGLklk2IDBnHfVJk4R+EIgiC8p1WhFoHq5S67SmFx5ZT8Ri2puHQeLL/8SQrpTXTZUDq73mbeqCTq2rzZHFth0CiOcND2OgxvcWG7KH/hGheAOV28Y3WERUxi25+jTZWkAYiKso0DCPQXMP6qmS69kMAQOhVBsFIKEoEsSYWgDx8dV0+XZ+pUL2P9iL/i17SWjixYq3JTFey092u/iKn0kB+6xKY11LQCfnTIN0AMDkl2HOo1OrBXQqjMsUyGD/keG926gFHTDDTMl6QFhT6zhQ9xNMkEKTKCy4N2dhHPlxsA3Dw1hXntBpoGYD3Td37mSleqWeOge6ljS0y0RehuEFbEVvL1PXzUiixLVI0ieOXK626THSX3sy1ftioGSgdzftAqoXxb8r3N1lVcM3lqDTk4c48LvCIFTfMOkUFZ4zOsBzfLKJQz5CbXjZucGRRKHlo6Snj1+nhwxUA+gDjp0TKaDqHt8WXizUb0IyipQb2eDuWRNlkE8wKCMnfnivGuauOvsF8LPQlEEW0/NvSSPxIcLUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xq6OJ6V58Xhc++O83GzMgntsh9QABYjqmekwSDHFhT0+Jx0RDV1D+2jYvmZX?=
 =?us-ascii?Q?vkwa9lX259Tx+WPkolALYbwd8BzG25s7aXevyk0KPRxZOGTxz9OerX/qX6DO?=
 =?us-ascii?Q?DCqLb/5Ht/aHeXxMB+7mRa/Fa9zn6pNX6hl07ps+C8DVc4FYk2Ss8K3lW8rm?=
 =?us-ascii?Q?ZMJQeZPj6QBkQweRud7Slmg9YE363C1h/SdI1/Fa7Q8AZ8ZMVbBVVUQPW7d1?=
 =?us-ascii?Q?HQZd4DE6aIzlRF2H/9fkaNDWPohSFOqPVSCkgAk4C6kKfrIzVFGoGSgljvsy?=
 =?us-ascii?Q?KACB/hfDylCrLOBrAY7jqg66KzvkNKVp4gL+o/4V+lIpZNnlxsGCW49xx4RL?=
 =?us-ascii?Q?aaczS100gZMUtZ8uoIxpcY07KULDgjEUAg88PDSslIT78C6PT8rcMDhuemza?=
 =?us-ascii?Q?gzEmuAiFhdjRCkUVnEH3ULy6aEWgdq0mafkAuDCSMpAxCZggMkRD0ajEVtLE?=
 =?us-ascii?Q?CcSA5w12DlJg3xV7tJWhtQFMFj/1diMRH2KRKUHxF2Y6NcIdloK6ZL50RdBC?=
 =?us-ascii?Q?PdRWF42MJyRe81TcL4RsFCoOyXFWXM62bOETFApSvBiGN+FBfcdtg8n9Jbjx?=
 =?us-ascii?Q?UzEzu8YpSLU4y1lUPGd92HZB6OduSmMj9xKEsFHWnAIbcFppbJlJnRODTB7k?=
 =?us-ascii?Q?3jB0kufJ1AhqjN8uebXzlhxz6iuzcPljxoPFTOdogLH/eJ8VzD0ijWgFpDHm?=
 =?us-ascii?Q?D1H+DGSY2yO/j4hD+JYnsjjTHLZUGZUMREZabIAkgypvYKS0wPs9dkIh+H+h?=
 =?us-ascii?Q?CVzPba6DoErkwuzUEKGheDC3vrV7y35dO1ax4Lt6rYvO70b/6u1P65rLxa5q?=
 =?us-ascii?Q?z+TXAmyfYti2OoO42ed9CYn6sXwjrfxWnYJwF7IFYUxDBecaf1kVZsWDdkLd?=
 =?us-ascii?Q?CTAw9brTYWlUJkmkrDhFLYTVA7j2S8aGDaUR37pducm+nYBLzcZc1KrGhh+7?=
 =?us-ascii?Q?2UNoYEr8QFvvyL9TTYqn5yAfK2vLplvH9nFFuycYQ0BT50fd/LnmYDbWPFpZ?=
 =?us-ascii?Q?cQ86HIzPEw/djrV1k53LoXAj21HyQ6WHndX1Fy3AdUv3e/T/G/1ji8cQUlWp?=
 =?us-ascii?Q?Hz55i2sVOxIh6Y8gnD0xAt8rW11ja/iBmKCe8LXbW9WM/zdQkQa7X2dQjtG6?=
 =?us-ascii?Q?obFmc48zUlEaUPx+K2r14ICOzc/riLTHzXmOWKbY81DiNBo+oHjt9DGHR91B?=
 =?us-ascii?Q?W5bZpYVNJpQRozVpEidh+XQcXTFAFvXBK2JqQ/qIT8BdLI/41GmRNTrPIslJ?=
 =?us-ascii?Q?VGC/CuLPWRNw4gRtEQiNzb29S2pe9xjanqAcjtfJ8/MeNsNp2jH/jGeOO/HC?=
 =?us-ascii?Q?OtNtMwRUu0G0OYj0dh+/5288kBQjPp9vokYr0exi3xumOQ0tYIRsfpdp/9Z2?=
 =?us-ascii?Q?WB8jMgrSdOXv1E0sVb1nouXe3maP7W/v1UC8ujkBbN0V1UFR3B4F0z/ChRMO?=
 =?us-ascii?Q?j0fyWAD+RULz+wSFMWGB1y1w9KXqxVVJiB+Rpk8eQDyaifmOQkW33pBYCYhC?=
 =?us-ascii?Q?D4QFNw1/2EW9l/AkRJ38HJSVY1GQDrWpa/3s3wVgFuWu1L5s9GjgZJFxIu1i?=
 =?us-ascii?Q?ZXFOFiZYIzyiAclRLWw5n2iPtixkYtUiUszeAXnlk1pVIl06pXSHbkZZ+S28?=
 =?us-ascii?Q?uxz4pP+G2UPK3k+k9OktEyEWsXCM5fEUw+iOpKodF+hPH+QCtHu1Ub8X02zA?=
 =?us-ascii?Q?hEkqXY9zbKpNLTvOYHg89hSJY0A=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bca627-fe95-47ad-cbef-08d9faaf0629
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:48.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WPJN8Yq8a2Kbvhdk9Z5rD8CQnhWjQGzOPuxJXzBWlwu/H/wHj+wpu31Q8Hf2Dgt+YtdUlDedNfwc8ekVyr+AaC/iTHeKG4K0Kq3481/Dhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::714
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::714;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 10 +++++++-
 block/copy-before-write.c | 51 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..ffb7aea2a5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4171,11 +4171,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter. (Since 7.0)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 799223e3fb..91a2288b66 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -34,6 +34,8 @@
 
 #include "block/copy-before-write.h"
 
+#include "qapi/qapi-visit-block-core.h"
+
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
@@ -145,10 +147,53 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static bool cbw_parse_bitmap_option(QDict *options, BdrvDirtyBitmap **bitmap,
+                                    Error **errp)
+{
+    QDict *bitmap_qdict = NULL;
+    BlockDirtyBitmap *bmp_param = NULL;
+    Visitor *v = NULL;
+    bool ret = false;
+
+    *bitmap = NULL;
+
+    qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
+    if (!qdict_size(bitmap_qdict)) {
+        ret = true;
+        goto out;
+    }
+
+    v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
+    if (!v) {
+        goto out;
+    }
+
+    visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
+    if (!bmp_param) {
+        goto out;
+    }
+
+    *bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, NULL,
+                                        errp);
+    if (!*bitmap) {
+        goto out;
+    }
+
+    ret = true;
+
+out:
+    qapi_free_BlockDirtyBitmap(bmp_param);
+    visit_free(v);
+    qobject_unref(bitmap_qdict);
+
+    return ret;
+}
+
 static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +208,10 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (!cbw_parse_bitmap_option(options, &bitmap, errp)) {
+        return -EINVAL;
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -170,7 +219,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


