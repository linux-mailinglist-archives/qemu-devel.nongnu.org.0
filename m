Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FCB4CC684
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:46 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrSL-0004xg-5v
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN9-00042F-Im; Thu, 03 Mar 2022 14:44:23 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN7-0004Wu-49; Thu, 03 Mar 2022 14:44:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hdh6n1EByZo5//hsh5fj0zylEPYPPrxrlnfg72XtL04pq3Zdgxu3AUeBBPRpYTmdih9XAj8jOtyoyiJwn+iIS3Lf6cfWptQ1FodcoeoZMD9u2KK04YnrCEbMA2c2DqNvk0jbeswke3fUfztZgUeeFo6EtOVayCw73bRAYyHaSZINPUQ06d2ZXfwao3wLBS5JujNUrWsSDAtdVcBhnnZj4R6OnTjzmC2bbeZxv/4vuxFQZQB7k4j6+9S5XPQ/Tb6yf6+GQF9Gbme/Y22IHi5yOi+4FjIJan+dw09fkZf7iB1NVppDQP2skSoQae6LBBndlGvMrNaLou0oRX7zC2ev7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTYxUruk2BC9BKuOqqk2NLVJaD+C49EkEw7ZvJgoBkM=;
 b=fNkaVz5u6iMspR5WhglxtUOozEFLKwvtLluLCitNFKfMNkwdzkRQsHOyyRP6ExyiKlNKFvtwkNHSlaIVbSzCctDygedIFo9EXNgc4cHQ5fVHrFN6Z4YB3fFTtz6jgKhW4fJ1/SlXuute+bLIkSsHwXcqeWx8NWTtfV2S7J5GeC2xX42wQSAZ4tXXz3jbSbFvGfde3WV7mrzKMndCG5QZQKBdk8FyxObYC0SVcQaoPl+34R4brKJmzViQoWS9589vQjnv9h1Lgzwxz7PAkwZkusKlgg4GwiOFxi0a1PD/UOEk5twVh1yfaEVC2mpnQ0LDACnRJV1anP7vfP91L8tdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTYxUruk2BC9BKuOqqk2NLVJaD+C49EkEw7ZvJgoBkM=;
 b=h3e0hdv2ukkX96XKqIXh4VuI9FD/uFLA2lhsBx6tuyuScqJBBbib7bGeF4nWKQrU24pT+k098PrTX+MP+P1SvkXuzeQcXRDK0cxpofL0APRAnPKHWQEusE0/VWx7mhlofsVxHLINMCOkA19UwqFAhJ9PwTlFj2AXDE0zl1t5G0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 06/16] block: intoduce reqlist
Date: Thu,  3 Mar 2022 20:43:39 +0100
Message-Id: <20220303194349.2304213-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36462020-ef95-4982-1acc-08d9fd4e2f24
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736330A3E519464EBD9421EC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwV7o4hDWoV6cHsCH/OXf1tXSFNML7qznk7cGIbMNnTrfSFJINYx9cCAxDFJO02lxV1Nlfi3WFWF4IXkVzb34ZdoiCgfvLKYVzKZWgqoZ3DuIkQCg7bdFW+46T3vNthzJawytoD7CfqOWbdSYpbwTlzJVGElM7GRHL4igbr8kDCClQhuROnCdJuxN7UOCfJyv8qVGBVyOkbHG97Kso7AqbxmveW76fEg5IE5LQTQMCPeTVBFOV767QM0Hzg7aA9RRIbeOGopZ6B2uLemUEzF4rpplHxFrK9GIhZVrYgPHd5wrqzsgD7vwpguCXzasZxVxDBfCfRp7MvG1IE/4tz+3rZjPIl4Gd+YUH+taHYti9R0BfGQMyk0CBvXCn83is3ejg2QkvU+XTqviUMf+Qhhk6W1uKJL7PHICAWrHPG5H/KH/jjWVq+3Wyd3NnzhOOxZ4/MFVloic9BXmanU62C0tZIzxyGEdJVyF9BFWuyH54UwGHNha03HtkiotBk32d1+2DJqanOGXiS4febfzofBIcIMfQ9JgoBW83btn7wRFShnS/lOgeRF2rQKZh8MiI5EcP1CAUB0Stq3BhjhEWUe3upb1BcyqMq9S+yHmaMV0cYb19iTqXF0IrKtwRfRGF33PTq8rYuNmqPjRD1hPcR8/n/s1FLoYbMpBCXaCgBep7Vyt3P1n5aKkbT78FguFpCLWsJRdMLUYFnIdidSHDuVww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(30864003)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+9d617NGcBekDSEK4BRywZ1Ux/4GjCrWXX0hXYqMKCnZ96UJnigxrEs3Ro0?=
 =?us-ascii?Q?wxaWbcQ6v87xgpXj6sUZkkWKUqE6Ouh4zm6qe3u9Wsnt6vT/vN+8FgdLTVT8?=
 =?us-ascii?Q?ASPXfJVdWkS7EEahE5Ruvzv3e1Nhn6Q1s+QBWRE7g+bNzLN+84S3StEMAVWo?=
 =?us-ascii?Q?NFgXfIM3F5W+i5Xa96QFmQetb2rmQYRZUReekdVrYdo0K7tGMfUSNwEXeQsg?=
 =?us-ascii?Q?7enclKL3s3LtU4d/uPbDjTC9XXkfKrHkomT53HambG66z2cfbVFM2kkzY5so?=
 =?us-ascii?Q?Dum5mRbCRJ9hamzbcHIabCUfbRafXdP/+ZVjmeY9f8jwdAfs7eh1ObScBT4+?=
 =?us-ascii?Q?xtgrAtBgEJ3JYbbDb8BzYqNfEgMEA1ibv12pI4NnSnixOl3CcafrKnq65/Q8?=
 =?us-ascii?Q?UkaRLvFt5urXsMZDpIemc3ZOrPd0LnRTMOh50SOcUGiK0g84uXmaimnLYn+n?=
 =?us-ascii?Q?/tjX1XWYsz3lTDrZerUq+bxKOs+WnwBnBAGIYaMoV/XKLj3Z6yOO4CiuB6Ly?=
 =?us-ascii?Q?pQkB3tV8fEkkGHD2jil0q3XpskJZUlAU607EjZVFGYgXRghW86i3vRoW36B/?=
 =?us-ascii?Q?0MMlUHz9JIEdNG4cUYyljTq45zitP90apV5zRvvfQTYEMIBmPacAKvhfxXAx?=
 =?us-ascii?Q?lM5K0O8ldsmXZvqZPCeJj0PNyiwb0ISoCoYMPy/Dq67yLHn+bJxBtWW1FgD/?=
 =?us-ascii?Q?35vkQ7WEBa0SUApS8vcf+8pSP8cKnCblYoY1NC2K70fRaBhQX2skSfeKXPTf?=
 =?us-ascii?Q?ZQZcSC+V3tjlr3DQqJwC3OeHXoXs3EtK3AZFTcC4sMXhquqDJCdnn3I3SEGb?=
 =?us-ascii?Q?p56WmUyogmgoyrhLbxw3HjWYw3uT74vZA5Pypu+tbMTdtoMvRuNITeQSn4FZ?=
 =?us-ascii?Q?EXHYp1jQLqk85GCzqcKCn6n5jbEmSfJupjbgMaT2i4Y8kMhza5gQt0ReUqK0?=
 =?us-ascii?Q?aDbLBu3yN8M091kScCyas+CGQE+IlNWus4hZY08tuigKp8pDBgKtQqo7iUWj?=
 =?us-ascii?Q?0judNRwglWkln0ob6N4lDOS16HikOyAmnHYmXRwrYlIi4P9l0VF4RqsIfwoS?=
 =?us-ascii?Q?ec118NIAzap/HmJh+3c9gJpwiNSlrxi2lwTcZGvygJkAOWADvDAqSnOJ7aci?=
 =?us-ascii?Q?q9wOjvhEdtL+0j/u58iGg2oxqz9wYtNsTFatk+Ehtgw1Cf3OoA6xqx3znWgi?=
 =?us-ascii?Q?lmI6xzaO8vrFGTm+iifYxvpYbYhfDrXD6kcHFNClbPIoy1BoAosqsG9v8t/3?=
 =?us-ascii?Q?0QD76nf8ow33soyLUoVuc9C/IEE0J2svxU0hL94iAEqQdJTrobm9THi1cHRL?=
 =?us-ascii?Q?aavILqkJVGAOPYdmOoZ8FjbWneO0lrXcMYKyeRfriSlS35+JO4qRvPguYJkO?=
 =?us-ascii?Q?rOXkGNjrZplIkcXGvAYZ52vQDbfh8vwDnvzGfZqDZRfvFKA9q1xrU1UkHqMU?=
 =?us-ascii?Q?Bm2zfieA2WgkTGidk0BxHcuhrhlAv5lrfICJfEvxI912rGkY77EGs6khu/cS?=
 =?us-ascii?Q?IPfbJXE1nwUJCMOSX+99v3RxYXSFtg9X/jz+UrinSY3T49CYogfV/qNaVLU+?=
 =?us-ascii?Q?POCDoQ1WigJhVddENJherpX75h7Liu7MipH761ZUX6mSlMdvQCQsEaOpxryp?=
 =?us-ascii?Q?0Hu72I9NtAX4sMSvUgYtZaAAWnUIjnKUgFOMZ0nwyCuj4wnoU1G9EnoRvUf7?=
 =?us-ascii?Q?LaR/MA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36462020-ef95-4982-1acc-08d9fd4e2f24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:09.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezKBSEb28lQzyR4dXiwEVXIpsHcLCcV0FR7wkhuy0C/T5LVtxwQhti3iR5xuWafhQCsp1nQ5sMhoXooCJ1fh2H1wHcMDabWxdwOrLfPfUnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index 68adaac373..101eb50619 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2515,7 +2515,9 @@ F: block/stream.c
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
index 8a1ce58c9c..41e9cc5dc3 100644
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


