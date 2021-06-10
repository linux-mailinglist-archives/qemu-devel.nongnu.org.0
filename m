Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864A3A2A7E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:41:39 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ46-00041a-Hx
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpu-0003hl-4R; Thu, 10 Jun 2021 07:26:58 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIps-0004QC-7t; Thu, 10 Jun 2021 07:26:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5ZnfNsi3vhYNpLVSnCRqEJllqUdhLtity9BEVBOjVD59sxB2dpUBUbmMxLhSK8yh+veg2oFe2RFbq34vTobkGy2wEgm+PYxRd0S088mesOdSo6wKawo9YLNzax90AHPFBJJ7szJ4ktGmgfMAIecIjLVcQ5nHHeoVqLqHk8v5oZz29KZbI9rYZVffiDWfJPOjaK+O+LYysY0YOel+8Rd01zO2grk4FtPjL0xbk27dd1zjC+zECGer6sMtXxiosgAE4+DKkdPcmGs5Fyh4iu4vhhMLZBcmOdNQjgvTaCHWkRexLDv3pkUgPv3DeqQQV+Y4FIbLQlfQwFZO1cRP4U3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=getbLMpj3dele+cQ5kvwTvDDxj+o14XNdO4KWUSbQ5xk7sOYFYAQuQW0VA2tAEm0CbCObS9FTPRPIIRXG12wiyIgkE8aVR7jbhR1CZCz5J128h7wG12cLkw9LpyvNWANLHPQXpZLt1gCc3fonb542uufdvapP7ke8yTQjPHgETdzAisgbwJs1WGIXR15P83DWpjUdG3jFbsTIdyv0wQviM4BC/0yhry4SvXDJfgKn3fAW0ggvhmKTL1J8O4dCDJzDU/OP+HE9/SMTIuV3b6kBjXFJVJC9E1+aEeE4XNXDvg0j9mxnqZOhBYReNUqvIxHGiIfgZibp+D92wRl0tpn7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=dk6B56g5i6DneMO94yQMsc29GLUgGsQrrDkNr1XF6GFo1pf9KKsM5gve9QrKpOQ/bAvTExaamQ/oIc54a3IOqIYqJ2CIyFfma3vweNulksvY+1haXfTXHPvBEYnpOm361FNPtTlcwTshkbkhLbZmY4NuKs6h6J2Pw8FUw/99gao=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 14/35] block/copy-before-write: use file child instead of
 backing
Date: Thu, 10 Jun 2021 14:25:57 +0300
Message-Id: <20210610112618.127378-15-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d6352ac-9ec3-4e8e-7905-08d92c02a30f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381A6057DC1DCB2B956A05AC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2HGTO1OtYYvYeWDQ+O9pxscA4ujPhEweoXu/jdO4TThA7FKeQyzPcZ75AJ5A6GVJKNnDOH1sRhXDw55BAXrYZIaaBChb+GdWTSI9KQ9RUnehYjNK7EmGHU4mIlCUxgvptDGr/Po/JYETHN4CTGG1JJMRxTgbsGaN9FwJExwsZNB6xNzXQbdE55K3/u++BJjjWCIBdeAprGfkyDt1BIRKoxxA5INGmU654LEqrJcofLqZRgDwqgmpea06qQm9YxVVDEq6wfhTaRrvoQKWsGHMiCHpL2vqax0BDmIPyTFPpr9XBiPpk+14ilKxl1kdQNOI1qEeuLoRlSYws0vbWAjA2bcCYr+/vteO/7jRRHILnQjwiDWfNVMvZUTTiWsXJt11byMeusy/zPssmX8mp0yFtwFDtSgiKs8Lr7+/c7ZvYsOpKUyERz+t5zgqxEYvoCSIyXR/WWmF7BH81Mo9fyztJ6IJczMSO2SMmIQMM9tlyP3J+pv06VX8yTTusQs5WDk+AiouhfZW75OZTMFt809dKY+fbjC5cGYq5vcNBBhgHD3ceI60Dpv/GNpuvIYpCPwOnTaLtGSNrMNc6xXPHF0uRxVjy17XQ7o9OFpmqNj0ZM1UclRkPwVN+YWBjnIbkpuCqtKSzumQ0AqQA52xLSvu92yEaGQUPhairev1NXq1DkRkNGfY+tC5HTw6EAXuPypu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?089GDNne+TCdZkvKP7y9blXdAusw924pqxrYvG+dCMcj4V7j0zSMM2ZDjajp?=
 =?us-ascii?Q?I5aYjgqrxbVEHL311e+Y5E3qc1Xv1f6mAz4Nmpz5a3MYLdGDQG9fPFbEMMA8?=
 =?us-ascii?Q?johl+Gr4ZPyKGxg9Px4brGXp7DPqzVttQKMz31lgAMaBG0bZbBNqmLQby/Mv?=
 =?us-ascii?Q?5oI7+ZkpeOutGu3df5Chcr5w5hrqeRFnei8AR8R1/UyXS2fOSzaSMy+z2GSl?=
 =?us-ascii?Q?mOPR0LCJM09yJu2qHqbMcnFqyrRa9+ksw7nFUof9Ghiz3NuVTHIOStE7w0Lm?=
 =?us-ascii?Q?BjM0XRTiM7ltC7Wy7Ni3MEtWw2PgwOrmFvzmd+QZhE4P1AQlIG3ZjWfIOvgn?=
 =?us-ascii?Q?QqBoD+OK5oYqiclIOa0eWrQwqdrKtQjNczbEZ+FGKLoCqbWbatSYwFg3R93H?=
 =?us-ascii?Q?lO7z2eBaVo3ESSJT3183VKACPXDIkz2U0Qlvzl65VpkY1U4GnC0saX1+3Anm?=
 =?us-ascii?Q?yd1DyyEGsKFcdVSsljYEQbfw2naY0JHd8ndIsFswFJaT+dqX2ekSEGQGoP8I?=
 =?us-ascii?Q?fqe2lWnBmjLFQ7UyaOaAM9HuQOI1qIiW7szC6NWQcXUfP27dN14U6fOcLsCo?=
 =?us-ascii?Q?KtbKzIMyIa0yJRDSKj9dDV59IQSbp1/U6j53SnU+6k0Qi1MCX9pQezoV+xkD?=
 =?us-ascii?Q?7WLlRaGGqCZAxUO+dtEvR3o6DWpJ3lKTsmdXLEu6xUk2y9d2KMpFfU5t9oSz?=
 =?us-ascii?Q?5Zsx7u15jqsXx+sKmXgzoqvJl1j+IQfSgkraVq086/3yeUpjrJu6lqXC2b9a?=
 =?us-ascii?Q?Kwe60fcWkEMAxIa3y5lTrNy5nMCXVzf0JdiuNSHLsQZg1AtPvQJwrNf1IhoH?=
 =?us-ascii?Q?d47Nx53bG0BJCJnvKrxDNQ+KLzp/0SqNhH9asng4QtDaZ0ajuJ5wrM1yVdlQ?=
 =?us-ascii?Q?Tkm6QLeBKV9sDFYfYtjh4YEh0m+bfO58yH4AykeDKSU5WHa0sZVJiXexAuUe?=
 =?us-ascii?Q?jYEVN86b9QDanQk5U5eMriEoNW/EAslbFsAAyWM4pznIF3P/FVEozI2z5d0L?=
 =?us-ascii?Q?OtLyTZ3tOfpYum7Ywj2E9gE9NyqrRPdNivBOAtCzR7PzM8hCeDsDyiRSVkLM?=
 =?us-ascii?Q?Jt/Jwkze3aog51ah7H99xNJXMYmGQqPtNJ8/8xbwem8KB/EUiokepdMyx11g?=
 =?us-ascii?Q?Y+WaoScj3fD8xCFuzslgiOlj7VqifK/NS6sP2ymaJ4wvU9IBPJq8lBlgJnBw?=
 =?us-ascii?Q?W29+RtmU3P+QltyVznN6Df5roNioI2E+c32FBqgy+yRD7I8GGQtxy7eSDg4H?=
 =?us-ascii?Q?ZBZW+l5mYo2FCzfdtiVOR0RjRKT/PtImO/UmuEdwQcd8JHn8dSNzyuhA/f1Z?=
 =?us-ascii?Q?e720dnhTEjhnpIv0LcYejh4r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6352ac-9ec3-4e8e-7905-08d92c02a30f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:48.8057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYIqx4l+uUJ2iYjCgwaMpIlkFDxaCbBiOfVbsFtIpjVc6Twtt7iLpID1s2Bf23u8SQxJlTOiH3jTCSDQe1cwZ8gkMxKZ/2cePAZn9nWeZNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


