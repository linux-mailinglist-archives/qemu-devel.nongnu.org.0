Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D215647D62B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:58:00 +0100 (CET)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05sF-0003SP-Nx
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:57:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bg-0000w4-Gy; Wed, 22 Dec 2021 12:40:52 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:22241 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bd-0002WE-Rl; Wed, 22 Dec 2021 12:40:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijIuKgD5ggafStyIejDLjkH7rPcu0qG/4B53cqq3giLNyvH8gES2l4aZEdkGDsf0kEmwMxY6DzdMRdrYpLmEyWpALgKl9jPa4z5c2rYx1AtYXZFbRGtZd1h9uv4++ez80C4axXikNzO4i+MhoE8GThboLekBT4EF2WxlJMPCgBUiHIPyMntQUJs6hE4jVcARduEkgl/xyyE098OqH3VZwxXYaEEgEq2k9HYvzwp7EPUHZKnP1RKFDO7kkLyCzgRv83wBG4Vd3l9hgw8yUnCKcXMdsTbbwbo3qH3TLzy312MnDk+Q3WpRmhXP9HsicvNn29q21ZxX2ELzuJgkP/OHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ru12ndVWXyNiun1iuUmfzTlTRHk1C3BI9pVGj3l5Tw=;
 b=ZwewiFGc+W1EXKI4Sxz/OUAJMf7iM1IaXTMOK6QFQ72brC7BFpFlUwwR+rWZdOSefFz9SCqouXGuVhCyYt8u01ul6bAEmI2ugcmRZu7d8ZqCjVgjqm0rEtUWxl0x9J968ZHzR1pAQgDV7uFJ/HQJqfpia3Iizq06da9ijBcm230cNR3nHze4l6M1hdqgenXjdyBEY+AsSZeZCSq4IAWiUhiaR+67PMTXA4EMKyEVPr0kA4PEVEx4vg4JRSGBK+Q1T2axuqs508IOB35tmX1SPlSTfNXFivnWJ5fufRV9RpZtamINWDQiKqRfceNXYIgZAajdLXR9QUV9d2nM7DLRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ru12ndVWXyNiun1iuUmfzTlTRHk1C3BI9pVGj3l5Tw=;
 b=bpCq/LgauwLjYPyDd1TIiRa9gEDdNcUa3zHc+6M5ZOVLMLtkJCrYifqE7PwhpAu1zKNRAzerLyenrprjI1rDSh1KH9vzFIXYyBEKJxIYTfzqi2guUs14lWqYus3UzYRjMg6kIMjZsczr+m1egBeFLOQSKNGhoiVUf+6fx9ujKJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:37 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 06/19] block: intoduce reqlist
Date: Wed, 22 Dec 2021 18:40:05 +0100
Message-Id: <20211222174018.257550-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22eb1320-d5a7-44a5-4ad9-08d9c57229d1
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB2988851E02C4A3A4B839835FC17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/oQeGwJxjDa+GQRFnqbZbZgphcRI9l8usfquLqgmrzrK/tsmnn21L1vwUJXEC+RFkDIPjAfQgWEi3Sp6i1BppznCTcRbvUecwlhAPLpT6bsVLOA2mRPyRpk3TPJUhw3+A7dM4JamTZT8SpWD4dhoXe2ddD/zgUkcT4mXGsklMloaK03cCaoBDJIMz/KE2vx7YeFpsFZcgihUq6FlPHs71cmcC+BFaLUsgSfvSq2QAtZlrRznAgyxqNSuOrrpNXdEzpDqUCI5OMyHekc2ykbJKUN/XrvqCsn0az3pOFPJzcSzM7oPsuiOe/qdPKmFn2l+feNITBux5TtRsJi6QSlWq6zVqykiV4RPhNr/ZbMnerI4m26UvYOcbwiejUCbrUvzCCQ0Drfory452igJRl+qsJ5EWxqmsvvw0DmmBaFFS8e5dkUYpdXDaZqZONAxNeF84PhYUV5lfHyUXW0Mslps/4b9XAtUto+h/umFFIySNdgcnyzudf5h3SrZZwiaugsLtf0S8Bu8euBAUX7YpPwkwIFP8yVpXfksTh9k+fDnwokdSqmXzjobIxskUEDX3+0tol0ViRd4WScgcodBB2n7fibzXmDIdisn2cR9NUuYdneNxTWZJ8hbjM8esML/25E870oAAHtw20h4ghO59faeuiNasp21SyLPUFsIDZuWOJfivK1r6fx+4/UZdZTlLNi6Dl3Qbs+Kfus7dDMaxfBng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(30864003)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnHOtKxWBVPPOG5zqTl/xkQj2frHxPgbT1WAJpDdE+8yeOJa6tUMtPTEIVBS?=
 =?us-ascii?Q?s6gKaEwpMwcV0F8oRu0cc/leyxtwQOZJiLAz091Ttwk1D2zQD7+YuxRq8FAQ?=
 =?us-ascii?Q?UBYuN2h/w8rajC1KYLx69t10ihvq6VXFWxnPIdYYwYsGTT0idnd7XPYaUCtc?=
 =?us-ascii?Q?KO6n1NEbGf9BecguO1/EEPT9aFG9KOenmshTHr+iBIU2WZUm4dcpFfYz2DHl?=
 =?us-ascii?Q?oeepzUHPbnHPgnsgjWrdA2bPfXoEBJH0/I3K4U+8ju21g9d2pOBlfAppwO5g?=
 =?us-ascii?Q?HzlhWOeU5ppQVxySw2K2/TJzA9qHeLvqcZUp7ynRQstNPQ6sg5ofs3bn9Qmb?=
 =?us-ascii?Q?xSMZo/p8QrL3dylo0fQnDfCH7i2ynBhjH/ltBEcwulgn8fO/wd3BSUaicMGq?=
 =?us-ascii?Q?qgJ4IwOg3cyd4gW7jhoIvLCSTgo3VEthZRIzYfzjVJ/rxAl+mGsau7kGdfWX?=
 =?us-ascii?Q?/eQjgJ6oIhEdxAPiuKqgWj3zK9c3kA7gxW3uObq2QMM3Nauc3kawHQUnbk/Z?=
 =?us-ascii?Q?GTImldyCXF0F8y29ZiZJvCWJelh6EV3rO/jtkvi5N6f6UHwMPBeNFzJpCi69?=
 =?us-ascii?Q?u3flwX+7RUSns8/X0XJWmv8DAWkhP4JATKSSahcvPLb3LFNEv6RFF0iaD/C4?=
 =?us-ascii?Q?YLC06pRbWE6/I8CZqziQUzQSFoDEUDVHZ6UNHGS8cDXEN4Ka4pV+yOdshKsW?=
 =?us-ascii?Q?PKmQU1xMyDebVrceqUBNn0p3hwvpPn7iul5YSSZS9CRtjsf2zv8skg2lIDbI?=
 =?us-ascii?Q?UXW+D2tbdC/7dfba4hBwwgKNEB7SKToAHqHu/lfirhtQkwLXFVG84OV21a59?=
 =?us-ascii?Q?AepgFfmV/xVZDHBArSE2WB5gG3f++dIUwGLCy/V37SUkkCda9RBqEqLzRfDv?=
 =?us-ascii?Q?ogi/qZYQLaDrfxQn8vWlyX08lwizXyeqtbkgug+ZU6NugrS/4NzvDLqkr1Lc?=
 =?us-ascii?Q?AGGm39tWpL01p47Iphqi4kSWGIxE8L2Z3aGYts6u8QMsYOlinYaDZY9bu8Ej?=
 =?us-ascii?Q?cVpek9ZE2j6Cbd7StK9wbNwDs1zyOXvMT6mfnvMMzdFpkXM4caX8zGtBq/ch?=
 =?us-ascii?Q?uU4S3Qtm4mJA0/qwBfan+9VRC4QPhGXPycURxcQlAQ6wRfOiWj4ikfIMbR72?=
 =?us-ascii?Q?F8ZAmZZhdlUeLpg2RIudvGxTMjWnMhNGakZ5y8rcRnQ0K21yvIIndEf+doGI?=
 =?us-ascii?Q?RMTM5fmw50H5lBvnS2Ub3dLynyQh1emcyr1sC8RU2JSxuboHbjBR3fdvAcSx?=
 =?us-ascii?Q?1jPxSoDB1ZWa4x9263pXrIL+pnHBfHWyuqfx6rTecdSO2vcV8lI6JnpiU/+Z?=
 =?us-ascii?Q?nbB+MR0piOKRKoOwHph5H/4xwF0u9jjUzaHlHOis7ONlgl2iV1bZiXE4wtsF?=
 =?us-ascii?Q?sH/xwcLtLxZhwkECaWkCy3vPrjpjTc5b50FU35GBo+WxGsGU2C+FrKbrufs6?=
 =?us-ascii?Q?hPqMzZsvx/SLrMD8FwhSPX5ifby6cKIU4yW8W+tL5PYK3zUrVHKvsccOxamw?=
 =?us-ascii?Q?s2jQghYzodz7gi12OaOvedLMLJpYC0YYhzgRGddDlgY7ziJ5z+WaMqP9BmiH?=
 =?us-ascii?Q?fyqNooA6tgqGLLX8aKRKYAOksfpvUP2xGgYQTWYf9Y9+bGQXxmv4W/t10JTF?=
 =?us-ascii?Q?maq3zbxvYDT3YssNVyKv1I1+roWpHTEfpHxNQmLhc5FTOyOSNVWbWlNbO54d?=
 =?us-ascii?Q?sY+XWDoG9phXpPIXD9tRxuTTtJ4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eb1320-d5a7-44a5-4ad9-08d9c57229d1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:36.9879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu2ttAVbhgiJnOo/j7C067OgJ9rAINPSG0cHIuMVa3vNxGeGJnUeMmD4iHu0QY8kdYwd9U6qQ92PdejMoQEtYWjAuNWOI8gl3D2xho02yRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 6228cf01d4..f70f1ad993 100644
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
@@ -448,7 +405,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-    QLIST_INIT(&s->tasks);
+    QLIST_INIT(&s->reqs);
     QLIST_INIT(&s->calls);
 
     return s;
@@ -481,7 +438,7 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
 
     aio_task_pool_wait_slot(pool);
     if (aio_task_pool_status(pool) < 0) {
-        co_put_to_shres(task->s->mem, task->bytes);
+        co_put_to_shres(task->s->mem, task->req.bytes);
         block_copy_task_end(task, -ECANCELED);
         g_free(task);
         return -ECANCELED;
@@ -594,7 +551,8 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
+    ret = block_copy_do_copy(s, t->req.offset, t->req.bytes, &method,
+                             &error_is_read);
 
     WITH_QEMU_LOCK_GUARD(&s->lock) {
         if (s->method == t->method) {
@@ -607,10 +565,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
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
@@ -769,22 +727,22 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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
@@ -805,11 +763,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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
@@ -877,8 +835,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
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
@@ -886,7 +844,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
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
index 5dcefc0d01..7f24ee4b92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2418,7 +2418,9 @@ F: block/stream.c
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
index deb73ca389..5065cf33ba 100644
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


