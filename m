Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDF356A52
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:52:49 +0200 (CEST)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5nk-0002FU-7F
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iH-0005PY-0D; Wed, 07 Apr 2021 06:47:09 -0400
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:45540 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iF-0001P2-9E; Wed, 07 Apr 2021 06:47:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp10pgbehnFOYANN4sUyUNaSKUecSK8oMWLLzgi0R+PCv/CyISxGKbUVd43inNYBtDO2Lg8rSj/YKhQ1Uf6I5r350sSOm1iFEZgjB1LPX/wrPW1qDxXLVB82oKhfoXqWrEXRyBiZ9iWAxAdKo4wiqC9KOqVKZQJKetJ089dNUWgjeEw8EVj4jxN8vw/NsccKBP+9PWTD2kpzueqvonsW79CAN/JEQlySa8osjWZ1dj5Gwx2HgEOrHCNwkJJTr2SJy0pUdmK72sgvPoluB0EjJwUJc2xVLJ17Aj2oqcu57oGq0CpM9L8g3zQUeQK2r1U7wUu3R6SY9IUCGn9onYlwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4i9PiFL/BAI15BuGaTokWRxAqRRnkVBEf1WoiYwTGc=;
 b=GWtLmkVm7swZXvj6rS5c4T6YZj5SdrO1qqxdbgsd3TBD643/hXcy6plb7U94UvY26Zqxy9ePc60DAAls8l+b2XZ2V5wiyrh65z82ZkY1TbLgBQ/bu+MldqNts+Mly3lO2mcc+X9z1bEOEXbYEz3LsfbCqWJTIsYvLNRloPzHQ9fp1fQT2RTiU0EvjKCvERmJBtRktMIKSTeIfD6s2jZREPVHMWefJrxKAt5TXABA//ld6jS6pGG25M3Gk22AihgAaDEW+jO9OmrGYFlOIcctWGQCMefbn9XpQomApRDnS1FdzGeMrwai+Duf0HsSE11NgWgpuS7ROIToE66NNcMVGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4i9PiFL/BAI15BuGaTokWRxAqRRnkVBEf1WoiYwTGc=;
 b=Txzl5awa4Z/TCyAhisaw1thDPYyYEWYb0rGOheIP/oEUhEGyoYfBRX176XmvUHdy5JbfvOvk1MUm3TTxXb50y+8MIUfH6Ej6pvg3pgnXXdkT5xbSPYDJPNR4zg7HZNe541HWyi2TgNBssS3QV03j30G936CFeyAQoXAGsi7xNLM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 10:47:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 04/14] block/nbd: split connect_thread_cb() out of
 connect_thread_func()
Date: Wed,  7 Apr 2021 13:46:27 +0300
Message-Id: <20210407104637.36033-5-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d85b52c0-6fc6-4726-0814-08d8f9b27a4f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68055231D385CDE018A7DB06C1759@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCW4la+g5sZnJh8ZCbQWJWrP6b38MC4djXmlW1CclkUdcsELLKlR+De5shp/sH/GN9I2qOhsh9Qwwqf2n3GnXUo9ipQIi33a9ESnDClplhVHFdUw6ftgHfc5ryRzCX9LsxwDHgJ3FjNQ1rk5KcpIkT3vZiOMwWLKbwcriTqOKrco5+gFPioADZpDJ1fTVyW8MtlGGH2unX/9sJ4u7BUEW9/nLnvyFfT9CdTEsMXvGOV4OFnyMi7EiBg9eO6pOSgQn8XYcSj5Iy0c6G8jNaaM/uZcJQALR6wquttAG7VAO88Lq91w/VwOyaOgy/GProeMq9lhW32dVGbYoTkLHJgTVDIR/I1CMU4VnMe2u4JErbkZWpPX8o/+o99xPA4LsAf8IGJjmtLZT9SPCm64p7Yslcj3aUoomjw9hN61TSCFvqdvYojhOPP9sNym0bhRJBn5MdvKt8m3FzTwEO37wQOQ/8nHBjug2jlux81iWSFRs0RP1vID1m5VI6LD2UDN/5wx+bSe8Z9B/o1n9d03MKRLVShE5ezI5L0m2PJ7ewtw3ajbM8P1ZW47WcDb4yS6BqljDc9mVQaKEcrponqTt0kSIhzAN27D3kgQ67lRhBkk4iNMNkJ73APMTTPEqaq05iXI9fLHYmX77oNSp5WVeqhxliFGY/vjtjD6wxeGdnqxAAzLuJdAHjTK/Jnux5wg7o/GeA6UHIqFavokx9vpi0cHx9OZOP6FzpW6NcNAOnvrnTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(8936002)(6506007)(6916009)(8676002)(52116002)(478600001)(6486002)(38100700001)(956004)(2616005)(69590400012)(316002)(16526019)(186003)(83380400001)(4326008)(107886003)(26005)(6666004)(38350700001)(86362001)(2906002)(36756003)(5660300002)(6512007)(66476007)(66556008)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R3uPz7bq34bLjwSyUF7bqSEAZXWriAQR65m35tjUIlVZ2B+OPC0K55mhNA4E?=
 =?us-ascii?Q?UzkuHGOYS/YwbMIXTrefxXqINAA8JcH3ZxVxhQVwGWQVJSsbUd/KUkUPLbgq?=
 =?us-ascii?Q?RQTQ2ZiVM3LOVrzbvfG3dgjkp2J8ki9K8lchGBzXyIxnI1RaQGtFVPecQp7y?=
 =?us-ascii?Q?YKMxNTfqp2lIK+rsnz2Xn5QUIeKu7xsLR07oipUsXf/+g+OVslt7faOe58ES?=
 =?us-ascii?Q?pWbheC2IoffUIVjdupNfJWYwEygSAVZI0WR3dLa5wMFGBcQo3IYdpta50ATR?=
 =?us-ascii?Q?33F5EhgjH+s4zmh5x/EW2smFZz37Kag4n0rVqUPwZLUUeUF9Mhq3y4tjMQJe?=
 =?us-ascii?Q?oPmumQXOHIdmRC1Y7o020jYjfUed9kXklfBey9WeQ1ch62UclJ8EQm0yZpDx?=
 =?us-ascii?Q?jOvo1EKi6FBNlkCbqNqJS2rQi+oYf90WMXQpgTPaRb59otsvs1ln4Cim+orC?=
 =?us-ascii?Q?k96jU0yDGOx9OEgZN4dbyqh+qitZu/xI2PINeRnQtNXzwS+ZIFblIhFEr1rb?=
 =?us-ascii?Q?KPwFR8jIP2sn3umdNaPp2TzoNAhbCE2u/ojmx9ZeF8L8atL0oocobGNqZUMN?=
 =?us-ascii?Q?NMcyk2qeaWEXLgP06SEG5wmM0i0eFNoEVqsU1CB7+dZic0VWq8aJqWVFpyYX?=
 =?us-ascii?Q?TxeWhLX8eN9C0CFRShazqNVwB0PczH/J3wK7y1zFLSCZBMRsO1QDd1zlyyEg?=
 =?us-ascii?Q?XFn2UhnuuCvTQWOSbtodzpEuCfoaVq29wTJXvxoIx1I9uVMsgwf/HlYisiy8?=
 =?us-ascii?Q?VpIs0/x3xavX9xtK00nhFS5RtcSPrVU+rOPwxSFfYB6fk/0lqpmi2I6xMpGU?=
 =?us-ascii?Q?b+uaAzFSImmLAe7zXaXk0/jN9rR3+unkCm7yyM07jdnDhY9vJ14x9RpfQuNL?=
 =?us-ascii?Q?rDkESnBJxaUan1S4p1tSJo2ErhX5jVOtYwQJUsoVkeMrAV3SSLrCEvp/XSEH?=
 =?us-ascii?Q?2hv6x/NqqVgcubAPzrUA6ThHPDdnrkNJKTG8hrLZ/Zq5QB/OELmOugiDhfkg?=
 =?us-ascii?Q?FexVklFuKqWHmWM+LZ5Deile1U+q0Nk2x+7/8G476gK6JpE4Yuh4Q3BE17tq?=
 =?us-ascii?Q?zG7KqTYXh5xDj/32AKXTQpBrlY39ByseTQd1GOZOxunWUf3LJBiNeiOPT/JO?=
 =?us-ascii?Q?7YWlaE9+hZyZOOABcxilXqrvvEh+lIjXhRcqlyxmcQgb0jppabdMH9OFSgCg?=
 =?us-ascii?Q?NTo/orUFycUKWyTimunSYY8Bls3OTw+cvrhld2UZxLVXVsse8YyJ5yNchCJ2?=
 =?us-ascii?Q?fAiibtzxoaVwof43Tmhua1asLXxlqcf85Kf/hVYgE9I6fwIakc7Nl/LWB1b4?=
 =?us-ascii?Q?Czcz1L/4ZJ9Jv/PiouKb37MU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85b52c0-6fc6-4726-0814-08d8f9b27a4f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:02.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUB0kVfEpIH/zWe+UxubhIECeiApCBJaMeSCqNnsCMLdvry7sB1o2hXBFHJtWYS3wRzhWI7azIoGdxDioTWcnoWUbs8GIgnPmA6YPi1vUkM=
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

We are going to split connect-thread to separate file. Start from
splitting the callback.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index fbf5154048..a9d351cbbc 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -385,20 +385,11 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
     g_free(thr);
 }
 
-static void *connect_thread_func(void *opaque)
+static void connect_thread_cb(int ret, void *opaque)
 {
     NBDConnectThread *thr = opaque;
-    int ret;
     bool do_free = false;
 
-    thr->sioc = qio_channel_socket_new();
-
-    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, NULL);
-    if (ret < 0) {
-        object_unref(OBJECT(thr->sioc));
-        thr->sioc = NULL;
-    }
-
     qemu_mutex_lock(&thr->mutex);
 
     switch (thr->state) {
@@ -423,6 +414,22 @@ static void *connect_thread_func(void *opaque)
     if (do_free) {
         nbd_free_connect_thread(thr);
     }
+}
+
+static void *connect_thread_func(void *opaque)
+{
+    NBDConnectThread *thr = opaque;
+    int ret;
+
+    thr->sioc = qio_channel_socket_new();
+
+    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, NULL);
+    if (ret < 0) {
+        object_unref(OBJECT(thr->sioc));
+        thr->sioc = NULL;
+    }
+
+    connect_thread_cb(ret, thr);
 
     return NULL;
 }
-- 
2.29.2


