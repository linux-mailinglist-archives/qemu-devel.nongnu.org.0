Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49998413170
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:23:37 +0200 (CEST)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScw4-0004bG-Bj
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctV-0001WW-5z; Tue, 21 Sep 2021 06:20:58 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctT-0002Rp-3L; Tue, 21 Sep 2021 06:20:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcCIQFBbj5h/wBiCYrTIUpCZbk91LMWtlMU5PtqQWtbeyMANI9GTqBhX6bWXjIiId7sKTYvVz9y7x8g7SfDbHvfnruQc/QUNjUvzxptBS1WKnthac3Mg6vFl3LFZleITyEtd5Hi18K4OxQNo+43YhpOo4oiLv1VSc77RF/1YPkPhJqfEyqkg/IjVG08xL1HSfKwreniTrHBxlGTZpB8C6lHf2VvyCAQh4womGmfPyslC2MdPH7oKaxrz/X7OhIKeU9+dO74r4cSxtjthDJBDrACZI878GGhZkbE8wlzaZ/pCD4b1eVkMNj/ki2S9m6vQe6lo+54aUAXxhu2JJXU5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=rns1FGsVBG+kjBLO0HOv+Jt4tgxThqbikZ8hdKBrfSg=;
 b=hTqFtp6xDlKD5iuaI2vLWIfCFwVuzvBlkB2V35O85+ZLnQrsis/ktZAKV3h+7wl5ihxUzLUHT4gIA3eQ9sQZa8av59z2pAoi4JS/laaej4KvmfzyzqoY3h8YptQToxVmJ/ArdELe3jYjFfoKgqqacWXtiASzYr21m+ZbvHpBLFGbSfl/0fqn1vQRJGTkBFVl6Zxft1xCkfLiXm+JQQqvCCtPFH4+JAXd6y+x+WNwTGFoshk1lu2QgFMwRNnaBlqydf0CMTA09ud3fVMbPpldupR+XDmDDGLw7OvNW60pBZgUB0mAvehHgomXRrIwWvAnxGDG1Snm/rE9dnm/eyTFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rns1FGsVBG+kjBLO0HOv+Jt4tgxThqbikZ8hdKBrfSg=;
 b=khiTNqUvPMkwR8zE7WGgniFZ0LtKYHgoXjTmPxpVpiUuxQJN6tK4B+QwR0scgY2PjDGrxNOZCQ/95hMvttN3ARrGvCmz9McAKdQAP7aJ8tox5RZubjmWlOAFEK6RkL0ZLCEEzWmy2hFeF/z8JnQKabrVoDeEZI7QVnOuqmJu9kE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 07/12] job: Add job_cancel_requested()
Date: Tue, 21 Sep 2021 13:20:12 +0300
Message-Id: <20210921102017.273679-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fcd62ea-4820-4007-435d-08d97ce97735
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59449F012282CF72AE3D82FAC1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXSL6f4QD/W8ooYz4YJCg8p8U9mzSoyQrq/2eYtrBfq446gzbg1JRkGjEJ1T5qfKk4E1SVG/ke6mQOL+H2iXfEOtUO3UFl1EtzpfwxTuEBv4sSnBTQ0Q9kGDNev/hXCIkr25wv4BLi5hVTS+IgpxQFyF1jBYfzVk4NEJ/1mYsBzArS1y23JPHr/MqTfRBWJMKzl30xa1yiAcz6mN+j+bDX1pTB31o3dF5W1RRpx3T3zF9K8CZfRIIjC2f93qiUA5z1Nyp04+kTqZO3csSW4c9f44yyd4nRWiN1KRnh78g2rqIcbqFeUFg0ULU9eSCyKgizKcGlCmOkUWjt5VcvoMoysmJYLLAU+VyltyxZUc09mdulalHSJ2+jHVgDIQkwCRVxINr3G4oMkJCEMGMtoFbYm8JadBpWHybXw3sfXzUzkS0lUSNNXVX8feX9IH+iflfr1gomFArSdlh3FnFCcPoLzYZy02SU/mNuRlI1xjBgTO95wZp93HveHN5GUSINYQ487WZZ61F6M5gjVd90N2Ynd4k9x/szDWtHJ3rCOzsSS1qCOZrQYD2GjfbE4jY9Rb5Hpag7/8KCpLiqVXAcjEZcNm0hy2vo4g5zqPE8uGgGksEsrjVLZmfxLgEVMIgfcrJmYmMiCVBDCxxgebBtAa7O//hTQGktmuJkQ5QVuriC4D68eBOqa2dX4oDKNbMT8x1tv3XG5b1xlgd9mf9YhdmnaTtuXR1xVMrKIdbvoe7Tg+fJw55PPGPU0+f9Q4ETYeNiJIPeD0PrGGYo20gSItQnHfhFNCO+o1b/ZIuZYfvqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(966005)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBHieJbMOjl1yzt+rTeP097GVIhFQoAVtiXtoXxhgtxv8cAmYfFW5QFqtfJ/?=
 =?us-ascii?Q?Cwdz/dulg0JWyV1qEst57KOa9Ot9TR2ViW6wBIplwTVb5uIyhpWplLfagRYZ?=
 =?us-ascii?Q?q4bxJuZnKMdgXPhAFl0anUmqECdt7bOt62+d9F/UXmze1ozml4VFpLHEPxaN?=
 =?us-ascii?Q?J48v0gV92GtYRXCXWhYL38rvWL/fly4moOljw2lTK3TIvbjNV9bMssx5iXdp?=
 =?us-ascii?Q?AsdkrW7fLLi8AWNJglTTKB501YpYpzElmOIAx+yJ2wUCCxteMDQb3M5vgIOz?=
 =?us-ascii?Q?sqe2/IBOcbMeQssVW20370+Fb7GiEd7/ptcWTMs1Cqm9vXXyf7uDbuten4Lf?=
 =?us-ascii?Q?gZSeNO/qRxbcgqxEz2ZnoCGufTEX1oy983CFguQ3/yV0nklHo0t9VvhdE9Lw?=
 =?us-ascii?Q?q7OCbHNYKRIQQNUqoyR2N4KxW4DnWX4o21H+/ylQ61b54v830iaeLEE2Wygo?=
 =?us-ascii?Q?/O0FuWHH3+cStZ4t1M39Smc9IyCO7/yLJkVVR1h3ygPJL60rbsBtK2u//y7v?=
 =?us-ascii?Q?xGK9l4st21JeX6hUDlZ3havp7ym1farQ96Ey6ZZduqkuQRllqtEnlr1pBrmJ?=
 =?us-ascii?Q?AW/eAJV//IyrVTvSmkrJK3q/zRRPDYNXmUxb64YiyXAoMDa6gYJLrDPpSl3+?=
 =?us-ascii?Q?nObAxoXl44ZD5bM9ig0PlmI+CBPF8AXer1qp4agKU0VvbszHYlTdMQ/doo8E?=
 =?us-ascii?Q?TKnyCIuDOylyS6sONAkwvDlms/XcEk9v6QKrrHMW0Py7pUqz/qKjmm47jn74?=
 =?us-ascii?Q?X7DDBO2gI/Jh5PnSLO8BEfojmAXCBaP5Wl8i6Ne3Q41bkBpAtDhtxIiCuE2E?=
 =?us-ascii?Q?9nW8/g463cWe5NyZF1IWCpj+TMelU7pJ898dcpfmrvrkv/b4nHLQnD5UByTW?=
 =?us-ascii?Q?STIxz0v4rPOSgRcz/nNFDShyFceMF0o57zLLjskO25RiQFORzrNGdTLkwoeQ?=
 =?us-ascii?Q?E9QUZaXoFLQB0CLDKicIYQ3Tplh5gKdHCk9ermq73tTp0nBt+1IUJ1NxWhyY?=
 =?us-ascii?Q?XuCq4jsKXm4vnbkwQt6J1OnNBasdFENnQ9TtQT6ZZ7cbNgU2YKWKaiWEgkcE?=
 =?us-ascii?Q?Ea4GlCmLCv3Y58U1g5e4RwZC9gpBabzSF1/Jm+yt3OVBWX60THpzFed3Mdek?=
 =?us-ascii?Q?yTJ+cK8gcny9WG+f1+MdQOpiYRrM+Me16VObknooAwWRechr2bXM/sBEXe2w?=
 =?us-ascii?Q?f3KOdmhill0Vd6PKTyrmCJ1Lxk2UYYFGMMzaB2fOHyfbsMNG7K7zaq2ywZrZ?=
 =?us-ascii?Q?S3eJuCv4IvdqCBB+CYyRyRR9o4FrcMS3UfT4yi0QPFI71+G2HWsgZbeg/ly1?=
 =?us-ascii?Q?s2yODPGvIrn7v5QQr2ZcOiCb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcd62ea-4820-4007-435d-08d97ce97735
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:42.0691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYdgim+VNLttNX3141lcryGmlRN8Z4qxhtHSHS/cyCDtUCbLpgLFwq6ZcIjMeHCBkiX7RNhbY8VsgmCLLdk/qOUFM1DxR4OyYy4HX8ZEE/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Hanna Reitz <hreitz@redhat.com>

Most callers of job_is_cancelled() actually want to know whether the job
is on its way to immediate termination.  For example, we refuse to pause
jobs that are cancelled; but this only makes sense for jobs that are
really actually cancelled.

A mirror job that is cancelled during READY with force=false should
absolutely be allowed to pause.  This "cancellation" (which is actually
a kind of completion) may take an indefinite amount of time, and so
should behave like any job during normal operation.  For example, with
on-target-error=stop, the job should stop on write errors.  (In
contrast, force-cancelled jobs should not get write errors, as they
should just terminate and not do further I/O.)

Therefore, redefine job_is_cancelled() to only return true for jobs that
are force-cancelled (which as of HEAD^ means any job that interprets the
cancellation request as a request for immediate termination), and add
job_cancel_requested() as the general variant, which returns true for
any jobs which have been requested to be cancelled, whether it be
immediately or after an arbitrarily long completion phase.

Finally, here is a justification for how different job_is_cancelled()
invocations are treated by this patch:

- block/mirror.c (mirror_run()):
  - The first invocation is a while loop that should loop until the job
    has been cancelled or scheduled for completion.  What kind of cancel
    does not matter, only the fact that the job is supposed to end.

  - The second invocation wants to know whether the job has been
    soft-cancelled.  Calling job_cancel_requested() is a bit too broad,
    but if the job were force-cancelled, we should leave the main loop
    as soon as possible anyway, so this should not matter here.

  - The last two invocations already check force_cancel, so they should
    continue to use job_is_cancelled().

- block/backup.c, block/commit.c, block/stream.c, anything in tests/:
  These jobs know only force-cancel, so there is no difference between
  job_is_cancelled() and job_cancel_requested().  We can continue using
  job_is_cancelled().

- job.c:
  - job_pause_point(), job_yield(), job_sleep_ns(): Only force-cancelled
    jobs should be prevented from being paused.  Continue using job_is_cancelled().

  - job_update_rc(), job_finalize_single(), job_finish_sync(): These
    functions are all called after the job has left its main loop.  The
    mirror job (the only job that can be soft-cancelled) will clear
    .cancelled before leaving the main loop if it has been
    soft-cancelled.  Therefore, these functions will observe .cancelled
    to be true only if the job has been force-cancelled.  We can
    continue to use job_is_cancelled().
    (Furthermore, conceptually, a soft-cancelled mirror job should not
    report to have been cancelled.  It should report completion (see
    also the block-job-cancel QAPI documentation).  Therefore, it makes
    sense for these functions not to distinguish between a
    soft-cancelled mirror job and a job that has completed as normal.)

  - job_completed_txn_abort(): All jobs other than @job have been
    force-cancelled.  job_is_cancelled() must be true for them.
    Regarding @job itself: job_completed_txn_abort() is mostly called
    when the job's return value is not 0.  A soft-cancelled mirror has a
    return value of 0, and so will not end up here then.
    However, job_cancel() invokes job_completed_txn_abort() if the job
    has been deferred to the main loop, which is mostly the case for
    completed jobs (which skip the assertion), but not for sure.
    To be safe, use job_cancel_requested() in this assertion.

  - job_complete(): This is function eventually invoked by the user
    (through qmp_block_job_complete() or qmp_job_complete(), or
    job_complete_sync(), which comes from qemu-img).  The intention here
    is to prevent a user from invoking job-complete after the job has
    been cancelled.  This should also apply to soft cancelling: After a
    mirror job has been soft-cancelled, the user should not be able to
    decide otherwise and have it complete as normal (i.e. pivoting to
    the target).

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-8-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h |  8 +++++++-
 block/mirror.c     | 10 ++++------
 job.c              |  9 +++++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 90f6abbd6a..6e67b6977f 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -436,9 +436,15 @@ const char *job_type_str(const Job *job);
 /** Returns true if the job should not be visible to the management layer. */
 bool job_is_internal(Job *job);
 
-/** Returns whether the job is scheduled for cancellation. */
+/** Returns whether the job is being cancelled. */
 bool job_is_cancelled(Job *job);
 
+/**
+ * Returns whether the job is scheduled for cancellation (at an
+ * indefinite point).
+ */
+bool job_cancel_requested(Job *job);
+
 /** Returns whether the job is in a completed state. */
 bool job_is_completed(Job *job);
 
diff --git a/block/mirror.c b/block/mirror.c
index 7022d8011b..6c3d8379f8 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -943,7 +943,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         /* Transition to the READY state and wait for complete. */
         job_transition_to_ready(&s->common.job);
         s->actively_synced = true;
-        while (!job_is_cancelled(&s->common.job) && !s->should_complete) {
+        while (!job_cancel_requested(&s->common.job) && !s->should_complete) {
             job_yield(&s->common.job);
         }
         s->common.job.cancelled = false;
@@ -1050,7 +1050,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             }
 
             should_complete = s->should_complete ||
-                job_is_cancelled(&s->common.job);
+                job_cancel_requested(&s->common.job);
             cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         }
 
@@ -1094,7 +1094,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
+        if (job_is_cancelled(&s->common.job)) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1106,9 +1106,7 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 ||
-               (s->common.job.force_cancel &&
-                job_is_cancelled(&s->common.job)));
+        assert(ret < 0 || job_is_cancelled(&s->common.job));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
diff --git a/job.c b/job.c
index 81c016eb10..be878ca5fc 100644
--- a/job.c
+++ b/job.c
@@ -216,6 +216,11 @@ const char *job_type_str(const Job *job)
 }
 
 bool job_is_cancelled(Job *job)
+{
+    return job->cancelled && job->force_cancel;
+}
+
+bool job_cancel_requested(Job *job)
 {
     return job->cancelled;
 }
@@ -788,7 +793,7 @@ static void job_completed_txn_abort(Job *job)
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
-            assert(job_is_cancelled(other_job));
+            assert(job_cancel_requested(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
@@ -1027,7 +1032,7 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_is_cancelled(job) || !job->driver->complete) {
+    if (job_cancel_requested(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.29.2


