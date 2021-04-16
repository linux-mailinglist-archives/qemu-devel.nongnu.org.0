Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6937361B67
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:34:17 +0200 (CEST)
Received: from localhost ([::1]:54052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJvc-00075A-Pl
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYF-0001Zt-Kf; Fri, 16 Apr 2021 04:10:07 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYD-0007xx-AM; Fri, 16 Apr 2021 04:10:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw41YnIcuSgjCAmxBMuIMvR4fYgLp+67zhFc+Rt08f0ci0yRVXubKzkx149ubYekWTTv0mzJYoAbWrSpl7q4T7zbUegKz4Vj9hh4Wdeui73NezRoXABRUaA15Zx6mCVK1BXQtgr9eau9cszo9IuTR1wAs6SvAxJQuWVm+lDBsm+cCuwYDcXHIi5bS719/MzJLgIB7e7qfMvACjL0dzZJSGL9YB6/cxmGqcwshgyJBZpeqfqYqHrORlJnrA/G66vIoJFu67WnUKX8NLQRyqd4kQQ1j8bhTh7+tCOvotIsOT5NAI69gI+9rOtZJ5SoYQ+Tbt7/ayEaklVcKgV0dfoyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqo7qi6WjGjXWGfNa9dVmcOaphVFfX0ksXZlZG39yh0=;
 b=aAYXg4gDflHtnloyy2pm/21EYLOAOAm+AbuUTVZL/cqDzzstyXgZLYEp17MIVMm/8cgymQxlcCFMhbphvQ2G1NNZXdvHUH5FO2eHuz2/3F/JRJPDjqOD7n+Vw7F1668rLCjzW6BSN3mcfhyQ2peUW1Sg+7upxTAWJSAddDeOLcvsv1FerNXopgPF8MlmcpXEKecz6aKTd4j3w5/NGbnGmagUMWV5BN+j+LJ/GDAi6MEHRcWOUYU2pG6PhYrrGwikUtRLyVg2e0/sTB5C0zI5toX0KKm+YjmVrQuRsI4mNXtWd+lP4ALBsj863H94u2Y/St28eNoNYwqTS5rSzPxRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqo7qi6WjGjXWGfNa9dVmcOaphVFfX0ksXZlZG39yh0=;
 b=FJrQGNeicfXuJhA9ffiwcKQmLF8z43mDl8Ba2BFrLwj0l07bbEKD9eFiFtdg8YOxBn1tPshMvoRkN/6uW5oHYYUfb9I/CFNG9Fvr7hru8n1ucELjtvqgzrGA1KZVq4rn+mQhfQbdzfvAkhr1ggM/Su3mtDHGyVjB+k2YQgfSh84=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 17/33] nbd/client-connection: implement connection retry
Date: Fri, 16 Apr 2021 11:08:55 +0300
Message-Id: <20210416080911.83197-18-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cd8dbe0-0666-42e7-3ffa-08d900af01d8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691AA02D1E1D43CC3637090C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G2cElnWA0zZI/A5W5UnFsh9cBSW4TnORGVGerCQW/tixUnxRzYnT8xggdH6KCJcbOYeKeKzjxTLLSoXAPeld3e8+Gr/+TbzyZGR21VjjhashDu7+KnMjYx5ZNsGmGk4vZi1D8aN3LQyO7BibNpzjfgPG8HETsMV05S7JyChkXHjAgTj9GOGkVAtLZP9QNL5mWgtBbXxGye73WbBf6Bvhx21KyDq3G0rUg0YYX/S2dmaoAJkGd/YqBUd8+urMNCgIagKWCfumhzjqizIC49+sOt0xsKfqZt/GNVmYoyA20dYluU/+rSbXbZbzcBAQSpf/xXN3gEvei7XxeOIcoMc+DoblEzOMdy1vMTdr7Z5FVuh86HO+7JW1liKCwOwjXOJmA3TXuHL2yK6/NJs16JK4rNg9Ng3kF4UIklISsJPGI7ZwhOCdNx5qIkoALPj6Z76INpU078jPdgLv/isTSSaePkmJ9PxiYjaZulF9ABB+oXeXCZBMju001uuDM88xUqV6CS/pky3KGxxaVcOTlDDB0kS5birgzgWraf1VPR5AAsb6jiGmaWEtSB+6DgbL7n99sbNC+O0TBPel+OkgvHQ2X2iFxMDI2c7px1PTjS01t3nyTF7V4Xqaqj+FfYZctm7taCGnLaQwY9HwNSeNq8bGlFfZWYatdJXl5g1dcg1XZvJJf1w5dOm8y1jUx7Va3NOw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T5s401LQyxSwFfX5SIAPjykkmDF0GpwWqq2CS3N2sPTdllPSEGkxWVEwOngV?=
 =?us-ascii?Q?4V5d1RFI7is9Zn9YxTGsJI/ZIOE68FNjqqrpdexTBnLMDxWfe5de5pH5Ot6E?=
 =?us-ascii?Q?acDNKPhwBxyevWhnhvcLa0KEuSL/356v06VopbpH5hmD3W5020iueRzVekKr?=
 =?us-ascii?Q?VaUTFq0uZA/ssOddGsXxSYxGz+SpPX0votxoxfxq0BVyoj9TZP047K38xWev?=
 =?us-ascii?Q?+/HhF00h6vx9/sprUyYXCeyKTq3R0C3CeudKjOa4PTwCjL0u+el4PFcOaeAM?=
 =?us-ascii?Q?2dVXs7CyH8tljvVswP5Ohf1DVnQvyxGP0Mwm+84U0/b77OQ64F+kYcJHWGqa?=
 =?us-ascii?Q?N04XH79ZzTllQLt/Qn/rHz+PvUrSWyIUX377GJPaI2nwzi7lmcutZduFeF65?=
 =?us-ascii?Q?8fzPr7G9cVgQWhk3/wTYyp7Nq0R+6s7nafY0YoRUHrnuls+9+4X9wbsca7tk?=
 =?us-ascii?Q?oDaALaLmbXs4mWfKzp7QSLorrSxxmbqCLSzJ17RVKcvSm1oAactq+fCDf2QX?=
 =?us-ascii?Q?T/ojyGAUeJ6rLQ0kkhWFM0Oq4xLFTLq1S5m3oa1sMBo+v/+xjxznLQXsN8S+?=
 =?us-ascii?Q?aP4P5w8lDUZ4LQBypjaKG910dGRGgY1qOHzKr1pli2rJ3ruo70kZJR2flQWQ?=
 =?us-ascii?Q?g8Oe6jVUufluiSQInHnbE1C41JLkjhqs7IKWUGmHUDEUTcx6Qwwy77aVCsfS?=
 =?us-ascii?Q?+7qgiewTtQ1bGq6KXmtF9ukVeAtrjLZqH/EYxdI0D+2nREacRMaP0NI4alAV?=
 =?us-ascii?Q?TaY0lTOjI5TuTDIl72Llxqwj4fwBB667YowhI2gfk1ZEoCL9AIhKDwPnRHck?=
 =?us-ascii?Q?79OO/MP97lQdUz4FadixRG1HF9Yfs5LD2ohHfjfysLLhCPDjclUhjMq6E5Ol?=
 =?us-ascii?Q?v2bh/gxohwwLtRfxs6E2DvEj10rTMKsOoHIUoAaaxR2u2ecyAfiS29j5qMa9?=
 =?us-ascii?Q?bISsqNWH/NoC/vkLgSTy1vBhg71B0VBxGX/qbljXCucGKBKpk41WxBtFroYX?=
 =?us-ascii?Q?n/qjjw0n/3VEagTZWYu+X/K0+3SQfFVcZiegYythVWe1PEKF4h6x1qDmwSJS?=
 =?us-ascii?Q?GJmATIwc+8IX6AuawRoY1Qo7QWJDvjvXBOuaSUaFH6NG0NG9AHHJzen1iI2l?=
 =?us-ascii?Q?81TMhrNQuz8fcC6OZmRp8F1ZsuHFycLDMinqJn/DrEssntHAr0cxBaBuHwbE?=
 =?us-ascii?Q?Ga9IrFULubS21AASLRmD7eiqW4NON0ZOx+WERqTcDrSrzUsbD1PUk4wyBgVG?=
 =?us-ascii?Q?8//LtpkLI0/+b6ivBF88WuHlj3sq9oUCPP3GGIpPJTpyKcpkjen9v0t3DoFY?=
 =?us-ascii?Q?a/0EvMxxJ/sivdSj+ZVEqvux?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd8dbe0-0666-42e7-3ffa-08d900af01d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:50.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLGzI4+nbV21+gCCDvKEu6ZhsOP4GAMuwIimVLuzEjy0piwbdd6DBB1b0kGDzD7BSlI2/TTXFcZcVL+LuBiq4awUhbBYW6P7hbdP9Z/AuFY=
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

Add an option for thread to retry connection until success. We'll use
nbd/client-connection both for reconnect and for initial connection in
nbd_open(), so we need a possibility to use same NBDClientConnection
instance to connect once in nbd_open() and then use retry semantics for
reconnect.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |  2 ++
 nbd/client-connection.c | 55 +++++++++++++++++++++++++++++------------
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5d86e6a393..5bb54d831c 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -409,6 +409,8 @@ const char *nbd_err_lookup(int err);
 /* nbd/client-connection.c */
 typedef struct NBDClientConnection NBDClientConnection;
 
+void nbd_client_connection_enable_retry(NBDClientConnection *conn);
+
 NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index ae4a77f826..002bd91f42 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -36,6 +36,8 @@ struct NBDClientConnection {
     NBDExportInfo initial_info;
     bool do_negotiation;
 
+    bool do_retry;
+
     /*
      * Result of last attempt. Valid in FAIL and SUCCESS states.
      * If you want to steal error, don't forget to set pointer to NULL.
@@ -52,6 +54,15 @@ struct NBDClientConnection {
     Coroutine *wait_co; /* nbd_co_establish_connection() wait in yield() */
 };
 
+/*
+ * The function isn't protected by any mutex, so call it when thread is not
+ * running.
+ */
+void nbd_client_connection_enable_retry(NBDClientConnection *conn)
+{
+    conn->do_retry = true;
+}
+
 NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
@@ -144,24 +155,37 @@ static void *connect_thread_func(void *opaque)
     NBDClientConnection *conn = opaque;
     bool do_free;
     int ret;
+    uint64_t timeout = 1;
+    uint64_t max_timeout = 16;
+
+    while (true) {
+        conn->sioc = qio_channel_socket_new();
+
+        error_free(conn->err);
+        conn->err = NULL;
+        conn->updated_info = conn->initial_info;
+
+        ret = nbd_connect(conn->sioc, conn->saddr,
+                          conn->do_negotiation ? &conn->updated_info : NULL,
+                          conn->tlscreds, &conn->ioc, &conn->err);
+        conn->updated_info.x_dirty_bitmap = NULL;
+        conn->updated_info.name = NULL;
+
+        if (ret < 0) {
+            object_unref(OBJECT(conn->sioc));
+            conn->sioc = NULL;
+            if (conn->do_retry) {
+                sleep(timeout);
+                if (timeout < max_timeout) {
+                    timeout *= 2;
+                }
+                continue;
+            }
+        }
 
-    conn->sioc = qio_channel_socket_new();
-
-    error_free(conn->err);
-    conn->err = NULL;
-    conn->updated_info = conn->initial_info;
-
-    ret = nbd_connect(conn->sioc, conn->saddr,
-                      conn->do_negotiation ? &conn->updated_info : NULL,
-                      conn->tlscreds, &conn->ioc, &conn->err);
-    if (ret < 0) {
-        object_unref(OBJECT(conn->sioc));
-        conn->sioc = NULL;
+        break;
     }
 
-    conn->updated_info.x_dirty_bitmap = NULL;
-    conn->updated_info.name = NULL;
-
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
         assert(conn->running);
         conn->running = false;
@@ -172,7 +196,6 @@ static void *connect_thread_func(void *opaque)
         do_free = conn->detached;
     }
 
-
     if (do_free) {
         nbd_client_connection_do_free(conn);
     }
-- 
2.29.2


