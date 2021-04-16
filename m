Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB89361B46
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:24:41 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJmK-0004ti-Pr
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYY-0001qP-Te; Fri, 16 Apr 2021 04:10:27 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:39777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYJ-00087j-Vf; Fri, 16 Apr 2021 04:10:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFiCnrtVk87Gf/47+/O3dVKGZpXo96v25ptwD6F8om8+TfZ2dEQQEfeZigy6kjG/uh7yEyfC7NGqyy1TS2XXyCFeMBbES5cp90hOjEPyScewWO27ZfH/WSdbcw84GWhvd4Hnn3lOXXLnLnTdjGoKksFLvRWpfAIKYCo0g9NU4nBpyLcJQAQbKrW9R+HCM3A3/5AgH/NaAqFQQfimztosInel1heKq586WZChkfx3WlA8CGcaCD/s/DINaAdxEt8PnFLUO7J3QfFycbHBS5ibK/mWHWXDOXJSgnIRxKMViSvZ0dqpX4Naq0J4FfKHmSr2O0U7wUIGrrLx1JBnsjLk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVsGoRBzsXyIJNTyRt29NPPKwaSFQD16j1gtMoEX3RI=;
 b=kn4M/kGXTrA4k3JZArnjO5x0ktD+StX2NZ0jg8SMaX+cgm1HVB5vmwS8vneLgi+jhl+matUCMfNiGUxqVJpGoB8g9lR+l9lZ1jR5mc/V6Wxt6m4PT9xZ5uwSyHbv/GdQhU5Z6J1jA9MxMz3Ks3PwXcq/HSLDrv8Me93CBtSbSfJoWaHOUzsW9whaceBdoxf9h3Fq/ud/oWRxWG1hCoDLsiGFvBJltgpGlmqDWHR0UIpfGnfZsYsIJJbl6pX01Ixdt7bJYs1H8FiCuL5AeuDPkDgiQ8v0/ZxNKst9mtXnx923NrZZc0qBEYTq13WNjJqGzmeg/2FR6XCAO8ZR5g0NMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVsGoRBzsXyIJNTyRt29NPPKwaSFQD16j1gtMoEX3RI=;
 b=U4UQck/cXAdlkXnXZZbIE1sgn+sb/1rrVfbnVM/YoTyL84kSvLYzioHGG7yPWsd+nKIvJgaGw1HSqgG4cgZRSPbMEHApvHVoyU5YjtE0G16j7hFG0lpOWkgQMg2A38t+pOft+w3mdGjrIPOAMxGAC2gX6PKAp1TQ8UZZLtQ/uqQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 21/33] qemu-socket: pass monitor link to socket_get_fd
 directly
Date: Fri, 16 Apr 2021 11:08:59 +0300
Message-Id: <20210416080911.83197-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddcacbd9-a64e-45c4-48f5-08d900af0521
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691A711F6754131B64FB48DC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bw5syGJC0BNjSLJcNW2ML5uDVZzAkfimvBB1cbrmHVRbQDpB6mamyLYf/fBlJJb778fCQEeEABe42EQWFjmIegkpoi+Q+gKqN68vgWrbjwZfKn4Txo4xtFjAfOKMDAN1W+vcRTz7tvhdR1SMq/hpoYHXug23jrjMaqUwRx+ZkFiPeGDxDeGXUhk730nqCg0LVe2seGtMgVaL4Ndz6yuxICqim0BKZvfUc5FnBdUR/yZdXPwCnf6Nrt2HExq9sRTuyRDztwHSK0BwVPkTDBBrRU7NZo5HBB60B9pyfTM2kup6cMpk+UtHYfUebyPcdrh1CzBhq2eu7y1s1dh9Jkv//qvDm70gML5Hqis7G2BskqO8+QDVFBLEdJSHjmg7FA/ttTeITC2hvJvB5+sUXSfvl46cBxWD+Iea3+XOVM/vkXPCkKR6rtrpO9/sKKvNy9FYGzMccIxG4UIxhzC1CI197R19YaN4QNeH1sQvLsS9kGWZ60qi1vBuftcnT5SW9Le/0xMTN954A5AEZvfYukxI7N57+GO/4/EsuTdeIEbEwRGIbqKHerFXdx5DJHX+9d2NQ/qj7j0XsnvbIeUGV16TJ87/NQww2bdj7DiI6dJwavI7EDBRCHQrKdiBrR1U0yprincjGAm6ANJYS1lAdrqyrgTV0D6j7m168EbFr23k5GIOBt/bwygi7oUxGFJp7MGW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(8936002)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(54906003)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bj4EedGQnuFou/ZHjCZkSShmN6XzM75ig5MEBEdLPwkjYS01DftT90fB2FeK?=
 =?us-ascii?Q?45PKJa4tY3nGT9BrtdZ6g6qf7jFvXtGBEVzXuQis/xE8rPMtz7iPGlbgbq4e?=
 =?us-ascii?Q?xomnnOCEadpSEkKXYN7jfxvGjyB7cvWtREunenCejMTn7BIgiATJXNrmZJgH?=
 =?us-ascii?Q?fxGugW46Xi3Wbwt5zQ+NjSRCP8oTHYuwIyIWxvO/Q8xNAGy11qdVGuzfSn1t?=
 =?us-ascii?Q?AcR9W7+VwsU5JsMBLoFd4z/QePLG8wMo6RYJijwdtNwHu8gfpuNv3/dtVtNS?=
 =?us-ascii?Q?+dqPO7WYZQePGzW+Q9M7PYj8ZgTGBAYPNYkvU0eTyS36jSylm1KbPe9Raecb?=
 =?us-ascii?Q?akFBlZpyUgZFhLMUJZPg2tJSvDMnRw6riiQQ+c/4WRk13U9fXcgVfuy5frp0?=
 =?us-ascii?Q?NMAfOj6iYmr5m/dJDKXDRQ8CT0BbNAlAyZ6kY2e7HYWY6WNeGwv9WvW0jw5K?=
 =?us-ascii?Q?8FJwzkeaV0c2LjxgGqbyrmL08pyLcHXdny0eYVRHfD/U1U4M0JDcG2yibjHm?=
 =?us-ascii?Q?aFW+0Y1wSvssVc7HYLPwVBy7s4MdA4WzIVP8uXfZf11foL4ZozQoBZz+6TUO?=
 =?us-ascii?Q?pS9HMFK+LSWD6nWCZO765DJm7t3jyd0V4AnII20R7Ny+ZK/HiK4LjoqLLzTE?=
 =?us-ascii?Q?w/DvBB81Fau403qNNoOdlPMN2nX4AlRX4vy0L23lAM3Y7WHa7tr3S0a0jrAi?=
 =?us-ascii?Q?b91ta0pWUNjMESPP7Qn5YTi1lodO4kA37FAzcgTuGmM2KwXXc/t301O57/f7?=
 =?us-ascii?Q?p/l5/wPzUqNv5UMFuBYKHYjazR+1eQ+icUwYSO5UjFtkN0lK2drOuyAP/U31?=
 =?us-ascii?Q?8BndcL3zBR33qbJymefz3MQD7+kJ3U3IzY46hMwjttywAPMKVATkSpoAwe+l?=
 =?us-ascii?Q?FhPrYKnCHnnThL+WKcyRBe4YHhOzNKQlxFkOz/fA4PPK6ppjP4bIOcpvqbx6?=
 =?us-ascii?Q?pY6r4EiTsD5ohOkuA4c4xMBIHijqY6661mo788Yum71LJ1qennTlZWTuST6D?=
 =?us-ascii?Q?k9fXqZvAdeJ5m2DjkcGsZ69ztau93cHCJugPeb+S00leog3oQuHb8NBFTTum?=
 =?us-ascii?Q?y5HqibDx8fjHIYiob3hxCIyX1rOORr8Mef4kV7sGpiIkTowpP2sxnURnjbUP?=
 =?us-ascii?Q?BBiWO4fiGFNqCvbMosQUjMqlI0uwWg1WVFynE8D0g/c9cjcz+1dkMrJ/zNd4?=
 =?us-ascii?Q?ISCbEwiqeWRmxBecb+2ybLuDoqdHzIvN4Kd5sKa456ZPCcamoj+0YTyBeH21?=
 =?us-ascii?Q?EqynFvjfZFHzEA1MtmcNF4Y1dqJsckSL2zn+ze9OIHbA+KbiJ/tp0fsJWwim?=
 =?us-ascii?Q?nIfVO+GwFjidtRvxvCvOehIV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcacbd9-a64e-45c4-48f5-08d900af0521
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:55.6991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j58MoGeh/ggOo9QFRA1K5BYobSAPTlsCSdOu1BAyVq62QtlotcNAQ2Z69AOwEZzouyj4NcOZQsj9kLxqfZZAHYVXy5jMRFcNpFvZtvE52eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Detecting monitor by current coroutine works bad when we are not in
coroutine context. And that's exactly so in nbd reconnect code, where
qio_channel_socket_connect_sync() is called from thread.

Add a possibility to pass monitor by hand, to be used in the following
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/io/channel-socket.h    | 20 ++++++++++++++++++++
 include/qemu/sockets.h         |  2 +-
 io/channel-socket.c            | 17 +++++++++++++----
 tests/unit/test-util-sockets.c | 16 ++++++++--------
 util/qemu-sockets.c            | 10 +++++-----
 5 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..6d0915420d 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -78,6 +78,23 @@ qio_channel_socket_new_fd(int fd,
                           Error **errp);
 
 
+/**
+ * qio_channel_socket_connect_sync_mon:
+ * @ioc: the socket channel object
+ * @addr: the address to connect to
+ * @mon: current monitor. If NULL, it will be detected by
+ *       current coroutine.
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Attempt to connect to the address @addr. This method
+ * will run in the foreground so the caller will not regain
+ * execution control until the connection is established or
+ * an error occurs.
+ */
+int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
+                                        SocketAddress *addr,
+                                        Monitor *mon,
+                                        Error **errp);
 /**
  * qio_channel_socket_connect_sync:
  * @ioc: the socket channel object
@@ -88,6 +105,9 @@ qio_channel_socket_new_fd(int fd,
  * will run in the foreground so the caller will not regain
  * execution control until the connection is established or
  * an error occurs.
+ *
+ * This a wrapper, calling qio_channel_socket_connect_sync_mon()
+ * with @mon=NULL.
  */
 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
                                     SocketAddress *addr,
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..cdf6f2413b 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -41,7 +41,7 @@ int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
 SocketAddress *socket_parse(const char *str, Error **errp);
-int socket_connect(SocketAddress *addr, Error **errp);
+int socket_connect(SocketAddress *addr, Monitor *mon, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
 void socket_listen_cleanup(int fd, Error **errp);
 int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index de259f7eed..9dc42ca29d 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -135,14 +135,15 @@ qio_channel_socket_new_fd(int fd,
 }
 
 
-int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
-                                    SocketAddress *addr,
-                                    Error **errp)
+int qio_channel_socket_connect_sync_mon(QIOChannelSocket *ioc,
+                                        SocketAddress *addr,
+                                        Monitor *mon,
+                                        Error **errp)
 {
     int fd;
 
     trace_qio_channel_socket_connect_sync(ioc, addr);
-    fd = socket_connect(addr, errp);
+    fd = socket_connect(addr, mon, errp);
     if (fd < 0) {
         trace_qio_channel_socket_connect_fail(ioc);
         return -1;
@@ -158,6 +159,14 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 }
 
 
+int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
+                                    SocketAddress *addr,
+                                    Error **errp)
+{
+    return qio_channel_socket_connect_sync_mon(ioc, addr, NULL, errp);
+}
+
+
 static void qio_channel_socket_connect_worker(QIOTask *task,
                                               gpointer opaque)
 {
diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 72b9246529..d902ecede7 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -90,7 +90,7 @@ static void test_socket_fd_pass_name_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, !=, -1);
     g_assert_cmpint(fd, !=, mon_fd);
     close(fd);
@@ -122,7 +122,7 @@ static void test_socket_fd_pass_name_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup(mon_fdname);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -149,7 +149,7 @@ static void test_socket_fd_pass_name_nomon(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup("myfd");
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -173,7 +173,7 @@ static void test_socket_fd_pass_num_good(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &error_abort);
+    fd = socket_connect(&addr, NULL, &error_abort);
     g_assert_cmpint(fd, ==, sfd);
 
     fd = socket_listen(&addr, 1, &error_abort);
@@ -195,7 +195,7 @@ static void test_socket_fd_pass_num_bad(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", sfd);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -218,7 +218,7 @@ static void test_socket_fd_pass_num_nocli(void)
     addr.type = SOCKET_ADDRESS_TYPE_FD;
     addr.u.fd.str = g_strdup_printf("%d", STDOUT_FILENO);
 
-    fd = socket_connect(&addr, &err);
+    fd = socket_connect(&addr, NULL, &err);
     g_assert_cmpint(fd, ==, -1);
     error_free_or_abort(&err);
 
@@ -247,10 +247,10 @@ static gpointer unix_client_thread_func(gpointer user_data)
 
     for (i = 0; i < ABSTRACT_SOCKET_VARIANTS; i++) {
         if (row->expect_connect[i]) {
-            fd = socket_connect(row->client[i], &error_abort);
+            fd = socket_connect(row->client[i], NULL, &error_abort);
             g_assert_cmpint(fd, >=, 0);
         } else {
-            fd = socket_connect(row->client[i], &err);
+            fd = socket_connect(row->client[i], NULL, &err);
             g_assert_cmpint(fd, ==, -1);
             error_free_or_abort(&err);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..8b7e3cc7bf 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1116,9 +1116,9 @@ fail:
     return NULL;
 }
 
-static int socket_get_fd(const char *fdstr, int num, Error **errp)
+static int socket_get_fd(const char *fdstr, int num, Monitor *mon, Error **errp)
 {
-    Monitor *cur_mon = monitor_cur();
+    Monitor *cur_mon = mon ?: monitor_cur();
     int fd;
     if (num != 1) {
         error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
@@ -1145,7 +1145,7 @@ static int socket_get_fd(const char *fdstr, int num, Error **errp)
     return fd;
 }
 
-int socket_connect(SocketAddress *addr, Error **errp)
+int socket_connect(SocketAddress *addr, Monitor *mon, Error **errp)
 {
     int fd;
 
@@ -1159,7 +1159,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, 1, errp);
+        fd = socket_get_fd(addr->u.fd.str, 1, mon, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
@@ -1187,7 +1187,7 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
         break;
 
     case SOCKET_ADDRESS_TYPE_FD:
-        fd = socket_get_fd(addr->u.fd.str, num, errp);
+        fd = socket_get_fd(addr->u.fd.str, num, NULL, errp);
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-- 
2.29.2


