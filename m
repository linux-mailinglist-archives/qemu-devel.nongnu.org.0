Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB13FEC4E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:40:55 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLk9O-0007JI-OK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk77-0004HX-2l; Thu, 02 Sep 2021 06:38:33 -0400
Received: from mail-eopbgr30115.outbound.protection.outlook.com
 ([40.107.3.115]:38273 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLk74-0005xI-Hf; Thu, 02 Sep 2021 06:38:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkzsgDgHRUmEsh8JUwtCsbRj9mDJA7VFxXlGbh4wfHrcKnP4bXETtse/b5KMmgriLwjshlhKlSvOLHr4gGPhNPaZ8Z00rUm0k69jUc69hYjE4zQ5zptWlXO3pgyeUlXorLK6ps7JcGqc1eY+l5PgIp6FYc6MhJFA8XvfyV83kBTtoHYu4O30E2vTiPXeNCUujziwn+C4qMdX6XO4PyaufsNsSXxPeCmNN+AKC2y8YJSigllcPl2/qkWlO+Y/gJZ+vzITnbMZdu0VeW9VqFp0F1bRb0ifBKF5I3NtgEPahXZa8GGHunK4zFLcMCavcsKXI4GL+a1Mmkd+p8hTmxI1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dTm4enJTHvjAfmrpTfyVs1BEIpzvYa/LwcXeDPe6c3I=;
 b=gQ9uDE/3GQwSg5XAloAB2pLBCLozhAJttxH05qW+dahu7YOJ7ErzGiAd9X9PhZOjVU7+hwy8vk9l8qLOtM8mLOi85m8t7oS1bY3Gx2Ksyy2p5yhX6gCOrCMUxTkIurF0FKfUTGKgDHX9XBT/EWmX3tv6ZctHRQC3hpc/7AxdY73wMaE7uyXDPaIn1veluTuKGEyPPFgNpiR+4MomTu8LDPsZDvnihsq/OABWT2ltcFATKZQ5H2DWvf0tSTdElCrMtbHFxMbxKwJSxktkKSumDTkoovXJHNWwOZo+ZAw5rYIk+hjyJGRVTc2TVQ/hed94pfkumPN/wKXvEL14/FG3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTm4enJTHvjAfmrpTfyVs1BEIpzvYa/LwcXeDPe6c3I=;
 b=al/DU/m2tgk3U31W3nhYm0NCg2kWWzGm+llS9uCeR80846cJ0bZoZB/CqctfPno35OX842UINOZokSR+u/ZBN8stts5kxsIP3JGHU+4u9szYkXcc6ERHPCnEbGpv/JI+e4Ld67cvpALfGx7d5363I4Wcsj9RpYqrl7CAe3oy9Lc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4472.eurprd08.prod.outlook.com (2603:10a6:20b:bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 10:38:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 10:38:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rkagan@virtuozzo.com
Subject: [PATCH v6 2/5] block/nbd: move nbd_recv_coroutines_wake_all() up
Date: Thu,  2 Sep 2021 13:38:02 +0300
Message-Id: <20210902103805.25686-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210902103805.25686-1-vsementsov@virtuozzo.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0037.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR0402CA0037.eurprd04.prod.outlook.com (2603:10a6:7:7c::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be8f96f-8694-4e0e-4035-08d96dfdcab4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4472BCD6FBFA4E025A2D3A7FC1CE9@AM6PR08MB4472.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aO6HiVRwy6PXBqy5EPHtd2zAoNquO/H6ocVDrXcfSDHPv/O4T/yHkU1NYKbPBp8s/lsxDNCj3fKZLXyDvDr6TMTReD4vo5aWThOMzHbH0sM2LxGa0ljPL5TjEPjYUImKSyCLxNXSBDAHigEJvZnJQjMBEtKLhYaw4o7MykbXx7l5oMkj2Q4oUo7iWtwBUlYZEFPcjGv319zzzkxrt4vM6oBqBxbO/601K8gygc46882yAKen5hnfEpuEylntwBSXEsFnEd2AxwwwF32J9UMywHUdQuHrKkhU00lhJ62Q7nPT7ustoBdO0axPVtYh050iMZzc6es0bR89n881WI4V9pqwJCIjI5vBUV03MWG9mIJDXpGZ6eVZYXCaxhtk1y0XcVV9hYOKO7pozSmF9X5FkB/Bi+AwQyRDzn4R0tz1rFBVKkkn8IJPgF9syO1mOyYlqS6J9iTFfjSc6u+JcLCGeKzmQls/s1n8b7O8SodhgmdTKdWi8W1BdTV+iqUSCJ3wcHGU1TLXfRbSZZH+TYQDZ80x9soi+xwkCBUfTjTwxXuybM5ip91SCI0QogMVuHAAGqPcTNz9ONrviugnVSi6vJKsNIlU9tOyMzdN8pBY3Hx5hFXx6OG8yVROzkpmC5Chs/BccePDn9xxejSwZTk9qzERPMx7Rxp3QpMXQBm8B1J66+eDx8MVDZbCESzCvlQkcEn6Gv7tr3zrA6bMDJUohQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(66476007)(4326008)(26005)(6506007)(66946007)(6666004)(8936002)(1076003)(5660300002)(316002)(83380400001)(186003)(8676002)(6512007)(38100700002)(38350700002)(2906002)(107886003)(66556008)(36756003)(6916009)(52116002)(956004)(2616005)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WPwJnWmCEYAd9ADxCMH6RhBgUI6PUCmv5nr7CVi4r1J53+d8BQRrCAbGBJae?=
 =?us-ascii?Q?TfvE7aZ4L8NOE4Dgkl312Bc2kzIuxfki6vqk7uUEtwvPxfGi25wKwD8T18np?=
 =?us-ascii?Q?A1LVl1zW45kH+3FuoCVps4KLHJsI1BB8EpJvR67/zq3ORlucIqQNhEyREzRX?=
 =?us-ascii?Q?a45BMHwWCXUZoK5YOblMNUN15c/WQn4yx577Ci+Ii5A3sThsKEnCzD4okAdi?=
 =?us-ascii?Q?okzROtyrK6yfmpKjSB+tgY1FFMV+XTydBM4qtMWGPD7SzKfCwoIvrl0obz9z?=
 =?us-ascii?Q?fQd8h/xSGc38jn7u3DyJnexX7wgnZUqcVuLirqUp0pN/4krHOH8xVZtFCK6a?=
 =?us-ascii?Q?Bc642Y4PKSGN6NjeXHAewMxpOgu7/ZYXFHpa5FSM8tHwaYtbrn4lJteeeVvo?=
 =?us-ascii?Q?aTmRj1eFivmm6dZQKVDswQgk1GyJ1ZPc2AZWctKlAeHJV/ChiYua6dRLCFyB?=
 =?us-ascii?Q?cp+jj86JHSL3N6y/cF8CE8uC3F/62PGzJokS5yxmWdtLvQFsxHQX+ePpSJ0v?=
 =?us-ascii?Q?pfyRtWMctP0p7zCki+BCr5Z0zukInEPFy4j0sMOAsUXgdEqQ5BUKGVAD1phB?=
 =?us-ascii?Q?gnDQv4ouNo5Ut5QaYKRSaPX5g2EF7hRy60ju3kKoLg5tGhBo/m5Xjr+OGPnK?=
 =?us-ascii?Q?fht+D6NJYgpBDYV4YgtbIZfwrEq+dR43634ZEsTsF/KG0G62+eJGxS/QNnxX?=
 =?us-ascii?Q?4/e/7pLkn0huGIURpzzSIQqXghcWhCAZ7HCuzviMqJNx66Q6B5af01l+Psny?=
 =?us-ascii?Q?8v2/OaVzbHsb8qhtXU+Xhun9arcKSy6QXQMRz6LK7yAVEs1iDEXqfPt7Z4/q?=
 =?us-ascii?Q?Xigsc2dA9JLuSER0il3Koa4dM7KI4PTAjtR3UnfSwe/kg21HoS3KoqTOw6+G?=
 =?us-ascii?Q?uPfegztdBOrqyugeB+FW9vgdfH2l7UTie3C5ODSXmRvlWu23mj+bPOxjLYyh?=
 =?us-ascii?Q?n7px5Ti+DY1RANMwVDXKN0GQ6xxOPxpPED5EE5UeRv7ivG/eG/3a/W5L+Jhk?=
 =?us-ascii?Q?BszE3RrBqbnzvYQiq2Bjw2MqeZXlWgQiE2LRs8ABJZiLCekmx8y7cHkfGekn?=
 =?us-ascii?Q?+DsNykvMH8QUiumaVxAVYHCrGaTyuHIOHEHyzJDuoExGpKQv1/YFoLACHxk5?=
 =?us-ascii?Q?7y41+7ipeCxQnHIRWiQdHI1PiAx2il7zZOTTpZ8tj4sjzN6moWvZ/hfZ17qc?=
 =?us-ascii?Q?NRBEJhdDepFJJndo5qM3ilEKQmgLNOlgJPm/pkNs0rDNdlGaui9ys0nqPYky?=
 =?us-ascii?Q?XDOVjwZ7yDQh2lFXQ+yblD8hXaG/HG964jAoctnHPCcfUXJ+Wr5plybP7c0E?=
 =?us-ascii?Q?Q29tveAN7GQxpqDGibvQvLsh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be8f96f-8694-4e0e-4035-08d96dfdcab4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:38:24.5834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rWXPVkombbVMts4EhXy6UPVh86QY4t5KyMjcNxNwH1W+IMLLiLzoPlL858xDjJkXfu+zcHYxBjJqwjaKUVC/f/7EBxVQWB7BI2DK8+dyBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4472
Received-SPF: pass client-ip=40.107.3.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

We are going to use it in nbd_channel_error(), so move it up. Note,
that we are going also refactor and rename
nbd_recv_coroutines_wake_all() in future anyway, so keeping it where it
is and making forward declaration doesn't make real sense.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index d88f4b954c..32e3826ba2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,6 +127,20 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }
 
+static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
+{
+    int i;
+
+    for (i = 0; i < MAX_NBD_REQUESTS; i++) {
+        NBDClientRequest *req = &s->requests[i];
+
+        if (req->coroutine && req->receiving) {
+            req->receiving = false;
+            aio_co_wake(req->coroutine);
+        }
+    }
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (nbd_client_connected(s)) {
@@ -143,20 +157,6 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
     }
 }
 
-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
-{
-    int i;
-
-    for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
-        }
-    }
-}
-
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
-- 
2.29.2


