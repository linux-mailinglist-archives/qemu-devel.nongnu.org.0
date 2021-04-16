Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11915361BA0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:36:02 +0200 (CEST)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJxJ-0000NA-4E
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYJ-0001dj-Aw; Fri, 16 Apr 2021 04:10:11 -0400
Received: from mail-db8eur05on2107.outbound.protection.outlook.com
 ([40.107.20.107]:39777 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYG-00087j-9I; Fri, 16 Apr 2021 04:10:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcUmFGB4qEQUeWKJbGfK/G2YipZ4/W6sqXvWRJW14hmSp/iut+GhX2blILgbaZymMNmCuWYYEOSLgV2NGM2K49Ygi4qKTd5pPpRd+UUON3zKr3Ocq2yuMig430btGXGECfg4x3Y0TwloyJMmnhBGBceovwWrsFH44GrQ9WjUDd4V/X07r7uKhEXJXFAm/cN5Ei048sv7rS7+rwN28mtd2NeDzzwBQ8N/ZxF9Qv5i3d/wDmd+HZsJqaF9PXBnof+pL5DV4teIFNOLSuUb1KC2aOXh+InGS+5Kfhr0W0Br/d6h8t6GHoYo9WzSFkQ2KwzXKE9WG7rz8qxHvU2SGnlNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bgdpQqqxSl5W3be/xWcDFbiKd4XJljP39avVm2vc6E=;
 b=XzsY3Aj+p7WtE5+FUfiSccwVHRbxLpNIR+FlrrR+aBkyC8wqg6zmYLu/1jO3FzO39yXT8UftrkMGK2LPDAxu1Z54d0FWUQdCY9I0zkp6RnmYUIc7gySh5J7nb4FMYe/muR3eoUIvd9fANtQS7T2Cy0DVLDQ2aJWWy9ny2AHqYiaXZm9fpLgGZR4kLTPs9T+TBUIX71Bwpc0/h2OCbJdxmgpLISQLxHDcUTDzpja0NYPIcQWooVsEVRuywgVwknZpMmTZVLqwYVNCEUvOukW2d1c7YFOUBgppfd6CVlO4qFLWSo6ALqisi9aitgfzyfWwqk2T58PzQM6BQS98vptdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bgdpQqqxSl5W3be/xWcDFbiKd4XJljP39avVm2vc6E=;
 b=bbH66Zn7gBORPifrhNAUchMb5zGPMNKGNdquv5h1f8vRXtJ6rE3D+lMzrpZvFnxeBya/gDc/A91SsePmwB8n9VKzYap/lyFNVCXlSlGlHkosIHK7H9lG2rK2iZ3SV/xbjWFmbUBlLcOHA6w+GSqVpS3N8rpegIgQEz8DO8WR+V0=
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
Subject: [PATCH v3 18/33] nbd/client-connection: shutdown connection on release
Date: Fri, 16 Apr 2021 11:08:56 +0300
Message-Id: <20210416080911.83197-19-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 470f2c9b-8a19-4fd4-683d-08d900af02a6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46911E382FCEE6D27665D7E2C14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6EdEqiMWx+R/ygjloltVsCmyd+9Rw4iOhAP9hDTvXIX0HKqTTgzxsVJSJ6x6fRDxypBhJt/g+art8OZ6+orL61VceiMb370oPBWpxHiAkAR5J0h88vyKiexVk1iQlWJj0BxhHXBMtcVce7PjksyL/Wtwroaw+I0lKq4EiWVgKF6r3q6puTP0VyI38gObT7R7pGwJXv9g2RWQ4sbKFnf6pBQzF9shBMRrAwDR8BW/RtCVfYG7lhYLKgC5EYrucsFW/USJ+8mni7iKT0XUudH9t/TTx+FgbKnZjFLPS4S78bpm3Hw0QModYLQgP7CVuYYdezLLxoanC5Ger78mN8c4BfTXIWe4wjPPHGRwdoga5nFt4E3y5LWJIOTMMtSPoYcngmICpqifaSxg553AwXgu5a1rPz3IJlZuJ0Xc6BilM2oF3b5hs8eC6MxNEOHjMN+6L+M34tPq4+uhB7VTIgs3CUgooLmJlccYZMiXqNIhayabQMrDlsKsSCKjXAxQDiolDZ5nIQLTWb7xav82WwZ+lZxcpDftlmnG77m62kri/kxm3TBw2oOZ2s/L2wR61SsB+bUg1mT130YmVTW7I602bpQBtfIwcUb3L7EzdkdAPit1eUwI1knp7m4TK9xB83efY9M0qac9R0QdEO3ykEFEF+wYEhXXA5J/4wgJRMm+liHKP1MIfU4Mc9PQmXlv6mvd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7Oj+HF17flno480bMhn+eGBrm4CmPCT7iOhKdUW078CoTtsxMrI3dHmGe2NI?=
 =?us-ascii?Q?p3wTMzKX0D3e2JG9/s2jLcDDTHxDhL5TSEq41inR96cnFZiixp0osYlszeru?=
 =?us-ascii?Q?mX3PqWaa9TxUTP92+0Wd+l1zpzYzA+Mb9x77GmgeHbm1AlNqJZPfwavT2cg9?=
 =?us-ascii?Q?TJ8yRzrGyfc0A87g2yWOD5undSqgtg1wyS7F5VL7Hxa6djCLP4VSnj7sZb/x?=
 =?us-ascii?Q?WztZvVtIeOMZRSQiFLvod9wVfDphuT+U4PJhwGuPPe8U7TwlTH1RO5nqioLT?=
 =?us-ascii?Q?L5WhL6t7HyNPpvYcOr2vh8IZLukvALf90GN3V8HBsdijYh9bt6jbo6yBYGPA?=
 =?us-ascii?Q?sVisnJDGK3Yq9jfyRe9VEKihvjdcaM/BJ1mdkiZDH3uhJq3rHQsgbH4Gqp7e?=
 =?us-ascii?Q?rap/tJzT/ztN/pDMjaeK7xS4MsF5RfXwDJmKXv0LpC+I/6yARSyg1LkvjEwn?=
 =?us-ascii?Q?FKocbm/QBL054Ja2NjejkK89s/PlOYVd/vyX3GiRdSZC7zQT3tosg1QvoYxP?=
 =?us-ascii?Q?Peq8dhkT3lNBCuws14SQcaIxIgH/GfbenTNlyW30QdUxwOjJDLAUDI0vBDKU?=
 =?us-ascii?Q?RNdES69AAulqdJpCW+HbJnWrDcAHNVpJhb2oDpnC7U9fEltAU1lHLkB22yJx?=
 =?us-ascii?Q?o7mm/6PQdYPIGzOmvNZYpA3F6WwUbCKMXl2Vgebz6or6lcwTlPygp9k5WnFi?=
 =?us-ascii?Q?v6ykY1bBkg96KWS0Q5Fzum9uqgSlyCRzypJr7vb43YXlKPqmJw//Isf9Ec7H?=
 =?us-ascii?Q?dgH76r3jG53YpFIbZZAINQ+k0ChFL7pLONflXTX+fLtFy5UGoVddqQaZFdND?=
 =?us-ascii?Q?R1Qt4J+rcTosh2V/vxMQh7Ocs7M37lCRleH1JTjBC1I3W0HqoDGIcEhkg/3I?=
 =?us-ascii?Q?zzIBTQlmOU+yC4E2NauExUTWZvw3DwLFq/1vtQNOtqyjqLlArhmmOmDFxveG?=
 =?us-ascii?Q?dLSafBT8CILHwr2BxJd39ftnw3/HQtyoZrY3Gl9iQHlVqlCAAWxIfvxiXND1?=
 =?us-ascii?Q?uHH3tdqbTs/1MDYW8PLYW1weeOA0LRXa4YBsNE1NCl2mvPOwSptPbXEKLlCC?=
 =?us-ascii?Q?nuwLuhuv5GLcdKLhBeW4Nqzsv48UTKOJvWY34hLyRr1+KawDmFhdMoi1ao6U?=
 =?us-ascii?Q?+3VzqfHSolw79nirdi+TWUf7jtKkIXG2+ebWVyBmmawp1MaTt72PlM1MGyg2?=
 =?us-ascii?Q?Cn1/jq6M8pQXkBEJe31JwcSkC83d/oZ6MUexWVJCeiG7i6UKCYPYslth849m?=
 =?us-ascii?Q?ZYSJwK6/L1jca+9nFlNVXtG+uJUihGnqT04VK5f9/s7as7xnjHiPxmNbKpvF?=
 =?us-ascii?Q?o5GhPwhyihAPN4crI11sz/QG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470f2c9b-8a19-4fd4-683d-08d900af02a6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:51.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nmej1GO2Yp/vx8Bw4MfkT+BFwyDzfjzDAnYiIHX/pBMyk5ILxuMH2JNq7MO7inpAjarK55uIs6ZVjy6vY+uEZu5nkGBbC3fPO+vIm+k6s0w=
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

Now, when thread can do negotiation and retry, it may run relatively
long. We need a mechanism to stop it, when user is not interested in
result anymore. So, on nbd_client_connection_release() let's shutdown
the socked, and do not retry connection if thread is detached.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/client-connection.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 002bd91f42..54f73c6c24 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -158,9 +158,13 @@ static void *connect_thread_func(void *opaque)
     uint64_t timeout = 1;
     uint64_t max_timeout = 16;
 
-    while (true) {
+    qemu_mutex_lock(&conn->mutex);
+    while (!conn->detached) {
+        assert(!conn->sioc);
         conn->sioc = qio_channel_socket_new();
 
+        qemu_mutex_unlock(&conn->mutex);
+
         error_free(conn->err);
         conn->err = NULL;
         conn->updated_info = conn->initial_info;
@@ -171,14 +175,20 @@ static void *connect_thread_func(void *opaque)
         conn->updated_info.x_dirty_bitmap = NULL;
         conn->updated_info.name = NULL;
 
+        qemu_mutex_lock(&conn->mutex);
+
         if (ret < 0) {
             object_unref(OBJECT(conn->sioc));
             conn->sioc = NULL;
-            if (conn->do_retry) {
+            if (conn->do_retry && !conn->detached) {
+                qemu_mutex_unlock(&conn->mutex);
+
                 sleep(timeout);
                 if (timeout < max_timeout) {
                     timeout *= 2;
                 }
+
+                qemu_mutex_lock(&conn->mutex);
                 continue;
             }
         }
@@ -186,15 +196,17 @@ static void *connect_thread_func(void *opaque)
         break;
     }
 
-    WITH_QEMU_LOCK_GUARD(&conn->mutex) {
-        assert(conn->running);
-        conn->running = false;
-        if (conn->wait_co) {
-            aio_co_schedule(NULL, conn->wait_co);
-            conn->wait_co = NULL;
-        }
-        do_free = conn->detached;
+    /* mutex is locked */
+
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_schedule(NULL, conn->wait_co);
+        conn->wait_co = NULL;
     }
+    do_free = conn->detached;
+
+    qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
         nbd_client_connection_do_free(conn);
@@ -215,6 +227,10 @@ void nbd_client_connection_release(NBDClientConnection *conn)
     if (conn->running) {
         conn->detached = true;
     }
+    if (conn->sioc) {
+        qio_channel_shutdown(QIO_CHANNEL(conn->sioc),
+                             QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    }
     do_free = !conn->running && !conn->detached;
     qemu_mutex_unlock(&conn->mutex);
 
-- 
2.29.2


