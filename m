Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F59736669B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:01:00 +0200 (CEST)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ7n7-0007FR-Rw
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ7lZ-0006kX-Mm; Wed, 21 Apr 2021 03:59:21 -0400
Received: from mail-eopbgr70113.outbound.protection.outlook.com
 ([40.107.7.113]:44519 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ7lV-0006m2-W4; Wed, 21 Apr 2021 03:59:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5+jtMJecw6W2/7APEIBTy6CNXPTH/D7npklXip2nrewHbwsVTFUqLe2vGH/2dxmwjzUDaTJgwd0+W+6HQUsuyfcNhV1GvTJGvUqZfKzed+5HC0qnqwYRkFcMAX0VRRaSDN5s9qjQnzw7ZRauwXBQ2Qx7gxcn2x83hNNjLYkHB3HuXj2ALOIWElxk0DjCUNTwRvFw25Bqn3XA94I7YiAgqSipbEq/Hyvj9j/xLD4rhJX0mUi3OO/sxiLhVAYNYapRLBig4yEE/zUQiEkdtWsdxlaMaeEXN3JPfwUnEszQ9+E6QLUO8F/KdVaVO12B5EHludkaWR/OpqcWlCwcVN8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XWCdvSGT/LGMtZYLLESsNapMVxDJdBZIVHqkX5G8i8=;
 b=R39kPgQqPTFDOTYGzVCbyvyFXivzO3gszEu4NMqhCoJsvsXSznLjxYABX3WqGZlQdiVtmP5rgZcxcqHlLBeqROU8seKFnbyfxmpW1n5KNPKpIH5oKUmJiQ5VtrfHivQCxvl8SrMhqDvjNmQlaxIpu3VxHxO82eVLY7Gvxs4KAUaDKIkxTneKmgfTD52xMVDd3CoKjAot3HZ9p/+bNTDATIx81qkxmId5zxPctiY2kGGLXtQhmx2c+SKw0tOGuhWLmTRcPRoDL86w0/yKCAKvCaG26FvxfwwENGiEKlw1ig9H5wYAVmHKtkrRHYQJMrVmjWaBY4fvzUEV9oKuxYRYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XWCdvSGT/LGMtZYLLESsNapMVxDJdBZIVHqkX5G8i8=;
 b=ZFUgtGs+UMIy9d3JwGMbBLUfNOiIS28E76UkUWA0RBHVwYu7q64+q+IDW3xOSoycGEiMOLqCl7V5xYiFwxykpX1NHqoHVeQGxp1joYk15zH7/Al75x00X4uGYsSxpLEEqJ8xbBWP4+XmlKR2eK+FimeyrTG8deWo2lxvIQjz0Zw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Wed, 21 Apr
 2021 07:59:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 07:59:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com
Subject: [PATCH] mirror: stop cancelling in-flight requests on non-force
 cancel in READY
Date: Wed, 21 Apr 2021 10:58:58 +0300
Message-Id: <20210421075858.40197-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0701CA0081.eurprd07.prod.outlook.com
 (2603:10a6:3:64::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0701CA0081.eurprd07.prod.outlook.com (2603:10a6:3:64::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.8 via Frontend Transport; Wed, 21 Apr 2021 07:59:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acec6300-64b6-45b2-f265-08d9049b5ada
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376AE3BD3CC549946ED5AFFC1479@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJmUNntIbVdRdnbUTURSKTBt9egOqF5BTlaKYe3aDrMwGealoK6KAeC2OdgxrD3XzPd1i6H9lmY1eHCwCOmlsqLXUX4AttPrV2XGp3BjUJB/3lT0YZyTlnaVZii72+Ds27omEfwEEj9DjGLnZgsaoogVlfG6l54esPzlFDjRxMcs+QKiNVUgUtvPcTTFA67oAtNTtazw+/+LuEW+RdBMXkiOgRZhlMYhVKOycAOIrU7iXhEybByzOYXhmKAUeTW46WjoCm/UTi6v+wJWYiMnNW/YKr7JAehWV86bJ9EsViOlpYQdnZZbXMf56fifjSOQdv03Ic4wej53YZVskEWgLg0IkqbZjMIRvPKfwZZ3e5M61sdqV5+dOKWxqzr1X3ZacyWADXRPvieGNRSB8uCOVN7asYCBy7aPTCMZQgLj6VIUEq6sJQHkbRoitjpuULgVijx1mf20mzUguh/t9XkzYf6yilPGpina3B24W2F3BF4ciuh2+uGr2ZqhuW640T76kbJeucHWWhzivaGMb5veGKtDuvWChrTb+C2NP32HwuG9GNvnVmkeVMMO1MMQlQDWL5sTg0QAtCQplWIcJax/8VLkuDfSNSznCFLAVJT/PMv0Jf92Dy2wP28NNnV0vf5vi5q6KkBax2MeIBHE7sJd4Lfzo7PBayOY5eytaYyjCWFYa1F+v6F1EAFe7VaJM+KoBaR2KrSQ/DcN81dUoUiR5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(136003)(376002)(346002)(316002)(6512007)(6666004)(5660300002)(6506007)(186003)(4326008)(1076003)(478600001)(83380400001)(2906002)(2616005)(52116002)(956004)(38100700002)(107886003)(86362001)(66476007)(8936002)(6916009)(66556008)(26005)(66946007)(8676002)(36756003)(16526019)(38350700002)(6486002)(69590400013)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u7x+5Qb6D7C1Erci1qNERFgpr+4CZv6z5GWW8SFa0Qo8oKsOOEQH3VQ3eLBF?=
 =?us-ascii?Q?pQRhR0vEwJh73w+N4XoDEU0dPUpfu/DKlnDVCI0pqRoR4YF6Xwee1KWRTmL7?=
 =?us-ascii?Q?LREy1zxr01z9bmP73RJWK621Rl8gBnn1lzfGaxC8jemstqQSku4Tnq3WE37A?=
 =?us-ascii?Q?IfxIm+Ynhn6w8P2uO2o0CPKzKyzHrqgt+N7308uAo7QUTPBz9EL2WTr6qsFa?=
 =?us-ascii?Q?5cVAeKTZVfHeA0mkDUuSOd4Y701Be7gUGrxM/fjVpyBjowFYn1a666FtV5SX?=
 =?us-ascii?Q?/5HxOH/wWL/qUiwib2e+ou++q21iua8IA3RuPaK965prsl3sw79jJ+5tFEWP?=
 =?us-ascii?Q?NdZ6OKGFt+muUsgRYG4J7arFD0Uutgeowig/JGKZQyRKT4tMK0nIO/zxyyWD?=
 =?us-ascii?Q?Y0L7PQLlAdDlg1Yh7bIKN+cFYuHve+tiJNsyqAz0oSUVO9PmGZuX0dL9Pt7J?=
 =?us-ascii?Q?wCcG0heyew3PfFpmgaQibFtDqZoisa8vwQQHrynkTnyqp/tk9u2/I7JdWnf2?=
 =?us-ascii?Q?M0ToLwTKY6szUj8qrMcnd7wRw2Ja451WV74hOi011m0Izd3yeTuQkFPtwRdX?=
 =?us-ascii?Q?WW6RJJ8QjypBUpH2QjzVRjMjV2iHZNBcc2ZJ5n4mKv7abpnE14eucP5F6N53?=
 =?us-ascii?Q?oMWIDs0I6j+RPVIIsl+wiKwD+D9QKtI4b419Ooy3iEUgZQoMcWacV4zijQrt?=
 =?us-ascii?Q?yZ0CSYIDxKnmciCbR16n8L5wkLTY9L3TvwK83VR2anjRxo+MXzPi7y5/ynJB?=
 =?us-ascii?Q?c0sEB3gagvjO5Ttm4rZ2mJkXO90d/nZMunxXOdK52x6/i0Ir/5u9jSNwFf7y?=
 =?us-ascii?Q?DkKU76tmhoQpzOi4OM38lqNqKQQvjAIKRYVD3VdPIQB00aZWmufJiO98Icl1?=
 =?us-ascii?Q?uYycIVuf+Mcg6Gao7v4nkv+yoWYrn4FOH4pR8OAx5rdQ2HFTH8wlqWuQtNxy?=
 =?us-ascii?Q?ktOXQwWX8dZ4DQaTBmAuq/H9y2TPbekEGPpA1g4RGMmc5+CZjqZEoE1/xBeQ?=
 =?us-ascii?Q?sFIH4rbKvSGI28bmya9vvp6uxrrGhR+o3IZcyKhW06Z0zUD4lTepSFbzxPqy?=
 =?us-ascii?Q?OY7cbnca/rvibk8H5B8APIUEuOLph3zwtKR/e/6gZKi1xH90VuS6GWx4gzPG?=
 =?us-ascii?Q?hQk1q4FgisP6nIzssjVdc600JdMgdrhoXIqQ0wj3JsSdtglQHOuyHtAAE5aV?=
 =?us-ascii?Q?U9+uynP98UkJ2V3yFDbFNdWCI7QTjcduh1+IOS6OClP0DdKVJBqimliOm2FX?=
 =?us-ascii?Q?pZojOe4tFwLaSw4TVAGDLuz2Ppff25oC3lLY3nzGcTq+9JpdLlgst+o1y5Km?=
 =?us-ascii?Q?ezQeezVKrsjYX/ktQij3IB0g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acec6300-64b6-45b2-f265-08d9049b5ada
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 07:59:14.2432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GOqULQNqKf/UawtLA73Q1mMTTR/qjjT9rDaeuVclC6gibL7VDiBorbVzJhj3WBhPoXT8gibvF9K5joQt2EOwCSMRFbWoVVVVFP9zicqfzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

If mirror is READY than cancel operation is not discarding the whole
result of the operation, but instead it's a documented way get a
point-in-time snapshot of source disk.

So, we should not cancel any requests if mirror is READ and
force=false. Let's fix that case.

Note, that bug that we have before this commit is not critical, as the
only .bdrv_cancel_in_flight implementation is nbd_cancel_in_flight()
and it cancels only requests waiting for reconnection, so it should be
rare case.

Fixes: 521ff8b779b11c394dbdc43f02e158dd99df308a
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 2 +-
 include/qemu/job.h        | 2 +-
 block/backup.c            | 2 +-
 block/mirror.c            | 6 ++++--
 job.c                     | 2 +-
 tests/qemu-iotests/264    | 2 +-
 6 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..584381fdb0 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -357,7 +357,7 @@ struct BlockDriver {
      * of in-flight requests, so don't waste the time if possible.
      *
      * One example usage is to avoid waiting for an nbd target node reconnect
-     * timeout during job-cancel.
+     * timeout during job-cancel with force=true.
      */
     void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
 
diff --git a/include/qemu/job.h b/include/qemu/job.h
index efc6fa7544..41162ed494 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -254,7 +254,7 @@ struct JobDriver {
     /**
      * If the callback is not NULL, it will be invoked in job_cancel_async
      */
-    void (*cancel)(Job *job);
+    void (*cancel)(Job *job, bool force);
 
 
     /** Called when the job is freed */
diff --git a/block/backup.c b/block/backup.c
index 6cf2f974aa..bd3614ce70 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -331,7 +331,7 @@ static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
     }
 }
 
-static void backup_cancel(Job *job)
+static void backup_cancel(Job *job, bool force)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
 
diff --git a/block/mirror.c b/block/mirror.c
index 5a71bd8bbc..fcd1b56991 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1178,12 +1178,14 @@ static bool mirror_drained_poll(BlockJob *job)
     return !!s->in_flight;
 }
 
-static void mirror_cancel(Job *job)
+static void mirror_cancel(Job *job, bool force)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target = blk_bs(s->target);
 
-    bdrv_cancel_in_flight(target);
+    if (force || !job_is_ready(job)) {
+        bdrv_cancel_in_flight(target);
+    }
 }
 
 static const BlockJobDriver mirror_job_driver = {
diff --git a/job.c b/job.c
index 4aff13d95a..8775c1803b 100644
--- a/job.c
+++ b/job.c
@@ -716,7 +716,7 @@ static int job_finalize_single(Job *job)
 static void job_cancel_async(Job *job, bool force)
 {
     if (job->driver->cancel) {
-        job->driver->cancel(job);
+        job->driver->cancel(job, force);
     }
     if (job->user_paused) {
         /* Do not call job_enter here, the caller will handle it.  */
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 4f96825a22..bc431d1a19 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -95,7 +95,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
             self.assert_qmp(result, 'return', {})
 
     def cancel_job(self):
-        result = self.vm.qmp('block-job-cancel', device='drive0')
+        result = self.vm.qmp('block-job-cancel', device='drive0', force=True)
         self.assert_qmp(result, 'return', {})
 
         start_t = time.time()
-- 
2.29.2


