Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049CC38E8B3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:25:16 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBW7-0005Ld-2c
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS0-0006h2-RM; Mon, 24 May 2021 10:21:00 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:51129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBRw-0006l3-5q; Mon, 24 May 2021 10:21:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYu8tClf5gH9WK8rl6mglPZ2FG21eG+ktsgHQyuqqsxg+CiLiuMEjq9xhRgzojrpGOWVnvHjGGWP6xpRUQMP0gy6/FUQ00hoTmPXBczYipu/vKxcUezFL7V2i0Danzk828xmr3yURuy8qYyOpEcU4CXS9eR6dPm+G5Bm0e5MNalu22DcWEF89TByJdZ3qnA47/Yuum4/Zp4PeV3qhlFAiMKWrX4cJEAVHobkrHocuseja+eP1oaewcqfn88k+KAqgYazIlE9lbQ7w0e7VrQrZIY15eRfsyRTm9j52c0yfSDOIxMM8cXek+a4f0+TzeCmer449lBkM1a9hL7HQyzOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEUqkGNrUiwYcaPCn13RwWqYVXY9FDS0noBTJhwBoRA=;
 b=Qt6tqOp3PdbQdX9DfjGb9raOR7Iwh2YqMBV/S5KLLSWKmbQHyYT/owDA2aPk2Ws1jJMFqorWAC1uF2XTHNa4Iby6gwdafgaT6rLnCjGW1uY9QQcRRygKQlkqIhRBwb+T4tGZVd+3/uOHqtFApSIFM/06o5aCHTs8cXTQbWsQ2hnso2hKGz5qmYIFyQJazrV4KBH+9qmX/kLBByAwZtMn7F1Y2hCo0oQbL8ZQfcxVWNepV/eF+r4/4JIqsbthSV+CsXEGvII1osg8menykBQfu5cw0zzdoqCxgiYV64DyyXXQzOFr4xMgY/3CbPuQrd/EbrTzWwxa2UiNQDjOyV4edw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEUqkGNrUiwYcaPCn13RwWqYVXY9FDS0noBTJhwBoRA=;
 b=aqtED7hUtIXwQU1nO9Bjcy+SjNeKlCw3wyFJDkL4rDAXtWWx2hJAfuHSJ/FkYRdAWMYQP4Qw5o8PdvbdTjm7Aur8R7Y1AkRtJXLabqPsilsqzBTRZSjX0cXkQQCDFyZMvR6OXk3j9v0wv6txHMrhtR4CQ05F7YcK26S8vZfMyWU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 03/10] qcow2: introduce qcow2_parse_compressed_l2_entry()
 helper
Date: Mon, 24 May 2021 17:20:24 +0300
Message-Id: <20210524142031.142109-4-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb62270-5809-4e7b-3e7f-08d91ebf20ab
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165DD68B03FF137B1230935C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJ/WRuJ43ukO/W7yVqL1jFWqa7otPpTazjLhWeAVXLgqQjULfUzIdWMMAtcvec2v/pe96Ndlik0okHyTqI4QjU9udbEFqb+ya2/zJxY1LiVrcurUMHiWNU5IIqsPH/3CzQbXa3UghqTgi8EMYPgI5A/H2gpXIsJ4hMjYP/TM4e0R/42L7N7XRCDP058H4S8o84su0sMWVWMdJ6ANFwi1yy63xQXp62HgXUc1nkDUYJSVGYhJuNca0BELJLalRr3ZzgEWrZmPc9q8Xp30M6q67QsrM9IvuCOpUCTTip+DbFXVJqv5vtwO6CgNbz1pBoJ1KvkvtAECVaoITVhOdZzMoKF+cn9e8GkoyimYvzX08tVGo5Uib0C+QTcG2adOICOoJJaDFOrxyNUC69NGPGSavUQvPzBtf21t2k45Kf0we14GAR4cXHy7FjjVHElCHyiriUxBQOLKs1wg4x1YL3C+fuSfGXLC4IIrfXJ6MK5n025mi7IJUQ3BptTcicMys/GfhyJAW09ry35KYN89f0VatyAkJeVBajGuDyAodsCliTeJZ46824CNht4u4XYzueLUnK5HTVPYo3gkFZPsO2nwlDDoltUlumkJiOYbpqiMJKBxKQllgweHn7Mpjy+H2XuBgDwAoulrjPon0Xc0Ysw3mmfLd6o2Ot/vM5wDS3fPyKt08HO2EaMcRsTiocDcSPtS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DLwLbKWpEZ+SlpWNpBs05bcQy6uBkqj9l2Xfi95Ykuf7Bfiqn2sVcyYlAlec?=
 =?us-ascii?Q?Vu7l5/wtOeHZu5bRCYv2rZwScFWlMWzTXgNL/wzLObMqzxwaSXT8EGw1MLh7?=
 =?us-ascii?Q?mP77X3x7tKH9wVakiwKyFXwXLMt4JV9NWWRb+fCals3dd9cguNQRJEqYlyK7?=
 =?us-ascii?Q?f1yT2i144Qw+WAu1iUITNiOTQ+Q9FEMLQGiTVgzrPHG9hGynS+Rombr4kQdx?=
 =?us-ascii?Q?Rw8JSV+0k/+18L5pR1eeRWSVDzrS6gHrmZaORuAGdGr+FsyzAj6/Z4MxbsME?=
 =?us-ascii?Q?wOR/pcBleR9CeWVgYhKgsXooXAQsQQyvJmpMh8s0kTi8GUhO28kwtICsB4rh?=
 =?us-ascii?Q?HhP5h3Lsvnq5OqNKJpGL0ckb9KXP2VHS8huqeBfCX1VHkUhQo5QTAL56aq7v?=
 =?us-ascii?Q?Ush3WLGvk9OxBKXRDyPxUsBSfD7Ve+5hdiWJ4tWYlCGSLf5dk5dXomF3bXL4?=
 =?us-ascii?Q?HuU+nefAYVcCqc1mlBv/w7C0YGPayFrK/GkoTjA1m79kVccEj/LItfl2sUGL?=
 =?us-ascii?Q?BZQiExxN3PRCM5zfDdA/bXKCEEGHCMGLhqqbhQjK0rNXT+Njz6nbu+0R4G4V?=
 =?us-ascii?Q?egQX/Ap7ic2EwPUEKWvvKQDw4yC8sCjoE9OW2dVI2gOzDa4qAge25PSNmd/x?=
 =?us-ascii?Q?S/qLlOCEDhT7mTqMkUxex+Kg/ITeNg2byrcecXGJ31lmGk46Qmd8MT062qOW?=
 =?us-ascii?Q?qsI0YPsSVw6QxhEp0RFyNRTH8vFxtLanIwaPnO3ynCYJOw2EBNzPMYkThjPD?=
 =?us-ascii?Q?EXT5nP6umLIlAtpU35QRTpceC8H06oX3V6FPUm5Zu2kc/zLy5IzL5+ps1NWw?=
 =?us-ascii?Q?tEDKjgLm8xjgI7UHKwhbYFbqtpUa+EEylqMMp9peqh0M6BxPych0Nx7i3zkT?=
 =?us-ascii?Q?rvFwpm7/tbMqCDcb4aBFeiJOj8caly18s8oGmPGTskSqBEFI2EOZVLdM38MD?=
 =?us-ascii?Q?XogFiqwpadW67lsdNapX8rVqFlVXeXYJCK0DVhrs1pmKyaXHEDKyShQ3161a?=
 =?us-ascii?Q?E+FgpbOIlmsWj2wYU1RSkiP9lgf5AtggUghKClavWNOFvuOCTE/FbECJG608?=
 =?us-ascii?Q?/hOC/ubp6JGQtUS6LQ9EKJam3UvEgNMTjtXSurGz+IrFOSkJOHQgH+4+uVGj?=
 =?us-ascii?Q?0EOY88WvK5tbRLpRrvhiWEOvbJc3Zju7rfkZL4X9lepHnqX9eqa2429MsJkz?=
 =?us-ascii?Q?tAdCCFc/T1agDFPhVAqqi7dur+3ITZggL43Mq5QaStdaHJU7sTX36Wm/0es7?=
 =?us-ascii?Q?D9dV/czRQZ3Cw+yafcnRTShVktp1z8SBOd1iWaoEKFFolg2bNZC/LPBn4iJ+?=
 =?us-ascii?Q?eVOATBnd+CthITm3ochQsbFA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb62270-5809-4e7b-3e7f-08d91ebf20ab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:48.7128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay8VbO5HMovbtey3NDYwFGxbtoGMnBzSHgik1P7bIrR7g0Y+ALZl/EFpt1URK6nxPacDdkFZcB1iepjJAKtiq5UpvJjWKRAOhFetKpy2iO8=
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

Add helper to parse compressed l2_entry and use it everywhere instead
of open-coding.

Note, that in most places we move to precise coffset/csize instead of
sector-aligned. Still it should work good enough for updating
refcounts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h          |  3 ++-
 block/qcow2-cluster.c  | 15 +++++++++++++++
 block/qcow2-refcount.c | 36 +++++++++++++++++-------------------
 block/qcow2.c          |  9 ++-------
 4 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 42a0058ab7..c0e1e83796 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -110,7 +110,6 @@
 
 /* Defined in the qcow2 spec (compressed cluster descriptor) */
 #define QCOW2_COMPRESSED_SECTOR_SIZE 512U
-#define QCOW2_COMPRESSED_SECTOR_MASK (~(QCOW2_COMPRESSED_SECTOR_SIZE - 1ULL))
 
 /* Must be at least 2 to cover COW */
 #define MIN_L2_CACHE_SIZE 2 /* cache entries */
@@ -913,6 +912,8 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 04735ee439..70d0570a33 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2462,3 +2462,18 @@ fail:
     g_free(l1_table);
     return ret;
 }
+
+void qcow2_parse_compressed_l2_entry(BlockDriverState *bs, uint64_t l2_entry,
+                                     uint64_t *coffset, int *csize)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int nb_csectors;
+
+    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
+
+    *coffset = l2_entry & s->cluster_offset_mask;
+
+    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & (QCOW2_COMPRESSED_SECTOR_SIZE - 1));
+}
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 2734338625..66cbb94ef9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1177,11 +1177,11 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     switch (ctype) {
     case QCOW2_CLUSTER_COMPRESSED:
         {
-            int64_t offset = (l2_entry & s->cluster_offset_mask)
-                & QCOW2_COMPRESSED_SECTOR_MASK;
-            int size = QCOW2_COMPRESSED_SECTOR_SIZE *
-                (((l2_entry >> s->csize_shift) & s->csize_mask) + 1);
-            qcow2_free_clusters(bs, offset, size, type);
+            uint64_t coffset;
+            int csize;
+
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
+            qcow2_free_clusters(bs, coffset, csize, type);
         }
         break;
     case QCOW2_CLUSTER_NORMAL:
@@ -1247,7 +1247,7 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     bool l1_allocated = false;
     int64_t old_entry, old_l2_offset;
     unsigned slice, slice_size2, n_slices;
-    int i, j, l1_modified = 0, nb_csectors;
+    int i, j, l1_modified = 0;
     int ret;
 
     assert(addend >= -1 && addend <= 1);
@@ -1318,14 +1318,14 @@ int qcow2_update_snapshot_refcount(BlockDriverState *bs,
 
                     switch (qcow2_get_cluster_type(bs, entry)) {
                     case QCOW2_CLUSTER_COMPRESSED:
-                        nb_csectors = ((entry >> s->csize_shift) &
-                                       s->csize_mask) + 1;
                         if (addend != 0) {
-                            uint64_t coffset = (entry & s->cluster_offset_mask)
-                                & QCOW2_COMPRESSED_SECTOR_MASK;
+                            uint64_t coffset;
+                            int csize;
+
+                            qcow2_parse_compressed_l2_entry(bs, entry,
+                                                            &coffset, &csize);
                             ret = update_refcount(
-                                bs, coffset,
-                                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE,
+                                bs, coffset, csize,
                                 abs(addend), addend < 0,
                                 QCOW2_DISCARD_SNAPSHOT);
                             if (ret < 0) {
@@ -1603,7 +1603,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     BDRVQcow2State *s = bs->opaque;
     uint64_t l2_entry;
     uint64_t next_contiguous_offset = 0;
-    int i, nb_csectors, ret;
+    int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
 
@@ -1617,6 +1617,8 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
     /* Do the actual checks */
     for (i = 0; i < s->l2_size; i++) {
+        uint64_t coffset;
+        int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
@@ -1638,13 +1640,9 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
             }
 
             /* Mark cluster as used */
-            nb_csectors = ((l2_entry >> s->csize_shift) &
-                           s->csize_mask) + 1;
-            l2_entry &= s->cluster_offset_mask;
+            qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
-                bs, res, refcount_table, refcount_table_size,
-                l2_entry & QCOW2_COMPRESSED_SECTOR_MASK,
-                nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE);
+                bs, res, refcount_table, refcount_table_size, coffset, csize);
             if (ret < 0) {
                 return ret;
             }
diff --git a/block/qcow2.c b/block/qcow2.c
index b3648f0ba5..56a69b26c1 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4672,17 +4672,12 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    assert(qcow2_get_cluster_type(bs, l2_entry) == QCOW2_CLUSTER_COMPRESSED);
-
-    coffset = l2_entry & s->cluster_offset_mask;
-    nb_csectors = ((l2_entry >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.29.2


