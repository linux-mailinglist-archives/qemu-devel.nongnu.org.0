Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B44730B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:41:59 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwnSg-00020N-MN
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:41:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK4-0003tC-PJ; Mon, 13 Dec 2021 10:33:04 -0500
Received: from [2a01:111:f400:7d00::703] (port=2464
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mwnK2-0000jw-Lx; Mon, 13 Dec 2021 10:33:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJh0wDZdH525BccWb1bcfeW6LBgeqvv78b41oSJpWoHsyZtzSL13Gho9Qn8IHzc2T2XNrk+4tVD8oa+u+dFDFjVOEQK81uUu2S3ang6rfzpO1ybce2Z4DrpkV2AYXlUVRdW5h1C8xKX78iDHd1pO+pmLQw4e2N66UEe7vrcfJAetu7peQ1ORZVhcdG/4WRz0GFC0A7DOWS8I55dqUO7a7J15848I5GyAHaML//9rJVvkhvetrdseWrI8vEAbxVjga0uLECb9OOERNuYlFCL9stBFW4ZATqW2b+AtOGFulxTeBagSHDBsQK1fRIm9Zg2ny6bvQNBjNrxmifURyQjDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc0+E9eGSwi101ON3B9m0vzebc/w4yXDSCrhG9Lhck8=;
 b=fQn1c4gtYB3cW/5TGzrdIV/5G5QK5/qSTRHoCEP24uJyE+ZmjNOHoVVeyWXf4Hqub+cb9qUqtNH0Kuo4eU0lgA+GY6S1lPo04jI0S0wmLRl0pqb1NBlipmwSADnnZx0s9gOeNmXUUJpHBVg3WDhELmIqt09Y+Ke66wBhTMXkyUWh0Ln3MUipen8QGO7rKoKVM+5NqiKHXgdUWfHDxLP5N7VX7nMGdOlvp+/rJoMcODGs3goxS59F8qPgiEGTGTOjW2pmjHsUiciDbnC13f47bU+OMfNLltRaEY/4FPwT110sHCOD3GJEJs9FoToSNbs5dPPXtB3GG3lITq7LZCugog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0+E9eGSwi101ON3B9m0vzebc/w4yXDSCrhG9Lhck8=;
 b=l9WBNM3Dubjusrwg02kMPfiWcdYXJwp9lD+NBiuUyzIKkEtDAFuQveww0h8rpGklfwr5TzGjnPEdulTM3oGnXLoeFrBhxf09rkl0130t3jx7tKPduyuTpfBxm/6n0KfIwsR4Kq5/QmMCO5Us8dSSmbyTeh6x7BGXK0ZEc1vWVJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com (2603:10a6:20b:353::8)
 by AM5PR0802MB2516.eurprd08.prod.outlook.com (2603:10a6:203:a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 15:32:51 +0000
Received: from AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5]) by AS8PR08MB6741.eurprd08.prod.outlook.com
 ([fe80::c80b:8f00:60b2:81c5%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 15:32:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v4 2/7] nbd/client-connection: nbd_co_establish_connection():
 return real error
Date: Mon, 13 Dec 2021 16:32:35 +0100
Message-Id: <20211213153240.480103-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213153240.480103-1-vsementsov@virtuozzo.com>
References: <20211213153240.480103-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0023.eurprd04.prod.outlook.com
 (2603:10a6:203:90::33) To AS8PR08MB6741.eurprd08.prod.outlook.com
 (2603:10a6:20b:353::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ae83c78-21f0-4756-1b49-08d9be4dd305
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2516:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0802MB251652895B6D997C4349C1BEC1749@AM5PR0802MB2516.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+CzGFs21Klr23008bEtQ6XQ4rjlQo0FgiYn+nBCG9el7rNULNPe/OlckhROKVXhVdGwbSSYntsGOowsq2PSpQvx1/9feZoXjKbVKc6H1vBQlTvwduVDHlx9qKPuFAFzCo3oK9Nxg5sutWGx7fAkvTheX6C+o0319657MJNL/Oxkq7S75cV1mQa/QazKXkbJ582bqgcWaOh9QuGkSZ/aQTr/dLbJL36cy8V0xMLqLWb+VxUwPrD7WyCfTUvCHpR4T393MTYJdofnqLbPf8mJSlrLqJlwr4GvKf9B2S56q1PJc8W63XjB+SqdsBBuGpq4s8Q3G9t2Wx0BaiJDo3kNUY62QGCVelv4/g+1Rp0SIIrqY9rqMi8ZTTAPITF9TJw8IgYMySQspZtrodtlGZ7yv0mtsqrPFsc2zkEhzqxCg7ykZ3gkiX4ed8yxT/kqgPN/aiuG63riq/YdnVg41Sjgb6BTSqfgvsy44d7KZt380OeV5iE2QCNNGxFZWsZTcdP2N/FpRrhyy5abfimpaR6Ep0v7BXVFAPFhQ7TUyNZVDk9F/Ow7Cke5tyCKn6yLkGzM2zaczCHKsnu9JkcthMai2iXqZgTB7fxQvcrbaMpeiORuxG8GesDcKOjT3TFhiUU9BjTuiOr+j9XVkdFaBygy0DctKuelA0pzg7EXFO8mf+W+yhjFGGxRzVUTfNnsj6i2fcPgiMnQa/fuiPquwON3Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6741.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(8936002)(6486002)(66556008)(26005)(66946007)(186003)(2906002)(4326008)(2616005)(66476007)(1076003)(316002)(6506007)(6916009)(52116002)(83380400001)(8676002)(36756003)(86362001)(6666004)(6512007)(508600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5TJTxogWsG8jCrNo54XM+Yy70Jc+D9yAB6bSqCRsaEIAR/DP3eNhavJUvEAu?=
 =?us-ascii?Q?XAO1JNO3qkhRG1g+I6IJP919RftpsXSjCmlZFAYubx4Kv5MwxZWNZZ9+H5Aj?=
 =?us-ascii?Q?70Fc9UU2MpwbP/VErRkrpUDZI7WBvSdKR9Pbdj1aQfuaeYlgKHy5ZyElswgT?=
 =?us-ascii?Q?NgbMz8Bzk+xGRY3K6WUQ9NOJNbvy1Yv9Ox5dfPw4q4RxhdH+GrvBmX7Sb/ll?=
 =?us-ascii?Q?6cZ+gQq4ZLmBsppX+er9pVLYQna1xj3phOaMKwJSaReru2oQsQzkSav1Tws2?=
 =?us-ascii?Q?TRAYsxhP45d2zmDEZBgTfxyLKhTAkTctGYiVOzFrHOd49WWWlFK6HvrtBS7X?=
 =?us-ascii?Q?plR+oCSbVRDos3Ac63i9hgG3ClUtwmS7ZcHLHRZ+u1T52MhLi94zpWrj9Roj?=
 =?us-ascii?Q?kUpNxd8cnRMj6RSgqjBcSqSMnPHqUMZ/mDVFSKYAcLs7TI3qISQfF2TbrY+l?=
 =?us-ascii?Q?TC2QgVk+fqvti4jE8gVRXccDzZ10NCCCKEuPg8lt9t8kC4mTFLrDE32xEZUS?=
 =?us-ascii?Q?T2198DtF1zVeAe+yqdgP1R6u0hf+AvEExwke0MCkJrk2RqeiqM8UJaXNGjLz?=
 =?us-ascii?Q?OTwhF0VgjHAqi2pErKkmtokA3ZxVR2KAyqtnWQEOrOQE8aeZK90+FjOYPyGK?=
 =?us-ascii?Q?oOacNw71LO7JhBm7fgftzwTyEfieopak8B+ID6R9uXBuEJTAz4I4WygX5YTH?=
 =?us-ascii?Q?ALPlC16KimFFrLhE8fbMbv9QZBxVBLyw220BuUtAohph6K2Y3hVW1VqpTxcT?=
 =?us-ascii?Q?TGe4rC2gfNQR2tQ+V7yGjvz2beoLOV56Mz45c0DCy+jh0+cCIkXdgj/2RXzF?=
 =?us-ascii?Q?TQ+M4pvCivwvMXfr30YT8MLEavsnErZbby2ra9mJnpEbIl2V25worQc75DbO?=
 =?us-ascii?Q?wRHMVduefjMsqrpAUcEMd/XEXjOGb970VGYC3HOXU+Eg82LTmgfUvE9xgN/O?=
 =?us-ascii?Q?NoYCDxo3fSLUhAK/BOza9PpDXaK+j2D9579LsMdnr/7DT8OUqZIMqoiuvlsM?=
 =?us-ascii?Q?fGkGJ0QehELTZU1oTBgdXVBOI4WVHpX6/P0ooM0xuM/hcwi73AuO5SyiDizA?=
 =?us-ascii?Q?ir0uRYbY0ZL+5Cw9xaEZWm7lKTvGRMyNWoCSMKfLZcWip/5GUKLY5UWWjkG/?=
 =?us-ascii?Q?SkDkUbG3UWFAf7O8Goycxp0d7LxAOf/iz9DgqSPI2TcsXwaBZBW3nMjkXWJ0?=
 =?us-ascii?Q?b7HmzlH5x84pv50nWlhR4Kef4VcFZzZEMHCsRDfqxHKNpzYSbGFKCQImYSh9?=
 =?us-ascii?Q?PbK8nxFWgUO+9eaUXprTyFU2K3p8IdbnI8mc16GTcefifyb+KG5f6xhTGKoR?=
 =?us-ascii?Q?WvUFvrUdxhzESfvzRN74/ktWcBtqT47r6EVL+TD4xu9fA67ViJdf2QY9db+v?=
 =?us-ascii?Q?AVLsOAeWiF77wQLgm28JQAQZTnrlkcQwAYzknYw//Jpi4+iiBgnRb35cg+Sy?=
 =?us-ascii?Q?4mAsvILWNwDJ2YTm8nUfCS5aDGl0OTygFGQHjssPFcw7qMtSKtP9B6lTwX/H?=
 =?us-ascii?Q?rOvdoWp+kRxp8Sme9TrDyHqI9HZGuTsnLxzqxUA6YEsBEe3GjTu8wETY7uY3?=
 =?us-ascii?Q?BX78FziZyQhc8j2mWqzIpkagThitWhu1lWuiDo44P9QIF0FspJ6Icg+a4vJ/?=
 =?us-ascii?Q?lPP9+XDynQTXBwqJl2HUwuS/AizHW97Zr9/uhRMUclLdjej3l/vKs2qwuWsR?=
 =?us-ascii?Q?eWwGSXHHkv7ityYEEBAxVUIVcyY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae83c78-21f0-4756-1b49-08d9be4dd305
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6741.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 15:32:51.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tl6b5/+xVoTpP73BdItwMHol7IgD4Tlv2FzURVJkFDptE4B3o4UQK4fEkh6L3GMCpN86LkSWbGZpTy/4tl2bzx//2bJdlzq2fmYBZzdMUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2516
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::703;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The only caller of nbd_do_establish_connection() that uses errp is
nbd_open(). The only way to cancel this call is through open_timer
timeout. And for this case, user will be more interested in description
of last failed connect rather than in
"Connection attempt cancelled by other operation".

So, let's change behavior on cancel to return previous failure error if
available.

Do the same for non-blocking failure case. In this case we still don't
have a caller that is interested in errp. But let's be consistent.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 695f855754..722998c985 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -39,16 +39,18 @@ struct NBDClientConnection {
 
     QemuMutex mutex;
 
-    /*
-     * @sioc and @err represent a connection attempt.  While running
-     * is true, they are only used by the connection thread, and mutex
-     * locking is not needed.  Once the thread finishes,
-     * nbd_co_establish_connection then steals these pointers while
-     * under the mutex.
-     */
     NBDExportInfo updated_info;
+    /*
+     * @sioc represents a successful result. While thread is running, @sioc is
+     * used only by thread and not protected by mutex. When thread is not
+     * running, @sioc is stolen by nbd_co_establish_connection() under mutex.
+     */
     QIOChannelSocket *sioc;
     QIOChannel *ioc;
+    /*
+     * @err represents previous attempt. It may be copied by
+     * nbd_co_establish_connection() when it reports failure.
+     */
     Error *err;
 
     /* All further fields are accessed only under mutex */
@@ -170,18 +172,18 @@ static void *connect_thread_func(void *opaque)
 
     qemu_mutex_lock(&conn->mutex);
     while (!conn->detached) {
+        Error *local_err = NULL;
+
         assert(!conn->sioc);
         conn->sioc = qio_channel_socket_new();
 
         qemu_mutex_unlock(&conn->mutex);
 
-        error_free(conn->err);
-        conn->err = NULL;
         conn->updated_info = conn->initial_info;
 
         ret = nbd_connect(conn->sioc, conn->saddr,
                           conn->do_negotiation ? &conn->updated_info : NULL,
-                          conn->tlscreds, &conn->ioc, &conn->err);
+                          conn->tlscreds, &conn->ioc, &local_err);
 
         /*
          * conn->updated_info will finally be returned to the user. Clear the
@@ -194,6 +196,10 @@ static void *connect_thread_func(void *opaque)
 
         qemu_mutex_lock(&conn->mutex);
 
+        error_free(conn->err);
+        conn->err = NULL;
+        error_propagate(&conn->err, local_err);
+
         if (ret < 0) {
             object_unref(OBJECT(conn->sioc));
             conn->sioc = NULL;
@@ -311,14 +317,17 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             }
 
             conn->running = true;
-            error_free(conn->err);
-            conn->err = NULL;
             qemu_thread_create(&thread, "nbd-connect",
                                connect_thread_func, conn, QEMU_THREAD_DETACHED);
         }
 
         if (!blocking) {
-            error_setg(errp, "No connection at the moment");
+            if (conn->err) {
+                error_propagate(errp, error_copy(conn->err));
+            } else {
+                error_setg(errp, "No connection at the moment");
+            }
+
             return NULL;
         }
 
@@ -339,14 +348,23 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
              * attempt as failed, but leave the connection thread running,
              * to reuse it for the next connection attempt.
              */
-            error_setg(errp, "Connection attempt cancelled by other operation");
+            if (conn->err) {
+                error_propagate(errp, error_copy(conn->err));
+            } else {
+                error_setg(errp,
+                           "Connection attempt cancelled by other operation");
+            }
+
             return NULL;
         } else {
-            error_propagate(errp, conn->err);
-            conn->err = NULL;
-            if (!conn->sioc) {
+            /* Thread finished. There must be either error or sioc */
+            assert(!conn->err != !conn->sioc);
+
+            if (conn->err) {
+                error_propagate(errp, error_copy(conn->err));
                 return NULL;
             }
+
             if (conn->do_negotiation) {
                 memcpy(info, &conn->updated_info, sizeof(*info));
                 if (conn->ioc) {
-- 
2.31.1


