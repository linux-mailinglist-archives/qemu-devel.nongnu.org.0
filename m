Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55232361B34
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:16:52 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJel-0001d4-9Q
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYH-0001bA-Nf; Fri, 16 Apr 2021 04:10:09 -0400
Received: from mail-eopbgr140137.outbound.protection.outlook.com
 ([40.107.14.137]:53094 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJY8-00089h-TN; Fri, 16 Apr 2021 04:10:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKFLAtSA5quZPZ10qcCP5NgmHY4I+QB1QGXWtjq6i17AvnH/MgBsVwzOiEz7WCw96gKgDfUyOTN+sqCswJVuqHz0jJyYrPvSrhNoyOyHMtClGMd+TKPGe6wzzFJImGkIo9CguixVFiewAdplrPITbzZDPq+KRB0hCS7RTBBXrZr7MM7MHACVk973PKpZN8qfgxYMZcqpcPcQ+OLGY0IGjjCoR3QA1X3374MUgT/30tLkW7vkIPblqjxl6T3LuBr3PRFxWU+jcbUU3J6xvAoo11ypEjs9zlJ7HgIkTizHN6gdhyZs1VxdPuMXW3KVACZJV5kpamCow6epJ+vL2Djtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=358NJVTgyVzJ3QwaOBehidG2e+cywKypgvSITGQTvGc=;
 b=ZiSsPb+aU4pzikba9zl2LheXY4Wems3evPKxAvxyA4vA3Ow8THmdbK+uMLmQtCI3W0Nl83zVXIQLddDmHeWkvB7L5TdzX0fzIZooqQOIW6SOg07hk4xR2VRvmYeudmcXGwsxjvQgLvbFxbHEL+3N8UNVDvtCHfrhKHe4pegUYGnPskSpX93/ikerasrzeA0JsnHZ4K815zpQRmprz9oYn4FfEaOXxnOM1UnyIWrppeCY/23hY5SSxxyxYE0GXwPaW3vq4OIUuidL3UWOWTWhhbFx9mBP4hfESnpWN3QGFiefI7u8PqBGrP9q1NifxwzKYlU3y3yOHFUHDfpavIQJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=358NJVTgyVzJ3QwaOBehidG2e+cywKypgvSITGQTvGc=;
 b=fATpULmFzfTLiqqh+aK5lb0Br+A0bvnZDjFLTQ1uxYk0wx1M5nrM/f+iuDif7YYJ8jp37hU5gO6lQDsTxRmrHK3lqmoYE6mU2BJmwmmob9RuBrxuEN+D2bGZO+T4mwIN0NPbaHtaohZhkTsBT5epx6uHih2w2fU7oIBiwl+C9QY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 08:09:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 13/33] block/nbd: introduce nbd_client_connection_release()
Date: Fri, 16 Apr 2021 11:08:51 +0300
Message-Id: <20210416080911.83197-14-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6841c93-6f43-4eff-db06-08d900aefe6e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469170F753A1B910900A082DC14C9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u49BUyA1eHTMs6Mka9zoVyA9U+6gSktPLval+K5IKzvk802095Y16BqJ9JT/Whb+nGdNz8RrA1JkUSXcoaTBM0NW6FynhJnIcJAUxrk82ylFxIYoJLTiYDBHBqvAg49coQ2iBfTn+kRsFuhpWf4UBTf53jJBUk7ncDGW2rkPJsUu0k1VI3P2lL/qHXhIwoHo2qcsN80aDmL+zoq1m5mrlYuq2ne53fHuNcFSM4DEyYf054IjAo3/8R+AdgjWSvxf21Fp2Cf/BVPdNoO1ymSedAEqVfbBkaTetHVVDZEoyHtVoZdCGOOmkUZu3RUN/A0ozpq/gmWP2/UirOH7cxxYMYi9RgT16yBsiqL9Z5H5vOkNshMheh8P6KUysptq/O0cCZvem+BPLwJAR2d3/+abob4lyxzH6N6U/X3eVaZzC5ZUVJqdzvht+TSK3c2lEcm6uj9cR7GxkD+TjV0N0t61xjAQm1ztwlz5aZGVyRgWmdMLylON/QFlJ8MiyPmyvpQVTnCpaLfsZuU9Ks85+qzh7ulWf5wzqVPfw8PQtfqXuDAi5ekSr7GjHtoAqX6vAGptFUi+71iOtbKiD5xmPOBOk2CWZeMuyWd7NVfK+VcrmBpVttZUcnKA1A0JjMpbdKvw3/wYa5yRvorv0zZWlTOOJ5UWPD47rxDFjtwLJ8a70OP9xDo9Z+9bA3M2bGJ0iIYr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39840400004)(396003)(66946007)(107886003)(8936002)(6666004)(86362001)(2906002)(186003)(52116002)(4326008)(6506007)(6512007)(26005)(478600001)(2616005)(1076003)(956004)(83380400001)(16526019)(66476007)(69590400012)(6916009)(316002)(36756003)(38350700002)(38100700002)(6486002)(5660300002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YKumxr+aehwFpNzN2wwXSDrHa36LdWJB2kr6iKe8oeB9E1YUe+QNiYvsl94f?=
 =?us-ascii?Q?IKyDBVEllVHBOH+l3J9nXA9cmadHIbBMhguTwcG8RTjUEpccSk15lAx4au+C?=
 =?us-ascii?Q?OevDG+bbtnbhrsSl9/eDFX+HIAwwl29R94DnmeKKGWubszeeOuwYlT+vu0hg?=
 =?us-ascii?Q?qqGUTur6o3LOpAIa9FUEiVnid1/WKOHGBg03krfUvokCKqirP6iStEt6OGUZ?=
 =?us-ascii?Q?Ot7F4K26MMZdCGw+0cR7Xr47vaW03/DHzxAqL3TSlNS1CmxX1Alpgi3N8iQt?=
 =?us-ascii?Q?NvqFkuUZgi9iQLtWyOE4PtiWKIsifEE0khjuqsou7ZrRRagg1llPnSktuU44?=
 =?us-ascii?Q?6bBiw3aq4jbJqACF91Unnai+L5dmsrD9gYuTfpnI4b35/QTPUybBn2T0jUP0?=
 =?us-ascii?Q?qVks5CzZOoqsU7HpZqwdCIwFzwh/rDu+4BggWEM3a4vDjIncE27okpJxJu1/?=
 =?us-ascii?Q?fXv7+wgUS5LsvQlOMk9nwBQBJeLTxeXpxHMzMCpqBnFHXqYMf7e4bKw/IVCE?=
 =?us-ascii?Q?sgDfvrFkS5nUXOLLa3JskbpuCIN89XDFVNKlD9p1iUxr9gzkVnurshFPbcds?=
 =?us-ascii?Q?QPkaWNrbJxZhRjs+TGAfvgMp5s5C31251fnf4sfWrRt+Lno+lKcv6R6xrfEM?=
 =?us-ascii?Q?H0C16kZZJixMKwzaadIz/3Fe6yofAfTm38ZKHPu7458mNv2bOGc3qWNKTwob?=
 =?us-ascii?Q?zVAoS3+w+3qLd54KrRAfAqRufJYHXLDCyS2qQgLMXuAYtRSNkNwnMkLCLaFY?=
 =?us-ascii?Q?Ye5HbuNW4isR+k8mY1R8b/Yr+GX66ioiE9+o72DNSvpqUwv9SqSZuYCQthAF?=
 =?us-ascii?Q?Ygd3KNMup2YXg8npa+mZvZhTiR67hyKiEiVRUY4kXKX9aVMHhKTHiQujuCz6?=
 =?us-ascii?Q?cgreb8nyfSSok22EG8FX+0PBWloDMr6vGDO7L1Af4FUvaXtDpmVlvNVWnj7D?=
 =?us-ascii?Q?qSUlNoA4wVBT25O10FNAvi14N+PqvdQdPHowFHQCzhGqBCV7/cWDKRFRfSh+?=
 =?us-ascii?Q?KoQ7mUT/XBIwctFfQwUy/Xkrn0jsHuliwadmU7wEoB3w0albdUfssJIGExL0?=
 =?us-ascii?Q?HY+ZMrHlN4batNpZ+QTZ0AlubNi+aBINJjuB67W78bd6TiHqI3IGyAVwKhMi?=
 =?us-ascii?Q?jNhc26zC/3f3Z+T/8JYGHMlJ71uw67MUl8HiCcAQrQFMb/tFx9RKfsjsnOtu?=
 =?us-ascii?Q?Yu5Z4+6thH9eDyzJvGx9DBwVpsEW2jhJ7rMhJcxYbqUBlHygAwlrAdMtgCH7?=
 =?us-ascii?Q?LLPTYN8QP8LNx6RUcIP4wHRlNx/Wo62VRQh0qFL6TVR+35DYoJmbI+K75S/M?=
 =?us-ascii?Q?THR6A5Azccu3QLGqBKWlhskB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6841c93-6f43-4eff-db06-08d900aefe6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:44.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbKT3/e7l5cEFVM+t1BWf4GO/uRzFzHgewE3S3PG+UrZ3Kr83bV6xViTcCw0pZ56c52Oz1fhhTbCKEsrQE2S7MQ6mycclX6WJ/qXpOzaohw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.14.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 21a4039359..8531d019b2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -118,7 +118,7 @@ typedef struct BDRVNBDState {
     NBDClientConnection *conn;
 } BDRVNBDState;
 
-static void nbd_free_connect_thread(NBDClientConnection *conn);
+static void nbd_client_connection_release(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
@@ -130,20 +130,9 @@ static void nbd_yank(void *opaque);
 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDClientConnection *conn = s->conn;
-    bool do_free;
-
-    qemu_mutex_lock(&conn->mutex);
-    if (conn->running) {
-        conn->detached = true;
-    }
-    do_free = !conn->running && !conn->detached;
-    qemu_mutex_unlock(&conn->mutex);
 
-    /* the runaway thread will clean it up itself */
-    if (do_free) {
-        nbd_free_connect_thread(conn);
-    }
+    nbd_client_connection_release(s->conn);
+    s->conn = NULL;
 
     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
 
@@ -365,7 +354,7 @@ nbd_client_connection_new(const SocketAddress *saddr)
     return conn;
 }
 
-static void nbd_free_connect_thread(NBDClientConnection *conn)
+static void nbd_client_connection_do_free(NBDClientConnection *conn)
 {
     if (conn->sioc) {
         qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
@@ -379,8 +368,8 @@ static void nbd_free_connect_thread(NBDClientConnection *conn)
 static void *connect_thread_func(void *opaque)
 {
     NBDClientConnection *conn = opaque;
+    bool do_free;
     int ret;
-    bool do_free = false;
 
     conn->sioc = qio_channel_socket_new();
 
@@ -405,12 +394,32 @@ static void *connect_thread_func(void *opaque)
     qemu_mutex_unlock(&conn->mutex);
 
     if (do_free) {
-        nbd_free_connect_thread(conn);
+        nbd_client_connection_do_free(conn);
     }
 
     return NULL;
 }
 
+static void nbd_client_connection_release(NBDClientConnection *conn)
+{
+    bool do_free;
+
+    if (!conn) {
+        return;
+    }
+
+    qemu_mutex_lock(&conn->mutex);
+    if (conn->running) {
+        conn->detached = true;
+    }
+    do_free = !conn->running && !conn->detached;
+    qemu_mutex_unlock(&conn->mutex);
+
+    if (do_free) {
+        nbd_client_connection_do_free(conn);
+    }
+}
+
 /*
  * Get a new connection in context of @conn:
  *   if thread is running, wait for completion
-- 
2.29.2


