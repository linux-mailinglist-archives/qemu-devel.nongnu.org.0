Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDB6361B50
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:32:18 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJth-0005Jh-EU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYF-0001Zq-KF; Fri, 16 Apr 2021 04:10:07 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:39777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYB-00087j-8L; Fri, 16 Apr 2021 04:10:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0Hj6yWTXUh8CjK4c4HKZKyyTNA9X0AiiQ8R2O3PezJM380Mv5FOAjrBxCk7ns2oOPkdimd/nBrraSmZfZHXDtSQglHlbwdKRCwmCTs8FlSOzeHabkCaVWht4ivWSGpO4XscnTlYX0LH/eDn2zilJbYsg4wFliyF8gVpshjulxJI34rK18H/7IjAKNchLZhshQs9t9s3+MZgg+gOpOyQLnKXjEVDf1VNo5SxRDj2BGQcT3II6SZbkbKSX5uYtKY/cNh7Dn8Xq9+1ciIfYOghEaAl5d9nJk2oZ89J4YclI/vKs0y0pJUDBOBO72CroI3lmk0zBTYccBB7Byzv9nl+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbdZdnVSpBE7cr6CX7U3PHJ1wE1Qt4mkg+T0vtS8HXQ=;
 b=ka/kpSlyPKOObP14GT9Y4gwNtnmGeVeCA5bmiK351O2KV/+TQZNcCFfXaj1C1ogamQrrNZWMj/8V8Ox5T7FdqQCuSlkuExTpO9A7Uc083SaxygCC5Cbx847dWNx26HZUs4NjAXFLK4nN+D2SnIpq9A/wRbhUpB/fdohfTzo08Uf3PTTL8VjIJLxLDgBlw+iFWmKvu1cIcjiKwyHlRmiuOedDKfM0F7VamqdqWrGsIS/3TmuljKyKzsnnUbrd7MF8QBcS9IWADwWhcNdcCTLJLiRpRVJJ6N2A1ipTQJoleaWAN7HESBAgODErSjIrqDTq6dOnUU/ypbKVZVIKh+Rc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbdZdnVSpBE7cr6CX7U3PHJ1wE1Qt4mkg+T0vtS8HXQ=;
 b=NXEU4qFl5rj7RobWW1sISS+NGKf/1wlVhOcgzcVSvwpC7XuD0OM/3uRNNgrtOvgBV3qFpnDc8hYZQnDyKV3hSMXLcaUzw6WOjt5J3grw7ROLk8fPjI/NmYSwnsrlalhz+txzdgCFVAuY3EW/BMdQ6cYLyi8Eo0Bshptgemlrl6I=
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
Subject: [PATCH v3 16/33] nbd/client-connection: add possibility of negotiation
Date: Fri, 16 Apr 2021 11:08:54 +0300
Message-Id: <20210416080911.83197-17-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a6e5477-c4cc-42d3-8c77-08d900af010a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691AD65F6EF5387FC126C9AC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wc6DtUajFP7vy+VkbOBtvxmDbDmY5bgiI0MmPyOZupWVTxI0q0s4UAN+u2G4XT+g7NDNHlFciK9EcVNrvWC2E3gJxI1FP6v0L8SrPmVqkBs24aFOU341xCJ7fj+Y1JKyopxU9Uc64UafOZcH+AW6So08AUPKgslAYFmBKK6jF0xGV1XHnVEWnTlRZfpzWBw01d6Pj/vFlAtOi63RALr0m+NRO43yiPTzFVfs8vWiGUixAK4HS03BemaVDEKTqwTl1ICWlzaR6g8LvQlOemh3g/vbZIyKMK524iknimg/tYCk7CwVlcKPOkTMS+DYR7J1EKwt5PvsmDiKCoM4y5nQzzP6MMUJkHpgTflb+YEkVDMIvWQZGOSPh8HgYsbhrIgJD9/xpecLawOBYBAFDaGn6Q2pyji3tCEXfrNb5meOqmeedSuts3Zcxv8TqCuNPGcjucE7NP0SupEB13e/I/uOS4UjmSq7BddGhmDC6MHhZZpnz4We/N39b04p7L6XqnmNhJzQQ/g0NF3BIahwV3RL2jZpJNzq7MfmGTWT/px0SN342Ii2oltRwsAVNsa8NA4pTJVifInFx+Co6QfeaOnRRP3I7fXeoHgYp3/9muTGf/nhd80L5CkGgZobdRUZ72U/p3b8MNEkyyw3FO4b7A31IloqV3r4R8W4fWHoebhK0LXorPFCdpIWEKZFmEY1ohp0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FQ5q9RV2HoLZpI0GVL399DlgG8LsBjV2GVhGsgIzK38cjRbYkmgDLWlHjOK9?=
 =?us-ascii?Q?xHXjsPtv3AMfZWRZrBdm/3BZVoP1BsyjLi+H3lDlCInT1qlP3e9j5oEcJlF7?=
 =?us-ascii?Q?MvVg86n5lFZQwDrjMvUBbii7pH7Dr9qwD3rvEblcxflAjzi6ASdas7GlKNHY?=
 =?us-ascii?Q?0ENKPfQ0o0GJg3Fd2mae3B6oWF2M+iq4QnWvY7GYEmfKXqTwQd7xEhck1mFi?=
 =?us-ascii?Q?JqDw77ehaKIC0u5Jb9t4cs5vJaO+g+bEVNxg6egLCLZPkVrf44GxgECOQD1P?=
 =?us-ascii?Q?OfZ+r0Ym4LduBwJJSIdn8b8OzOQE5QYkTa/hENMFCSlQJSm6oKJy5aSPOckd?=
 =?us-ascii?Q?7t0ZycX3avWSFuk04fVW5aiEDexJlONH+gpo7PMVXGHjTSNI73EEnGJjNFOq?=
 =?us-ascii?Q?Q/ce0wHjCd7r8GrK9eJPOGwZuDRn7u1mzf00iidlJ7oJAbGtaLipTh2TMzIr?=
 =?us-ascii?Q?Fl3/9LsCb4MDW5OXHhMAl3fYJgqQsaHCVJjf/soU/QhVnAfIgRsmW2xV3r3W?=
 =?us-ascii?Q?VkhtrqQVdA5XHTpSNnDO2zIjk2sMG91uYyDhtznnyZvHqpFzkwyPPV59sPbY?=
 =?us-ascii?Q?NDu1GC5sCRuFR3L/3FTZ3dIkKw5D3c6RuEk647Vb2Sp16aGba+kRgCMaqSS9?=
 =?us-ascii?Q?533acLwPax+L4Sc3q9/QYJiU8EsfJHXL4IIsCeK1AElXPvXNLBU8SIRaQVZV?=
 =?us-ascii?Q?W91PFMe0dS2H/s7BeCvDWSb6wrbk4KCWGGJpyltiSRkDt5Qb1I1yHAN1LwuW?=
 =?us-ascii?Q?9FgezZgk0wYxJwSidzfI8OmvdWtNUMM3WT0jxcGGOVOeAzPp7yrgodBKCnnV?=
 =?us-ascii?Q?rgl1cT9UCi1ekT8cQTPZD9AI8VdqsiROeuZe7Siv/jrcWGR8+pVxcElMdd7R?=
 =?us-ascii?Q?BjmtwtCRR9LXxgVJQWx/m6DDXB6UO4L6zY7kcCLPgWy8w+2vl+Dqh8Qwqb2H?=
 =?us-ascii?Q?r/SirHX6IJ0+dnL7J2Y6gsbaH2LZW80IfsQIBKxSwjnbP5FO10BIu64wsPL6?=
 =?us-ascii?Q?mzAbpG8KZ9Gzr8M1bt8yKWu+sAFqq9jszpGU25rNqq6gWblSJgp1BiSrrhTE?=
 =?us-ascii?Q?Jz3mMq4RM3sU+SHgXE1sFViBiT2A+7WaIDcq3pHVJN1NEGIFxSh8mIWxae47?=
 =?us-ascii?Q?bdnkUc2FPT2ouy3O7YAJJ53Ic1TtkE5EGP2FQd3HgN8JHx6TFO7YeC/5ry+9?=
 =?us-ascii?Q?NYDwEg0qkfpLZaFRxMWWhc1Aw9uCyESEmY971Y0+v32hQhXxbriHwRWDs2mR?=
 =?us-ascii?Q?okwOqp1vnk0Q3w54uTlEkHWhyxc8ycy8uoixVQLHBYnjUXJlvWeTFqO7lRba?=
 =?us-ascii?Q?TqAOqYpQ1DtlBuLNg37ImNYd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6e5477-c4cc-42d3-8c77-08d900af010a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:48.8342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvLts80CXUXrOY+xbMLr+0BEv06cSieNq1mk06q/XvR2fdzw46JAZ3MzdC3TRbE+jE12jlY6OhVkI5Qwz1UaIXnglDbGviFSXn0np6sHHSM=
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

Add arguments and logic to support nbd negotiation in the same thread
after successful connection.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |   9 +++-
 block/nbd.c             |   4 +-
 nbd/client-connection.c | 105 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 57381be76f..5d86e6a393 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -409,11 +409,16 @@ const char *nbd_err_lookup(int err);
 /* nbd/client-connection.c */
 typedef struct NBDClientConnection NBDClientConnection;
 
-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr);
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index 9bd68dcf10..5e63caaf4b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -361,7 +361,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->sioc = nbd_co_establish_connection(s->conn, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL, NULL, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
@@ -2033,7 +2033,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
-    s->conn = nbd_client_connection_new(s->saddr);
+    s->conn = nbd_client_connection_new(s->saddr, false, NULL, NULL, NULL);
 
     /*
      * establish TCP connection, return error if it fails
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index b45a0bd5f6..ae4a77f826 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -30,14 +30,19 @@
 #include "qapi/clone-visitor.h"
 
 struct NBDClientConnection {
-    /* Initialization constants */
+    /* Initialization constants, never change */
     SocketAddress *saddr; /* address to connect to */
+    QCryptoTLSCreds *tlscreds;
+    NBDExportInfo initial_info;
+    bool do_negotiation;
 
     /*
      * Result of last attempt. Valid in FAIL and SUCCESS states.
      * If you want to steal error, don't forget to set pointer to NULL.
      */
+    NBDExportInfo updated_info;
     QIOChannelSocket *sioc;
+    QIOChannel *ioc;
     Error *err;
 
     QemuMutex mutex;
@@ -47,12 +52,25 @@ struct NBDClientConnection {
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 };
 
-NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr)
+NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
+                                               bool do_negotiation,
+                                               const char *export_name,
+                                               const char *x_dirty_bitmap,
+                                               QCryptoTLSCreds *tlscreds)
 {
     NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
+    object_ref(OBJECT(tlscreds));
     *conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, saddr),
+        .tlscreds = tlscreds,
+        .do_negotiation = do_negotiation,
+
+        .initial_info.request_sizes = true,
+        .initial_info.structured_reply = true,
+        .initial_info.base_allocation = true,
+        .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
+        .initial_info.name = g_strdup(export_name ?: "")
     };
 
     qemu_mutex_init(&conn->mutex);
@@ -68,9 +86,59 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
     }
     error_free(conn->err);
     qapi_free_SocketAddress(conn->saddr);
+    object_unref(OBJECT(conn->tlscreds));
+    g_free(conn->initial_info.x_dirty_bitmap);
+    g_free(conn->initial_info.name);
     g_free(conn);
 }
 
+/*
+ * Connect to @addr and do NBD negotiation if @info is not null. If @tlscreds
+ * given @outioc is provided. @outioc is provided only on success.  The call may
+ * be cancelled in parallel by simply qio_channel_shutdown(sioc).
+ */
+static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
+                       NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
+                       QIOChannel **outioc, Error **errp)
+{
+    int ret;
+
+    if (outioc) {
+        *outioc = NULL;
+    }
+
+    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!info) {
+        return 0;
+    }
+
+    ret = nbd_receive_negotiate(NULL, QIO_CHANNEL(sioc), tlscreds,
+                                tlscreds ? addr->u.inet.host : NULL,
+                                outioc, info, errp);
+    if (ret < 0) {
+        /*
+         * nbd_receive_negotiate() may setup tls ioc and return it even on
+         * failure path. In this case we should use it instead of original
+         * channel.
+         */
+        if (outioc && *outioc) {
+            qio_channel_close(QIO_CHANNEL(*outioc), NULL);
+            object_unref(OBJECT(*outioc));
+            *outioc = NULL;
+        } else {
+            qio_channel_close(QIO_CHANNEL(sioc), NULL);
+        }
+
+        return ret;
+    }
+
+    return 0;
+}
+
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
@@ -81,12 +149,19 @@ static void *connect_thread_func(void *opaque)
 
     error_free(conn->err);
     conn->err = NULL;
-    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
+    conn->updated_info = conn->initial_info;
+
+    ret = nbd_connect(conn->sioc, conn->saddr,
+                      conn->do_negotiation ? &conn->updated_info : NULL,
+                      conn->tlscreds, &conn->ioc, &conn->err);
     if (ret < 0) {
         object_unref(OBJECT(conn->sioc));
         conn->sioc = NULL;
     }
 
+    conn->updated_info.x_dirty_bitmap = NULL;
+    conn->updated_info.name = NULL;
+
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
         assert(conn->running);
         conn->running = false;
@@ -94,8 +169,8 @@ static void *connect_thread_func(void *opaque)
             aio_co_schedule(NULL, conn->wait_co);
             conn->wait_co = NULL;
         }
+        do_free = conn->detached;
     }
-    do_free = conn->detached;
 
 
     if (do_free) {
@@ -131,12 +206,24 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  *   if thread is already succeeded in background, and user didn't get the
  *     result, just return it now
  *   otherwise if thread is not running, start a thread and wait for completion
+ *
+ * If @info is not NULL, also do nbd-negotiation after successful connection.
+ * In this case info is used only as out parameter, and is fully initialized by
+ * nbd_co_establish_connection(). "IN" fields of info as well as related only to
+ * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
+ * include/block/nbd.h).
  */
 QIOChannelSocket *coroutine_fn
-nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
+nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
+                            QIOChannel **ioc, Error **errp)
 {
     QemuThread thread;
 
+    if (conn->do_negotiation) {
+        assert(info);
+        assert(ioc);
+    }
+
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
         /*
          * Don't call nbd_co_establish_connection() in several coroutines in
@@ -147,6 +234,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         if (!conn->running) {
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
+                if (conn->do_negotiation) {
+                    *ioc = g_steal_pointer(&conn->ioc);
+                    memcpy(info, &conn->updated_info, sizeof(*info));
+                }
                 return g_steal_pointer(&conn->sioc);
             }
 
@@ -178,6 +269,10 @@ nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
+            if (conn->sioc && conn->do_negotiation) {
+                *ioc = g_steal_pointer(&conn->ioc);
+                memcpy(info, &conn->updated_info, sizeof(*info));
+            }
             return g_steal_pointer(&conn->sioc);
         }
     }
-- 
2.29.2


