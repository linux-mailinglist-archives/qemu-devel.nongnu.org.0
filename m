Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E23F9EC6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:28:18 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgaK-0007so-FT
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRB-00018F-P4; Fri, 27 Aug 2021 14:18:45 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR9-0006cC-AI; Fri, 27 Aug 2021 14:18:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGKPkClI2E+KYhw+2rD9WfkqqtoLgiG8XmwiwMeJFQ9tGwfudwF/Jt7pmky/GbDL+rhvazwq+WBz450wBf+q18u38nKi6LfWps8d2FfdkyG+yjv/60wy+HuFRQVVWnL1pzKgeU2vaIsavgL47GQUgDtM1W2KBGdu5ChqQD41h/T51Uf0Weqm9UsiSS9UFFWBd8m8hqcMSFRMOPk6rX787QHuts9Mw4+sR6jZ5LgI7W+phQuy+96XDqnt+NzAVkQ5QNYnNK6gdUCjdLtCpo6eax2ztYUMnaZ6kH8AVJeOYvPGSuIomme9PKATyuq7FF2Tb9x8MXBDMO2XdHZ3wFTDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUqhcqqCmZtsCbd2cz8PpLDKH7AY66a78oeMIbCzlVA=;
 b=VuNnt/s7s6YoH0xWZGbIOxf2YV+PeiNwxIJd8Xc5uiZgwR8z4MrRCKKmQRI1sEKk4lAl6kvuMs6Ih6ZL9pGtTTZ7tU1AAStXsrzIao4PRdEWZQMu2RXLanz8pBbNxHzY2FQoCA+pLWWA0XzqzmKTy9OLsSs63ZhLGOxSo0Dvq8Vv9ulDiGb4d3F5T1A6DYnVhvAMmQsLZ7WHCp7EBSXyI+7wyRSFVEHgIU6/7MMoIiBd+/AhoRgybwciEAx+Ffj/k0gNrQlAnyr9hM9ZfqeBM+97zZYXLTU37BJhlO5/NGn1xSwGdQN0L2j3MFZ4lZ9Mpy1BcRLC8ztXB6wMT0DqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUqhcqqCmZtsCbd2cz8PpLDKH7AY66a78oeMIbCzlVA=;
 b=t9WuHj5iFWk/pO8fUD0kSztZx52hczXQSgo3wCKOQbCVWanmyA36hGA8cv9ctCvYlmJDeT9abXKBu8JEYrf/Rl+yp3crG1hJEA4zeIaC4+31R8EtHmDUGTWYWocA73SspXPbnrtGPsn9b7KzLmjCzEKsvZeOLKSik1RsgExdMxA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 06/19] block: intoduce reqlist
Date: Fri, 27 Aug 2021 21:17:55 +0300
Message-Id: <20210827181808.311670-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10418e6-7ab4-4616-9579-08d96987134a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765BD5D6E9A5E27300F87C3C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SO7tNSG6sSzUeSOuhUqz7Zw4czPA6iJEdseHEckECJF3hkcmqmFVL8XHNQ4oE8Oiyq4tJAxfy9WEU83YV6JGb2+ShP9eutLMu6tFYY8l1Ms3lEBZfbWeZ6X7UeqgMZnSgBLhQwUvICgZIweE6OX+ybJ7OLiGXqmlyECSTOGwI8zygOKMeZ03BT5fpj+E8XdRGYKEwbgtBb0vICR85EtWi64lP+s97nIKvilUA+f5MlPqEJ/Kxh4A+01ryv69r2wv+u6KSNoSfdTe/d2BeWwO2qlNV5iSGvD1zzGffmNUD310zqKtoEUh/RXCB79UOgS3ZZGBzeMqk2QUxKORdhquTjOFo660awHsFnOfFW5D0cLQuNQxICPySpv0nWP0tiL+87Q/pA1MBv49gTSsR4h47RA8BB1JS+lE8oIqs4qQxHJ3W1TwnG7lOXCxx7fUTK+xP4FtCWYZOcr80G7XMPsIrP2fDQcgzoXoUHUvfVy4LCmv8Cu8Wff86OClgPJGcoYxNryonvVYyc12ksZUl+6L46aQmOVRqzmmk60SNv6uJCQItvMcXlGfINyZcG9yHazApp0AlLuTBSVZKHoNBt7XF+9i4xD8zTooc+7gM+Jt5JNM/n2RJ4qoCGpGf/VcEJp4GY7WIy6H2nJDvsUqrd9f6LHXrJY/nLbQBGPNlQiIyfbt/CKs5zk1pcVKtX3FsvDhNCdO0pCjEkSgNd/vqYejhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(30864003)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QauU8i8PT5jelBGm8t9iAg9rKTiYvh8I4Kn371nPOXCLxNrScFkT++nu0Wo8?=
 =?us-ascii?Q?RMJXUmXtf5LSr5krNaJwOgJiBjrvNaaZqU8QhWZwrsh3ff+e+q333coDER7g?=
 =?us-ascii?Q?VGjJwjfW8aBkZH+NF8HT3dtanDZrHcLq+GYaPg3Q/GIwOxxYn3PizV47BW4o?=
 =?us-ascii?Q?gjZVhnavdRwoqfEFWWA5/7xZz9n8GYFI8MEia4AlSOPCsRbLeypnxNpYE3A+?=
 =?us-ascii?Q?zwJg1/uU+9JggLfbvLFxacn/KmT8ob7WHE5jaLicQm6fruFPo9MoCGi9ITwe?=
 =?us-ascii?Q?K0zzd5a1lsNXQa6IYd3bDBvwaUDIeTS8NP3ilQff0V3zqt7Yr4qb/h8SLBuZ?=
 =?us-ascii?Q?4RjBGmTZUgcQUrLRArdLywGQYmpsXFcRMM4e7iuYGFSW36ToHx1gRpABmnvs?=
 =?us-ascii?Q?sle2Xt/V9hTbTvocRiYINtN3K3ZizC2EQ1MPZgnv+gAxAK6iZqAI3dxjil4W?=
 =?us-ascii?Q?KTmInMEXg7IBQtVzJX6I/qc3v2a67VtxV+GShFA70lGNtXQT4FYMcmi7rIUG?=
 =?us-ascii?Q?aefvXik26fcCHkOQ59njwpZmWwDxmJ2LlqA0JdzqT9o3fbUQhgnxvWAte5nQ?=
 =?us-ascii?Q?kBYzaPtbiX7Oq37MRSaYbW+qKKBNjg6LujmXMeh8DK6aIKeF9Cr665rn7yLe?=
 =?us-ascii?Q?xd0zTgEr74AcTqArsKlPoZu+8ntaYmUZZ6657Tu2yhu1g1/ATcdfg12Lc3+4?=
 =?us-ascii?Q?Jl5py10K+1nmXZUEfaj+MiqUk52bBC9BIx/N//p4sThbMJHsMzT0qcERG4GD?=
 =?us-ascii?Q?ALNWigYc6OLLVmOs0ADwxgzUAQpWy4VoAg6K2u+JMjoRNfP9wsY2N1Ipfu8u?=
 =?us-ascii?Q?vq+9mqQWc7MP2CgRRKZkfcpEm8UxSMugwEMGbyhEg8DjlxdL70OEIClYRWdY?=
 =?us-ascii?Q?sEWto35oISb8Ml1jWZI+R+EYiUtRxs7K8v4vCRzYcvv1jhLOzqHjg3X7LqGf?=
 =?us-ascii?Q?vTVgiVqewA6H83uYx7uPDfbDB7GCl2TXu3Crm0Q0rjDf1y5F8KL6j7ABPiDG?=
 =?us-ascii?Q?zF3kjvuJY/Bnc708XFI930LxUP9PXOQ/5G3DUcqgkT9seYE1jP+bgumQYfrb?=
 =?us-ascii?Q?qmOgzPD7arzvuLcDaLJ2J5II5GJ9+7iK2R5EqTf/XUJGSRPqQpvLH6a11Qy6?=
 =?us-ascii?Q?x73yG2ncQmlBTmQUd0upRxviaTWlkKJNisOth9+8rkiOkAOMA/s1LOwDEqEX?=
 =?us-ascii?Q?XXwnbpM6TpFEK2kmXgBfWF8AKYoXWL5L2Cz3VI/pevaZZE+/JFp8THudrhiu?=
 =?us-ascii?Q?z6HXJqB61noUMG1UF719sUkdeu6c80KQH263QDwGUacfnaZeI3V2G6a36DTq?=
 =?us-ascii?Q?qsBd9f7L0ileeNXKD0iO4TVe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10418e6-7ab4-4616-9579-08d96987134a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:31.6365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri8hx/Pqw+Zl/GGveQJL8Rau8RxEapYm6axNIlSnpC2+hSvwiDGTZqK1yDRfbzRXgMgbPyMlYI4e1UV3VA5qIpWktf8zUxlwqzEv6yjjrQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
index 0000000000..b904d80216
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
+ * Initialize new request and add it to the list. Caller should be sure that
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
+ * False return value proves that lock was NOT released.
+ */
+bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
+/*
+ * Shrink request and wake all waiting coroutines (may be some of them are not
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
index ca51eab149..46e6a6736d 100644
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
@@ -82,7 +83,6 @@ typedef struct BlockCopyTask {
      */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
-    int64_t offset;
     /*
      * @method can also be set again in the while loop of
      * block_copy_dirty_clusters(), but it is never accessed concurrently
@@ -93,21 +93,17 @@ typedef struct BlockCopyTask {
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
@@ -135,7 +131,7 @@ typedef struct BlockCopyState {
     CoMutex lock;
     int64_t in_flight_bytes;
     BlockCopyMethod method;
-    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    BlockReqList reqs;
     QLIST_HEAD(, BlockCopyCallState) calls;
     /*
      * skip_unallocated:
@@ -159,42 +155,6 @@ typedef struct BlockCopyState {
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
@@ -238,7 +198,7 @@ block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
     bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
 
     /* region is dirty, so no existent tasks possible in it */
-    assert(!find_conflicting_task(s, offset, bytes));
+    assert(!reqlist_find_conflict(&s->reqs, offset, bytes));
 
     bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
     s->in_flight_bytes += bytes;
@@ -248,12 +208,9 @@ block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
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
@@ -269,34 +226,34 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
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
@@ -447,7 +404,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-    QLIST_INIT(&s->tasks);
+    QLIST_INIT(&s->reqs);
     QLIST_INIT(&s->calls);
 
     return s;
@@ -480,7 +437,7 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
 
     aio_task_pool_wait_slot(pool);
     if (aio_task_pool_status(pool) < 0) {
-        co_put_to_shres(task->s->mem, task->bytes);
+        co_put_to_shres(task->s->mem, task->req.bytes);
         block_copy_task_end(task, -ECANCELED);
         g_free(task);
         return -ECANCELED;
@@ -593,7 +550,8 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
+    ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
+                             &error_is_read);
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
         if (s->method == t->method) {
@@ -606,10 +564,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
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
@@ -768,22 +726,22 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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
@@ -804,11 +762,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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
@@ -876,8 +834,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
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
@@ -885,7 +843,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
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
index ece044bd25..2d58170224 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2336,7 +2336,9 @@ F: block/stream.c
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
index 66ee11e62c..c630e9374a 100644
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
2.29.2


