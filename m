Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A23A2AC6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:52:21 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJES-00072m-Gm
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqN-000446-Uw; Thu, 10 Jun 2021 07:27:30 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqB-0004QC-26; Thu, 10 Jun 2021 07:27:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDsOx4bpprdpQw9UOxTkQKgTjx2ouo9JcU9wlrEH0kD7gPZlaUuhwX6GuMIecqnuhNNJUiwZBVaeoH1ybHBI0GvYLA6E/ksepGRJF2SAWz9B92Zc0k6CjcgPYZgqn04PtXHY/gUzk7NPFAFrOLPvSqsFH0o8xw8HXBwM2WUS6s41vhszr0I5lpjPE+C1pVA5QR+rLwdgLR4frcm+XnfC2DnED5pPjYdUnc6YIzrdiW1eG/yxJ229IcJphlI1gWTqbYgRlxi8WxizBYB4he7BI1rhabYOPK9hc+Olz3hP6dB/gHVURBqQgHhbM0Si/y4zR7VCMjrPPBzSrqRSoyLu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdC11N3Lp8BlMzO50aHxEgkk+BSGk01QtHBfkIoeXxY=;
 b=O4HCeIGmS5flre4nZSQ6MN+PldEKdOeSL38dP7KHD/QVUjrTRMqaJQ/oDalNGsVKS9iFlNPSNMyanJBoBh29kVFhr1MASEkVNtld5NqrV/Ku2461DOhb+tdnpjM6t7cEJKyQzv5BsSxzXEFB1l+DEvmtP1B6v64ZgPYWm4/fSjKuBBeQgfvEaHKeLwl2k9N1EgnaP4bWmfX54H9Iewde1s8n+CqK0LrQrScAbe5rnANlA0VBdd4Rq06GS4o5VrkpdEUr3CaRYJLRqlD1MXGDJbK64aCpnMUQyxz93jwq8XppAxcUTIrbboP6YAoh55zefcrYwGB1EDImnB9ZMIQpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdC11N3Lp8BlMzO50aHxEgkk+BSGk01QtHBfkIoeXxY=;
 b=mBisXro1OVi1B+UpQz0OgF2M/F579FAUo5eTh5E4LZkYPDzSvbxsFgn3WnrBFytpGwp23M60VUDhX5JuUQ+y+kZ/FLyCdMYgtkVpb9UChehXYASOAWOJXWlkJhuDO1z1nlm/szvJWKNhmxnW3dhZFEcWdLrkh1C33esdjYRbUMg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 22/35] block/block-copy: make setting progress optional
Date: Thu, 10 Jun 2021 14:26:05 +0300
Message-Id: <20210610112618.127378-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78c8b61d-e57d-4412-96f6-08d92c02a7ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33815C8F6D2FDD131F9988FBC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cYeZEkgOWdClJF+33H+eoGq5eoJZOp7mTPBm8YVx1GRJKEEF/N+swpQ7uM27xXG3/9JzV0+T2JmHljpSw0kutJehk7Fd9795zH28bUIEAfRZvBqXk07qmbohyaDoUkTt+PjkSdkl0Sg9ZF0Y5FyaO5sX5kDyz/c1xm5MDgtJTtzmPfBa2dID0vYLxaLHYBlhvWllCs4VjJYtWyjuZRPARa8yn5V2hNoFuhCMxAGLr3a5ocV3Uh4CDflJnuH5DzkpgMW/qty3LPeXEC/hI6yk68F2LoJf7ktCSC+cQEs+ByIrLTHVn7aqKfuV969otwgPVtXX1NkkDKrAjEtb2RcBAFDa6Qs7G/hS/6eOJquHVddy2/r5FOHHq0LJ91DLxsiikSVX6uBLMWbv8ATHxhnPkkAUrqapM3KWXOpeZ+UdJyZZT2bBls2/rNxrbgmbuPTu5ilpGN+Ke5pkyB2AXqro4tQb7P+QPU5QkSZ5uYYNvZsLIr3cxv/6ZLMNeKf7UUXCgB1Hk7veAX5DTAAu6qlJwoKlLTGLayTO7BSj2bYoK1w5oEGGJImynKr5WbMH3iUf11S11k1SJDCUBfL83CYhGfZmykMMPK1poPjSsjXUEKia2GKpsbL5olqamen9kw8Qwnf9+jZS8dSSaoyZdGECkJJatYkEeq2UFGxE0EhpYvOt23KRps0RGO2g+PYyPMu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?S10/CHZov753tpZj/pJQ/IKUGc+mNd0GMY7y8bvl3rzKgKGWU9lR5JMOtwRY?=
 =?us-ascii?Q?ld+Gvi3yNTuE6DMj10caIaRMbSVd1CnwNFk5BCQHaVoJnsozBcS2VfIq9OIj?=
 =?us-ascii?Q?8thRIsrY1mUHsO6iqDLBBZEKTYqaiq8dWbHcxDcYK/YJ6Vc61g9Gy5cf+9fj?=
 =?us-ascii?Q?KLr3Vxoz7+uUkpfzsFSWq+lbPrgUl1iW0Z6ACjvJsHxuFSCIJZBgZc05RISH?=
 =?us-ascii?Q?Ijsfy+UoFlRoUuyEQKwn2mq9iQWLOM5TQe6pOmpnWIq6uHrNmZFrOtMv4bx5?=
 =?us-ascii?Q?gm42YtXenGLUomEKu33gwdpW4F9VEnJNM2+l4YHK/aswrhBpq1AEj0PwsTxO?=
 =?us-ascii?Q?ObByUpJwqHBagfoqORB3Gi9c1fGm5BgyMAq+xVyDmwEyAGfy1O2zZKTRlg/T?=
 =?us-ascii?Q?SCw87FNJ9TXX88x96KbNv8oUdi/Xkb2cCpu+/tV3QY4t/Qku0VGxWiMn1aH3?=
 =?us-ascii?Q?3EO87S/DFUoHcQt3EhUmZ/VbLLrY595/mFMhgTvbgi51F9rmdiObG1cqXiQw?=
 =?us-ascii?Q?xGiwh1ZBS4EXkdgInVBJhJXjA1pb23S338J3bc9TDeLXw9Kw/Yfj1SGJLjSo?=
 =?us-ascii?Q?l7/ahvvIUy42upr/gyzlaMFdYQy4X9lSDHJnO5IX3CyTbmrQzfY6yLUW76TF?=
 =?us-ascii?Q?WZswomXGwgE0WjQaBycPqOBQMLnc1psqIHL/a8Gs6jOaqCrpLPyIcLE8YQw3?=
 =?us-ascii?Q?nrJpAjV+llxHbyd+SqY23Fq273R/6SIK8/DKmruh0M9PuXdwGem9gqsvTJci?=
 =?us-ascii?Q?SyrPyhZpD6//w1xecZgoA3SZMMctr84I1NMIfdhe8S3+SDyEZ57KznOQ9+Ym?=
 =?us-ascii?Q?sbXcZdIP0PlePELX1Yeq87/jSIjdZfBhenmkSk0g3gmkdQk38G2LX0UEPAQ2?=
 =?us-ascii?Q?Tq0Ix9faCeDD3AnIcOc9HQE39EIAcwFQHH8zihg3f00VA0WCFnOhsI5ffW+t?=
 =?us-ascii?Q?gZBmdV3mn47gsP6oRMl0KrJ8oDIAnIMfrYVAfz+CyFdLsTSJvVHqLSpJAk0F?=
 =?us-ascii?Q?tZIHLiMDL2aY9ofUBabg0J1eFc9rsiu48Jk4SHsctpqnt9/eSHJhwPkcbrCj?=
 =?us-ascii?Q?42XQmw8z2GbD6Kr2xSQvXgyD087loA02BOl/mINzfZCrvHe2+GgfQZlHl6GJ?=
 =?us-ascii?Q?4OVRyjct+pJZQKJa/K38rTjzXC9fvCw36kDRkgIvotJV38Psdv0F8mkdayH0?=
 =?us-ascii?Q?+N3CIJa1K4MrqLXRAPMcu4iWMvRrOnQk3j8Jl00iFIEN/paL8kovi9tDU9KW?=
 =?us-ascii?Q?05LeU36HOqkAiuo2lhMC+pvBYAebf8W0EaHPwCmQhziLvQNDFcUx3PcIIWZl?=
 =?us-ascii?Q?Q8ITHuJcFo3pnvVshFIgZ7a2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c8b61d-e57d-4412-96f6-08d92c02a7ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:57.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSmeL1lTbOtChcSNGS5damLP8Ne2SHY9wJAwvZkXiilAOv+IObrEjgTpxevEUDFWuauWt1qmU4VD4DaFORlueLbsWoNuGeMQPVEE5NA7mws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Now block-copy will crash if user don't set progress meter by
block_copy_set_progress_meter(). copy-before-write filter will be used
in separate of backup job, and it doesn't want any progress meter (for
now). So, allow not setting it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 774f5029bb..5ee0f48a94 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -544,7 +544,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
             t->call_state->ret = ret;
             t->call_state->error_is_read = error_is_read;
         }
-    } else {
+    } else if (t->s->progress) {
         progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
@@ -648,9 +648,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
     if (!ret) {
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
     }
 
     *count = bytes;
@@ -710,9 +712,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
+            if (s->progress) {
+                progress_set_remaining(s->progress,
+                                       bdrv_get_dirty_count(s->copy_bitmap) +
+                                       s->in_flight_bytes);
+            }
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.29.2


