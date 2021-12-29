Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C873481657
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:32:39 +0100 (CET)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2egf-0006tZ-T1
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:32:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWS-0006cW-Mn; Wed, 29 Dec 2021 14:22:05 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWR-0000B6-4t; Wed, 29 Dec 2021 14:22:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4dBIhXWUf8hom3nDUicEmyNNqy2QLhWdfg21Zk78DShKrbUk9XI6F2pUGqi8ltQgRhBrnyiMby0kbW4RKFQ7O11w91jcUc52Cw2XvCwpo2KklpTA08OX6rpwbVV1XvzikhMB2t6hm18kRjg21TU6duAg1aXAde4sl0ZwqrjuOsmviYC+dychce7ZcjzH+sloT+KQDvimotFQUC7dcBhCZeVFlb/QS5ads+F1wkcM4JoLg6RdmZRFcL4ccwd90RPx9elI8UPP3VovytGpVQpXhj0gjO9RT7VJrDG4MjmqwGpf0zjTQlM/NIe8MQe106qXPhlmzLmP8Oz5bjl12zHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v41zYDjNrFCJdHE6XKeGOmmyjLe3Nxzfp+Uzecl4rr4=;
 b=CKnfQk//GCOBG3MkNXBygaDDfsxNv757RyKMh2E2UGrb0DkLwjLAOuJWCcbSdwrl4a5waQlxVbOpQi5TqaXPckeRvblIappLBvyPjyl7VnghxwjAwTI5pkTdOpizbuH7yg2e7Og+L+xFODtLZj6BzZHmbX5jMq1hrCvG8DLx0W/diUykFInAY95JLsrwasYod9b9cF/a+wi0PE5xqofTAE/vu6RMcD5IHgEQ249WW7oTQsASRAO/3NrFjHA51F828Hx3X+BXr52uoXZF9YX4d/y3HNlY6mZotIgADKZLyW8fmV6o9EACwGIydSdc6tXQWOMeaCC9uu0mk5dw+kLcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v41zYDjNrFCJdHE6XKeGOmmyjLe3Nxzfp+Uzecl4rr4=;
 b=I7JMA3+tJdYyaQ0+ytjVJ/nkggFG54TDfathSWbVIiWF43kMQ5S22nEZlc2TDUn2WnjbzNQseRdPcjBWKWEif/mJBQ66N2CxUCRFKb2XeRTVYSLXycLyimcXe5lOeGzbC9N4LOdwsKmDvRWv6f1ppCTdexR2hjj/YzlXa+hFrJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 5/6] test-bdrv-drain: don't use BlockJob.blk
Date: Wed, 29 Dec 2021 20:21:26 +0100
Message-Id: <20211229192127.1772134-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07eb2968-30cd-4d95-9e2e-08d9cb007402
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2276127336A0154043420F55C1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:20;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68+SHIH7f1jptFca/V0OzCm0SO6ttuJH+B0ZsUSqx8U80emdL4HBZUGr8GSLuwxgdF8FnkWRb6XAJyLa9EQXsOr5dKAWtMGaqfAEHWF+Na3FDKnqVKd2bFDS8s/J86cR6We1tYWE8J1iCFAPZvuKSdqpvUWkTSyRQaenWPgPehNxNe48xpwb1ZDPrQucY2eaOKeSOe5Ws/lojRHApP50ojTvgbvn047nRFTYMOFNn3FM6Nfr+CxwRV9IRY7lCRbnG+3Si30n5HtpGaT7LZmUkNVM7Gs12hvKu7R79cxZSCyFoPEIQ3xe4C/9tvjq+0F17936tnjSY8rP867SGK/v8Pr0nEd8HwP8/7IT1XZHPG1v9G7+K3R1VE2k5pfInThtVgAbdNhVqM1QVpzb6FIddj7O0IKVBx9iraqwwjx2K5x8mUwxM/eP3fH3FmK7Wj/sXiKqSrVk79rTEbtBStryScIWfl218dyjS2UE9N0edsKzk6c23y8T2lx/pvffVSKMDRdRN745PxWKAMwzAbl+wJgP47MYXyM2AAdHBbLzIAE+Zi8x4Grf7URkPON/MlXOxoq+WA3YFrDChUEj8dYCWsH/VQ9LSkEQUETaokk2xueL3Ba9RMxQKq9Bne1zQwGZW8lt7NQPQsxx/EIkFX3M5pSrbDptGQhqZtDuxl9z5CPrWp+q5WRAU9s4DIbhKx1gpA0rVi+lYSE5urLhq+SIHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(6506007)(107886003)(316002)(86362001)(38350700002)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNLsXf8BQSryxF9DDfOhjeznWb8BSBlyv4nDfIiWnkTjrA5EWLKsgK0iWGJz?=
 =?us-ascii?Q?2fYbjwbdIGlzb5wSmP9OXsIEKKex5BjQZAQqzDJfNG0yLe3s8X0WXcK/aeHD?=
 =?us-ascii?Q?ebXSYgkbTISMHiVSPWvPwp+h7F1LZvtD8fvST5zFDw2EZeW/qhpp378Bbn5Z?=
 =?us-ascii?Q?cKR9cHhTAuOTB5SbeUF/5xIUK8bPcC/9cian7Tonb3XAw+gwSE+TH/kWF92r?=
 =?us-ascii?Q?7tT7gl3IkRNZLZmDDjVmiLp1e9wHnSIcxKbxVJ9UdVjbgM/PzdWm5qJSUPvH?=
 =?us-ascii?Q?kJKDQAEMo1N9FiDApPbU11YV/FsdvysEQz9Rnm79mgtmxVaCCVFukh9eihQI?=
 =?us-ascii?Q?4OXqS7SGSGmJy1+tK1m0jhz+k/ox0WGCLUlY4IF4cdXz/wYlB1XvTZOD0hpz?=
 =?us-ascii?Q?bBLQj/bENkyiU9zMviLWdtIOgJzm45TkOYujDtqe5f6hJKhIkSUsu/FateCH?=
 =?us-ascii?Q?l90edaE++8w1QWG3OB7bCr2qPYLqwlnfVVdxwTtxtN4VqPZxtLF7NUeh/vbx?=
 =?us-ascii?Q?uu5fzCtHKk5Bu0Y4Elmj/GFE6jZyMlDqNg80l/023tTf3DTVMj4FzB58tdfp?=
 =?us-ascii?Q?I9JL1Iy3NN4AKhArYEbMNtLMC1WrU1jn3SpU7OV9xLc5Sk/M8HGEULdxTSzK?=
 =?us-ascii?Q?Bb7al5plROp2D8xKnvNaPLQ144RK6vuqo90sc8gXp+CxplKLjHuNBaF3XHU/?=
 =?us-ascii?Q?6+eh52x9s8odCMZjIkRMQA846MEw8VFBDP9IUxq5EWvwda6Hh7sNfS6f8irM?=
 =?us-ascii?Q?D93Id49+GBfXAW9+lbpC4k3BpJVGAjTY12cQ3bGJQXGn4BX8H+6VFDTpVXaz?=
 =?us-ascii?Q?yWDboV/I+RDWCtWwc9iMI68RMNisS7APs4Z1Yj22sasARwJRiaqwqqob6Ow4?=
 =?us-ascii?Q?5mReb0LTYkJB9atz/47gzDyteJ1rgfe3pXMuEZTIGwTqE14SoSEA33bwyqpJ?=
 =?us-ascii?Q?L39IwcAvg/bPDgPIVoJpfbWmvt5fsEBwJSWfRcxODhh7R+VqW0M2LECUAw2H?=
 =?us-ascii?Q?oXue9e7AE/uIYyrBxjGwQuShQGpnZVlUWgdJG+Lep8p5hNjnI+xMl+iZt6Ji?=
 =?us-ascii?Q?+uePqxInJFkLbWaE2gKNO0/BeE3vWvfDD4NRjZHJooxtLoOvTZLAEzKMQNNc?=
 =?us-ascii?Q?neZQ45ZVKUqVBFnzQRmfkwKWth2ab3oTffcNvq8q2g3jN16QIWdVDnYWs7mW?=
 =?us-ascii?Q?dz9MXZkW+S8wNhTJQHGToBiQHR2gTKYJOPpVwOgo1tQD/dKSY0iwYBLF+R+q?=
 =?us-ascii?Q?5WfZds0fxKqVtP/x/08ll+PAwga1qYc/8My3zkN/OJUoKgDDWAoAnp1nk6U7?=
 =?us-ascii?Q?zRgIWwlR8VhhqrDGVWB531U/qgUJxBJhiB53ZcDSY1u3EmgvT9kVThCjNR6a?=
 =?us-ascii?Q?4/t9FcfjTja4+IB6Vy3CgjUW2OyOQUdrJ4SFvRRwL1PgKnC1b7+reIByhmRx?=
 =?us-ascii?Q?DVTAC2HxZJRxHl9MfqyetRDFyJMBlyThcTC1NRfD6xC/i7uyCz3ZaL/2nVml?=
 =?us-ascii?Q?+KNpPfW4da2LYfNpnspaUuXFAbwUIMNvMl2weXooMPBK6KqKBkYkOthuh9dV?=
 =?us-ascii?Q?wcvmwp8NiTABnVRypZbCtm2+SoD67nHoFoyUZLBJkx6YdMixBKZWeAADSArb?=
 =?us-ascii?Q?zI/7KwZKdRQ5fy9eLFsVl/9mFUxCnryZQYNSy7/hd6CY4cAZjmLP66zuKf+C?=
 =?us-ascii?Q?ArDwEA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eb2968-30cd-4d95-9e2e-08d9cb007402
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:45.7652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvVuvvFsUJrXXODh6xSoBLJ0F3JTsPm3mTWuIm3tAizvXfWSP29Zz1Hy4sDbCs8QKVd/KcHYaonvUAYzSfK/7QxW1T+IDsWqLDaWrUL7ZjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are going to drop BlockJob.blk in further commit. For tests it's
enough to simply pass bs pointer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 tests/unit/test-bdrv-drain.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2d3c17e566..36be84ae55 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -772,6 +772,7 @@ static void test_iothread_drain_subtree(void)
 
 typedef struct TestBlockJob {
     BlockJob common;
+    BlockDriverState *bs;
     int run_ret;
     int prepare_ret;
     bool running;
@@ -783,7 +784,7 @@ static int test_job_prepare(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
     return s->prepare_ret;
 }
 
@@ -792,7 +793,7 @@ static void test_job_commit(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static void test_job_abort(Job *job)
@@ -800,7 +801,7 @@ static void test_job_abort(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static int coroutine_fn test_job_run(Job *job, Error **errp)
@@ -915,6 +916,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
+    tjob->bs = src;
     job = &tjob->common;
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
 
@@ -1538,6 +1540,7 @@ typedef struct TestDropBackingBlockJob {
     bool should_complete;
     bool *did_complete;
     BlockDriverState *detach_also;
+    BlockDriverState *bs;
 } TestDropBackingBlockJob;
 
 static int coroutine_fn test_drop_backing_job_run(Job *job, Error **errp)
@@ -1557,7 +1560,7 @@ static void test_drop_backing_job_commit(Job *job)
     TestDropBackingBlockJob *s =
         container_of(job, TestDropBackingBlockJob, common.job);
 
-    bdrv_set_backing_hd(blk_bs(s->common.blk), NULL, &error_abort);
+    bdrv_set_backing_hd(s->bs, NULL, &error_abort);
     bdrv_set_backing_hd(s->detach_also, NULL, &error_abort);
 
     *s->did_complete = true;
@@ -1657,6 +1660,7 @@ static void test_blockjob_commit_by_drained_end(void)
     job = block_job_create("job", &test_drop_backing_job_driver, NULL,
                            bs_parents[2], 0, BLK_PERM_ALL, 0, 0, NULL, NULL,
                            &error_abort);
+    job->bs = bs_parents[2];
 
     job->detach_also = bs_parents[0];
     job->did_complete = &job_has_completed;
-- 
2.31.1


