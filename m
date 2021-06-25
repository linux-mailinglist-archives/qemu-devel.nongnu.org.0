Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2473B442F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:13:42 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwleP-0005XJ-CD
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlS2-0000uX-TW; Fri, 25 Jun 2021 09:00:58 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:54361 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRw-0006GP-7D; Fri, 25 Jun 2021 09:00:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcMa1HIaAey6xbcrgIMncgP9TJBf0trevTiSZOrzuJaA8KFrJcSNjuftBuj4/cmJnecCu27jHMRJlJdrP0zKEwz3OkZdKArC7L5LpIYHkvoXVstM6ZzYDxy8ytUu1InrFiqcTLM4wSBrzIC1Zpf7RsjN4fg81WxAghk+DGHbPiewA+JXQ0rHNTUJSnQ8mifKpwtyKk78deQszQDA5UFPKrVbIg8J/i6+V+CMGnJeKfLDofiJU6vKVS2hBFJNmUna/i3eahj/PWTxDxXAPo4YE8rrs74MlA477SY4IM5TZwQtkyFiGBRAVgwWPFi2FL1JGsCOkgPMWApd3z7gZJneKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7sMJe4XLIInm0Z9thxQuyy8zTbS1a7EmSxBZ4RC/9w=;
 b=AlmcUnxhwtmSoEUng2QRYlHwA7Uf52VB/zuTvnPIVCnsJXau19wGisC+KnO3UCpqJyW3cSUlXpFj6xr3kYE5ypuIevr/BSCEm7GNGSIrzQTnNde92h1Pg5i+EQLFR5BQDBQkuJIpqiNa/tocA7DcznQT2nd79AG9NIu7fPSyJJqIBKuNNzOh0cm3XFHB0nExRlK+ID26/ISEHmQ8SiZZAiY81lgHg3XKMEK8SGEnvx4fF/OdAEcR2fcINlY+EldFFsO6N+Uvti+Kx2z4i66b4ldpSGkYrfRzYktvUXHwsDaucekZ671oMGUxHrAkfkSBjMK4KYBK7CdMukEDJF46qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7sMJe4XLIInm0Z9thxQuyy8zTbS1a7EmSxBZ4RC/9w=;
 b=huH5iDKRXwPNQfwrlUZFlJ3j3CZh7Ir/3LkZ/ICyof30grraF8nyg4UaeND5KZRi6LwgBZuLEgjSDSXvT2Un0wd/OJjqO8okAkpcBB3zBoIZf/I18ie7a+G18bM2WMTVK7PuLq7v+2jj29mRsGZswpwthfVR2AoBD9ATM0b+rkk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 13:00:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 09/10] block-copy: add CoMutex lock
Date: Fri, 25 Jun 2021 16:00:05 +0300
Message-Id: <20210625130006.276511-10-vsementsov@virtuozzo.com>
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
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d6e9974-9ae9-4edf-c509-08d937d9376a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61342497680E902E2555D1F0C1069@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owKO0jwhGsPRVvhZRmH3TJ4KJ3LQa1EtR6L/2+1SoC2Tk92ZZfeQ56aCAZXV+pE4sSqfq4hzt4nv/DiSsecsfMExnQuZnguEdDAlenTYqFX3fD3+b0TVBEXHpKIPYCYjHK20WQXmTTldBj/Xpm93l3wdXzTV1AobaSJXprE6d3HAFXg96/zi+xcoBiENqzFuyyKnQXu4mWNQhiKNGuZMC8kIElwr2/9h0w74+nW7GHa0w/Of8NaxyunCVlmrO23PBMebkmT3n4LGu+VPBEfvME/8ldsvyXHyCvgGZJm6kDXl2FwyTmJMIl1wMRW43+qLHQMtXi+2Qnj6O/NgW6SgeWSvVEhiTto+pBoa5/FUVvvXHb8p5wYVDuIENkDG4AJQiryAaJhY+4DObLnXaBFj42wlMuZWRPbJBZ3FmAxbsDVQGNoKDNxlkF4FRkURlp+cfdsD7UOj0D99WWPREBvBo5gyc6JTaA9/f3yt+9GzNnjbaIph8Xn/C9i9vQhnYLfAIWxtIO2lZwGaZwEFs4zmeeEYaAKMcYYLzN2z6nqcu/wKsiAdw+EoydM3oJvNukcHUeP/De/0YsH5NIZYydzmJrKvpBFLXj3gjMK4G2rHNxTPvSB7Tj8NsF8gHM+1dTb2tYi7vUUqlcJ6vCJ3pv2jW5K/RR1gtW93uuNKSWhNJRVUs3SqZx5UDFfUGtvxi+R/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(346002)(396003)(366004)(136003)(39840400004)(6916009)(6666004)(66556008)(66476007)(2906002)(66946007)(956004)(8936002)(16526019)(8676002)(6506007)(6512007)(26005)(478600001)(2616005)(38350700002)(38100700002)(6486002)(316002)(83380400001)(86362001)(36756003)(5660300002)(30864003)(1076003)(186003)(4326008)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ADwEl+Ontq5AAAstA3IohBErT84+J9wpHmZpcMlAH5O+btbOIzUexkmkw0X0?=
 =?us-ascii?Q?UzIJWTWTBFD6i2ZsKL5ol2jLRy7zbFo4CLkUnBmb6bfDgu1kyqoMFV8gPVMj?=
 =?us-ascii?Q?gN0VHypGKXG/bezdCtK/OmMOrxhb5TxyRSq7a9c3J8ukskVuOtF23tV3K4ea?=
 =?us-ascii?Q?8zFu6sxuxXSQj2fjCQjM5rUcvYZMsS8YzCzKQDQGc/TadbWUtJbPKYg8DnPv?=
 =?us-ascii?Q?ofZKYbKuqumODVi1KW9Qw+dlpx+KOA491pJkMc8ijxlANhxyEXfXbsD825kg?=
 =?us-ascii?Q?oxBk4iZHhd18xnRhyP/CdZP//5TSqVRLbQyGhgEgAAEP/QzuzPK+ekdesL/w?=
 =?us-ascii?Q?tAhmaHM9WI0aIRgZlExliPpZ0K/IKsJHVjWdhG6IObxqOKgZNfLMUmdD167h?=
 =?us-ascii?Q?eBy/AcNpLOYDuXEpQWeaPXSk5RHtG0CzG/M8rkMgNlPx7IQoamNlPwSJMelp?=
 =?us-ascii?Q?TQVyOd5cEGfG0M7N3g4oCABycGvh1OHb+O7Av+nCAQgDSvxZhtXZbHTCpmAb?=
 =?us-ascii?Q?+3mUnr4Sx9BqJjLBJzscnxX5U7o3ELhntTQ/mWcsf12m+jJN6mdmk/zhG4j0?=
 =?us-ascii?Q?v9Q8AOYkiOg6BYuweYosTMRh4v00zF+LxDhtSHweUA/aWeANmO8DPf69SQ7H?=
 =?us-ascii?Q?NSqyV0uRDToFdJEgFnQ0ZaVJdACA6ekuBgfP4z4zGBdwLObibF+OVQekDf/2?=
 =?us-ascii?Q?mQdjeJkjP65WgSQIiBVCMQKFHzFcQhVXrzwCXvTuaokq96/xEERzTvp2EQE1?=
 =?us-ascii?Q?pDqkkYW0q45bnjZjoJJ+rEb8ARJPYUHYcl4xDpQHfNIIB/qIWs7m+dY+VGHn?=
 =?us-ascii?Q?gNaZtica7thaQIhMTodaZBxnWVaOm8d6fNwHZN2IytT9Vh4Pz2mjQXLLFMuc?=
 =?us-ascii?Q?ldT0VZvY0t/NS6HznPQnewMjFprCcjP8ncjSerk6TO89W5g5yI2jbdICU7TK?=
 =?us-ascii?Q?q8kr5VxSW9KHdJM+saKV/QgqUNt7bmYQ2s5iDMmF+qK9q1lhG9q9cfyeTS3o?=
 =?us-ascii?Q?qDv/MI4q25fLfVSNWEOVH/RR1rx4OS0miZ1YPN2xHduAO2sJOJorWxnMEjfY?=
 =?us-ascii?Q?sb4hktJxfKky74fB2A4KO72XkVRk/1jrD3bY6NflJX5h1Yhj0WdQ5o/1QOEJ?=
 =?us-ascii?Q?ot+P8mGEm21iKiRC83Yjmku0H8LyAq15iwYp30qaMoNcbJLGp37FlzGPex6Q?=
 =?us-ascii?Q?QtmHOxRo1MNQj6mfOu/c7aaPBabj2apng9E7s5XmkDISsFmTGH2il8fSHlqn?=
 =?us-ascii?Q?e1x6WdCGH0Js5RF8yBQnizweXPoaa+Jj5UarSSwAFnsLv6r3TElpnlgoUGPi?=
 =?us-ascii?Q?d1KQjyyUYwjSJhRTcvZL/C29?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6e9974-9ae9-4edf-c509-08d937d9376a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:32.8264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS3XUj9hdtxV+pKuOLFKKlpi+Fr5rVHjKDoWaOU6S8xq83FDoxfWbet74KtawCZDx33LCuVnG5G04CTl2MibfnzeszERIwrKuEU/PhHcCFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.20.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Group various structures fields, to better understand what we need to
protect with a lock and what doesn't need it.
Then, add a CoMutex to protect concurrent access of block-copy
data structures. This mutex also protects .copy_bitmap, because its thread-safe
API does not prevent it from assigning two tasks to the same
bitmap region.

Exceptions to the lock:
- .sleep_state is handled in the series "coroutine: new sleep/wake API"
and thus here left as TODO.

- .finished, .cancelled and reads to .ret and .error_is_read will be
protected in the following patch, because are used also outside
coroutines.

- .skip_unallocated is atomic. Including it under the mutex would
increase the critical sections and make them also much more complex.
We can have it as atomic since it is only written from outside and
read by block-copy coroutines.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210624072043.180494-5-eesposit@redhat.com>
  [vsementsov: fix typo in comment]
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 155 +++++++++++++++++++++++++++++++++------------
 1 file changed, 116 insertions(+), 39 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index b7bcb9da86..f3550d0825 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -39,7 +39,7 @@ typedef enum {
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
-    /* IN parameters. Initialized in block_copy_async() and never changed. */
+    /* Fields initialized in block_copy_async() and never changed. */
     BlockCopyState *s;
     int64_t offset;
     int64_t bytes;
@@ -48,33 +48,60 @@ typedef struct BlockCopyCallState {
     bool ignore_ratelimit;
     BlockCopyAsyncCallbackFunc cb;
     void *cb_opaque;
-
     /* Coroutine where async block-copy is running */
     Coroutine *co;
 
-    /* To reference all call states from BlockCopyState */
-    QLIST_ENTRY(BlockCopyCallState) list;
-
-    /* State */
-    int ret;
+    /* Fields whose state changes throughout the execution */
     bool finished;
-    QemuCoSleep sleep;
+    QemuCoSleep sleep; /* TODO: protect API with a lock */
     bool cancelled;
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyCallState) list;
 
-    /* OUT parameters */
+    /*
+     * Fields that report information about return values and erros.
+     * Protected by lock in BlockCopyState.
+     */
     bool error_is_read;
+    /*
+     * @ret is set concurrently by tasks under mutex. Only set once by first
+     * failed task (and untouched if no task failed).
+     * After finishing (call_state->finished is true), it is not modified
+     * anymore and may be safely read without mutex.
+     */
+    int ret;
 } BlockCopyCallState;
 
 typedef struct BlockCopyTask {
     AioTask task;
 
+    /*
+     * Fields initialized in block_copy_task_create()
+     * and never changed.
+     */
     BlockCopyState *s;
     BlockCopyCallState *call_state;
     int64_t offset;
-    int64_t bytes;
+    /*
+     * @method can also be set again in the while loop of
+     * block_copy_dirty_clusters(), but it is never accessed concurrently
+     * because the only other function that reads it is
+     * block_copy_task_entry() and it is invoked afterwards in the same
+     * iteration.
+     */
     BlockCopyMethod method;
-    QLIST_ENTRY(BlockCopyTask) list;
+
+    /*
+     * Fields whose state changes throughout the execution
+     * Protected by lock in BlockCopyState.
+     */
     CoQueue wait_queue; /* coroutines blocked on this task */
+    /*
+     * Only protect the case of parallel read while updating @bytes
+     * value in block_copy_task_shrink().
+     */
+    int64_t bytes;
+    QLIST_ENTRY(BlockCopyTask) list;
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
@@ -90,17 +117,25 @@ typedef struct BlockCopyState {
      */
     BdrvChild *source;
     BdrvChild *target;
-    BdrvDirtyBitmap *copy_bitmap;
-    int64_t in_flight_bytes;
+
+    /*
+     * Fields initialized in block_copy_state_new()
+     * and never changed.
+     */
     int64_t cluster_size;
-    BlockCopyMethod method;
     int64_t max_transfer;
     uint64_t len;
-    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
-    QLIST_HEAD(, BlockCopyCallState) calls;
-
     BdrvRequestFlags write_flags;
 
+    /*
+     * Fields whose state changes throughout the execution
+     * Protected by lock.
+     */
+    CoMutex lock;
+    int64_t in_flight_bytes;
+    BlockCopyMethod method;
+    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    QLIST_HEAD(, BlockCopyCallState) calls;
     /*
      * skip_unallocated:
      *
@@ -115,15 +150,15 @@ typedef struct BlockCopyState {
      * skip unallocated regions, clear them in the copy_bitmap, and invoke
      * block_copy_reset_unallocated() every time it does.
      */
-    bool skip_unallocated;
-
+    bool skip_unallocated; /* atomic */
+    /* State fields that use a thread-safe API */
+    BdrvDirtyBitmap *copy_bitmap;
     ProgressMeter *progress;
-
     SharedResource *mem;
-
     RateLimit rate_limit;
 } BlockCopyState;
 
+/* Called with lock held */
 static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
                                             int64_t offset, int64_t bytes)
 {
@@ -141,6 +176,9 @@ static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
 /*
  * If there are no intersecting tasks return false. Otherwise, wait for the
  * first found intersecting tasks to finish and return true.
+ *
+ * Called with lock held. May temporary release the lock.
+ * Return value of 0 proves that lock was NOT released.
  */
 static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
                                              int64_t bytes)
@@ -151,11 +189,12 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
         return false;
     }
 
-    qemu_co_queue_wait(&task->wait_queue, NULL);
+    qemu_co_queue_wait(&task->wait_queue, &s->lock);
 
     return true;
 }
 
+/* Called with lock held */
 static int64_t block_copy_chunk_size(BlockCopyState *s)
 {
     switch (s->method) {
@@ -178,13 +217,14 @@ static int64_t block_copy_chunk_size(BlockCopyState *s)
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
  */
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
-                                             BlockCopyCallState *call_state,
-                                             int64_t offset, int64_t bytes)
+static coroutine_fn BlockCopyTask *
+block_copy_task_create(BlockCopyState *s, BlockCopyCallState *call_state,
+                       int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
     int64_t max_chunk;
 
+    QEMU_LOCK_GUARD(&s->lock);
     max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
@@ -227,6 +267,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
 static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
                                                 int64_t new_bytes)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     if (new_bytes == task->bytes) {
         return;
     }
@@ -243,6 +284,7 @@ static void coroutine_fn block_copy_task_shrink(BlockCopyTask *task,
 
 static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
 {
+    QEMU_LOCK_GUARD(&task->s->lock);
     task->s->in_flight_bytes -= task->bytes;
     if (ret < 0) {
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
@@ -321,12 +363,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     ratelimit_init(&s->rate_limit);
+    qemu_co_mutex_init(&s->lock);
     QLIST_INIT(&s->tasks);
     QLIST_INIT(&s->calls);
 
     return s;
 }
 
+/* Only set before running the job, no need for locking. */
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
 {
     s->progress = pm;
@@ -467,16 +511,20 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     int ret;
 
     ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
-    if (s->method == t->method) {
-        s->method = method;
-    }
-    if (ret < 0) {
-        if (!t->call_state->ret) {
-            t->call_state->ret = ret;
-            t->call_state->error_is_read = error_is_read;
+
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        if (s->method == t->method) {
+            s->method = method;
+        }
+
+        if (ret < 0) {
+            if (!t->call_state->ret) {
+                t->call_state->ret = ret;
+                t->call_state->error_is_read = error_is_read;
+            }
+        } else {
+            progress_work_done(s->progress, t->bytes);
         }
-    } else {
-        progress_work_done(s->progress, t->bytes);
     }
     co_put_to_shres(s->mem, t->bytes);
     block_copy_task_end(t, ret);
@@ -491,7 +539,7 @@ static int block_copy_block_status(BlockCopyState *s, int64_t offset,
     BlockDriverState *base;
     int ret;
 
-    if (s->skip_unallocated) {
+    if (qatomic_read(&s->skip_unallocated)) {
         base = bdrv_backing_chain_next(s->source->bs);
     } else {
         base = NULL;
@@ -578,10 +626,12 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
+        qemu_co_mutex_lock(&s->lock);
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
         progress_set_remaining(s->progress,
                                bdrv_get_dirty_count(s->copy_bitmap) +
                                s->in_flight_bytes);
+        qemu_co_mutex_unlock(&s->lock);
     }
 
     *count = bytes;
@@ -639,7 +689,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         if (status_bytes < task->bytes) {
             block_copy_task_shrink(task, status_bytes);
         }
-        if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
+        if (qatomic_read(&s->skip_unallocated) &&
+            !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
@@ -721,14 +772,38 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     int ret;
     BlockCopyState *s = call_state->s;
 
+    qemu_co_mutex_lock(&s->lock);
     QLIST_INSERT_HEAD(&s->calls, call_state, list);
+    qemu_co_mutex_unlock(&s->lock);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0 && !call_state->cancelled) {
-            ret = block_copy_wait_one(s, call_state->offset,
-                                      call_state->bytes);
+            WITH_QEMU_LOCK_GUARD(&s->lock) {
+                /*
+                 * Check that there is no task we still need to
+                 * wait to complete
+                 */
+                ret = block_copy_wait_one(s, call_state->offset,
+                                          call_state->bytes);
+                if (ret == 0) {
+                    /*
+                     * No pending tasks, but check again the bitmap in this
+                     * same critical section, since a task might have failed
+                     * between this and the critical section in
+                     * block_copy_dirty_clusters().
+                     *
+                     * block_copy_wait_one return value 0 also means that it
+                     * didn't release the lock. So, we are still in the same
+                     * critical section, not interrupted by any concurrent
+                     * access to state.
+                     */
+                    ret = bdrv_dirty_bitmap_next_dirty(s->copy_bitmap,
+                                                       call_state->offset,
+                                                       call_state->bytes) >= 0;
+                }
+            }
         }
 
         /*
@@ -748,7 +823,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    qemu_co_mutex_lock(&s->lock);
     QLIST_REMOVE(call_state, list);
+    qemu_co_mutex_unlock(&s->lock);
 
     return ret;
 }
@@ -851,7 +928,7 @@ BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 {
-    s->skip_unallocated = skip;
+    qatomic_set(&s->skip_unallocated, skip);
 }
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
-- 
2.29.2


