Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE33A2964
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:32:01 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHyi-0003rN-AU
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcq-0005wV-3f; Thu, 10 Jun 2021 06:09:24 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:23957 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcm-00051Z-W3; Thu, 10 Jun 2021 06:09:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAmCkuCNCZozeEIWaEEoiehW5zQIo76u1OH8VnKg2MbLDXZWlDOadhAsZVQrsbQS07xe6fkk4WdsfZoBKkDxQKgp2bv4UEnoTANkCMYHOevekihPOeF7/Z2UUzY1i/cyIbryC0oUpykLc9lRvxx8bc5Bv3CRYsSNk/ZgLQTYg36RXU7Md+jepNvOZpcf9LDvOlrKCuRvJEObf1ScpDsCx5dhqb9aq2IlRPxm7B+SmkkPVANjplLq1Kehspbe9yYycGrJHgffxmINKDP9Zebixm0UyIUysq3yn04Zd+NilDpZ1s8sI6TpzOnt9PKUBs77ZqNyxyzS8dTMYoCXWP9mCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQl4POOm4eFa/mCJybXKz8r1GwYz17pkC/3A8Ox+NUE=;
 b=bsiXzyx4VifwvW6AeiZTStTRTXnVsnDlguJobVKAKMro7EZrqhmn8yts4uwp7N+94eGp3y5Z8orbO+3s3OtRLHjEMubOe07S7pqeGZ+pzxT+xEzOHcC8PY9ruEBWIFiTQjoWwSKmCtw4vtP94tu/JbGVHlF000m2mJSEs0i4wDzWfp42A9xxAOxckHmSJ7o5e5/C6CZgC1MVn4DelpxiwTOw80tVMMyu9PV2fuPZr7rHGmKmerdWOo/rAwEJc495WQUo9Hm3v5Dl5U9eVgzm59k9+5D5BFExqQyA6h+SIXEq7Kh0QcQLC6gTXfIB+kZzEGboc7ugJ2lPLGk1i598tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQl4POOm4eFa/mCJybXKz8r1GwYz17pkC/3A8Ox+NUE=;
 b=k/ZJHGVGBUSx08IdTa0HQK4rwQjEqvs2JqztFYiI4DGXp4YY+G9MQo/BIbYcYUtY+Glu4TW3ewhVuoiQzB0h+FDB/IemNvanr6fFyUgOQuFkTVftE0QabRBm7LKlPH095jYRZK4AbOHk+JXKd2w3C94bxT6HgfbyUmdQz+ROnT4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 10:09:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 16/32] block/nbd: introduce nbd_client_connection_release()
Date: Thu, 10 Jun 2021 13:07:46 +0300
Message-Id: <20210610100802.5888-17-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 473b498c-99d6-4060-f6b6-08d92bf7c67a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB650287FC5F9F4DFAAD179DA8C1359@AS8PR08MB6502.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rCP5ptP+5sNa2J6ak47n7TYHBNJ19qkm28roIZsgOAPqE5VlmuamTO44VtXoNA7AVVbKLUh7DcE7cwV/D016xEzyY7wMCNyUkv13I7mPSz3rFriyKfblBkc8IVjKhE6vmhhV7UoX9Q+bwu4ao/edYksfIP6UBTaDgtlhYLfiMuSUg7itRYrgYEDnUR5vi+F3UtYW9lRje2x6CrOUCjBgJYz5zD5LliF62Yf84Hb0jkuxZu++F+45ezBXZ2iHi/+IUhdSipa0tk+2Q/Mcqn618kK800YIwuIxOExRbwSGFy56h3NdYle5bE3zD76gfID0jGybtzw7BVAate4EtHwh4O2Hae6NemFhJ7iUY5KqdJGV3tMvDwAE9iO5BWRQwEnpqj4vpa0VlNUirbQnuJ1FHy3S/CeggBNLEBeYDrNUK+aJI/APnj4H36Le9uJIhQIbqvfJZ+bdegsS7+2aDsQ8xD74guzBeMiu8t5pG2q+n1l/NyobcK+Lb3SL3aQV0SWN0PsF3AbuijysRrxZXOskMKMGcUa46AgJHnygStgW4kuXqJalJe2vzn8Z9p72P/0qcY+HC3+iyD90f35BB9VPPMaXnJPY44AOz/romHvrwgNAkXFTr1QB51Qqzhmwhyr3ApsYa/f4my+ffQdkBsxwqKMz7vnzzNiEeYLAEyKc9/tmLCzh+CHxQbow2H5HIMQS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(136003)(366004)(2616005)(956004)(6512007)(66556008)(2906002)(86362001)(52116002)(36756003)(6486002)(6916009)(478600001)(16526019)(66476007)(4326008)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(66946007)(38100700002)(38350700002)(6666004)(316002)(5660300002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PQs8GLwYBMJXrXWUyviz/r78148NbPi0tzU7VKxbRCE2F6JhJIRWtQqgpp6o?=
 =?us-ascii?Q?Yn2OtNmamE5GtieWDX9N0p2b9/SPZSOoYY+cFNUY+P5Q6qNCgT8kwlmogDDR?=
 =?us-ascii?Q?JTza76x9HXaWlbcoMWSDim7WGRuB7FnhggmFP1LEkq0k5k5uEqGGkFRBleNq?=
 =?us-ascii?Q?oIIl5zwnvStgxh0BXKnGvkgDFazMDnmEnwxQ0S2LPrFp/tbmzvKfD57HmlYC?=
 =?us-ascii?Q?4ncZXh1icAUktX15zvQj5BTosYi6BGKQe4h7ycGfUbGbRdjmI83QgJD8s6ZN?=
 =?us-ascii?Q?KojlXYabFoV/so2HzNK5SCXiVX7oWULest/kiUloehN21sGL6AWhFGVEnMIc?=
 =?us-ascii?Q?ivkaxYZQ2WvssiKa54T1wglz24s8lAiJBhS4yOYDCiFvvRzujGSwc9dCSyPP?=
 =?us-ascii?Q?qHB9MpkMzC6JweauYLg/Akxjb/YFoMk3s8SPci3Nr5Fm2+y3g2bWinUUXIQp?=
 =?us-ascii?Q?xfvbhh+wnnAyuyL5knIqdBKxx06YYuskn/HKX3IMNYe7P8HldiK5aUMdmX4m?=
 =?us-ascii?Q?XCbQwBHJeX6/FFHO1w/KSyCvSJGuPdoJELUph7i3AJYNQpbSg68P7VCHp3GK?=
 =?us-ascii?Q?yp+RqWmPlNDXmcQ3XFrGyhP7FHpGtz5lsdO+DA3QFADlQ5qwYXl09k8M7liP?=
 =?us-ascii?Q?tftrQ1sVpqommR0GMeg8UXATypvZ3SeYy7svmUzyFNCj9cG4BTlR52mW7Ezn?=
 =?us-ascii?Q?SSA5CLeBbyXrZrTBq1OuqWQS8vEwHgm6YwZ0p/6cnF8wDlpLfB6z1Yr9zbN5?=
 =?us-ascii?Q?kUbFkkRIrZjFXD/obifaPVYyklYjF8XgyijF3PLIhCk1ztoDRiwizMfGkfH1?=
 =?us-ascii?Q?CjX8H0Aex914wXZWqnD3CL2M6BhkJLkqFc5ZpCBDpaypCmrWFz5QyipQDakU?=
 =?us-ascii?Q?dCIzOhrfhykF8L3CMH7vSuX+AEiKFVUThc9E5Z/1eemE9ZuQhXiqtLnWLh8W?=
 =?us-ascii?Q?s4Y8BFISWc8ANZ7mjPhrsmM34fYG8lKhgTgnaZik4YE+LFGaKW4Er03EkDMM?=
 =?us-ascii?Q?V09O3IOZvEVg8ajZbnNFardVWZjczbCsO2jX7GBZdLN5zXqGORQik+Czmkwt?=
 =?us-ascii?Q?z9lAZtnlS1keHIkiSNbMw28c+Wjeo/OyUW7/wCnstxMGsjtW5KILpTgnt/ZC?=
 =?us-ascii?Q?XkI5Tt9FsBMTHbP1HDKhrkUxEEwwjfr+afSsUYLzZRxLttPRTT0GExTtVzue?=
 =?us-ascii?Q?ZZa4NL7riJ+6YAYs5TCqIq38v9Zq4ScGHW9sk78bEOxZ85RqFYLG04PupoDo?=
 =?us-ascii?Q?cB6kNZg6HxR011iRcamlzxBe7wQf2KQkQGlVnQyIs42429uuDYlnR4gO6Fkn?=
 =?us-ascii?Q?tv+dHDNZwkJ5vDpmXIqkaW+p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473b498c-99d6-4060-f6b6-08d92bf7c67a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:03.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1ndi0jAhq5nJE9nBq2o5bEFXEabm49O2Qfc/wcLaLlShYJMKuaLq2Esew3O0TuKhPXEcjAoDZtdtmeyag+aGjq2ngngknXZB3lI3io+nzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6502
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

This is a last step of creating bs-independent nbd connection
interface. With next commit we can finally move it to separate file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 1acac1953e..b34957e464 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -126,7 +126,7 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void nbd_free_connect_thread(NBDClientConnection *conn);
+static void nbd_client_connection_release(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
@@ -138,22 +138,9 @@ static void nbd_yank(void *opaque);
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDClientConnection *conn = s->conn;
-    bool do_free = false;
-
-    qemu_mutex_lock(&conn->mutex);
-    assert(!conn->detached);
-    if (conn->running) {
-        conn->detached = true;
-    } else {
-        do_free = true;
-    }
-    qemu_mutex_unlock(&conn->mutex);
 
-    /* the runaway thread will clean up itself */
-    if (do_free) {
-        nbd_free_connect_thread(conn);
-    }
+    nbd_client_connection_release(s->conn);
+    s->conn = NULL;
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
@@ -371,7 +358,7 @@ nbd_client_connection_new(const SocketAddress *saddr)
     return conn;
 }
 
-static void nbd_free_connect_thread(NBDClientConnection *conn)
+static void nbd_client_connection_do_free(NBDClientConnection *conn)
 {
     if (conn->sioc) {
         qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
@@ -413,12 +400,34 @@ static void *connect_thread_func(void *opaque)
     qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
-        nbd_free_connect_thread(conn);
+        nbd_client_connection_do_free(conn);
     }
 
     return NULL;
 }
 
+static void nbd_client_connection_release(NBDClientConnection *conn)
+{
+    bool do_free = false;
+
+    if (!conn) {
+        return;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+    assert(!conn->detached);
+    if (conn->running) {
+        conn->detached = true;
+    } else {
+        do_free = true;
+    }
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+}
+
 /*
  * Get a new connection in context of @conn:
  *   if the thread is running, wait for completion
-- 
2.29.2


