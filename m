Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57154131B9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:36:17 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSd8K-0002i7-TM
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctO-0001Ib-C7; Tue, 21 Sep 2021 06:20:51 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctJ-0002Rp-CA; Tue, 21 Sep 2021 06:20:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+SbpVc3N/zzwF7SSiGoqCdG1x6+JA1ZP0xKepDAx72bWTQgL5ZQTnQgQ0wmJKiF1WGqBy0XlhJ+hAPwdXeIayqhfjtHDhbtHyAcpd2fm1NppfTe45setwkn0EPcWkKZB/xAO45qO9+HV8LkQDrhgkf307qgQ/VQ1S28IVb3AQ1eVhNKBuvyhFCQUsqVVT2WUN04uXbjWEQYZgz82FA9nUr0aZU1W2CyMl+1fOulAvaVyOpyQa+YMdcU+pGXKRaqeNMFmKLYWuReSKD+jQ47jB6QYJkEDFfmV8V3qLWi1KAp19jkFFYu4woPEpA2kANPSWxbIDLRmfoQGUeLPigJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dqy02NT2r4w9wctXTGxIMEOqTvjdAWhTtj5dSgeWovY=;
 b=VMTzOftnGvJ6sWlDtWIQ0/XmqtNIOwvPAjk1+vE66nPET+zSQ1tOvK79CDwzbv4cIdmK2HlB/gVumRvaQVgEVeVVNlDsSsFsuKnetWTIEhK5pcTrGMH5QdQT1VskUQFiq1l/XfvukHYIGKzWWozZmLxSmMr2tGhQSXA2TMRM6kImpc229WmyTv8kREWGYF/P9L3KHGW2NTYCkrQHPstvUxIVEidEvA6/lDX121S+PQbuQlgWXd+yOPlRKWRF/vbbOiFNkUuI80NzXqktLwTfpGMjr7Fcnv22w025UmAy5o0CWnX9MFEmchm2fkJvK9p9X04BTzk/6W71oqnO79QGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqy02NT2r4w9wctXTGxIMEOqTvjdAWhTtj5dSgeWovY=;
 b=YGBbDC9FAXtpmSNDtJUeaOw2iwRunT3feAzU1scuFJleExvR1xHLO3nn02rm7Qca8cr2qNElEB8LdLVafJrS+pr2SIiaSomU736hyTj96jvmhLo2+HWB1C2aj2gACYPc4aJJVW+P7jd50di0VbJ2+JxK3yh1FHn5F+FcvQDMkq8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 05/12] job: @force parameter for job_cancel_sync()
Date: Tue, 21 Sep 2021 13:20:10 +0300
Message-Id: <20210921102017.273679-6-vsementsov@virtuozzo.com>
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
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6048b64-ca05-4eaa-7bbe-08d97ce975e2
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59445DBFEB9292492C49280DC1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0O1K6qS91ZkIYK+FdNKl02lO/Fm5fivmjMgEz9r3WyPePAz97byysFsqhiQ4Zwp4bIgqC0jZtJy32N0EgbTHM4k6/xj7eT98KaPfrE5yco1/V4j4JP1EiMcpREzfRTnnKoNQQz1GIDro7ue3IHCqTDFJpgmfRSzAKC4pwdG0Pii40UeORd03gEG5BHFZ8wGWe9Dmmnh3AgqucTmF9emVrqPpRLi4CmVxL5u5ItasO/YG5OtL3OlO8VuX5DCsosZ1AwoOruHKp8umzOXVO4qhhYgGVcAH12sIZ3vdzPAwqRg4vVWjXromKa17m/bIhOISSCkKtJkBXBti2g4vTMJnPnXwmuBV1qUytv6bbV05V7RCSegW4ycAqfxoaH6HM7Ml/O+GXwFD9t1svAUJr/HkcL8IgQr9FA+H6iX8a8k/GK8n5Hrd9G9BHh5C7cgqW/D9ZwyOi+tWNV4QsAQQuMDULGWyavaMghkXpE3sjTpPFz6F8ieb3GFCpO/8TQ9oGs4vGCXcpkIjqSZAYWZeKpzP3TRw1+pSUEDnuLiEVSWoEhPWKRodQQ5vMFFCwsa6VmmGR8GKW495RlGTzhMA6fwnJ9P57krtr6HbLf0wlWPAVsi+/YpTGMqmK6krLzkvD9m7DDx4cZeDDHmJvoLbe/q8Rx9D8I1Fi27ktO2+LMYiULxRu/LcWZrYuIWIzPPfFMTiaVBESXPaF7MhEVXEj4L+cL/MZgyxQGxuavmvvE9MtdbYdqhtohGgE0nGYfEllFSuygEuhvNDrkxp6kIZ8EWtGBAqIkjtGnYVuek2skdfrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(30864003)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(966005)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U+E7D4/GocNOtJm9n5HISgOLyvkxNqMA8m63lByqKRP7Fybr1SbcF1lPDXc9?=
 =?us-ascii?Q?0BkyEmguKcsI9GYoiaqVqy7oTNIoICn9i1pITPnZr0yN0c4CwGV2cKk0xYTa?=
 =?us-ascii?Q?Lyd2GLcGT+VJoL4oK8T209HyMIp6sc+JJZZ2PaFXmeVduEDWuTvFOf3hSrmc?=
 =?us-ascii?Q?ypjjlLQH6EKx0hCzhdXIwqVlvnEGZSQLMyVxCrzimOUSgleRHqX9q11rATO9?=
 =?us-ascii?Q?T+9o1OgwcSTCKD6Ybb0dQmcFo4RAfr4FxOE5nu6UIPYOrpEWDOsGFThjub9u?=
 =?us-ascii?Q?6Wib34VrT8xD7gixHT1u2UCudMDkNF0kNO0tm0Fu32TUYnOyNJc8JInFw558?=
 =?us-ascii?Q?ys6jTlD/ovJPpGxOLdsautD49RQtzqcdqwI2Om7iVvM4oonNXQ66/jpuTL4z?=
 =?us-ascii?Q?t/ZSkZ1rBd4KI4xsLPArzYp35T99SGPvuNaS/tqdGUwKrPCZ0AitIWwkRr1/?=
 =?us-ascii?Q?g49o7NZcFyaVrPaGQ0RommUcIlTDkwjIjBiCyx5ddPtRtf6eVv1UmHkHjUE3?=
 =?us-ascii?Q?FyWYxuaxUTRNb5PGBOA/yIpV6IjuygcWMWIr3tH4B7rgWZvAPe9MXzpmPxSy?=
 =?us-ascii?Q?i5Q2CE5PW9D0ZdqKL8y7my9Lu73WMgBtLWqrkx6g6+xjyS7jCXEZ6RavbyuY?=
 =?us-ascii?Q?d87WehVjxKJfah2hRfivK0AdYT0zI1+zxDNyterDLMiH4vOSGcBGfgEytUlB?=
 =?us-ascii?Q?9jhXlo3ifH7yovFLRHrY+BRkWkNMCptppimkS/sd2RaVJ6GcPMPgeU2wFqyg?=
 =?us-ascii?Q?Qt33pya5uDreSEudNJAQoPEFkUnTzvZ+RGAyjKlanWhoPEU0DUcin+124G0N?=
 =?us-ascii?Q?D1eE9YBuhavsMtqTL2PzgoLy7lUVp0OG17lSj+TqdWvlGsaH6mA3PVx4foxH?=
 =?us-ascii?Q?X3PGTP5XM+AnXYps1l5Pj/Wi9wpBAmzpYFU3nCmUxMAgsyo8bwdEdaLHK86D?=
 =?us-ascii?Q?YG2OVgSpZyrXxsMAVxDSzZXB8zyDJKpgXi3WMqCh7GiAe2bfW0RuNvz1NIwV?=
 =?us-ascii?Q?beNS0BmjseTdEpjxIvqX2nwk43cvMlf996I5R60RbSM8RB02FRy7qQydBzbJ?=
 =?us-ascii?Q?eu3vORAcCjOvOvmBEVA+uWkA2uoI82EwNynyWUN/KAH4Ayzx882TG9JI/znq?=
 =?us-ascii?Q?GEgXXI+lA/fMhE9afhx+B4bvC4ukcfW0JBinKXezujFFVhM2bVM4AMt6F+eY?=
 =?us-ascii?Q?JhYI8U/R81UWshL5uXqMgU1Al6YnENfokAXYfu2M4JPIo/v2FKkNYKgRbjO4?=
 =?us-ascii?Q?YvDvcGiYlyMkV2NEHc9+N7YtIzwxwjg6R5PKV/6/POQHMk5JsWeqHVQYUZzT?=
 =?us-ascii?Q?tMhpIqTMke3AbCibdtLOVINT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6048b64-ca05-4eaa-7bbe-08d97ce975e2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:39.8747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOrT1x8Jsd+y2q8fsX6kPo/yx2o7Klfdsk+zeLQwoSbeUvF7RBIkZiDrWqTc7ksMKs1kkvQguu38av8tGJQOPOuWWHBiHMwbbb22zA7jLOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

Callers should be able to specify whether they want job_cancel_sync() to
force-cancel the job or not.

In fact, almost all invocations do not care about consistency of the
result and just want the job to terminate as soon as possible, so they
should pass force=true.  The replication block driver is the exception,
specifically the active commit job it runs.

As for job_cancel_sync_all(), all callers want it to force-cancel all
jobs, because that is the point of it: To cancel all remaining jobs as
quickly as possible (generally on process termination).  So make it
invoke job_cancel_sync() with force=true.

This changes some iotest outputs, because quitting qemu while a mirror
job is active will now lead to it being cancelled instead of completed,
which is what we want.  (Cancelling a READY mirror job with force=false
may take an indefinite amount of time, which we do not want when
quitting.  If users want consistent results, they must have all jobs be
done before they quit qemu.)

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210907124245.143492-6-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h                    | 10 ++---
 block/replication.c                   |  4 +-
 blockdev.c                            |  4 +-
 job.c                                 | 18 ++++++--
 tests/unit/test-blockjob.c            |  2 +-
 tests/qemu-iotests/109.out            | 60 +++++++++++----------------
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 7 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 41162ed494..2eddf3b536 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -506,18 +506,18 @@ void job_user_cancel(Job *job, bool force, Error **errp);
 
 /**
  * Synchronously cancel the @job.  The completion callback is called
- * before the function returns.  The job may actually complete
- * instead of canceling itself; the circumstances under which this
- * happens depend on the kind of job that is active.
+ * before the function returns.  If @force is false, the job may
+ * actually complete instead of canceling itself; the circumstances
+ * under which this happens depend on the kind of job that is active.
  *
  * Returns the return value from the job if the job actually completed
  * during the call, or -ECANCELED if it was canceled.
  *
  * Callers must hold the AioContext lock of job->aio_context.
  */
-int job_cancel_sync(Job *job);
+int job_cancel_sync(Job *job, bool force);
 
-/** Synchronously cancels all jobs using job_cancel_sync(). */
+/** Synchronously force-cancels all jobs using job_cancel_sync(). */
 void job_cancel_sync_all(void);
 
 /**
diff --git a/block/replication.c b/block/replication.c
index 32444b9a8f..55c8f894aa 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -149,7 +149,7 @@ static void replication_close(BlockDriverState *bs)
     if (s->stage == BLOCK_REPLICATION_FAILOVER) {
         commit_job = &s->commit_job->job;
         assert(commit_job->aio_context == qemu_get_current_aio_context());
-        job_cancel_sync(commit_job);
+        job_cancel_sync(commit_job, false);
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
@@ -726,7 +726,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * disk, secondary disk in backup_job_completed().
          */
         if (s->backup_job) {
-            job_cancel_sync(&s->backup_job->job);
+            job_cancel_sync(&s->backup_job->job, true);
         }
 
         if (!failover) {
diff --git a/blockdev.c b/blockdev.c
index e79c5f3b5e..b35072644e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1847,7 +1847,7 @@ static void drive_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job);
+        job_cancel_sync(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
@@ -1948,7 +1948,7 @@ static void blockdev_backup_abort(BlkActionState *common)
         aio_context = bdrv_get_aio_context(state->bs);
         aio_context_acquire(aio_context);
 
-        job_cancel_sync(&state->job->job);
+        job_cancel_sync(&state->job->job, true);
 
         aio_context_release(aio_context);
     }
diff --git a/job.c b/job.c
index e74d81928d..dfac35d553 100644
--- a/job.c
+++ b/job.c
@@ -981,9 +981,21 @@ static void job_cancel_err(Job *job, Error **errp)
     job_cancel(job, false);
 }
 
-int job_cancel_sync(Job *job)
+/**
+ * Same as job_cancel_err(), but force-cancel.
+ */
+static void job_force_cancel_err(Job *job, Error **errp)
 {
-    return job_finish_sync(job, &job_cancel_err, NULL);
+    job_cancel(job, true);
+}
+
+int job_cancel_sync(Job *job, bool force)
+{
+    if (force) {
+        return job_finish_sync(job, &job_force_cancel_err, NULL);
+    } else {
+        return job_finish_sync(job, &job_cancel_err, NULL);
+    }
 }
 
 void job_cancel_sync_all(void)
@@ -994,7 +1006,7 @@ void job_cancel_sync_all(void)
     while ((job = job_next(NULL))) {
         aio_context = job->aio_context;
         aio_context_acquire(aio_context);
-        job_cancel_sync(job);
+        job_cancel_sync(job, true);
         aio_context_release(aio_context);
     }
 }
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index dcacfa6c7c..4c9e1bf1e5 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -230,7 +230,7 @@ static void cancel_common(CancelJob *s)
     ctx = job->job.aio_context;
     aio_context_acquire(ctx);
 
-    job_cancel_sync(&job->job);
+    job_cancel_sync(&job->job, true);
     if (sts != JOB_STATUS_CREATED && sts != JOB_STATUS_CONCLUDED) {
         Job *dummy = &job->job;
         job_dismiss(&dummy, &error_abort);
diff --git a/tests/qemu-iotests/109.out b/tests/qemu-iotests/109.out
index 8f839b4b7f..e29280015e 100644
--- a/tests/qemu-iotests/109.out
+++ b/tests/qemu-iotests/109.out
@@ -44,9 +44,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -95,9 +94,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 197120, "offset": 197120, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 197120, "offset": 197120, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -146,9 +144,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -197,9 +194,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 1024, "offset": 1024, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -248,9 +244,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 65536, "offset": 65536, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -299,9 +294,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -349,9 +343,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2560, "offset": 2560, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -399,9 +392,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 31457280, "offset": 31457280, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 31457280, "offset": 31457280, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -449,9 +441,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 327680, "offset": 327680, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -499,9 +490,8 @@ read 512/512 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 2048, "offset": 2048, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 2048, "offset": 2048, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -529,9 +519,8 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
@@ -552,9 +541,8 @@ Images are identical.
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "src"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "src"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "src", "len": 512, "offset": 512, "speed": 0, "type": "mirror"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "src"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "src"}}
 Images are identical.
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 189423354b..c1bc9b8356 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -8,7 +8,7 @@ QMP_VERSION
 {"return": {}}
 {"return": {}}
 {"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
 
 === Streaming can't get permission on base node ===
 
-- 
2.29.2


