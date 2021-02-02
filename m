Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5E130BECF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:55:03 +0100 (CET)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vCw-0007E4-IG
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8z-0001ZM-1J; Tue, 02 Feb 2021 07:50:57 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8x-0001yT-0l; Tue, 02 Feb 2021 07:50:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsk6T2r4YQKgRZjECKtX5nO1vlP4Bms2WvKelu1/RjDlZIKkESdyHZ8I4jh777p8vc2MKjU2PzyAfqmw/+Fcn91JpFRBh0Q5rTQKLvHOf88chCPKfq2djJ8pJvBH/RuleWvEH9zFUlWPherJBdrCzi7/Umr0ig6iKXxptyTMxv2PCNigVV2+0Q79asF+jjnIqGmHBVhOFXmSB4lm5gwa1Gq99jSJrTJ/cUW9klkrqTzE2IQ1suaEyjL9E/6z6GeOVEuEeBx6Ko7G+houd1D0NciLZpjJvJKBNPOjC8qzdn9SRGAHYsT3e1TtmAUZGCczZjnH3kuhJdjFaYGZ1AO6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5khsQRSFypPLc4HZJGAoILFVNcRR/hm84c0jSSSPT8=;
 b=I4yfy6xe7acMDYbTDm5RgUwUjqryIoqD7nKa2p/wOx4elEmTVW0ktCUJ1kIqqd+wGHnhT9RzU4DbdaUfcee4Y0YQh8QVrvQkuIXAWMAyqBWKbD0k883wjWoTrmnjW2XZlJlPH1xSJK90Tae9QnI8eO9mnhPSaIlvvdDkqleQ2YuaNsa83C0t40ev8IsyzN1T39h0RAB9jCDDNHjWFl679DLzNfUMWEqW5nsmuGZ13cYw12AiD9/lknA2Nwixb8Y2B5Q/Fm5/XmIvGOt5V/mMfOnKJrI4oJA7iJEA24/u+bT7VujLyBVryLOx+EJSIfM6Ig/TPR0QZF0h8uyTaJyU4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5khsQRSFypPLc4HZJGAoILFVNcRR/hm84c0jSSSPT8=;
 b=qZwuHmAI6qEpf82j1SJBz4PZepPyX6pwnnTsJrq6t9F3237qZXiswc5PsLLuRoEMo8hKV4nvMMVY6YDU6TBFihpv4ZREyr7UmnbIFtIqHZsKGjbFzFV9+r4zVW4FNb6rvs7lFiTZC4U4E3Hxn4x82mMKdzJvb9rne7zACucsl4Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 09/14] block/qcow2-bitmap: improve
 qcow2_load_dirty_bitmaps() interface
Date: Tue,  2 Feb 2021 15:49:51 +0300
Message-Id: <20210202124956.63146-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dba8cdcd-5c55-4c08-9745-08d8c7792620
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35441B33E3291433F6B32A8AC1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mSNKehYDhkGya0/pWkNqFwzSQmlB7CKDcR06F6szMCKQwLiRnpgZOzMCSUESnMZdc5c2FKvGzqgk/jN+eWNMxm3BNLV9qXEzD4Ii3EFJF8SWsnLOGPoFmac4BgQO0braUIUnRD12Vu1O5EY7RIx7TCsHdt/IZXY8hjCOQFzshVQ/mXN9jeuVBYlkh1tUdpE4XyPbfbMpZ41tdtROt5viyCFhqUSl1MRKqCJGZS3ei5r1fK85jVkd4CASFr/WzXKwEOYzZrPUWlI2GNpb8573i8/u234sqWWfYk1oOgR/uVj48c0TjGe6E7tH+6hBwW78FSFvsaaokTIitgN46OTKrLGr5pC2aeg+wkgpOhSIuajkF2df9cjO8EQuG7S4a9QShmIXu/fq5RCt1NNfPXj2PYIgWG+BwLPu1F+WZONYIqOkptEK2dGso3YHDI9fT4So0Ko4qthmp84ppvwHkKxSAAGo7sJqnzjaQfB90NwZfyAnLLDRrx0LLCmXRhAFQdypNyqMyL+T2sjV679LEaKcn3mDY4dLOyFOMOkHB4ocOTLZ9WdUTi5zQd48edweh/T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(19627235002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9e8A8unp3UK2PfuyyX/WCr5RvxhKDXKb6IlH1rKVX+bZRVlECNLbvMuyeXgW?=
 =?us-ascii?Q?ZQfMJK8B6sn66uvP7e8YkVEffqfT7imFxCxrEgFTO76VVQs/qDfiUrPg1ZOl?=
 =?us-ascii?Q?j2j5BirJ9iBhXuuEcTdZSf4pbtfSTBrs55fPWPVYtMqXSUvRInvL8urgkoMT?=
 =?us-ascii?Q?UeTCyzdOt5Bnawx1Kg7mduapcHx0h1O8iodwFDk6zyjEXSkU4qeDY9J7WOu6?=
 =?us-ascii?Q?PBGWORVHJVXUbjshU28g+6AA4bkrXk2tFmUPW7S1SIHZLuGpvQMEZy2zmcYk?=
 =?us-ascii?Q?mQzAgxWXeLGQMfBiDxDZ/yWGvl8bPU9IvO9I5ttwQaBdQP1bIWoa/p/ogLBp?=
 =?us-ascii?Q?HB7qOxIliI8qVztcrJS+rgJehZG5PXegztnRdID7VUeDZq6qHrAdEdWlgwrA?=
 =?us-ascii?Q?98EmBQRYJSsQ0BXDJXMl8YwAaUtnEwzKt1l779zj+f9NIPMFa8mFmR/rv7rC?=
 =?us-ascii?Q?I19BWFfBoSUhamB+PHog0vC4TPI//wyOYMTAaJRNwk/h+FwzHHhWHrCbuGnC?=
 =?us-ascii?Q?W4qjcMN4zOTO+2DtxMa4Xry4RUbi/yHRUAlQiSOrHjUnOUiSp5fZBvdiZM7s?=
 =?us-ascii?Q?b9K2sWWutUopeoaMckbING/7W4EMYwZrT0qfy/rpZH3NDxv2/XwHucPuW6W9?=
 =?us-ascii?Q?HU3A+K24G/RjgAWqgGWMm1VYhbJG5Lv1H+HZxaghgfbZjinINJbSgHfC8WOU?=
 =?us-ascii?Q?mfjRf13ZZKd5aSX2xsYHClzs1UKhdHFfVu8rTDMOVJ8FoG5JgqGonH85ehsV?=
 =?us-ascii?Q?m/5fPRTAxZ+nTYUDMceFGqPlh/mguK6ZQW8XdtlP2NA9MS3VHhDSmKPIEihs?=
 =?us-ascii?Q?PbcHFskrcNGoCUqBzyWVPzL66eVKftZvtG+qLZAx+i90f99e40QuZWdNYqtl?=
 =?us-ascii?Q?nks7iKA+eivniELfeycwxCn9WRBCkA6UK+fcJbaR2YTgPvY6zBSCzJuPB7aZ?=
 =?us-ascii?Q?+lDH/8/OHsu2Rhh39Nzbh44gtpyFW/lhdhir7bsYpTRlJoYXimNT/huGhk6u?=
 =?us-ascii?Q?vG11sX8iMBK9AH3qtqQUYffChye7PlqWY7s2iZy0lunR2Q0bgEcvKzV9gFGa?=
 =?us-ascii?Q?RF5U10iy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba8cdcd-5c55-4c08-9745-08d8c7792620
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:41.9108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFQYFAI/PTNKD3ydn0eI6v7tlNLeI3nhOEuerGvpl97Ju+Jjw1ni7U4E5zHQshwDw3ULCtAz0K9LAEEk9Bsnnblg38xQQMdCxgEFfurGa+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.120;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's recommended for bool functions with errp to return true on success
and false on failure. Non-standard interfaces don't help to understand
the code. The change is also needed to reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qcow2.h        |  3 ++-
 block/qcow2-bitmap.c | 26 +++++++++++++++-----------
 block/qcow2.c        |  6 ++----
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index a6bf2881bb..d19c883206 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -978,7 +978,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp);
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index c95d6e37e6..8b28e4c576 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -962,25 +962,27 @@ static void set_readonly_helper(gpointer bitmap, gpointer value)
     bdrv_dirty_bitmap_set_readonly(bitmap, (bool)value);
 }
 
-/* qcow2_load_dirty_bitmaps()
- * Return value is a hint for caller: true means that the Qcow2 header was
- * updated. (false doesn't mean that the header should be updated by the
- * caller, it just means that updating was not needed or the image cannot be
- * written to).
- * On failure the function returns false.
+/*
+ * Return true on success, false on failure.
+ * If header_updated is not NULL then it is set appropriately regardless of
+ * the return value.
  */
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
     GSList *created_dirty_bitmaps = NULL;
-    bool header_updated = false;
     bool needs_update = false;
 
+    if (header_updated) {
+        *header_updated = false;
+    }
+
     if (s->nb_bitmaps == 0) {
         /* No bitmaps - nothing to do */
-        return false;
+        return true;
     }
 
     bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
@@ -1036,7 +1038,9 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
             error_setg_errno(errp, -ret, "Can't update bitmap directory");
             goto fail;
         }
-        header_updated = true;
+        if (header_updated) {
+            *header_updated = true;
+        }
     }
 
     if (!can_write(bs)) {
@@ -1047,7 +1051,7 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
     g_slist_free(created_dirty_bitmaps);
     bitmap_list_free(bm_list);
 
-    return header_updated;
+    return true;
 
 fail:
     g_slist_foreach(created_dirty_bitmaps, release_dirty_bitmap_helper, bs);
diff --git a/block/qcow2.c b/block/qcow2.c
index 1e83c6cebe..20d67bd9c7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1296,7 +1296,6 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     unsigned int len, i;
     int ret = 0;
     QCowHeader header;
-    Error *local_err = NULL;
     uint64_t ext_end;
     uint64_t l1_vm_state_index;
     bool update_header = false;
@@ -1784,9 +1783,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     if (!(bdrv_get_flags(bs) & BDRV_O_INACTIVE)) {
         /* It's case 1, 2 or 3.2. Or 3.1 which is BUG in management layer. */
-        bool header_updated = qcow2_load_dirty_bitmaps(bs, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
+        bool header_updated;
+        if (!qcow2_load_dirty_bitmaps(bs, &header_updated, errp)) {
             ret = -EINVAL;
             goto fail;
         }
-- 
2.29.2


