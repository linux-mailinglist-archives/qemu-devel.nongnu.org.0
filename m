Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEB1361B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:28:19 +0200 (CEST)
Received: from localhost ([::1]:42170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJpq-000299-FU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYB-0001WY-VV; Fri, 16 Apr 2021 04:10:05 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY8-0007xx-If; Fri, 16 Apr 2021 04:10:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8A6pgL3UYrG3lgoH7XLzYinj1C17D7K8rjQoMlPRqdtSyGxWoEtHtANAXPbOqzxXQqwjn44Qn0NZ555H9PDZY7x9TE7I3ak1E7j34x3XQ8A9vyWna7DJpbk6dqGDlNPzyHQpuf9zC7+9bue6a2hRTT+TWLQkR2W3g8vNfPp/nbAKFqx5TDuWEYQOzt0Ivv5wGJ+fVHuUy4xdt2o4B/v7Fxf6lcv0V6ol2iZQBxpOtRM6VPOs0fpFY/nKv326X6cimc7vPfOfwqsTnM5hzSDF4ztyuABRAJAxH+mWnY0DfYiGUmf6o9Sz6cqPWCObpcj6adePjvL1z2nRdjW6VS3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZfG9qsRCErsRvW4xZyjiJ6iX3nZILdkxZQ3+ic+hVg=;
 b=MFTN3+zjWCVValfPa3+08ZYgeqVduM8Xyp98pACA/9Y2kYgXHI5U7mHQ1ZagRhLLG1/AMYrHv+6sbD1Vn+rEj3I1HFeuaGHKET5NMFZ1PE+ZrCr6aAXfrqUB1v+Zk2mg3cshSsfqh40iLwVT5WboHe6OdBqRyjw+3Xn6o4xu4XlR+C9MrhOnOZZTWkuJOm0Ub7AozLeVRrQ+Tv/FHSHtYEX0pYvCBAD8u8h32NmEvMMZXuLATQ4m0NHvkt0vd3EcxI4zg6RdLpuZkvCI3FpmvyP/9639bSN0KsSFF2nLbpkDIE5a6mag2Za8piaYPtNKXGfwBk43D09He87xNN8JyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZfG9qsRCErsRvW4xZyjiJ6iX3nZILdkxZQ3+ic+hVg=;
 b=LafqtJKzN6IUp9Ph8TBPG65Jzd3iIzk4yqkgA16a1tqkuWmIE7yMwdvz03UMjb21mUXUI9LDJ4/pzNdSHcLq4mIEleTHXcjQMr24vyJr9Rq1Ovwjf1B+UW55rVk/kEipfpu4VBewD1QegpuSeRktPezhaXu4R3aWqUpWVAWQqkM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 15/33] nbd/client-connection: use QEMU_LOCK_GUARD
Date: Fri, 16 Apr 2021 11:08:53 +0300
Message-Id: <20210416080911.83197-16-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4035bb-9e29-432e-8e32-08d900af0035
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469192A4C4D884E68EB277ADC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOpd22oRwmFSghJ5c1iCWP2rQgys5eU7P6mNEtO03P8YkPcyCi8DyHDtp8d+Gim9ILSA+fnTOyASnHGgP8y8Y4foPOcarW2MgVwMRzzZPHOqM8cjKIByw+cZlJyP8R1wuNinpX9TrPvlUQDOp/cVVupCR5/TUz8nsfuahFLZvnwmw80Rty+OzUqocdrmpJrpXa6OwThhSX8I7un61nMm70ENJgyaMSbYcH5e2faELlLvKGgVWJPyULG1K6rBzYZjGqhM3+ooXRXMNqrb/iDxUr9pZMaHvcLqjbeEmFiwtmBxug8JuOjOEcCmb95efdY8J3srM9U8CMBrpctLE1pLqpUiysehghFksYXPj5VNisxlqdsmrwzYwJCoqHPNhPvqclU5l6Vs6fGH5dLPaYkn3OY2m0htJURLV2KZzW/dCnRSwJX1CauMi73HKfXz/xZB/otwS+gpI9kStDbRd4zjtO6jtkWQvVpqwCoAwMjPn9V4RHCfSEIUgvjLYYpmYW5u9PSUHB67t2jqogU+55ViIRae/VlDsXoQdlNgAywZ632+9EDlbg/E/xpVHn/nKEufWCnOXDMi/P1hlrSGTAhuWQgx9WVNZ5LaSXAiNwkNCD8h3rAih7ex/Ba0koKOa/lcg+cRLlasAwxrplp2+H+x6KY6K5HJDBLfSTdHuY8kKWXgajbUsE4uLRqUPAapIb4r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?roYzelBvhY8fY4IjbTdWDWYWeLBVeCGQKdLAVwOIbj/ROcZUq3DVFUSXwBWU?=
 =?us-ascii?Q?srzXK+NArYa18lgc9oHpdFTnCV3Bn1c/BTr5u8vijL0wXkj7+o9VeVM+GFxG?=
 =?us-ascii?Q?tejHwj/tQA558d//WmGc8P/TR3jBPDuxfrO5j6xmo2KKVZyg0XLjgNzGW5lD?=
 =?us-ascii?Q?yCMClhvIvLlDKFTGj7KveTmsTA9TeUGkdckjz5LJqbuzQtnLnLtPWXlGc+Qa?=
 =?us-ascii?Q?9rEsict5zWRozMc1u33l2ZExAAFFKtEsncsdp1MWjLvM4+SpahFvXGadaOQ/?=
 =?us-ascii?Q?LsJM78g6kXNHiw3ycvK6GiIKqXRt9IEE5Q9bYsGX+oWPJZDz5Arsq6Dm/9gE?=
 =?us-ascii?Q?fesO3CCVomsz4JMCmqul+bBF9tlqKOEr2itmgpdlq3WvtD6h5hLdDJeUV7Pb?=
 =?us-ascii?Q?RHoHUuWbB7Q0Dl5SYGJ0XtKJwMWaq/2QYlI8ZtFwkgUCLrdy8EYIp9iINp93?=
 =?us-ascii?Q?Y2LlzAh8GoTRv76GTXt5TzurxLHsUlVwAmxyJjRYABQk3ProymvUrosHrufj?=
 =?us-ascii?Q?cG2fUdgJmZBF2oCHvZHoKM+cDfNIzAcqwnuYnPqX+PDaRVB1zmrGwGHVScLJ?=
 =?us-ascii?Q?gRM8No1ME31nuW5jbd1xqt2SvwWtCe69HhngsrTobRqq8fAAcm/6dc+PWTIH?=
 =?us-ascii?Q?ZyLmk9l7Q5aVXL0K7lVHtzu0jYILxBjjmAvIrJVYJEI2Eqao9ekXx+dRzQUw?=
 =?us-ascii?Q?U2tAqLG0kevgEbv+5xROrnEdM2TGtdtMPEXLB2hucqC6LhWZIQoCYXBfG4Ef?=
 =?us-ascii?Q?2JBbG5I+gyvnqYTfVo6LjAv6KDSaA1H2YQUnZHi5ks+R6TWN7cfDSvANL480?=
 =?us-ascii?Q?aWM5PSADOj7CIUFIwn8FwttfKZbNmNCxw7lC5NEdAFM0kPEXKbes94QoF18n?=
 =?us-ascii?Q?fQ467gDZIQxytLXrLNsN6wCzVdRf0jlYgkzq7uHIr3KA7POSdyRe/9cmK1jh?=
 =?us-ascii?Q?5knlIdTBEIweZyvXM5RxR/8/DqhhaB87QGEamt6wFlu8Ux+xMA/y19pjuu82?=
 =?us-ascii?Q?4OCkXJj+1l0JpRThwxs2G+bVrH2MVLpuy4gZHbqQkNgwIz01bv+rEc69kIfF?=
 =?us-ascii?Q?E1c5DshXG+4rM9N126TkGYAfKVYiKUKlCa5Xfs51aDHbcxQOnKh05170bEs7?=
 =?us-ascii?Q?veUASkdpEl0m6uWWKYkR1I7hBktam+UGWiLasc/58HavKl/tR32YApOCVYW9?=
 =?us-ascii?Q?NPLNnP9fDNfoEsNKMckcAUS+QYKTTZrvm4KyJDsT9yYE3vr/TxWj9mGKX9WW?=
 =?us-ascii?Q?9jOyJMUnvbyw5mJvDFB4jFoYvHOkE4wJFVgYdqkO/o+Zuas1jBnyYFAtUeVD?=
 =?us-ascii?Q?ugrUdS8kNqlnADfisPiMHH88?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4035bb-9e29-432e-8e32-08d900af0035
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:47.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuwj9dnqkqwUdVkEt7ktSw0wFgBbtXuVgDIua5qXkJB86XCwrMbwJdQ8rXZX/mT1d4g6IwzCWkt+Gf6JIDe3fCcsKh19adl5gj4IWLDum3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.20.123;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 94 ++++++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 52 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 4e39a5b1af..b45a0bd5f6 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -87,17 +87,16 @@ static void *connect_thread_func(void *opaque)
         conn->sioc = NULL;
     }
 
-    qemu_mutex_lock(&conn->mutex);
-
-    assert(conn->running);
-    conn->running = false;
-    if (conn->wait_co) {
-        aio_co_schedule(NULL, conn->wait_co);
-        conn->wait_co = NULL;
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        assert(conn->running);
+        conn->running = false;
+        if (conn->wait_co) {
+            aio_co_schedule(NULL, conn->wait_co);
+            conn->wait_co = NULL;
+        }
     }
     do_free = conn->detached;
 
-    qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
         nbd_client_connection_do_free(conn);
@@ -136,61 +135,54 @@ void nbd_client_connection_release(NBDClientConnection *conn)
 QIOChannelSocket *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
 {
-    QIOChannelSocket *sioc = NULL;
     QemuThread thread;
 
-    qemu_mutex_lock(&conn->mutex);
-
-    /*
-     * Don't call nbd_co_establish_connection() in several coroutines in
-     * parallel. Only one call at once is supported.
-     */
-    assert(!conn->wait_co);
-
-    if (!conn->running) {
-        if (conn->sioc) {
-            /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&conn->sioc);
-            qemu_mutex_unlock(&conn->mutex);
-
-            return sioc;
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        /*
+         * Don't call nbd_co_establish_connection() in several coroutines in
+         * parallel. Only one call at once is supported.
+         */
+        assert(!conn->wait_co);
+
+        if (!conn->running) {
+            if (conn->sioc) {
+                /* Previous attempt finally succeeded in background */
+                return g_steal_pointer(&conn->sioc);
+            }
+
+            conn->running = true;
+            error_free(conn->err);
+            conn->err = NULL;
+            qemu_thread_create(&thread, "nbd-connect",
+                               connect_thread_func, conn, QEMU_THREAD_DETACHED);
         }
 
-        conn->running = true;
-        error_free(conn->err);
-        conn->err = NULL;
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
+        conn->wait_co = qemu_coroutine_self();
     }
 
-    conn->wait_co = qemu_coroutine_self();
-
-    qemu_mutex_unlock(&conn->mutex);
-
     /*
      * We are going to wait for connect-thread finish, but
      * nbd_co_establish_connection_cancel() can interrupt.
      */
     qemu_coroutine_yield();
 
-    qemu_mutex_lock(&conn->mutex);
-
-    if (conn->running) {
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        error_setg(errp, "Connection attempt cancelled by other operation");
-    } else {
-        error_propagate(errp, conn->err);
-        conn->err = NULL;
-        sioc = g_steal_pointer(&conn->sioc);
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        if (conn->running) {
+            /*
+             * Obviously, drained section wants to start. Report the attempt as
+             * failed. Still connect thread is executing in background, and its
+             * result may be used for next connection attempt.
+             */
+            error_setg(errp, "Connection attempt cancelled by other operation");
+            return NULL;
+        } else {
+            error_propagate(errp, conn->err);
+            conn->err = NULL;
+            return g_steal_pointer(&conn->sioc);
+        }
     }
 
-    qemu_mutex_unlock(&conn->mutex);
-
-    return sioc;
+    abort(); /* unreachable */
 }
 
 /*
@@ -201,12 +193,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
  */
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
-    qemu_mutex_lock(&conn->mutex);
+    QEMU_LOCK_GUARD(&conn->mutex);
 
     if (conn->wait_co) {
         aio_co_schedule(NULL, conn->wait_co);
         conn->wait_co = NULL;
     }
-
-    qemu_mutex_unlock(&conn->mutex);
 }
-- 
2.29.2


