Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B15402052
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:13:47 +0200 (CEST)
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK3t-0006c7-1r
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxg-0005YC-JP; Mon, 06 Sep 2021 15:07:22 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxe-0002Fk-SR; Mon, 06 Sep 2021 15:07:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4Vrl83jK96l+0rZRSglNnR3Fp0xpfPiUGV/Adj8GFD8v3OvDzzGy64Chy7KxJs2+jxtW55qyIAKEpHdTvaXQCq9ivMgNOQcM+et8vWLRcYJBdPKoS3GncUwEjoUS7zlkmP/R6i4OUZ+T9XYijCJCLmTuNqv1IS9E8YfeHVIsg5U3nILb12CP2Kv22FchEXd/HR8p4UCc3uq3s+jMKs9g5tj+wS+xHtkfnJpOL6gc8HpzWdonuWtqRAh96RVQZ/nvS+Kpun+81NgosZrZYKFQKUdoySiPA4o+SloLULtDy52P4wKt+HZZlvBMXy+6YOdsytbCUsDWi3lQeTgZ2DMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=olhceEPcDgwANKJ5IyWrlE3Txa+c9J8WUlRSe3y66yo=;
 b=k7BZLtFcmWEPqqpULBrEIKSih5D1osOLk0SeO9JUFFgOBOmQJJludsZBKLhtvd81srCpr390K7tHzPVmLwN3p2Fc98h0b8e1Pz3MeevEOT/QhFz5ma6y7DUCVSVdgodiPUbYepL7z7Y4MngiEp2fPiPsjfrpcQMHW9816U7gJMOeWKd16JLraONTm3YI/6ipIVfCSR2agLuv35wCtzNI/XLwS6OuLWmVKtGiNxVjxiowhJ42wyqG6SQFlbddCcDUseKUPJ4UemSKpHqU43stXm7Yhc2H2PoSkYGhpTWwoE2vz+otyOHdShOW1LqxPp8TK17sO//oMO0gnzFbAjAYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olhceEPcDgwANKJ5IyWrlE3Txa+c9J8WUlRSe3y66yo=;
 b=GWAOlEjlUClvYpykPYNL1y+9bLk3Q0bWw5qiS+ngak/MjMEbLJxfMymF0Ugs3ouGXJBHteOxXG7FIQpoK7sObnRrhTqHCZ1Ms3EUNqUgUOzOPKImEeZoB/NKs77EzEKKD277iJ3yrgaHCxuAFv17z4rkTTidOjCBvHZnpmXRMNc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 4/9] nbd/client-connection: nbd_co_establish_connection():
 return real error
Date: Mon,  6 Sep 2021 22:06:49 +0300
Message-Id: <20210906190654.183421-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1928ad7c-8532-40d6-fe6c-08d9716988d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4849681FF7CAEDA1E600E714C1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1OGni1z5jyzWWZOszkFGYSan+lyTRkiDH3aZJ62DGLhv41NKRuq6U5dx1yJu4dRH8EVAoi0teIJiIKzksBp/vQ3+jQGZy4IVDfA7kRnmuL5YoXBHg7i58rbIX4xf5fTofcupG65EOdxhut6Ee45O77dSO3mNZXuVqTLzp6VQrDdT3UxoG/GO9JSYu5pZ26RAqhjIer3LiCaKdj8gtTdY8IbmiFzQurJBYCHrnDUfIw6LMbPsvndqBcpwEhHSmBzRIkdal/F2p5bP1oJSugCoZRqcBJm5vNr10N8yfOLakfHtZ4VbJyAOJmt52bFIhK24Fese/Nfsd81szK77y1ME75uWMqhT4u7tP+MwwxSiiqmqLXlwuv4rAY1jLz5rKc6ww++vKd6pXTowH9iUzVzoi5D2Tn9aQ0ccqYTMNjLEveQqHkXF9z/bqgioQKWI14MgtaBSzo3e44fzGnPtCiqbT4WoSqWNY+VL7X+Z5cnoOtQCjNV1AYbBBgIXqMrUz1k9bq+QWC5j284WY7FaerPBHsRBr0AQ5kvEs+DyNNOAwtHnkcnD3LS9KvrPjb4m3q41dr/8xrqcFxwgbTkGHFlhVyRhB2jAW24a99Squ09qOjdkVNsE+HUW1x3QfYJRs0PDTXSsC0B0160PL4Ymje/USxJCBIQz+IALRY2SQRfzVbWfnd7AquAtJIRr+cLTxdVBw4GtO1hUxsjg3Uvh0FTIPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(83380400001)(26005)(66946007)(8676002)(5660300002)(1076003)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kXLXUw7fzowTWx2LjU2pG5IqZaERSva9Oq+QQw6V1S8WAzMhLdaNw7cA2ZnU?=
 =?us-ascii?Q?qQPdv0znyPnxhoVFhsv8Gg4cBWJ9L1d8L8syPLdU2/jHHf0xeLg7jSV10Zrm?=
 =?us-ascii?Q?qC8vy8rc6jyU4m1LH8w7IrGqm0s8P/uUKJW+sZg6xYsq8WM7JKxFPjua5Y4h?=
 =?us-ascii?Q?jJU6RK53dJwIbgxZwmSpposScVWrKiB9htiNoRu7DRmUiaflIeUSvm4Xy3rP?=
 =?us-ascii?Q?MfMwpk78Cm/2WZp5dYludKOwToxmAmuAYft8mdpjNbOQG/ydf48d/jdjvyXc?=
 =?us-ascii?Q?I+b5mDfJsRKUcvER9cBEVfLDKqM0G9qem5YAygQo4bO+DExZM8JWULIHQTmd?=
 =?us-ascii?Q?QEL9B7Qw7n8zMvoS+YbNCBQdLk3qbc6F3eFtgoCiEU5bACzaTX1IpyRRAS/e?=
 =?us-ascii?Q?9y0DrbxiUjE0x6sOnPuPQrSEdPqS4tWdjgwmsCzKEX58a82hVeN7C1ONm4Eg?=
 =?us-ascii?Q?QcmBe/WAMox6N3SUoUsBDPMSej0H6OEl/iLWnQaSvclramRAx1IwB24oh4OQ?=
 =?us-ascii?Q?x4Ef6QsqffofgBHFaRelYUs2by/dDyMe4wYRhxkpchQGvalfnj++XSeMtQgS?=
 =?us-ascii?Q?aNFsXD8Oh3MxTB5mjKISy58UDJgJ+3bQcxNvEVBIIv04ZGxhi8jKGN+8fCMu?=
 =?us-ascii?Q?ObhSGMOgSElVvV7O69FLbRdPm5uB9pzxwCEbYUxV1eU9/j+VnmLWjGqMrkEW?=
 =?us-ascii?Q?SmuPlQVmLaq7ioKtcn5UeHQTgUIA+JIWUQm5WjKVRZ1AmaMSmZbBn9QghJss?=
 =?us-ascii?Q?zE6Sxcjqjw4nWM0I7NFBkdfdu4FsrIoGRgXSg/CicbvXg+vVWl9dYx+nqz1+?=
 =?us-ascii?Q?DcdTjmyTqeYl+aBsLo1PWXOedyn1FBtAlE1E/QTRJGdQYuG8iFboFi491w8G?=
 =?us-ascii?Q?TM7RcNan0O5JVkXHe8HHob2XFUUpbc+JrjAMJl+I5b37Gc4AkQJ6SjKTeov1?=
 =?us-ascii?Q?hDwaFr+2aekV66APOosxBk9LQl2BxMjGB0ywQ9RS1nHmQOz3p8T5OR27vuYI?=
 =?us-ascii?Q?YSxMZKiR1jzKhi63Jmwi/BoVuDQId8u84Va1wqjbjLRCi9e5KtqnQtOU0oVv?=
 =?us-ascii?Q?V3dXs/9LiDe5Ocp1EbEgYeAPRTK7Ic34+NgpkuyJCE0i06JtFn4IJNe6GAD5?=
 =?us-ascii?Q?I+vNosY24wMzUXZ2fVchpZrtH+YzNL+ezvY91Sw0aj8zyPzlBjYrgcwjWM22?=
 =?us-ascii?Q?e2EPxlsGZOjyDtpiKJrZ6AGrSIkQKTpiZAwYmqB+YL3/xKY7E2r1qmSqiVhW?=
 =?us-ascii?Q?5HD/Vm6izFWC79vXJ0M5Dv8x9Ybp9oSksGBbvoEBLY22PyRr35qgdyLiiHdW?=
 =?us-ascii?Q?PKVeuecyqV4B90L6L8WtWw1V?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1928ad7c-8532-40d6-fe6c-08d9716988d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:13.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67rPNnq/JKzUmMDQroDONe2qqyirw0xjQO0F+HvlWB8eAqNVAej7QBHl7pnxuARplkFWTPdg2lAvkukC2w7q2DGsaiCvcnuXfGXo9M4BRc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

The only user of errp is call to nbd_do_establish_connection() in
nbd_open(). The only way to cancel this call is through open_timer
timeout. And for this case, user will be more interested in description
of last failed connect rather than in
"Connection attempt cancelled by other operation".

So, let's change behavior on cancel to return previous failure error if
available.

Do the same for non-blocking failure case. In this case we still don't
have a caller that is interested in errp. But let's be consistent.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 50 ++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 695f855754..722998c985 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -39,16 +39,18 @@ struct NBDClientConnection {
 
     QemuMutex mutex;
 
+    NBDExportInfo updated_info;
     /*
-     * @sioc and @err represent a connection attempt.  While running
-     * is true, they are only used by the connection thread, and mutex
-     * locking is not needed.  Once the thread finishes,
-     * nbd_co_establish_connection then steals these pointers while
-     * under the mutex.
+     * @sioc represents a successful result. While thread is running, @sioc is
+     * used only by thread and not protected by mutex. When thread is not
+     * running, @sioc is stolen by nbd_co_establish_connection() under mutex.
      */
-    NBDExportInfo updated_info;
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
2.29.2


