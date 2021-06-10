Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6083A2916
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:12:20 +0200 (CEST)
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHff-00038v-TO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcn-0005oj-KF; Thu, 10 Jun 2021 06:09:21 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:1541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcl-0005Ca-N9; Thu, 10 Jun 2021 06:09:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQIf8nXkSex12NdKxkJKnPDoCU4++PLDwONEf1MEWkCERT5fL1M5Q2BpiHgUpkMqtAERfc3XjSE1GAtLvq0FcpEYlr5Q1Xgcyxtk4wSRc0SqCy0BRrJfhD5M6aT5ltce3NmYVGGA/s7xgYGq+Y0jI4P6tidDSiyTbLhrivjOQut7JHU6lMZGrd4VEF2EeVQ4/Xx/LIzXzZSPEe92o+60rxFbOHBhvwwUAMPRLA2MIfde8NSwGEabia+Ikos7pN3c6JkAbWBtpIwHwWC4BGJRKdVhyg5Nug3HCLR5dZBGb0Pa+SEquv7FUUGjF6X5U6/5fjefN93aZ8J6S2J3GwpC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMl2+NCdwQZqbQ9Q/cMTfQ4GXwKU5TwfkTx+1MYtlEM=;
 b=MJCDvWNllyE/L0bmBESQsY/rTmsbnUa6jcGT6LsMUCYn4uK9c4ow5fNwy9yKkrLnG9MZr3cILuudTOATQ63KlpRCmf1r3Mv0aFlRC3opAsAPtZ0JmOnbAz1CP/pWMOdh8DwuUM2RY+/vpeVsYLvFzQEaXMyv1X3XUXE11f0P9/XVTqw4HeA/6C2AhhBN8EXPF6l8yJWxmUvNHM9KDdL3jRxIN4Vo+JebZzW2Zi8OfBZp4MrCoXWgbEFAnsVmK5aXJM8s4CIPodJ9B5Vw5/Z06L4utsLhPSUVBoUJ/sIhm1Y1BCIhDuyYuBI38JOepSBJt2tkXwsfWjwAdgoa4h/SmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMl2+NCdwQZqbQ9Q/cMTfQ4GXwKU5TwfkTx+1MYtlEM=;
 b=f4iR7dfudQzJbcm+nzxn4/u3RTHUohELsod6HN7uFSVvoST7QBF8pST/fWnYKwcnUw1klpUz9wnqPla75nSrt4MmzBHb7XMEHE2+fD2Y1+f402758Awa1GAsOt0XoJb6bPxYmyh5bqBFYBB7owKE+7E6tpMcsJbHX6d9BnfNNRc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 21/32] nbd/client-connection: shutdown connection on release
Date: Thu, 10 Jun 2021 13:07:51 +0300
Message-Id: <20210610100802.5888-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e7a479e-8d48-41d1-121b-08d92bf7ca01
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67903E63BBC5E5E19D43332DC1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOXCtsLCvj8QtzdvBmmafDawXAJomx7Cbv7R9aNvHT9vy482ZpckPv34b/eZzq6Qn1r0vVi2hU0eLR8lFzJfeqpyBj09SKt4TlCynleiA0Xy9jeB/e2Yr7F33NqV6bzYBev96Y9xjgDjZbWZK1qkLotzND6uNo8Z0ObqIUKjiTQtRbdeMlFj2U/5m7BLhiRAAlCGJ5xMh4092AMoztFbGZH7/9rxEiQB+Hqk9XM9uyhglIx2b/7b0V5cikrzhFAOTDEGudCxn8cjJx6c22aAmFaxH0ODSDaV3VvA/AvLq4IAn7x1l+n6W8VNHr6dMDiQM8Lto45be8w7Mr9SyMZjPhjj/7kOX6xVw579hPFgm/suxbqa35upYE3Sj1Y1nbep7zfy8Ehg5RJ+KELd5AHZfjgFBVC5Al3PNAr9UaXyXFPQMnZnZLw2Ls2cwbEyp0ttaZKacHdSc6CIs1mQKAshE614OVSlWTxId/ZLi8t+kGaZFQVedaBlX5xOMUoFdcJ3GezwZ1QgRzuKWV4/RmXZoGEPSQE58M5mG3A6DX/hPntvXpWbLYmi2aRBu5hgLqB3KJQfZyn0fbvCm7gFLNbFMgkP1QdFsjnPqTummg8E8uQb0FHn2dVN99VJZp0gwBUhzRnDJVWBeIGRG8ywteLO4sIVd9K4nc6dh22xjB3gmzEuv7W2PXTWqSdzY4DEiv2c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kP/rJ62NaSseSnI/widZ5qWqphZasqnXkWLUfWIkFFnj9Qq96Ar+Dj8tkTgI?=
 =?us-ascii?Q?j24ER4iFuuoi2gVXRCqALgvYR7QuFCdbi3B3wWqKicA48HOCmNeViIi3vgnh?=
 =?us-ascii?Q?U9TCDSyFSfx7GVHcpqbDlzBHycUDAD5+GP9fIf6XP9pUIvB2QTWFo6h8KC6x?=
 =?us-ascii?Q?jVH/rQInTytgMd1G7KAkgXKYvGiHZB1Czo10RkrmfMLJXK3Pi6WxCtC2sn6S?=
 =?us-ascii?Q?+TXj1DBkC1a3WskJr4ighUcM9uoZmzktV5RxPh+xU3RK5RW+pB/7El4cTjg3?=
 =?us-ascii?Q?y428BJEd191SSczNl2Qz7+hvCDtmv/4kPKwS2KAT4/aRI0tQJ6B2ht73Lcjz?=
 =?us-ascii?Q?ZJ2OqobCcJ+BmolasVz5hFIaYrORVZFbMfkj7YrdDdJ2cVFvoAJMGf3QO0gU?=
 =?us-ascii?Q?vzQVHBlC8qL7QnBQFiRRCwDNV2oy43g7dFxbc+kFoZxGh2KtZTECG6KxKWnS?=
 =?us-ascii?Q?LmxU3UUhZ8snU5yVuW3JQnGbn5u4RIIAVBYYEHmebeDLQ3iIIdwgEZf4vRN3?=
 =?us-ascii?Q?pKwwWWD2Mzt+2z2N5X7DiFRX/QFy9zyDXNWgNH32hF1oSts/33wFQCkEWEVp?=
 =?us-ascii?Q?73j+YBKontgRvMf1L5N6kC+y5nclL9E8iTNCKLy3Cmk67O2vOcTIEOb7Gd1T?=
 =?us-ascii?Q?VsK/dlWzoeWhX+oGOb8tlAkn1Gjijay/ZOxJXlalzI7nNY6macnxeR6OrfRx?=
 =?us-ascii?Q?aAUhXpt8qlvXg4TRzdTKzBxwuP1Mxu8MflClHFsYQpP52AbkHtoJIHoWUSPX?=
 =?us-ascii?Q?kGRQM3VmNNhVExbDLDIT9sk1hOb80/CDCa0el8uPV5aIBVL8caJ7rRlGK9fq?=
 =?us-ascii?Q?beoLzxM+yn+lj916ZODRyv1CE/KhCEVXCOfbyyxX4CWC8dDQIe7BUGXngUQc?=
 =?us-ascii?Q?0GeMUyhznoBm0JhrjI3Vlsv/Zk0qzAeR1qHKIO8G8SVbUTkhppW/PiVTw9o5?=
 =?us-ascii?Q?4tzsD4RKMJMLXxC2r/drt8jGi+HUkyNiBig3iF5rh7rR1Gba+Bd9H3f4jDv2?=
 =?us-ascii?Q?P+K3N0DWSzZeib1b3zgb0iaesFLRCt97n9Gr9lFbJhowj/rVckVUPszThdAs?=
 =?us-ascii?Q?QKWCMF4u1m95fz+L5GNnNYjSb0aA+SRx44OoFjxC9g36qK99aYo5mFVIXJqW?=
 =?us-ascii?Q?7+4FjD2gjtuSZJPtS+r+RTUfP+PgN5ZU1lo/UvePm3HfbELgxY9ru7WY6noo?=
 =?us-ascii?Q?zJMxDTwD6wM684ShkB09b5B2b8/IC8XA309T1HpQbhItxICGMJ4Cre80Zsrl?=
 =?us-ascii?Q?TKHEaP0CefWSp3N15XtdmgL6iX/nbkUZwj5ajjJ3RLfKsa100807tse1lkxc?=
 =?us-ascii?Q?Zg8L8+QWCrTIK7EucMBc36rc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7a479e-8d48-41d1-121b-08d92bf7ca01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:09.7033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWAtw7zvzGtJnqtsHFYYjuxWk1bPI2oNR/8FmLNYUDvZcl0piBjOfsONrEl6nNNwPbYHOGKMsm45ysu1AxvB+20FezptLl5cEKLxJEZBRZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.8.109;
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

Now, when a thread can do negotiation and retry, it may run relatively
long. We need a mechanism to stop it, when the user is not interested
in a result any more. So, on nbd_client_connection_release() let's
shutdown the socket, and do not retry connection if thread is detached.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 76346481ba..80c19f4eff 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -167,9 +167,13 @@ static void *connect_thread_func(void *opaque)
     uint64_t timeout = 1;
     uint64_t max_timeout = 16;
 
-    while (true) {
+    qemu_mutex_lock(&conn->mutex);
+    while (!conn->detached) {
+        assert(!conn->sioc);
         conn->sioc = qio_channel_socket_new();
 
+        qemu_mutex_unlock(&conn->mutex);
+
         error_free(conn->err);
         conn->err = NULL;
         conn->updated_info = conn->initial_info;
@@ -187,14 +191,20 @@ static void *connect_thread_func(void *opaque)
         conn->updated_info.x_dirty_bitmap = NULL;
         conn->updated_info.name = NULL;
 
+        qemu_mutex_lock(&conn->mutex);
+
         if (ret < 0) {
             object_unref(OBJECT(conn->sioc));
             conn->sioc = NULL;
-            if (conn->do_retry) {
+            if (conn->do_retry && !conn->detached) {
+                qemu_mutex_unlock(&conn->mutex);
+
                 sleep(timeout);
                 if (timeout < max_timeout) {
                     timeout *= 2;
                 }
+
+                qemu_mutex_lock(&conn->mutex);
                 continue;
             }
         }
@@ -202,7 +212,7 @@ static void *connect_thread_func(void *opaque)
         break;
     }
 
-    qemu_mutex_lock(&conn->mutex);
+    /* mutex is locked */
 
     assert(conn->running);
     conn->running = false;
@@ -236,6 +246,10 @@ void nbd_client_connection_release(NBDClientConnection *conn)
         } else {
             do_free = true;
         }
+        if (conn->sioc) {
+            qio_channel_shutdown(QIO_CHANNEL(conn->sioc),
+                                 QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+        }
     }
 
     if (do_free) {
-- 
2.29.2


