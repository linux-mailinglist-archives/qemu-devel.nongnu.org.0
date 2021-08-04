Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527EF3DFE52
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:46:39 +0200 (CEST)
Received: from localhost ([::1]:59792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDTy-0004LG-AE
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMj-0004xE-Ud; Wed, 04 Aug 2021 05:39:09 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMi-0006MN-2d; Wed, 04 Aug 2021 05:39:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX4i4BxOCUeIgykt1bIi6rbO2OzaInc5XTSOgtJlb02IuZXj7GNGW546UsD0U0VDet/OY7vRfAga0sMe2XDWVWGWWHaD6aJ/O/o0PuvxOhQZug/E9Dft+QynqgCgdGd9TrPNZS/7kYl/DNvK+M7e7gNTVNheikomO6ZLrV+dK1ud66LcWjAn3PHuAmw4CuxU9wmRs8Kdyu3bt7Y0kiw3CqJw0eMlKMO/tc6RU1zvC9+CFevD4W0KgqL2aZZzSHti69/eTpwnR78M10/dswQTm6RODCYmtxGwCikyAf6BifL0MCIclUrRV8Yu6gu6N9L2VlLJdBHPQ17epY6rXhhirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQhvFYkWiAs9Sj+u+oYntPrIyGvFysak4ZuQ19hz7VQ=;
 b=Uc4hbvtEJjLWZaVRKLBV8cv1c5jgcr0dR6KDhqWaxqisc14omKXsD6a+nYElUkNyE+adyXQpNMLlY1QPaQKOkW4Y9NOSOapQH5Ag1eSJFRjiEnVtfbfVM+qCeMh2vN2rmqUtLmdqqXCxr+3P1i+zuuDErlScLLP4odWLLEwjmwUVhvsOc/FSxOMk95o2xQxxjLXDZtRlzJUybRv/szuPnNt3I/8oBDDqsaOv/FVNHniIbLRC1CiunNJfhq3DF5sj1zS3vXoIUFXHT2N8pexlOL7EKF166PqqSjglZPcuy7Cuscdfz9rGEVZqVRttxt+ccIglobcaP60bVIP+qJAoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQhvFYkWiAs9Sj+u+oYntPrIyGvFysak4ZuQ19hz7VQ=;
 b=QJ1UZDSlPHbxy/urrbGsD+aIHg1IKmEP6hR9FK7xmrKx/+pzZSUuzw1szubbl1r+FO8T1tbe+uImcn/FY/XhiTJlKkf6ybT3EdmjkKj0hTqQe2cIIIUARnW1mo//FPNSPlS24EO1AW731q8MOnUcq6z8leFN7tYow0Mq0/URFvs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 20/33] block/block-copy: make setting progress optional
Date: Wed,  4 Aug 2021 12:38:00 +0300
Message-Id: <20210804093813.20688-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c597f2-7b15-4593-f2cc-08d9572bb33d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689030AC7EFCBD5B8455C0DC1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZtdq2/lL9Oo7tIjsvHnYGwQZG7S0YHdTzVshh+g4vPAwmoqrCDE81aZdTNHENfVUFzg1M4yvE4+/wrVz5+Ztmb2cyBjBBgRYxGDkdv+ATG9n0KsDSnXYaHw6j275chK4GDaZ3EJq6bFAouzgKyqT4UfBtzQOKbGyGKszstHGv82xu2uTEziDQA0cX55vZdh5kFuZperuuPb8QIZ7pIQ5BjR/m4PKm+LeNgYeQPmsSQTDBPbJOc2YWEzG16jwsy2riYL97gComrJrQCpDsKEzNZ7jyWGxMmyckt1m2uMnc5K7S9V9wilnJ565UlsLMJMHLr53hptEUHmtb+QeENftAVD7PkKhkJjFhuqOQrdGX0Zeg6j27H7opvMDETQ8uFU/z7cBjM3mDADFF3aKkN1q3JdnO2YzAdFGXyImnEWOCF6kcd1NVL1wECCviFRBNWnBHoebr29b0YT9gbz3LzpZnXQ9M2YmIans1FMWtzYF6KTZMJsfDaosWsw6t1zVNefDZ3EOcwXlB+XND7Hq+h/204kVTxaB1wQqC8pk4T5uMPrs/4tJSHAS6xZShLrEDFn7xA73eL5pc0NP830a3qifg6r2LL40gCcHFy5/myY+8aXWFZRvRqhU+ZluQBSiJwt6dJVIoh/Hw0yWXwcohZntqGeMwxl2hPiOcwDFcEm8vut/8TY24UuYS0NLMwNLtudvSLcvXqHrGcy0medJfVI5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMHmjFqKiJcR8cf1MD2uwe/rgl4hWqwOmdPVJQFFlb76Byqn4ry51IcTczH2?=
 =?us-ascii?Q?aGPNHvdYM6UCBargCyx3xl/z8fOzMS1tzMvmSabsik7DGOv9uzuSj6cN0Trt?=
 =?us-ascii?Q?ilR4imGKdxzNJ0+TEvwnfoKYTOxdFJ7GiyEy8rCOhT6OB2aDSTiHkTcyNJ3N?=
 =?us-ascii?Q?B+E32rI371CSz87K+0OXPPvyQKCiC+ppQOY9Ou040gwx2Mhsop/qJffOmn+4?=
 =?us-ascii?Q?xvyDdwGAmRwqH0CuvsHLMpgMeXoiZ6pIFgp4o8gVCn8IZ550D55ULtwqvu8g?=
 =?us-ascii?Q?0Q41lbm0omkocxZgla0xbyIRzTFNop340LJmXfKve+fbpBuAtKeKU5CWyGIv?=
 =?us-ascii?Q?1UgLbu9C6wx5WYy2hB0tZyOlaUAyr87hJwtnoElb9Beo0icMOnPjWkdHdzJL?=
 =?us-ascii?Q?pJNQ/ogkmlyv2i5dCDv/PoAEZpg1Hv1d7ayF+F2Bo9v5NF4zaM3XKD/1TjJz?=
 =?us-ascii?Q?fowGPrmthe0reCLSKB/etX0DMgE0gRS3dZ7/wy2/Kty/my/pSK6ZEF2XiONy?=
 =?us-ascii?Q?EZS0N5/e1Vf6/5vOpBeJiZBm/LMXJsyKqL6UzWg4LwFaLyGTAvhejH4sis5L?=
 =?us-ascii?Q?LSqKymIJLQIEeGu5erjHG+6RA1VPQeAWL+ev3yhNlcfeDip5pUn06YtAdebp?=
 =?us-ascii?Q?WL2vOMCyIEmzxqXx9s5sr7fLMvMMjeHubi/k+AOTzh1lTVq0OcLH9tk6Mx1I?=
 =?us-ascii?Q?7LylRFG3ggWaaVsL++NN9knnRzylxcVfCv47A3rrAFmByjDQd0xz/xX3ST7g?=
 =?us-ascii?Q?RnszXonnedKkQtzU7SJrzvGqSeF5wTAH26gLVzSWAfOdj2wdg6CTqngFp2x2?=
 =?us-ascii?Q?uOtl0TiAnSI1l1zcZSHvf5tubwvv/9oaFDsimZfX0fSbV3rUEYZVpl1s7XGk?=
 =?us-ascii?Q?np6PaNiR/sojDVgoBGb9/i7pFrb+xKO0S5k6UXA6hfURTzPaBs6KVrRvKNgz?=
 =?us-ascii?Q?bekoRw65PdUBc6FKmjTkaxSE/iw+vfYhsii48WjPKyBXokVkjh9+PkgxpcKH?=
 =?us-ascii?Q?aaChHPJkF+DKFJMrQJ3ugqE1pWctaskxIA0mwDeWCJWbhJAFAr9UQkuG7GaV?=
 =?us-ascii?Q?fZWntufu3yRYuV7dPuRQyPL1LiA3L3Yd6HKDkvChNFyJbB8gOJc3sLM+hoov?=
 =?us-ascii?Q?UylREGNX2fUnfN2+zINZcsOVgbb0vgWCiLrhvG9hyryeXbWXmZxNImaEJ3lg?=
 =?us-ascii?Q?Ub6WymiSkeh2zYNUs4DBMKzt0e9XspDr8+D67OJWc04Q0pt8rbLydHrtEkY9?=
 =?us-ascii?Q?5JwZW+4LbVptSj3mAftNrF6f8LSe7Pc4grJl9viDPQDz2PjRr8OQnaP6DInZ?=
 =?us-ascii?Q?aBwRy3OFZmFTdgz7pTG5argo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c597f2-7b15-4593-f2cc-08d9572bb33d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:05.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba12luGXYEtXDeFTNhMrsm31N4nFDu2MYL/DKfaXpfIwxNT79UPCFB1OrbFCIpPzIl87fq1H0Aw9G5p3SuJIlDRnRQ3dSqA1Oev2ZXXNYzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 78ee255fd0..90664ee0ab 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -291,9 +291,11 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
     QLIST_REMOVE(task, list);
-    progress_set_remaining(task->s->progress,
-                           bdrv_get_dirty_count(task->s->copy_bitmap) +
-                           task->s->in_flight_bytes);
+    if (task->s->progress) {
+        progress_set_remaining(task->s->progress,
+                               bdrv_get_dirty_count(task->s->copy_bitmap) +
+                               task->s->in_flight_bytes);
+    }
     qemu_co_queue_restart_all(&task->wait_queue);
 }
 
@@ -592,7 +594,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
                 t->call_state->ret = ret;
                 t->call_state->error_is_read = error_is_read;
             }
-        } else {
+        } else if (s->progress) {
             progress_work_done(s->progress, t->bytes);
         }
     }
@@ -698,9 +700,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     if (!ret) {
         qemu_co_mutex_lock(&s->lock);
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
         qemu_co_mutex_unlock(&s->lock);
     }
 
-- 
2.29.2


