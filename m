Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4B356A39
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:49:39 +0200 (CEST)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5kg-00077P-Au
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iE-0005Ks-KO; Wed, 07 Apr 2021 06:47:06 -0400
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:45540 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iC-0001P2-8W; Wed, 07 Apr 2021 06:47:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BugJfrcfOWqvoyfEsOX5W6rOhcTjQz4nSSUQdccr3iBRUIlXX2nNdEkK46v131cOitshxWIagdzXMOUNwn0uPj20G7SBiTPOuabwzLJaJMj0FqUCWlscDId7PtiAvqIalOLWMK4kCrZYpb7dVKFeWrO6GhH4IyDwrQNH2H2mnxTw5h135CejS6GUyOGTbgMU4802avjS/uyx3k3dKim6r5da7O6f8TnB27R/T3YH1Q+OC4lzbwTqWjbaoq5MRz+kDU7f7/ndqEmKcAleVxcyYFtYX9ddBw4TsrW/SgXPz4M1MDJPRVf3yEJmJ0zhEmV7UOexoT5Io/eZ57e0kdDk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7QCATIt5mdpHF4XkP+SmqY2FymiS+oRTZmPWFUD+QQ=;
 b=kGVVVNQ7aToxzVsaoa61jEY0nWP7CFoJl9bDliXYTxB0C3B3W+hbjNuSYI/3FVnYcOzmnSoasRzSRipw0WR6J1CPQd/mji6p/yxs1d6P0zmh1jSI4lyUNH/1SBjrcpXMcEha/8wry4vFuwSWIi6p7/u37Q9uSNA0dl+P0uH1oKuwy2OfvRIfQljWmfOaRCc2G2ffhJdP/WsGPMpjYFSzOrcH/DU0ZiwuUfS8AzkbiHIVPT532vITI5N1ivyjm2MG/Y4vvuQDGXw05ch6rpxttsgCJ0t+pgERBiVo764XaOZoqSxqlM95PPqz2rNQMsIGftRLyQiOZTai0raJkDERpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7QCATIt5mdpHF4XkP+SmqY2FymiS+oRTZmPWFUD+QQ=;
 b=rPwTd3vWXxE2Zzy7zCtkGzw4MeV9ad4my9rVlVpECyoaKNBJmFKIM3pe81iUijWt9oeC+DLuWu8EQBoJw9YO8DfZDEw4+Lbtsmrd75LB81dhiBEzoZ6z6G5fIz4kKQmqbAez+p0J93lLYQEJnwUBvTFL4KfTCFDrNGkuTk7p9og=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 10:47:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 03/14] block/nbd: drop unused NBDConnectThread::err field
Date: Wed,  7 Apr 2021 13:46:26 +0300
Message-Id: <20210407104637.36033-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:46:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4ec8604-20e0-466d-8c9b-08d8f9b27957
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68055CE330A695535145D892C1759@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2iL7/zM3sSmCer+gbnLbhcQuV9fr3B/FJNybRbz9Qz2oJIZ+zyQyQ+7fgHyduiexZKPiXXHwr7O+tn9sndBL2/lzpYiIR9IZwrgh3kUIZNa1gAbe32Dj5/uyWImUcIARba5MKBFo+DaDXPsUBMzSjUJg3Xg8F2VzepgEkpjFd7iaStGzvqA9900PQql3twfLjrm6g0+7KhcN902GtXNrfmyJVHqRrT+q7EE+7gv16VQTq0eL4TJT0fV+FlWTiRdsQMd62bMX56q6h2SO/E8AxtzUzCwKlLwwbW++pMUux0b76Rg8/LQE32GMDiqwaqU+ihf2p1RzaaCCfCHI3hFgNp8pGsI360WYcJxlMBD7aWphIPfoB1GjT24yW8YHE0CqWPpp8XqPfqzU31v/MuEbf8aOxyen/fHNVNQ9s6aDDMjxlYcI2MPnSCQNdgHrfVxHlBZ7jODQFpixJ6WHZKkTAgGs/1kCrDN+WIWyZQGZvu1mSMD5xPOrRFTrVNR6jNVXZ/SGi93wSlo6OjeVYBr+aC8EaWFqsqYbcrnM3SVld6HQvyiCYi+WKAx68/lRAlvSfoAdb5+PcvCQfMW/6ZOr9Y+IHmVHmADhmcdZQ2L6bmcEX7QjyjU3gOt9FKvNk4j+gqQr47vKuYerRiUjMiRbNlsKPjTHSt4SmHlutH1ofYXatvbLuVHH2kQL25AE3/J8VPukK45Ya/Ysg4q2Ab/pAvIK43Pmb1WT3NzRiGEnQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(8936002)(6506007)(6916009)(8676002)(52116002)(478600001)(6486002)(38100700001)(956004)(2616005)(69590400012)(316002)(16526019)(186003)(83380400001)(4326008)(107886003)(26005)(6666004)(38350700001)(86362001)(2906002)(36756003)(5660300002)(6512007)(66476007)(66556008)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XezHLQYSB3tIxU7wo3BmUoPOZQJKFkndtZ3F3DtW1JPr2lENuUasug991oJe?=
 =?us-ascii?Q?EN49zY9FaNjoQC+eDc/92OFL4ZondxU/Km477TMBx3hG39X/LFz5y3wduh1Z?=
 =?us-ascii?Q?rO2lKcrrhb/HwlnEC1dzAkuyc8l1lSiiLW7+Ht54+dNuPiFGaWjqd0oGkmEK?=
 =?us-ascii?Q?IW5gJDJPUCJ03j/kcTYaWD9oL/xfDEIRxkdB/CQz1RIGWo+bP1BuOuVNw/yy?=
 =?us-ascii?Q?4/7V28KfgSBqYuczhae48fgzwYivhHTE0TFGf5iK1STSDD4Hmdnb+e2wgKqW?=
 =?us-ascii?Q?cnAa6brEhDBnxE17IDolHdtwdeFmDwTmlqJxfeKAueyR6SFdBL6V2HU5zSF+?=
 =?us-ascii?Q?QIOGBK2ENmTc6+TikiJiHKDmFRyqynaTOtPm4nfs5ug0044ZuORlFtwIiJmk?=
 =?us-ascii?Q?vD7hWcJWzMnD37r9UT3fJS7TLiFpDxaICPxTN4/ZGR87MAouVrQ4nPUANlYw?=
 =?us-ascii?Q?jtOpy50C8tlWEm9Jcxv3Q6Wy2uIQqXXlNJjOQj7mqJ3qbT7Ncjo3Q8ke+B8T?=
 =?us-ascii?Q?PR3wLuC7OxtB6kbnCpZ73o0g5ddyEcRF2xjLgbMuoayG4UOBI4U9uFwt9aoi?=
 =?us-ascii?Q?EUtR/E+8g2mbDc0uz+93Ifg2NmjgF2ZOGc27ZTLkdFsRA8gVXm9ZZlwtRKOk?=
 =?us-ascii?Q?7KIrA93BDJV/pQDP4AIf7gvRu8c7t6qSOON5bo64U1mjydLrGKd5A4GgDErh?=
 =?us-ascii?Q?b6lIyC5hyq8zPtYeCGoXhTF0uo1kdxnXcIyWpibiv5PCGGq6F2TnslTPZnn+?=
 =?us-ascii?Q?j/72/LWbRi9F84hmcC0Au+qcmUQX9fZBEbvhK16NyjN6246GVrx6TspRXLyZ?=
 =?us-ascii?Q?4LbxUEl49sfyh3oytOm5wnMWk4A8vn4HI8O3kSF2qTgJnKLrc1bEKRkRlK30?=
 =?us-ascii?Q?TSOmWX2sommNbqbYBLXmWNsj1u9zkTu7A5qp7dM3hSPLhj/WHstOt02DKAl9?=
 =?us-ascii?Q?TuAMRdw+iSXzY+L+4+6Ey0S+1X5L1+eCt7bAlTqLlK19iY8QSZOs0VHsyADi?=
 =?us-ascii?Q?HLGBxcKQfSatHFv0jF9CJcwOQ/HKTHsnUZGhRQ0YbeTkgnKieb7imA2J5SYp?=
 =?us-ascii?Q?8omZ5kK0uX357ETkb1ZZ3Y8AoEkfodE77uMwuHjxdxRBJdeT8QC6arY061V5?=
 =?us-ascii?Q?JQAwNqT83AM/CgUtCcNo+JrGKtn9tZbvVfZoPxpZ18h4U+lbKSKnAvKVJL+z?=
 =?us-ascii?Q?Fpo60oiDvj32U+Cd2/bV7+RgZG/Hu1GkjLMpmPtqYkJxglfdr1BmbzSAVrm+?=
 =?us-ascii?Q?TBFStgiqaoHnQu0BaeJtZNZxTa1m7dgp/lgl56T3LhuxmXbf00jO45rully6?=
 =?us-ascii?Q?oikZ+sbN+VLcSPWwAzEMSkgl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ec8604-20e0-466d-8c9b-08d8f9b27957
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:01.2651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qLZotbDvSpyNCoun/iKC4VIeYELY5MMBDa9rv5Gj9AJ/xN5LK13E2+r/8XjOQ8HsHljwtaCj1R5Wvd9gb3/2Ce6Hxu3qHlNWlHoTtj4wTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.0.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

The field is used only to free it. Let's drop it for now for
simplicity.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 29c33338bf..fbf5154048 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -94,12 +94,8 @@ typedef struct NBDConnectThread {
     QEMUBHFunc *bh_func;
     void *bh_opaque;
 
-    /*
-     * Result of last attempt. Valid in FAIL and SUCCESS states.
-     * If you want to steal error, don't forget to set pointer to NULL.
-     */
+    /* Result of last attempt. Valid in FAIL and SUCCESS states. */
     QIOChannelSocket *sioc;
-    Error *err;
 
     /* state and bh_ctx are protected by mutex */
     QemuMutex mutex;
@@ -385,7 +381,6 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
     if (thr->sioc) {
         qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
     }
-    error_free(thr->err);
     qapi_free_SocketAddress(thr->saddr);
     g_free(thr);
 }
@@ -398,9 +393,7 @@ static void *connect_thread_func(void *opaque)
 
     thr->sioc = qio_channel_socket_new();
 
-    error_free(thr->err);
-    thr->err = NULL;
-    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, &thr->err);
+    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, NULL);
     if (ret < 0) {
         object_unref(OBJECT(thr->sioc));
         thr->sioc = NULL;
@@ -447,8 +440,6 @@ nbd_co_establish_connection(BlockDriverState *bs)
     switch (thr->state) {
     case CONNECT_THREAD_FAIL:
     case CONNECT_THREAD_NONE:
-        error_free(thr->err);
-        thr->err = NULL;
         thr->state = CONNECT_THREAD_RUNNING;
         qemu_thread_create(&thread, "nbd-connect",
                            connect_thread_func, thr, QEMU_THREAD_DETACHED);
@@ -491,8 +482,6 @@ nbd_co_establish_connection(BlockDriverState *bs)
     case CONNECT_THREAD_SUCCESS:
     case CONNECT_THREAD_FAIL:
         thr->state = CONNECT_THREAD_NONE;
-        error_free(thr->err);
-        thr->err = NULL;
         s->sioc = thr->sioc;
         thr->sioc = NULL;
         if (s->sioc) {
-- 
2.29.2


