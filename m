Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3C3D7B68
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:51:50 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QJ3-00061S-2M
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFl-0008KE-Lv; Tue, 27 Jul 2021 12:48:26 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53292 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFj-0004HS-N0; Tue, 27 Jul 2021 12:48:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq0QUQbK/sr8lRQOvOE/zuRHE70tM8u8xhNzWpBjVN6wX8Wl7Ck1cCZupSzn4EUPAfdgvgQXj22g3OS/wHJrFFfL1q0n8BZOO96yFLdmPAtcTbwY/VT02RTRVP2KPW4jvTYAhEV6PFVpbrk/HCOOGidoskmvDVJvWNkEM3QVSH+WrFMp/h1uW6XucVs+BX/kwgYmarUSpurIroYV9r2PxMSl5zKrSrY/DT8VoIlGQfmOESzSR/QbbA3JBN3DDJln80qz3swB6pe64NFmxivVw54XQ17CJxKv942pmb8YWI2Jez7iXXmIwe/d0jTIGKcJN0jjNxdNui+PuWy9Lk/+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDJ8aiOTNoHKFRDH+FXj459pbQVxvBlaA5zx6/GnxYc=;
 b=A7gCfvYm/078UOCeokcXx1ZfpG3fZ6vNEiMR5G583iMueH68SYZ4Rt/NpjkHUZSRLGbq4Nxz2LWtXtSzA8t8vK7rIcqzviDIKPAJ8P8JznVb4A0DQqveyP8Hozt42sUPUo/b08JjjQDz3ydYsFjo5Oi7piwyE8HTiJ70noj+pg9FHngDXZYQqMK/JcHoxlb9sbYjsLWXtQQQcLnY8ZGTNwR6/dnoIe2pFJLe+1wiNvxOkdjUPQEqXkWrALAtNnttGYy8ELtMUyc6OMfHO0kg6LwDPqO1Zzj7K/9ATi4ArAaRu2TXrOahszH6UWT+XYLa9gqZxfy/6zasDLMps5nsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDJ8aiOTNoHKFRDH+FXj459pbQVxvBlaA5zx6/GnxYc=;
 b=i9hCqQiAfmHzlcg7KrbYRhHuwyqxvJSJ9BsX8ZdaymCXVKMV6840SKFKWoHzTT7FTlLTglVVIPmef6bcX0bhsfBwi8gAMsqv5D2Ptk15vUonAm89Cnn3kDw170VpOW6qRG38LlAdoCKwaB0PgCb6w9AGKw4+f40F2938MCaBfSY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 16:48:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:48:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 3/3] job: drop force argument of *job*cancel
Date: Tue, 27 Jul 2021 19:47:54 +0300
Message-Id: <20210727164754.62895-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210727164754.62895-1-vsementsov@virtuozzo.com>
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0501CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0024.eurprd05.prod.outlook.com (2603:10a6:3:1a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 16:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1514956b-11e8-4b09-8f55-08d9511e52d2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB18418799D24847D74F98929FC1E99@AM5PR0801MB1841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDNXlvgoYb0pYSndSnfypxQOJt1gXJbtGetP5T7t4vyvXGnfRZt7E0tFeRmJRGqETwZhucq9aq8QE2bC3tomz4Wy4/SNHaIE2DUoMPlbrq4FjRHo6Jwneaf4d+0TzTmRxDtNPSVYdTXMpVV/NQ+HKG22GMIjIQDfKv2+g7/F/2xJ3xEdXET0kJFneuZ7HlTwB8fYJxF4vyiuJeZcXZz5QTsgc6ELJO6QfLQ88QJSeg+nAHMgD2EBb1qNA+/dxWLFOW06G3TqyCnkifdEjV7AKya1ltMAAW5gnfWqK12wJKAqRmf/EaIFKzBvTHyCAvR8On0OB9cJ9duH37GoyhA/1NABu/URwRW8JOciLvbMFq9bThLU2ua2LssvTYKnhSWXB/cPV7LMKKSy90Fj0rvJ1k+wzyEgsGS/q2KqEjDoBqwS8MwyWmNcaA2k+Qf3V9M/GTep//YM21O05pVqZAZFbk4XfbXK/Y5xC982ro5dP2pRb21xqnkiO67PM6t3CMNiCBUEn9PgpokGrXkd0rILbEfx2Rpir3pGPPHKjySBZMYPgv2PLDI2WqCQAZso0NzuynPnTKVQVQtyhCuWWLShPwsAE4WLcmMGDHYyVDBOi5g52WxFEYKKTlANCRwiFMul27W3HBmnoy8JaF1oB3NTCrxm+QYjSGBFA3YX/uenCgxCSkr5r4Gefmj3eaXczPDwx2Yl3XlJpiThlJnj4AZKpVOTEjidY+ocawiYpkt2JN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39830400003)(376002)(2616005)(186003)(8936002)(6512007)(5660300002)(36756003)(4326008)(38100700002)(478600001)(52116002)(6506007)(2906002)(83380400001)(6916009)(86362001)(6666004)(316002)(6486002)(66946007)(8676002)(26005)(38350700002)(956004)(1076003)(66476007)(66556008)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IZK7udLewjy/kORw/WW6tDJztGd09qd5s11W64Q4328n/iTlEURQRWd5Ye5o?=
 =?us-ascii?Q?61btUqDep9m8yNAUyc7H92QBKq71OGxLdKDB2Ddg1PNKLMN1PKi6/pJVorz1?=
 =?us-ascii?Q?7l9+DXpWU9/sXTvUtKV8uTb8M3UlypveIM3n+XqsVkVzTh40GwbADwBc2Wqy?=
 =?us-ascii?Q?5cbysyqb+3KTDYSSUHj3TaslIJDFx442on5Q8wS8D3wW5/0tBFWCvmdA1f5U?=
 =?us-ascii?Q?BHG2wCLnZcOtJj+NEqm3OE41ws0R0plEV2DJg/pOKAMiyJMx5NYu5EQDRjIY?=
 =?us-ascii?Q?5Ek0pyKnpEmvDiDEAP2LYUnnnMNZ9itFNa8TNE8Z6IhEDiDp4lS3RvNXEKcf?=
 =?us-ascii?Q?0yoewfIOasXm4JGpkaARpZFoerh4QckJx/TgPJzo+QQrQPYDCurS2biaaKIF?=
 =?us-ascii?Q?PiPFkxkLCx5004Dvsv4l1p+7so7yUjalw6BPgHHN0DkU6jNoL306KVqONzX9?=
 =?us-ascii?Q?orLuljrD1Dy7g1rwUGID6y6gD+sLeKdMSfmO/fUvHyOOev+ApkZTzuNahZ+a?=
 =?us-ascii?Q?r/sjUIGdJgaBxfqLFCptEZMA9hQkQ8GpsmKgSV5CJE6OjLpqcnRihYOas1eU?=
 =?us-ascii?Q?RkXsUJnNj0q0XABvKExdADDP1H9eBcQz2946FHKX55ag0mLZmzBKG2ejs/YE?=
 =?us-ascii?Q?kVBFHKl+UVLaa20dlZBmq/eanjLZtEBq6uA6eAxb7vwQrmOXlMgN/4X7/hKE?=
 =?us-ascii?Q?NhUeSVXciBuERY1wVyh9CK4IzbrZaabXiWD/T0wyxojxdVuK6lO1hwjg1suM?=
 =?us-ascii?Q?BJJyLglk19vBTdokx1ascymwo7xdWk/BImQvshYZ3Qtq9FhtKjNvqiWCYCZf?=
 =?us-ascii?Q?Lt9t8wPDLxK2/EY6HvkQBN9khIO8icqdA+PEdIR+Pg/3XWhWZhSbGV16Lduy?=
 =?us-ascii?Q?xUq+dX7GnxIE3Q+9iMCHLapZupN+73cobWRq8YTIW12+jN1HCyN9P5rhnztl?=
 =?us-ascii?Q?qbG9QU3c9ePTyUDIrkugB9qWuQ3wtIQTfVXM/UYnlhjvSlCJ2A0JrDJQXnnU?=
 =?us-ascii?Q?g1lhHJXl+xJTcHrJrP0UWlcMWtWO/XBq+xtUaIrnQYQFzJVXwhuLz/mwV14v?=
 =?us-ascii?Q?OnyzTkSS4MdA8jHC3UJsFWD3vmDYpo8Ar9Nw+Ig0J1Ar7kOpBguMzrG00Ypp?=
 =?us-ascii?Q?Mw5vduR8Q+s1ASF47XASrTKJIx9cco5lqR6wgacGh2A72tUdzt7KErkXVtoT?=
 =?us-ascii?Q?HvrxXqHkUoy5AI9amX8DUHes2a51ITMIYM/9TAHA2GMs+FVSBddnC63KhXGB?=
 =?us-ascii?Q?iHShTfHrVV8xwEki9W9TLe6YNnD1MVewytxNEBM928EDlldzQNWVDgi1Vsxt?=
 =?us-ascii?Q?KSQVy8Jeh5mB+ohl3GpEtpty?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1514956b-11e8-4b09-8f55-08d9511e52d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:48:13.2056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5XQ0SzvbhsgJIdTPDX8Vcfd2dUVgWw/9OxMSvxK9uBiTg8U7vhvbDpqS2qGFGUE8phAgRBZHv3EpehjbYv/nLrI6Tq1gnxCpMq7TmzV0uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1841
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Now, when soft-cancelling READY mirror handled in
qmp_block_job_cancel(), no other functions need to care of it:
cancel is always force.

So drop unused code paths.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h             | 14 ++++----------
 block/backup.c                 |  2 +-
 block/mirror.c                 | 13 ++++---------
 blockdev.c                     |  4 ++--
 job-qmp.c                      |  2 +-
 job.c                          | 18 ++++++++----------
 tests/unit/test-blockjob-txn.c |  8 ++++----
 7 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 3dfb79cee6..0e30665fed 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -103,12 +103,6 @@ typedef struct Job {
      */
     bool cancelled;
 
-    /**
-     * Set to true if the job should abort immediately without waiting
-     * for data to be in sync.
-     */
-    bool force_cancel;
-
     /** Set to true when the job has deferred work to the main loop. */
     bool deferred_to_main_loop;
 
@@ -254,7 +248,7 @@ struct JobDriver {
     /**
      * If the callback is not NULL, it will be invoked in job_cancel_async
      */
-    void (*cancel)(Job *job, bool force);
+    void (*cancel)(Job *job);
 
 
     /** Called when the job is freed */
@@ -496,16 +490,16 @@ void job_complete(Job *job, Error **errp);
 void job_complete_ex(Job *job, bool do_graph_change, Error **errp);
 
 /**
- * Asynchronously cancel the specified @job. If @force is true, the job should
+ * Asynchronously cancel the specified @job.
  * be cancelled immediately without waiting for a consistent state.
  */
-void job_cancel(Job *job, bool force);
+void job_cancel(Job *job);
 
 /**
  * Cancels the specified job like job_cancel(), but may refuse to do so if the
  * operation isn't meaningful in the current state of the job.
  */
-void job_user_cancel(Job *job, bool force, Error **errp);
+void job_user_cancel(Job *job, Error **errp);
 
 /**
  * Synchronously cancel the @job.  The completion callback is called
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..6cf2f974aa 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -331,7 +331,7 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
-static void backup_cancel(Job *job, bool force)
+static void backup_cancel(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
 
diff --git a/block/mirror.c b/block/mirror.c
index ad9736eb5e..06a07baf46 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1095,9 +1095,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         }
         trace_mirror_before_sleep(s, cnt, s->synced, delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job) &&
-            (!s->synced || s->common.job.force_cancel))
-        {
+        if (job_is_cancelled(&s->common.job)) {
             break;
         }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
@@ -1109,8 +1107,7 @@ immediate_exit:
          * or it was cancelled prematurely so that we do not guarantee that
          * the target is a copy of the source.
          */
-        assert(ret < 0 || ((s->common.job.force_cancel || !s->synced) &&
-               job_is_cancelled(&s->common.job)));
+        assert(ret < 0 || job_is_cancelled(&s->common.job));
         assert(need_drain);
         mirror_wait_for_all_io(s);
     }
@@ -1197,14 +1194,12 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_cancel(Job *job, bool force)
+static void mirror_cancel(Job *job)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target = blk_bs(s->target);
 
-    if (force || !job_is_ready(job)) {
-        bdrv_cancel_in_flight(target);
-    }
+    bdrv_cancel_in_flight(target);
 }
 
 static const BlockJobDriver mirror_job_driver = {
diff --git a/blockdev.c b/blockdev.c
index c4ee5f02f4..cc424a451f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -150,7 +150,7 @@ void blockdev_mark_auto_del(BlockBackend *blk)
             AioContext *aio_context = job->job.aio_context;
             aio_context_acquire(aio_context);
 
-            job_cancel(&job->job, false);
+            job_cancel(&job->job);
 
             aio_context_release(aio_context);
         }
@@ -3374,7 +3374,7 @@ void qmp_block_job_cancel(const char *device,
          */
         job_complete_ex(&job->job, false, errp);
     } else {
-        job_user_cancel(&job->job, force, errp);
+        job_user_cancel(&job->job, errp);
     }
 out:
     aio_context_release(aio_context);
diff --git a/job-qmp.c b/job-qmp.c
index 829a28aa70..272837bd1f 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -58,7 +58,7 @@ void qmp_job_cancel(const char *id, Error **errp)
     }
 
     trace_qmp_job_cancel(job);
-    job_user_cancel(job, true, errp);
+    job_user_cancel(job, errp);
     aio_context_release(aio_context);
 }
 
diff --git a/job.c b/job.c
index 52127dd6bd..04437ce438 100644
--- a/job.c
+++ b/job.c
@@ -716,10 +716,10 @@ static int job_finalize_single(Job *job)
     return 0;
 }
 
-static void job_cancel_async(Job *job, bool force)
+static void job_cancel_async(Job *job)
 {
     if (job->driver->cancel) {
-        job->driver->cancel(job, force);
+        job->driver->cancel(job);
     }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
@@ -731,8 +731,6 @@ static void job_cancel_async(Job *job, bool force)
         job->pause_count--;
     }
     job->cancelled = true;
-    /* To prevent 'force == false' overriding a previous 'force == true' */
-    job->force_cancel |= force;
 }
 
 static void job_completed_txn_abort(Job *job)
@@ -763,7 +761,7 @@ static void job_completed_txn_abort(Job *job)
         if (other_job != job) {
             ctx = other_job->aio_context;
             aio_context_acquire(ctx);
-            job_cancel_async(other_job, false);
+            job_cancel_async(other_job);
             aio_context_release(ctx);
         }
     }
@@ -932,13 +930,13 @@ void job_start(Job *job)
     aio_co_enter(job->aio_context, job->co);
 }
 
-void job_cancel(Job *job, bool force)
+void job_cancel(Job *job)
 {
     if (job->status == JOB_STATUS_CONCLUDED) {
         job_do_dismiss(job);
         return;
     }
-    job_cancel_async(job, force);
+    job_cancel_async(job);
     if (!job_started(job)) {
         job_completed(job);
     } else if (job->deferred_to_main_loop) {
@@ -948,12 +946,12 @@ void job_cancel(Job *job, bool force)
     }
 }
 
-void job_user_cancel(Job *job, bool force, Error **errp)
+void job_user_cancel(Job *job, Error **errp)
 {
     if (job_apply_verb(job, JOB_VERB_CANCEL, errp)) {
         return;
     }
-    job_cancel(job, force);
+    job_cancel(job);
 }
 
 /* A wrapper around job_cancel() taking an Error ** parameter so it may be
@@ -961,7 +959,7 @@ void job_user_cancel(Job *job, bool force, Error **errp)
  * pointer casts there. */
 static void job_cancel_err(Job *job, Error **errp)
 {
-    job_cancel(job, false);
+    job_cancel(job);
 }
 
 int job_cancel_sync(Job *job)
diff --git a/tests/unit/test-blockjob-txn.c b/tests/unit/test-blockjob-txn.c
index 8bd13b9949..5a995c59c7 100644
--- a/tests/unit/test-blockjob-txn.c
+++ b/tests/unit/test-blockjob-txn.c
@@ -125,7 +125,7 @@ static void test_single_job(int expected)
     job_start(&job->job);
 
     if (expected == -ECANCELED) {
-        job_cancel(&job->job, false);
+        job_cancel(&job->job);
     }
 
     while (result == -EINPROGRESS) {
@@ -171,10 +171,10 @@ static void test_pair_jobs(int expected1, int expected2)
     job_txn_unref(txn);
 
     if (expected1 == -ECANCELED) {
-        job_cancel(&job1->job, false);
+        job_cancel(&job1->job);
     }
     if (expected2 == -ECANCELED) {
-        job_cancel(&job2->job, false);
+        job_cancel(&job2->job);
     }
 
     while (result1 == -EINPROGRESS || result2 == -EINPROGRESS) {
@@ -227,7 +227,7 @@ static void test_pair_jobs_fail_cancel_race(void)
     job_start(&job1->job);
     job_start(&job2->job);
 
-    job_cancel(&job1->job, false);
+    job_cancel(&job1->job);
 
     /* Now make job2 finish before the main loop kicks jobs.  This simulates
      * the race between a pending kick and another job completing.
-- 
2.29.2


