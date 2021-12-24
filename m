Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9247EFE2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:44:47 +0100 (CET)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mkQ-0006x7-3m
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcM-0005uJ-19; Fri, 24 Dec 2021 10:36:26 -0500
Received: from [2a01:111:f400:fe07::712] (port=55270
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcK-0000YV-55; Fri, 24 Dec 2021 10:36:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIokFDXTb7VzqbAdrLKDSFJNrE86WfnRZZaXT1JSFO/6gXNpTKWNqi+Wj+YpNKMtNGgDZOgGWWseFnjDFwke8542WUU83qIojgcmtTDSd+1EsZcid0Ay8J8vmwzSiXAuRfhWZ2EUX+KW6e2BocqeL8YwBzlqKFB2zgf/D9wvZYc8qpUR5DAjd6GIscWSoCv6WrEJ/C0qjKBf3kzKmMVF6X6yICTtMSFoZhu0Kpoo3gdwEv5gph+rVr6C18v5JwsQ9YrFVbAAr5TBkf+4Mgsyncal4UzHRkSYSJgN7IxTSf1yUdG6BIsG82eWLowMdqu77vr+yZefPZbqMoJZ9KMpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D85/jZ/aN1MPawxs3SdddkYdMY3MUdWHqyN6OmJNi4w=;
 b=n+Q2bTVc9VF1e0FZtgiuSMPIZEQULPx9xuUoTRCEzde+MEBlYQGzjXxE4GCv49a07fpWuS45wfU+AUZ8O8RQE84VcBH01FGR817oP3lI06cTuQ6Yx06gCb/ABry/RUjbGg9SIRFJGXm3rhTJlbAWlpD+GWr4RO0eKlCbuGLXg3hM9LedvIBikBBisaJr+JS8l8u9yJOVUvBD/XhKsSov4GwZblGFXaGdMhccRihFgjxm2JNStU2nMbN0zvXt1/gLtNleipft71gA2wY7oEeBDtUk/HHqoGhVwRC1xaQe3akEOkWWyfjf/4BVuZhCoxElLH/IDKKMNdWCWghgQHdz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D85/jZ/aN1MPawxs3SdddkYdMY3MUdWHqyN6OmJNi4w=;
 b=aLCU7Z4MVHtL5w2CumQHQVHcm6L+AtCrMKLB4fdMVYJ7v4bCYPSaVmthWn0E6NRiUOQeiiLqYJDANmP2uB2VbTOyIRhtBdGxwQrvOICzw5ETe8Uvk+FtSxzT3herUxSWqaorRV7OnCz36j7vfbKnAPZLJ7/Rxuqmt/QATpJxLpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3955.eurprd08.prod.outlook.com (2603:10a6:208:12d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 15:36:18 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 5/5] blockjob: drop BlockJob.blk field
Date: Fri, 24 Dec 2021 16:35:52 +0100
Message-Id: <20211224153552.2086061-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
References: <20211224153552.2086061-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::28) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 556b332b-1943-46b5-305b-08d9c6f320bb
X-MS-TrafficTypeDiagnostic: AM0PR08MB3955:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3955B56945BFE6856C464B05C17F9@AM0PR08MB3955.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3nf4L9VIsCsWvVngJm2mkfBq2SmonLNvS7ZCOmWOtL7JPmc6u54spdNq7UwwG1C/vV+/wk+Au3RsPu107z3pG81KwbhJwk1OFfXMnVmOlkRx3G/2aVf4N9OmKQQV0l0UyCzikRW0bd/EkmyLt4yXT9sMnmE52K5Y4N3NAIAhINqu9CUYNw2hIKishjddDvTTMQ/grFcbcAt4k6L+3a0uBNLwBmn0vKq/oi6OJE3l8RWlJ6BQ1GkFp7eJ17np3cG9Yorysx8BC13AsXCTpWUB0Z+tbpXMcRU/3m/Y5uLw7PaZ8cPk/gTNkoDFr6gme5qMZTdFL6zZJ5+X/qs8cCqvHHJkARNxUbixRJWFJOW3XmOc7uwB1BC4k97Hb7z0jvuZ0iPY6sJL8pCsWnxvmB4BjxSHh4FRPPB29dX0+z/n8VxmBFhXKLCyldLPYTik0OYHaMtTZG6gkhA6eiTJK8pbg+ZLz3QIoJcUcDoB3J93ZohTgjitM2M+TPwDWR+gmr4z+VozEwgAbUXDf/Sy45uLLs4JyF7hr/Am3gtEVFvm/RPk1w1GMftfx4DUWPPizU7QVhQpZw6Ih7IXb9hslkOT+b8CntdtoAyZlqjhNxFihVi1xQ4LHT6k8QYcmbW33TpH5qqSGlKECgl9hruL98s2Ibr8XxfHA45/cYBEySOM7ZVYePomlY6m+mGX3msOKDrs0FGWJ55ErwUKoymeuHEHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(508600001)(86362001)(2906002)(107886003)(66476007)(26005)(186003)(6506007)(66556008)(2616005)(38350700002)(38100700002)(83380400001)(66946007)(36756003)(6512007)(52116002)(316002)(8676002)(1076003)(6916009)(6486002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKtaKhEzzJ3rsODlQQg/xIRKA7vcp0P/C9HQbyhjneaxGu6wiYlr40T7846x?=
 =?us-ascii?Q?LIwS/XrqwNgURd+eARqMXYzr4RF2ofvtGI2U95sFwmA3gFTMIg/LjqHAiuXD?=
 =?us-ascii?Q?MIYpCjLqSUW/dOZt40zcPCGllHl84/uB0/e/hR/9Yu9NODNwVIs/sIP0PNE0?=
 =?us-ascii?Q?Go37BGdv/pOz9ZW2rOGwg4lsfEQoOFlacaguSZTfJ5P0GodDbHui+VnvXbiX?=
 =?us-ascii?Q?UR9NC7e57vQ96p+7lWUl5bi78+kG2NnEpTHqUl4JItu8aHaKfpNU1qeMdkre?=
 =?us-ascii?Q?jKS3ZPCIsg5JNuNlyl0o36vsU9yeRF39H4O5Z/sS5TGxvrZ1HqpJ49dR0ClZ?=
 =?us-ascii?Q?pQH42RSg94g0fOA6vGdMwmnDGRwb/1e8RIaDyLxRfzeA8YJzeYLZmqyBgmAO?=
 =?us-ascii?Q?F8/XATWHnGFLsCdRdUvd7zchQrn5D+QCctwUTM+HD+WZfADYvdRARWs5SJnB?=
 =?us-ascii?Q?ft0hwX3LZ/HKVJ5JDy2VbueFf0MhIjnOakhvCLgYK4HPZCXy+g5vAfQalv84?=
 =?us-ascii?Q?19BZXFrFbixKiDGLvgiEiWZhKYHRu8hEbXBMpEuPAUXgf4lCX6PgElAE0e7o?=
 =?us-ascii?Q?8e8cBbqGt+Xla0X4k2Li6JmwLgrNOrWiOoNA9FkhKnr64VBdTlDYkUakc+KA?=
 =?us-ascii?Q?f3fy5u4Gsz0wuIXVSNHL+Qi69Stfj/hntEvynWvpVpvfGhaVnr094wbneIbh?=
 =?us-ascii?Q?LK/TUF/kzsaCFPR3vYQwawnGizkZjsJ2RH+fsDgKC9UvOMmDVVIlLNQzRWpf?=
 =?us-ascii?Q?1T572i4mNG64iGEdS3gq7hBcrp378WD4+JXTS4dUf83p9jgEWF8F3S1fZWFy?=
 =?us-ascii?Q?Gieguk0FkVODmZVPxfKkQuJj9X8T5QnSCC0+KKqzmXZwveg3rCbU0EjBdYYf?=
 =?us-ascii?Q?Hxxi2Ae07FUizfJE1ysdT8Ur7X/66vSPJI3gqTbvv6dbzUeEaZCq/qItX0o+?=
 =?us-ascii?Q?yX53HD6n4biIZmUnnzLlQW+VjUFliD/m+qfKqHORRTeYGsFP99qZIIjFXNfV?=
 =?us-ascii?Q?ALT6TK/tJJt/U5k+Tzna5n0dvRYaq+lZlkDa9Wz+O9p0oYecy7d25RnVqnHg?=
 =?us-ascii?Q?HQ5/gGXHMlFuqwxkpqClxcsTD+5hqFN+DAI/bv8FbSVThIqkH6KJOVD5EehQ?=
 =?us-ascii?Q?FpR6f+gDLQnWwhZjMYoWJ8drGIagUbs5IN369viigm74Q6g06cNbVpqucXH5?=
 =?us-ascii?Q?1J0X9uzWkCCy6/I3WjWyeZR8Bf6EtcJ5PH0+YUJdkwlqvkcnnriz7t9IgiqV?=
 =?us-ascii?Q?F2jwOVgsQP2TS00dZ311tZp2gFE19/K9OqN/RO+ly2mwPl1T7X2pmH+qoNuH?=
 =?us-ascii?Q?EQjfCb16hmo3Zng+g6S+1WeLSqxbWdCUhHHobtvgdxS8RwtqsaBRQyD0agCW?=
 =?us-ascii?Q?4RjnITbyLtFSWgHC9cIAWrHM+vxLC13hnBH2qBhdYQMf56XaCrBzdBoC1Vjm?=
 =?us-ascii?Q?IBM9YTlgqW6ih82weqjfjfC3bHE4Iqa+wN3+Nul0Hg7TiH3UYW58J/eRohiI?=
 =?us-ascii?Q?ZBmxhCsnlm0X/u5TmY7JBk1SXZwiO8AKKOSilWzQP0fihyf7pfgpD0zUbJjU?=
 =?us-ascii?Q?62LSG8cxKuzCbOEOFdGofBAnZLqUobycX6tpn95kF2vnUfWYdbS/aHLa2Qvu?=
 =?us-ascii?Q?y3NsDTELbWSZ/cB7j3Ya93QfikNKkWChwdu8c/huhgdYSSlTbsEbTrBM0uz3?=
 =?us-ascii?Q?LQXvI5H+dp1M5pCebkmqmbBMhmI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556b332b-1943-46b5-305b-08d9c6f320bb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:17.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMh8zcIDNniONHQ3QfgRzV/Gr1UqV+9UwcRZT6D17qy5Fi8zkjPNh08PPN9wGS0ugM99AjVkTjNpNgnBfQn3A2ri+H12LG7M8mWyusAHZ/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3955
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::712
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::712;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

It's unused now (except for permission handling)[*]. The only reasonable
user of it was block-stream job, recently updated to use own blk. And
other block jobs prefer to use own source node related objects.

So, the arguments of dropping the field are:

 - block jobs prefer not to use it
 - block jobs usually has more then one node to operate on, and better
   to operate symmetrically (for example has both source and target
   blk's in specific block-job state structure)

*: BlockJob.blk is used to keep some permissions. We simply move
permissions to block-job child created in block_job_create() together
with blk.

In mirror, we just should not care anymore about restoring state of
blk. Most probably this code could be dropped long ago, after dropping
bs->job pointer. Now it finally goes away together with BlockJob.blk
itself.

iotest 141 output is updated, as "bdrv_has_blk(bs)" check in
qmp_blockdev_del() doesn't fail (we don't have blk now). Still, new
error message looks even better.

In iotest 283 we need to add a job id, otherwise "Invalid job ID"
happens now earlier than permission check (as permissions moved from
blk to block-job node).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob.h   |  3 ---
 block/mirror.c             |  7 -------
 blockjob.c                 | 31 ++++++++++++-------------------
 tests/qemu-iotests/141.out |  2 +-
 tests/qemu-iotests/283     |  3 ++-
 tests/qemu-iotests/283.out |  2 +-
 6 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 3b84805140..87fbb3985f 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -43,9 +43,6 @@ typedef struct BlockJob {
     /** Data belonging to the generic Job infrastructure */
     Job job;
 
-    /** The block device on which the job is operating.  */
-    BlockBackend *blk;
-
     /** Status that is published by the query-block-jobs QMP API */
     BlockDeviceIoStatus iostatus;
 
diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..959e3dfbd6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -771,13 +771,6 @@ static int mirror_exit_common(Job *job)
     block_job_remove_all_bdrv(bjob);
     bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
 
-    /* We just changed the BDS the job BB refers to (with either or both of the
-     * bdrv_replace_node() calls), so switch the BB back so the cleanup does
-     * the right thing. We don't need any permissions any more now. */
-    blk_remove_bs(bjob->blk);
-    blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-    blk_insert_bs(bjob->blk, mirror_top_bs, &error_abort);
-
     bs_opaque->job = NULL;
 
     bdrv_drained_end(src);
diff --git a/blockjob.c b/blockjob.c
index 70bc3105a6..10815a89fe 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -86,7 +86,6 @@ void block_job_free(Job *job)
     BlockJob *bjob = container_of(job, BlockJob, job);
 
     block_job_remove_all_bdrv(bjob);
-    blk_unref(bjob->blk);
     ratelimit_destroy(&bjob->limit);
     error_free(bjob->blocker);
 }
@@ -433,22 +432,16 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        uint64_t shared_perm, int64_t speed, int flags,
                        BlockCompletionFunc *cb, void *opaque, Error **errp)
 {
-    BlockBackend *blk;
     BlockJob *job;
+    int ret;
 
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
     }
 
-    blk = blk_new_with_bs(bs, perm, shared_perm, errp);
-    if (!blk) {
-        return NULL;
-    }
-
-    job = job_create(job_id, &driver->job_driver, txn, blk_get_aio_context(blk),
+    job = job_create(job_id, &driver->job_driver, txn, bdrv_get_aio_context(bs),
                      flags, cb, opaque, errp);
     if (job == NULL) {
-        blk_unref(blk);
         return NULL;
     }
 
@@ -458,8 +451,6 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     ratelimit_init(&job->limit);
 
-    job->blk = blk;
-
     job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
     job->finalize_completed_notifier.notify = block_job_event_completed;
     job->pending_notifier.notify = block_job_event_pending;
@@ -476,21 +467,23 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
-    block_job_add_bdrv(job, "main node", bs, 0, BLK_PERM_ALL, &error_abort);
+
+    ret = block_job_add_bdrv(job, "main node", bs, perm, shared_perm, errp);
+    if (ret < 0) {
+        goto fail;
+    }
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    /* Disable request queuing in the BlockBackend to avoid deadlocks on drain:
-     * The job reports that it's busy until it reaches a pause point. */
-    blk_set_disable_request_queuing(blk, true);
-    blk_set_allow_aio_context_change(blk, true);
-
     if (!block_job_set_speed(job, speed, errp)) {
-        job_early_fail(&job->job);
-        return NULL;
+        goto fail;
     }
 
     return job;
+
+fail:
+    job_early_fail(&job->job);
+    return NULL;
 }
 
 void block_job_iostatus_reset(BlockJob *job)
diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
index c4c15fb275..63203d9944 100644
--- a/tests/qemu-iotests/141.out
+++ b/tests/qemu-iotests/141.out
@@ -132,7 +132,7 @@ wrote 1048576/1048576 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {'execute': 'blockdev-del',
           'arguments': {'node-name': 'drv0'}}
-{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
+{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: commit"}}
 {'execute': 'block-job-cancel',
           'arguments': {'device': 'job0'}}
 {"return": {}}
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index a09e0183ae..5defe48e97 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -93,7 +93,8 @@ vm.qmp_log('blockdev-add', **{
     'take-child-perms': ['write']
 })
 
-vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
+vm.qmp_log('blockdev-backup', sync='full', device='source', target='target',
+           job_id="backup0")
 
 vm.shutdown()
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 5bb75952ef..5e4f456db5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -4,7 +4,7 @@
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
-{"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
+{"execute": "blockdev-backup", "arguments": {"device": "source", "job-id": "backup0", "sync": "full", "target": "target"}}
 {"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
-- 
2.31.1


