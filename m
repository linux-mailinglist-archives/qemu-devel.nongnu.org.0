Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A49D3D7B5C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:50:02 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QHJ-0002Kq-Gi
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFg-0008GR-TQ; Tue, 27 Jul 2021 12:48:21 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53292 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFf-0004HS-14; Tue, 27 Jul 2021 12:48:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay9J7Zv4m82xc3o8pjTveVj4ILcofepZL6opr52kt8dUFas2p6Ajlw1KyvYbjydDLFlCZaJHutZbrHAGiSwRolRVrCq9TqrWocy7az34eM/64RAXbpTl5JMLgqroSAVPBD4SnmuzRQywXkMKx2PHpzqfsVgVyw+NGT95t55gFU+8yGh9ogRTBPAkJ2RpB5SYSh+gQuq8kYW3xmwk2KTxz6w3MBYErKLim6NKiq3zillP59Nh+QboKRlmIMUfJsf8NSp8WH5a13C3Rb7b/eX0LHFiITxNDuzlw1vhQG9MUMoXezWEvC9OEBmOmnNhI4Y7vnWmNK/q727WV81SWDJNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBsIITZEAEciHS3vlJ9vEjEbGyXitWQnkEDm7FKtURQ=;
 b=VuKkywObfmfdWFaPcAx6KzkefFIfuHEbwytAuGZu2A+j/6AQCleVQvpljgq2B2D0wwe0aj1BwBkPob3V5dPBWoGNnl39xlRqvdnUG0Y8RStCTEDDDbsM0srbg/bhlOL/cc4+lRCI2ThJOxrK3KIeHiDSbh8E28ulLU74dNYTAcVwvktEEmH9JP2vFllqpsfrVrvHJohe59Ka3gg8EnonDPgfDwinUfPSkJBLO2TKbX/OPxj5Apcs6RNLSjgV1giPf2+UDCBjmjq11eO+/Rtoeq2j4uxVhgrsvAml5QyDqWvhw0ywEiWJcV+sNEd/JfNvNA6Ox2h4zRBhVBewggk/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBsIITZEAEciHS3vlJ9vEjEbGyXitWQnkEDm7FKtURQ=;
 b=sDuf9piJE8qiqFGuMosUkiK/ABYGebCY4468wCsNGFNlqmJKtBpTutBxS4QBXe+fLPzUulhfksO9yvlIADGRWf83yDq8q9bVlbrTLWYaoTlENp9DOUnTonpSWD3GvAh8RedXrT3LhWiLmJGK3n+Im6eriruzbJpHAGxfYjEQ19o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 16:48:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:48:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 1/3] job: add job_complete_ex with do_graph_change argument
Date: Tue, 27 Jul 2021 19:47:52 +0300
Message-Id: <20210727164754.62895-2-vsementsov@virtuozzo.com>
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
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 16:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c33fe93-710f-4493-cdeb-08d9511e5195
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB184180A47C0A9F7D748E80F9C1E99@AM5PR0801MB1841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7u31Y3LCEuzOrKlhH0mfiZrDP8hf82C66FAXvLGwbtlImYa1luVRbgYjs67epZ2RP7eg998Td1qXN6skMdHtYMDRnH06pFvM4nb5SKrxcNC61Pcd8+VNCHy84HlnfIZZNtDh5W0dqqAlMFURZpBMs7GAQCmouIADhoNS0TSJ7jLsReR9Q07o+Wr1OhMIoIWcyeGj8IfeSQa10pZpsA0ucvEfb4CE2TdUOchr4XHqSxswn+8qvYgjFSQgEpX0c0LU7INOKd1ho+Kq2mMRyUIhtN1UlzhJB09MHA5vEdXMdWgB9f2/j7lvOq4NrRd5wONqzS5LDvgTgU8Hmj9P/+y12lnyGUqiHsMpBrzxBSYWvAJX8KExI/IRI6738ZxCNm5vyalEl68apOZH7qD8e/fuO/P4A/yPNZ+TGqyxDNunD+F7V3sADu9nAL082LNedQWtNMSOmGwPnN0ZKg6g+uHnyagv+WPU2MOKmDzirgiy2K3cNjG75xoEFTdrgEPNEZwpwUSNsICAUDr3HIPNg9kGNYE9aRgw+jPDkHCNfdSyIEHBF50S9W+TotJ9weha1ukW9yTgDyBs8LBXW4F5sru7ceIT9UE+IoaJIzvEqk7wdb83+VEtGC5VNVuzcdM90mqTHWU8DYDqXJSgpM6Cy+Ez/ffApO0mgkWYRLQQwpkXGYyFyjnVHvKNOq1AcFwL8gGxLk+MjRwtmf/dbqrVZX/bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39830400003)(376002)(2616005)(186003)(8936002)(6512007)(5660300002)(36756003)(4326008)(38100700002)(478600001)(52116002)(6506007)(2906002)(83380400001)(6916009)(86362001)(6666004)(316002)(6486002)(66946007)(8676002)(26005)(38350700002)(956004)(1076003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QvZrbfjiubLjeP7BhRHEvaPlTz9EtS17asTiwjkiJkuc/+Y2FgnyZsBb+ox6?=
 =?us-ascii?Q?GIj9g+KKkBvwfdPC/sAZWD58FuruM97jMdoGRM7rLTl8oQBHw4SEzQYf3F7Q?=
 =?us-ascii?Q?BM5wwQ4V6vTm7hcyb3DT/5sFR2iWbCBe7aZLOWX23HISg1Qv6hUKoERr+gA5?=
 =?us-ascii?Q?lEQr2RSg3Pb8JR0G4JeD9/KamxGzvKOvwpSQna/TWgVhvEX9hMLFiDm0/Foh?=
 =?us-ascii?Q?CEEkMrsY2093zDaSYLNN3I+MNjjZPCgEe9FuNIwXSR/YG4kbuEKgZZSqQarp?=
 =?us-ascii?Q?leQTDXXA+zJZRflgGpo+05qYInDPtgvp2ioI1YLpgGbTlNp6jOFY6jw2tQ3/?=
 =?us-ascii?Q?ElsFs9VfoUvGQCKzlZAy3Mc+AMfLrqTNqaE4mTG9etsIVTwmXd5EdZ7Kf1cV?=
 =?us-ascii?Q?s3+fLwLI3+VG+R0z0BXUySFC0ImXSkvD2pIBcOhKVOoQjmLxF8f+DBb3nJA6?=
 =?us-ascii?Q?BQ6QdMJwNl2Rm1v3dvGITacDwP47uYjGN0aC0KUqKuBYtckGHyienM7/VA6x?=
 =?us-ascii?Q?u330RlFwRmQSITpp5JAJZ4H22M4Eq+sdAB095KUuQfLInKeaoriOMXM4gGhZ?=
 =?us-ascii?Q?98G7RT243uI8pr7JRc6aHSMTxMPaISeiOVoko9DOWrDKxnzYDsgyPbOOBCgc?=
 =?us-ascii?Q?zOQeddThLmR244Z7fPK1oR5gQB2BsrXN5Zq5Hrpy7T8t22QHguQNGQAsOASV?=
 =?us-ascii?Q?SU3qleUG6JgAGSxydIMNErjR0aOPl3cLeYUoF+nxvgBTWEGBS9HkMS5/Lzah?=
 =?us-ascii?Q?euESBZYQHdcCHiS61rSc6JPLtqRXlEXUs9q1JJBXwzu7V0kRRBzSgEAaFs/p?=
 =?us-ascii?Q?8KVrrpaycJ1jBLCteOh+n/jf2wCALOzTiSTJzomNrOo3JsoHfQQEglYifFer?=
 =?us-ascii?Q?faL3te6+hgJpLbOSUS5FVSqD0nysg1Znhucz52jqklsN5GgQdEhzBo/YH2qT?=
 =?us-ascii?Q?F5zT7EPlBbi3ZHQbCJKWvSyMAoLab00xTG7eHzwdvtTws0A3RgAksW85ctxO?=
 =?us-ascii?Q?/heP5Sw4eJDAeyTDl8a0guh4MulxGwPDoQ0MANPSOPin5KKA3m0GRGNPy7Xx?=
 =?us-ascii?Q?8jWn1WqMQ23RDCzx76ZRmVIn5EZiQv5LwB32Ki6bz6XolqjDtuygUd6L9vxw?=
 =?us-ascii?Q?VFDboVye9nY8Np7RaN49B3fdRDvhdsf+l0MycndWyNOH0YbMNZc8AXsB/ThT?=
 =?us-ascii?Q?yb22SvdIY3W03++gD93Wsb7fzrYCXGSvmdo2uc9fIg1hwbVD7BdO4743FWPw?=
 =?us-ascii?Q?oMggojokatT9h0Qr2XZryStqP111nZFzvyIKV1mYPCtt5jyfyBFref3TiEtz?=
 =?us-ascii?Q?5Spuxbyy0JAYTDILqKixbwcb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c33fe93-710f-4493-cdeb-08d9511e5195
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:48:11.1078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HayzAGhy58UH5oIpkjozyjf+Yd3rm08Qp71DcOtklAjnEvs+DzUN6RRA1lKkUCM94jLbzkzWb3Wvov69SiIQi1ko102z1sN8sOQxTXKEyrU=
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

It's an alternative for soft-cancelling mirror job after READY: mirror
should finish all in-flight requests, but don't change block graph in
any way.

To be used in the next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/job.h               |  5 ++++-
 block/mirror.c                   | 20 ++++++++++++++------
 job.c                            |  9 +++++++--
 tests/unit/test-bdrv-drain.c     |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 tests/unit/test-blockjob.c       |  4 ++--
 6 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 41162ed494..3dfb79cee6 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -211,7 +211,7 @@ struct JobDriver {
      * Optional callback for job types whose completion must be triggered
      * manually.
      */
-    void (*complete)(Job *job, Error **errp);
+    void (*complete)(Job *job, bool do_graph_change, Error **errp);
 
     /**
      * If the callback is not NULL, prepare will be invoked when all the jobs
@@ -492,6 +492,9 @@ void job_transition_to_ready(Job *job);
 /** Asynchronously complete the specified @job. */
 void job_complete(Job *job, Error **errp);
 
+/** Asynchronously complete the specified @job. */
+void job_complete_ex(Job *job, bool do_graph_change, Error **errp);
+
 /**
  * Asynchronously cancel the specified @job. If @force is true, the job should
  * be cancelled immediately without waiting for a consistent state.
diff --git a/block/mirror.c b/block/mirror.c
index 98fc66eabf..ad9736eb5e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -44,6 +44,11 @@ typedef struct MirrorBlockJob {
     BlockDriverState *base;
     BlockDriverState *base_overlay;
 
+    /*
+     * Do final graph changes. True at start, may be changed by
+     * mirror_complete().
+     */
+    bool do_graph_change;
     /* The name of the graph node to replace */
     char *replaces;
     /* The BDS to replace */
@@ -648,7 +653,7 @@ static int mirror_exit_common(Job *job)
     BlockDriverState *target_bs;
     BlockDriverState *mirror_top_bs;
     Error *local_err = NULL;
-    bool abort = job->ret < 0;
+    bool do_graph_change = s->do_graph_change && job->ret >= 0;
     int ret = 0;
 
     if (s->prepared) {
@@ -689,7 +694,7 @@ static int mirror_exit_common(Job *job)
     bs_opaque->stop = true;
     bdrv_child_refresh_perms(mirror_top_bs, mirror_top_bs->backing,
                              &error_abort);
-    if (!abort && s->backing_mode == MIRROR_SOURCE_BACKING_CHAIN) {
+    if (do_graph_change && s->backing_mode == MIRROR_SOURCE_BACKING_CHAIN) {
         BlockDriverState *backing = s->is_none_mode ? src : s->base;
         BlockDriverState *unfiltered_target = bdrv_skip_filters(target_bs);
 
@@ -701,7 +706,7 @@ static int mirror_exit_common(Job *job)
                 ret = -EPERM;
             }
         }
-    } else if (!abort && s->backing_mode == MIRROR_OPEN_BACKING_CHAIN) {
+    } else if (do_graph_change && s->backing_mode == MIRROR_OPEN_BACKING_CHAIN) {
         assert(!bdrv_backing_chain_next(target_bs));
         ret = bdrv_open_backing_file(bdrv_skip_filters(target_bs), NULL,
                                      "backing", &local_err);
@@ -716,7 +721,7 @@ static int mirror_exit_common(Job *job)
         aio_context_acquire(replace_aio_context);
     }
 
-    if (s->should_complete && !abort) {
+    if (s->should_complete && do_graph_change) {
         BlockDriverState *to_replace = s->to_replace ?: src;
         bool ro = bdrv_is_read_only(to_replace);
 
@@ -1124,7 +1129,7 @@ immediate_exit:
     return ret;
 }
 
-static void mirror_complete(Job *job, Error **errp)
+static void mirror_complete(Job *job, bool do_graph_change, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
 
@@ -1134,8 +1139,10 @@ static void mirror_complete(Job *job, Error **errp)
         return;
     }
 
+    s->do_graph_change = do_graph_change;
+
     /* block all operations on to_replace bs */
-    if (s->replaces) {
+    if (s->do_graph_change && s->replaces) {
         AioContext *replace_aio_context;
 
         s->to_replace = bdrv_find_node(s->replaces);
@@ -1737,6 +1744,7 @@ static BlockJob *mirror_start_job(
     blk_set_allow_aio_context_change(s->target, true);
     blk_set_disable_request_queuing(s->target, true);
 
+    s->do_graph_change = true;
     s->replaces = g_strdup(replaces);
     s->on_source_error = on_source_error;
     s->on_target_error = on_target_error;
diff --git a/job.c b/job.c
index e7a5d28854..52127dd6bd 100644
--- a/job.c
+++ b/job.c
@@ -987,7 +987,7 @@ int job_complete_sync(Job *job, Error **errp)
     return job_finish_sync(job, job_complete, errp);
 }
 
-void job_complete(Job *job, Error **errp)
+void job_complete_ex(Job *job, bool do_graph_change, Error **errp)
 {
     /* Should not be reachable via external interface for internal jobs */
     assert(job->id);
@@ -1000,7 +1000,12 @@ void job_complete(Job *job, Error **errp)
         return;
     }
 
-    job->driver->complete(job, errp);
+    job->driver->complete(job, true, errp);
+}
+
+void job_complete(Job *job, Error **errp)
+{
+    job_complete_ex(job, false, errp);
 }
 
 int job_finish_sync(Job *job, void (*finish)(Job *, Error **errp), Error **errp)
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index ce071b5fc5..b754eca27b 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -823,7 +823,7 @@ static int coroutine_fn test_job_run(Job *job, Error **errp)
     return s->run_ret;
 }
 
-static void test_job_complete(Job *job, Error **errp)
+static void test_job_complete(Job *job, bool do_graph_change, Error **errp)
 {
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
     s->should_complete = true;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index c39e70b2f5..d07ba69aee 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -385,7 +385,7 @@ static int coroutine_fn test_job_run(Job *job, Error **errp)
     return 0;
 }
 
-static void test_job_complete(Job *job, Error **errp)
+static void test_job_complete(Job *job, bool do_graph_change, Error **errp)
 {
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
     s->should_complete = true;
diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
index dcacfa6c7c..b2653a3733 100644
--- a/tests/unit/test-blockjob.c
+++ b/tests/unit/test-blockjob.c
@@ -165,7 +165,7 @@ typedef struct CancelJob {
     bool should_complete;
 } CancelJob;
 
-static void cancel_job_complete(Job *job, Error **errp)
+static void cancel_job_complete(Job *job, bool do_graph_change, Error **errp)
 {
     CancelJob *s = container_of(job, CancelJob, common.job);
     s->should_complete = true;
@@ -382,7 +382,7 @@ typedef struct YieldingJob {
     bool should_complete;
 } YieldingJob;
 
-static void yielding_job_complete(Job *job, Error **errp)
+static void yielding_job_complete(Job *job, bool do_graph_change, Error **errp)
 {
     YieldingJob *s = container_of(job, YieldingJob, common.job);
     s->should_complete = true;
-- 
2.29.2


