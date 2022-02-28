Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A8D4C6B3D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:48:59 +0100 (CET)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeWQ-0003m4-Nt
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNj-000276-F9; Mon, 28 Feb 2022 06:39:59 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNg-0002MY-RI; Mon, 28 Feb 2022 06:39:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGBZb3xPLu4oelYUJZb1XVBSSp8Vu87UGcBEw46TrhEwNa2amuKMXddpMV5QGZw3PIyJyUFpu610hJR4T8YDnO3Uxh+5DJm2xhRtasgLksVmt3wxhudlVwvwhZ9dyGA70M4N946luHzWDAXwXtyZSrFwwGV0Fs+TPsqlDCaWkDLvTfVSpBdO5uP3SMji76eocWfnAveTfI2V1v/pybyUpmn1Hh0YFvtyJleARSTZu77mb3I8uPzdFq7OtmPTOM+9LYn/tMGBGtRdco9V2oIuOQXPCj93WmrjgBwJePHZitVjdUNs9uNcdA2c3MsppeGL0ZKllZ7n3hEj7zSLHB2+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaFaCIlrKSa8vyLZ56XZNX4j9VzbYSS1R0l5bSP18Uk=;
 b=m+pm32XQETJl8CciAzPxdkVvyuoNJGR1XVeXmLTLYzB5QWGiwh7/+dcdm+cAuClHL/JnS/6yKtcyTzZ8aHJihVBf8VfZXi4L6Gayv1149U6pTklf65ZG7GArdqTP+tAOREiM0JsOlVd0TP5V/smubghnRrURnskmccnR4oPdcpKzdu1GFUC0p/iMt2tkl/DftdW1MW6iEQ7TPS1u23oirNEwK68RCu9BNLxFcsp183rQbtpeXw8ghtryNsJtlp45ZSrmiuMqYSduFOH4ugSBCM34a6Sfn5ik8SbpmxsAv9+1g2WdHdcMPQUP3rjaxRLVksOhBUWHrAmFGfxxM85hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaFaCIlrKSa8vyLZ56XZNX4j9VzbYSS1R0l5bSP18Uk=;
 b=rpUyh5PAH8ne1euND8AV8XFTyU4mNZ7fYryP8VaJe0SxGtYhlssDnnAZ1mfhrH5Iiaq8zpU+p5qVlb/u4Omg7iedROw0g0fUfLIDJHHNXWbS4++ki6O8Vc1UioKuvECBa66fE5T7XaadGYc5kRjOr3ga10W8quZANKHSMmTfv9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 06/16] block: intoduce reqlist
Date: Mon, 28 Feb 2022 12:39:17 +0100
Message-Id: <20220228113927.1852146-7-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70eabf81-9371-4115-5c27-08d9faaf0737
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272E5BF05BF854D7608814AC1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /iFQZPoNRuIBys8AmAjgn8WeK6pD8pk3y/ceWNMOH2OvOxkjOq9JRM+aW9rqwG6jHskK88Rkyr3y9/vD7uf65v0FnysmWx70KVzyu4awxFPT1ya3noVSjNBu+ndLax+htJiabW69uosxRE4aeyGg0ZDdQ5UxC95S98enKgxNSjfKJlzCJJUy/MlC5iYpDQYFDC0ytGItQ/s2wUb4NbRkcoC/bcu1u132oN+mpXDdrdFq9DyN0aiP8JYTPaG17d3UvqJA+VYxtvW7Mh5psGWb/jFQBZ9LKRkecDZCPGcJAzjh9X+G4olMYYEcpeL4zTZ8KmlbQWByeQL6F8yOaGpX2mNGVjjZCVeeCIQHhlNVTSt1ZKRDkOkRiT2OAv6fZdJuVWw7MsHcYYVXFSD2lCqReDhNEls71AdjigGgFOrqDPUDFUNxSSBJtHyQVXlh/YdHMEn74ipWTOY0RdYAvF+qaZaUCLqiIyWZoELj9S6o7S5404pS71jpZzOlCUM8PkTsbvjDTr6QKAGms4z/a5LBj7iMOpozRSozofG8YeXnDkLTUcWUTT7+LuQCp6c1VCXexIEQhzUAFGjUHYXLLO7FMe9HLiXeqgB29ZzAJrz7R1uq9K0KU1Cyn7Cq0E6ZiDqVkxH81nnb9DXoX94ifn7Wz9Q799Kd/5NQhwygHNfj6jMRkv9pnQMA0W7mkAP0JpLW4IorsFz/Kob+dpHvmmKmSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(30864003)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXjcBceMoBVHM4IF7lVanwHkB9qOgfoN/an2RTfRfPQtbXJMd8wjL5kTEPBf?=
 =?us-ascii?Q?3KjD0DlPj1ab4cj1ZVJgpriAMQpyG/aLPzsrB/DmtcHAa8u/ZHvGisJsXYuM?=
 =?us-ascii?Q?lBWcyR+3I/qU14Zt1hLSvFbxpuE0KkGBwylYsBJkPRVzeXaE+qZq4F8+SBg7?=
 =?us-ascii?Q?ZtRbGDx8jWi3Vz+YH+lO1unRrfeNdU7Y4aoEP+eISStHw2u7d2hslS7O5V78?=
 =?us-ascii?Q?v5i14ynIXkODpWCCueXPqnZp/U7DIt6tHoASoWVAApLmY8otRSlg1JDcb3V/?=
 =?us-ascii?Q?U2cocOWhwGIWIkNSvLU0Vn5FlTqdGI+N+kysSSAVMlJk3sHEdR06eaJWhwbi?=
 =?us-ascii?Q?PZgep3ytwb/zR+3Z0tU8bHS/zrJlIUhqYK07REsPs87ikZ2pGyy269mmwVa+?=
 =?us-ascii?Q?22tYLLYAFbjvk/kZk+g1uqHgacOonaS2fSR3jnMS9FueAaFoL4AnDsaRdEZR?=
 =?us-ascii?Q?7QKFaAnK981LaOEFefmub9ssjb0t8Tl/FUmuq8jBUZQnM7cm4unP+t3WZBsa?=
 =?us-ascii?Q?vSOS7U9lppcL/DsxjForta87bhWJ5VzZCPHa4PSiBBXYruDVJWAt/Ws+i4Dn?=
 =?us-ascii?Q?1gUVFZAR1KCP4O2tVHszlBO2s2lPjQ6xB57RqKDH/h0tBW23p7LDVFd46qg0?=
 =?us-ascii?Q?S8+8l7fTIpgyu9Bf1kF3guZiYeM3WbtdRppTToiwOfeEngPhNTlh021AF5Jk?=
 =?us-ascii?Q?bjUG/gipAP/6T7ccB1XsQqre5y8jQACuWnd1C0nDdQ1VBwuqoIt8flrpcYGG?=
 =?us-ascii?Q?HKgDomKL3e0t85bT6S7Mx/pLWlXEeRT9n8ihyVjAWCZF9jn0cxpksUe+L58r?=
 =?us-ascii?Q?lhnBw/26pp30jVCdokkr4RVQvfHFVG11X6GYFoCjbDbCaHD53wYs/NRKd+0e?=
 =?us-ascii?Q?4XMFjoOrWPwIZ6IPlblqVagleHukqL8AxDsxWZnd9e4HQ8QvHs2uvjvZNQ+S?=
 =?us-ascii?Q?runWi8of+l9HamuZV+P8taeKjb/AulRRIoEDFDl8bcNQdzUqnSqwUCDbcDdK?=
 =?us-ascii?Q?WHBE1SU6JYN9ndQrw0fimqY5We4o64L3uTP5583XtTISgzs+7aclVXi2KZVc?=
 =?us-ascii?Q?kXCGpwZJ1BpodszkwYBWDlOzcsNVqYneZL+pgXZkHKI9n6y2MsTWZlmJUHo5?=
 =?us-ascii?Q?PRiwszkjQ8wWUW2BP8Bf//+h74tizXbIP7t/5NeXkTivfLVy4cAG9YkJQb/k?=
 =?us-ascii?Q?dlEmmZ5GoVzBB9JpR+fWaWM1H0X2UYEgtRCZU6KQFujkkKQe8Jqk7Ga/3dZW?=
 =?us-ascii?Q?zlKBOUD+Ff4dpBpu3zPUUJqgnzuj+551vCfOFCaZKljlo6wu2fVkIlUtj66U?=
 =?us-ascii?Q?AYwqSXuqhotgdBxCqxeTmtN0Fgwtz5O5JXkPFrkyTagJLImR7LVvsWo34nSp?=
 =?us-ascii?Q?BLL+d9C9w+j7to1cTrTRFv0HefC+caB3JLw3qErxe9lbgcMHwjcZMNzlh2uM?=
 =?us-ascii?Q?pJ7pphhj3d0SWIKlVKAG6dpCI5n5NPNkR1Sdf7BbaEo5Z4BFIBEUhmoAxLL+?=
 =?us-ascii?Q?NfgwpAD8MsS99b0WWlYAh/M/qHpSLLcrNpqNnyIciZ7mhTInVhF+2Q6sn9mp?=
 =?us-ascii?Q?+PsiwCIT5Fsk5vfv5wCMAgj1YuKSG0DBIBzKkbEm5Oi8ztbI/zSBs7JFqlBs?=
 =?us-ascii?Q?OBrO2vn5qlMcc7dyzf4oEOQDBKzbCgwBCmYx3bDGIJL50PaJn2KEp7/OBeu7?=
 =?us-ascii?Q?bOWJZA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70eabf81-9371-4115-5c27-08d9faaf0737
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:49.9112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wul8i39iFc7l3UwVxEDi2nH9oZfbv1zI6yb+3OrLyOiQWF+nEiWCD5XHlbioYC3A9imJTeefMYo8bQAQIGaSb5e3Az2oibMFPHzF3jOOyQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
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
index fa8adc2618..34a36affff 100644
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


