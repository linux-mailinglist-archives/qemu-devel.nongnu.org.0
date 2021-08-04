Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090913DFE66
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:52:12 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDZL-0007kE-2K
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMm-000594-KK; Wed, 04 Aug 2021 05:39:12 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMk-0006MN-MC; Wed, 04 Aug 2021 05:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUEdrSYdMbiAR8aasnk48hSJxwepfWCO4OxF0kPW12ygkPguRG2ivbMSZwXWm7b+YjUgeiaYu7aFDWTeW8zEaa9iCn5hRCEX789HU/mAb2MHd18AUKoIAxE1SDW7l+X2eLEc5MSeUEVtb4sJg+v9kgsQDYxvpV+tMfrUfCwTyRvD2nWECbQ/rNpFbPZcYYWEkj38DXpDSkWf5KOTWqyvC65ln7mLZA6y1AP+N0QCZQG1GGmo2fALnslTda10GtD45i2ucH1DqrJZZhwbyQLYAezOwVygZ37FP1/I9OwAio3JScDbf5P+Mi7hO5P0k0uV+7db4uPp9Qp4J2qHV55Q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=lR20ntjjaM2kroQoNr64QzAFJNADI5sTWQfrRlxBxpZqvkp+oP8wjy2TmX5mHlaA5CRhpD4Hmy3QQg0XzbEvcMMhhMoGWkBNHZ/IbS3NKB94ohaec8ovEaTjbUHvL3Gw+WQB0cgiAG7CnE0JDR6iH/SOiUYIoAyiPqfwTsfRA6EbIAK2f/AygeCZ9neO7yX3C3PlsUdsSGO3xqUCAr+HuDy1yTHgzXAEQjsKQokB8bDX5H2EKdvn5JXuFFQEbBtD5Hxjf0V28AsJFm1VFBzLSyvgsN6hWkF8iIEC4sA7XzhtR4ig41ddlHlh4F+bZlzwOHSxJhCS5WLRk+GpzMzodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=QZ1UErfzWjgfFb7T8N9wkQYdu9pMnFpPWng1D9+K9ykJdlK6fb3fIxWVDmeZ+lhTfGjph3IIDPwT44fDucc8r12mp98uVv8ejy1sm6MmFf8wHr8JmycpBTq9WrZQNreoJlsG3zCywyCk7hHwVlFJEgVCn/raAL+7sCV9dfscQtM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 21/33] block/copy-before-write: make public block driver
Date: Wed,  4 Aug 2021 12:38:01 +0300
Message-Id: <20210804093813.20688-22-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c635a497-f6b2-4116-3576-08d9572bb41c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689EB4155A7B9C7BF87DF59C1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0o/0p+cG+kU5aEKsGcjNsK1E8NnL0UHp59C2+LOpUeij4pdubRimmKUfW3BRdk9n550lArQAmcEq+F9aYo2zw4PQIMmkz0yN6EXt0PwKbgkb/vUD5RrqGJNZw22blnNfXRxA9aWI3rDxs4lRhwZIORmnt+w1Wc8jfWzdENFKUOpEDES9fNIOhhQQbhE72o3j9a4jH/VKpeWAia+8yVeCIGT9CY8iWMQyk8vSw5P7bt97qk+isr6xOZi4H5bU7OeUBFaO9dnEU7q6PqxvZWKUvkO1H+hfS8WEebp0Al5QYcsFhhDyq27YQWOYszo19RO8LrLOp9Pp7NVDGcTwVsW2tIPyhqNhwTMlqxTTHTkNQnc5JtEx5hI8ruzGHRtSEyofJ/STaf2hS/utFnWWqbhGOGkE9dA+BMSatTNBtQDSN9KZOYWDO9C7+Btqc2Cshl6hep+dkn7re9r2VBof0RAhYXcSkS/60rAA6ggD4/+KoLW5GyjGez4xoQbVhFwk4Ka0FYfH1nh9r7SA8RJrl5Qz6IxYdd4pnp5rhIZTC7eJcpkYXHokGL69YAlBtChvk+l+BFdXGm8/gsYP4E2OqYRnqVq1btA5XnwWYWu2abpEIeo7Ddbs/ZDAKHzf/Gp02QEEZpT+TRicUQTwjk1LFVJfWsYPDFS40MUjf05jOIEQu0cLR3gCEPk1Exhaq20nDWeL6+um8HQ77sSqfF2vJ+VBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CFjwOY8tu0kjWQgMzUaJ0wt5FC4ujm1Ltl4QF7u+9D5fdlpDk5WHd3ONYLUc?=
 =?us-ascii?Q?8mAwN+ByWdwiFqOE5I6iBMduoi9hjOHHBmcsc/txibeGwSBPohQ4wQHG6vHN?=
 =?us-ascii?Q?oe9aZSK1zJYXYjmf50XM/STkFsX/mMWjFPozFilIo6zjF8AtQL4/Vwg/jEnq?=
 =?us-ascii?Q?hW4dAEQpUb2UeHmo3JQLIcf015qEARxeplNexcpn+RmfzXAP2Ort7NKgJQ3Y?=
 =?us-ascii?Q?lfrA5m/RJtEEOsBWka7TiAm7OsZZcVhKKZcC934kEO36sZGrbnL5WvwzalPU?=
 =?us-ascii?Q?KoTrCRUaR+aup9uNflhdTHwqDf8ZoV09YpXRGw9fXPG2j22+YAj/dvb4XgfW?=
 =?us-ascii?Q?XzwrBu9oa0+9utUKH6COnrc256YaR2m0oMR6evKoBcurEZVhDwZgvl2VE25M?=
 =?us-ascii?Q?6g7we9JzA8xKc5P1d0jNIbMy6WkThfm0z33ELSrADypLMKpWmTyG/lfkBPEr?=
 =?us-ascii?Q?JZ6Yrj754q6CgCsfTEDkLgPZfPr01sIP77lqqcnv3HiXKreU1t2O+aRL4Uk4?=
 =?us-ascii?Q?s7PudZNafZIjW5qkg1o6VKHIMOMdYsIm7u6gEqCEKqyfT7Rd2BvWvk0h77qf?=
 =?us-ascii?Q?v4A5W0lAvmUx0/cCbVyLm2KFTglegdDakAcGTC3IcPAphDqEedBt+50ZbY4x?=
 =?us-ascii?Q?/MOwPz4dpc7Fl+1fYfzFqVyVBBAzHUkXAG00IQxaK4E7BXIJaxL7krw2J7a+?=
 =?us-ascii?Q?qbjoITcADDOJRtWetu3eBAI1OUH24rCIwSx+xaXGkomD+dVis2CLVhxIoPgl?=
 =?us-ascii?Q?6h125vDeIjmi6USkPAGaqgMfpfabABM4aMqvI84hOxiRSBV76naKhvrWMY/C?=
 =?us-ascii?Q?HYj2gpYxdxoiEMJEEWaXazdI+YkRGQrvOgGc1t6p1GEI9W5ntHTurU0BIFwL?=
 =?us-ascii?Q?ntY4adhkJ4U5DVZRVIYD5PBQiB7SHhvEiKCYw2Ub8ryP6zh6VC7C6JGfD3db?=
 =?us-ascii?Q?iv+8fS+HEtjhVuK6QQl5WbuHUzj0IGRAD4ybKEpVs+cI/llBykM040vP/ZCk?=
 =?us-ascii?Q?aLphYOJbwmkTjyyg2Nf/IMQhUomsUL4EwFJ98LhOlo+hFCDGam1OfrMhibKI?=
 =?us-ascii?Q?mgwdKg2mB4XDUxNvtuTE0A4jgvalC565oa4nfwbzC6jFSWw7MNSKqF6PU8eo?=
 =?us-ascii?Q?aKdDyn7lqOPsXj5D8LpETwxX7vRTzfwXZnA++LzyJQo/Y+PCmxbD6Qw4nqas?=
 =?us-ascii?Q?/sNsFmdRPhZ3XI+O4Z2LLW55zzJBnjPPnF4Q9C+M8G01/2TQbYUrPgb4NrJ+?=
 =?us-ascii?Q?cIleigBeF/3Ery3v8VV0BONLe1tuoK5Ym/9QuHSxHjhDeXyDL98w6QGFd0gW?=
 =?us-ascii?Q?kVEAV1YvEU8aRedShbscoo//?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c635a497-f6b2-4116-3576-08d9572bb41c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:06.9023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kapm1307hFvnETpulgOqVXeKNE1jLCh+Y/z1l5Mb+fRvX8yOSR+2YXeIQgKirPRjnvhkCmV7hy0cgiUVh8wNqCA1lPESWYD8YJk9J2KhvZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Finally, copy-before-write gets own .bdrv_open and .bdrv_close
handlers, block_init() call and becomes available through bdrv_open().

To achieve this:

 - cbw_init gets unused flags argument and becomes cbw_open
 - block_copy_state_free() call moved to new cbw_close()
 - in bdrv_cbw_append:
   - options are completed with driver and node-name, and we can simply
     use bdrv_insert_node() to do both open and drained replacing
 - in bdrv_cbw_drop:
   - cbw_close() is now responsible for freeing s->bcs, so don't do it
     here

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 60 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2efe098aae..2cd68b480a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,7 +144,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
+static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
+                    Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *copy_bitmap;
@@ -181,10 +182,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
     return 0;
 }
 
+static void cbw_close(BlockDriverState *bs)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    block_copy_state_free(s->bcs);
+    s->bcs = NULL;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
+    .bdrv_open                  = cbw_open,
+    .bdrv_close                 = cbw_close,
+
     .bdrv_co_preadv             = cbw_co_preadv,
     .bdrv_co_pwritev            = cbw_co_pwritev,
     .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
@@ -205,56 +217,40 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   Error **errp)
 {
     ERRP_GUARD();
-    int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
-                               BDRV_O_RDWR, errp);
-    if (!top) {
-        error_prepend(errp, "Cannot open driver: ");
-        return NULL;
-    }
-    state = top->opaque;
-
     opts = qdict_new();
+    qdict_put_str(opts, "driver", "copy-before-write");
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
     qdict_put_str(opts, "file", bdrv_get_node_name(source));
     qdict_put_str(opts, "target", bdrv_get_node_name(target));
 
-    ret = cbw_init(top, opts, errp);
-    qobject_unref(opts);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    bdrv_drained_begin(source);
-    ret = bdrv_replace_node(source, top, errp);
-    bdrv_drained_end(source);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
-        goto fail;
+    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);
+    if (!top) {
+        return NULL;
     }
 
+    state = top->opaque;
     *bcs = state->bcs;
 
     return top;
-
-fail:
-    block_copy_state_free(state->bcs);
-    bdrv_unref(top);
-    return NULL;
 }
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVCopyBeforeWriteState *s = bs->opaque;
-
     bdrv_drop_filter(bs, &error_abort);
-
-    block_copy_state_free(s->bcs);
-
     bdrv_unref(bs);
 }
+
+static void cbw_init(void)
+{
+    bdrv_register(&bdrv_cbw_filter);
+}
+
+block_init(cbw_init);
-- 
2.29.2


