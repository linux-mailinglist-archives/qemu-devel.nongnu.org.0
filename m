Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A324A41316D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:23:33 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScvz-0004WV-La
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctS-0001Ot-EL; Tue, 21 Sep 2021 06:20:54 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctP-0002Rp-1p; Tue, 21 Sep 2021 06:20:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYaRjAe7TtsVpY/77CUXzSg/Jip1Kso2nGv5wZoHqEtOpESMLAA0/G5myDahqWtA9vP67zyXhGJ8VocTL8QKcWLG0Ql8SGb28ej9JNmM9sazsN49AQSOrmdiaj2QHy99cxMB1h3WhSzIm6rXSlDl6m6lzQM4W/WSHyEjoCNOj238Or9VRfjHf/sIDkCs7OijXYe0Hxie62utfNRZC5Dkz6doVhotlzX8EbzdVm0ac7vbAWRzUfhXgbUeXEX4H9Wj/G5ivetTlt0zvt5YFGY1VrDb6Ek+txLzQAAfvrzYPN0rz25mEkQ7aDL1pocERs5GPLp79I4nS5vyCCr/QKHwIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=a4pk0zXyfELarXEGWwbJZ3kfBq4sF8EEDFdqWmXHJlM=;
 b=Ibo/tCb6RUglKbg6BTmBZdUZp+5Rx9KjJOjChV1dzUwNPxCYVhoaCEuEprxWl1Tk1fzuC1I2dTzlh7geER/wH/FoVDLOl9d7htGYemb56787/cV9Rf+gvMUlBZtjP2UxLKrVNS/CNrDH2xY+bLSI08Bx1UTKvq3HFyBMiXcPBzuuAd1erx2q3I0vkajY9ygAE99I7aNI/qeYpJ89MKDrDr3IAFL7Vi57Peem9c/IVFWjmhKve5XTcts9bDFGfg7NK3QaWPO0iM6x3KFMOiPzR7wRdNkmshj5ycjk9ugNBxNz4doZHgz3aVqXUqRidgtCMm2LNAYq8Orq5eQlHFyFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4pk0zXyfELarXEGWwbJZ3kfBq4sF8EEDFdqWmXHJlM=;
 b=avnKyl/VN4EB6aykhOry9g10lwcv5c4ZdP3PqN2+Oqawvk5QEV282/skApolghr3EyYAs4AiOhVDGfrRx3/holHHd8frexlsKo2wOom95WTvoA4oQ5+sjo7tPqUMDxlHvGnMBoA4RZz1JyzzXSZ+81RnmzAKgpLn26HGC3A7a/A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 06/12] jobs: Give Job.force_cancel more meaning
Date: Tue, 21 Sep 2021 13:20:11 +0300
Message-Id: <20210921102017.273679-7-vsementsov@virtuozzo.com>
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
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ca94f3a-78d1-42b7-cc5a-08d97ce97691
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944E40C9289B22D35D00B75C1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUyNIoq+42M+t9EXzoqPDer015mqnh4nosswf0Y3phhWyF3kmEWyor5DPbv5w0J6RbxIZHZ9XEKDxUpl2798Rlb0vYnn7OrkMJVsfo9gf2IUzw1DiXiVjRZqyvBCb/UOkRkW1MpkN7KM4q2iY7/TgncNoSDozp26bjAXemr5fsfMum2o8TCzkbBXUlatTDpLqgjHcmakp3M4+rJ1iuzfZqZGk+/JV7EQzDJtXxRJIe5LcVk6wbz0zw6MF52BQuixKRo7j4x1ViY7lO8G1Iihcv/CfIO5Ml/Sf1QlxuRlAYEVJCDqbKdx+fy7w8/X4pQJdc3kHxWau0LucB5VWf3MxMBsrWBCG1C38n9NUNfBBam6Pw7e0oa47+vOAfbll1NulxN3mqsOubK1b+5UvNm+CUk9PKbuRbYiWsFxMI7uAe61tZ+GBJshLC95k4mcKU3b/W8CTCDg/SpWpM4IOTcTLnMUQpEPn1Hc2B8UVR/0X0lUhGMwP0/KnzgKZfea1xOTKB3frdCw/tmKtIx4nFBnRKN6MghKdf241jUnc2OMX7ox0vn7NaNaH2ndD9/9GvgTC5a0dz8rE+L2s3DbG/ewArKGVhA4TbsDi4VtZV/V1Zfz/ooTR6Ib+bNn7DE4OKtYGBl0g5/CDm7rXJgpr65n+Ow94/wzbaECpvv9+gICJnLgvGoRcSR4/7F84jhrVqg8wIaBtFR+HDuIi91LpInfgMJITvRtqWROVb8CoE4/62o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LRJqG4yJ2o+wEU5xG6E00rasMub1c4aAbGhNd7+OIlBFebJMlJ7QvpI9wEsK?=
 =?us-ascii?Q?tRwnFOP9L/zfxNQA6Zi3IU66CiCbxmiPh8v9MrS3h4sQG4Rr7sTJMwtqyCpb?=
 =?us-ascii?Q?wXUQVIOsD+KK9EfK4M+UXHHrNFM48LOFW+sydQe8wZZ7wsxpg5RERO8SIB2G?=
 =?us-ascii?Q?v3nr88O/9ElSAM/nAx3fjc2wNHrDq6ZfFHfz7/fvf6LNxIh4/T8CBfeJSq/f?=
 =?us-ascii?Q?cuSWm7AWHvuK3h0rHcE6Zxvdl69P/ZEXkT6FRQfEUo6f0bGcPNWCjD9DoWlb?=
 =?us-ascii?Q?+qMNBZRFIrcQ5LWvwD0jEoGRQpkryD9xo8reLWvjQvDa1OQvEr8bhvdRtggc?=
 =?us-ascii?Q?nLwlslO5NkJlSG5rs9YnijcrQQqEn5uyRXFlAGIII0a+aFKY3HNnA87HWcK9?=
 =?us-ascii?Q?b1LkXFmwkmA2HfnIdloF3SOzSiOvMMype8Ba7OKf7SQtqTvFFkEcIu0EKEKV?=
 =?us-ascii?Q?dHG9x/vWbuHU/f2IxFkQWtcVc+MdDI+lrSUZhFvCEMhboWlasmU5eXFDMtMt?=
 =?us-ascii?Q?UzYL+PjaMSOM8JfASulgzPzuNK+OP1qPZ9DyVW/fcln4dlW+Gp7A+wqPHXeH?=
 =?us-ascii?Q?F5e0aKTGdQDHVFYOY0sX98hQ1ubkc0IDS3mShGoJ43WPQ444Ut6zcPued9FS?=
 =?us-ascii?Q?da3EQQ3TBAG26WypZpWc22DbMp01JJth44R7vJmilFcTP3zjAd+q5hhzBz0f?=
 =?us-ascii?Q?f/FQNuTvejBmqlSdPWCbdbMo6NKH7l1C1Tewx9CRt07xmiO3PfgK2pVOZIOz?=
 =?us-ascii?Q?YBjgQT7P8DTHh7RuUHNPFrT6dkckf1KJV/qtMO6RMznxverefWB9gU87waqV?=
 =?us-ascii?Q?iO1I6C6BjwkOIpFRzZdaNqbzuiRMWzNDuPBoMUFZVS6qVbhANleY2bDsPHX+?=
 =?us-ascii?Q?x31h53d9OGGEAbr3naoUn0N/5ntS8c7EP5K/AXRPdTYLVT3yy6CxQwSGSt1d?=
 =?us-ascii?Q?oN/7cYrYq3P2uGSX7WyRqYtvZDtRSCz9ZCFKX81Z95Onme9lyUmVA0tD1ti+?=
 =?us-ascii?Q?9kEDmV78tSnKtzUrvqInufRmdrRiq2ilYOJSmIg2rMYL560V25EuLXhRB1MC?=
 =?us-ascii?Q?3tPX1s1OmaOi4XTMNCsBNecYBxMYZhg69Vl2Wsh4wVXfmBeBYg21lMhBElhC?=
 =?us-ascii?Q?mYNKbYZLbVZkyZlx4EZkwKcpDwUtbrYSAnXfMCXPpGyx7F5fGDXA47H3CIk3?=
 =?us-ascii?Q?q62COHHomPL4XCMCA7MLwU97NhiPFHzXG0DYj9CA4eg7ld1zC192hdEiIGfA?=
 =?us-ascii?Q?2Cv9+WD+WbeNkoRcENbp7rYAmnOTU77xP+AlRujUiE3jXrOKX15T2Vj9RO9i?=
 =?us-ascii?Q?1zdQOTmrZilN7dR8j4d5k8Wv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca94f3a-78d1-42b7-cc5a-08d97ce97691
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:40.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxB6wgbo0mCqOWEex1PrIAEqhm1u5e4ekX4PjcluocEpVdl4C4tP/vSGT+fkVauKN6Pimj4LTD1I5JfOrv9pmYFLf9w/woazRCw2uiZAopw=
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

We largely have two cancel modes for jobs:

First, there is actual cancelling.  The job is terminated as soon as
possible, without trying to reach a consistent result.

Second, we have mirror in the READY state.  Technically, the job is not
really cancelled, but it just is a different completion mode.  The job
can still run for an indefinite amount of time while it tries to reach a
consistent result.

We want to be able to clearly distinguish which cancel mode a job is in
(when it has been cancelled).  We can use Job.force_cancel for this, but
right now it only reflects cancel requests from the user with
force=true, but clearly, jobs that do not even distinguish between
force=false and force=true are effectively always force-cancelled.

So this patch has Job.force_cancel signify whether the job will
terminate as soon as possible (force_cancel=true) or whether it will
effectively remain running despite being "cancelled"
(force_cancel=false).

To this end, we let jobs that provide JobDriver.cancel() tell the
generic job code whether they will terminate as soon as possible or not,
and for jobs that do not provide that method we assume they will.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210907124245.143492-7-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h | 11 ++++++++++-
 block/backup.c     |  3 ++-
 block/mirror.c     | 24 ++++++++++++++++++------
 job.c              |  6 +++++-
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 2eddf3b536..90f6abbd6a 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -253,8 +253,17 @@ struct JobDriver {
 
     /**
      * If the callback is not NULL, it will be invoked in job_cancel_async
+     *
+     * This function must return true if the job will be cancelled
+     * immediately without any further I/O (mandatory if @force is
+     * true), and false otherwise.  This lets the generic job layer
+     * know whether a job has been truly (force-)cancelled, or whether
+     * it is just in a special completion mode (like mirror after
+     * READY).
+     * (If the callback is NULL, the job is assumed to terminate
+     * without I/O.)
      */
-    void (*cancel)(Job *job, bool force);
+    bool (*cancel)(Job *job, bool force);
 
 
     /** Called when the job is freed */
diff --git a/block/backup.c b/block/backup.c
index 687d2882bc..e8a13f9178 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -327,11 +327,12 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
-static void backup_cancel(Job *job, bool force)
+static bool backup_cancel(Job *job, bool force)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
 
     bdrv_cancel_in_flight(s->target_bs);
+    return true;
 }
 
 static const BlockJobDriver backup_job_driver = {
diff --git a/block/mirror.c b/block/mirror.c
index 86ddecb86b..7022d8011b 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1094,9 +1094,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) &&
-            (!job_is_ready(&s->common.job) || s->common.job.force_cancel))
-        {
+        if (job_is_cancelled(&s->common.job) && s->common.job.force_cancel) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1109,7 +1107,7 @@ immediate_exit:
          * the target is a copy of the source.
          */
         assert(ret < 0 ||
-               ((s->common.job.force_cancel || !job_is_ready(&s->common.job)) &&
+               (s->common.job.force_cancel &&
                 job_is_cancelled(&s->common.job)));
         assert(need_drain);
         mirror_wait_for_all_io(s);
@@ -1195,14 +1193,27 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_cancel(Job *job, bool force)
+static bool mirror_cancel(Job *job, bool force)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target = blk_bs(s->target);
 
-    if (force || !job_is_ready(job)) {
+    /*
+     * Before the job is READY, we treat any cancellation like a
+     * force-cancellation.
+     */
+    force = force || !job_is_ready(job);
+
+    if (force) {
         bdrv_cancel_in_flight(target);
     }
+    return force;
+}
+
+static bool commit_active_cancel(Job *job, bool force)
+{
+    /* Same as above in mirror_cancel() */
+    return force || !job_is_ready(job);
 }
 
 static const BlockJobDriver mirror_job_driver = {
@@ -1232,6 +1243,7 @@ static const BlockJobDriver commit_active_job_driver = {
         .abort                  = mirror_abort,
         .pause                  = mirror_pause,
         .complete               = mirror_complete,
+        .cancel                 = commit_active_cancel,
     },
     .drained_poll           = mirror_drained_poll,
 };
diff --git a/job.c b/job.c
index dfac35d553..81c016eb10 100644
--- a/job.c
+++ b/job.c
@@ -719,8 +719,12 @@ static int job_finalize_single(Job *job)
 static void job_cancel_async(Job *job, bool force)
 {
     if (job->driver->cancel) {
-        job->driver->cancel(job, force);
+        force = job->driver->cancel(job, force);
+    } else {
+        /* No .cancel() means the job will behave as if force-cancelled */
+        force = true;
     }
+
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
         if (job->driver->user_resume) {
-- 
2.29.2


