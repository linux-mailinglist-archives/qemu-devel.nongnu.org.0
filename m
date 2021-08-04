Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8C3E020A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:30:32 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGyd-0001LP-FB
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmr-0002NE-92; Wed, 04 Aug 2021 09:18:21 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmo-0005TW-TO; Wed, 04 Aug 2021 09:18:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+AiP4QY6NfWHjDCKFJ+J7YCPf0wah7kY5Ar5S/XxlFCjiqLlYlJ8ttDLeWRTMYGuDMsy35ZEgNrYu+G6Yjmy/07G0/Ady1mXZmNuxObCR13i1v0/DUAk3mWxhEyAOBCv4jIe0ir9B7vdwanv1fbSqmA7GmaiI/OcGGGlvVswxQZhX5fMm/HE7GyA8KgiK287jDYnQhy+vr2tCabcxv8PGmg6nespgzMe7+I9HqclFF0k2G6yah2ZDLwvxI2L6cvNizkR4eWiQ69UwfYoBlc7OD7m7di5sV4ck3w9WspO5v4MKsjlJD62jXRfIIwqfGKFYeA1plZWJV9pqnq6Khzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn6tVYE5tbXrkVMfqUpU24Zdbk71LPI04p7Moa9UkCk=;
 b=Dn9I/r37s3egy0i99P/kjb5Y7XBFaurQ+qZjNV6h8Z/GYOR0M1xID7tFs8mtfK1oCo2Ai8ZO9Tb1sgH+3awuCTHJiZTn9U+mOaNIX44/VRqKmuSonQmoJIRJXsJTK2FFRDRoYKV3tp5TQ6PcrU6KHYrCBhTf/6xKYQul7OULX9yYP7w3CPgCnC7l7NE/9QZgCYZ1scn3SUhWiBo20GjgFUPsl1PtlCKa+SNVYNm0NmY0grXG/V0SmOX3wCgjvpcj9mwhJTLPr7ny/nW41xjlRJ3uSpmN3y0Uw+7RWISn5LkCADeX0ua5QBTv4eNlLgWSC4TEpTNhDV9Oro193n/3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn6tVYE5tbXrkVMfqUpU24Zdbk71LPI04p7Moa9UkCk=;
 b=UIoVLQtY0pyb9QkBgGuvZTvOcUHk3A5V5r9zc9/hlloxGoWSBLH9PtsU66zVUXADMcOuEI7lkXVuFCQhK5CLkq3pNrvoqp10DmSUI7ST7+fhAcKwBwCoo75cf618emn/xBPSH+MapGC/72OTeilkJjwAlNq1WQM2uDa3Z+bZrfk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:13 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 09/11] block/copy-before-write: add cbw_snapshot_read_{lock,
 unlock}()
Date: Wed,  4 Aug 2021 16:17:48 +0300
Message-Id: <20210804131750.127574-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f691f2d2-0df5-4b81-0a69-08d9574a5041
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216B37DB67EBE3BFC0DB99EC1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:19;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuPbdNAgS/gxm3WQxKWnu0IWGjUNhmIFBHM9q1xZuopbw5bONceYl1xr+aStVu+syfvYLcyTgYJjF/5hVEThPq/1N3QuBHcwwHZFTgPzpkwcQLWZwwk84sQziPjuqsm871/g5rZOpdStT90MPCvimTBLPqRREnY22CqPEiaFOxKSbus01m9R8WqJ+tBErCGhSL0HCYp2H8aHnEZNGIK/swzFnjDW+JCwW0KcwqmuAC5A7M9/ZZV8qnN6dDMDTihh41nL383bP53u7QmeAyx9CPFfUF3i9jQnWLb4BaWpopLcPZn0HCZ0RX4HvvmpA0pkkH2aAK6ecRUdoLzLiPKjJFd+JgPZFQvN41yRZnY+Y/xoCK+HjrLi2EsktmRvBKYCJB/uot0G6Egtk6ZBdOrs8M8hs1YutR9eowC23JVIlnZqpR7TBu2YT28PJtpbiR1+vYfzHaPlYeIlI826WPiMe70BCpknwDu3XAbH7TdkFlKTBxGp8OVJuFDjEcPVxG9pQQSb8/i1c6QpzSfzHntc9msOGFQOo0NGMqZSgEoNv2KYrW9Z9+/TtHw6e4o+FfpnebZ4qODSDGggSAjfp6cYtFDMpqxfOu7KTP1AmSZSPU580Z+h8WOU3G7QdVXAYNGErkFjHwha90BKoq2qYomzUpvgJB2VIuLZ4gFE8l+kfMkrH1DRZaokjou9dFqcXZ3U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uoTWOT5bhmo7WScGOL9KrBkqlJW9HOtQMgHFpBeFoC4kFp0rKCdXgnl3Wl7b?=
 =?us-ascii?Q?hZMGALETfFmmmVFhZLBO7LT8ci2H3wsYzfCn6OqGlMEzscRrek0qY+WC+bbX?=
 =?us-ascii?Q?HX7t00bOxplZ18HQ0Cvz8XIj4m1XdWnzJjSontVzjqKQHsP2cvHUVWYujnOD?=
 =?us-ascii?Q?z4Yox2zyoPgzDxDRh+ZQmsNvS+wzgealqxoJ4JU0lGG/IeECYuER6N27LLj2?=
 =?us-ascii?Q?KGJpRLsUbvI9/i6g4yc2H4FEGT02dzvIBfuS0+Dwi3obERkqc7c7uVE0E/nE?=
 =?us-ascii?Q?X0z9D88hk8eqd1/So2+Fo//fuuFm8+QmcC3N90JvQrqY1TZHJNJnJjCru9R1?=
 =?us-ascii?Q?N7JaFVuOeSJKWCnSOYxYXZo9N4xJheSFayALLN2YILYtisdT+50CNUyTiD4O?=
 =?us-ascii?Q?Xr7XfWhETi6XGKmL/d7iSOaF23Fz16KmPe3YjO05Z0t6CXi9U55GQAGDNrfM?=
 =?us-ascii?Q?Cgk/cKslrE6MAWcYoZmzEIhXCHkzhmAJQgOiVEOu0jZoar7d8HOKpAoVU6Z9?=
 =?us-ascii?Q?pywoifolKNIAyyFkakMuG93JCOmHQqD3hew1iugU38YuWYHwz239XLYQ5JvG?=
 =?us-ascii?Q?y1VzVBsRa6jIHy1FaUscmBZ2DYXxp/erqKlo8svjqg19OMI+kCFtVOljcGiF?=
 =?us-ascii?Q?Vv7j9Eeq8vgtEzDWUuavWQ1MjcrDD6N2eL416UM6/oCDeZlMeGYtzR4Vdoz0?=
 =?us-ascii?Q?QCo3mE2tfSLb4GiJ0v/dY8r2BYE12IhZgd4B/cKmfx9Sbf/IhnerWOBFPVI4?=
 =?us-ascii?Q?OQBCRgkkIr1wwx1t6WiowUGxhQ9UzXDRfbSF62X7+ldh2n8gzPueLZEuQVjE?=
 =?us-ascii?Q?QxLXHBiKSg9zZ9IS0NxMwO5t0kgORnx3KclCs3+GtzqL52/lOKb+hSwEwdBW?=
 =?us-ascii?Q?C6Sgz/X8P+XyZD23dY/xbnX3cg7VhX1UFG9lp/5W5TYkYKM9ueGia9vrmZw5?=
 =?us-ascii?Q?bQr1PV3+gOJKESZkcR9T4Vo3eReoTw3hJjANg5Legw6EVO2hQyU3wdueaKrT?=
 =?us-ascii?Q?tjBGvUjn66HAQ9mp/GDVQMe+zQhQN9W+8X7MgOUcrdSryQZdylc1Ncnvy745?=
 =?us-ascii?Q?NrjzH6iCGaY9NI4RbR0wAie8LsAPpXN0hX4TXAnYbV7sUtUP/h55acmMfuda?=
 =?us-ascii?Q?M25yS5wMX0Xb8pAQ4FaraycVT1lGchh6i7BQJLdA6VsFMcwk04X+LIyd4EKx?=
 =?us-ascii?Q?K6Akza7A/FIPADl5hkl942eBBxnkEZ0NToWiFvgabdvop22DgSO3JSwH6IoM?=
 =?us-ascii?Q?L8oQGf5McD9rvxPI5LjSEiK/nzAS8qoyn5a5SMQE1MUCCG1c4BUJ20u6SMRC?=
 =?us-ascii?Q?CBdmravS/Dz88XjZ9ajrqXsz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f691f2d2-0df5-4b81-0a69-08d9574a5041
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:13.7611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNmBQIitqpKAGfvLN8zJQPXWws0lBlSbnvb8SOHIR57TX/+tlZotmT7YBv0gB32pjN9i3OhPu4qCAC1efUiKXOOKGKqN8HhV76X+CLUntRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.122;
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

Add interface which help to do fleecing read. To be used in the next
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h |   5 ++
 block/copy-before-write.c | 103 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 51847e711a..a7e286620c 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -28,6 +28,7 @@
 
 #include "block/block_int.h"
 #include "block/block-copy.h"
+#include "block/reqlist.h"
 
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
@@ -36,4 +37,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
 
+int cbw_snapshot_read_lock(BlockDriverState *bs, int64_t offset,
+                           int64_t bytes, const BlockReq **req, int64_t *pnum);
+void cbw_snapshot_read_unlock(BlockDriverState *bs, const BlockReq *req);
+
 #endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index b58a5e8b48..a96131358e 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -31,14 +31,78 @@
 #include "block/block_int.h"
 #include "block/qdict.h"
 #include "block/block-copy.h"
+#include "block/reqlist.h"
 
 #include "block/copy-before-write.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+    CoMutex lock;
+
+    BdrvDirtyBitmap *access_bitmap;
+    BdrvDirtyBitmap *done_bitmap;
+
+    BlockReqList frozen_read_reqs;
 } BDRVCopyBeforeWriteState;
 
+static BlockReq *add_read_req(BDRVCopyBeforeWriteState *s, uint64_t offset,
+                              uint64_t bytes)
+{
+    BlockReq *req = g_new(BlockReq, 1);
+
+    reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
+
+    return req;
+}
+
+static void drop_read_req(BDRVCopyBeforeWriteState *s, BlockReq *req)
+{
+    reqlist_remove_req(req);
+    g_free(req);
+}
+
+/*
+ * Convenient function for thous who want to do fleecing read.
+ *
+ * If requested region starts in "done" area, i.e. data is already copied to
+ * copy-before-write target node, req is set to NULL, pnum is set to available
+ * bytes to read from target. User is free to read @pnum bytes from target.
+ * Still, user is responsible for concurrent discards on target.
+ *
+ * If requests region starts in "not done" area, i.e. we have to read from
+ * source node directly, than @pnum bytes of source node are frozen and
+ * guaranteed not be rewritten until user calls cbw_snapshot_read_unlock().
+ */
+int cbw_snapshot_read_lock(BlockDriverState *bs, int64_t offset,
+                           int64_t bytes, const BlockReq **req, int64_t *pnum)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    bool done;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
+        return -EACCES;
+    }
+
+    bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, &done, pnum);
+    if (!done) {
+        *req = add_read_req(s, offset, *pnum);
+    }
+
+    return 0;
+}
+
+void cbw_snapshot_read_unlock(BlockDriverState *bs, const BlockReq *req)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    drop_read_req(s, (BlockReq *)req);
+}
+
 static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
@@ -50,6 +114,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -60,7 +125,17 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true);
+    if (ret < 0) {
+        return ret;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
+        reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
+    }
+
+    return 0;
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
@@ -148,7 +223,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
-    BdrvDirtyBitmap *bitmap = NULL;
+    BdrvDirtyBitmap *bcs_bitmap, *bitmap = NULL;
+    bool ok;
+
+    qemu_co_mutex_init(&s->lock);
+    QLIST_INIT(&s->frozen_read_reqs);
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -202,6 +281,23 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    bcs_bitmap = block_copy_dirty_bitmap(s->bcs);
+
+    /* done_bitmap starts empty */
+    s->done_bitmap =
+        bdrv_create_dirty_bitmap(bs, block_copy_cluster_size(s->bcs), NULL,
+                                 errp);
+    bdrv_disable_dirty_bitmap(s->done_bitmap);
+    /* access_bitmap starts equal to bcs_bitmap */
+    s->access_bitmap =
+        bdrv_create_dirty_bitmap(bs, block_copy_cluster_size(s->bcs), NULL,
+                                 errp);
+    bdrv_disable_dirty_bitmap(s->access_bitmap);
+    ok = bdrv_dirty_bitmap_merge_internal(s->access_bitmap, bcs_bitmap, NULL,
+                                          true);
+    /* Merge fails iff bitmaps has different size */
+    assert(ok);
+
     return 0;
 }
 
@@ -211,6 +307,9 @@ static void cbw_close(BlockDriverState *bs)
 
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
+
+    bdrv_release_dirty_bitmap(s->access_bitmap);
+    bdrv_release_dirty_bitmap(s->done_bitmap);
 }
 
 BlockDriver bdrv_cbw_filter = {
-- 
2.29.2


