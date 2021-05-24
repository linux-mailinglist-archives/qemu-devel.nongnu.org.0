Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE038E8A8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:22:43 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBTd-0000jG-5B
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRv-0006bK-DK; Mon, 24 May 2021 10:20:55 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:51129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRt-0006l3-58; Mon, 24 May 2021 10:20:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1rUCHDOJ7/n1GsJ+ymdzEigqu9p7ysQM5m69rej4zoZ810s7BbTvwYjrWuVArXDAhrhnCfsB+QLSxILi99X17wrkPDffmtW38LPdC/CdzrFyCvyCIlUJ5MzwRt9K8Y2apWOov7JXtUhf6GOzfnNIRkdvn0/6F1EOrokjwEnIbtUUZ+bqisrxnW1pqtwCvg8jSS7K/AHE8m2bvm4nl2yXx1cu9d5oaKAZb2z7d9Ycp31VUUB842r1XsYtiMvcDtfJoY5TufEUrc0v1uATVOc1vA1AqhkZqkOSRSqZj+QlR2j6zoQLLlpx1hX7KaOytcci2Dh4DKyrsQtPIovboKWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hngAEev1nxwNGEj8FBZJ7ONnW4yWK2eBr0gvAaO7spQ=;
 b=KAW9MZAaHy1m2uk7zadje2YY19CY7PzdOpEzGUaGeINq28AaqvlYSZ0YEASPuNIKDeTi7J6u7L8lzZew1z7/w9gxd6lMglV7trxp0QiLAZLqPY689UkeVhBH96VlDW9YDMgndiDS79loal9TucJYSdWA/OEgZYV5oHXjKGOSvd4CJKAtO3hCq2HkJfqlebr9XqMWc1ke4vF6e/ND/XeMOYSd+ze8gijkHmi0/ls8Hsby5nhz8rU5TjW1SV+v2sTJcdAvCMjFREcKQAwe4qy++LNCgPelRL7nqumpU+2uWDXMTzYWr5XmR1SdsS3A6El1Eop9aVke7rPa3RXSbShAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hngAEev1nxwNGEj8FBZJ7ONnW4yWK2eBr0gvAaO7spQ=;
 b=AlXvZ1yAD2s0hoUi1G5KkI1YyImK+4c/T4Q9tfN9D5oyFO6/zpWDsosbYweK+cVfuFNTnRY5yOeE+HJ5X1FoqCwyd0yUXmrAcp0QQfngrTTe0fIRTC+wmjodhV2ipQ6pHlzwYtGiRbTENdTLgskYJfdu8fOyv0ccAbmowrpKu+o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 01/10] qcow2-refcount: improve style of check_refcounts_l2()
Date: Mon, 24 May 2021 17:20:22 +0300
Message-Id: <20210524142031.142109-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 878c28e9-d224-4e19-94c9-08d91ebf1edb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB416505121CBEFFABC0457B1EC1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LC/QVLrEc6ztuU6AqmfPRawsrVWUQHTrG4WPSks9SOuhMebgCoDcKchOcdS4tUbAKLlbgYzyz4pBQ0x1Y45lvqwFreQ2CNSzLQF+JUOLJXOMye4AUSR9DYPWr0rsAcEUhVGK6arvIweWFIfS56oDqR20GwrIThv3J9NydlQcllliv8w8wsqLS1/0g5wq58PFgjjiNCzt5FQ3EQQuviLavg+/nv4Gz9Ugr+8OOBwvuFAwlsdAcHWrCLJqv0MARz299sS7sVx/UNV+sq+m1TvhXIyuG+TTY0TLS7K4Q1DT9dKUYooreM1yOaPZ9Xd36D66oCjYgB8fN4k2ZOWp/F8u2kEYXLX/KC+i3rjqbVfmcH1fYAvp37J+cxVzcNTuamQ23cOa/amFlIa9K5HyNRyeGoWwlfMrDrPA5qJWqGmY2LiWaZPJuHfNaogLu4fwMBD38keyHThJdylvxGJgxxfKmOE2XsBkQmoL3OkX35HZ+OCgHV2C8zCCz7X23hWA7Xca80ugk76nq5v+CLE0uL83u2c2Vpb1LiMEDxD457NciwM+I3WLzFFgo1UapnmzV7K4qIAz/CROVjNP4liBT6fKrsvu6344D7FVOzdFF98ZUMao47fJYpimKISwOicvSsXtFqOuGwjTFqVWGtjvPvi0hKcPjNH30zK99P0eyhgrLLMeEAYcde9sVt7QrJYxGEq6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/gsUAJ+zT865DKqttwE651mKxwWGbDH17rAIKECrhc78uXKwnfakO9lEETvT?=
 =?us-ascii?Q?nOTf8zLq8lcoE4I8mYZhZ1PoQugLDYGeofpdlvoiyFxqX6eTguzO5wefUgNV?=
 =?us-ascii?Q?sKBPaVbEF0RLbytee9YbiuaiEykBWPhMkPI2tVRloQ+BF02vxBlxVNndjAbr?=
 =?us-ascii?Q?ltsh2MhMDfQYIqQaKgNl++D5G7FSHRQ+mMhWvE+ffpXFrxYzI6nNhyTP11Xo?=
 =?us-ascii?Q?hFc8JpTHXW3t392csoqRROHOtkTYHtDDuGgX8AaCk6OhIgLPMp9rr1U5u0rp?=
 =?us-ascii?Q?P0efxFIdwobrlNLQTdsEMhvKE19uYO8E78T01L4Dd2ka6SXOmmpjrBV8CCr5?=
 =?us-ascii?Q?hHYtp4wCJFhY7KxkasUuepB4Pzwk3gTk/+LSpsmCOILhXG+XO0oPd5CkpDHz?=
 =?us-ascii?Q?DeA8JAz0uunK/yxDOOKKFzs02y1ilwFAPvaeP75yHY/htIk9rxcaTK3mMcva?=
 =?us-ascii?Q?GY925xCJ4tpCZNqlMesZXzfT/ORlU+ZMrq+mP+3dd+4WKUHk0bBgOInPAy+Q?=
 =?us-ascii?Q?lUkWZbZfTkHO10vYU2o7SmALLwUqJm2zrUfvA4Su5q7Um3G1eRh7VgzdZm9P?=
 =?us-ascii?Q?c+6dU9lkbRx/OVD3R9N/0n1svaWqmjr74S4nAgkzXD94/AFEXhs4v1mffgwE?=
 =?us-ascii?Q?6w6IpiH/E34bUMwe8+RwG0qaUMNnSXG9v4jD2CYgGYv43Zrt967hfFFw3rqt?=
 =?us-ascii?Q?2SaryZaGCrSy6uMQXmttZiuCyXJHFoA0Y34+coAhgy97X7ZCNBS3nsuadquo?=
 =?us-ascii?Q?vHlxsndoJk+aYbTXH3KpPmICln0EVLRxMK2SHV5Vnmq9rJmFCU8d3kqCW8NJ?=
 =?us-ascii?Q?aDHhKJ/5+xeAsreOBCBxIbCQMa1ob0JJI3xrlvcutbn2j/2Xa3c+DXy9BbG/?=
 =?us-ascii?Q?mGqFrCb51IxHyqu/87OGQo0VyEhqdcr/vpQYXtP4DpoMmss9AoIMbBDs4tsa?=
 =?us-ascii?Q?otnQiFZxJUN2Yb4EMiT2IkAIMtU+H6dR4bkGtb06Uoe8p5axdIWoTwzFmuf5?=
 =?us-ascii?Q?Wux4nWWwJC3h3f/Mg6GZqkFDLca4pMjQ9edbRH9yk9LwUwfzVMPLHh91Omry?=
 =?us-ascii?Q?2le02levoCLycluad8boxpvGXxu27U8+POA37iBTGHwYiULq4YH7DMhPqml9?=
 =?us-ascii?Q?h5nUoTO5WUSH1SjY8fR7Y8F8ZcflxJXEBZZTDKSWJMqlBFC9hbJ19Z7mOL16?=
 =?us-ascii?Q?kWHjeDFnZ3w+5SS4pI054oTrZhpcAKcRe+iG+wvq2MbaDc8Tf9LS43id25Xg?=
 =?us-ascii?Q?Pj7TJ7TTF+33zG41jKt0iaNOXcHPGJ8GYnuq8U9P3d4D8wJjPlzThPXWxtzb?=
 =?us-ascii?Q?cBdn9Un+wplyiUEg6XHqRLgf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878c28e9-d224-4e19-94c9-08d91ebf1edb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:46.0744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzvGG8xa05n6OI2Db9x6ZmAR3Zar7vbY4cQov+x+IL3Zxmk7yuxQjb6kO06wwHuSQz0kE+bi2LHFK4dd5vJsZ9a/ZOW5UvEvoRAjmP3ercg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

 - don't use same name for size in bytes and in entries
 - use g_autofree for l2_table
 - add whitespace
 - fix block comment style

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..2734338625 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1601,23 +1601,22 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l2_table, l2_entry;
+    uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, l2_size, nb_csectors, ret;
+    int i, nb_csectors, ret;
+    size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
+    g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
     /* Read L2 table from disk */
-    l2_size = s->l2_size * l2_entry_size(s);
-    l2_table = g_malloc(l2_size);
-
-    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size);
+    ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
     if (ret < 0) {
         fprintf(stderr, "ERROR: I/O error in check_refcounts_l2\n");
         res->check_errors++;
-        goto fail;
+        return ret;
     }
 
     /* Do the actual checks */
-    for(i = 0; i < s->l2_size; i++) {
+    for (i = 0; i < s->l2_size; i++) {
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1647,14 +1646,15 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
                 nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
             if (ret < 0) {
-                goto fail;
+                return ret;
             }
 
             if (flags & CHECK_FRAG_INFO) {
                 res->bfi.allocated_clusters++;
                 res->bfi.compressed_clusters++;
 
-                /* Compressed clusters are fragmented by nature.  Since they
+                /*
+                 * Compressed clusters are fragmented by nature.  Since they
                  * take up sub-sector space but we only have sector granularity
                  * I/O we need to re-read the same sectors even for adjacent
                  * compressed clusters.
@@ -1700,9 +1700,11 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         if (ret < 0) {
                             fprintf(stderr, "ERROR: Overlap check failed\n");
                             res->check_errors++;
-                            /* Something is seriously wrong, so abort checking
-                             * this L2 table */
-                            goto fail;
+                            /*
+                             * Something is seriously wrong, so abort checking
+                             * this L2 table.
+                             */
+                            return ret;
                         }
 
                         ret = bdrv_pwrite_sync(bs->file, l2e_offset,
@@ -1712,13 +1714,17 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fprintf(stderr, "ERROR: Failed to overwrite L2 "
                                     "table entry: %s\n", strerror(-ret));
                             res->check_errors++;
-                            /* Do not abort, continue checking the rest of this
-                             * L2 table's entries */
+                            /*
+                             * Do not abort, continue checking the rest of this
+                             * L2 table's entries.
+                             */
                         } else {
                             res->corruptions--;
                             res->corruptions_fixed++;
-                            /* Skip marking the cluster as used
-                             * (it is unused now) */
+                            /*
+                             * Skip marking the cluster as used
+                             * (it is unused now).
+                             */
                             continue;
                         }
                     }
@@ -1743,7 +1749,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                                                refcount_table_size,
                                                offset, s->cluster_size);
                 if (ret < 0) {
-                    goto fail;
+                    return ret;
                 }
             }
             break;
@@ -1758,12 +1764,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         }
     }
 
-    g_free(l2_table);
     return 0;
-
-fail:
-    g_free(l2_table);
-    return ret;
 }
 
 /*
-- 
2.29.2


