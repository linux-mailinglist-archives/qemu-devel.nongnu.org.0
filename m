Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7A4256D5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:43:18 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVYD-0005mG-Nm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUp-0002uX-6c; Thu, 07 Oct 2021 11:39:47 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:51642 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mYVUl-0008Og-35; Thu, 07 Oct 2021 11:39:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPY46pRvQGPCOwA46I1lsvSfPUwZ8Cp+X9FZXxln7orWVfCe3dAnLY82MpHpP6UEQ0UMNCCBssidCaXx6zydV8LkNcGb2+S7RqFaQvJbm6mS767QODsHUbz2iWHE9UJ+Z9fh3GGxvpLVcNMAkRIfkkwoXObMHdXYlYFSOgLBstFwHUdzWk1CzGQPTrNycxxPRvmF5TDZos/C4dggFx5PPXcnsX9BRhJVAmwehKa+HyA/ydKtC6KEfYI/SyHg/XctQbH1PuIpAjxjDlK0EEl7ssfyULYbz0VA9rEls5ZHvYX0MW/KPf/qJMyfP6q7QPJ7TNy5giR5m++6g7Jteu0IgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrCl9AWb819mRfRhUPO2Xpx6fLXfgyodSuyh6gW/ZOY=;
 b=N9N8tNcjGO1/kpim9aoMALDOL30gWgPZ77QQ6VRHjccEC48/gQVsbbC/BSthN/+En31yX/5ra7wW7Cq4gGdq+TbWnMv4whHmWesX/Z8D/bs5kubRH9YBm09l+q6qpFqIspTP92IEkmd+a1SBTZgFVct64GLGYmr/w7fja+29w4THkSlPddlnV19yMatw+glQ+MMlSXN3bVMh/MqkXV+/0VSK4o+y2LZtRFcApVMsbDwsv7SG6HzhJGmaGA6Iknyc2aqQ9XJb+jCyHs6ZApbGGT2j+X9N8GGIdEarEjZ5Sj/OSVGESZNI28QDoWnUYwpDkttTd6NBkLIp87QKnuPnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrCl9AWb819mRfRhUPO2Xpx6fLXfgyodSuyh6gW/ZOY=;
 b=czLvlsMyrLnaW9p57PYkrUlPvjy0XS/lB6HtHKxL5EpK08T49G8+HRHn40Ubtug+HkRCPLJN1v5lLh1TcdOFfQok5mzZT/s5/PYLE76Yw0iYj5bWwjiG1vUsOVW7rpDJcl2AXyj2esL+eFkQh9QACpjJldUj84tlGN+11TCTMY8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:39:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:39:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 richard.henderson@linaro.org, Eric Blake <eblake@redhat.com>
Subject: [PULL v2 10/15] job: Add job_cancel_requested()
Date: Thu,  7 Oct 2021 17:39:04 +0200
Message-Id: <20211007153904.445009-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007153904.445009-1-vsementsov@virtuozzo.com>
References: <20211007153904.445009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0347.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0347.eurprd06.prod.outlook.com (2603:10a6:20b:466::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 15:39:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88937bd1-08d8-4d78-b4bf-08d989a8a14a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61344FC30C776EE198FC10A0C1B19@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+vsMMQlhDci9sjEd7zshIg/HlVuXExApTriZHTWuvQ747I4euZcrvvgbVz/Uoa0Rkremo0Z34OYHvUin9CpLQRM8wo8HTwxpRjSQoHOSiEVbw04re//K/Gi1TNXIff5llOormiJH+49LrISDCoEJnInoUzx0F0Xbo/+rw6TT+a51zg+6hFjtSHl8dUi1QJvlgEipF3x3gFoUdH8EPoyyEmxi4oQzM+UG3uwzOKfIUu0GQSG5HnMRalNRmvGqDy9wZH6PQRUFL+Mb4z5h8LzCqBocidu0YnN7p1W29F3v6+dZBX/+K5ttOTlf4bipAGMjzLkmpi/B8t23k2TA4njp+kENURsxMhnETAeN2idD1R/2pAFKD5SZoJRst3/JNMVhCf8MUs7mnHj8CzQJR4OM1MNsg80ESFV9ymFka+ZCXS9GQ4vC6vZBk4nA3W1Gih5r7hy/prMJgPERYCtH3rJANVCKek+Kt7c464AVLUY5Wm8WLHPvjkMSI547CnPZhlDDBQ9m+PtIL701J5h3DA+yw727LmoDMWvHomdpCRBAopB/X+KYwUugWGXhxccg7AJFpi/d3rhsLBR7ucGnspXIbHEkNRmqDO1p4fMp7Pd1pEkFn63kYlTsX0r2fhNm1TFgCHxLOhNpaTisH7AgOF3+pWNiDK2ZRXBlLAH3Px4p080PSBPo+vYx4Dg1++ou7vkucSqYdEVH02ihP2UW4R7xcyba6UfL4+QF0Lb8IFuh2Q77+ce5lojTqZVdrTLUSfy5WsJr1D+IVrjrqw88KTHZx3425E4KeZquy/dcrt8mwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(83380400001)(6486002)(2906002)(38100700002)(316002)(508600001)(4326008)(6512007)(8936002)(86362001)(966005)(1076003)(2616005)(8676002)(5660300002)(6666004)(6506007)(66476007)(66556008)(186003)(52116002)(66946007)(956004)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VUxMTUh0JBoN3t9/3iikwUb44OELLxOer0ADQ6Q+EPDySGt2++vMRx+9Xornsove3CgdBkMmzMaY5PVbgIN4ecIc1573aN2LQPHEkAwhV8IDpKIC32jqdctSEe6D0G/+Yn9fduSTus9ZYwAyK3fbDfEdMOV2yeax8QghzokhQGO+yqN5feJLrfy4myU5GRfQLwcOD3X2ohIJwr5xlh9bhLbhYjOlkq2bwOpR7484V8TykdOplx7KR387jHF4IpL5Z2LrXrZ7vir2j2SfPFuwXKr6iaaS4Xe4MMDHLu4bDmKfrYSxRX0nZhQmGfgG8Mw5KYd/EUrgclrX9JXG/yU1ANr+6kY6WVGiJq00B1O8RP4Ta+WxP5Jm4xvJkF8v4sstM5lwNbm0jq9TDCjFSI6INEkE7LGlnLZl2ok7OEffKTJmhBNPLLxZ3lpJYi0G+99pglQrCHSevApXy9X3IQWhM7s7C6A/9E+l6hlghz618Zt7khIaZl7mukvKIkmnVa8SSA4h7ekii843xuq2M9pPyprCURsebF+3ER6mxnZpCV1q74tvhtCXJcgNr5Y+Jrt32ltPGdd9U3Bx9K4DITbKVKqwfdHvP2mUDAZ/vJqFC8KKHFf9N5FFAfg6/cpuIPCgwnG9RZKREmvOvojEK4YIZ6jgEpmqYgK3gi22fsWh6pQ+Apbs2m9zrIgAncz0wNizB6MHDZqhsaQMgfNDHlXb3MU4USC/XAQbTDkjIao2hdp2g12054NwNMQRWZ2aTHSw
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88937bd1-08d8-4d78-b4bf-08d989a8a14a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:39:20.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GgtNIRmqdJGY/+pleKWnicsn8brTqxmY6W1q2CE/+l6qr3VbIgHWQe7Emf+xlvf5fNdjp14esfZhSInYeGfcL10aFyoabbGHAQzkx4Fpfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

  - job_cancel(): Both functions are equivalent (see comment there), but
    we want to use job_is_cancelled(), because this shows that we call
    job_completed_txn_abort() only for force-cancelled jobs.  (As
    explained for job_update_rc(), soft-cancelled jobs should be treated
    as if they have completed as normal.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006151940.214590-9-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h |  8 +++++++-
 block/mirror.c     | 10 ++++------
 job.c              | 14 ++++++++++++--
 3 files changed, 23 insertions(+), 9 deletions(-)

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
index 010b9e1672..2d9642cb00 100644
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
index 44e741ebd4..b0cf2d8374 100644
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
@@ -798,7 +803,7 @@ static void job_completed_txn_abort(Job *job)
         ctx = other_job->aio_context;
         aio_context_acquire(ctx);
         if (!job_is_completed(other_job)) {
-            assert(job_is_cancelled(other_job));
+            assert(job_cancel_requested(other_job));
             job_finish_sync(other_job, NULL, NULL);
         }
         job_finalize_single(other_job);
@@ -977,6 +982,11 @@ void job_cancel(Job *job, bool force)
          * job_cancel_async() ignores soft-cancel requests for jobs
          * that are already done (i.e. deferred to the main loop).  We
          * have to check again whether the job is really cancelled.
+         * (job_cancel_requested() and job_is_cancelled() are equivalent
+         * here, because job_cancel_async() will make soft-cancel
+         * requests no-ops when deferred_to_main_loop is true.  We
+         * choose to call job_is_cancelled() to show that we invoke
+         * job_completed_txn_abort() only for force-cancelled jobs.)
          */
         if (job_is_cancelled(job)) {
             job_completed_txn_abort(job);
@@ -1044,7 +1054,7 @@ void job_complete(Job *job, Error **errp)
     if (job_apply_verb(job, JOB_VERB_COMPLETE, errp)) {
         return;
     }
-    if (job_is_cancelled(job) || !job->driver->complete) {
+    if (job_cancel_requested(job) || !job->driver->complete) {
         error_setg(errp, "The active block job '%s' cannot be completed",
                    job->id);
         return;
-- 
2.31.1


