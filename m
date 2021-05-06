Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7237557F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:19:16 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeqQ-0000Q5-4r
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leelo-0003Sl-D4; Thu, 06 May 2021 10:14:28 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:28385 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leell-0004JH-Ng; Thu, 06 May 2021 10:14:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB+6nxmKOHzNAiIiJ5GGfNkTXwL6yXEohC6hVDAc+j7e9dT26Q/k2NypaSm6nkyM8wFXmuvLqdZtiQim0NjriqgcJbBUana8mJbfxfjXh5JW6Os5RwUI8WHN1k/bVaZptqXMTmFYfwnShkp2zXMdna7O/LusTdv9WgDFpCNtdoqCp0H++H17oL78N6pav2NBD8YbVV/h7ezt1fX5584jj4uGoBl1k5GeTyLVihTJqK9+bxsudH9+DTTHIB/IWYy//u+8hEHRiUtN/XLe1UBQ6yHPeS0H7SquJWiUcIgz5BYBwooTJafzLYVgyJbwkpv4avsgvfZlali3O4ZCyCaWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diasP0cqw9PnY9U5w9vl4Z2pcKGOZIcgSWcqWt6aAjQ=;
 b=Sj/K0Y5XjbPtMm5iTjN7ZRiwKvfb8nhBBZyb5E2cix1t8EEZpiuwgSvlCR8yD1Gt3vNi/5As+WWjInsZQ55uyofTtvyEBh4PTGfNC0wFsmPzLo0UsCGe7QgxIddkwL94ccGK7t1BQZIRpUaStpIYu/lUiwt6G/2S9cXNCkQGqXnNGu11eVVe9O2vh01/ovjsjmr4nHloTK9rLlWHUgJ3uzOznARn0ug7U//2IUMnFh+fAOM0jcGq2VQvw/M34TOD2GoXBI9UM2klYVHr6QvIYYQHYIHCdyui7F9GNslXeWBjIXvrzQtoPZ9jlg7bmN58G/qil0HMPnaEYhGRnipxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diasP0cqw9PnY9U5w9vl4Z2pcKGOZIcgSWcqWt6aAjQ=;
 b=Vgt+zpNBIMCSOWFpU6t01Ore2sMlZPNDDS1pJHR0LKWLHvdS7FtRWQNKc3y03E75C2Yi/79VnbiQbzWK3Ol02k4aHQnqlDvDQN798eCqgqsPQWZt6RMXnT29wFeizI11ME8Z7nGNoL0yawlFbgiLaeThYTosF8nh0Qp4eaqG6e0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Thu, 6 May
 2021 14:14:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 14:14:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 5/5] blockjob: drop BlockJob.blk field
Date: Thu,  6 May 2021 17:13:57 +0300
Message-Id: <20210506141357.314257-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506141357.314257-1-vsementsov@virtuozzo.com>
References: <20210506141357.314257-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0501CA0037.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0501CA0037.eurprd05.prod.outlook.com (2603:10a6:3:1a::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 14:14:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25cc625f-2868-4b62-6a49-08d910993b33
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB630997F4FE51E0021B571110C1589@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c20SrNeH68255x8yrC/uEuR3LIoNgeinty6uhz2LCbZ5QiRH98jC30ILYHwb2aEt/l3VPrR2tjPetRBjG2dIejrNF9CVPoWjaZik/ljdPYwAA1SZwiifrXuyzNNb0JdZB72xyh7yXQQsIMooM6iYJwTJef+tYbQNRWC6+ztjJUr9WIWEmmwvgUzDuJHwNOdXDB0o1Rs6ropPoeL/7Zx4u0KsRr6LXOw+/E0rm+WyKH29Nrly3kaGU9j9US95fS+UBRpR7stVDVMIfn/kIkEFfD11+yNxby9W6+FOjb4gLxw77TaEfFzJgc8Tcpwt+ontBjm9UTNrw9mkIkfbKv5y6AmpitADFncCEE4AiSWoKCYFdnJKurQE/wk/GdZKM1wik2NCVvLbIWGFdF66J280tqans1t3YIocLz5vKvVWATyLgFAeQ+F1ERGaf7iU4rbvD/lDECjsGLmap7wDGnnyzqIVLA9Zh+SDoihX7Uk3+ZXzrK01ROxPBVNGleUvX16ao82UmySQqOu1n88IiBJHDJiVLFRNCDEseHBLQG7Y78o2yo7YCRvKFGw8PWi13E/cGQaL7hbZLYUkNFQM+OlSNMZ4oqatb2fiCWIbFgLtPaDwN4nEVqEErcbW0udoofJklO1Ne0YCw+nsIeqc5VE7GcyNQ5NsSVjqKFDmao9l3HgvTTXUr5prjOIcUV7iDEi1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(136003)(346002)(366004)(86362001)(6666004)(8936002)(66946007)(5660300002)(8676002)(83380400001)(1076003)(66556008)(6506007)(26005)(2906002)(186003)(66476007)(16526019)(478600001)(36756003)(2616005)(6486002)(316002)(6512007)(52116002)(38100700002)(38350700002)(4326008)(956004)(6916009)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0nTDoqPVzzOvR0o3dccCNZGIBKdLpcvugkxYjjH4CjK6cntNWwLMcYRhT1dX?=
 =?us-ascii?Q?wlAlajAjVTMsJj9bUXeI/V070OM7beqAY8wyDflSlD8DH3iP2O3ui7u0vLyc?=
 =?us-ascii?Q?Oy/ShJb90IShjDlWL0pKZ9Y16MZUWEKq5Yuc4WKf3PzdhD4k2kPsS+7Lxnsi?=
 =?us-ascii?Q?NIuBsW9N1O4TNAuFozvaC07B1ptJRnuCDovMRWliVvCDn3SuPV7PTbM122Mm?=
 =?us-ascii?Q?D1shoaNgniYhf61O9u2FB7gRpMOvgnPm2lJPdwtTh8VdsKp0ZNPdft/P142B?=
 =?us-ascii?Q?+adOEtuUXhdYVlNQMusk8G5dNitJgP4iDG1Y0xHz/lYgYCGQmlRdgAryF4tD?=
 =?us-ascii?Q?SLU02ADAfXqK9vUKUgwsDPcdIJOtN7AT6Ct/k8qA8ZiGByonZZzaOkOdBKrM?=
 =?us-ascii?Q?jxoiqG/XhCU15jyKclTr9Y4Br06jYQ72IzQcZph/0K5TXMZZcwcPpIzsm4ZX?=
 =?us-ascii?Q?mNd53WMe03IgELoQBbt6604K98VJKFSy0k3pc3DJ9fMaZiXu/NmQKfa2wWDP?=
 =?us-ascii?Q?xUsP/5pLTYfPZLth4Y7gnGzvMIxQpzHWcBrVyvZ6X3Czk9uAlHYhmmP1153Z?=
 =?us-ascii?Q?z/Lf+ewB/DClznSPA/NBkb6Jrc6Owk77YVSGI2Adb/VmqBCeHitqk6Fbo4M2?=
 =?us-ascii?Q?wNZduos//5Rr2jqhiUD8zEwnkwfST4Tryw0gerrvkke11gQSwPnxPF8uKw8J?=
 =?us-ascii?Q?cy1dt6qw167dD8n6IqaqxOlN7Z6JoIwERjPEcDNvOOEh33383T09ufq6jIFJ?=
 =?us-ascii?Q?kHJ+fLxbD24QYUOQtFm6s2UqI56AyHZHMWenzk+iYGqxAo3tb8RY8G8VuziQ?=
 =?us-ascii?Q?rAqn/QZr2FNH6U/OY8+auidiIhfZelHy9Isib6W5eYDXBhRKC46xgPXtDcaO?=
 =?us-ascii?Q?+IwOBqu16UusH23GvJl9OYy+rGwcVjnEnBcbfl5/guGb0mHJyH7dv32pUsYn?=
 =?us-ascii?Q?0vvdbDm164IAFuwBCMgE5R8+JL3tAnwQ4UYYogtphqhk8PJ1HcrMx5LFthMm?=
 =?us-ascii?Q?gbsve/IPVJwdZZgDRmTNMri9tn1aD1Rxq6LSOsoOLjzvLpgG9F9jrQte+Q8h?=
 =?us-ascii?Q?A+hjJ7Ynff/lwEUuxNprkqJt4W9VUbT/etWZ6uy5JGCnHLiuPnZDDpw1/DHW?=
 =?us-ascii?Q?lSOehb01wS2oukYbSYuLl1v+q5T0qJsnlgz3F8zsqtMfIZ0cWwHPEpULNYKT?=
 =?us-ascii?Q?2SsqRZOx7IE1TzrQjvp++3tDoGpJ26Uu7pLzH+aASRfV+IYzHk/A/OU43xcW?=
 =?us-ascii?Q?DtBqRQxZDCS0ehuKUNSE98FPff3HkPmbLsX5DDawAf1v1Wg5iOiQBM9q6/Dx?=
 =?us-ascii?Q?k5yX5zs11ZMTZN6zC0795b0k?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cc625f-2868-4b62-6a49-08d910993b33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 14:14:16.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdQATbcOIqMFw4zeMNiTGfK1b2KxSgrhXsH1r49yi6sQK5QmWb3d7D9yljqAxZnHIjq9CG97fAeT95c66uEonZwGnmrLcsiKfay/5wF+9J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/blockjob.h   |  3 ---
 block/mirror.c             |  7 -------
 blockjob.c                 | 19 ++-----------------
 tests/qemu-iotests/141.out |  2 +-
 4 files changed, 3 insertions(+), 28 deletions(-)

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
index 840b8e8c15..cbebcf8798 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -754,13 +754,6 @@ static int mirror_exit_common(Job *job)
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
index 2c168b93b0..70f3220ffd 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -86,7 +86,6 @@ void block_job_free(Job *job)
     BlockJob *bjob = container_of(job, BlockJob, job);
 
     block_job_remove_all_bdrv(bjob);
-    blk_unref(bjob->blk);
     error_free(bjob->blocker);
 }
 
@@ -419,22 +418,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        uint64_t shared_perm, int64_t speed, int flags,
                        BlockCompletionFunc *cb, void *opaque, Error **errp)
 {
-    BlockBackend *blk;
     BlockJob *job;
 
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
 
@@ -442,8 +434,6 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
     assert(job->job.driver->free == &block_job_free);
     assert(job->job.driver->user_resume == &block_job_user_resume);
 
-    job->blk = blk;
-
     job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
     job->finalize_completed_notifier.notify = block_job_event_completed;
     job->pending_notifier.notify = block_job_event_pending;
@@ -460,15 +450,10 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
-    block_job_add_bdrv(job, "main node", bs, 0, BLK_PERM_ALL, &error_abort);
+    block_job_add_bdrv(job, "main node", bs, perm, shared_perm, &error_abort);
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    /* Disable request queuing in the BlockBackend to avoid deadlocks on drain:
-     * The job reports that it's busy until it reaches a pause point. */
-    blk_set_disable_request_queuing(blk, true);
-    blk_set_allow_aio_context_change(blk, true);
-
     /* Only set speed when necessary to avoid NotSupported error */
     if (speed != 0) {
         if (!block_job_set_speed(job, speed, errp)) {
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
-- 
2.29.2


