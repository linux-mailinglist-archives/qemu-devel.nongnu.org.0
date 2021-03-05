Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4232F240
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:18:48 +0100 (CET)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF2F-0002GD-5K
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMT-0004fH-8W; Fri, 05 Mar 2021 12:35:37 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMO-0005C4-Tp; Fri, 05 Mar 2021 12:35:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZc6ol6sz7Y8aVr9vxfyl4/CqdWeTaufRrncjSdzoeUzlWCO1M2+MMxqBhZcnZ7Pp4JDaQ9eVunySGBgMBfqwXqm7pugS/x+W5Z6QOoZ3027E+jd7uC3UyTGgot9uXep+BotAWjKl0sX/gNgTy/kiuZ2v2JdF50/cqHpbX8u2p6zw2AQQO2rXdA3gOhYHZBSmVSmMxVUq2cWRTehxICv4cjJN6z1eeAsJsjYKL4PWx5n5TYqTg2Q6RRmkWgvrFB9Pne6dDxAfYl8YBmJ72DfWCEW0dC1iRZqbLLTZQxIEjWqmoKImaiyVuqxqGgQoMQMLpU+4fALcGpS+7mS9cJWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CdTBvjQtHCu8YdqT4pSi7KK3mGuUddtjwrGa38khIM=;
 b=Ghszr4PK/+BcQOmL0v3pkIGu6W4vto4l+vKldRt7V9izax6CjatX7j6aOwOjUgamBBdsu5jZHHWA8UzI3qP7ZhLKQ5b9jLnzZpdzKlVNI3Wrr/Ya9yD36JE/mhzxeK3jtUdghjnfO6qy3uwFuJLMewleBlvhM4eddmRieNS7FdE2aZgJy71EHdAewZw0w0P3EDVQMY8jBCQmjwFieb9hDGGZDISTgNi62PWZOupqblEW1R/1GJ96Ai3H+77VyYgckFGAJb57QwcVajs5f4K7U9Xjs2P8fnDyWUIEcYY+vNFSkRHyzHBG60o2wRFbE+daJ7ouKtfMDJTOMzo1hXVp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CdTBvjQtHCu8YdqT4pSi7KK3mGuUddtjwrGa38khIM=;
 b=fgdHrzau3UQ7ayesEyu2c5AwvXH7rhK59NCUaNJJj81eszRk4/GLEriWHBKYtcOo3FgPLUWI2ZPDrjlm24w7ScMXVHyJg4HQolkHs2rwop3c1NyerK3SuX52cUzbQZqN5EPU9DNQDpvEkufqqlQOILjYQeZM+DctbCFIvW2uqeM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 1/6] block-jobs: flush target at the end of .run()
Date: Fri,  5 Mar 2021 20:35:02 +0300
Message-Id: <20210305173507.393137-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f3e3e65-23aa-4d20-bfc2-08d8dffd0f17
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB440835FBC73071F92E41DF9CC1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AlgZqjWXujqEXbDvJDgWLMloJuqux/rPz0dm+5PPxaa7zV+I8sPpxX7wsJQbWLD96K03/QBMWlTaUSDOWYy3+EPQqq1yucaWM9GKAxISf6PFLJ5H2y6z3bs1e8UC4MCzXU6sVdOGm9r+t2Kh16lOsTdZrEz+Jmx5vhZkbRzUucf2Ns5wj4yj+I1LVe6M2+uR3FKNq8yTxXdYi76SEW4vpq8AzEki7saLNMfhQCyfxUfztLJ6bSK2RrTIqyeBJp5MuU7tLC0COieR3HKUwM7q+en6GQ1JvY2uQ/ePXrAqRBPxf5I2W32277qjVoSxOBE5kJ4qgUHxnWOglDfV8zQreRy8JMymnXwR7qXCPNWGnVr6cXADdq7CUApXLYeke8wm59s6DNNXtEDS04wAERT0eoHv4ojaZp39seXtM/Yh2XN2008xkv3Y2hkBSA6UHXmd4hiGCf7vyYprBqlH1VYZKKMtCKqks09gN12TeL6Iiqlt3x5dO3a74XgXEzsdYD8Ix1jieHSEEAsn5KGGcfevqmeFXOaoBUC+sTKsJ0tgwELI4LgVzAT+OZLReB78sGT0/ezTSB/Xir+soWReVEz8S4v3PJZQ+cA/W9mGLd3hhrw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(86362001)(5660300002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UVkSQvnhNiE8lw8kA4GjBCV7TaMcg/Ni54rtitolVrddUG5IwdOS/7OqQZAU?=
 =?us-ascii?Q?CDg+2oetAyokjDEmFnKB2uXqn9tfzo4jP7JHhsdq7n2gxyTURBxcJtdJoooU?=
 =?us-ascii?Q?cmGCUTt/DiG6DuoJuekADNbKpDgAdlek/BvSh4+Ha4iS9vsF58fJa5dl3wzB?=
 =?us-ascii?Q?dLS7vsX9y20GDU2QcAgzZ7G5DuzYips49PTlxr8a3MfKdW5g6g2xZByS6el6?=
 =?us-ascii?Q?LUtjMgsOg19b3G0m/l79G8MAE6qsgBpPIEC2m5FzJtJnKMGDkhvJ3Dk5jwcS?=
 =?us-ascii?Q?3G/WDx+iLL9cVSGXF7qbK2FX5gF4LS/S85sCp2AbiDtefD/uYrOOHZVS6JJr?=
 =?us-ascii?Q?7aOgeHG0MQemPmdYnWQC9YdDxPb7mteI9qY7CVs2ZDEk+RFuKb5tZuThBkEH?=
 =?us-ascii?Q?qulmrIGXGYVzKl8YlZKv4QOCf1aC1IniOgKRrpVClFs7FvfeYMtKTUR0OoY6?=
 =?us-ascii?Q?lbdAQllKWRzZ0LiHq4Uc79bRvx1McFitNRqzx7i95ojkQTiBLJeZsm35q+Ou?=
 =?us-ascii?Q?cVWvCeRDsyJnuzuyRnLgarBrrn9Lb46FbCk+Qu1Kul+5QUQU2YcQhH75IWKR?=
 =?us-ascii?Q?sJCUDSOmGkpg7UtadV+N+9BFdt0Lq1Mov1zp6qbkzRVZoPHc08KCNvwKQVKh?=
 =?us-ascii?Q?nZShkqDhYg9h08f5AO7GLOY57RQShmlEbkTfJyF3mjHIxGEacveHFpkM3oT1?=
 =?us-ascii?Q?I8MFZyzMLDxno3/f9xDI3noHYg8/fmjdP7VSnh7aCPCDcBgsWZtOmqbaPNkd?=
 =?us-ascii?Q?sK4pnCemna95Ry2EB6RSx30mZhZYzwoM8Ox26B/ipq+bqKKo4uq+coiYzghQ?=
 =?us-ascii?Q?Sryok4KqTg4ocDUaeJAoWEU/Too+qUA4hYxu4gaMMMNNvOnzYwnpXd/wZU4D?=
 =?us-ascii?Q?4pcTH+wVlFJdlmdwdhQbAwl70vGAcfNSge9f5FchWCIdOfcCRGCOBNceIzOp?=
 =?us-ascii?Q?YfGvlWyqgOkDGNwTVQMtCKgekONar6F0GeBMyTQ31hpp0cx+efu0gzNHuZTE?=
 =?us-ascii?Q?00bvp2vHvdOcd78Xj6POG3YPYGWDqJorE5zJoQRVhsqGtuwdlWEeoKFFdYzH?=
 =?us-ascii?Q?k/HaUAgodGikUyOXMkzLpaAc90xSFrLXUhdjreklwrrnIw9eX+USsm7haAl0?=
 =?us-ascii?Q?0QCxWS1fJElQU9b7WLzW2meMPECiCLzJW1H7s18P4h2mcEhMgUyiWeXpsPdN?=
 =?us-ascii?Q?ez9ZovGAeJrtJbeaYwt+DoDDda+PuP2kNgwVa/2I4/DOjsW6gP3W17YoPI1T?=
 =?us-ascii?Q?xcoY1WQTit29uOcU47uJURFyhz1HMbb2obxnRYr7dJB4QtsWx2ZSGZpFnEzN?=
 =?us-ascii?Q?qqYgH0oXi5PQbK2zrLd8gclm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3e3e65-23aa-4d20-bfc2-08d8dffd0f17
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:24.7298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0TJz5ySohXcbx9kUnrvEbuYDAXhHkNfETTUqhWn6mXuSLdsGJN+WElotEdI/DLDe6isNxcV/G+tg2TEnYFmh4Wh6tNS68X1+wuoHK4tEKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

We are going to implement compressed write cache to improve performance
of compressed backup when target is opened in O_DIRECT mode. We
definitely want to flush the cache at backup finish, and if flush fails
it should be reported as block-job failure, not simply ignored in
bdrv_close(). So, teach all block-jobs to flush their targets at the
end.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob_int.h | 18 ++++++++++++++++++
 block/backup.c               |  8 +++++---
 block/commit.c               |  2 ++
 block/mirror.c               |  2 ++
 block/stream.c               |  2 ++
 blockjob.c                   | 16 ++++++++++++++++
 6 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
index 6633d83da2..6ef3123120 100644
--- a/include/block/blockjob_int.h
+++ b/include/block/blockjob_int.h
@@ -119,4 +119,22 @@ int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n);
 BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
                                         int is_read, int error);
 
+/**
+ * block_job_final_target_flush:
+ * @job: The job to signal an error for if flush failed.
+ * @target_bs: The bs to flush.
+ * @ret: Will be updated (to return code of bdrv_flush()) only if it is zero
+ *       now. This is a bit unusual interface but all callers are comfortable
+ *       with it.
+ *
+ * The function is intended to be called at the end of .run() for any data
+ * copying job.
+ *
+ * There are may be some internal caches in format layers of target,
+ * like compressed_cache in qcow2 format. So we should call flush to
+ * be sure that all data reached the destination protocol layer.
+ */
+void block_job_final_target_flush(BlockJob *job, BlockDriverState *target_bs,
+                                  int *ret);
+
 #endif
diff --git a/block/backup.c b/block/backup.c
index 94e6dcd72e..d3ba8e0f75 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -255,7 +255,7 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
 static int coroutine_fn backup_run(Job *job, Error **errp)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
-    int ret;
+    int ret = 0;
 
     backup_init_bcs_bitmap(s);
 
@@ -297,10 +297,12 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
             job_yield(job);
         }
     } else {
-        return backup_loop(s);
+        ret = backup_loop(s);
     }
 
-    return 0;
+    block_job_final_target_flush(&s->common, s->target_bs, &ret);
+
+    return ret;
 }
 
 static void coroutine_fn backup_pause(Job *job)
diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..1b61b60ccd 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -193,6 +193,8 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     ret = 0;
 
 out:
+    block_job_final_target_flush(&s->common, blk_bs(s->base), &ret);
+
     qemu_vfree(buf);
 
     return ret;
diff --git a/block/mirror.c b/block/mirror.c
index 1803c6988b..bc559bd053 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1095,6 +1095,8 @@ immediate_exit:
     g_free(s->in_flight_bitmap);
     bdrv_dirty_iter_free(s->dbi);
 
+    block_job_final_target_flush(&s->common, blk_bs(s->target), &ret);
+
     if (need_drain) {
         s->in_drain = true;
         bdrv_drained_begin(bs);
diff --git a/block/stream.c b/block/stream.c
index 1fa742b0db..cda41e4a64 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -182,6 +182,8 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
     }
 
+    block_job_final_target_flush(&s->common, s->target_bs, &error);
+
     /* Do not remove the backing file if an error was there but ignored. */
     return error;
 }
diff --git a/blockjob.c b/blockjob.c
index f2feff051d..e226bfbbfb 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -525,3 +525,19 @@ BlockErrorAction block_job_error_action(BlockJob *job, BlockdevOnError on_err,
     }
     return action;
 }
+
+void block_job_final_target_flush(BlockJob *job, BlockDriverState *target_bs,
+                                  int *ret)
+{
+    int flush_ret = bdrv_flush(target_bs);
+
+    if (flush_ret < 0 && !block_job_is_internal(job)) {
+        qapi_event_send_block_job_error(job->job.id,
+                                        IO_OPERATION_TYPE_WRITE,
+                                        BLOCK_ERROR_ACTION_REPORT);
+    }
+
+    if (*ret == 0) {
+        *ret = flush_ret;
+    }
+}
-- 
2.29.2


