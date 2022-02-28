Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D44C6B64
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:57:13 +0100 (CET)
Received: from localhost ([::1]:38718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeeM-0000yD-QP
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNs-0002Wl-3m; Mon, 28 Feb 2022 06:40:08 -0500
Received: from [2a01:111:f400:fe02::714] (port=28447
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNp-0002NC-Gm; Mon, 28 Feb 2022 06:40:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPTnBdVeG36ZzsJnAwDj42QSc7lw+XG8lZDmKFdwmsh+k4BsGg5gmbq9D5jH4sN8OjM6IyH1+10BmtFUWCsIzfGx+cGlfPaVd+FjnZKWzPP+VgYXZxjTTGyOCsgW+iCvOIcTzxK6Q9AMeez9PawvsTIIgQOyAaTPIgCR9u7yiXsIglnyyt1oEB03dJJKWEJY2YCW7L8yyHa8+8LW6iQYiN4AQMumFATL3clIbDm0UYWtQagGoAD3KWQe3uNzZ4uast3EKa00ICcpT6AAqXLQWglJ8mV5w6F/8k503+P39n6nEOd84fnwKC6G87FrVY0DIaH3nl5XMv+ECbtjyH9bDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8qT6l4df7zH8Odw5sbvg5lpWLiA1hTk9zOAAnhZZLA=;
 b=hz4QN96ZbzFEWo3HXcrPzL8eHmAYHn9CqClmPIs/8+wQPcKeMlw3AZlbu9KimquWuZw9yakp1ys/IXgnRMGIdE3sMv9w09i0VQE5PUGc3i5XEY/OdORDiksGjtDATSdV+y2cYqW7eFzGhg6xxX9s0TIZuKT1TWFrQV18EPBkeZMynTgTcEIw+PYFyOszouEeekT1nopZOCa9wBOs1nQsmL6gr93a/RmT94bEQje/7KwXG5vJMrmr8l+M5XMfLMDIltD857uXJQt/bkOI21xYUpw6vrFEOwW2WSrfPfmtcAPISTPACp5nb29f86J1Z16D73IduoKxDI5Crl6DjFyn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8qT6l4df7zH8Odw5sbvg5lpWLiA1hTk9zOAAnhZZLA=;
 b=pOQI/RwhdOhsrbHtfcoLCLSyURv5usej9my0PssDVXtf03P/Pdl3n0DAu/nL6VaDCmHE/Hf6oReAMCvn6BfaJ4M1+B3H+UAjEy7AdRLbMPfylD5kAnda44cy0se1GNM5LvPI1xX0l1E2cteqBr+bZfLSNipekhfl55GAMgb77oo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:55 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 12/16] block: copy-before-write: realize snapshot-access API
Date: Mon, 28 Feb 2022 12:39:23 +0100
Message-Id: <20220228113927.1852146-13-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 992809bb-4c56-4168-f51a-08d9faaf0a91
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB227231284D025109566A7CB9C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZC6kq+OEZG5ZvdqMKK8eqJAFYwbSP1f7vZtWrP0l0Y1Gj+kAX4JJwsfN0uUWr2Olig4kMTz2Ytwm/A0yNPX2gDGtoYY8ADBf5IXz6XyCbc68CX5ntnKw3ePNwz01G24W4D6IXA8BB/Gu3IJUw+4PmvcGcgl2Y6HGGTUo7goKv3JLRrEdkx6Q4Tv7vD59kJ9eOsjPkWE/ErgV3NpyAYzFBHCQ9Fe/zVlDjco7ugKl/k8u4CncDP1XR9+oV0BRxE+jGLet60Sjal7QfpCp7M6QdZ36XqtcM8MEe/5223kTytGMUvEmLRoLIZSMKQ29yhVtlGq8YJasbnA60F3LRdWkatq2IQtlXrhaK4XWI1TYTmN60qsvxPlW/c/2Bp65xMuJF2fJBd3QU/SC4t2TNRqO+ORsaSAhoepYDKV2ZHutkpSzsyiFSWfH3u2uYHSW6JNz0GC0QeeDbJb0ulRy19e2GCxq7Mp9j2DBIIa6KYOqWeW7A3XkRyIg6CwFAcjKGbli90zLceUmsj8KdaiTC+5X3JzHCG0X8IrKgA9/chIftJMBoaOKDSHrEAUixSXh/dN/Gu0hF6QWDoF9rUVn5qcVT5V3/BbrTx/YyToi389odE2WU5zOzEvFEjfv9dIU912pCTWlEhMczFQvvucaK8jOyjQx633IYEyEbTeuopYFrMDk4ffMShbbkldsq8BieYPXGqeQ48TeVp+rQrmgT4aaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(30864003)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zIevEbmq6chHakG41rDS/UHgsqRFVAk9K0KmDaIz3g3n7PlUP7da9hYgYrJV?=
 =?us-ascii?Q?RN9enUk45jc6msolYVT42PFBnuUdWCn3wtLWNTHuT3UWiSfK8j3CnZgjnvz7?=
 =?us-ascii?Q?l4dLRQULZcKCy8yeg1aCPt+9DULMCkLbHJwRi5FyoI5GSqd+pGaxcDgRy7/c?=
 =?us-ascii?Q?v/CDu+kktvV/5mVcGgjBr1ei6/sj8MNcXe5tnhdh97dDzNnYLf/TgvQfa2vS?=
 =?us-ascii?Q?Z0atgIQoQxH4lbhPMqkrEWF9TOjofc/AJH7VrKJ0jY2OPUXLr8Ir6aVmRNc0?=
 =?us-ascii?Q?LzO64d61fICwz1kI3eaXL1uRL2LchhfgsedJbI1/mXwkP8PqDJGIddPciCxg?=
 =?us-ascii?Q?HwiXx6rU48rCnPujW+Qus/sKMWUsV2uHRJlWz+z7pNWEugaWDvsBFxIwX31t?=
 =?us-ascii?Q?rG9awAvNpFM0bQywkGyiauF2nJiH42A5aJVnfqqxzpaVoNsmtu4Do+K240rc?=
 =?us-ascii?Q?qzlNumasM/ahMlLY3g76aAI7LN7i7V8SVfSka28+hjoIW4qyPWZnhh1oy5eO?=
 =?us-ascii?Q?RuZ8p1IuET+DzIdYOyvf5Z7A1vQB+keAFC5fIAhjgF28taKqAhQul9IXOSBw?=
 =?us-ascii?Q?3/wcWZNd6kCiAnE06RoCX+fgITsJ2niEjUzjEIX6FUJ3mOJyjhS56+YKlrKu?=
 =?us-ascii?Q?izt3hlMFj4DG80U3g3yiqDlgAJwOZh1UCcjpTYTtmyBiWLxdnvSAojOXT+eW?=
 =?us-ascii?Q?0MLaqbhnsWfnEBD60CHz8cOGhvU3TnzU1V5W+gZCqI7ixBrXikvIjG93Ihxr?=
 =?us-ascii?Q?jKPvJluS8o2/iPfFrZ4AZBSk2PR4kl07MMcPuKvxvWX74ctwMZHPDe8oGfP6?=
 =?us-ascii?Q?tyx0CoKXlp1rZo9c4wMhHQ/mzEBgU4KDr/SXyM6bzRI30xZPmLpsowqy1gjn?=
 =?us-ascii?Q?+GnHmMWs5FRRZMwXyNGvhs/hlE3Zor2IMoiUIdoeRHY3vuS+6wsXGZK5S6ee?=
 =?us-ascii?Q?8EFfo59ZtjjYcBjzdaUF6WjLzol/igv4GpPysqCZyows7/BvODUhZvdiC6+R?=
 =?us-ascii?Q?dNWonNauf4pZKemnA19P4KBPurhfF26m9fmDXvfY6NAuZx1WdOG2HJ19eUBx?=
 =?us-ascii?Q?XOKqHJ9KHL2vdDRHkB5wwV06PoGtEvztJAVCkyingu9a/iDBB4mzm8I9lGdu?=
 =?us-ascii?Q?BOiI4zgmtevkdfH7Ua0mlZS7Z3bHK93AN2xdEJ68fJWUGpSESe4htLzQny36?=
 =?us-ascii?Q?EHNL8zHRp5vrM25X+Oj7+eNaLhNsoqavyzkDgE8NQ4p4u3Rq82D0mRmo+Zuq?=
 =?us-ascii?Q?QeiA9RjD6tVFAmWY8TuldyduRvjEyxrEyEEP4IoeZM3zDgH9sGxJTpkx2uTq?=
 =?us-ascii?Q?ENKVB0Twm9Qk0Sy046lnHRWafPNz1BQyCWatDqz2/D5BBqNQAnPZe1mPJObQ?=
 =?us-ascii?Q?bO6kStXQntQC4KQd9mGnhXyy5aXmd39Hjzw4nkU47dMQEVJrgOWqaAzfVelg?=
 =?us-ascii?Q?BGAk5mbB8jPNtlGIdS4C+ouKsEFEMPLuOASCNB9HExmIZabgQOcoj1cLZF/+?=
 =?us-ascii?Q?oAnGgubVjgjdBZ7yBLkiTTTUp5bJ5FUlKKv94bqeNIXsBoWT9oWncTg9j7R2?=
 =?us-ascii?Q?SDe3IzLRm6fg9ye7Os87PgJPNONeWMiz12aLrv5dEVAHCzb7+k1Btl7B3Xcg?=
 =?us-ascii?Q?QqWpEpPS7iQbKaxbEWQV1nrkVSoNtZch77XEMq1MXhBSP9BfYnMS13UkAdXi?=
 =?us-ascii?Q?yTUONA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992809bb-4c56-4168-f51a-08d9faaf0a91
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:55.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJgdaE6gTHO8nqP8hgZQkR226HRnzkEkznkommRLjlCHRmzVibjsMgeWKC4bzJfsPIGNXTRzeRrmLGsBi9wo0Kxd+ODOJ79pDV+Eh4WwxVk=
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

Current scheme of image fleecing looks like this:

[guest]                    [NBD export]
  |                              |
  |root                          | root
  v                              v
[copy-before-write] -----> [temp.qcow2]
  |                 target  |
  |file                     |backing
  v                         |
[active disk] <-------------+

 - On guest writes copy-before-write filter copies old data from active
   disk to temp.qcow2. So fleecing client (NBD export) when reads
   changed regions from temp.qcow2 image and unchanged from active disk
   through backing link.

This patch makes possible new image fleecing scheme:

[guest]                   [NBD export]
   |                            |
   | root                       | root
   v                 file       v
[copy-before-write]<------[snapshot-access]
   |           |
   | file      | target
   v           v
[active-disk] [temp.img]

 - copy-before-write does CBW operations and also provides
   snapshot-access API. The API may be accessed through
   snapshot-access driver.

Benefits of new scheme:

1. Access control: if remote client try to read data that not covered
   by original dirty bitmap used on copy-before-write open, client gets
   -EACCES.

2. Discard support: if remote client do DISCARD, this additionally to
   discarding data in temp.img informs block-copy process to not copy
   these clusters. Next read from discarded area will return -EACCES.
   This is significant thing: when fleecing user reads data that was
   not yet copied to temp.img, we can avoid copying it on further guest
   write.

3. Synchronisation between client reads and block-copy write is more
   efficient. In old scheme we just rely on BDRV_REQ_SERIALISING flag
   used for writes to temp.qcow2. New scheme is less blocking:
     - fleecing reads are never blocked: if data region is untouched or
       in-flight, we just read from active-disk, otherwise we read from
       temp.img
     - writes to temp.img are not blocked by fleecing reads
     - still, guest writes of-course are blocked by in-flight fleecing
       reads, that currently read from active-disk - it's the minimum
       necessary blocking

4. Temporary image may be of any format, as we don't rely on backing
   feature.

5. Permission relation are simplified. With old scheme we have to share
   write permission on target child of copy-before-write, otherwise
   backing link conflicts with copy-before-write file child write
   permissions. With new scheme we don't have backing link, and
   copy-before-write node may have unshared access to temporary node.
   (Not realized in this commit, will be in future).

6. Having control on fleecing reads we'll be able to implement
   alternative behavior on failed copy-before-write operations.
   Currently we just break guest request (that's a historical behavior
   of backup). But in some scenarios it's a bad behavior: better
   is to drop the backup as failed but don't break guest request.
   With new scheme we can simply unset some bits in a bitmap on CBW
   failure and further fleecing reads will -EACCES, or something like
   this. (Not implemented in this commit, will be in future)
   Additional application for this is implementing timeout for CBW
   operations.

Iotest 257 output is updated, as two more bitmaps now live in
copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c  | 212 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/257.out | 224 +++++++++++++++++++++++++++++++++++++
 2 files changed, 435 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 91a2288b66..0b6d26605c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -33,12 +33,37 @@
 #include "block/block-copy.h"
 
 #include "block/copy-before-write.h"
+#include "block/reqlist.h"
 
 #include "qapi/qapi-visit-block-core.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+
+    /*
+     * @lock: protects access to @access_bitmap, @done_bitmap and
+     * @frozen_read_reqs
+     */
+    CoMutex lock;
+
+    /*
+     * @access_bitmap: represents areas allowed for reading by fleecing user.
+     * Reading from non-dirty areas leads to -EACCES.
+     */
+    BdrvDirtyBitmap *access_bitmap;
+
+    /*
+     * @done_bitmap: represents areas that was successfully copied to @target by
+     * copy-before-write operations.
+     */
+    BdrvDirtyBitmap *done_bitmap;
+
+    /*
+     * @frozen_read_reqs: current read requests for fleecing user in bs->file
+     * node. These areas must not be rewritten by guest.
+     */
+    BlockReqList frozen_read_reqs;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -48,10 +73,20 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+/*
+ * Do copy-before-write operation.
+ *
+ * On failure guest request must be failed too.
+ *
+ * On success, we also wait for all in-flight fleecing read requests in source
+ * node, and it's guaranteed that after cbw_do_copy_before_write() successful
+ * return there are no such requests and they will never appear.
+ */
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -62,7 +97,17 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
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
@@ -110,6 +155,142 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->file->bs);
 }
 
+/*
+ * If @offset not accessible - return NULL.
+ *
+ * Otherwise, set @pnum to some bytes that accessible from @file (@file is set
+ * to bs->file or to s->target). Return newly allocated BlockReq object that
+ * should be than passed to cbw_snapshot_read_unlock().
+ *
+ * It's guaranteed that guest writes will not interact in the region until
+ * cbw_snapshot_read_unlock() called.
+ */
+static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                        int64_t offset, int64_t bytes,
+                                        int64_t *pnum, BdrvChild **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req = g_new(BlockReq, 1);
+    bool done;
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
+        g_free(req);
+        return NULL;
+    }
+
+    done = bdrv_dirty_bitmap_status(s->done_bitmap, offset, bytes, pnum);
+    if (done) {
+        /*
+         * Special invalid BlockReq, that is handled in
+         * cbw_snapshot_read_unlock(). We don't need to lock something to read
+         * from s->target.
+         */
+        *req = (BlockReq) {.offset = -1, .bytes = -1};
+        *file = s->target;
+    } else {
+        reqlist_init_req(&s->frozen_read_reqs, req, offset, bytes);
+        *file = bs->file;
+    }
+
+    return req;
+}
+
+static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    if (req->offset == -1 && req->bytes == -1) {
+        g_free(req);
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&s->lock);
+
+    reqlist_remove_req(req);
+    g_free(req);
+}
+
+static coroutine_fn int
+cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockReq *req;
+    BdrvChild *file;
+    int ret;
+
+    /* TODO: upgrade to async loop using AioTask */
+    while (bytes) {
+        int64_t cur_bytes;
+
+        req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &file);
+        if (!req) {
+            return -EACCES;
+        }
+
+        ret = bdrv_co_preadv_part(file, offset, cur_bytes,
+                                  qiov, qiov_offset, 0);
+        cbw_snapshot_read_unlock(bs, req);
+        if (ret < 0) {
+            return ret;
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+        qiov_offset += cur_bytes;
+    }
+
+    return 0;
+}
+
+static int coroutine_fn
+cbw_co_snapshot_block_status(BlockDriverState *bs,
+                             bool want_zero, int64_t offset, int64_t bytes,
+                             int64_t *pnum, int64_t *map,
+                             BlockDriverState **file)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+    BlockReq *req;
+    int ret;
+    int64_t cur_bytes;
+    BdrvChild *child;
+
+    req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &child);
+    if (!req) {
+        return -EACCES;
+    }
+
+    ret = bdrv_block_status(child->bs, offset, cur_bytes, pnum, map, file);
+    if (child == s->target) {
+        /*
+         * We refer to s->target only for areas that we've written to it.
+         * And we can not report unallocated blocks in s->target: this will
+         * break generic block-status-above logic, that will go to
+         * copy-before-write filtered child in this case.
+         */
+        assert(ret & BDRV_BLOCK_ALLOCATED);
+    }
+
+    cbw_snapshot_read_unlock(bs, req);
+
+    return ret;
+}
+
+static int coroutine_fn cbw_co_pdiscard_snapshot(BlockDriverState *bs,
+                                                 int64_t offset, int64_t bytes)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        bdrv_reset_dirty_bitmap(s->access_bitmap, offset, bytes);
+    }
+
+    block_copy_reset(s->bcs, offset, bytes);
+
+    return bdrv_co_pdiscard(s->target, offset, bytes);
+}
+
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
@@ -194,6 +375,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
+    int64_t cluster_size;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -225,6 +407,27 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    cluster_size = block_copy_cluster_size(s->bcs);
+
+    s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->done_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->done_bitmap);
+
+    /* s->access_bitmap starts equal to bcs bitmap */
+    s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
+    if (!s->access_bitmap) {
+        return -EINVAL;
+    }
+    bdrv_disable_dirty_bitmap(s->access_bitmap);
+    bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
+                                     block_copy_dirty_bitmap(s->bcs), NULL,
+                                     true);
+
+    qemu_co_mutex_init(&s->lock);
+    QLIST_INIT(&s->frozen_read_reqs);
+
     return 0;
 }
 
@@ -232,6 +435,9 @@ static void cbw_close(BlockDriverState *bs)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
+    bdrv_release_dirty_bitmap(s->access_bitmap);
+    bdrv_release_dirty_bitmap(s->done_bitmap);
+
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
 }
@@ -249,6 +455,10 @@ BlockDriver bdrv_cbw_filter = {
     .bdrv_co_pdiscard           = cbw_co_pdiscard,
     .bdrv_co_flush              = cbw_co_flush,
 
+    .bdrv_co_preadv_snapshot       = cbw_co_preadv_snapshot,
+    .bdrv_co_pdiscard_snapshot     = cbw_co_pdiscard_snapshot,
+    .bdrv_co_snapshot_block_status = cbw_co_snapshot_block_status,
+
     .bdrv_refresh_filename      = cbw_refresh_filename,
 
     .bdrv_child_perm            = cbw_child_perm,
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index 50cbd8e882..aa76131ca9 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -106,6 +106,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -566,6 +582,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -819,6 +851,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1279,6 +1327,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1532,6 +1596,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -1992,6 +2072,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2245,6 +2341,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2705,6 +2817,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -2958,6 +3086,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3418,6 +3562,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -3671,6 +3831,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4131,6 +4307,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4384,6 +4576,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
@@ -4844,6 +5052,22 @@ write -P0x67 0x3fe0000 0x20000
 {"return": ""}
 {
   "bitmaps": {
+    "backup-top": [
+      {
+        "busy": false,
+        "count": 67108864,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      },
+      {
+        "busy": false,
+        "count": 458752,
+        "granularity": 65536,
+        "persistent": false,
+        "recording": false
+      }
+    ],
     "drive0": [
       {
         "busy": false,
-- 
2.31.1


