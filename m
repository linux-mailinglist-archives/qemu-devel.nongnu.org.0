Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845AE58FEE8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:13:00 +0200 (CEST)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9rn-0003VU-I5
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gQ-0002fx-SW; Thu, 11 Aug 2022 11:01:15 -0400
Received: from mail-eopbgr130137.outbound.protection.outlook.com
 ([40.107.13.137]:2827 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gK-0003bA-Km; Thu, 11 Aug 2022 11:01:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahMIEYC3HqN9ttnq/HfNBSBHxgko6yvQyBqEV2Wmb/kPhxoKlpP5h/aPaPCypBcUrRBb4xB7/BvaJmUPXX8uwh/po6+0lpP/LYY1dLOWL+5XQ1FKHy4+/OWHR48DciOt0mvXc+aIg0wrGO0KmHxCokg33HqpVpSKil4iSUbmRwLzpCDjVvKXofvdU8JSgHg/8OSwRb55SCXl4EKQy/TwnCoMkFHzapEcch+i9ijyZ0ZYES1ZB8iT93PxoVXrG1sZ8acrqLaxHPQ3ZbxsYHKvZhFcyMWS/AKM8NRoW75SYLgbK6O9Yur0s3iT0hM61hRrtLI1e79w4b9ErsiNLbCcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUkVh6uTzmKJnMhNxvVODYnsGe7IURTC++YBJVYcOGI=;
 b=Rb+ncNwyL/ZnhBWYwxZx5efSlBN3taeruAjiz6JEVzoa0qxVDYcnstmyX/UQJmRFJ8pgJcXkvas2QQBmvCl/cw1FLMWuTk7c9reAzS1kG5h5o3usLSY39Yp3kOVwrl/mYqb1fjWXRdiArOR/Cti1xHt+6l2up672xQDDV7qMfgZoRAbv5eh81ObfKm98w66OamnegvEixyXcfLnB0kbook/nJNimYQZrGO32NeNlo4hN3GvEHk+iKE0kyOfNwqFQdje51vTkc6ne4tMNtADxBHR8q+qDUojWhUwTwRHFgqAOT9tdQHwJC9Cq6yBcwM7aHIm5j4+Wqug0bNsovoQ4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUkVh6uTzmKJnMhNxvVODYnsGe7IURTC++YBJVYcOGI=;
 b=ehZfSZ5PsUVg2FIKNqYniure9X6/mZeJhxBuYafRfLCVibH+2VWT9cQIYU4W4SrJ94P6yhOMj+u9gGrS9yUBoMI3zh0VccHwVXUbcRVXTRsizlb86Vd+X+hcWay6oj3HS6q5pXLEdRAt4vtAU6ufltDK8naKDWQDBv/yrc71nyY7zRO5uZARiSRHkI5ZVVj4/rjF2VoGQwTXfxaQ1HWp+/80qtUkBT7aAIpSxA021Z9WYT2xjTsQ+l6nNEOTWY0krxdQ8pb6XF484A5sL9UIP5PU4vUCwYeCpEf3bE4elT03uw4AhXpegx1M+/AwW2xvIUU9VjaZlUlCK7dddkeSnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 15:01:01 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:01:01 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 8/8] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Thu, 11 Aug 2022 17:00:44 +0200
Message-Id: <20220811150044.1704013-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: badf0d95-85a1-4175-a202-08da7baa4deb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bW5nFBYlPCZIalCdg1dVl75C7bdbKJvwSKk3aBNDK8mDyIwCayG50DJ9mikwrazlev0LjgMMC+PUkJ3KQTIJaMfeVuQAUpbtnxe6iywN1tK6Vyp8u1vByGxfTPrs+b6sg5VMUBmXV54qGVo4/HIKQv6ggesTq4K8t7IKkuSH2iya6uZuCm6T8TOGlDC4MOgmZcAqbjRE0uP1DwdC7J3iq4S9YBftYQuoaqnaoJ30Sq7Unbeb1RzZZCGz4SDe7gd21OQ/4q38ETp0hhqZo5dD2mK41DWUkBlk138WTTta9qWIjk1GhLqmmZS4bwbru0djfeoXuvPQdS3un3yiebbJ25UW9hGHYRVMKR+NAdKsH9cJKKrfcyaS2fA5V9Nlesxkq2m+icqaEY9d7+W6KpUyG8BoRC5YR9c6cZSH2ybER5At02Z98rL/XlPKAszQgk+Q15H8avNvN4O0Uu+mSRtg1k512m7WFTcNZplxgnJWjw8o5DK+sJ9NE4+0a0gP1p+iA1j43FYXKN4AE4qkfk5KMnOYaPKrJAXfc+KpAZ62ha08w1uVakRVDV87LLwJm/HeXkQK/VTmhx0DEw7f4uwxA/zGOfI1KD+iYEsjOP+vE+CrnpR8/BE4ri6M+G+Jd3u0NzC8qGhvzdWpjKPRleY/bsdpGZv+ou27XQlIge9If1aah1KevUPvc2+uB5yi+wxysuDL/p0/xH3xj0eR35ie0bleW8mFOUvvk52hPybAnocK5n/zA9RIZpHS4xkjv2JJVNMwSHLjtTkBfJ10OyzMLp/VAIjW9xBL7vVIyuolX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(316002)(44832011)(8676002)(4326008)(66476007)(66946007)(66556008)(8936002)(38100700002)(6512007)(6506007)(36756003)(6666004)(2906002)(38350700002)(86362001)(5660300002)(478600001)(6916009)(6486002)(52116002)(41300700001)(1076003)(186003)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YFT0jpbh2TK0x8zhCkoQ5c/wmClalrCUg6tE3uOt+ZTqsLYoDXDd8ieTdR5P?=
 =?us-ascii?Q?OVgfT9rQKYTjk1+jubKmnpt2tQZ0XjBytsN09HAtDJZDnZIPTX9eR6ZQdO+y?=
 =?us-ascii?Q?zvcjJoROqNuhGulKOBm/4erdU/M/6A/gJUCuaib02DoPRVfF28piCbV/eEya?=
 =?us-ascii?Q?a11nugns7/n2WGOUWUOfzYQ0x6lwDHpFv/vnDIczEtFst1TokjNk/L+m21I+?=
 =?us-ascii?Q?9AstXX3bA/UyfazzzpBP1TAWK43Tl3zA1yKxH8jzVAx6OTxxfRPyAW4f+WtK?=
 =?us-ascii?Q?kNU5Cr6fLyi3aaHQt2/gw9rQ3xG+DibPEhno5MB98EL8irHr7DU73zmiQWR2?=
 =?us-ascii?Q?+ob6Jyb0w9L1QUd+kvK2eljiAjosNAeEP92SOV19LxaieF7Q6d4dEapCSBOj?=
 =?us-ascii?Q?QZHWdxADIOxB3L5DSkpQsOE2XvwmoZmJL7sSlslMeB3Cm4t95Tq2BLF5RyrY?=
 =?us-ascii?Q?O0Lr+YbAbrCQ9peV+5iguac50k3Ev2Pop4C7yjR+bfhi3lQXEBk/0/0x3f7D?=
 =?us-ascii?Q?ui4kmIr0FRLaAO0zn/ZODh5jeW/m4uqq1qHoqjK1lNU5KR2PmbNmjhhZ7lmZ?=
 =?us-ascii?Q?7foFgsl8V/9o6cEfLfqfNShewA1lcwnRQEVeug4k/9k/MnXQh8DUv2SrjAKW?=
 =?us-ascii?Q?/tFeAm8mKDpnBa+IhjGsze4re16z22pMEpTQCeYuBNWPsOP07/QC10OK/X07?=
 =?us-ascii?Q?iCsAOi+nlfx1VaouZ0pYYWqmbDcVUsj4gYamP4s4LGJoFvWrIzTlGihdaRj1?=
 =?us-ascii?Q?sL4Vif6Xlzrn5nYZMWeU4NJ7rSxq6xteAek26t5adq1xGQTfYgK3TEwMuS53?=
 =?us-ascii?Q?G9boQHllgZ/b1EBYSRuBlPjptkGcpFhVssy5LzfBa9Ehr6z3HQPFiOrbLY8N?=
 =?us-ascii?Q?2FSyF4EOIsZFzEWYA3M86U071JZP2KkaB90OR+N1NDZs50TUYsimGPA2cT1/?=
 =?us-ascii?Q?jdN30ue/bTUZ84ZcLjhcjeESiEGMFi0VBFcis7HsYovM1PmfLInE3Kjo7dih?=
 =?us-ascii?Q?crUpeADz15XOyq1tC6pyUlo6a//ezofE9F2EAiu/lgeuiCWMaBgrRJFntjji?=
 =?us-ascii?Q?7sQsig9LJkZGL6HG47ZqV3W8gArg35sgOPNvATwH2V2kagh+RwwxaTY69gLo?=
 =?us-ascii?Q?Q7QEIqKGV2b26Yt1Wzk7l3stekMdCHPfETVh0XsVqYAe5a6pqnj9G2xith7W?=
 =?us-ascii?Q?rR8LHK13oCzeWoJy8WCp9zYnKTIcg2zHMdqXPhPQrzD82wzP32RQqrxM4ohw?=
 =?us-ascii?Q?JzCL/BVnqP9CxYVaik3QrPnpb99uVMQBYq6JpJTWsR1NOtby7BYGx1FoMWJR?=
 =?us-ascii?Q?LPuMfQND32/4kekBWcHC3qrEkPscMAo73WURE0z2dkHvocSEvMuV+vq3ofny?=
 =?us-ascii?Q?KlBQU1FPbF6tQfPKRldYhjAyAOPexCkB7gTDGd19kqf68KFcG1DckAsaXJaV?=
 =?us-ascii?Q?oifPzdY90q+0cA7/6ZWOu/1kvYT39pVCqdCG3ATGIAGD3PyMkEgRILISoFMI?=
 =?us-ascii?Q?8l9esKT4TjCMxX0s+hddrmKIF0VIDC9wC9E22QMDXhfVj3sBUZbIWqkJFSE7?=
 =?us-ascii?Q?yaj9HM+85UV7XenYWj8Zpht9mXXA6Wf2MJF8uxca80gEverXeerf6J32ncpG?=
 =?us-ascii?Q?DvRtSVZUVyoq77pWqD8DgSE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: badf0d95-85a1-4175-a202-08da7baa4deb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:01:00.9541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Orwk3b/931Iuxkks8pVBWH5LDdWHC3KRW3ZxiFQdRcGRyBx+xMWa01SurgIPbna1cbJTQenlSBL/QX2kUCJg4t3Ryl+PhbnoCwB6b9HG1rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.13.137;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace the way we use mutex in parallels_co_check() for more clean code.

v2: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index d0364182bb..e124a8bb7d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -553,24 +553,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    parallels_collect_statistics(bs, res, fix);
+        parallels_collect_statistics(bs, res, fix);
 
-out:
-    qemu_co_mutex_unlock(&s->lock);
+    }
 
     ret = bdrv_co_flush(bs);
     if (ret < 0) {
-- 
2.34.1


