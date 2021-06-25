Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B316F3B440D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:06:43 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlXe-0001gb-M0
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRs-0000mK-Nv; Fri, 25 Jun 2021 09:00:44 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:46688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRo-0006Hb-CJ; Fri, 25 Jun 2021 09:00:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aaa8bcrTo1yV1b/w/IndAEmSzftIAeozUyH18pp/lvv1lMLWrWbjjlJ2ErxmrwzYa9X0o75r7SgWTjD3fxDKsq0Mw2ffqpuQVhpY9cLaAFG0qd309EhZcbYOX8DWKhgf/anP0eSQdEk3niti6rDAz6x/ni4hWQBQKHNjfHcu1Ix2G8pX2U2ZeLo7EISqzmo8FN5MGGj69wna/B7OaiY4Fu6oBekt4r7ObmfRWZEx3i4U4ogW1fRgJa6PeQ4F3hdXFrjPR7WLV48tQ/uihoegmVMAN/T4a2CIggXno2NspUsOxr3rKu8w5DIPdSv1zE6nAbEilT7LNJ0EP71JztwlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbg2bCyIaVkT6jKySS9Gpe2DGfcdP/gzwMKALL/E+yg=;
 b=mEqq0hcimULQnfbGkpEakb8E/Z8hMzaMX/3gySxerTyjkZXFnIuHw/5+8+HW5m4ZA9GBWvYsyZW7ANrwHkvlX8B90n4m9/BFruRkcnTNFb3qxIe+p0Ff5D17IMGaV4TvpWZ9Q3vorV364+gVQW2nfCe+jJNtXH1KvbWZw4uZvzv9ybVQb2U0476WCaGGJ1PZzMJeR2TvyHO1g8ECB7Vrp8Uw8QHywfhyM1S81BzRLT8KNj+iF/tAFRR6sDcC0EUbOJm+5JRhwInCMmn398OlcCkdG6kAVFpuKhqe4Y+2Q98kN5KRpDnbs4G2RlaTN1fuZd6gMKL0nubC7MRYAlvAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mbg2bCyIaVkT6jKySS9Gpe2DGfcdP/gzwMKALL/E+yg=;
 b=eXEjWy7ovwkDiWeBPdFmvhiXZNPZSM6hUNq7PGgTp928RyULc13yC7qOYV+5HwryrOrwPuRQgUDKFUwqZuHXMSEfKqFf6B1LzPirffQk4JjFlso57vXYWlmYtsOuVVLm+f1N7xT0eGxpvxTZb0T04GRJ/ykFl4oXVUaDeUE8c5s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 04/10] progressmeter: protect with a mutex
Date: Fri, 25 Jun 2021 16:00:00 +0300
Message-Id: <20210625130006.276511-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2123d608-2da2-4c40-b699-08d937d93385
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652EC3D102687E08AEEE658C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9B3rXQYME21BETHw5jyQ8PWdGP4OjEsBCPDwnGbXUVHHdfmjketjWoAN/493MIBQiH90GwJz8cDwM5qmJvYIGSIrhzlt/3Yfsqa2ol+DgYn/sjpQdL2wlvt2S/coNrnj5HZoih9xpI3q8yNAFYMfKMEn2Rh/F0O1leOtcBypZIz/OuFS7J1tATrSIOQnFEwIclUSssF3XKZtCrCr2+vk/GnXO1uZKFPTef3eUjqtNYENFkerqFKw6CwRIgQIKhDLwYhoGurrauy2P+s86a+yxl1X1YHOpNnMpWdKFEroXRdWNhZ8ylfDluebs2yyhGgE+yAH6VAoQ9C4IJzUHF1XHbY9kAb2kONvpRSnU8p2aluMKALUa7A1n7z+3w27ljS2ir7b6I/IowxZBS6s/lQee27UGHxUslDwUFOHi5TX8vCZdcacxiC00spasO4NxIKwfhUY+jZ8vx4RSByGFYltWiUsbmaQ30SPMsS7lgJCiFRl7E6677ghht0ypaGx+myxv6xc5xDjqy9McoxnOOFwzZ3dB6d0nPPY7eo34Di/50VGOoTSWmZvibyDi0jZo1rMVEbVb57ctf8KNdTOYieHF+ttkjyxNTXXNZND8ixFOUgtZ8/Dpq3ZfrnMktOBWPez5Cj9CGupwChIEinO10RGJSf0LctNyLsaqK6p9ovBNcK8dbT/FJesOq7J77WSrmeFYP0z/prDcb22PC6QBmd+7tmKtwEZyUMzj7ifF3bTQI70Yf1ualV0LESb4OsN5qIrFkRg4Hq2R2cuM71jC91c+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(30864003)(6512007)(83380400001)(36756003)(86362001)(69590400013)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7LYZXYN+ExcLu3C/UooQF2X9lAWtHNVKhotl8jLctEq7u+kgNim7PkE6NKGr?=
 =?us-ascii?Q?GijkkpHzJIw7b8jKsdDJmmOUY3jeJ9W7ahjC1h5svoZF9EWmOyTRxfNyhHHt?=
 =?us-ascii?Q?UiA3bsooDRXl82hx2+ZTSfvX8xcZLFRWM88sqIYYlfMDz4s4Y3V+wspv3+vV?=
 =?us-ascii?Q?XTuLqWRL36kKbUwdDaCjYN0oioAQkfohz5Joc9WNKXHUOVDCYgxZCqp0dyHn?=
 =?us-ascii?Q?gsIh0GzZqWMOMS+t5r+30/0/7NpgQ9omBH0+uy7NABNdHYRruxdz8yVhi0Pw?=
 =?us-ascii?Q?DaRzqna0v/9h3YWE7PEzRACUrhHr6Nce97Lz5JMWAUgppZa1AzXpjAMNiVbU?=
 =?us-ascii?Q?+/rsVX1zcg9BR0djWqhRfWwgX+aTUnCGDTHqYKP2WADdmXrPqbKDViiporaA?=
 =?us-ascii?Q?HsRXF0ak2frSWE8l+ASmZxsKidK9493tLOYylGi40cfKgOKBJfDcbw2Lm3oN?=
 =?us-ascii?Q?pKHMhJ2hIey7YHzbMFfiRrvABDCRjg/r4e68kOIN4nYMbffvdz9xOVKxFJIt?=
 =?us-ascii?Q?Um7HPDBq6WlgQ1s22HeJ1PD8fHDxaIyUqvEcC2hbUIDPxAbJKmLqedim0Ih0?=
 =?us-ascii?Q?xJBF1QCwXp7PSD6fo3xeiIqHyfgUw9DIXLgVZq+aKe9zDN6XiPJQifIm4xza?=
 =?us-ascii?Q?d3rd7pauI2JWgfJuB6PUxrP1qpEvF4nnrQPRXE4VEXZpX7rsrFFegh0xTt8f?=
 =?us-ascii?Q?8BY3GjlObTkwAwkYaqLseGyoS5zBSt1AUOSETT4lSs1wUoTHTGE8msd1wRz5?=
 =?us-ascii?Q?vgGpL7j9MMHaUGIX4Op5UiOR6Dq+N3t9dW4TZYrgBNmOzOGLV6w4CIy204hp?=
 =?us-ascii?Q?FdUCIZkp/gcXH1NJ7mXpevG73yA95WJATAuXc4hZbawIAt9Vdvlddj0Gs49D?=
 =?us-ascii?Q?DTjOxhRKahEf7HErFblYT71+DuI1o4FxD+nLsLoHF7vN0c6HT+C23bMDRqaW?=
 =?us-ascii?Q?ELY9t2fuNGXEeNxuodOU0wh3DfnzIun2aSnh7RygWyS7i98XOD6gjfIhqqwE?=
 =?us-ascii?Q?XWN/POx6EnV/PL9VlF+jGJJNFMgmVBuHbfGKx2CH/J3ugBSpemSu6rhnY6Cy?=
 =?us-ascii?Q?GdxPshYOdA4jUpjhVvI3Y/ig5gVP8j3+hFUbRIRfiFb1Gi1IJQqI9rMFdCK9?=
 =?us-ascii?Q?Vmm/EzVMHWN9nCwFIqjW57l4mC6Wif1yASKAQ5IdhTG8QGYGUC0C08aN6tCU?=
 =?us-ascii?Q?eMlbKfs5Ec6lAtQZBm8j+THSLo+YPgYVazRNMAONjlUUboiS/u1gIPrps1Q2?=
 =?us-ascii?Q?PAgLD5aBV0hVj1Ng4XWU0OnyTOZaaVH5xZTl7mYzTS+27RUzTnxwB1fAqmeD?=
 =?us-ascii?Q?fei75l1P3UK+CzR2AzeGz6rD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2123d608-2da2-4c40-b699-08d937d93385
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:26.3887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65yfvCkmOY9nzC3o6kgfTUGwgEsWz0zxNb/i5XTYW1VthBPKJ7KDmZzoNi9B4Dh8bqXEcRnf2YcDzrWOUdfmWk769C9i17BiWyIOqigOO0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Progressmeter is protected by the AioContext mutex, which
is taken by the block jobs and their caller (like blockdev).

We would like to remove the dependency of block layer code on the
AioContext mutex, since most drivers and the core I/O code are already
not relying on it.

Create a new C file to implement the ProgressMeter API, but keep the
struct as public, to avoid forcing allocation on the heap.

Also add a mutex to be able to provide an accurate snapshot of the
progress values to the caller.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210614081130.22134-5-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/progress_meter.h | 34 +++++++++++--------
 block/progress_meter.c        | 64 +++++++++++++++++++++++++++++++++++
 blockjob.c                    | 33 +++++++++++++-----
 job-qmp.c                     |  8 +++--
 job.c                         |  3 ++
 qemu-img.c                    |  9 +++--
 block/meson.build             |  1 +
 7 files changed, 124 insertions(+), 28 deletions(-)
 create mode 100644 block/progress_meter.c

diff --git a/include/qemu/progress_meter.h b/include/qemu/progress_meter.h
index 9a23ff071c..dadf822bbf 100644
--- a/include/qemu/progress_meter.h
+++ b/include/qemu/progress_meter.h
@@ -27,6 +27,8 @@
 #ifndef QEMU_PROGRESS_METER_H
 #define QEMU_PROGRESS_METER_H
 
+#include "qemu/lockable.h"
+
 typedef struct ProgressMeter {
     /**
      * Current progress. The unit is arbitrary as long as the ratio between
@@ -37,22 +39,24 @@ typedef struct ProgressMeter {
 
     /** Estimated current value at the completion of the process */
     uint64_t total;
+
+    QemuMutex lock; /* protects concurrent access to above fields */
 } ProgressMeter;
 
-static inline void progress_work_done(ProgressMeter *pm, uint64_t done)
-{
-    pm->current += done;
-}
-
-static inline void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
-{
-    pm->total = pm->current + remaining;
-}
-
-static inline void progress_increase_remaining(ProgressMeter *pm,
-                                               uint64_t delta)
-{
-    pm->total += delta;
-}
+void progress_init(ProgressMeter *pm);
+void progress_destroy(ProgressMeter *pm);
+
+/* Get a snapshot of internal current and total values  */
+void progress_get_snapshot(ProgressMeter *pm, uint64_t *current,
+                           uint64_t *total);
+
+/* Increases the amount of work done so far by @done */
+void progress_work_done(ProgressMeter *pm, uint64_t done);
+
+/* Sets how much work has to be done to complete to @remaining */
+void progress_set_remaining(ProgressMeter *pm, uint64_t remaining);
+
+/* Increases the total work to do by @delta */
+void progress_increase_remaining(ProgressMeter *pm, uint64_t delta);
 
 #endif /* QEMU_PROGRESS_METER_H */
diff --git a/block/progress_meter.c b/block/progress_meter.c
new file mode 100644
index 0000000000..aa2e60248c
--- /dev/null
+++ b/block/progress_meter.c
@@ -0,0 +1,64 @@
+/*
+ * Helper functionality for some process progress tracking.
+ *
+ * Copyright (c) 2011 IBM Corp.
+ * Copyright (c) 2012, 2018 Red Hat, Inc.
+ * Copyright (c) 2020 Virtuozzo International GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "qemu/progress_meter.h"
+
+void progress_init(ProgressMeter *pm)
+{
+    qemu_mutex_init(&pm->lock);
+}
+
+void progress_destroy(ProgressMeter *pm)
+{
+    qemu_mutex_destroy(&pm->lock);
+}
+
+void progress_get_snapshot(ProgressMeter *pm, uint64_t *current,
+                           uint64_t *total)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+
+    *current = pm->current;
+    *total = pm->total;
+}
+
+void progress_work_done(ProgressMeter *pm, uint64_t done)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->current += done;
+}
+
+void progress_set_remaining(ProgressMeter *pm, uint64_t remaining)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->total = pm->current + remaining;
+}
+
+void progress_increase_remaining(ProgressMeter *pm, uint64_t delta)
+{
+    QEMU_LOCK_GUARD(&pm->lock);
+    pm->total += delta;
+}
diff --git a/blockjob.c b/blockjob.c
index 22e5bb9b1f..4bad1408cb 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -306,18 +306,23 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
 BlockJobInfo *block_job_query(BlockJob *job, Error **errp)
 {
     BlockJobInfo *info;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         error_setg(errp, "Cannot query QEMU internal jobs");
         return NULL;
     }
+
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     info = g_new0(BlockJobInfo, 1);
     info->type      = g_strdup(job_type_str(&job->job));
     info->device    = g_strdup(job->job.id);
     info->busy      = qatomic_read(&job->job.busy);
     info->paused    = job->job.pause_count > 0;
-    info->offset    = job->job.progress.current;
-    info->len       = job->job.progress.total;
+    info->offset    = progress_current;
+    info->len       = progress_total;
     info->speed     = job->speed;
     info->io_status = job->iostatus;
     info->ready     = job_is_ready(&job->job),
@@ -344,15 +349,19 @@ static void block_job_iostatus_set_err(BlockJob *job, int error)
 static void block_job_event_cancelled(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_cancelled(job_type(&job->job),
                                         job->job.id,
-                                        job->job.progress.total,
-                                        job->job.progress.current,
+                                        progress_total,
+                                        progress_current,
                                         job->speed);
 }
 
@@ -360,6 +369,7 @@ static void block_job_event_completed(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
     const char *msg = NULL;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
@@ -369,10 +379,13 @@ static void block_job_event_completed(Notifier *n, void *opaque)
         msg = error_get_pretty(job->job.err);
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_completed(job_type(&job->job),
                                         job->job.id,
-                                        job->job.progress.total,
-                                        job->job.progress.current,
+                                        progress_total,
+                                        progress_current,
                                         job->speed,
                                         !!msg,
                                         msg);
@@ -393,15 +406,19 @@ static void block_job_event_pending(Notifier *n, void *opaque)
 static void block_job_event_ready(Notifier *n, void *opaque)
 {
     BlockJob *job = opaque;
+    uint64_t progress_current, progress_total;
 
     if (block_job_is_internal(job)) {
         return;
     }
 
+    progress_get_snapshot(&job->job.progress, &progress_current,
+                          &progress_total);
+
     qapi_event_send_block_job_ready(job_type(&job->job),
                                     job->job.id,
-                                    job->job.progress.total,
-                                    job->job.progress.current,
+                                    progress_total,
+                                    progress_current,
                                     job->speed);
 }
 
diff --git a/job-qmp.c b/job-qmp.c
index 34c4da094f..829a28aa70 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -144,16 +144,20 @@ void qmp_job_dismiss(const char *id, Error **errp)
 static JobInfo *job_query_single(Job *job, Error **errp)
 {
     JobInfo *info;
+    uint64_t progress_current;
+    uint64_t progress_total;
 
     assert(!job_is_internal(job));
+    progress_get_snapshot(&job->progress, &progress_current,
+                          &progress_total);
 
     info = g_new(JobInfo, 1);
     *info = (JobInfo) {
         .id                 = g_strdup(job->id),
         .type               = job_type(job),
         .status             = job->status,
-        .current_progress   = job->progress.current,
-        .total_progress     = job->progress.total,
+        .current_progress   = progress_current,
+        .total_progress     = progress_total,
         .has_error          = !!job->err,
         .error              = job->err ? \
                               g_strdup(error_get_pretty(job->err)) : NULL,
diff --git a/job.c b/job.c
index 8775c1803b..e7a5d28854 100644
--- a/job.c
+++ b/job.c
@@ -339,6 +339,8 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
     job->cb            = cb;
     job->opaque        = opaque;
 
+    progress_init(&job->progress);
+
     notifier_list_init(&job->on_finalize_cancelled);
     notifier_list_init(&job->on_finalize_completed);
     notifier_list_init(&job->on_pending);
@@ -382,6 +384,7 @@ void job_unref(Job *job)
 
         QLIST_REMOVE(job, job_list);
 
+        progress_destroy(&job->progress);
         error_free(job->err);
         g_free(job->id);
         g_free(job);
diff --git a/qemu-img.c b/qemu-img.c
index a5993682aa..7956a89965 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -900,6 +900,7 @@ static void common_block_job_cb(void *opaque, int ret)
 
 static void run_block_job(BlockJob *job, Error **errp)
 {
+    uint64_t progress_current, progress_total;
     AioContext *aio_context = blk_get_aio_context(job->blk);
     int ret = 0;
 
@@ -908,9 +909,11 @@ static void run_block_job(BlockJob *job, Error **errp)
     do {
         float progress = 0.0f;
         aio_poll(aio_context, true);
-        if (job->job.progress.total) {
-            progress = (float)job->job.progress.current /
-                       job->job.progress.total * 100.f;
+
+        progress_get_snapshot(&job->job.progress, &progress_current,
+                              &progress_total);
+        if (progress_total) {
+            progress = (float)progress_current / progress_total * 100.f;
         }
         qemu_progress_print(progress, 0);
     } while (!job_is_ready(&job->job) && !job_is_completed(&job->job));
diff --git a/block/meson.build b/block/meson.build
index 01861e1545..ef1ba3d973 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -13,6 +13,7 @@ block_ss.add(files(
   'commit.c',
   'copy-on-read.c',
   'preallocate.c',
+  'progress_meter.c',
   'create.c',
   'crypto.c',
   'dirty-bitmap.c',
-- 
2.29.2


