Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2913E01E3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:25:24 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGtf-0001e7-43
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGml-0002BR-Qy; Wed, 04 Aug 2021 09:18:15 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmj-0005TW-AA; Wed, 04 Aug 2021 09:18:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkjjygvrsPIDypZSo63CcupwQrr/PySN1xH11YNzVPRs55fxN83VsJJkJgH4qhtKwnOR/xrxpvx1d0C9u1w7mF4n8P8a3anScCUUSUeTVe3nu5XKendDlS9Kzk6vrQfBnCQNfb07Gpo6lxrYPjV3798iZImrQZPmfWgfXJrWuiQfFMfGgnpCRYrn/48lFAp65y6lkZTr34NwvowaxWqAWl0B77kOmTLZz9cqEhnbegCCk4zfqbAKG8l0FE9+VJTijy/8Dk3jwRfHxWnbl32Dav54/tYs6JCpr2tnCEKosBjPtP/uL6NPgK48JCXy8Km48lLPAbS5cHfdAPIScY0y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqypvV+v6Xsmx4mzTLvA731czYqG6QV5Bc3wVcTjNMU=;
 b=be+uqA7NwFjdOMmCU98NHrv2IsCAIea/3YUlaJOK9Cf/tsH/Vst+l2qPZ6GT2dAoT7G8nHPEna1Kskv3HXY7XhhidKQ71mhrIgSOawT3Oi5Um6W+kvFsjBBgLImHyi50St0KUiNE3/nSIaOBeUr9WpPGiSY5n80i7XIk9hoz9HrIjiMhqQl27KZM8+68bfedz+HkvAKh9p22n0Z2U0G7Rs9GJkaQ/WChKRXpJI7HSZKvbu2w5UGeBYncfFz+WdGSla7VLZSIYq1u2GSXaGps9kpo9cOCHTpeNYqkibvS2Bgc5kOZ5M7Zzjj4ixhsSZtngmiL0Mop0r/wU7S4u2SbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqypvV+v6Xsmx4mzTLvA731czYqG6QV5Bc3wVcTjNMU=;
 b=G+ySktUE8ohkXgnSPYTFCmtUtEDO/79FK42cy6t49P/Y8v8/tBwk89DOEUMmC9GOmFcwY2Rj1K8Ur9ZFNHKMBB3FP0f4BbyILXANJcW01g9RISvYkwES/ZhWDmPxFdUArm66B+wT1Hz3Uue3K9CLSDzXkZ73bFgXZ9VuPifwdMk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 06/11] block: intoduce reqlist
Date: Wed,  4 Aug 2021 16:17:45 +0300
Message-Id: <20210804131750.127574-7-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e94d4108-dd71-4bca-38c3-08d9574a4e59
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216C5FCC190E943F4C2FB95C1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvVCCoNCjUhpMsNJ57vPGLSRS4lzbVTUBrLgXX9rOI9jzsRv4FG/iB7tW8mOsb6U0kPasQoYRGJXWVws+D6P0Die03WCyr6mr4qpKcm5/vaHpaEBlQRYHXJLkkruvnFW/3yJ7SkEXyveutodSlfzMHVtEPXJgCn/gx7emyd4vNeYHMp7Rs4K0DxZwM5OCNrotN1eO5FTctHvIsi31Xvznji4KqCXHZFs+ZjYabNrPaWVrHkd8m+m2aNOB/yNsEd+xolatfDzUGYOcIFkP/eHyo8H/FIVRvFr+TcN//OPQ9gLmlCfehoHLtbzHYv4tlBdq0p/mqvloMDt5qN57T9ujjdkb2WZVe2+cMy+Tkocri5puadac8vtT02imRirh/zQ2TiiesK7PlHAY7GHmKcMNLleHZO2801TaWw34ZpcM2fTV8XWDZrGsEaq9Bxeq8CJdfDWBXCwgObbxLJlqvIakteb6kSToJG86qLJU0wEn9icM2CTrwFyN0V+ZAHpXewyfqeDKrT2uuiu4y53KOCYgyQ9P7OINAyP66YLcqUEgeD8lNq0W6ZvnAO5dL9VgBXR7JSfa2Wjfht/b/DpYJo0sX0nQ0UKPpBn+ysljQsJ2VWVHa7iHBSnNl/GvTCgeMeBjiHmba7I0hzeF8ttnbPJFuziwYlPo2o/RLgPeQ+ii1i/0KSFR7LWoNfxJCUdQRxO/la92w6HTqHGiwTp96+HxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(30864003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oqw7a9BqoB99Qn5OI3t9vJzBstNA50UFwDyYZAwmb+uBUuBlkXkk5c35Cnzj?=
 =?us-ascii?Q?VEQWZhLbsW8fvLfNJWMxYMivYp+lHMAvnIMN75GK0Wb2VzdbrEmXGuiqOL7t?=
 =?us-ascii?Q?P3T66bEGPwLnOz1+JoZBek++dn9ZVqdmpW8/9Uw0MiEBhx8IgG5Wbjkb7nWg?=
 =?us-ascii?Q?QJKjsGZKJP5DAP2Dwk6alDEBZYRXuRnN/n7B96W67i/3jRI4eBTcAf3vWUTD?=
 =?us-ascii?Q?cZ6yOE/F9d3m2imh4tsA9tBn6idW6ZbVON77IW0oONbiM0klHd64SxM6VIuB?=
 =?us-ascii?Q?ULEn5WkiH4uGq6KhOljmwsiphWY62iR2O2AQ7qfcfpSrhRiurMk/x24ll+aL?=
 =?us-ascii?Q?QqGrKbHSh3kmjNB+2E78BbOKb0m1H3QSSV35zMz5jD9TKNzsuz07tp4vx7HE?=
 =?us-ascii?Q?e489ZNJI8SFzT9NHgn6ysLCITZfXaf3G6PKNrurqgJVel+Bj8WfGv9G2Vn9f?=
 =?us-ascii?Q?kQnWBS87UbtWFQF9gTwOs+d/wu5lLMh4gFs3jqXgmPUjy08gPXZAZJ4Zr50R?=
 =?us-ascii?Q?Kfq+jepcMRdmTHN1zHx/4yeg/JmYPMkJxlGiXQjJnrioCbXtVJJHjBnT1NSm?=
 =?us-ascii?Q?5Bc3gBLeHcFMseB4vAGYi+SylLwtZ/QUU/y9a7pVRodUB0k9VyOA8FcpxQTZ?=
 =?us-ascii?Q?dFQlynxhoak6mayH0/7p99A+IYvGYit1cyiKtcxQ1dQOM08QwKg8/dNpIdLX?=
 =?us-ascii?Q?toGmwnrmuKxDjPxtIX2XV52djl+ctYPT4bFtOaQC6pq3lB1kuK19pWV3Ztmy?=
 =?us-ascii?Q?bFn5ILr2OVvtRTXVIeVXe1lV4Y++MSsXdvt2JB2rE71ARYv41WlUmkRz9CP9?=
 =?us-ascii?Q?M7S8o84G3RV/IpUsqEk/62Ngbdtz0hqZrnRbBjGlXCPFnfaj0eUudThJBwDA?=
 =?us-ascii?Q?z5C/TPz5ejJf+5+5rlzllhf3QJFRZdKAtBTVIuRs05vTMrA+TDH2r9TkYXwz?=
 =?us-ascii?Q?RiG+Xhq5WY+5U7DnbI5tJ0+XehSOMDRFku/cNtkQzSmpPJjaXJDoO0gjy6sV?=
 =?us-ascii?Q?FXEAZjgAQmd2Y2tf14riwnJt/sNIsfpKzOIV7KVUgUsS9PZ4EZxBjbyLPc+W?=
 =?us-ascii?Q?rjcT9JI+KxdN0kl+Vt/JBAPzvZapaDrxwypFsZAzYx1aFcSwJZfKhmliZkt1?=
 =?us-ascii?Q?6Crpvw78ZNPnaI135vA3MYKbZzdoSMxJ6LBJ3uS4fHm90hn8pbiuycQLiQug?=
 =?us-ascii?Q?mX2OCt5nrDlJUptbI3PmiGngK8oynlOwOZi2wPIt2viw0U78z5rp5ASTMYhA?=
 =?us-ascii?Q?k108a+pLqdzbqNx96r/Yo4z75F/W8QgV760Rkjsui0Ws3RF3res63WhxB+RA?=
 =?us-ascii?Q?auhOJhep4oSFKTnq2Mxo8/BU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94d4108-dd71-4bca-38c3-08d9574a4e59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:10.5652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utqBOH3QCWtA6doAwFTdXspI4rQiTxlcsKirMl7ktvj/YospPGR/Lhmw365qG5PpWNNpQelSUBsaQXXynXq9cLuy0ey2rsPlRSRi97kvTyk=
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

Split intersecting-requests functionality out of block-copy to be
reused in copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h |  45 ++++++++++++++++
 block/block-copy.c      | 116 +++++++++++++---------------------------
 block/reqlist.c         |  94 ++++++++++++++++++++++++++++++++
 block/meson.build       |   1 +
 4 files changed, 177 insertions(+), 79 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
new file mode 100644
index 0000000000..2de86be300
--- /dev/null
+++ b/include/block/reqlist.h
@@ -0,0 +1,45 @@
+/*
+ * block_copy API
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
+void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
+                      int64_t bytes);
+BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
+                                int64_t bytes);
+bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes);
+void coroutine_fn reqlist_remove_req(BlockReq *req);
+
+#endif /* REQLIST_H */
diff --git a/block/block-copy.c b/block/block-copy.c
index 5cd291727b..de388b7b96 100644
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
index 0000000000..c41415c16a
--- /dev/null
+++ b/block/reqlist.c
@@ -0,0 +1,94 @@
+/*
+ * block_copy API
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
+/*
+ * Initialize new request and add it to the list. Caller should be sure that
+ * there are no conflicting requests in the list.
+ */
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
+/*
+ * If there are no intersecting requests return false. Otherwise, wait for the
+ * first found intersecting request to finish and return true.
+ *
+ * @lock is passed to qemu_co_queue_wait()
+ * False return value proves that lock was NOT released.
+ */
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
+/*
+ * Shrink request and wake all waiting coroutines (may be some of them are not
+ * intersecting with shrunk request).
+ */
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
+/*
+ * Remove request and wake all waiting coroutines. Do not release any memory.
+ */
+void coroutine_fn reqlist_remove_req(BlockReq *req)
+{
+    QLIST_REMOVE(req, list);
+    qemu_co_queue_restart_all(&req->wait_queue);
+}
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


