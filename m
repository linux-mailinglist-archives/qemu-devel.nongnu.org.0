Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3994F361BA2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:39:00 +0200 (CEST)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXK0B-0002d5-8t
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYS-0001mV-Jx; Fri, 16 Apr 2021 04:10:22 -0400
Received: from mail-eopbgr80138.outbound.protection.outlook.com
 ([40.107.8.138]:62715 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYJ-0008Aq-If; Fri, 16 Apr 2021 04:10:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V58RaOrIayL/feQRg0jH9yyTr1HWB6ICpQMU7STYoXBKuJEWge2TZkCIV4SMvHhaYwfK7sxh+M4syrSGTw/hVi8sofwEDC+cbjfTaWRMRUUG9UwMOKgwu7iRBu7Um24tcz2c2jNp39g1NNGB8/0AzdqyLlIgVUDb1nDu8b2OC1Lqj8lnBSi2f4Hd4wq3KaS2HRWp9clz8dBVC+zgyboxgnPWZNDqmfTsMkoTtcY1G/Q6SOoQsR4MknzV/3bfr5zikQ4BMwLSGhqgH5RDHo5mmTv39lo92BY1yLbR+412bLZvyHUJxBNFo6yT28NzDi95SGsFAbw1ZQapLF/2QkeylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYbc27t97K6fvdqgUWLqXbCI8f9H+CpcQF0Fvg+iJ2Q=;
 b=Q1RD1Mi8hBxOt91rv5lKXS0NypwzpnFg0cxIOWxvmsyJp3OI6aFnXr63gBamYs++gUqXgoYwnUEijsq6zrs2dggedjzlrCg6Fpq1OZFS28U+0ZNp8OYan/EkSnr79+aGCC1z9JupoIdhjuayTgJ4ob+rVHl7nAJZvY644KYvkVNIgypFFaWeXQbPjNTXzWKneK86vuQ7gO23WvShsnS7BJYD8bp9g6uSuvxcZoJAfWpLTEHEPH4G1RAUBxLZ/SaSgv6vFIMB1hIyQcJ22eDcw5dFuEgIFrRRLaJl5MwomfDS8s5r2OdI7nZLYeO0b6QL25uKgkbw2NbzXW0kYVv5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYbc27t97K6fvdqgUWLqXbCI8f9H+CpcQF0Fvg+iJ2Q=;
 b=BOSaN1c0gp5HSxP9AD4c+tGUbK2Oa+9hL96Sb8uwnjweP9gXN5eJ039kdD8KMGeRF6OwZV+D3h8XOgpKcdr1Lxr9kow/pwEkPy5EWpMOWMkhO1DuZVgrQCPchFkRYh2VknumvzE4uYrDIsLQfscSdAM/IxN7y93zEMxpRA49g24=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:10:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 25/33] nbd/client-connection: return only one io channel
Date: Fri, 16 Apr 2021 11:09:03 +0300
Message-Id: <20210416080911.83197-26-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8873a6cf-1cba-4a2a-9ed9-08d900af0852
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3717CD9864D8F461DB19CE4AC14C9@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:339;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abKdcCbIB7d0b+QSI3lbYl7u61sbbPICxLWN9YRCq4ZX8JkOt+Z4P3i0hbH8WZC4uyGspp2GAnAAnQyBFTPmUfa3hp7816W+m8CkAoGsKKRTnGsYZFeCaLUr0gE32Hy6nwQCTNw7Kdh68v9gRTL+QlaU08Q7tMWyMZx9SvqEgtikHYKZ8P8pn00osE1EAKAXYL/V6Jy8bGWtHIYeqRSxT0LqyYdowGHgNR/QIEhm2PXFKudJsI/W/pKnAwWDvCrVlOKLmpPb1ftYxbS8er2ZFcd6iJeWrCbCgoUsWYs+OAXy2r4or68keQi8MBM2NWaeubGqGBNDj4ZhLLT3zZPcPo9QpzgHYPv8RAi1KJmW+QcOShHzy6A+J6Rd/Et06ad0uxtwwCfHGWWjhTLbcH1M8u76zn4d5sxvklC9X5CnCWMreslalhbKAO3e21y3T5iOn5ruPfvfJtVLr65KlJ+agn6b1BM91q1HF1/M8aMCqLwINr4zG5a4/dKN31VXmb3Fjl870UDILuZ1nTC4SGFN9pDonwiFPZf4osm9KWnT4t+bziwUtmuy6RDAotO3JcMUcd1mPLCDuwJPQdqd/f9BrO3myBwnaMiNseCtDEpVD3IilTeKj7GVg3sjdHbobKHb4j+sLmMqDZ55f4lmJwwCuviLn2sXiIO4YIWQ7vPOLPhO20cCGGVOZQjF8GzBGQoY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(66556008)(2616005)(66476007)(186003)(6666004)(66946007)(6916009)(107886003)(2906002)(26005)(6506007)(69590400012)(16526019)(5660300002)(4326008)(52116002)(478600001)(8676002)(8936002)(1076003)(38350700002)(956004)(38100700002)(83380400001)(6486002)(316002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cBrA6ycYzGGfYB/TIXZ5q6m0O7oV+WqMpKMzo0ncowwi8IYIdmFNT24xWnLm?=
 =?us-ascii?Q?S/VgVhMrMKNWDOxqv4v7SRB3Wl/SuKNdQ/rll7sijIu6A3RGzLv33uWHSSBD?=
 =?us-ascii?Q?f3gEGHOqNeGHSGIvnQqRJzByyt+zZ7kTMmobiVWLf44q3gjIAS98EBuryFsH?=
 =?us-ascii?Q?LQJR134zbO16NhAfCjC4hua8qztMU4RN6VdUbM26XZe4926b8cVXs8C6umV/?=
 =?us-ascii?Q?de7+Kf9pqZzPNDA0u0H25iH1eEPqaoBHaDUE3vikBWwlijIkYv2Ah9ClGand?=
 =?us-ascii?Q?nqBRa2iNqK92Rw3tstMEBkAegL0GcUWHPd6BMKqi3IZZGvgba9I6lHHS+i3g?=
 =?us-ascii?Q?lCiNax80gssgG9CTpiFUY6dxYYwZ55dopMoYPQrKT2glQM2DY/8ev6o61Vgc?=
 =?us-ascii?Q?MgC7Mt4pu6K2b7oN5OmbW+7ahoJexyoWVl8NEKDkbGiiNdnhCDJeuLXkuFvk?=
 =?us-ascii?Q?Rd7f9AAGD6ILVIytJZm0AX4yJXoh3Xw1J9TsZWpDgJ5J1sorR3Z2o4HFKTIs?=
 =?us-ascii?Q?+8CbA27O3QyN79eOH+BcSHwK1WXlHqJyg+K/Nsg5nnht5GN4JFvUUf32AUcJ?=
 =?us-ascii?Q?LMCucDKtoUV1l8WdCEaiV7PD4OOEJPwC+Beqg8pK4VLTWn5823WCN//n7uQs?=
 =?us-ascii?Q?lKVLvNeFUBfNPiQ2MlP8ANFT2FT8IwLNJRmHb6HmmISMCqJ79DaVCnoOCiD1?=
 =?us-ascii?Q?H4gVxCAGVCZFLM0HazjPUAC/WW6FnpSya8G/iyuR8yNPMFSnWBG13zHqFAYA?=
 =?us-ascii?Q?37LLbrrEm7h3RpegXVJSBoUQ7U91JXt9YmE7ztHCdYicCi3oqHpo1uspvRgG?=
 =?us-ascii?Q?itOfO4FTHtRAtYo/Hckp+gZGcIXpzMaNJGPiYVuVYMfrDvYoAQxrqvpzHmTY?=
 =?us-ascii?Q?Fb7JzWhjYJEgEv6W6WhYRK1IF7tHXpBiCrBEIBS9xO7z43p8XiWeMdTaI8rX?=
 =?us-ascii?Q?4vBpOFiMSyhycm/k6kQi1RRRH6c3U7UcwKyE8veX8BS19oOqZPwZ2+uq/bmM?=
 =?us-ascii?Q?6M4n9n7fsoMWuH0scSQtj+leatzezNNFRyS5SPrm3t7TthnZpLKZX+akG6Ul?=
 =?us-ascii?Q?kBm/zlgJeJBPxkI6On2UHCIW5mpibIjU7h3minVjOGe6V6ucEfZY+e1PktVp?=
 =?us-ascii?Q?Occ5nbsunsYrDr3+QaCtM77EbanUKq97LDMUMTWwYNXf1FQ9Rdv+HcYGrRSr?=
 =?us-ascii?Q?h1GYbqJ4FqOTa7xDWcXGoPDIKz5pRj7KRtgGwZqtnh5B0i0ouvO3ruzxNdva?=
 =?us-ascii?Q?KtzUt45abl3whlrIuAzdXoft+fPDd68erKhQwLuxmomeyvycFTRX9ws0FHkg?=
 =?us-ascii?Q?IrlrPLObQES8XhArdmMo694H?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8873a6cf-1cba-4a2a-9ed9-08d900af0852
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:01.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe1t22i12mh3Z6ZSq331LGAchlzfRqC0YFTi+JIgkR2lmDDvfUkMk26mD2AD9iU+g7+7Hlg6TJ7oDF/Cu2VZWx+kuhMiwv6zQCKEXkCO10k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.8.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

block/nbd doesn't need underlying sioc channel anymore. So, we can
update nbd/client-connection interface to return only one top-most io
channel, which is more straight forward.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/nbd.h     |  4 ++--
 block/nbd.c             | 13 ++-----------
 nbd/client-connection.c | 33 +++++++++++++++++++++++++--------
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 10756d2544..00bf08bade 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -419,9 +419,9 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,
                                                Monitor *mon);
 void nbd_client_connection_release(NBDClientConnection *conn);
 
-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp);
+                            Error **errp);
 
 void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
diff --git a/block/nbd.c b/block/nbd.c
index f9b56c57b4..15b5921725 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -365,7 +365,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
     AioContext *aio_context = bdrv_get_aio_context(s->bs);
-    QIOChannelSocket *sioc;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -404,20 +403,12 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    sioc = nbd_co_establish_connection(s->conn, &s->info, &s->ioc, NULL);
-    if (!sioc) {
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
+    if (!s->ioc) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
-    if (s->ioc) {
-        /* sioc is referenced by s->ioc */
-        object_unref(OBJECT(sioc));
-    } else {
-        s->ioc = QIO_CHANNEL(sioc);
-    }
-    sioc = NULL;
-
     qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
     qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
 
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index c26cd59464..36d2c7c693 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -255,15 +255,15 @@ void nbd_client_connection_release(NBDClientConnection *conn)
  * nbd_receive_export_list() would be zero (see description of NBDExportInfo in
  * include/block/nbd.h).
  */
-QIOChannelSocket *coroutine_fn
+QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
-                            QIOChannel **ioc, Error **errp)
+                            Error **errp)
 {
+    QIOChannel *ioc;
     QemuThread thread;
 
     if (conn->do_negotiation) {
         assert(info);
-        assert(ioc);
     }
 
     WITH_QEMU_LOCK_GUARD(&conn->mutex) {
@@ -277,10 +277,17 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->sioc) {
                 /* Previous attempt finally succeeded in background */
                 if (conn->do_negotiation) {
-                    *ioc = g_steal_pointer(&conn->ioc);
+                    ioc = g_steal_pointer(&conn->ioc);
                     memcpy(info, &conn->updated_info, sizeof(*info));
                 }
-                return g_steal_pointer(&conn->sioc);
+                if (ioc) {
+                    /* TLS channel now has own reference to parent */
+                    object_unref(OBJECT(conn->sioc));
+                } else {
+                    ioc = QIO_CHANNEL(conn->sioc);
+                }
+                conn->sioc = NULL;
+                return ioc;
             }
 
             conn->running = true;
@@ -311,11 +318,21 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
         } else {
             error_propagate(errp, conn->err);
             conn->err = NULL;
-            if (conn->sioc && conn->do_negotiation) {
-                *ioc = g_steal_pointer(&conn->ioc);
+            if (!conn->sioc) {
+                return NULL;
+            }
+            if (conn->do_negotiation) {
+                ioc = g_steal_pointer(&conn->ioc);
                 memcpy(info, &conn->updated_info, sizeof(*info));
             }
-            return g_steal_pointer(&conn->sioc);
+            if (ioc) {
+                /* TLS channel now has own reference to parent */
+                object_unref(OBJECT(conn->sioc));
+            } else {
+                ioc = QIO_CHANNEL(conn->sioc);
+            }
+            conn->sioc = NULL;
+            return ioc;
         }
     }
 
-- 
2.29.2


