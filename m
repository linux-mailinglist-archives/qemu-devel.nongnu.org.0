Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE547EFDA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 16:41:47 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0mhW-0003Pk-NY
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 10:41:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcJ-0005qH-JF; Fri, 24 Dec 2021 10:36:23 -0500
Received: from [2a01:111:f400:fe07::712] (port=55270
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0mcI-0000YV-6E; Fri, 24 Dec 2021 10:36:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a49SmaCdz5XZ2JYkQzeNJ+3wMMrrpXMcIAQBNZPieHj8gIULtOhNNsmRijAR1Y8dUwebuOLgu9g/j2xiBoxhiMIrvUANAwQ4oGhEDqBEhefQ2GjWOhP7zCewudr6yIUgZVp8GazdwLQ4EoTogZhC3Crk4NK4tyqRE+VUQpWKk+Qba+VYjsdGxVep/gPkdRCbfTddswsBAvzPVYZ1VsZ6k9i3PpIcAnLTxcjG+q8gE6Ddk2jZKS/m6nQIZAJ9xzmVT0g77dAOTwP3zzm58uqsSt5z4O7RKy5ZBCPgx5nKX305FKHM+CuuuSht42ewQCH2lKqiLzrcwVYcf3kR2Zp9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLwGVSdAE9uh+PAaecJAc6BEShd9WOc+Rya+6nuVyc8=;
 b=RRe3SUYz4RKBBajlRJHF8rhKhjB1HubYb4ZtQGyvYnWtajzRo/GCzv7y/KQWeiwfJILhrIk4dXOQ9/KpX0rZR1rji4TfR8ClcevX5fJ+q5qAja3qt6epdhobbAtZVxcmg5ThA6+sfnMFaBjgqRnS0J62b0vHSDpp2RoQVT6FmZhIwJxtB7AdfIxnS2u7x2EJj5deBhi/GZ+67PIdWePtw3KnJ4GMYQ1JEhXSkw1eR3Sjdf+5cW1JBYNAqF6SQBHqJBvfqgcisS0TeDhnxO/hAXDb38EoBOYTRpRXBMKKANp6d8JYWpWkhq5O0hBVXV6uMuyWwMffFKGljBYiFbsUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLwGVSdAE9uh+PAaecJAc6BEShd9WOc+Rya+6nuVyc8=;
 b=str97SJ8lKwbXOJfpq/DtQ8y+3vRhmMOZJ4CwcHu6EyMu5hdju651F2oq+vD2ar+9aCn2Pgq6ObSzf7ULU2RIxCh4KsXKZnNObXv0ty5EesYjxlnhfkJ+Z28IjSGnYNyGVhtNkbhg40fxp9ZNQpcozGi8jNe+nip2suzKkmlqaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3955.eurprd08.prod.outlook.com (2603:10a6:208:12d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 15:36:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 15:36:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 4/5] test-bdrv-drain: don't use BlockJob.blk
Date: Fri, 24 Dec 2021 16:35:51 +0100
Message-Id: <20211224153552.2086061-5-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8a92ba03-9b76-4977-a340-08d9c6f3207a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3955:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3955DE087CDEBF82F633A18FC17F9@AM0PR08MB3955.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:20;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5aO5vTWPajj7KShX+X15CZGLCUKtfWPaZro9tuIRF827OJoEtcm/a1ax/AY7PAlD0D2miEAmx6nIgCrMl5uSkZRqVdnU0C9QferUBRoB/OEkHQabHf4N7tcSdRQjBbGcEqO9L7AZ+56ajomo1/HKaCsGgjZDHcbFmUDM2SqGb2QRkMTlsP0KxWvfac0Z9A1pSd05KjzyjqWA+NRmOZe1BylU9GREQfXwdk1ccwnF/u10kPK3iRz6DNW0+Wu+tVWcYOymA9AK/Dyfwf8iusWXmTsW/daXev6vj2MmUK7XHu3vuBjCatp65BT+qVSzqzQf1JAq6KKmINhyW2v0TI9zfyU0LhrMH6MqlQftNJLTqRxC/RaBApkYLrN+YtflzlGn6sVEMLnWzRyuwXe1jPjG6FIvB0XyJ8fIZ8kAg82HS64DGJLkS8uiS8lYCRsbIGiYTTzgCJbIq1d3hXnQ7HL2oSw3DqrkLmPUJ9rRTem/BEoNoPD4w9/WmTtXBClMnda8cvTiX8pGcJ4mttN8rdB1y75WOs+j0Pqhz5oauqqgUN+lFKBMIrBzjHtGTyDJPNhmfN2zFmbg3biQUIXYgzaTECGmmsKErqdI/zKXuMCJE252eXEBpNwRT7ddEYMaSsQfVeI0KYa5yeg5ut2KVAVpqdvViM5Np4Hgqru1zIsqAnC/e4dWRZA+VvdqCujsZI8JX/NsXusjo3VZngyGuRL/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(508600001)(86362001)(2906002)(107886003)(66476007)(26005)(186003)(6506007)(66556008)(2616005)(38350700002)(38100700002)(83380400001)(66946007)(36756003)(6512007)(52116002)(316002)(8676002)(1076003)(6916009)(6486002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoQmZmtI2Dbe50RDo0vrvfdwlcYMS9dgx7XmIvbHjUToXVJc+Nr0atHKs/Wy?=
 =?us-ascii?Q?E8HLP+7Qyj0xxa+1m3Uw7+iSIiPT9jTbNUcw+dtd7zynJpGqgvT+Z8hRHRFo?=
 =?us-ascii?Q?Kec+8wegpwg1vuSAenmstOxFMY0Tfn53l1BeZkuJ2OM1kpc8/Cj59NyLBm1C?=
 =?us-ascii?Q?ApXtLqqHm/FBApnVQaPvZpGIGJWblhrh/2aa4lu0R4Lom9wRPlcsxFbsVvwX?=
 =?us-ascii?Q?Kwx8KW0/c5LannhcjVh3HXM5IjHF9Q5OMOHvUDai6zHxQJBpwDqd0+fc/Hvy?=
 =?us-ascii?Q?uIogyafIGrTkmPjCiNdCEmZPcWFQld13+wp/AkMZ4tciModzvT/AEsQC7Dmp?=
 =?us-ascii?Q?F5PfDswkvDKTpgig2J0wbwhwkxMx91TlrvH5SlIowOv9rZpZiBzSFGIqz+Oo?=
 =?us-ascii?Q?jLaX9gjhtfgB9cf1q54DTQhmYSXksKRiRJMH4oVwClbbpAopHuAp+ChOkGpL?=
 =?us-ascii?Q?XUC4IhSS7iqXb1szGnn/mJWpMh/Mpx07GcJ2FvTEBWp0Uv3QyVe5W2TW15He?=
 =?us-ascii?Q?dUWBL8W+uMYwcYICyzvusEzItyG1Rwz3QleXDS4/sEUkXa8LWYM3NG+rZrbE?=
 =?us-ascii?Q?f/qgCmU7nr6pYite8rvvSuCRh9s44WRwptzNTRP7VhQwjOFas9H9R7YN5Pcw?=
 =?us-ascii?Q?M+AU0+gH8UCD8fzutEuruE/BjyBD1HDI+i0N0je9v+BRNmUBbc+6YQGPwho1?=
 =?us-ascii?Q?+kVQLsFt6dGVsI7jHx5SmqQmTpW8BtMwox0sQuPQjvdzuAKqlgmb0XGqfGDm?=
 =?us-ascii?Q?HLudeZW2rtZ5sM5ZgDjeaWpZQ9LWLB/ktVy5KhJPdvYGqbtn50iyEVRe1XQd?=
 =?us-ascii?Q?TnVmrjkXv5JuMqurSi2zGgmi6NdhjvqSyAdvA00zrr2VYKmweNwIgq48/sfs?=
 =?us-ascii?Q?LRBVG1Uc0I8crKPgCIjiiMHm9XeKWJWYY3SkppKlzb4eefK7ct6Unj5amdfJ?=
 =?us-ascii?Q?wU9aR62bWeZuGc7hrb9A++4QWlsAY1Y3Qr2uqM1hoxIxOCZVTyFKA1Euvgaf?=
 =?us-ascii?Q?XOaU7/+aj3mzpZqRtUJeR5ff64ELc7/zvKQwM3P28MVlbLOXB9ZqYxHKrfYH?=
 =?us-ascii?Q?nrgcobgZU9rjJwv3KHNDOPmhtE2Y0w4x5vL7n+ykl0BrFQ3JugQVDLRqiLCJ?=
 =?us-ascii?Q?G7AfJLDEC2YR3o4da8Hylqo95CgMePrVF1pRYPowGjuH7ipRMTibzI+QGdrN?=
 =?us-ascii?Q?aJ3/sW3rdfXrhMCVUMv2gs6yIi4ho/1Q4fOT65Cy8Bjj3cg9ookg+E7ONNB4?=
 =?us-ascii?Q?zdSdPwNLMZj3zRqFoNTTkibiEL8uz0OnsS34MD0SkRZ+YwnI4bDNbxwRVd3c?=
 =?us-ascii?Q?zfsZeB6sLtKhywnMzf64Ldj2CLvdWhbpVYWD7Zxu4u381W0BW2kRg7kqWXm1?=
 =?us-ascii?Q?ShiPqFP0sDjU0Kx2Q6MjLBo5aI4Q96BQXexh19RSvj0soMteTXNQ6Nn2n8/a?=
 =?us-ascii?Q?ykd+B2y6bPCNKdtldKiOstc72NxwZA9Yup0Zp5oeo4GDldfZfvAcFcPn7q0W?=
 =?us-ascii?Q?1K4/FW2qgbGUv+T/UQ6lvaLzzLUvBsxhBpf7gWSuyPVsyRbjirMfGnO72wmZ?=
 =?us-ascii?Q?e+TtJAJFk2iI1nkQgHR1R67M9p5CpoptXngWRWc4sflZnfCKeypgj/0tQDGC?=
 =?us-ascii?Q?+4vfg7h+QqppoRyoqx4KCoctzHvL40K3gY/eRcYuKReoL9o8J0iy56K3tSSn?=
 =?us-ascii?Q?eKGw2IfgEQ2u4LPwTcHjxIqL/FA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92ba03-9b76-4977-a340-08d9c6f3207a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 15:36:17.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAFHIwPTquJVhMfpq86ew1HDO/6uZvJpUEugSGDoD4GrqqhVJdT81SB6BSVxwx6cPJhPbAhS83Ai4ht8uEqNHEYMx024vWi0M5lmE8h8ff4=
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

We are going to drop BlockJob.blk in further commit. For tests it's
enough to simply pass bs pointer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-bdrv-drain.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2d3c17e566..36be84ae55 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -772,6 +772,7 @@ static void test_iothread_drain_subtree(void)
 
 typedef struct TestBlockJob {
     BlockJob common;
+    BlockDriverState *bs;
     int run_ret;
     int prepare_ret;
     bool running;
@@ -783,7 +784,7 @@ static int test_job_prepare(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
     return s->prepare_ret;
 }
 
@@ -792,7 +793,7 @@ static void test_job_commit(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static void test_job_abort(Job *job)
@@ -800,7 +801,7 @@ static void test_job_abort(Job *job)
     TestBlockJob *s = container_of(job, TestBlockJob, common.job);
 
     /* Provoke an AIO_WAIT_WHILE() call to verify there is no deadlock */
-    blk_flush(s->common.blk);
+    bdrv_flush(s->bs);
 }
 
 static int coroutine_fn test_job_run(Job *job, Error **errp)
@@ -915,6 +916,7 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
     tjob = block_job_create("job0", &test_job_driver, NULL, src,
                             0, BLK_PERM_ALL,
                             0, 0, NULL, NULL, &error_abort);
+    tjob->bs = src;
     job = &tjob->common;
     block_job_add_bdrv(job, "target", target, 0, BLK_PERM_ALL, &error_abort);
 
@@ -1538,6 +1540,7 @@ typedef struct TestDropBackingBlockJob {
     bool should_complete;
     bool *did_complete;
     BlockDriverState *detach_also;
+    BlockDriverState *bs;
 } TestDropBackingBlockJob;
 
 static int coroutine_fn test_drop_backing_job_run(Job *job, Error **errp)
@@ -1557,7 +1560,7 @@ static void test_drop_backing_job_commit(Job *job)
     TestDropBackingBlockJob *s =
         container_of(job, TestDropBackingBlockJob, common.job);
 
-    bdrv_set_backing_hd(blk_bs(s->common.blk), NULL, &error_abort);
+    bdrv_set_backing_hd(s->bs, NULL, &error_abort);
     bdrv_set_backing_hd(s->detach_also, NULL, &error_abort);
 
     *s->did_complete = true;
@@ -1657,6 +1660,7 @@ static void test_blockjob_commit_by_drained_end(void)
     job = block_job_create("job", &test_drop_backing_job_driver, NULL,
                            bs_parents[2], 0, BLK_PERM_ALL, 0, 0, NULL, NULL,
                            &error_abort);
+    job->bs = bs_parents[2];
 
     job->detach_also = bs_parents[0];
     job->did_complete = &job_has_completed;
-- 
2.31.1


