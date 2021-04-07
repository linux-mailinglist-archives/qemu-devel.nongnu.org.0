Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFA356A53
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:53:00 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5nv-0002ci-6B
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iK-0005XD-10; Wed, 07 Apr 2021 06:47:12 -0400
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:45540 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iH-0001P2-KG; Wed, 07 Apr 2021 06:47:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqNvwN2UCxfwEo8J11uuseU+wYy6hj32779W/NQPs/t5GKBlS9awk/6K6D4aggEf+HDIdEjyiJ8Zhcxh8Cf9ucwdVdGojP5PRomRzOue3mr63mGAbTJEP9oh0mEy4rooWvot5lvRhPRg8VemMtFFHF0U4Nr2ZUih65Ez8y+ZnDMX3jzsZfuj/BQIogQtZJGmWbTwrFk/GRgAh9/EZe+VlyC+RJmZtAGEs1cifxDeruwQxg7xoV6QcfNSxFtPvf48T7P5MySVA+a2T1zciYHafdPWp/XX8RHrZyVSgumBzvEZBIs1sSukfX/e5/rV2o3jwOVRdnxwb9lpu2W+7u+3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJSFxJxJPbfmsdNNggLgBynQLZ2NM3EOHt0pde1V97M=;
 b=ALpv8UYqfEWaFhnaynhL8MewwjF926OQ23sNfa4rFvlbyXbpP3fY/YVnFbhZzF9X4Fq87qxMGLSTqWckdoQJzK27fBZR6yIIXNNOlbOoLvL6B+qRmpyXvvwMHy026hO5BGafrZHpUK0JkroPjJ3JsRpVgCfb+mKmUekItIvtjj0Xn3I06u0hbEvyKaJuQTwLPnZK+Px9xj8PhRG3s3V5BL8eiGTcYf4GICQkdH6l/gawAlK1qhV201m2ui+MHiDmbUIaWwUO3veGKGX/mOQDua+JG53ZEoRnl1lSdrmP97f1Q0THf4FHkvciEPL8aWJHix/IyHVjeivIK5A/21Dqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJSFxJxJPbfmsdNNggLgBynQLZ2NM3EOHt0pde1V97M=;
 b=bomhu5LpHRkRA/TJmLfp4nzK7/Pyw+lxdWIJfqgXLxnk0r0ESRKnNpUvLPcgCFFw7RLzs4uWz4u4LrNlcR1Fs792K+505jKzMO5heN2a+QNQ54/zvxMssBA9RQ+dmh9nzvip0pgiqqIbqWP+0wuYjA9dWPsJysTXQK+tAoIq1b4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 10:47:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 05/14] block/nbd: rename NBDConnectThread to NBDConnectCB
Date: Wed,  7 Apr 2021 13:46:28 +0300
Message-Id: <20210407104637.36033-6-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7783067f-ea95-4196-0101-08d8f9b27b32
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68058064CCC45309B61A1420C1759@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngTMo0t/L2HlDqGIN9cJE0GM71bKsAkQB95UmFF+nWWjaxwL7hn5WnwEk0gy2flsvP8uxDACtSHcnHc5cyaveiZJqMSGaxs+L2BURnMfwkGwc1+Fg7lOFI52KekGbRzmE4JFA9HxBw5tXIl8DXLsgun85SwodZTdiPxQ/gEX/O6Hw5HSsHKe5h1b4Oj+wn++FY060guU6F4Q9MYcfvb2xg7fM2CTXPgkilnh7Z+DWIazLkirMXkYixQGNCJ7/sC6IQPD7TLKARzQZ218U7047w8LsUeFjKL3r2uEmlQUAsD6pkxu9275USExFdlHcuB4X9W8rSVKI/bLFw/+pEQZic4pvmiWmmGo4RFoY9nRM4/KNyo7FlxcmMU6IoW8jh2bpKIywJ3W4FX4mvkW6j5u4HIIHJ4JbRpb7MzVfCHJUCAK2A/oOSbUAyLQNwR+dAj6TqmroFUNrP/oPu/0vrKM5Q0e+pxHBvjFyrw2u3eYti/cacRBSRdABM+PIIFLrnRL+onhJBV6I77erPSyxNmMJuLjLIxQF13mhEW6rupd8rrxDkJ+eSqo7DD2hHMq1s+561FL56I2xJnVYQLFOPl49XcPLbVZmvKl6vjM2z9oBfCoT03FHf9JZ0xkSkwNGwck3d5PgyI9Ntk9vhG+Dpg+sYbMQklT0hFkAwBJKy4RnknEz0TfFLUlQK7MCkB/AB3z1vTdC7HsFNLV2t7h2r3scQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(8936002)(6506007)(6916009)(8676002)(52116002)(478600001)(6486002)(38100700001)(956004)(2616005)(69590400012)(316002)(16526019)(186003)(83380400001)(4326008)(107886003)(26005)(6666004)(38350700001)(86362001)(2906002)(36756003)(5660300002)(6512007)(66476007)(66556008)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V7dREjDsvTP2RAzG74QivrP7p3JmMzX+0SZ69EEABBv7tRRJHOR5hFW+q88d?=
 =?us-ascii?Q?kdWjqrmFxOyVcne+qadG5RMmt2S+X7vvqvL/Hrq7lemvIA8YVpZqWxgcPQLC?=
 =?us-ascii?Q?8JKU+5QtiXWIKxZ+UKbrRLoTuPZKyH/rOwjaMJ8/M6yyDGSaPd3LK/aPNc4Z?=
 =?us-ascii?Q?S5Nziv6xwAZe7kY3XFFVAR8u8awoTV4TkJjT0x4rhNK3nGmoeiJ7qTORz0U0?=
 =?us-ascii?Q?11pJDeXCydHts+bRdpsRqTiXqiTZUKng1ICO4FrJDxIpDGzVelPlXICDkAOl?=
 =?us-ascii?Q?7PN0zKnebdTX6zxwmq8APyfypnOU4eWI5Q2bS2m4P2iwxszR+CrBzHe1LwRj?=
 =?us-ascii?Q?KfQYByIMC5SyaeBgdI8Ab1zt9mbpgngpy/JG/FwfPDEeig1CLAfnWnV7QiQY?=
 =?us-ascii?Q?HnqdzNyrII5rJ3DDTITTIn/tv6C+ngnLW6BrP02WG3LysVuKu0Dou/rpuGIQ?=
 =?us-ascii?Q?JDlvZU0rZhXTLec8sfT3ZF6f9zZOxfwR1dKwNwm0vZ/g4zgbRY27XWQlwPFu?=
 =?us-ascii?Q?V82Zvc8JwejJ5fF3BEo2g7aoBihr1iCfoeSGLmZ5jz8PQyBzQJ72RZtOWXO2?=
 =?us-ascii?Q?O45e9Kf1WLNOwwPZU+39KjqPz2QMXRWASb7V/Gxon5mxnZxZpJ2NStVPZddN?=
 =?us-ascii?Q?wiGRLzyOHzPK1aSnldKM/YtOh0WO3f9oyeGAC3qLe7kUW85/H/bck0Gc45cs?=
 =?us-ascii?Q?u7OfQAcRluQovOW2GXxmEVDC683ekV98q33Uu8mU+lKA6HioCppfkonmiOos?=
 =?us-ascii?Q?OYgi1zcCCI09Glh9itcmbn7J0n4yuxIWyR9XnpuaDY/5yv88SeZbvlFK6KaH?=
 =?us-ascii?Q?o66hwr88kNicuzvluFLLj2i5a52LCYgIYmCRI1TNp4EF0PP2FPZwMrDRo84F?=
 =?us-ascii?Q?pjFvwj35APQKVanda7de7jQtnf9mi5RhLryIAxTvUT+4oFYBpNa3HA4zvbcU?=
 =?us-ascii?Q?WQcPoNP/2/KEY0nW80utEuMwcqmhMwdXf7b0p7QlhdsOkwCfvokoUCs+AZyo?=
 =?us-ascii?Q?Ah57PmokFHDaZVTDXAqjrkuYqEcyrnYQqJ2jW3xnNpiUWf+T9Jf4supnlUD8?=
 =?us-ascii?Q?8BLq2Y7wjG9BLGl8vcI8gEd8iC5tgZO4H8SK7/o9pjIvvl3nBZZdpGxWkgfe?=
 =?us-ascii?Q?6w89uTWxH2H1fzRL/9XM1zvXf9N65Q+SoTOrmX2/pW3APf8L31mI8GNvSvEr?=
 =?us-ascii?Q?z/LBr3BWldxuDulM07IcY5867vGgalyQBWAQ4QYggj99RkMLzkxwOPi4sdQ+?=
 =?us-ascii?Q?f+gWRuw73kXKq6F8UtK7ylZDKijIHSlduzRz9/Cyx++FhQDKCNoU0F8S7Nl+?=
 =?us-ascii?Q?6ZVtbCTVgn1/kRwjFgFPGsbL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7783067f-ea95-4196-0101-08d8f9b27b32
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:04.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acTRENOCQGTg4/izLzwa7FKyYqSogV5UPBmlMxjZpR7fmazLth63YFqcphNsM0z8pIDqsC2kwHAhNgSNqamOhgSw9uCJbT8rvR2kb9aVzEg=
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

Now it's mostly a state of call-back, so rename the structure, cleaning
the way for new small NBDConnectThread.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index a9d351cbbc..e16c6d636a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -84,7 +84,7 @@ typedef enum NBDConnectThreadState {
     CONNECT_THREAD_SUCCESS
 } NBDConnectThreadState;
 
-typedef struct NBDConnectThread {
+typedef struct NBDConnectCB {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */
     /*
@@ -101,7 +101,7 @@ typedef struct NBDConnectThread {
     QemuMutex mutex;
     NBDConnectThreadState state; /* current state of the thread */
     AioContext *bh_ctx; /* where to schedule bh (NULL means don't schedule) */
-} NBDConnectThread;
+} NBDConnectCB;
 
 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
@@ -136,7 +136,7 @@ typedef struct BDRVNBDState {
     bool alloc_depth;
 
     bool wait_connect;
-    NBDConnectThread *connect_thread;
+    NBDConnectCB *connect_thread;
 } BDRVNBDState;
 
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
@@ -364,9 +364,9 @@ static void connect_bh(void *opaque)
 
 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
-    s->connect_thread = g_new(NBDConnectThread, 1);
+    s->connect_thread = g_new(NBDConnectCB, 1);
 
-    *s->connect_thread = (NBDConnectThread) {
+    *s->connect_thread = (NBDConnectCB) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
         .state = CONNECT_THREAD_NONE,
         .bh_func = connect_bh,
@@ -376,7 +376,7 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     qemu_mutex_init(&s->connect_thread->mutex);
 }
 
-static void nbd_free_connect_thread(NBDConnectThread *thr)
+static void nbd_free_connect_thread(NBDConnectCB *thr)
 {
     if (thr->sioc) {
         qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
@@ -387,7 +387,7 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
 
 static void connect_thread_cb(int ret, void *opaque)
 {
-    NBDConnectThread *thr = opaque;
+    NBDConnectCB *thr = opaque;
     bool do_free = false;
 
     qemu_mutex_lock(&thr->mutex);
@@ -418,7 +418,7 @@ static void connect_thread_cb(int ret, void *opaque)
 
 static void *connect_thread_func(void *opaque)
 {
-    NBDConnectThread *thr = opaque;
+    NBDConnectCB *thr = opaque;
     int ret;
 
     thr->sioc = qio_channel_socket_new();
@@ -440,7 +440,7 @@ nbd_co_establish_connection(BlockDriverState *bs)
     int ret;
     QemuThread thread;
     BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
+    NBDConnectCB *thr = s->connect_thread;
 
     qemu_mutex_lock(&thr->mutex);
 
@@ -536,7 +536,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
                                                bool detach)
 {
     BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
+    NBDConnectCB *thr = s->connect_thread;
     bool wake = false;
     bool do_free = false;
 
-- 
2.29.2


