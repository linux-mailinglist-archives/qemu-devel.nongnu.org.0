Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF86EC911
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYr-0007ze-IP; Mon, 24 Apr 2023 05:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYa-0007h1-5x; Mon, 24 Apr 2023 05:32:24 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYX-0007Rb-Se; Mon, 24 Apr 2023 05:32:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ce84MDfUxnN7rDTy1GcwU3E5jx6JKXLr4HRJ7ZWHqckRzXEfwmtL5w/1+X+LlyN2kjQ4l/1DTVh0b7tYgFBaOsieGAsFugGpNWqye19oJfmdggEZbr92QeTQ12mm8DhJI6+R33dw5ni58advhmEGhq/H7koHMCNY2dvVh4tFxhlcxKer6OrKqeC0eOLldSEvEpquQS6XbAsIvRKleFQiQXuBam40dY6hxZQJzx69A6iZ50kJEEUd2T4k4MwslqGyeQTqxhWMtqKw4Tca0JKHqzRiSWqFLN7WGokiWlnUc2Z0w9rVZE6Xk6PbJ4R4XBIbKO/UHctdjMPzmusWySocIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kedXKnE+fbWyxSCs+643SW7HHz6rEerQzrdQaqVHiyQ=;
 b=Py5hv73plPfIgCv1XOnLBfzKaiy56/OtOxi/1TCopjhNV9sN5doTRGlpEzGJWi5fX44RzakoPVrftaMkAWsFFAx3t8XZ1NppwL/NFmSzhweoT00DRCfDZj33f3AFtjw4SHpwbeE/OcgLnGOfZcIpAVGuc77fd0dzRRPtWzlNM2L6PigANJHCKAr3nZ43gP0bkZfLu7bKWkk7tg7rzxaWS0YMN/IEM3xGi1vl5cNOltAkI7tTgnz0yqfIB9kDt4BKjdlioOFSMSxs+arR5LiBfU5pPtX7IHvTSLVZaFR3pYYwBZKKs+hla/3JXcKVz4vcs47xuTFMhI/74LwTvGyb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kedXKnE+fbWyxSCs+643SW7HHz6rEerQzrdQaqVHiyQ=;
 b=CKOfkqP4hWhXmeMP4c3wGKZK0YNhUTTi2gKtyGVh/Nv+ELzpCjzyi64aLnrlEzYIl8V313fZ3/C0raYFrwclK/jDBQjDQrTLlqZqL2RB00eIZ72BwBofOYm7ZIGaYt1a3xzYXx95IPf2Ueh6thsbWeEkA2apvnx9lbwJeIfa4y3pZ5UetJOQW/0TGUgwu5MiNS4PxP7IApsbgvyWrbZkrZmNxGq5ofmDgfu+u6FGa9gFwl6rodfKHBscQKLptrwD5OALi6ptGZ9sJsIMBMbTDoNkqltWjeUt3kBVyxvAz+OYCJd0uzhwFMR7W2udaARksFI28A5RXWztuRaKjr9CEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:08 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:08 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 11/12] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 24 Apr 2023 11:31:46 +0200
Message-Id: <20230424093147.197643-12-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce204e1-322b-4966-cb50-08db44a6c657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wyr8l7erF6suyABKFnBTn1f+xS0+wn8dK67kSx4JTD/975tfxH14Jr61q+kgXKLXNZSO8PA9R34O0Dw5tY9lFQFbIT7IRZc2tQO5BFqFpQCVHK+VK9y7iPWclPl0jqbc3eXHU+2xIcC1FUiF2fBMi+17ZRpwJ3nT2reb+CWooz9yp41EKCCytG1hvbAYk2Wqyb06farIxJt+/qZmi5q8dcKyJya1StL2V2Nf7etpkCI9SEknpj/IIptZgNb4+MNo0INYoF2FvVw3+MtQVLZc93Qk7tHJIMXeGJp0XcxuczT8yoIu936A+IHvnW6r216yW8pm7lo+DDBhqsfBmvBaGryseT/6s1Cr7YQXLUouVTsGozDQUKy0zDEYhTBgTgRPdId0oVd5zNX2MmLslstrNU1AGz6s6/VRnNoAOp9xote/jlS7tZNxUdmI+xWNd48IkWI1V2Wr//rarMeZ06NmL6eiK9dHhPI4qxKQC+aAb+/40lv+rueQIHRnwbR9+q8x8eE5vWljBwNwLiBGA3ax+BPGFsuvV5E+LS24Ym6aXjkiP5G2JUDsR6qN0NsXucNv2G4qNjOa7pj5XJySWYzv2Af+PfdHrT4V1z9eRlZp7OtB2j8ABVnrMl/nKeNLtBIh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ISrOLjlHGq5C+z3I+x67007ft5HH6/nZqLqFVW64u94e/u1YqSa8phvnVGlM?=
 =?us-ascii?Q?m3Q0CPcsesZAA892ym1kGWtfPjFzP0/7C3jEWhWakD0r3iFxCpxZ11c7SxT6?=
 =?us-ascii?Q?Tc7Sut/4eM2QXX93mZlTepdZ12wW9h132iOHnCdUSa4d2ROCNYOsleLbL9bj?=
 =?us-ascii?Q?LbLPOnz1edk2dfwRwo8MbEfWidDcB0BZKXUBYqDOpjr2OaK33BxCrmFFQmvL?=
 =?us-ascii?Q?TyXChXW+iQY25fWQJsWp1PXsQS/EnMZWIipQM6PvfvKnTGE4L8b9a/tunSMY?=
 =?us-ascii?Q?gCg9EE5lbceMhRfb4EeMNr+M+2DXZPCaGPzBcnp+UJ/f0NDt9rNbkd/1nwx3?=
 =?us-ascii?Q?RFiqvDhMcBNhEziEGM77b3k8yebQ1W5mTylbhvuTVq28bW9ihXGaSv2LztvR?=
 =?us-ascii?Q?uj+e93EJCDZ1vR5ubaQJySLzR4ET0KLDH/3erxImnXwMDXUIvGmf2EyM1npZ?=
 =?us-ascii?Q?3q+MRevH6K6LiiYqrXlF41s6en3SxennG+O3oRG7lqt5K+JMPKBiw66nZ4+y?=
 =?us-ascii?Q?ov/ezJCR3sTadtdiD9cQ0IKKllFaM+6BS8BJHIC7Z17iZw4lCFsXjxv5WSNh?=
 =?us-ascii?Q?AlkmFll9Pw3Db9pnPyrmVqOvoSw32dclW/8ajBvmIDxROSYtvHzMUnCstaCv?=
 =?us-ascii?Q?I+UO/2nOjhPVZQsQ/V2y1A4ai+SKeOPil7hAioNGh+mFza56R8pLflNQxHQS?=
 =?us-ascii?Q?/TjVNvsGJu1CJjQ76NbfBxH5pq6bQ2OtmW5/rk3hqbu8hVMb0H1d3v6j/xHB?=
 =?us-ascii?Q?c5XT5fXvGx/1XWTvZldfT2UQDWvbIOwKcUP0tNLQTA5uIX7YTH2VoydJP6DW?=
 =?us-ascii?Q?Pxf4GDO+/BuhGM2oCj30unLN7UMUUXWTnmT1dZ6ZA1zfYhKRwsdVfLCe0bZy?=
 =?us-ascii?Q?yRCquj0SCBDtz2oUNEzH9VQGVIYtPNtWOYJX6xaMwFwmjwLhIDKKIRKZbSL+?=
 =?us-ascii?Q?Lw4yLm6kydRavdxDqgQLziUmjLVkYnSsvTN1E9QF3j/+pMO4NyhlsAjaWe3E?=
 =?us-ascii?Q?YVvUAeFwD9rfjxxsqknnJoy01IoXPJ2Imoy7rv7sL7qrsZJrq87My1YqG9oy?=
 =?us-ascii?Q?eQ9vhMkNdABuZloFbLBoVJYXC/lyqG8yAbypuo7jCTNOeSBbNQs1dxg87GMW?=
 =?us-ascii?Q?0EGE/tZaA6OrysgXtr7gwNAkZ9E5155/ZQ4nWRVOe9jv/C7IEKC/UqSWh4sa?=
 =?us-ascii?Q?XGKptxsVaiWlfzOQOFFmPlIP4GwtZjLSiY7shps7OrGzHuH+Z14zxFcS2boY?=
 =?us-ascii?Q?vUeKVY8OQ804Yke+4BNSsYDRmCJK2IWa4hDVqj2fXYxyquVgoFISIZ4ZdEJu?=
 =?us-ascii?Q?zzuGvzAJat5QEfkO6kUgwm+ykSutwVJTSeTlWB+wtss+ndU5BQE1BVSNvArv?=
 =?us-ascii?Q?7Rax6EEADlfxrC/mIPgTmpkI2znLznFfPG5JJxDe5VbrcowYVdsJQz3MgubE?=
 =?us-ascii?Q?3mvKPuGjsYGqM/NScjjgZ9fIYa5DC4dKE8Y9oSL73t531k1nkANnzbrGIoE3?=
 =?us-ascii?Q?4WkXwzp8Ap0CuL8TMahpQsz6utAWy9BCSqGvjreetnw9rD2hXuyb8C4NuZPl?=
 =?us-ascii?Q?ltbOzF1NB7RN5N8VvQfN+9hDnBR63DbzzRsIPZdF/fmwTHb3thArpBSqfdo5?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce204e1-322b-4966-cb50-08db44a6c657
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:08.7150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go9rIZY0znpPrGMVjgnEe36bNeCLhkuGyuNFCX9vKzvsugP/FqLBc+cJvCGBpa2dU435pxkohaqiNFUb0L/TY0kxc/dQZMmisTvvWGXtyl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9487
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 48ee5224c7..a6a1c7ce0e 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -562,30 +562,25 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


