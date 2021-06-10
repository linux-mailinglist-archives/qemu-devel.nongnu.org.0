Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8B3A293A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:19:51 +0200 (CEST)
Received: from localhost ([::1]:41910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHmw-00048g-CB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcm-0005lG-ON; Thu, 10 Jun 2021 06:09:20 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62941 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHck-00058S-QQ; Thu, 10 Jun 2021 06:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0ljRkeOMuL2wN82OR3TZrKJPn4wV5o9IWy8txOGbUvaMxvavqN2VoHhnnDe81W2hjiJ6W0ccpqLS6W1Hi1CSatG186QWZX+HNgMQOljkpdt/LdNJAabGbOseFTsprJUR2PAydtQcHkktI5DufHNtdB3L/YEfYqkdCu0lCBackNUvG/49PrbFU5J9diCvwhIbuWr053H5L2mvTSL6w8LxpYxiQfPqPCWjlp43vOlogDntcbM3kvmeF3hMz+OvvyNSq3hbD7t0etJyjC7y7yfgRrMzCfdQwfv2XtNWwTY2MShJZZYm+Jkiyz2dRkKKaMueuDNgu49aU3byyxv9tK7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw0bCr+9Q6G2GI7VVFwIKU27oWe3ZWJ04ySwl7wl4Xs=;
 b=L8m2r8tLXTgUOHgtWUAAaHQRHPDvco2aeVqhyH5/gYeydoiUV+M56f3yxP+DgH6ZtJvE+64PRPN1KeNOWVDr27GwcQcX+Yz5RBz2agMan97CTF7723hg7ryFtsUKf0A7xnhA27Z1bvAjRwjmMgM1slFFrI4/ZOVHqWt2hXL4fYOhs175nTeq0tJf+c+TV30D6ajwDEV9h3soOgfMYkqluefABeD2Wee27qtewm3xEScyzDcJ3C40qCeUY8rEB0zfm8W8kBLQeMMzY+V3tenfr/IuwT7g9zcPbIMxN/g5Elqjtpjp1M9fJNWiUsWl3nw0gLOFg2dcALUoHsStK/NAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw0bCr+9Q6G2GI7VVFwIKU27oWe3ZWJ04ySwl7wl4Xs=;
 b=k6Ty34qJkIK+382ZcDfO1OQTng4ZuIQTUJHDKkQnT6pbNz8yvDriqmYxvSv9Ab6vmYjPi7FmnsUATjCXWxI2N/7hJtVNT2iu7JC0ZJpwZGNpGmXKD/K3Y/5TOibPcQNcmSWEF0FBhkYnFA41NhLDVrvPG2R64t55dGDsCtFt+kI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 20/32] nbd/client-connection: implement connection retry
Date: Thu, 10 Jun 2021 13:07:50 +0300
Message-Id: <20210610100802.5888-21-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79977c08-c2e0-41ba-edd2-08d92bf7c943
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB67904C1E19D8737032EDD2DAC1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8C/P9JWDWbUN4+49jMtX3vw11UFxeIEMzMTpXyc8D993ha704CmACCcG2UY3nizEFHFiUQKKUS9ywpK+/p2p7yBl0AJ4PlMhb9DvywsOOI2f3363XELsXUJi9S4seeH6zEoUtSdAJq2/zSI5CxLRDBIX72qjXcBFxzmfp9PquS7br/7rZuC9S9X6lbxmrJ4uJZn2+VvQWQirXFjz7YW/gcrgZcpLIK30MRUf3li33+UW6+tXe0NTA3YBdawa3YQZJB/DAtOPRoe7CDd2O4VTKASeSRhYIZlpYG7AOT6EMIRn9TuCB0eYNRUZpcvnlF80LrIER4ZV+J4iu+5rXCEJDRak+Ycq/kIyoCPHtPvkCcUWy1xNXO5s4VZXmyP7rwk308/1/W4ItnxlUxX3y1Q8SWLrmnMsfmu3jxtq4Rdp2anDO6ZRrBDVAfLgRaSsx/dHk4Sye+j6qQ/yIKgY++vqE1kYroFLNzjyrh7P+VNy110irpYS2wEoFtqSAqZACiv031Sc70vrReAkWZz9go0RUUU2p+aXu78FQJYLlDMcvArCAOza0/+N9vw80IKVTlGDpVi0udUh/UujoWugs+mGB5qlwwA6GSXR2Wetl4ZOqBuD9O7TIwWXQ04bEAbAptwXzhAznnxb69Im0qXIjXqY4eySiZ2jYwGkDGSVqDFj8y9gBIPcizA9PA6jnMvvjxV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TJlCkxWRMoLBZCHGdXhvYJkzYC/ckDr0ciNVGxF0+AY8+v/Ij+w1d8HR7XPS?=
 =?us-ascii?Q?8sF8uP+g+28RirbEi0hiAfq8YPwOsfpMG7NSFVh6AkUREMj6v5G0lCgikBNr?=
 =?us-ascii?Q?JSGh8y5UmBQz2oBmC2VuxWnVfibr2pKa6ihLa5hdzYlrdcfrMarzi+26zdez?=
 =?us-ascii?Q?8VbAMFvtF9Kjn3MPzkiWNzoc0ieau32wlssT80hseRWlrzANu3P0FeAAOdaT?=
 =?us-ascii?Q?ZJklZCNvjcrZAYDlxwJR2dB5XQKfsldInjZ3RfcspFkIe3aKv/2NHL6p2ugi?=
 =?us-ascii?Q?NTI+xw5n7JCCb8u2mJlVccDEvgEUAgoq+xf87HwCOX9XWGGl4zo8pMjOXd9n?=
 =?us-ascii?Q?KwRsFDRwLa/o1f4+BbGaglYwiqmEny3YkFjqh5/mem1TMOA+Z8kPgQPDXsac?=
 =?us-ascii?Q?Nfy5V4ZvXZH7bd36nlTCwKcOwe9y18Q2pV49FQHHRQzTpj4ydFxM/jbfwzSH?=
 =?us-ascii?Q?NOmqrnDynCIsDP3eX35MUIXaLmjwVb362JoRG7Qa8MO/Fv8aVOLD4xrgfIM0?=
 =?us-ascii?Q?OPooUCiagfQhvM19x9bl3vRWuP1be7PaJaxlhKzQ3NVREAOXGuHKE0Lmf/WC?=
 =?us-ascii?Q?yZXvJ7+kWrxaguUmPVwPpZGofTI4OhdoebGH5ikMwBToDZkwEWPFjonRRKrr?=
 =?us-ascii?Q?ChlDrMzxdqY9BiL3vIWOZAlOrRd4t1PUjGhr3t3Sq+5umrwHE0F4Fzp1YD7a?=
 =?us-ascii?Q?1huBfhNQ0Xixwb5UQGK0O8SCgUlc/DwuKLEmkniSEiJHIl53iseUVEMx1waF?=
 =?us-ascii?Q?kujkpTamFYP5z4rZs4/5yIb9p5gTK0XobCwnYciTz36ooGjTVH507IXLG98c?=
 =?us-ascii?Q?FBaplw8zGqiiJTrlxFPjRDUBCm+JDovl42Rl6p/g1lnXWpvb7i+bGzZFzbOB?=
 =?us-ascii?Q?2A2OOHYG0NZ5VqKpiH7XjRzE/IsTA54GidIVNxWe10N4GKwrAWGMcAe2Y6rR?=
 =?us-ascii?Q?VKhM6aNidC/EAETkECJtKZLirL33VJePVmkcDU575mlxPWTQbQpWO2GF2SDm?=
 =?us-ascii?Q?gFrAgxKeazwACzU+Cjv+tsmY7p2mEoFs0rCHXN6FVnRim3+9ujE42Wb6FmCS?=
 =?us-ascii?Q?D+izScaB7BmCIr22A7WJo+cp5Qjycww4q3ocLt7XXaSy/3bxU0+lVadx4opD?=
 =?us-ascii?Q?W5hd36RAo/2zOrKn/wsuCvLFhXmwvUlpWQbb2XNnkzLDY+W50/DAAE4KyFUo?=
 =?us-ascii?Q?rRilZbhHo3ZrFaYUjV8KGbfLS1l7U4wpz+J+mcw+Cpy7mlETamb5hh7oQ3r1?=
 =?us-ascii?Q?bPOmEvYKTzrQfIEy43QJtTUbySX2Ny2zKNpu+K17hZ1mOcR+7r5RZeMSgmol?=
 =?us-ascii?Q?eMMq/yehsbbY064yyk/Se6Bs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79977c08-c2e0-41ba-edd2-08d92bf7c943
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:08.4618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hvxs0ivTceyQx01pmmz6QFSzh2e8xicIR/0sy6G8yRWjdwUTLxWwbJ5Hdd5F/AYMoDMLR3Rwb/Ev1vXSUeSLH3UCAvrTsM4Q1P2FvrGG7E=
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

Add an option for a thread to retry connection until succeeds. We'll
use nbd/client-connection both for reconnect and for initial connection
in nbd_open(), so we need a possibility to use same NBDClientConnection
instance to connect once in nbd_open() and then use retry semantics for
reconnect.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |  2 ++
 nbd/client-connection.c | 56 +++++++++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 13 deletions(-)

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
index 4301099f1b..76346481ba 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -35,6 +35,7 @@ struct NBDClientConnection {
     QCryptoTLSCreds *tlscreds;
     NBDExportInfo initial_info;
     bool do_negotiation;
+    bool do_retry;
 
     QemuMutex mutex;
 
@@ -60,6 +61,15 @@ struct NBDClientConnection {
     Coroutine *wait_co;
 };
 
+/*
+ * The function isn't protected by any mutex, only call it when the client
+ * connection attempt has not yet started.
+ */
+void nbd_client_connection_enable_retry(NBDClientConnection *conn)
+{
+    conn->do_retry = true;
+}
+
 NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
@@ -154,23 +164,43 @@ static void *connect_thread_func(void *opaque)
     NBDClientConnection *conn = opaque;
     int ret;
     bool do_free;
+    uint64_t timeout = 1;
+    uint64_t max_timeout = 16;
 
-    conn->sioc = qio_channel_socket_new();
+    while (true) {
+        conn->sioc = qio_channel_socket_new();
 
-    error_free(conn->err);
-    conn->err = NULL;
-    conn->updated_info = conn->initial_info;
+        error_free(conn->err);
+        conn->err = NULL;
+        conn->updated_info = conn->initial_info;
 
-    ret = nbd_connect(conn->sioc, conn->saddr,
-                      conn->do_negotiation ? &conn->updated_info : NULL,
-                      conn->tlscreds, &conn->ioc, &conn->err);
-    if (ret < 0) {
-        object_unref(OBJECT(conn->sioc));
-        conn->sioc = NULL;
-    }
+        ret = nbd_connect(conn->sioc, conn->saddr,
+                          conn->do_negotiation ? &conn->updated_info : NULL,
+                          conn->tlscreds, &conn->ioc, &conn->err);
+
+        /*
+         * conn->updated_info will finally be returned to the user. Clear the
+         * pointers to our internally allocated strings, which are IN parameters
+         * of nbd_receive_negotiate() and therefore nbd_connect(). Caller
+         * shoudn't be interested in these fields.
+         */
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
 
-    conn->updated_info.x_dirty_bitmap = NULL;
-    conn->updated_info.name = NULL;
+        break;
+    }
 
     qemu_mutex_lock(&conn->mutex);
 
-- 
2.29.2


