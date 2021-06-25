Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B967D3B4427
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:11:50 +0200 (CEST)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlcb-0002Sf-I9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRv-0000tD-S9; Fri, 25 Jun 2021 09:00:47 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:46688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRt-0006Hb-Ch; Fri, 25 Jun 2021 09:00:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULkZdZyTGZJF1DDfq44qF2f+TqBpNYUeSVvIM9pelmBkV5jjFX1hXzY6r96Vp2UozRk61VViRVTxT2k4y6AKcL3kX/6t3toMezxVelmnw//auW4WAOuu0+1r9cR7YX6vfRxeypjvfK5isgJe9jmJ/GfBzVaN+NYSAtarhW2UEgQ1rE8xiyuXCkZYp3XxOj8K17sKYVy8nrBw6yHASbGxC4OWKaaDGIOnmiC/sQoOrCjC8WsO3kunKgYAshrDVToR4HmWP5Ob9k2dgzFzejkzAT1rdSOxGCxSL8Wdx7Xv+Jsf/OtuzbjjUKrmnrc+sX2hlR0MgCFr0VyZ5hMW/GFzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEuv41i5zKNzyyehBfDaOTPQukqvsIVGuzZOZf8nv+I=;
 b=VHNIkTzuuJGONedzetXLDI8c3QMKSD/s2B1D5XkUg1lC9xU2ij/di8QKlsV7v1gOhp9em8rMB46n8FO9Fn40vHiXly0WAOp7EA3jS+8urEK0D8CILQgJzIuJYJ2++1kgrm1ackNT3L+ujxwl1gcx6NSjgzejwqa0U0D82XJ4Bu78Rru9OqwmfG3qTAtWaZzZmtYDybZcp6rB3stP9laQkavcuxSFBfvIlkQKFIRPd1GX9biMaOh6SkWEEwss4gaA23+9e/GJq4RQArDBYvNj7/Epd+armxwS+pF4eFENIEIxmYPj/Nq63ULkIf/YxgEXBBBkj5350+Vou4eddDbjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEuv41i5zKNzyyehBfDaOTPQukqvsIVGuzZOZf8nv+I=;
 b=SnrT1Abaz1c0o4+AYWS44gzLFJ6JTu/7kEatMTyoa4EWc+0MzGKbtXVKzeTxFc7O0/NjTn0eZLy8ycsyI6vgY5SMWr7yHs7dvqJ4OT97hdNv4IHfnI1WTas7iEETNpbzSxzVcpU/2hLva29YL/47QwXbkS9wTYjziOQPo6X8igU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 05/10] co-shared-resource: protect with a mutex
Date: Fri, 25 Jun 2021 16:00:01 +0300
Message-Id: <20210625130006.276511-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14eacf94-4da1-4d04-6d6a-08d937d93458
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652C1372384A140D7F333C2C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:270;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1otU0TmVqi1jEnsJfjdvqNqRUqwaktGeSLc9DAN0Ga9GiJbt6yid/OQ8LZDE5YGCLoDZPpssGU3GuUKiZLbTPmIEe0mzVAL0Wc10Vkfh0y5W+Hk3RYia64jXKKYnR2MxGfSxspevtcoZCcsiza8dcLG6iCcv15LP/HzpiY+qfdBNhRrxy7iDsvOkSrnWbKXXVzOmcBzW6m9LSmTYjr3n6yfTH/y8vBjkg89TnJHVjhvHbhmTQZUzg35/MKMaAanQBq5i/I4USoBbh2+7XNsDZmzhBwNzhAC49ug/sQq1Bh2NI0sSQcz368MDFfMR0AqMf+vHgn1XkEIS/trsheIPx9/O1ZfzZo3zBADPxl5XQsR9Jnq09yi6wuMMEUdg9aDFCzPOLkwioHU3+rscZzEzHxAlhih1/smWnhfdU68DwpXD2T33yGUuREmQGFCSswDTko4vq6iGiVkwOUaxkx/UzF1OAzFk9/l6abRoUqYFh5Um1RGeeHYUA9PYdwHK/tv0cfzMkav7CgnlWt80xT5iKKc3yJyW20MXVpM1s3MX7EQtVsUn2YwK+g4/smdPyv7GugkYATl5eWTAtIxOQqpYFlHQjj+mXC/uN3kImInFoFCl3h+FmQNmquPTOf4d0KS8I81FQ3NB89Xt2mH2toicJZHpbUQOe6Nfr/gfsA+KchTVcOOnFm7LvM/TiFc1LOdG6OJZcfOQJkouFVJr19JA8XC9rB3fm8C4CS6TXbkTe7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Glcae1H95rYfTRG3zypbXOT78zb9fw63o6Bst1IAuipemuUVgCe+9soBtmmw?=
 =?us-ascii?Q?/9KXkUTtQ/f2V7dzqoyrABYqzzwsFccjbCYkanFQzyvwOY30HHEA6xefTW2t?=
 =?us-ascii?Q?Sihr+KexpB7AjYgb8zmfnu+VrFCu//arbL8b4mhdgw4oHmrTB8Wr8XZqzdpm?=
 =?us-ascii?Q?iwBFb4JAIZMt9sMYBcreqQDI5lvGzDwABcS3fXKehHIXIq9n/IifmaGVkNnG?=
 =?us-ascii?Q?VuNn26/K8QFiTDMHSglrjbfmx2toe/EJ0TWNjQ/hvFailzV1mgEqJN0RL1n4?=
 =?us-ascii?Q?BJvrUknTjNh0hHnvioEjXyKe1rGDlrtQhN9B8o69KnkcbFVkmeMUvRH7qNYU?=
 =?us-ascii?Q?qRGWwKj4yH4tTi1hOgugBvRBJCP3dd/3BkE93VK1KZLcc3ZNueICZIbXEZ5v?=
 =?us-ascii?Q?Jpr3FD6KLhhwO5Yukiodb86Uj0cGku09nV8dSSfnNXjFl2wPDX3TZUwFe1cA?=
 =?us-ascii?Q?htJratlQfBX6N7mHFV4kv+VtYug4CiqERRuxFIkOCE3e+Lmy+lyHqvFKKqNI?=
 =?us-ascii?Q?UgNUJ60pyp9F9uUl/lRC4PUN/dmpU/G2H9FzeAM4olzfNJe8FL/giNEMi4at?=
 =?us-ascii?Q?eId0wWGeNlmk+GycnIn2uKlHAS5u3Zp1h4sVLGLoQ4NQLC5POHWHQgWnI9Ic?=
 =?us-ascii?Q?m/ysq3AHCc8qohaJNVRRLyPCUJiSZIGJ2WZ2P0dEtqcwwLwXZ3IBwypn7ZXe?=
 =?us-ascii?Q?VOWRM/6L7TXVhbuz2Os3uDV6+Q2GwdJOOPKbK3G+t9nDrsRkaZMN8IPFkUXx?=
 =?us-ascii?Q?YSDNg9RAba0UHYE+QO+LzVTFBI26dQ0SBUJD6qjv+8AS3n35O2jEJXmA0ToY?=
 =?us-ascii?Q?zJ2AjYTsk8hxZz5nYOCiAifnqqDg1byWs/kJiwWg3X/PupKkRPMkwFaC/K92?=
 =?us-ascii?Q?EJH+NBmKVW5Gqe+og6mKYV4rvzQNMhGS5S2TRCT5mhQQjbG1vPcCLfdb/p4D?=
 =?us-ascii?Q?3Ka2Q8Msd9E5CXyzgxYg43OzXOMOcS7w5kwB4b/eyNttn9YCIaMOs/TeGxxr?=
 =?us-ascii?Q?Lun0qWGVktXK4GD/4zQubnQhf+P+q3gQ8JhDpuXkZaeQYRPGfIYZp2to2Azb?=
 =?us-ascii?Q?5GaUivsJfa7Lw1ugTBsX8M8Oq66Hb6xLg062b+tOkA3u+xuE0VqUXpzQvUvw?=
 =?us-ascii?Q?nxSDo2w39DDq9Fx5bhZMZ45SNKte9YSZpygx6O9prifkDTBQQKPkNJ5z1rR1?=
 =?us-ascii?Q?65D/xHBkRDVDkQtHqCTApWIzG0bM3ED2qtSRNu94x8oK4pS39vcZ07O8+NGs?=
 =?us-ascii?Q?0b0RPB3i0ajS7p0RcyzemM0oJMNviE1WMc4MaryFGIA2MShiLuJajp9AdYMc?=
 =?us-ascii?Q?5Xq/6JkLb8Aw2xl/IJ5GW1o8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14eacf94-4da1-4d04-6d6a-08d937d93458
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:27.6700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggtQWbhJfH3dgby3oX6nDUgjOjIw1PHHw2rUEUnsqeVmIJbmM8xQkgFQrIsAiwwjrVSikuFF5wKDSZaT/x2aSaOq/VnYmQMntxTagMgshbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

co-shared-resource is currently not thread-safe, as also reported
in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
can also be invoked from non-coroutine context.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614081130.22134-6-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/co-shared-resource.h |  4 +---
 util/qemu-co-shared-resource.c    | 24 +++++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/qemu/co-shared-resource.h b/include/qemu/co-shared-resource.h
index 4e4503004c..78ca5850f8 100644
--- a/include/qemu/co-shared-resource.h
+++ b/include/qemu/co-shared-resource.h
@@ -26,15 +26,13 @@
 #ifndef QEMU_CO_SHARED_RESOURCE_H
 #define QEMU_CO_SHARED_RESOURCE_H
 
-
+/* Accesses to co-shared-resource API are thread-safe */
 typedef struct SharedResource SharedResource;
 
 /*
  * Create SharedResource structure
  *
  * @total: total amount of some resource to be shared between clients
- *
- * Note: this API is not thread-safe.
  */
 SharedResource *shres_create(uint64_t total);
 
diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
index 1c83cd9d29..a66cc07e75 100644
--- a/util/qemu-co-shared-resource.c
+++ b/util/qemu-co-shared-resource.c
@@ -28,10 +28,13 @@
 #include "qemu/co-shared-resource.h"
 
 struct SharedResource {
-    uint64_t total;
-    uint64_t available;
+    uint64_t total; /* Set in shres_create() and not changed anymore */
 
+    /* State fields protected by lock */
+    uint64_t available;
     CoQueue queue;
+
+    QemuMutex lock;
 };
 
 SharedResource *shres_create(uint64_t total)
@@ -40,6 +43,7 @@ SharedResource *shres_create(uint64_t total)
 
     s->total = s->available = total;
     qemu_co_queue_init(&s->queue);
+    qemu_mutex_init(&s->lock);
 
     return s;
 }
@@ -47,10 +51,12 @@ SharedResource *shres_create(uint64_t total)
 void shres_destroy(SharedResource *s)
 {
     assert(s->available == s->total);
+    qemu_mutex_destroy(&s->lock);
     g_free(s);
 }
 
-bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+/* Called with lock held. */
+static bool co_try_get_from_shres_locked(SharedResource *s, uint64_t n)
 {
     if (s->available >= n) {
         s->available -= n;
@@ -60,16 +66,24 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
     return false;
 }
 
+bool co_try_get_from_shres(SharedResource *s, uint64_t n)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+    return co_try_get_from_shres_locked(s, n);
+}
+
 void coroutine_fn co_get_from_shres(SharedResource *s, uint64_t n)
 {
     assert(n <= s->total);
-    while (!co_try_get_from_shres(s, n)) {
-        qemu_co_queue_wait(&s->queue, NULL);
+    QEMU_LOCK_GUARD(&s->lock);
+    while (!co_try_get_from_shres_locked(s, n)) {
+        qemu_co_queue_wait(&s->queue, &s->lock);
     }
 }
 
 void coroutine_fn co_put_to_shres(SharedResource *s, uint64_t n)
 {
+    QEMU_LOCK_GUARD(&s->lock);
     assert(s->total - s->available >= n);
     s->available += n;
     qemu_co_queue_restart_all(&s->queue);
-- 
2.29.2


