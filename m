Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD752F8F93
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:02:45 +0100 (CET)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tee-00082h-Gz
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQa-0005cs-G1; Sat, 16 Jan 2021 16:48:12 -0500
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:11232 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQY-0007As-AY; Sat, 16 Jan 2021 16:48:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR0hRtjpr1TGjcYuy1No6QtAk00KNQ28xL1sN0wkPGKwheqd8FcXdC1NU3HkM5q3fBvlfw7ppAX48Bz+hVEyra3WzKWjhX2ij6uE1MIJZ2CcC47TgpUIfhL2Fn+W8raVxOYLLjzPoJKGCLLMhqBlDT1POpvXRMbYePmdEpPJOzJvV0AiuRXvOxQW8Grfas4Ee4hh9Q9a2IJ8dKiqjdNKmRw/yWEGImGRZ56sarhFqIA2au4DPl5CWRpxQVnbGxry/1MyiPbgZ6JY9R09F1s5RsoPo38D+tX5ia8ByZ9Zkit6GB9LqhUk8nsBa0ES6mh/RgDGhLD0uUIqeLqy+6ltfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeJdTEmkx3jHAIP3Jr3I4ldeuH/ALZhpj81PDwW2SOk=;
 b=EUYdp5ASk1p0ibj0ajPoZfoMIgJT7ROek9VYF4Z2KN5e4vI7vFQ4kdBFw1qaceFD5zQtUHpJB86TSCnPhXEkVxDoXK0Se5APH7Xz2SVXzwAbJXgy59zWZrHrMyD1dntXzYzoRQYKUukitYD7bE1J5SDhX+1sM6BnfwP2JDC66EiVznCIlcJxOS+pKTL3/5MUzQrE93GeBrojh6yv6TY+358pkqfGfKmA1qSPi3/zFWtlV0gVNNe994G/r00DgrEkETtmRvZk1Jun9CpYiCjBjWFkhPZLaJmkzIpjgnhPizT4IyfBJgz0nkheEx+PSSpbUofs3ahRL+LD9FnrwtFI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeJdTEmkx3jHAIP3Jr3I4ldeuH/ALZhpj81PDwW2SOk=;
 b=mEsl8rdvrV+8JhCK7d1FBO7/luan3FkER5hTatIx9/3o2r82jFgvHiXBw0eZjgoZBTTCFbbjeM7lqL0tHsJrjMqlNuGJc+qo9qnYmC6a9vR+u/JZCdwfJ3MDF0PEw2UiYtUa4SlFQAbhllyIR5dn5gHk0EBZfHW4Zl8bBG6UMlQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 17/23] backup: move to block-copy
Date: Sun, 17 Jan 2021 00:46:59 +0300
Message-Id: <20210116214705.822267-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8fbfc9d-d696-4de5-52cb-08d8ba68632e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542B2F363A6CFC75289C2C5C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5v1Uve4IkbSTD45Wh0EUpwoKfIapWkKZerGYWS64j5Cj3jyEZEQnCpAwmv8yNQJhuQ8Zu/CRhxzCclVGivLk3Mybv5hmHbRAPsFETJcZ1inaPjouGeTwbJwCM14l2e5PXb29WKha6B5VNtcWa0r3L1CihJ/1e/UXaeYuj7DAtmqb4GQDMIAfmIOVTbFh3Wzd2DKjjD61twR57VtZ7VxkJwbfkUI83/LrVxtg37pnUj59MzKmuAuLa8a0X9PgeqFziBL6WytNodptRxxux5Fx+JHaQR74SnkA9RvLXrWeXDtS2NKy7l0S8q1B2G4s7eWUU/PXmMyxSK6NdPJZWKst6AMwFHO+C5GDQYx10C3/7m3OLJ6+yRJ5LkfjwIgFna/dmZgM/vsRYEEThJpMHu5NuuDM/q6y5A8nVxVasRco+3nucDO55WFoy2ZkX0LKaUTinl+LSwQM2fc6Ih34hL9HeFsuUgQM27Mm1oHF0WVKIQwekT3CiWkh4Fm82iWWVTZCYQAL90rR6nW/6D0avC3LyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aIOtHf3HhZywtgLaoc9J8XY+xWUuuIcmOiIWso0/ZjOa6kcFNZ7f7Zxj7Pwj?=
 =?us-ascii?Q?x7fASqiWmVnyqnCADaj29fF4Yj1X07T0b7ZlR0t9Mz+EiW9wtNmrRYidy8F2?=
 =?us-ascii?Q?Y5INk6zQc2btjlWVIEkKOeuXgYLkZTMO/QFD4dQjyXPf/TX++ecmMXKQ/mMn?=
 =?us-ascii?Q?g7Om8CY+fRSKiSaA73XACWmJEXnMJP9FbEn0IKspt5aWrzBi4LTf36btwe9e?=
 =?us-ascii?Q?ARbIYp9UdyQP1XflWYAWfGEBEBNEPo/HqAFUYU8Qscl4tK0P+VF1Zd7o0hIo?=
 =?us-ascii?Q?tq/Ft+5TGnxYULVQapQHoUlPfdaOQUccxUsLAf/B0CDv6joGPenfAQR2n1y2?=
 =?us-ascii?Q?ufToKyCZihz7+KW82qiL03LNSnzmXYR5heG2WsJlSwRhHZpI2zTRIEOKVlOP?=
 =?us-ascii?Q?JQ2RBth6g9/MRwXmM4KMpacY2jQePDeQ4GFmrflpe1oDx+BjFAzyLTQJk6eH?=
 =?us-ascii?Q?IFxNsgG2R/ly8svEYbvRIdlRE1Zxo/nRl+fOR6lMD5Dk3Fhn93vMrECgkFcd?=
 =?us-ascii?Q?b0rqEcQtTepRIYfuhE3uddV54AIq/rRQnSjNote4qJPY0rNEI5OmeJW86eA0?=
 =?us-ascii?Q?rghkTtAqs5cu6VLz/Uwafg97YVZ8tKRif7E9hS/DgOZo2OT8TcWNw9Cd1qcF?=
 =?us-ascii?Q?LNBbFeliA+VqOYbcB/N1QnsiRH5EGuwFIXOSVxtMyv9LzMBWLj88/eBStoWu?=
 =?us-ascii?Q?wqaUKGFw7b+jSCeeSyi+yige7lVPMWr1KTgmEWPsMVxJ03LrFItLQv+WZ4q4?=
 =?us-ascii?Q?dBv2JnoWse8yOPU2c80v5UQb8aVW6Vs5tn4hv0gH4A/1zWlAj+vlXO/gfmtR?=
 =?us-ascii?Q?qQWSmG6w4WE/M7sgJbtn7/1ehbSsCrQoPuBPq4fjDd2FSTSumbcetQEZdR9N?=
 =?us-ascii?Q?DjIzlI3JPGXitrKE/XXCwtFKzprwvScJbKtS0bTOYaStiOY+XEuzF2v7RtFq?=
 =?us-ascii?Q?L0lRl64/cH8IlVydn/F4b4L97WeuvB61Phv+mgyDxmUGOeJozV+F1L3MddWe?=
 =?us-ascii?Q?y9vv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fbfc9d-d696-4de5-52cb-08d8ba68632e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:57.8570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geMa5gtviCYCgXep4C698CsSbrxupZbrfkSq1baUs3imgL3COdh6q7KZWRxOtjO9mH0GVzL5J4PLq7CBhJklb4EciA4P7ofo0T34LB5qKsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This brings async request handling and block-status driven chunk sizes
to backup out of the box, which improves backup performance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c | 187 +++++++++++++++++++++++++++++++------------------
 1 file changed, 120 insertions(+), 67 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 466608ee55..cc525d5544 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -22,7 +22,6 @@
 #include "block/block-copy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/ratelimit.h"
 #include "qemu/cutils.h"
 #include "sysemu/block-backend.h"
 #include "qemu/bitmap.h"
@@ -44,41 +43,17 @@ typedef struct BackupBlockJob {
     BlockdevOnError on_source_error;
     BlockdevOnError on_target_error;
     uint64_t len;
-    uint64_t bytes_read;
     int64_t cluster_size;
     BackupPerf perf;
 
     BlockCopyState *bcs;
+
+    bool wait;
+    BlockCopyCallState *bg_bcs_call;
 } BackupBlockJob;
 
 static const BlockJobDriver backup_job_driver;
 
-static void backup_progress_bytes_callback(int64_t bytes, void *opaque)
-{
-    BackupBlockJob *s = opaque;
-
-    s->bytes_read += bytes;
-}
-
-static int coroutine_fn backup_do_cow(BackupBlockJob *job,
-                                      int64_t offset, uint64_t bytes,
-                                      bool *error_is_read)
-{
-    int ret = 0;
-    int64_t start, end; /* bytes */
-
-    start = QEMU_ALIGN_DOWN(offset, job->cluster_size);
-    end = QEMU_ALIGN_UP(bytes + offset, job->cluster_size);
-
-    trace_backup_do_cow_enter(job, start, offset, bytes);
-
-    ret = block_copy(job->bcs, start, end - start, true, error_is_read);
-
-    trace_backup_do_cow_return(job, offset, bytes, ret);
-
-    return ret;
-}
-
 static void backup_cleanup_sync_bitmap(BackupBlockJob *job, int ret)
 {
     BdrvDirtyBitmap *bm;
@@ -158,53 +133,96 @@ static BlockErrorAction backup_error_action(BackupBlockJob *job,
     }
 }
 
-static bool coroutine_fn yield_and_check(BackupBlockJob *job)
+static void coroutine_fn backup_block_copy_callback(void *opaque)
 {
-    uint64_t delay_ns;
-
-    if (job_is_cancelled(&job->common.job)) {
-        return true;
-    }
-
-    /*
-     * We need to yield even for delay_ns = 0 so that bdrv_drain_all() can
-     * return. Without a yield, the VM would not reboot.
-     */
-    delay_ns = block_job_ratelimit_get_delay(&job->common, job->bytes_read);
-    job->bytes_read = 0;
-    job_sleep_ns(&job->common.job, delay_ns);
+    BackupBlockJob *s = opaque;
 
-    if (job_is_cancelled(&job->common.job)) {
-        return true;
+    if (s->wait) {
+        s->wait = false;
+        aio_co_wake(s->common.job.co);
+    } else {
+        job_enter(&s->common.job);
     }
-
-    return false;
 }
 
 static int coroutine_fn backup_loop(BackupBlockJob *job)
 {
-    bool error_is_read;
-    int64_t offset;
-    BdrvDirtyBitmapIter *bdbi;
+    BlockCopyCallState *s = NULL;
     int ret = 0;
+    bool error_is_read;
+    BlockErrorAction act;
+
+    while (true) { /* retry loop */
+        job->bg_bcs_call = s = block_copy_async(job->bcs, 0,
+                QEMU_ALIGN_UP(job->len, job->cluster_size),
+                job->perf.max_workers, job->perf.max_chunk,
+                backup_block_copy_callback, job);
+
+        while (!block_copy_call_finished(s) &&
+               !job_is_cancelled(&job->common.job))
+        {
+            job_yield(&job->common.job);
+        }
 
-    bdbi = bdrv_dirty_iter_new(block_copy_dirty_bitmap(job->bcs));
-    while ((offset = bdrv_dirty_iter_next(bdbi)) != -1) {
-        do {
-            if (yield_and_check(job)) {
-                goto out;
-            }
-            ret = backup_do_cow(job, offset, job->cluster_size, &error_is_read);
-            if (ret < 0 && backup_error_action(job, error_is_read, -ret) ==
-                           BLOCK_ERROR_ACTION_REPORT)
-            {
-                goto out;
-            }
-        } while (ret < 0);
+        if (!block_copy_call_finished(s)) {
+            assert(job_is_cancelled(&job->common.job));
+            /*
+             * Note that we can't use job_yield() here, as it doesn't work for
+             * cancelled job.
+             */
+            block_copy_call_cancel(s);
+            job->wait = true;
+            qemu_coroutine_yield();
+            assert(block_copy_call_finished(s));
+            ret = 0;
+            goto out;
+        }
+
+        if (job_is_cancelled(&job->common.job) ||
+            block_copy_call_succeeded(s))
+        {
+            ret = 0;
+            goto out;
+        }
+
+        if (block_copy_call_cancelled(s)) {
+            /*
+             * Job is not cancelled but only block-copy call. This is possible
+             * after job pause. Now the pause is finished, start new block-copy
+             * iteration.
+             */
+            block_copy_call_free(s);
+            continue;
+        }
+
+        /* The only remaining case is failed block-copy call. */
+        assert(block_copy_call_failed(s));
+
+        ret = block_copy_call_status(s, &error_is_read);
+        act = backup_error_action(job, error_is_read, -ret);
+        switch (act) {
+        case BLOCK_ERROR_ACTION_REPORT:
+            goto out;
+        case BLOCK_ERROR_ACTION_STOP:
+            /*
+             * Go to pause prior to starting new block-copy call on the next
+             * iteration.
+             */
+            job_pause_point(&job->common.job);
+            break;
+        case BLOCK_ERROR_ACTION_IGNORE:
+            /* Proceed to new block-copy call to retry. */
+            break;
+        default:
+            abort();
+        }
+
+        block_copy_call_free(s);
     }
 
- out:
-    bdrv_dirty_iter_free(bdbi);
+out:
+    block_copy_call_free(s);
+    job->bg_bcs_call = NULL;
     return ret;
 }
 
@@ -245,7 +263,13 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
         int64_t count;
 
         for (offset = 0; offset < s->len; ) {
-            if (yield_and_check(s)) {
+            if (job_is_cancelled(job)) {
+                return -ECANCELED;
+            }
+
+            job_pause_point(job);
+
+            if (job_is_cancelled(job)) {
                 return -ECANCELED;
             }
 
@@ -278,6 +302,33 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     return 0;
 }
 
+static void coroutine_fn backup_pause(Job *job)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
+
+    if (s->bg_bcs_call && !block_copy_call_finished(s->bg_bcs_call)) {
+        block_copy_call_cancel(s->bg_bcs_call);
+        s->wait = true;
+        qemu_coroutine_yield();
+    }
+}
+
+static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
+{
+    BackupBlockJob *s = container_of(job, BackupBlockJob, common);
+
+    /*
+     * block_job_set_speed() is called first from block_job_create(), when we
+     * don't yet have s->bcs.
+     */
+    if (s->bcs) {
+        block_copy_set_speed(s->bcs, speed);
+        if (s->bg_bcs_call) {
+            block_copy_kick(s->bg_bcs_call);
+        }
+    }
+}
+
 static const BlockJobDriver backup_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(BackupBlockJob),
@@ -288,7 +339,9 @@ static const BlockJobDriver backup_job_driver = {
         .commit                 = backup_commit,
         .abort                  = backup_abort,
         .clean                  = backup_clean,
-    }
+        .pause                  = backup_pause,
+    },
+    .set_speed = backup_set_speed,
 };
 
 static int64_t backup_calculate_cluster_size(BlockDriverState *target,
@@ -485,8 +538,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
-    block_copy_set_progress_callback(bcs, backup_progress_bytes_callback, job);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
+    block_copy_set_speed(bcs, speed);
 
     /* Required permissions are already taken by backup-top target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
-- 
2.29.2


