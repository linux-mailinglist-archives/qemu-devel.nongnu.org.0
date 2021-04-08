Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C5358712
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:21:54 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVXd-0000fp-Ee
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVVF-0007Rj-0M; Thu, 08 Apr 2021 10:19:25 -0400
Received: from mail-eopbgr70127.outbound.protection.outlook.com
 ([40.107.7.127]:17439 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lUVVB-0006dY-41; Thu, 08 Apr 2021 10:19:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO0y0NGxF110NuCz9eybUKozjUZogGoHAHSbV1RrzVe5Lv2TuWU+v+Pdr7zeiFZNIIN4flV/pdLMavhykfDfUbBH7OYtI+Kww/y3XvPDugg5XRTMU/UtZisOBjtD7lFm/SYQRC3mbORTGsUo/8xB/Kxxh1HOANGHb0A86qittQbAmEHCpTPGAwlfnx0CWHoovmNOseqRn3pieNjsG8XyVK6bhCVcgi/v35wxIRfa54W+qqryJ5NQJ2fZv45hLIlEuy6wsKTr3jufefeQaM8uIwLNrjxINYC4//dAwXkDYPRzDNT3vHr6OBshKcyLNwso8I8r8pfek3IUBMEp+Z+Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrs0RcXKqrz4xoMYNQhi65N8QPvot6ksqRLmQHc7eg4=;
 b=L4HA+hQZFRHOW83fiDIoaTAp/821mci7cHLVNY487AnnqtQ5EafP2L32OrGecU+pOImwEWQb2dzs/xQKWU5VCRN55I8M0maDwBPqvc4Eua85tIugJoUXoanFeRaygEyCgBM2FjcFN4OutTm3sEXkJFycvlJkGMwCyr3bQNbgeRhaQYPCbi4XTjb/E+496RAhgwZgu46x7SSn0vRU/SueoUfllfNH3qzZjwdG/uzJvf5teQSCbcpIIGrc2cQRv0uuHdb6IX6260hP2ggoLWhAykB8tlKJyGOqedtpwNfTM5BQjCkt9Nh2rZoj94JIBXSDv1eVFG7wd8dS0egvl6o6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrs0RcXKqrz4xoMYNQhi65N8QPvot6ksqRLmQHc7eg4=;
 b=AU0n5FEuUb4oe/Q6Oq6EYr62+S5vyD6CKscAF1+mEp2q+74JRewIYAbOGdlVJKxHEFJ+A64SvuLVHC++iNVwrO6v8sHKJQPnsty5MvCRmpaQjwz8aSzAUlG8C99VsuUUjIZ3khfld1G5LEuXP/nyBhzn4VKRG4+w7Ml99yiQJ9E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 14:08:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 14:08:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, rvkagan@yandex-team.ru
Subject: [PATCH v2 06/10] block/nbd: bs-independent interface for
 nbd_co_establish_connection()
Date: Thu,  8 Apr 2021 17:08:23 +0300
Message-Id: <20210408140827.332915-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408140827.332915-1-vsementsov@virtuozzo.com>
References: <20210408140827.332915-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0701CA0052.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0701CA0052.eurprd07.prod.outlook.com (2603:10a6:3:9e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 14:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83a839f7-271b-4d00-0a4f-08d8fa97d5c7
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5127109473C2AF3CAED51E06C1749@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IG/jubqHyJmTZ9C0YZsAjvElJrTOYPSk+9BCAduPyPF+V1bpJYcBWDpxFdy9MJAQbtaL6OrPS0cwr8NHql7d9sbkKmoGbfQK/20CBKRgS1QdrzkgoEpFCFNVfmBuEw8pvzD8uOqRoK3hx7iWihUjBZ3Y6/MbUXj6ml9VztGBg1CZVCXyKfHn3ZOH/awmj06zYy4bcWjJVDp86o37GVQ+X8CQPLXuHmkF0cr8aEjQsUgivR+65UNyJ0OssfNZ1X0ygrimdtwPSbSRXRGv+I9SwjBtgWrTopKTnrqboKJDqx5xos8HfuK2Ac57la2NLRfmX+1iSDpeHjpFAhK2IX34LD6S2H2yqmEPPjZI9sKJbOIS90TYWsEDLlWWgSSTnLhWkuBZ73TRzqh+a4mzkzsz62V4XF1UZt7xkaSYJ/s+VgjbPzhk4Fx/R7aQfwjtbUTpnqzHCbIkhDKrt3L1aVE+DFVELX1jI6NR9nVHCWUljUKkf0/xfxef2iph/onf0t5bJWdsv1Z+Iu0dzoJbr8Rq9rkPsi4G2rBDG7F9fUOj4Izp9MA9nOPUN90Uie4QLOP1F95p7ZgUEhpA2sn1ZyjTSAPQNXTqj98oDUIDN8I98+AjYKqKh0GDYMRsX+zWo47tfUAHnzSfTBMmK3f3cCFyGGsVsG3HW2gxfjDxk8Jb3jUqgo8SZs2V9ZaM6oTFJuaSbI9FGH7nopL7REpN3RhgltdO3BaGuev/4MyLr3Pe1lo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(366004)(346002)(136003)(6916009)(2906002)(38350700001)(86362001)(83380400001)(8936002)(6486002)(52116002)(5660300002)(4326008)(66946007)(66556008)(66476007)(69590400012)(36756003)(38100700001)(6666004)(6506007)(1076003)(6512007)(2616005)(8676002)(186003)(16526019)(316002)(956004)(478600001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Zh3lpARWzL5n0mlEEhB7VSuThbfhTG5JbzwUd6teiaM3WNUv+Nz/npsyWCSp?=
 =?us-ascii?Q?kBPFLoyn9wACB2rXGQx8D0aEe1VHHD6ZlXUKS5ScqJll5jYIt0IvPNCJB1h5?=
 =?us-ascii?Q?0Dt5F1/6SUaP8B1hu5/XJtCdzhMfFSQ01bbmkwnuViq2SlPzMprBf2/68GBO?=
 =?us-ascii?Q?HWz0mhouqbxmS4YMGrZVePhzhJ5BmpfqpwKlhenEra+UA0w+PaaCdUbkr1kr?=
 =?us-ascii?Q?1+LRkyE8FBiNnozA70ZAFnKmiz6SL6f1DF4MFxLNwDMPiFWENmwHgOfDHU1z?=
 =?us-ascii?Q?u9hVLVOeqZUYK/gYUetvUBl7QKbPYuaeROGFRBIKvJr4V/e3F0lKzvrZPXyT?=
 =?us-ascii?Q?pjuwkcz9UmhmJpOjCY0jXgt8ij17ooZdsL/trOkT2D9eNEOp/Ou3A8z5p6SY?=
 =?us-ascii?Q?UaktUgUcsMWVktRjLo5xDpwKoIpy8tU/+6/lvArBsGxNjZPEGEc4WfQrivPa?=
 =?us-ascii?Q?BmkgSaokn3wDImFN1PWVkY7at9Y1gVNQfbHO2qtEw+hv5mUIC9fbl8hjqsLd?=
 =?us-ascii?Q?0e4g1J5Hg5/q76JyJ7Wjjh6+8LRzbS5OmXgIgAWvyXpfGYNjVwC+VqoD9DZf?=
 =?us-ascii?Q?f1PmdWCgWVUfFkJ0ZCSqUrUQq05oCgHjxL2ewGu2rPlAHJXQTVrbeMivIWto?=
 =?us-ascii?Q?z7C2l5YCqjiYsrf/DTGsXzYFpFbKApICbWemTzDtI12mIBuxH0aQrZzVFG1+?=
 =?us-ascii?Q?Y4R2RSZlD1HvyAT2hW9VCK/MtXiTbxBVwcXoa1fUvC5Mw/lnwPNweCDObZF3?=
 =?us-ascii?Q?nfPMhrTlVWyC4+Tr39sT37DGhWJk59oteQ8KFDRcv+QzSCcrahLI+CqeXmBE?=
 =?us-ascii?Q?q8u03Msu1RebwDA/6CBPRBaDYWYTmv61Upwmfwbe1obozPmdGWLu06AD/r3y?=
 =?us-ascii?Q?+H3Fy1oAnCp89blYuhCPQ3XauW2if41CWU37Qa8kcmGmaJFdO0ClPdzqg1Ed?=
 =?us-ascii?Q?MsgtpTEen7IArOE2zqoR8PaLbAw14sxGlGMAFWphx8v0J6BuW+KxTw/06al1?=
 =?us-ascii?Q?ZNzuE/FzDLaPm4bqL9cqrhCWmGMfZ3SpiD24iFed6Uy1Yoqt+6W2c15YjNL7?=
 =?us-ascii?Q?MUQGdYSEL1I51oUMeO21lnGDjkXBBWAm16rOAHAIVO3kODP27ZcNNXC8p2QN?=
 =?us-ascii?Q?uPss3cgtOkBBUOmta3j3qRtrCX3bo1t+v/yEyWYDkyAebkGOJs18OrBf51zc?=
 =?us-ascii?Q?0IG/wERNcUszqFpkoNjgwyWMLfygV2PltP3WvczA99U8KQdS0/VVC/AJ0r/p?=
 =?us-ascii?Q?vsilWbWQZOH4lvLRU7GOiG8UK+MRNqjAdTkoS5KDlP/93BWwm6atTfgQHD6T?=
 =?us-ascii?Q?2AlbxiwlJGaIOlWYNtJ/OW5j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a839f7-271b-4d00-0a4f-08d8fa97d5c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:08:50.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXbSe5ZyJtznvCkEHF+bYM+BRXHNleI4rYXQkSxvPPl5FeVGrqU145/SmrZOgx8mVtfAeMMFPtRlANzcxoFkbrGkEy+ZS5DzUZlOF4S1ilk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.7.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to split connection code to separate file. Now we are
ready to give nbd_co_establish_connection() clean and bs-independent
interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 49 +++++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 85c20e7810..a487fd1e68 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -122,7 +122,8 @@ typedef struct BDRVNBDState {
 static void connect_thread_state_unref(NBDConnectThread *thr);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
-static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
@@ -390,22 +391,36 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }
 
-static int coroutine_fn
-nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
+/*
+ * Get a new connection in context of @thr:
+ *   if thread is running, wait for completion
+ *   if thread is already succeeded in background, and user didn't get the
+ *     result, just return it now
+ *   otherwise if thread is not running, start a thread and wait for completion
+ */
+static coroutine_fn QIOChannelSocket *
+nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
 {
+    QIOChannelSocket *sioc = NULL;
     QemuThread thread;
-    BDRVNBDState *s = bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
-
-    assert(!s->sioc);
 
     qemu_mutex_lock(&thr->mutex);
 
+    /*
+     * Don't call nbd_co_establish_connection() in several coroutines in
+     * parallel. Only one call at once is supported.
+     */
+    assert(!thr->wait_co);
+
     if (!thr->running) {
         if (thr->sioc) {
             /* Previous attempt finally succeeded in background */
-            goto out;
+            sioc = g_steal_pointer(&thr->sioc);
+            qemu_mutex_unlock(&thr->mutex);
+
+            return sioc;
         }
+
         thr->running = true;
         error_free(thr->err);
         thr->err = NULL;
@@ -420,13 +435,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 
     /*
      * We are going to wait for connect-thread finish, but
-     * nbd_client_co_drain_begin() can interrupt.
+     * nbd_co_establish_connection_cancel() can interrupt.
      */
     qemu_coroutine_yield();
 
     qemu_mutex_lock(&thr->mutex);
 
-out:
     if (thr->running) {
         /*
          * Obviously, drained section wants to start. Report the attempt as
@@ -437,17 +451,12 @@ out:
     } else {
         error_propagate(errp, thr->err);
         thr->err = NULL;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        if (s->sioc) {
-            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                   nbd_yank, bs);
-        }
+        sioc = g_steal_pointer(&thr->sioc);
     }
 
     qemu_mutex_unlock(&thr->mutex);
 
-    return s->sioc ? 0 : -1;
+    return sioc;
 }
 
 /*
@@ -514,11 +523,15 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
+    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           s->bs);
+
     bdrv_dec_in_flight(s->bs);
 
     ret = nbd_client_handshake(s->bs, NULL);
-- 
2.29.2


