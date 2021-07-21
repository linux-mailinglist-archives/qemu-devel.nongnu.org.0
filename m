Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A43D0C6C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:29:36 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Tr-0002Fw-NL
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697f-0007Z0-Fn; Wed, 21 Jul 2021 06:06:39 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]:41470
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697d-00020J-IE; Wed, 21 Jul 2021 06:06:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9sJCiZ3bmz4uoOk+KTlkI7MI2RMfHQrffk2MBPvZ7ZlTMue2GdaS3/faw1EhOqBH/tE8fGR8UqPLYnpl5TOHyQ9OZLmm7ZwkT/JmJ03nk+Pp2RdvClOU3YSDo/an/RA/WT8bUhwY3cS737X4/S/ZvU75nUZ45Lcb2jIY54GbEBIdUR/3aI9JgqYIymwhJNoV1Kp4KiFWfHJfdR2J9c6IkJynD4JFLccXudEA1AXTrdXhqHKeKrzb0GC2H1CklglLO+Y0E6h+6+TKiR1CXLEjtdwpU8zyRWakTJqIf7KVotY74r4Kx5AIE5sP1DrxPrWwRwaA4ocMOPbQX1hLm+IPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=ZnB8nfxbNwS36K0ehibXzTxxnH6uOnMp5F5DgMcL0oMS1kENXvyXSLgyme15mzGRvKfHevTH6/KdCi9wHiKn1WKukAg6blaU16S2h9JmAXgjbKqIGOoFS0GIhzqcNbPsHDEP6LdI+Zw+fOfg434A5RaVr30ZEYxF1khaA/rlSjmjR7np0Iw7LeUyhKArZaJbucyIPC87zsMlU9KsjwK5VnJls3B04hREu7qk1nBIEI23jf2pST8Y1GsCFAIgQs0/bl6qBdVT4nG5fe4swz7CNTb/vx1Fv3IJS/OBVIMQu5u+CGnYd0cBS4/pV7/rvJdMAStnkXVy1ILtn/Lphaakag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=ks89IrQS9f1Kei7j8s1FcnIfYDyWGMY23QraEnm5i6wQDw/0rM0ZRxMwpXalrQFAT/Cu0c8kE6A8xOFIf0x+e1GCe9AHP4aHBZwaciZZ8lIKXcWg9KE3pC3fOJXu1o6utWlnLRgwkkiatQqVIeL2GYb40nRa8iV41WipBxjsfZk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 10:06:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 12/33] block/copy-before-write: use file child instead of
 backing
Date: Wed, 21 Jul 2021 13:05:34 +0300
Message-Id: <20210721100555.45594-13-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6dd75dd-b146-42d6-c5ef-08d94c2f33a4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724A0146E52BEA365C91383C1E39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1TqfGuV6ppCtrImp+rezoy42aJXVjasula4M/C5X3EQYYAPpGO1PwiL3MvjK+EUQGYXi6R8M9VkJMAn+SxE7qRn6Rq9Rnxabc8S17NH2VexUKoJH9vg6gzyAGNwEjLOHBZvv12QJMAoRSEU59OB19pRvFw1DXZO/yRaNF0HuRIrh5fAQkZqzgumaH0E96KHWWvueYzhuOHb1rqB5zMozbqzQ3l32CLPQp1NBKMPscLUmmOhDvFDjgg4s3Fx+CddRlQbHaW/JORhB/msCWASVvSQm1zTeiAWgkMOz8kSn2MzuYj4+40ZEZboJlQiZjKGYBlbVYS3UqibjKKchv7r8gJpDsSpOdjpJeqD/O2aloyM4eL46gzVHZNrRoWoBFY/fBBNXuBKBjpzY4Gi7pDjVDFweJHKvH83HQCMm7/bErz/gX3AaJDqlsmKc46NVbVWM9MgZN9Wr9F/IffpDHu39W7mPb6EubsIpBIKDRc+NS0p4+u1Ag28Y3NFkcPfL/o0g+zljwHI2iJBc5hhAaiX8ZhpqGrWg1dHVYhCpP0Lk9UzR1UEphAG3s+ZZJnxHu9mb9YVBw7QYgk5fyKmZx33ZaIUzT2NSK/hzsMui6fFPCyoZ+9iDFJdGlJM2wRZuVnLG3k23cxgZomq398WRVbjMKtrjpMSl2qKoslSFr/vwyok54pY97JGIJ4aQdDhU1SM3UMSk4Z1+Mv8oddvMBFmpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(186003)(6486002)(6506007)(8676002)(52116002)(956004)(316002)(86362001)(2616005)(6512007)(83380400001)(5660300002)(478600001)(8936002)(38100700002)(66946007)(66556008)(6666004)(38350700002)(66476007)(2906002)(6916009)(26005)(7416002)(4326008)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+HKooJRTTcjjPniF0p8msH0uR5HZHez7VperKP9U1cB+DhoT1zLVsictTSl?=
 =?us-ascii?Q?conqfNZD5bCEn+K2+4f40HPZ01pGAKGOambgEK3uwvjuVhUpnHLwyLe3rk0V?=
 =?us-ascii?Q?rcWAKmLVDeLp806fWao1V/WqyiylMHA38f5hRPM2VspJembJDDIitUgeygLr?=
 =?us-ascii?Q?YmoikymWt6K2TU2VxCO87NE+XTWopyp4lijhmXFMJlGcEEYOGjJQ/8bNubks?=
 =?us-ascii?Q?X3CCZT69yGPMIHNKdDiHaWsp0WEH0YLfbesYpqgB8pNNx60nMTn5TciiIL29?=
 =?us-ascii?Q?F+FHrwlmo1pC+WtdJzF+Mp1DJlCaFav0o4qk2GPgCeKLuGrYfKF0uXV6MVHj?=
 =?us-ascii?Q?J9lESQXn+aHYRH6r5PutlbsAhoXuzKeGCT08IpNEEIgTYNxVjq6bifezGVzO?=
 =?us-ascii?Q?PwhqHgeieKHyZZqGYCaUrMz53JgDiH4q5CpN8LU8gDt5WnWIVc01e3bGqrTU?=
 =?us-ascii?Q?a7QivHKdHv46ifkOAJdieqkWfTQUyCHROSt6xAWznQycIGzH8QiWSd2ACBCt?=
 =?us-ascii?Q?V56Bt9JSRpc+STC/IkG+SS4Cz6c+rRURg1z7Kk0lJtcVlkwNvZz+GSfXIuFo?=
 =?us-ascii?Q?5736MGFCEiAJV7tEQjdN8rjC41tbqSnmKytUsNXzI5PQRr2kgd/+thdIn9w6?=
 =?us-ascii?Q?/WVNZaXeQ1O7o0gxQWYPiypu/l+EAbHCRMvJCzFMsI0uS2iCWh4uQa3MHlEb?=
 =?us-ascii?Q?6SlgUn7YVW9p/kpzofCWzXjMKvNTgvjz7bWSC39cAOeRWllHxfU4oY58aMUP?=
 =?us-ascii?Q?n+g/KBZxQaK8pbn3gC2mOjkLhXvgKpGGpa/mQ/Pk1lQdskswyhMSL7dTu14q?=
 =?us-ascii?Q?BUUkTqTxrRGozlQINi2YO86uC76F2SMlqxV5XUucUHtSq/CUjHEwBZJswT+A?=
 =?us-ascii?Q?KOCdjiOBHoL601kaFsNAdgCSWc+DcEbQYiPsfdMU2rxkH+ZW+1MJKhxQdtyl?=
 =?us-ascii?Q?z/+JUuUgOOMvin1j6kz1LItzarLSIs3i0iM/dv9IvgunhfXLlKHxJr6Wyp78?=
 =?us-ascii?Q?ByQlcca8p9KNrBiXyJ+EDMip251rhy3YkfkhRWMfe6aF3CXNt/+Udqp51V5E?=
 =?us-ascii?Q?iugbOetScDohf/9J/DLvoEtZe8qwGVGOXzsuaRqw4B0rv3XkTkUnSQgiGVHI?=
 =?us-ascii?Q?7NSLN2uRYUqz44kGkqw1H19lNziMKdJs0m+POft2FBMGumIFYBagtT9keFAC?=
 =?us-ascii?Q?18RYFq/B3mcNgGvRo7wHrJh7k5vlpT5D0vKgoTzbjAzZH3+YPQjiIZVWtq8Q?=
 =?us-ascii?Q?fXtA5naIRjWmXU8RYk0qxBp0RAqYZycHtCl4Ev48Jbca3HKdies7C643T8t/?=
 =?us-ascii?Q?Cxjh37Uwv07Wd9lRFp3dkyHf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dd75dd-b146-42d6-c5ef-08d94c2f33a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:26.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYTnoxkjxN5vMkUz1BJ/XfQEpFjx9/TxlXOWp5jAVcenQEppAPs394qNGYl7CYPCqYfhyywqXUdoloGiOjDqUQX1lDXRpYU3RKmpXokg3Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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


