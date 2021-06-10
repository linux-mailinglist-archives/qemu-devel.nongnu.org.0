Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0D3A2953
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:27:19 +0200 (CEST)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHu7-0001Wq-NJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHck-0005gS-6I; Thu, 10 Jun 2021 06:09:18 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62941 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHce-00058S-Uh; Thu, 10 Jun 2021 06:09:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+3lCEkO/kciejhWSa8lWQlcoZQXMoeEyHLPgfNhpcjlZs4lJhz3JhXlh7bwdNWuUNUXJH9gczhLFewItuJgH25K7E2pOvfqhuI7ZmHAGqS9m8yO5r9SiLA2H1Q9RqZ7XxUjQRkwXhxsRsOlooq4N53gvnX1g3YX4FpoSshX6QDq/vaEw8Fzl8pBC0u8o7fhgG10alPNcg2QRUzsz75iBIPie5lpd6XOhwDVj02sdQfHtsOm9Zv3FovvYLwrZnKp8JmHv4Zad/FNWAPOTcCJfuxKr5ACPbP8SscaEUfk28vYt4QxmG2i7sD1CVEUu68fBgpEl5eAH1VQZ2ZP10fU0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhlYVTRDWP0iJSwzop4mhjRG6J8aSWLEZfS0I6YcjHU=;
 b=LC5v3Wg2V3efb3sy0giKTNq6s/9yDPN924LV7nlP9MUuRJSlJJlIuIYnaqU2WRDJP8WH/X2XSNeKYAW8aj4/y1qArK8C5rjz86Gk5eGHO+kboi6iN6QboaHJtaFRE/38Y5mdh9stdod0czAE0q1IeLt+jWEJI2tIG6jAVGaFDKMgSWRpRAIgX5b0/YfTWwWa9jEifkjLl0UfjALA+mDqzhALRrsHIpIWVi42plRmApbknaaFnw5W0Q9oy8QWfwpfhAhLEgGqXMFXPUDiSgaKsKhEyxcqumnrfelEG2st/m3NUEqE6CoJ4iMb6lz5FBsMQCDpneWJ5CXW2Wt+H21YrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhlYVTRDWP0iJSwzop4mhjRG6J8aSWLEZfS0I6YcjHU=;
 b=iyQUC8nkcG00eYkPLAt20O4sHLijLIREjgv13vch/S7uYCpVE12RhVDen/3pZx4TJWUYp9BYYIgJuBwMoorvjXgpuwiIevS7iLX6dH3OOgHLl7JUo4oWWSdDJw60+twXzZPfPVbqYAz+bKWfil4DHkf5WzX6ei/hVHddGDWsjzE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 18/32] nbd/client-connection: use QEMU_LOCK_GUARD
Date: Thu, 10 Jun 2021 13:07:48 +0300
Message-Id: <20210610100802.5888-19-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36d560ed-4932-4ecd-dce0-08d92bf7c7d6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6790008A0D387848CBAB563EC1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSQYgBzdBCOnLNxIHkqRNIgzBG4hlpwiBvhMWgBju39Ea30BIRdjXv5ArPaeBcNNj9plB+j9zKEHk+A9VXJ2JJvLB+Q34RC75trieD06HJ7CaraNY6xEnm11lVsFN0nNCRczafe6ISS7bLQYo66/3dCoav3xWohfq8EjCxiiiZnfHFiGT5SafJLZESIqD62iUwVzg/sT44ioHsw1YYymN8s0KaICRcR+qCuQ7NWCfIyvTAvL092XB/w6VIMP6MNxKEYB466ruq/2vIZ6AxpunLPBNemwPPM5Jf9yVd7r7QOmEb6WpKN6MmHN5ArXbrm72+eCJi9nbZYDqZuQitGJ0dbMDj4G6BAri2gh5npamg7UyGSf45vKyNM0Po7CcvZ6EMCiBMOq1224YVsRFbNJMPXV3I0osHeqEpZuV85AGU628rKLqIqSD8sUs6sQnMGFZyfOVqXMaoprx/XxKXIidln36Hti+8/hHD+LhZBnimH31Eo9V9IrwIMSlEjnBX8UyI0AVaZsjyo6S+bW4AYuKH/6PF+bnNNHhmq2ylgoN3J+k5tTZbI5k0k/UmSyCnEQhm0hpEdg3CZMLvM5CWj36OAbeTVklkPfwCbzpQst6JQYSWKwnik0deHSUAVPNLgoxuzkULVlLdHs99T4r8THqq/nTokPE4faBE3ElcLPGKTgG+vrPlDGprG5HPdCQYNH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?upXCGEfa06nFhZ5KLRbje7QO29V63PQdzVc3yrZAsw95O3XdzSFUCUabu/z1?=
 =?us-ascii?Q?qv6pL+Y9sLJlfe2kM3eZ6vw6MhNuiw8RXqUhAYu3ekEC3h3O5OXI2pDgiMrL?=
 =?us-ascii?Q?owSlmS7U3Fg+UXAW/Xbg97+NptEa39BsTIvZYE1b2T/mzE54DogcboKDXNnv?=
 =?us-ascii?Q?WYeqfevlFvhnz/GwtN8HT1fEqu+cLALdpFRiAMEDaRQ9piv7o3Hrl2S1dRt3?=
 =?us-ascii?Q?N8nYj9DnAPiyHW6xs0jlnUK+u+ZMfwsE4M2xe4UaFKZe9intcBEeKqFx6TTg?=
 =?us-ascii?Q?VanVuwSOz0KasxVMPkL534C9+MTylcaKAUDfLWk0fOyzHygbtx6bKbmHTI2r?=
 =?us-ascii?Q?wKJTbyq/J3Dwl007/y0HohKTb6lGXv38/r2wJDg0qNpz1Pg8SEYlJvwiTIzN?=
 =?us-ascii?Q?lumD6m3nE1KD67fwPIgv4E3vrGPfmJDi02jMnMMaBFB3QlZ7ivKBU9MeuEi6?=
 =?us-ascii?Q?uzu8tZW/PlVYTj5+AaffIntNs9l6+NDRPf2s9zB/2aNBQiAnZ7xhhczz5uxk?=
 =?us-ascii?Q?9Gok2yO+YjJNUVgUPi2M/ZPlXd3M3OCXZ3+GTVcrQDqaMK9UuC1H4Sk6OUb5?=
 =?us-ascii?Q?zpcVLmUF9Y04G6lOeoeHkhH2AYB6N8u9ebb/mDg8O4yNiAXdz79BG7pv0Jbf?=
 =?us-ascii?Q?Odz/WYalpU1ruNNhOj17r7PZdH2WBaWtS1LQlISYVfqCsVJ3LaHTndWXRDwY?=
 =?us-ascii?Q?4nKFZNxUfsuLlE+5clielysr0lguOxCnXvgfG9bWNusVkh6HZl/j6Dy8pcH+?=
 =?us-ascii?Q?xS9J2NSHXFlMgwMjCFNYrfuN3+Tmdf8JiGqoMgDOx1GuejCds46LbHnqttyV?=
 =?us-ascii?Q?uMwm3lmvkRNV1Hgj2iNjY/TTdyv9KhhfxcCqiy2U80T2DpItEecWEq6mN5Hq?=
 =?us-ascii?Q?3r+Iw6Xvht4F8O8uJOHtP17nWy/9FpByuUFDsxZXCaW1p/TRuAfMHK2w5UUF?=
 =?us-ascii?Q?WAtDUl2s5RzYUmUhIMGHH4rADU6T2iBVcfIZfIcueKyVTDROs3FM0RcZWaw+?=
 =?us-ascii?Q?qckhlbarHjg5qfAc5FtaEhOq9lFyXonknn0hqKPQwf0VtmiuFn1tdURLbKl4?=
 =?us-ascii?Q?S8TVlli/4GAINOINUohReA6MvNCJwEZfZzbfYrOotSFpWjCMP3Z57EuDSBEb?=
 =?us-ascii?Q?DbczXwabjcljD0bhwoj8GqN44KZCePqphOy8LcSKhuqMO8AsPkEOu7AtQF47?=
 =?us-ascii?Q?96GWy1GWPI3pscSRfI0nBHOqAqBPYgrxl7qnCHpdTGvp6BLYYuZn0jNSYkLX?=
 =?us-ascii?Q?SiG//1V5KRDCV+k+nux8rsb6FA4wiXL/kl8TtisQqWMcDuqHWHptgAVaraUz?=
 =?us-ascii?Q?Xd+T2fQeT81gUquGPpNYOeSY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d560ed-4932-4ecd-dce0-08d92bf7c7d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:06.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EBEQYIGfdXt5WzVVEcfwfOciBmFyz89iIOXgWRdt+BrLBmfkE+EXbib3oKziHNTSZ+sJQUyOOwQDaGQeYBK+qxxJUBMYCEWfxfg0BSBefNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We don't update connect_thread_func() to use QEMU_LOCK_GUARD, as it
will get more complex critical sections logic in further commit, where
QEMU_LOCK_GUARD doesn't help.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 99 +++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 54 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 31a129bf11..a18842a5a6 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -124,14 +124,14 @@ void nbd_client_connection_release(NBDClientConnection *conn)
         return;
     }
 
-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        assert(!conn->detached);
+        if (conn->running) {
+            conn->detached = true;
+        } else {
+            do_free = true;
+        }
     }
-    qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
         nbd_client_connection_do_free(conn);
@@ -149,62 +149,55 @@ void nbd_client_connection_release(NBDClientConnection *conn)
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
-         * The connection attempt was canceled and the coroutine resumed
-         * before the connection thread finished its job.  Report the
-         * attempt as failed, but leave the connection thread running,
-         * to reuse it for the next connection attempt.
-         */
-        error_setg(errp, "Connection attempt cancelled by other operation");
-    } else {
-        error_propagate(errp, conn->err);
-        conn->err = NULL;
-        sioc = g_steal_pointer(&conn->sioc);
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        if (conn->running) {
+            /*
+             * The connection attempt was canceled and the coroutine resumed
+             * before the connection thread finished its job.  Report the
+             * attempt as failed, but leave the connection thread running,
+             * to reuse it for the next connection attempt.
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
@@ -219,11 +212,9 @@ void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
     Coroutine *wait_co;
 
-    qemu_mutex_lock(&conn->mutex);
-
-    wait_co = g_steal_pointer(&conn->wait_co);
-
-    qemu_mutex_unlock(&conn->mutex);
+    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
+        wait_co = g_steal_pointer(&conn->wait_co);
+    }
 
     if (wait_co) {
         aio_co_wake(wait_co);
-- 
2.29.2


