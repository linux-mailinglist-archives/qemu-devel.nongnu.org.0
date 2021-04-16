Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E07361B3C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:20:28 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJiF-0006xP-FY
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYZ-0001qv-AJ; Fri, 16 Apr 2021 04:10:27 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:43105 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYN-0007xx-1m; Fri, 16 Apr 2021 04:10:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/hXfKCTWB1p2riFg8WtT2ZYNo5l1rgtVNTLymwlO4ay+VDHyGgHo9NLoKnP7frayPs7MGkEWXU4Sz5oaCQEschUGDk+APNlYsrhwXbJ4noMKxxON7kfcD5mPOszFXgC8l5/MColCsUqNKq/xZe5ikA4IsRRAySHimxVclUu7sZcwRfnMt5Rz2U324A8SHQj8MNNdHveoQ5ZXycmyMWPBo2cBU3vUF00YX5eQInZ/MV7sDWcClgyb27mxgESg4Z/3kgaW06ii5a9X7KBSrIoBRGfSpDLVq9KiCYxS5bmvapbVTXYB3Q8xHQRON2AtD1CrHdP0/R7cVvu5MnFp1qbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPSispkZMFuH1SJqSAa5J6jp/qesMythF9OHjoHnONw=;
 b=VqVsY/dcb7ngwXAX84TtAj1OFO8lX+dHSIPt8Q5Cru1URlp5eR2j78htl6hYxbj2+8yRXEIyb8unikI33HHWK+wUI4ubbW7pq+9Gzt8NSRf9M8vmWrrQavf6kx0pO21SV31FRIQtu5rH68G4Cwm0xXcfiRbpVQDubXR/eG9zeMYCmjKfaHLzatFYn9W7NlrsmdC0LLkzyRTOnzPAKRb7MEcGB+2APgytTwoZSTNnnf99bItuI8iKsq7WnAl2Rlg5LDPkmo59z13Km2zz/bogzprnU0eqM3qOATENE49hcyq5dz6e2ecKL97BeXIz37IVk56Hk3WUxyvxlajwoHl33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPSispkZMFuH1SJqSAa5J6jp/qesMythF9OHjoHnONw=;
 b=Ud00E/8ddwgtOjB7pArk6ZWVNsAKOMRpVx1Eb5NbpOZIgo5S/KGLqWqwyOaY1cZcq8303o5bwUcx/b3Rr8eqUbFv4NTuUjKRry4nCqrLqfYszIqdh5Ad4yEEahoJUsPNdEK7/7cH5rkCgM9yE4xfkpaCVRUC+WpuVBbye3c9v5Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 22/33] block/nbd: pass monitor directly to connection thread
Date: Fri, 16 Apr 2021 11:09:00 +0300
Message-Id: <20210416080911.83197-23-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 412c7b13-eb18-4b3f-fc71-08d900af05ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691C92D88E3F008702A178EC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rnWJNk16U8pN6XN5Vww43nS3qdWOVUa1IcIHLTxco2HVWYFhhPqgebmVqWEXSnSB02r58qhItqER3bv2eux4zyigUk/yoV7J7gAiGHfJjhgJ9L/LEWX7PPTysDCLipZiL24NmUM88AcfmBGGYVCYq6ZDefrWAoCzTjxwAbNDr45zcMo/vkj9kddyhekyV55O0u3jGIrme+yDUFfJydCO0/JIY1NbRPS1ExgeRi7yRnf9rsWO9E3xA7RDFx3Z3TJs8C8F3bSwZgB6XXvbLVDzGpTspEiqqg4rOlKHdiGzRDDECw2K6mVnbO1rsNrR8VRarON3tk7Py/2ZA7VsUA8AtpIqY6cSRXQ286+Bkcsik1gFOfwqzOgBfcQcIrZTKdOIxKkEw8DH8nyO8idpi2bdDnw27sLMErYColnbeAIWczOC7UT8GgV2U+dUt74rV053JS6XVtK5VDs1nXskYo1gUuSnrU5/QlLDrWpvGaRLkaF5ltLdou6sCLL6uNapNq8yaFoyDTsWfFy6u7Bdj5i3jriBqWufhnTPNVBejR8xkii++1zg/HDOJl//0pVqyvZtLzFBlrtFRrjZC5tlwtQ1s51Riw3bLUX/GQdP9kPfvnVtx2Z/nyp++KjPtpo94/iw0TL6Hirj4rNstZVxPUtNvFC8NZt7uzYWsl8z4KO/ycme3y2z9wth7vIL3mCQbzC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jnlebLWH/2Kt2YRL0j38tFtgRmNJB/soeayqkEDKIY+XCQ8UPNtQ6XFTlQb9?=
 =?us-ascii?Q?l+Fb5JrQMXC91G3NBXru5n3EYnjS1mYqHFQwatJTI13X685QwwcS2ibHUQXo?=
 =?us-ascii?Q?EWA+bngGgMuAQXuJKZAo8mwTjR405Pm1wC6gj8ff71JzC1JUxXYF5beBbT6d?=
 =?us-ascii?Q?EMyLQcEms1+4Z49NvX3SNHldsrtkkTC+qmDe6NQO1lICMS3mR1pYXgkXEJdX?=
 =?us-ascii?Q?y71dsa09M9cBCoAYuiLqNoXJMJv5BIYhXjJHt3WwWx1d1hdDrsD40mGUU2Vz?=
 =?us-ascii?Q?MIb0P3Xm5TGdJlIDTgT9tdM3TiM4DAvUbEmU4X1N9xuoRc6bFeEEGf9CBTDm?=
 =?us-ascii?Q?U381lNW1hsuBaDPUNxnKwNiJVPdlaakp2ORoZOOasXfTQ2lHYF0JsuxQeFpN?=
 =?us-ascii?Q?b5V09vBjJN2VoL+gEsgydPCgOd8a/t0bD6q45IAb4jOamFyojr6O30AtW9C3?=
 =?us-ascii?Q?2Tr5NEEdr4G6740CxC2fCEhETQ5WARgkl6ptHKbzok8UJbmleF5FvIpM+Vfd?=
 =?us-ascii?Q?umZSW9x8OTo3uuycOQGsqIywvGNhdKpSszWyw5V6wLA4lGtDZB/skQ1nLPu2?=
 =?us-ascii?Q?nkMaXF4noicBa9yn4jEH8U5yz9eSyaIuUPM/SnEqH1Z80HOnlZPdQFvFL1Em?=
 =?us-ascii?Q?JgWDWzvIA5r8KO/PADcYAYGZAUXmOEKASlfmO9NeoTPf8kslyaQgTNDgWss4?=
 =?us-ascii?Q?QbcbRkmehNena37FhrhmotXw0B1KzwU8uTK9sIQJ2Yz56yaquI0SAZ/JLZT9?=
 =?us-ascii?Q?hlR6qs5cwQ5rL5rZ6iwz7E74/+1OqLBoGo+aCqkoE8+oHzd8iu8d5WNY5hzn?=
 =?us-ascii?Q?OYG0Sg90OGwT9QYFHIacril0a4Mj73azBoI2fioJFPetLk6WpfsQeorAA5xa?=
 =?us-ascii?Q?rvqqVer6PSvvbGdaMdUljJBaYElTFwdnRYE2lPFJ8oVoYRS1JtNh0VeycHhs?=
 =?us-ascii?Q?krAwHBuPuyTMZKZhTUg1uo5PTsxjbHVfSGPFuV9aE6Y1ByQy/I2FBJhk3D1i?=
 =?us-ascii?Q?0ea8vrKZUBKksgvnd86g0nAvFnw3hxc6mEhWR8b7zX4Xwm9JW9wvqEL98L3G?=
 =?us-ascii?Q?F0igAbd16EP2vDA2TEUl0Cqx4QmR6ioNYj1tiNH3ou7AjCD7xQZCnghCszlZ?=
 =?us-ascii?Q?fqJQr50v9Ttb6vLxWDfK2wsBezNpwex3N1swgLsnCncQeigP3oCbeyIrKX62?=
 =?us-ascii?Q?HY0c3fty2RbwEVkQ3NA3E0ulJSoR4nzegLC0tXg9sI4PJxUezKEIcxPuFiI+?=
 =?us-ascii?Q?BrrDXbrRpwZGwhKQT+9sSqpeu8bxz/o6P8W9McGJAgYF4SqrxB/9JbP/ImCZ?=
 =?us-ascii?Q?YiycoewG1qNFOeP/SHMtVtbW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412c7b13-eb18-4b3f-fc71-08d900af05ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:57.0183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wpYDONvrT9cM5dyWm29KBVjurpVhvg7FXMESGtmy10fzkvZvHSO9xGDiQGEP8gt2tc9GgpLMuzGKYZ4d7EZAkZuZoxc9UwV0qatKUoQWh8=
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

monitor_cur() is used by socket_get_fd, but it doesn't work in
connection thread. Let's monitor directly to cover this thing. We are
going to unify connection establishing path in nbd_open and reconnect,
so we should support fd-passing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |  3 ++-
 block/nbd.c             |  5 ++++-
 nbd/client-connection.c | 11 +++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 5bb54d831c..10756d2544 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -415,7 +415,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
                                                const char *x_dirty_bitmap,
-                                               QCryptoTLSCreds *tlscreds);
+                                               QCryptoTLSCreds *tlscreds,
+                                               Monitor *mon);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
 QIOChannelSocket *coroutine_fn
diff --git a/block/nbd.c b/block/nbd.c
index c1e61a2a52..ec69a4ad65 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -45,6 +45,8 @@
 #include "block/nbd.h"
 #include "block/block_int.h"
 
+#include "monitor/monitor.h"
+
 #include "qemu/yank.h"
 
 #define EN_OPTSTR ":exportname="
@@ -2064,7 +2066,8 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->conn = nbd_client_connection_new(s->saddr, true, s->export,
-                                        s->x_dirty_bitmap, s->tlscreds);
+                                        s->x_dirty_bitmap, s->tlscreds,
+                                        monitor_cur());
 
     /*
      * establish TCP connection, return error if it fails
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 54f73c6c24..c26cd59464 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -37,6 +37,7 @@ struct NBDClientConnection {
     bool do_negotiation;
 
     bool do_retry;
+    Monitor *mon;
 
     /*
      * Result of last attempt. Valid in FAIL and SUCCESS states.
@@ -67,7 +68,8 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                bool do_negotiation,
                                                const char *export_name,
                                                const char *x_dirty_bitmap,
-                                               QCryptoTLSCreds *tlscreds)
+                                               QCryptoTLSCreds *tlscreds,
+                                               Monitor *mon)
 {
     NBDClientConnection *conn = g_new(NBDClientConnection, 1);
 
@@ -76,6 +78,7 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
         .saddr = QAPI_CLONE(SocketAddress, saddr),
         .tlscreds = tlscreds,
         .do_negotiation = do_negotiation,
+        .mon = mon,
 
         .initial_info.request_sizes = true,
         .initial_info.structured_reply = true,
@@ -110,7 +113,7 @@ static void nbd_client_connection_do_free(NBDClientConnection *conn)
  */
 static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
                        NBDExportInfo *info, QCryptoTLSCreds *tlscreds,
-                       QIOChannel **outioc, Error **errp)
+                       QIOChannel **outioc, Monitor *mon, Error **errp)
 {
     int ret;
 
@@ -118,7 +121,7 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
         *outioc = NULL;
     }
 
-    ret = qio_channel_socket_connect_sync(sioc, addr, errp);
+    ret = qio_channel_socket_connect_sync_mon(sioc, addr, mon, errp);
     if (ret < 0) {
         return ret;
     }
@@ -171,7 +174,7 @@ static void *connect_thread_func(void *opaque)
 
         ret = nbd_connect(conn->sioc, conn->saddr,
                           conn->do_negotiation ? &conn->updated_info : NULL,
-                          conn->tlscreds, &conn->ioc, &conn->err);
+                          conn->tlscreds, &conn->ioc, conn->mon, &conn->err);
         conn->updated_info.x_dirty_bitmap = NULL;
         conn->updated_info.name = NULL;
 
-- 
2.29.2


