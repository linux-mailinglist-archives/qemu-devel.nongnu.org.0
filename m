Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F777356A68
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:54:36 +0200 (CEST)
Received: from localhost ([::1]:39898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5pS-00051b-1H
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5if-0006CW-6o; Wed, 07 Apr 2021 06:47:39 -0400
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:20888 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iZ-0001Tc-Jx; Wed, 07 Apr 2021 06:47:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juPSPvTC2JvhMpkTiylewRed+pDUvu3w3mtkmsW7C6UcNFjZtrmqh5S68SFRKo8dyIgap7hmHPtBqluNTFhdlgDFYQNMQ5EJrL4YWTDAVYCi4NVe4hDlVSX1bJQYvJB52/ZOmOP2Lhflm71itn/2CB4HF0v5d7R+UlCkozA0XkCj0qv+rqkasZQcCUXRZcgHMHUiKMNWH8mRZEpv6g+kOlWxlG2plrXGSdp2nbbvmkkWuGA0SpWgxGm1WPsqCdps5td12n9/3w5G51KBdBY8tI5bS3+fexT4n+002P2ZDnWQPGqmxT+t52UhJSL27gYWQHmuZvXGUDZAOHaX25mhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItjXYDaY9p08z/8CScazztRd81aDICN76S4ODEnDPDk=;
 b=i3H6kakKqeFdPzwUCH4VMPk6e3PmDln+pRuobkkDPeKOgTBXsp2QGHb+JkygLLERvDUhrrVHOZuhkF8j0m5vk5qkUpxJbhQITyFRl+I9t5T/bsQTWTLhz0sBZHwuPHg5asy7VWuaa3Oyk4w9vYcarBl0mnfqo0qFnE1PyNDlNIZ+Pw1z7G0jXd0SRVEhGYo8ig5f0pAZDiHWmslrgEGaGUxLB/xc23qdtHMmHCzuSngulcqMh/5PEwRn1NyHziPCvLUoRXYjymeqhHHbL5bOy+ug50CNvyUIl0x519pcRxYblY9X1NUx5Zf218wEJPwIL+QequC1XBwjrOAuT2o1cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItjXYDaY9p08z/8CScazztRd81aDICN76S4ODEnDPDk=;
 b=Zg6o+9+Ktpynmw8VSRf0qB9IigB/Ko9Yxc42/GYXMRyRjzBZL20iyl2EYlEtBlNa1QWBkmUTVD9zsqiGlK3QNRcGIAMHh9yd8BbwdveegOGELBCNxAWJ/eE2BagHiUCVR7sWaNuWAUN8rjmUKuWetTszkCjy+Ah/1gPGdTb2EKc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:47:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 14/14] block/nbd: drop thr->state
Date: Wed,  7 Apr 2021 13:46:37 +0300
Message-Id: <20210407104637.36033-15-vsementsov@virtuozzo.com>
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
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1c9113a-562f-4399-2191-08d8f9b282c0
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2452D22C54159D36E771B292C1759@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w1ac+tXxNyqA01nkNfsSLj1WnzGh6d4e0uFXZ7fU1xj0M48Wvqferf5F7LJuQP2ww8EdZUMdiskbXqdKrGwRuPphRxYRWj3fxR6a2Gsi7tJdY1pvuxIVM8QiSrA6LHq0p51MWNPftzOBmASxm98+MeGxlW84xmbbl4v2cQRbKAQap9GiwAZsHnzHjUUnS0mJjVLxOUJVaYM9IUaKHyQLpgDkB1q9rt7WRu2vgi/oJKEc85jrzuwl+tTe3YeFwCS+NbaSDIhSR7sVW8TgZUbfkvmEBnLOD0pJym2c/zzPpNjxtaEUJejd3Nyp16oWIWHRtvqyAwuX2EsEd8vvk7mnb/W6dLhjMwkpENSLkQCFyipCp6zgeIFzEuyP80ARKB+0XdocxZ6pCsQSBoWll+kOxVLO1rWm4OeTdfPxwJ6w4HPhpKays3mv4YBQBDNe3MrV9IXLfCFx9IlF7K4lj8hcc6bD6k4bno2j1+95xGT0fFnHvGJRy6OT+PQyOB2Q2+9yYR1vaxYF/CiNnvu6DNfFM+S0qQEm6/pVuQXyu1CdGGNOcHs6c1t/+yo0hBHJAzsXWDbiI8eukiwFDxnSoeKHQBQQncRNYf7tI9Rz780O1gOO8OetPLY2iI0Uo6uvbgejAPCObylOkxExHHQHgdPFuvfP9/c9oAeQ/b+bugQqHxN5f4laAP3Adr062A2GTqczcvuSNfIUnWXG+k9+HoPSEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(396003)(346002)(376002)(8936002)(66476007)(38350700001)(36756003)(5660300002)(6506007)(4326008)(69590400012)(956004)(66556008)(2616005)(478600001)(83380400001)(8676002)(316002)(6512007)(1076003)(186003)(66946007)(16526019)(107886003)(38100700001)(6486002)(6916009)(52116002)(86362001)(2906002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ag8puDnjotGcL14155zcxDDbZNN+IHNsnsoCfCrjkpL1MSBmU4SxdgZa7yaU?=
 =?us-ascii?Q?G8JKtb/Q323bZ39EI/ubQz1zTxQbGfw3VShhJOrkvzSgIr9E708BMc120Ihv?=
 =?us-ascii?Q?gRaBs56LtUVIixlFVlhvyekwzZEhV71pfXHlSAF9pRUxavagnT9gbp2jsQGo?=
 =?us-ascii?Q?hPCQxSRUX6zAfk5pbc3K8eJEjBM4r+7ktVK9MkkiwHws4Cdo4/Izv3mMKV1X?=
 =?us-ascii?Q?ZOX7lq6czAqzBxTVI5v5s5aHCCwf2DyMoOgygJpK5NLpTno8cbHplT6hfumf?=
 =?us-ascii?Q?taG8zDNx7gD4VMo7qfe7YwcJ0zYTq1bLvQXVbCGvHtWNIP2zsE3i2VK/8FAd?=
 =?us-ascii?Q?gfTcx9NPkVKMNbWYuvDZjR+L9ThDOeQHSLgWzOa7zlWlZ68qN0FWz+QDIEHI?=
 =?us-ascii?Q?AB/5TzG7Su0lSqdFzxA6SndARWjU21vD0bU7jWYMrUI7VyHLQCNbAcqj61vN?=
 =?us-ascii?Q?4S4ms7lfCvy8umzd4mMG2xP/Xe3Rs7J/iSB5tgi7gAlQHimuqq1MaAlUOuE0?=
 =?us-ascii?Q?6aOA42a9bqqyxizOL2l1K1gJtp7gOPEwWXxCYoW+WI0dNoBUHR13HbkIELHa?=
 =?us-ascii?Q?EP0SGC1n2JiSJQG8oZPz451h1fr5X7pb/JYuOw7GXCbzwcaHDbLU0ImcsxwW?=
 =?us-ascii?Q?9ZShL6OJv00g9wE7D+z+f9dUSJg2YzGkMP//PBmzGC9+pgc3iHVu279ER13P?=
 =?us-ascii?Q?BicLCCTapfTvOaqFrix/nK9BZiG885BDZlXRMbqqmeLQ0n6PLONahFOZWkwQ?=
 =?us-ascii?Q?2wKO0aE4rqexKnD34EBQfjw32egDt8rFYir8HvGRo/KCbgcd9iBgM4c3W/EB?=
 =?us-ascii?Q?mnoidkmhlpOg1W16MVG1BkSPWsVIUlYw4rXVmldMijWRGvdV6M0hlfn78Jne?=
 =?us-ascii?Q?NWTWmQq8f6TJoQhvUgucn5a2RhfjLcyb1Q3U4uHmel6NEBJyVZlUMsI/j0JM?=
 =?us-ascii?Q?WCH0fmzzvMqp+vU1BToMloRwmi33Dqq6wuYWm82J8CDeHX30k1Mb3U/a6H3o?=
 =?us-ascii?Q?B5ZwOH9xg7pNfVfrqzgGIk64+TWndFbMj17Qlest0KRE42qE5JbQPIQKN+KH?=
 =?us-ascii?Q?wDendFkr0IpQ8I0yR/ORRkgL8D3xhoto/HWRQpI1dzo/wjGFfHH4tqBJAiSU?=
 =?us-ascii?Q?EIqg7Z181x0kv8ujO29pIMYgaUwxN5A+AlLJqmNe5Fet2BTzOV9QPrchWgDD?=
 =?us-ascii?Q?r7nzxU8Yzvollu8UCj4U7qNBsaXCSJS+tzr60jp77adrKyv4JUb79/NuEuim?=
 =?us-ascii?Q?adSM2OXBPXKpK1oOGptO8tojgz8ezK9oRCbP+MGDfkIXAw/qXhOilYbor7nx?=
 =?us-ascii?Q?krf9SHtZQZSNKRipoohBfZ5C?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c9113a-562f-4399-2191-08d8f9b282c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:16.8260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McEvIQPI/VXjFX0BXvOZYcjiXn96WD7zwq+awkrKuxc8KleJlh1eestUwc45Df16FKebc8SF1/KPfG9ogHWMxRrEXdl//qbeDW8RT0ltJB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

thr->state variable mostly duplicates information that is already
obvious from the other fields: thr->bs=NULL means DETACHED,
thr->sioc!=NULL means SUCCESS. The only bit of information we need is
"is thread running now or not". So, drop state and add simple boolean
instead. It simplifies the logic a lot.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 122 +++++++++++++++-------------------------------------
 1 file changed, 34 insertions(+), 88 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 9cee5b6650..5320a359f6 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,31 +66,16 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;
 
-typedef enum NBDConnectThreadState {
-    /* No thread, no pending results */
-    CONNECT_THREAD_NONE,
-
-    /* Thread is running, no results for now */
-    CONNECT_THREAD_RUNNING,
-
+typedef struct NBDConnectCB {
     /*
-     * Thread is running, but requestor exited. Thread should close
-     * the new socket and free the connect state on exit.
+     * Result of last attempt. Set in connect_thread_cb()  on success. Should be
+     * set to NULL before starting the thread.
      */
-    CONNECT_THREAD_RUNNING_DETACHED,
-
-    /* Thread finished, results are stored in a state */
-    CONNECT_THREAD_FAIL,
-    CONNECT_THREAD_SUCCESS
-} NBDConnectThreadState;
-
-typedef struct NBDConnectCB {
-    /* Result of last attempt. Valid in FAIL and SUCCESS states. */
     QIOChannelSocket *sioc;
 
     QemuMutex mutex;
     /* All further fields are protected by mutex */
-    NBDConnectThreadState state; /* current state of the thread */
+    bool running; /* thread is running now */
 
     /* Link to NBD BDS. If NULL thread is detached, BDS is probably closed. */
     BlockDriverState *bs;
@@ -354,10 +339,7 @@ static void nbd_init_connect_thread(BlockDriverState *bs)
 
     s->connect_thread = g_new(NBDConnectCB, 1);
 
-    *s->connect_thread = (NBDConnectCB) {
-        .state = CONNECT_THREAD_NONE,
-        .bs = bs,
-    };
+    *s->connect_thread = (NBDConnectCB) { .bs = bs };
 
     qemu_mutex_init(&s->connect_thread->mutex);
 }
@@ -374,22 +356,21 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
     bool do_wake = false;
     BDRVNBDState *s = thr->bs ? thr->bs->opaque : NULL;
 
+    /* We are in context of connect thread ! */
+
     qemu_mutex_lock(&thr->mutex);
 
+    assert(thr->running);
+    assert(thr->sioc == NULL);
+    assert(thr->bs || !thr->wait_connect);
+
+    thr->running = false;
     thr->sioc = sioc;
 
-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        do_wake = thr->wait_connect;
-        thr->wait_connect = false;
-        break;
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        do_free = true;
-        break;
-    default:
-        abort();
-    }
+    do_wake = thr->wait_connect;
+    thr->wait_connect = false;
+
+    do_free = !thr->bs; /* detached */
 
     qemu_mutex_unlock(&thr->mutex);
 
@@ -416,25 +397,21 @@ nbd_co_establish_connection(BlockDriverState *bs)
     BDRVNBDState *s = bs->opaque;
     NBDConnectCB *thr = s->connect_thread;
 
+    assert(!s->sioc);
+
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_FAIL:
-    case CONNECT_THREAD_NONE:
-        thr->state = CONNECT_THREAD_RUNNING;
-        nbd_connect_thread_start(s->saddr, connect_thread_cb, thr);
-        break;
-    case CONNECT_THREAD_SUCCESS:
+    if (thr->sioc) {
         /* Previous attempt finally succeeded in background */
-        thr->state = CONNECT_THREAD_NONE;
+        assert(!thr->running);
         s->sioc = thr->sioc;
         thr->sioc = NULL;
         goto out;
-    case CONNECT_THREAD_RUNNING:
-        /* Already running, will wait */
-        break;
-    default:
-        abort();
+    }
+
+    if (!thr->running) {
+        thr->running = true;
+        nbd_connect_thread_start(s->saddr, connect_thread_cb, thr);
     }
 
     thr->wait_connect = true;
@@ -449,32 +426,8 @@ nbd_co_establish_connection(BlockDriverState *bs)
 
     qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_SUCCESS:
-    case CONNECT_THREAD_FAIL:
-        thr->state = CONNECT_THREAD_NONE;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        break;
-    case CONNECT_THREAD_RUNNING:
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        break;
-
-    case CONNECT_THREAD_NONE:
-        /*
-         * Impossible. We've seen this thread running. So it should be
-         * running or at least give some results.
-         */
-        abort();
-
-    default:
-        abort();
-    }
+    s->sioc = thr->sioc;
+    thr->sioc = NULL;
 
 out:
     qemu_mutex_unlock(&thr->mutex);
@@ -506,26 +459,19 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 
     qemu_mutex_lock(&thr->mutex);
 
-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        if (thr->wait_connect) {
-            thr->wait_connect = false;
-            do_wake = true;
-        }
-        if (detach) {
-            thr->bs = NULL;
-            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
-            s->connect_thread = NULL;
-        }
-    } else if (detach) {
-        do_free = true;
+    do_wake = thr->wait_connect;
+    thr->wait_connect = false;
+
+    if (detach) {
+        s->connect_thread = NULL;
+        thr->bs = NULL;
+        do_free = !thr->running;
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
     if (do_free) {
         g_free(thr);
-        s->connect_thread = NULL;
     }
 
     if (do_wake) {
-- 
2.29.2


