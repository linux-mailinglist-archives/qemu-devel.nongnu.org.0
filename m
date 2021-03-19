Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2303419AC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:14:59 +0100 (CET)
Received: from localhost ([::1]:45118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC9i-0001Px-3W
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3e-0005Hm-IE; Fri, 19 Mar 2021 06:08:42 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:53216 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3c-0005Ve-5k; Fri, 19 Mar 2021 06:08:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/1RgS60K8NZ3jlvqnIfdiTcrOH/EL+8mChSDb9SOWZLMKddDshrm9onhVmXmnvI+/e4P0N6gViCyiEqoJ8v2KUl30nB4iB4WG3/N8RAOhc5G56qdqQfkHOoVPzTd5jEwAtd90cq83mzEbgDY5BU3Lfs8CSC5qNPvcgmTY2C3MjLfiqxbr1AeOm3A0sYZMoEqW/2A2lLVeNikV5ewrY9wrsSny4+21+D77kHVqWz7Obt8WLaefD7F0FM7j5zUy6JOzaLL6TorWKHzhZGRveXpLrdtgcVN6EAz5bsdaw0765LK7Ck6FITKrQ50Kqb7Vqslq6n0tDeKoF4TCVobDokpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qirjD67N4m2AzG4FVamcGSn90wLaySM3buH1Sr/5gUo=;
 b=LGAO51SbbIeAlwa6uCDsLyeJ85WNb9SyyDwRwUGRaidakVZqbNZ9XKMZWdS7WP517KFbk+E1HtywTV6m1rnuJRZJmCwMqi6kEjR6tFqwtDAlEYnc+lw3sGUk/XvKOv5IaJd4+fRSiQjRPmog950NPyCU2fG1pc5Z3nJSnksRlRbbpFIR4T0gAyyEQy8IsgK2BqEVXYGzQFDSOLCz1Uz+tnEv0x6Y41DVe1wRBg5Id2saDyj8EuHmNxvDzMjf6xoKJ1PkR1bDco5hZz/c6ll1/2orChqdIOcz5pnYZqwA+98ge4T9y8Aw6ylbXdlQ2jpyh0qPgs2j6i/HFtRVO8qNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qirjD67N4m2AzG4FVamcGSn90wLaySM3buH1Sr/5gUo=;
 b=j5Wbm1E+jSvndsUgeW5n5PbTA6Gnbs6kABYcsjSEWJevzfXw5r2CfWgMMiH6wSbTQy7PgwXING+3DdzS8QcgVws7ok16x+kiFapi+gfPO+IMkd0Nv0B+V0QIg59nV2OeJO3lFSxxVWD0X7kKAY8Y+uoMmNSEluWEbDj/XSTx+DE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:08:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 10:08:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v4 3/3] block/qcow2: introduce discard_rw_lock: fix discarding
 host clusters
Date: Fri, 19 Mar 2021 13:08:11 +0300
Message-Id: <20210319100811.342464-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319100811.342464-1-vsementsov@virtuozzo.com>
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR01CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 10:08:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a7123dd-40f4-4b49-0a30-08d8eabef1b2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720FDEB9E5A09131136C92DC1689@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqEfO73rCi5KRQ8Z/MWehO0FSblltTZFmWpvrIhZ1GBosxuG4qcOYV78yT6DJrPJ7UD8ecsyJPUkwger+P5ptWqqzNxw9HVIqydgsOYWkLW4uaALsDGGJVCMohowqpcu2Ax7shRJSgrZb1L5LKToxIkRJbPL4KdXDO1/Xfq99geHnRAT4KZn6Bpq7YV4kOdLEbzJIykp4Bc4mW6xqunOCgieJfPwmyKx7CkWmscVEJWmTxiiJuuwX2be4NRHrl15TKmLlhLZ7CtoeX8lIeTnMeu9unHYj8yb1zWqI7BeArNhtLPtD5OaxRB0gJwfdQFZuIrFd2e5G2fWYN6VVir5g/ExMwwVEB9dqdTgFybpRUYPx5aTfTlbsoyTTQFUA0VfK9PsD53dW4AxrnoT+UOc6i/Dws9856eF1rjyk92qvWj5bUYh9xdkn94eE8G4Ne70N5bnGukqoaXmsB7NyuxG6aAmi0N8DbLcEJZRVgRRczHhSVfRsiF/V+3FERcLBZDj4YtstLzDPsw3dDssOsJUarEU4WH6dMGvdRyMhYo47dPOG7U5kMtTNPr5gDL4e+PHTFmIvWZDtgLZU8Os9K88OTVOSyc1ZKpy+VzEQJU2Teuu2Hrsuk5H4k08CpKBoGIaVpQis6WnHU4p/+P2lgl0pDKchcdm7MLer/Jp5ddzG7tz1sbQtZuKuM4pS0VlByys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39840400004)(346002)(136003)(186003)(956004)(69590400012)(2616005)(83380400001)(16526019)(107886003)(66556008)(6506007)(38100700001)(66946007)(316002)(2906002)(86362001)(6512007)(5660300002)(8936002)(1076003)(19627235002)(6916009)(8676002)(36756003)(6666004)(478600001)(26005)(4326008)(66476007)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ski3GUTbdYO69NB9Mng3i5AIowQrcu9w6+IFDw0emAwZ5z2LaBd2FTd5QXQO?=
 =?us-ascii?Q?07+XR32clQwxcbMo3UR4PcdTg1uhvHdvXHYh5qsheUBMJXeLDf5EP9qTAmqC?=
 =?us-ascii?Q?Ioo24WaSutECJLptgqO/hqGHo8D7JR+BBUhlpAXefwiZFbUTx3xieAVvJfi3?=
 =?us-ascii?Q?FHQgWX4gdBvcgO97SpJmbiDZWbu96nFen4nkGicpeHxE+Hzpw5NYZXbkP1Ia?=
 =?us-ascii?Q?xr6HbBNWy78bFdjGy9rxfOi5Pmo5/RYemevTi6pvuZQW8Y4xRYYrVnn8k0F2?=
 =?us-ascii?Q?mNjpS6Hr4+hpnYp6pvxfTBtqJAbO+W3sWTFTly1tm+8lm1Ctr+OmeWZhVcVr?=
 =?us-ascii?Q?bKYPymZm8nV+9GTw7GbcyHK8OhLTqpA0h/Dw6PU+Ne3/fYha7+ZdAkpAKriS?=
 =?us-ascii?Q?mVh5OooYk2zfpxo6pvAda6ypaQWGDK37cCgbwKTdEWGQ7ho/XT5wtmia4qN9?=
 =?us-ascii?Q?UfYdUw0CHVgQzEU6bGabTT0POSZOG7ggVNfKZ3eZfd4QbaT03zo2RfmHP2Kd?=
 =?us-ascii?Q?G3uvovqzDwsXvWcQbzxo0ASxRJLSPAczuWNCnmKpzaQQf0kVZRwYE+kulKuH?=
 =?us-ascii?Q?BfGHlljpReRHPYdo1jrsgK4pQ/HmidDDFyC/5tvDOcv8zsBL5Llng4iILUb+?=
 =?us-ascii?Q?UgCQMJmlQa3Ka6qv+M7TAypCyHJRpXE/3XmfdDKhhDevCQXjYz/MFFPAIcnY?=
 =?us-ascii?Q?1WWtqgta5ut+CdX4XtpxfP0r/qBCn5aKljj4RjuFGZmMto91d1f5l0iLacvj?=
 =?us-ascii?Q?s8AOWy9+/HZPjTUopfsXpmaFb0E/Nsgl/YHFkvPAlr9xX8rkSPST52fr99yO?=
 =?us-ascii?Q?yY6qnZ3S7Y31dOavDX7/Uaol8Fsx8XVLnerPty7ffH7CRn6GPWHwnRKAfQ7C?=
 =?us-ascii?Q?2ErCWnMbp+kojDpcoL3KYeTmNhuWZgpe8E9fVlGx00y9CfwJlZkan/KWJ2u2?=
 =?us-ascii?Q?PIP5oMCqDpQ7YAZbylfjNoRuqmN+g8DU4FKPYz16DrPcIEPbA7ONozKDm8fJ?=
 =?us-ascii?Q?KxXCvPj9A76esECtaEe974Q2zIMlbBrZ82PVYQr0w3u8q6jd9CkggJej6FtA?=
 =?us-ascii?Q?IS30+3FfF3EXdZE1PsGFtSCa1apxYisJ65r440uZGfN9QMC1/Lz4JDqzKZq6?=
 =?us-ascii?Q?nlBdFVUroqjebvf4OB0+yJ1/S0sbkrs2ijjCpuMFQnsHOevUzg3J6HSAKWGP?=
 =?us-ascii?Q?4OD+lfMAMgJynQE+z3C1h0QZhobUlanfvMWvuDtoSwkV5HZriIxKtQGXahSe?=
 =?us-ascii?Q?35jNKe5D6JYdeiAiYSTFecUPHY4BQHFSvPB1/eY+C9ecZE7T7fis+OwEkAh+?=
 =?us-ascii?Q?adUcRptYdI5CM5XL+YjSnDXV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7123dd-40f4-4b49-0a30-08d8eabef1b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:08:29.4400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: felUL3u/Dv032u9yi5lknJlVcwm+ezcRXgjkgBfDS5XalCaFRY+XpYIXMdvyl8Z53f2WAoRuJt3HvHG6afiTgpXuH6bA+LuBCwN+MhHvYfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There is a bug in qcow2: host cluster can be discarded (refcount
becomes 0) and reused during data write. In this case data write may
pollute another data cluster (recently allocated) or even metadata.

To fix the issue introduce rw-lock: hold read-lock during data writing
take write-lock when refcount becomes 0.

Enable qcow2-discard-during-rewrite as it is fixed.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                                 | 20 +++++
 block/qcow2-refcount.c                        | 22 ++++++
 block/qcow2.c                                 | 73 +++++++++++++++++--
 .../tests/qcow2-discard-during-rewrite        |  2 +-
 4 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0fe5f74ed3..7d387fe39d 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -420,6 +420,26 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    /*
+     * discard_rw_lock prevents discarding host cluster when there are in-flight
+     * writes into it. So, in-flight writes are "readers" and the code reducing
+     * cluster refcount to zero in update_refcount() is "writer".
+     *
+     * Data-writes should works as follows:
+     * 1. rd-lock should be acquired in the same s->lock critical section where
+     *    corresponding host clusters were allocated or somehow got from the
+     *    metadata. Otherwise we risk miss discarding the cluster on s->lock
+     *    unlocking (unlock should only schedule another coroutine, not enter
+     *    it, but better be absolutely safe).
+     *
+     * 2. rd-lock should be released after data writing finish.
+     *
+     * For reducing refcount to zero (and therefore allowing reallocating the
+     * host cluster for other needs) it's enough to take rw-lock (to wait for
+     * all in-flight writes) and immediately release it (see update_refcount()).
+     */
+    CoRwlock discard_rw_lock;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..bb6842cd8f 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -878,6 +878,28 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
         } else {
             refcount += addend;
         }
+
+        if (qemu_in_coroutine() && refcount == 0) {
+            /*
+             * Refcount becomes zero, but there are still may be in-fligth
+             * writes, that writing data to the cluster (that's done without
+             * qcow2 mutext held).
+             *
+             * Data writing protected by rd-locked discard_rw_lock. So here
+             * it's enough to take and immediately release wr-lock on it.
+             * We can immediately release it, because new write requests can't
+             * came to cluster which refcount becomes 0 (There should not be any
+             * links from L2 tables to it).
+             *
+             * We can't do it if we are not in coroutine. But if we are not in
+             * coroutine, that also means that we are modifying metadata not
+             * taking qcow2 s->lock mutex, which is wrong as well.. So, let's
+             * hope for a bright future.
+             */
+            qemu_co_rwlock_wrlock(&s->discard_rw_lock);
+            qemu_co_rwlock_unlock(&s->discard_rw_lock);
+        }
+
         if (refcount == 0 && cluster_index < s->free_cluster_index) {
             s->free_cluster_index = cluster_index;
         }
diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..aea7aea334 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1899,6 +1899,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
 
     /* Initialise locks */
     qemu_co_mutex_init(&s->lock);
+    qemu_co_rwlock_init(&s->discard_rw_lock);
 
     if (qemu_in_coroutine()) {
         /* From bdrv_co_create.  */
@@ -2182,9 +2183,17 @@ typedef struct Qcow2AioTask {
     QEMUIOVector *qiov;
     uint64_t qiov_offset;
     QCowL2Meta *l2meta; /* only for write */
+    bool rdlock; /* only for write */
 } Qcow2AioTask;
 
 static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task);
+
+/*
+ * @rdlock: If true, it means that qcow2_add_task is called with discard_rw_lock
+ * rd-locked, and this rd-lock must be transaferred to the task. The task itself
+ * will release the lock. The caller expects that after qcow2_add_task() call
+ * the lock is already released.
+ */
 static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        AioTaskPool *pool,
                                        AioTaskFunc func,
@@ -2194,8 +2203,10 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                                        uint64_t bytes,
                                        QEMUIOVector *qiov,
                                        size_t qiov_offset,
-                                       QCowL2Meta *l2meta)
+                                       QCowL2Meta *l2meta,
+                                       bool rdlock)
 {
+    BDRVQcow2State *s = bs->opaque;
     Qcow2AioTask local_task;
     Qcow2AioTask *task = pool ? g_new(Qcow2AioTask, 1) : &local_task;
 
@@ -2209,6 +2220,7 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
         .bytes = bytes,
         .qiov_offset = qiov_offset,
         .l2meta = l2meta,
+        .rdlock = rdlock,
     };
 
     trace_qcow2_add_task(qemu_coroutine_self(), bs, pool,
@@ -2217,10 +2229,24 @@ static coroutine_fn int qcow2_add_task(BlockDriverState *bs,
                          qiov, qiov_offset);
 
     if (!pool) {
+        /*
+         * func will release rd-lock if needed and caller's expectation would be
+         * satisfied, so we should not care.
+         */
         return func(&task->task);
     }
 
+    /*
+     * We are going to run task in a different coroutine. We can't acquire lock
+     * in one coroutine and release in another. So, the new coroutine should
+     * take it's own rd-lock, and we should release ours one.
+     */
+    task->rdlock = false;
     aio_task_pool_start_task(pool, &task->task);
+    if (rdlock) {
+        assert(task->rdlock); /* caller took ownership */
+        qemu_co_rwlock_unlock(&s->discard_rw_lock);
+    }
 
     return 0;
 }
@@ -2274,6 +2300,7 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
     Qcow2AioTask *t = container_of(task, Qcow2AioTask, task);
 
     assert(!t->l2meta);
+    assert(!t->rdlock);
 
     return qcow2_co_preadv_task(t->bs, t->subcluster_type,
                                 t->host_offset, t->offset, t->bytes,
@@ -2320,7 +2347,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
             }
             ret = qcow2_add_task(bs, aio, qcow2_co_preadv_task_entry, type,
                                  host_offset, offset, cur_bytes,
-                                 qiov, qiov_offset, NULL);
+                                 qiov, qiov_offset, NULL, false);
             if (ret < 0) {
                 goto out;
             }
@@ -2483,19 +2510,32 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
  * Called with s->lock unlocked
  * l2meta  - if not NULL, qcow2_co_pwritev_task() will consume it. Caller must
  *           not use it somehow after qcow2_co_pwritev_task() call
+ *
+ * @rdlock must be non-NULL.
+ * If *@rdlock is true it means that discard_rw_lock is already taken. We should
+ * not reacquire it, but caller expects that we release it.
+ * If *@rdlock is false, we should take it ourselves (and still release in the
+ * end). When rd-lock is taken, we should set *@rdlock to true, so that parent
+ * coroutine can check it.
  */
 static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
                                               uint64_t host_offset,
                                               uint64_t offset, uint64_t bytes,
                                               QEMUIOVector *qiov,
                                               uint64_t qiov_offset,
-                                              QCowL2Meta *l2meta)
+                                              QCowL2Meta *l2meta,
+                                              bool *rdlock)
 {
     int ret;
     BDRVQcow2State *s = bs->opaque;
     void *crypt_buf = NULL;
     QEMUIOVector encrypted_qiov;
 
+    if (!*rdlock) {
+        qemu_co_rwlock_rdlock(&s->discard_rw_lock);
+        *rdlock = true;
+    }
+
     if (bs->encrypted) {
         assert(s->crypto);
         assert(bytes <= QCOW_MAX_CRYPT_CLUSTERS * s->cluster_size);
@@ -2538,12 +2578,14 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
         }
     }
 
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
     qemu_co_mutex_lock(&s->lock);
 
     ret = qcow2_handle_l2meta(bs, &l2meta, true);
     goto out_locked;
 
 out_unlocked:
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
     qemu_co_mutex_lock(&s->lock);
 
 out_locked:
@@ -2563,7 +2605,7 @@ static coroutine_fn int qcow2_co_pwritev_task_entry(AioTask *task)
 
     return qcow2_co_pwritev_task(t->bs, t->host_offset,
                                  t->offset, t->bytes, t->qiov, t->qiov_offset,
-                                 t->l2meta);
+                                 t->l2meta, &t->rdlock);
 }
 
 static coroutine_fn int qcow2_co_pwritev_part(
@@ -2607,6 +2649,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
 
+        qemu_co_rwlock_rdlock(&s->discard_rw_lock);
+
         qemu_co_mutex_unlock(&s->lock);
 
         if (!aio && cur_bytes != bytes) {
@@ -2614,7 +2658,10 @@ static coroutine_fn int qcow2_co_pwritev_part(
         }
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_task_entry, 0,
                              host_offset, offset,
-                             cur_bytes, qiov, qiov_offset, l2meta);
+                             cur_bytes, qiov, qiov_offset, l2meta, true);
+        /*
+         * now discard_rw_lock is released and we are safe to take s->lock again
+         */
         l2meta = NULL; /* l2meta is consumed by qcow2_co_pwritev_task() */
         if (ret < 0) {
             goto fail_nometa;
@@ -4094,10 +4141,15 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
 
+        qemu_co_rwlock_rdlock(&s->discard_rw_lock);
         qemu_co_mutex_unlock(&s->lock);
+
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
+
+        qemu_co_rwlock_unlock(&s->discard_rw_lock);
         qemu_co_mutex_lock(&s->lock);
+
         if (ret < 0) {
             goto fail;
         }
@@ -4533,13 +4585,19 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     }
 
     ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
-    qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
+        qemu_co_mutex_unlock(&s->lock);
         goto fail;
     }
 
+    qemu_co_rwlock_rdlock(&s->discard_rw_lock);
+    qemu_co_mutex_unlock(&s->lock);
+
     BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
     ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
+
     if (ret < 0) {
         goto fail;
     }
@@ -4608,7 +4666,8 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
         }
 
         ret = qcow2_add_task(bs, aio, qcow2_co_pwritev_compressed_task_entry,
-                             0, 0, offset, chunk_size, qiov, qiov_offset, NULL);
+                             0, 0, offset, chunk_size, qiov, qiov_offset, NULL,
+                             false);
         if (ret < 0) {
             break;
         }
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index dd9964ef3f..5df0048757 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


