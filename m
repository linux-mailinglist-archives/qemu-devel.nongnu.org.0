Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A84B91FB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:59:54 +0100 (CET)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQSv-0001W2-TK
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGA-0003nn-E8; Wed, 16 Feb 2022 14:46:43 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG7-0006EC-7n; Wed, 16 Feb 2022 14:46:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUkB6RDovaZKroVwXsczGjdvHzCZ4hD2eBnvGEJ6a9GDr3nDS7cN5BTOt+I/AKbqKc1h6aZ9uJxrSpztqIxqYJuzscAVvAmFBauo1Ing6WGLp3PqszYcBDhvpBDFAf2xBpdbv/Zb3aMh2fNxtFvg5wD4pFbftzW8uy8dNiSmghWRLv4X0OYzFK58f7HoBsUVDBpDeD73ZH53HqyIeKQmoztVwVhMuOTKDpTj+Fjvogn6MovhKXn0Yw4h7Al7xxYdbD31abbBFEeUz2/KLPpjQnKsQyZf/JSGp0xhSn1KuGa0MsL4ipr15uTE2qwb5kmc18k0MnwDn2Oolnu00tbWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6dc/zNnD3hT8qEfRXNx97O9vAyWyRj5sT9atGrrEJM=;
 b=DKxmCnAmHPpLkQCUjC0xYJ11A0jbX31RvDHpx62yf16NzlkixmlmDMaUSuYiQHxOo6C1PtnMZey1xc+DtLTHX9vEAAIEOhCxnCurHfLrxGx23afarWhO33/xdmnboc7WjSmDctQ8m22+ZqlLmKlsj5fIPqNzGZWKdW3W5QlLznY6np3UHxs5DqTHRsGwV90AnDb2xqXOK3NAavlRjOjHCM/AiEsnCE01QnQDK3S3ImKnC4uYITlk+YQLeHKvqq8SSjoUeJSFK+edVGCzt8elc7QTJFvTlsPwcKPihadgr9R1tja8YTJS82a83udBb7LbCZQzyBxVt3yQlvHD/uYfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6dc/zNnD3hT8qEfRXNx97O9vAyWyRj5sT9atGrrEJM=;
 b=ZqHWrLMppk4lBl5cjatE6ybAquF/qdOfVAjRMevo6lto87DtSh8SMAoiSq2H8HL6mfKPlSKl8i6FT7jQYSQ6mXlwlHMEsQpRfW73WBFGlUcstKXRo2W8EW0BU9FFJzYlCTPrVq+wyZ0F55rNN/e1YnYPqYJL1P2ZPO53Qwd+pJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 06/18] block: intoduce reqlist
Date: Wed, 16 Feb 2022 20:46:05 +0100
Message-Id: <20220216194617.126484-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82075196-4c53-4efb-2a1f-08d9f18506ab
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB2851326894861C65FB946115C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfZ5CVgLm87Fu9ZWjgQekC6HY3i2ZfO6GEaalJkmHeGQ5TpZPGzpxebfDIrhPbWBZxP/MNHhRuEe/+fZp1IWZ5kgkpEo5Snd7ThR2YpO7HqTM/7xSjBCbBMuRHnRZNY1pxjfd0fdFkT6wJS6VGpNdth4dEztMe8RqxG0OFhEOaE27kRp1MFPSD/VaJQ/IkT8kK3P8F8gBJ8rwheCASne0HUF0UkJXvncdwKrS+9ZOCo5hiq7/XA/iThK4M3VwL95kfJnxaHuYIHG1o48h6ZuPoSJl+JENMVawRQfW3aaZwjzhDdfMqgQfzEFUHJ8IlIqZL3N1FVddB6xtAEJIMmDm1UH2RD06NjUQ9xeGpGKQ5xCSbyv9QJoNf1hz2vMAeVZVvqc3QezPVSz9CAlQcgFpeoI6c355qbcuLm4ii6pxkV+VQHr3hLmJiixFyvZb/XLyBE1fN3t2a7jDvDxWn7DXngQfNZ4nNVuxMafODgFWGW7rmVHjFVLtD7HWd+LxdIokcbWHgENLYHnqJtTf20bN3piswD65jmhPpsIvd1KqsB+yYdOiBeg1voEGrt+2JkZrfnwegsKhUgcdHOsfRlTx6si0szMaofBzzQNBvQaoA4Tigup3h9t9ZARNVaJ/CbTd/LJsdjOqem+8hMsc7+GZfCAA85JQnKILweBv0OfVm6leovk4G376FzGwhGNnZxC/xXfsN0MWWflxU/6sJijYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(30864003)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOmsnNTvSGFgqDbCAhXsg/H7qctAYoYvxOirku3B1vNMjJ/MLI6Z0JMsePgT?=
 =?us-ascii?Q?srFrUoBhr7zwdwhboRsx2rZr1Spb9jc/QtfYEuT8/alqrNggrHf8VCN7e4BG?=
 =?us-ascii?Q?k35kZ/+WNVKaZLc+LChhhbmY4lD1PhbOqRtxjgrAuON0zLZWbUjMtdJmXrNc?=
 =?us-ascii?Q?vSWQS2/pL5ynEFwsx7wqnrLUg1Y80hRAXFMBa5WFqtoSHQguUOh0WP5skhV0?=
 =?us-ascii?Q?r7U3zVc//r0xfqjtfaTQPea9iZiD32boVOM2kdEJTWfGGIWn3mW5JR4gS69F?=
 =?us-ascii?Q?v/MuqVnZ8lkhzidKT2lUq1deUCROimwe4/tj+4JLjfHM3YlGaDBqGqyQrU+S?=
 =?us-ascii?Q?vpxm5vSeEiNGjOSvhhplsdbj9AMyboVYUMMJ+DcsrwANM1q0I+Vo2XT5lV4g?=
 =?us-ascii?Q?ksa5vBGBFGkzRxffyxOt21/gSon6s7rgzRxERN5XpmlH3BM4S8seKd2gmvSk?=
 =?us-ascii?Q?LW/7BxYXsM4FA8aXHFKaJ7L/zOCGh1eRqUQ0p5zwTfyWXzl1IsB9dm+aI3jI?=
 =?us-ascii?Q?txGBmwzAlNVuUBTHfYzn0CkbXLNIaTwxvSemuarlDQgxYMlT9epEn7n3Xw2A?=
 =?us-ascii?Q?N43Dm6XjTiOp55e2L2z4hMmMXCJykTfuP+9G8T/zIZpM+NFOUKw7V3wYGgWQ?=
 =?us-ascii?Q?2PqS6ca+EC1/UufnGxCLZnHGRtNmdqFQqtBKCJvDnGeIGTmRGKLJJVl5ChAG?=
 =?us-ascii?Q?9j8pk2J+ebOrcAWQlq5Yl5x3p/Eo37bPShrqNzGJjR7+sVNcfhTOXUb9dxgj?=
 =?us-ascii?Q?bVXhzOsuuUgfRWWkEo3jHeVBRqfpmdh3xJnTgrS06bQwZ3dWcfCALGu86eaB?=
 =?us-ascii?Q?kLP8T9gbkqe2nlFGmxCpA/eVToBdRWkNdzMsBV405U9/QDbBeb3qsODCNt2I?=
 =?us-ascii?Q?wOTeQFx1Hhu+luBefWechcL1naJTUOP4jtzTGH90nYgFadyWvLvEblhZFGk9?=
 =?us-ascii?Q?sthP/hhMQ2bjRGyRbiGJVin5PIgSnPnEV8iWRiXdu3NivkvKlq5VtKG+vdLc?=
 =?us-ascii?Q?OgkXHHQdxNijwLEDIVJQI3VjipMPZTqic4lhdNZnGU13qbOw4jF3RdCP6RJE?=
 =?us-ascii?Q?zYgjzOe/4DO2GOcu0TuXH92q9iYXFta5m28GdJThNgCrJRNU3UNL8uAzo6S1?=
 =?us-ascii?Q?SmUjYz5VExoaWIGUnOq+COjxDwNfCbk3JqMP8XZLQ6PMtbGv41BTNhyLFX3i?=
 =?us-ascii?Q?ACnZlxK0rXHxx0hnz3DWmsof0iYjAfisO4mX18j+9H0KM3sY7U6o1EvhBpHI?=
 =?us-ascii?Q?pq9RBpdOPCn8R0fB5IiwcHuw58bjMHm+uR89J0tnW7GuaHpx+FrZCssJu33C?=
 =?us-ascii?Q?bymXySGNcuUP49DWhsFw2PxvOKf4BFkGsmRZ2GtsJ0sxG4+RRkCbuW2sa+kW?=
 =?us-ascii?Q?9601fOHSTeeUkjflUWaAzRpHIVFLwzu1ACddqEJIwavi6V0LH5axHpr2wf89?=
 =?us-ascii?Q?dWf1uDIQcqLnOctDTbbkcTbvnJCPiuPf+e/uTNQj8eQm8xqAF4B9dk4CFYY4?=
 =?us-ascii?Q?5nIYyGgeSZDHOl7TYX+sua9nwlD8pR8PbOr1I5ECmW4RwjrSGx2RTQSFMsy9?=
 =?us-ascii?Q?QTcl2hA9a0dYGwKoS+AIjcSWlDxadc1sd9h6DgX+RW56m03uLbNdMds5hLTj?=
 =?us-ascii?Q?ESIUedq/djG3hceS2BQjm5NOBkYU7/t9r6WoDNFKE5YutXroobDwbYlbMzHC?=
 =?us-ascii?Q?j65EOw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82075196-4c53-4efb-2a1f-08d9f18506ab
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:29.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSLHKvVlXnRAhDppdOfmZwmjxj4R3mAsD9imrOG4F8X74YTE440ba/Af0/bLSmuEfatVG/bJupqctd85uDU/5u/wx/rGAGxNneyROXTdWVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

Split intersecting-requests functionality out of block-copy to be
reused in copy-before-write filter.

Note: while being here, fix tiny typo in MAINTAINERS.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h |  67 +++++++++++++++++++++++
 block/block-copy.c      | 116 +++++++++++++---------------------------
 block/reqlist.c         |  76 ++++++++++++++++++++++++++
 MAINTAINERS             |   4 +-
 block/meson.build       |   1 +
 5 files changed, 184 insertions(+), 80 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
new file mode 100644
index 0000000000..0fa1eef259
--- /dev/null
+++ b/include/block/reqlist.h
@@ -0,0 +1,67 @@
+/*
+ * reqlist API
+ *
+ * Copyright (C) 2013 Proxmox Server Solutions
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Dietmar Maurer (dietmar@proxmox.com)
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef REQLIST_H
+#define REQLIST_H
+
+#include "qemu/coroutine.h"
+
+/*
+ * The API is not thread-safe and shouldn't be. The struct is public to be part
+ * of other structures and protected by third-party locks, see
+ * block/block-copy.c for example.
+ */
+
+typedef struct BlockReq {
+    int64_t offset;
+    int64_t bytes;
+
+    CoQueue wait_queue; /* coroutines blocked on this req */
+    QLIST_ENTRY(BlockReq) list;
+} BlockReq;
+
+typedef QLIST_HEAD(, BlockReq) BlockReqList;
+
+/*
+ * Initialize new request and add it to the list. Caller must be sure that
+ * there are no conflicting requests in the list.
+ */
+void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
+                      int64_t bytes);
+/* Search for request in the list intersecting with @offset/@bytes area. */
+BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
+                                int64_t bytes);
+
+/*
+ * If there are no intersecting requests return false. Otherwise, wait for the
+ * first found intersecting request to finish and return true.
+ *
+ * @lock is passed to qemu_co_queue_wait()
+ * False return value proves that lock was released at no point.
+ */
+bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
+/*
+ * Shrink request and wake all waiting coroutines (maybe some of them are not
+ * intersecting with shrunk request).
+ */
+void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes);
+
+/*
+ * Remove request and wake all waiting coroutines. Do not release any memory.
+ */
+void coroutine_fn reqlist_remove_req(BlockReq *req);
+
+#endif /* REQLIST_H */
diff --git a/block/block-copy.c b/block/block-copy.c
index 0834e29b6e..ef948dccec 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -17,6 +17,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "block/block-copy.h"
+#include "block/reqlist.h"
 #include "sysemu/block-backend.h"
 #include "qemu/units.h"
 #include "qemu/coroutine.h"
@@ -83,7 +84,6 @@ typedef struct BlockCopyTask {
      */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
-    int64_t offset;
     /*
      * @method can also be set again in the while loop of
      * block_copy_dirty_clusters(), but it is never accessed concurrently
@@ -94,21 +94,17 @@ typedef struct BlockCopyTask {
     BlockCopyMethod method;
 
     /*
-     * Fields whose state changes throughout the execution
-     * Protected by lock in BlockCopyState.
+     * Generally, req is protected by lock in BlockCopyState, Still req.offset
+     * is only set on task creation, so may be read concurrently after creation.
+     * req.bytes is changed at most once, and need only protecting the case of
+     * parallel read while updating @bytes value in block_copy_task_shrink().
      */
-    CoQueue wait_queue; /* coroutines blocked on this task */
-    /*
-     * Only protect the case of parallel read while updating @bytes
-     * value in block_copy_task_shrink().
-     */
-    int64_t bytes;
-    QLIST_ENTRY(BlockCopyTask) list;
+    BlockReq req;
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
 {
-    return task->offset + task->bytes;
+    return task->req.offset + task->req.bytes;
 }
 
 typedef struct BlockCopyState {
@@ -136,7 +132,7 @@ typedef struct BlockCopyState {
     CoMutex lock;
     int64_t in_flight_bytes;
     BlockCopyMethod method;
-    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    BlockReqList reqs;
     QLIST_HEAD(, BlockCopyCallState) calls;
     /*
      * skip_unallocated:
@@ -160,42 +156,6 @@ typedef struct BlockCopyState {
     RateLimit rate_limit;
 } BlockCopyState;
 
-/* Called with lock held */
-static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
-                                            int64_t offset, int64_t bytes)
-{
-    BlockCopyTask *t;
-
-    QLIST_FOREACH(t, &s->tasks, list) {
-        if (offset + bytes > t->offset && offset < t->offset + t->bytes) {
-            return t;
-        }
-    }
-
-    return NULL;
-}
-
-/*
- * If there are no intersecting tasks return false. Otherwise, wait for the
- * first found intersecting tasks to finish and return true.
- *
- * Called with lock held. May temporary release the lock.
- * Return value of 0 proves that lock was NOT released.
- */
-static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
-                                             int64_t bytes)
-{
-    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
-
-    if (!task) {
-        return false;
-    }
-
-    qemu_co_queue_wait(&task->wait_queue, &s->lock);
-
-    return true;
-}
-
 /* Called with lock held */
 static int64_t block_copy_chunk_size(BlockCopyState *s)
 {
@@ -239,7 +199,7 @@ block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
     bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
 
     /* region is dirty, so no existent tasks possible in it */
-    assert(!find_conflicting_task(s, offset, bytes));
+    assert(!reqlist_find_conflict(&s->reqs, offset, bytes));
 
     bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
     s->in_flight_bytes += bytes;
@@ -249,12 +209,9 @@ block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
         .task.func = block_copy_task_entry,
         .s = s,
         .call_state = call_state,
-        .offset = offset,
-        .bytes = bytes,
         .method = s->method,
     };
-    qemu_co_queue_init(&task->wait_queue);
-    QLIST_INSERT_HEAD(&s->tasks, task, list);
+    reqlist_init_req(&s->reqs, &task->req, offset, bytes);
 
     return task;
 }
@@ -270,34 +227,34 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
                                                 int64_t new_bytes)
 {
     QEMU_LOCK_GUARD(&task->s->lock);
-    if (new_bytes == task->bytes) {
+    if (new_bytes == task->req.bytes) {
         return;
     }
 
-    assert(new_bytes > 0 && new_bytes < task->bytes);
+    assert(new_bytes > 0 && new_bytes < task->req.bytes);
 
-    task->s->in_flight_bytes -= task->bytes - new_bytes;
+    task->s->in_flight_bytes -= task->req.bytes - new_bytes;
     bdrv_set_dirty_bitmap(task->s->copy_bitmap,
-                          task->offset + new_bytes, task->bytes - new_bytes);
+                          task->req.offset + new_bytes,
+                          task->req.bytes - new_bytes);
 
-    task->bytes = new_bytes;
-    qemu_co_queue_restart_all(&task->wait_queue);
+    reqlist_shrink_req(&task->req, new_bytes);
 }
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
     QEMU_LOCK_GUARD(&task->s->lock);
-    task->s->in_flight_bytes -= task->bytes;
+    task->s->in_flight_bytes -= task->req.bytes;
     if (ret < 0) {
-        bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
+        bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->req.offset,
+                              task->req.bytes);
     }
-    QLIST_REMOVE(task, list);
     if (task->s->progress) {
         progress_set_remaining(task->s->progress,
                                bdrv_get_dirty_count(task->s->copy_bitmap) +
                                task->s->in_flight_bytes);
     }
-    qemu_co_queue_restart_all(&task->wait_queue);
+    reqlist_remove_req(&task->req);
 }
 
 void block_copy_state_free(BlockCopyState *s)
@@ -450,7 +407,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-    QLIST_INIT(&s->tasks);
+    QLIST_INIT(&s->reqs);
     QLIST_INIT(&s->calls);
 
     return s;
@@ -483,7 +440,7 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
 
     aio_task_pool_wait_slot(pool);
     if (aio_task_pool_status(pool) < 0) {
-        co_put_to_shres(task->s->mem, task->bytes);
+        co_put_to_shres(task->s->mem, task->req.bytes);
         block_copy_task_end(task, -ECANCELED);
         g_free(task);
         return -ECANCELED;
@@ -596,7 +553,8 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
+    ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
+                             &error_is_read);
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
         if (s->method == t->method) {
@@ -609,10 +567,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
                 t->call_state->error_is_read = error_is_read;
             }
         } else if (s->progress) {
-            progress_work_done(s->progress, t->bytes);
+            progress_work_done(s->progress, t->req.bytes);
         }
     }
-    co_put_to_shres(s->mem, t->bytes);
+    co_put_to_shres(s->mem, t->req.bytes);
     block_copy_task_end(t, ret);
 
     return ret;
@@ -771,22 +729,22 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             trace_block_copy_skip_range(s, offset, bytes);
             break;
         }
-        if (task->offset > offset) {
-            trace_block_copy_skip_range(s, offset, task->offset - offset);
+        if (task->req.offset > offset) {
+            trace_block_copy_skip_range(s, offset, task->req.offset - offset);
         }
 
         found_dirty = true;
 
-        ret = block_copy_block_status(s, task->offset, task->bytes,
+        ret = block_copy_block_status(s, task->req.offset, task->req.bytes,
                                       &status_bytes);
         assert(ret >= 0); /* never fail */
-        if (status_bytes < task->bytes) {
+        if (status_bytes < task->req.bytes) {
             block_copy_task_shrink(task, status_bytes);
         }
         if (qatomic_read(&s->skip_unallocated) &&
             !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            trace_block_copy_skip_range(s, task->offset, task->bytes);
+            trace_block_copy_skip_range(s, task->req.offset, task->req.bytes);
             offset = task_end(task);
             bytes = end - offset;
             g_free(task);
@@ -807,11 +765,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             }
         }
 
-        ratelimit_calculate_delay(&s->rate_limit, task->bytes);
+        ratelimit_calculate_delay(&s->rate_limit, task->req.bytes);
 
-        trace_block_copy_process(s, task->offset);
+        trace_block_copy_process(s, task->req.offset);
 
-        co_get_from_shres(s->mem, task->bytes);
+        co_get_from_shres(s->mem, task->req.bytes);
 
         offset = task_end(task);
         bytes = end - offset;
@@ -879,8 +837,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
                  * Check that there is no task we still need to
                  * wait to complete
                  */
-                ret = block_copy_wait_one(s, call_state->offset,
-                                          call_state->bytes);
+                ret = reqlist_wait_one(&s->reqs, call_state->offset,
+                                       call_state->bytes, &s->lock);
                 if (ret == 0) {
                     /*
                      * No pending tasks, but check again the bitmap in this
@@ -888,7 +846,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
                      * between this and the critical section in
                      * block_copy_dirty_clusters().
                      *
-                     * block_copy_wait_one return value 0 also means that it
+                     * reqlist_wait_one return value 0 also means that it
                      * didn't release the lock. So, we are still in the same
                      * critical section, not interrupted by any concurrent
                      * access to state.
diff --git a/block/reqlist.c b/block/reqlist.c
new file mode 100644
index 0000000000..5e320ba649
--- /dev/null
+++ b/block/reqlist.c
@@ -0,0 +1,76 @@
+/*
+ * reqlist API
+ *
+ * Copyright (C) 2013 Proxmox Server Solutions
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Dietmar Maurer (dietmar@proxmox.com)
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "block/reqlist.h"
+
+void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
+                      int64_t bytes)
+{
+    assert(!reqlist_find_conflict(reqs, offset, bytes));
+
+    *req = (BlockReq) {
+        .offset = offset,
+        .bytes = bytes,
+    };
+    qemu_co_queue_init(&req->wait_queue);
+    QLIST_INSERT_HEAD(reqs, req, list);
+}
+
+BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
+                                int64_t bytes)
+{
+    BlockReq *r;
+
+    QLIST_FOREACH(r, reqs, list) {
+        if (offset + bytes > r->offset && offset < r->offset + r->bytes) {
+            return r;
+        }
+    }
+
+    return NULL;
+}
+
+bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    BlockReq *r = reqlist_find_conflict(reqs, offset, bytes);
+
+    if (!r) {
+        return false;
+    }
+
+    qemu_co_queue_wait(&r->wait_queue, lock);
+
+    return true;
+}
+
+void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
+{
+    if (new_bytes == req->bytes) {
+        return;
+    }
+
+    assert(new_bytes > 0 && new_bytes < req->bytes);
+
+    req->bytes = new_bytes;
+    qemu_co_queue_restart_all(&req->wait_queue);
+}
+
+void coroutine_fn reqlist_remove_req(BlockReq *req)
+{
+    QLIST_REMOVE(req, list);
+    qemu_co_queue_restart_all(&req->wait_queue);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 4b3ae2ab08..7a5292b814 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2504,7 +2504,9 @@ F: block/stream.c
 F: block/mirror.c
 F: qapi/job.json
 F: block/block-copy.c
-F: include/block/block-copy.c
+F: include/block/block-copy.h
+F: block/reqlist.c
+F: include/block/reqlist.h
 F: block/copy-before-write.h
 F: block/copy-before-write.c
 F: include/block/aio_task.h
diff --git a/block/meson.build b/block/meson.build
index 90dc9983e5..e2f0fe34b4 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -32,6 +32,7 @@ block_ss.add(files(
   'qcow2.c',
   'quorum.c',
   'raw-format.c',
+  'reqlist.c',
   'snapshot.c',
   'throttle-groups.c',
   'throttle.c',
-- 
2.31.1


