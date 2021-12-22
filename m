Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4997247D742
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:59:16 +0100 (CET)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06pX-0007yh-DW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jg-00088Z-Ul; Wed, 22 Dec 2021 13:53:12 -0500
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:12544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jb-0004aJ-EP; Wed, 22 Dec 2021 13:53:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmVJuAhic2R1SoPU9AIHOVaP4zrAeqefTpzJZ3UZQgacYNTEKG/Y2o+A31l9yNIJ1iVptQW9vSm5wK7Ygvlbt30G/rlShL0unTlJS0EfrjAI+COlQKhXWsgA61sEMktDIxIZkzmqU4wVf8oLkw5CCr8ZSwok5ZvfR+PCFsuO3DkDeUYAUMFt870bMX0T8stVADQQxP+YVseH8zpsiiErvgP/vpFpcPUVP7gqknE59oR/LQNxUmbFUxEeBAb3UcpHW00XJpCOcASDw5Ntt9dx8YJWLkIGkxMoZmKV0+uUjvvQ7rfchi77Ic4qQeG7SLSVufOTzoAlf46S4zZHdErv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc0+E9eGSwi101ON3B9m0vzebc/w4yXDSCrhG9Lhck8=;
 b=gyh8LpwBUTumRo1PoTQ2xAmkr2O4i7lIiln3etaRrqUdTD4HWKbeeX+x5PC4BxlSzTJWjqpSTzY/ec0siJoBtenROy9QCyoFdM8NX1wrJmCUcKf7JoaQNQJd6CVHAOUbLtJts7ooGSyYs7fOGDkFdwud+rVYX6vUxPNFk8vInHnxElMOjrXj91QgpZTDDNVfeFKH9TYbZHUEBgfnE/HWR3vUom7EAJ0nMKgORqRTz1vWFsBwQeNvVVcptvw3OYktCOcY9j7d+XR9wE1GlEvRwMTyG4RUVJ6AEeuBHd4zN+oTNK27bAbNn26mxBBhbCf57iF9R5+sY7ZUlRWYvPhKKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0+E9eGSwi101ON3B9m0vzebc/w4yXDSCrhG9Lhck8=;
 b=Bse0drhy153Hk1cLalabvVjKdI5uJYeGp9K2iEWOIPGag5Qp1klBds2kENfiAUa9JespZSFTY9M14UQb8SYL5E8zNqxy0dZOoYJPbe71rKJsjXBZRRZzQj2DIMY29IwEhfFFvhD39drRcj5AU57dnnxiljUnGu0sIKVSPMm8mKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org
Subject: [PULL 2/7] nbd/client-connection: nbd_co_establish_connection():
 return real error
Date: Wed, 22 Dec 2021 19:52:43 +0100
Message-Id: <20211222185248.466010-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4e39b85-d618-4f80-553c-08d9c57c4790
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB58575291F30CC619DAF3CF5DC17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U4tUdnJ8kRcCGhaPUI33RTgcuvBVGUhQgl2g3qpfKysbwB5MBKMeH/7EMmVZQZqeGkJtBgaZQDXhZXEbdewQyoAm9WUfn8InpTn4Zzk4y9bkST46+yIRfUS051SaTc7IErXxPREo5FC24b805TD0zxNU+p0XeiPypnnfXwmJZYDryqw8dKj1J6nU+t9Km0VmgAUFnOOtmulC/C8q2rz0AP3fTz+GJL6y6dy6+CORKp1EJE1mF82z2SY3xUeZBYNVrZ2k2SqPLiZvxkVdHCLzRHK88AXaB/PapVdXut9MJV5pfPLu/1K4rLMrr7P/6DX9eJq6cHc/dbPfm9+bZVYymKdGciP+tc3bi1P4VJCUahv+iqau3FfgmGW8SIKpsR96WrKnLLKZMFy2F0b5iI5xJhXTsgerT7f1rSBFdaxVJCbTleaTB1l8fVlIpT/Qf9CcA+itu4OxX4CFCXO+/50zGTolcvv5tbxDtBn/ZaHkWBSVd5bI5g1CEUDoOpNVnmAK8JccC+5S9jXaggyPyDmOG9jrQh7Eqr8Eau5VSRHMiuxcRg4RLxpFkoOcDoOBZTu0fyUrDfJn2VT3P4RuybHTlim++fq9JjR0hY+F5DmIG1FviGAvm5DegC11N1LRxUbJcm3LVncTYi98dZmxuhi26FdOpIj4RkwjThipREByt8JOdR/z/SbZeFZplN7twOPGif4SDIHBMYCcelFsns0XOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxoZxOq5FkhvxUnOiaK1jHPpPp/4S6zTATtvbCpMJwI9arTlw143zlKeIYuB?=
 =?us-ascii?Q?fb6MU7lI7bfNkNAgM7xSda185GE79I2djMR1cCAhsesaCMpdwRDIadGpdnmg?=
 =?us-ascii?Q?HccamLtqu1I9p5HVo36hmMF/CLPBRIr8hqe54SB4fMEhuPEXFqk2MM0Heqwz?=
 =?us-ascii?Q?aoKAdiSkwAovyLW2p+xbJwzFtXTbqSTZep+I/5N2q8ldvt+pivwJa7Brs9qW?=
 =?us-ascii?Q?rHWGbOnvZ9AJPAolEbAelrHmb6vQZuiTOBQJFW3BkrsG82OthIsSiMob0yK0?=
 =?us-ascii?Q?wAgJ4b9IjzR0zPtV/coW9RlCaDsvYha5/5Xu9Ch5/PuMQwMlPxp00a+WDKL1?=
 =?us-ascii?Q?QZXkc+zgZmya6l9pMPLxclnROfC2Qd7FW8q1COVA/u/h0yrUM7O0KUbLMeAp?=
 =?us-ascii?Q?7sSVkVaLU/tiGahWdKRyuiZu8ho21TNa6gXqHviMbz6hYreZCU7Zh8mThpvc?=
 =?us-ascii?Q?TCqtISIJ1zAU/Rks80PQ1aMS8djAO7uiUFxy2g23yqGMHyqMli1mRD1mgPG9?=
 =?us-ascii?Q?NTbFk8qQCVk/cRHlSlUJkGMnhm4CO2rubAHJJe+PMfLhWm9X9KNzL3URZkTr?=
 =?us-ascii?Q?rGwd8/VNz+HwbYU0oQnFLDZ7njrLhEO+yc4TxEp0uRsmxe1CSGfC8DXHy1BL?=
 =?us-ascii?Q?r5E3eHGbSBJpuNrBqQulOAtPgcLN4YU0O5Hsc9Hjv/Md1N4ZccbbXQeUqsft?=
 =?us-ascii?Q?2Aze6+Y0nzIegto/ZHwRuRkyXRdxtXCIcQagSat1VOQUywF0xOwLrgo8/kTy?=
 =?us-ascii?Q?bSyU85tf3kr/jjCfCViRsuqVUJSDcXXpoY+hWHuyEYYNqgfK36UokKOGHPn0?=
 =?us-ascii?Q?JJ9bRl606qgQ5gOrmu2X+tYJOfVA0mo7y3k4Gh+oXLgQD6s7+Z1raegoi8CF?=
 =?us-ascii?Q?ee5PyVJW7SAD50KAKfOLyyF5wLkVQuMh6hYn0/LfNJrnriNbApAAIPcGP+t0?=
 =?us-ascii?Q?UtlDHbRTdydnLMjBsxO9mETjQ8n2lCM9xXgUFM+/xQ5uNuA/gByeVnpzMFtn?=
 =?us-ascii?Q?KjdzkLhpsxoSZJ26n0Cm+Kao9/J44J5DiMcrgQNTuS1ACG4m/4oytmXbV5nS?=
 =?us-ascii?Q?KTVDTv/93lododoVbWUS0KbLeZ8ulDUyhQcE3MiBj2PEQv4gCy61tNQRbsHD?=
 =?us-ascii?Q?Sig/TCkYZCEJewiqFLTdPueRo0uDVeGUiTvlKCRqnzXjz4f1OzMOYTVld8iD?=
 =?us-ascii?Q?TDhuWo6HWZqV+AY5BZkskpeofSDcqTwneOidwH8hLUSIdYQ8s/5n6DyW2HpE?=
 =?us-ascii?Q?g/gZKrCaP+t2/zVPSGapeDjKl23znvg+dVo6WdLEQnDYKWnrkf1Lcg472JPk?=
 =?us-ascii?Q?PC9XaF+pLze8xZMo7RhZsUAT9U3/O7rmOzfzeX2NxdUdVQ5JNL3zG8uMmuuD?=
 =?us-ascii?Q?BZGPLRdW0IzsHvSaE+NMHbtZ6UmpXN26MMt9n/z0hlkbrXQg9ufgcBg16VBd?=
 =?us-ascii?Q?r40acfdnR675s14tkArrJq6zy/lRx2g6uI1kfLsHUmJ9JCI0TOvhRq8mdPEI?=
 =?us-ascii?Q?T/ALFN395nIoKPanktIoV4LkoKZOHgMsz8EgSvGizGQtG2AU3OXwOR7vYe7y?=
 =?us-ascii?Q?93A5zDeYtDoA5HseTAbH6Za9h8jVQlAjhv9UEBCFBIqybRve9n4OE98j2aYD?=
 =?us-ascii?Q?oYFSuaFJD5/XzArDRkggcit0W4HvyL9J1rDwQ156txToWXaPCYUiLwxQxURC?=
 =?us-ascii?Q?IXUbs2VTdWh3Q/SSNF26B+WHbRk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e39b85-d618-4f80-553c-08d9c57c4790
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:01.7831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5Vl1Py+kAcIpz/plpIDQXHvTveSfXl+ZbM39JyP6AEsjWMqrboDj3wlJJF37wKr3GdZPeVIk1pX00lLd9rORy6Ti5nB1r0g1lr0BvEBiMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


