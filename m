Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9393A297B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:39:28 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI5v-0003YZ-CS
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcy-0006AC-5K; Thu, 10 Jun 2021 06:09:32 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:32769 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHct-0005DU-6p; Thu, 10 Jun 2021 06:09:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR1vYAo0rE1d7vduN/qM8PXOF3euodmwGw1umRd7YeHAv58epbn4/c3qwMd6d2R4wGELxJOfGxyb3qToHHKG6ZWC0QH6hsqx8bSzkOQDCu/E8V498fapA4lItSkX3Bwv0huwzLRhpuN4+4pKte8Dqj+pNAQxnbzcjrDPkOpUzN/W0hpMd862f47gtbDskBJBMzfDIsI+552xC6MV0mdpgeSYLTowS0K8hf7e3WdLppfWYzu9kk8x3cCBgczfsmW50jYCIf4lAUl96jY6k8UVfT7yal3IUAKUblqqLnWp0xIDLAEtPjpYopDpHj905AmE4eJ5yquyeMSGOy037runMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzF7EYrJhOhuL0zilCSXcPOrK3fdlHkP3qTL7c/VsNY=;
 b=Q32UHDHs8Uwp4f7sGbk43BeDRYlhwEAe1K1wXOjE6ukCHk6cR4j0SOh7fLHcr9+Zz2UeiTQUYO/2XpqHbECbd4ka49ekWid9Y5XBMH5oi2bnvDYytHCcIYWp7INThu83haYRMfZf9/lT0s95Z+b2f/i04G8ctQn001rV1t/JXj5eOsgsS+nKih+R2PRo/i9DDNAVW3IZ0naxnUOcn+Z/mZKS+FaKA7QJgoEboe0wwz/FNF6LJwl0dmgUhLfFKB1Xk5N9Ya7XP13LOEa7RBcVZI5H6G89cyeqN7W1fCr5u0zP68InwGww+dMA5hpQ6bwULtzZsPouttxz59UD7Enmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzF7EYrJhOhuL0zilCSXcPOrK3fdlHkP3qTL7c/VsNY=;
 b=l+aY/GEBJDyDN5bDKveugbXXjRPSnsv9GKtM855HZfChZHrNuV2dQheBcOvoIiML6fHt9fwx5dS1TFBhmmChpGfpoO6zWzJ+z6CjyfeWLMtLCtPoKEfRw8MnlovUT7feRYqtnCyYjTDWf6pHgp6J54T0EiAVNbtC9oStdV2q5eY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 10:09:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 28/32] block/nbd: split nbd_co_do_establish_connection out
 of nbd_reconnect_attempt
Date: Thu, 10 Jun 2021 13:07:58 +0300
Message-Id: <20210610100802.5888-29-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b90abe25-aca6-4e93-5e41-08d92bf7cf39
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806358E1E453A133575C962C1359@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5J/+SDFUe1erQm/NvFX8ISRSQnAJDQnE6IM0mQ/c9uCHdztRaSDB3zCmr72u0alUHLTiGcEebC4mXYbShU9qKogdNQD0c0ct49uDHPpvb/oV+TEU74+5WWfdinnm6jMe2KQaVltbEcyr5VWdTdTGw/tgN8zptdbzW3ASTlfEA00vy1ICRzDsKs5pSmDacsFvTn5iBh6EDXai8czHVxqMH4eY0EwcOBnZPF3R9mQ1fXWT/486xXI7hM9180bVY+Odyzpi1hm6DAeGvZS8Uybsvw3yJwA8/bfUvv/kMJCeBroou7RMMGDzHpEHxGMIC/CZw7u7v+u1E2LXMLsW8HcIWll9xP2q+YJxDH+UpSetfBH6bC78tfvWmWR2gXU3AGgKIzHobmaFKTivP8gE8oJ2nOvOcUUUYo5t8NVfJ6syYk7REn/83vNcE7azSjy9UkHIYztuvyk1Y+H+AWxisrvf08ZU7n6d5YUnEU186rCIj0LRYDPaf6Aqnw1mjSdNY1AF6Y4Na6reiGzHovOk88Vl/ZFAVWuQfCo4LHmjzw9BWluqcGhDFbidn7GNEgWQkrApmxdSdwo121Gigf0Mniv9hkENG5wRFbghIrApRulDS7tCKAPdimnxTHKIBz7znfaDguKgCRlEk61o+9bOQn7YrLTwTVz1JahyxkyTov0YRNNQKPimZS9C1E24XO3yzJF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39830400003)(376002)(396003)(346002)(2616005)(2906002)(316002)(6512007)(5660300002)(8676002)(1076003)(8936002)(956004)(6506007)(86362001)(66556008)(38350700002)(16526019)(186003)(66476007)(478600001)(6486002)(6666004)(4326008)(38100700002)(26005)(66946007)(6916009)(52116002)(83380400001)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xDwg/xAkmCiFYcp4PNKIfqLcItgBfNeK7++DJVInxIc3IgmKMlXaX/1XEwMF?=
 =?us-ascii?Q?/WECId5wvZ/ep+WDhFAebdYhvVMX75GJlNYgRSkslTs+WZMjpfEeT4uH79d9?=
 =?us-ascii?Q?8mhiiBBruisgE6cUvuhBErvguKSfudD1ou9yPGBKCL+idzt0SYezjQTLOHSQ?=
 =?us-ascii?Q?DEVGhxJ4op/BdAffVdwhU3NhM8Wq+y4nQ+wWqnlpYYQ5fOa+OMvJyMZxF0VO?=
 =?us-ascii?Q?XGpY9zX6lJaxaavpQPekPdO4kWKEvkgsgQpbwE1wigg7bctYXOm/ZvYN0gYU?=
 =?us-ascii?Q?p/CMsqnuEr9lVzpH3h3fwTrbwC7hot2BHDCHZfySRo3ZgdoSkJfgqvY9V1hP?=
 =?us-ascii?Q?9SbJ9jXPhRKjSBSm1pXEEHicrpXQtKWNe9iaURnGnnhqoUGRrA2mRKms7j/6?=
 =?us-ascii?Q?SVrVaDmNmfq2Wi+cuEoGB46+eRZrh0UmMJI2M15OACRvu58B20iRa+ElnfL9?=
 =?us-ascii?Q?uXAnUxDMItEbtQwjbpjlugG6tYIqnpvCvflbAno/vd9ZBFh0esCmsvwBPdpS?=
 =?us-ascii?Q?etgtneaxGiNzFOl7tR54RZ8iJ2WIXA5wpX14NW65NzgGngmBe3ZPoMP76/1k?=
 =?us-ascii?Q?BtpQ0bI9HK8i4A8kPqOcczdKyyeGO05bALvbDnp1IKoWC2T7mwkkCvIF0wXN?=
 =?us-ascii?Q?sBz9lLe4TOq3TnCEXRAualW3e97bs6Ugsx0P9+GJl7czgKv/H54UpnLLjVS3?=
 =?us-ascii?Q?6gLiHs3gogpTEmiXuGs2KLAFsAj6YAe+vU9TQbegOhtQkcEnUavBahCw2TZR?=
 =?us-ascii?Q?Es660sa6S09L5zCScsJge2IxBvPSLFiADT46Ao7p6gM+KIbekiIkCtjaHg1E?=
 =?us-ascii?Q?0RwbTZuzhGK9laLUAQ5Rhb3iuwoPHhRq7fprHfznmOxNCUEMC9Z9xDVHRiVg?=
 =?us-ascii?Q?lZCrCkgJjkXX2uA2IeDp5I0k51zSlJdscose2Fu2VZbsJvCpF/+HtRy23I4W?=
 =?us-ascii?Q?gXq8SU+MvtbGcCRXVb8atCnuV3utfKvJoTu8IpymD7I4gsKvK+t8i4b+oBjS?=
 =?us-ascii?Q?rYkJ/eKbcb/BLO9AuPX4FaojWj4jhsNbm84ZGIEthySBBlPvKw7zdbMzIWml?=
 =?us-ascii?Q?0IYgumV57N5tL/vTXUh8BsF3k5YMeY1fM6gc7u/1ubV4KtuRXuyceJe1FKbb?=
 =?us-ascii?Q?UR35vqGp4hPty4/8SOyvuzwZYlAjDEro0I07LZmoVVfki9PDQBxsPi7X5aza?=
 =?us-ascii?Q?GeyCMh2fTg89npTPuExO0gPpx9CpM3c03WmSMyo/f030n+3eEESvN0wQkjSs?=
 =?us-ascii?Q?um8uNNqrMLVupTtOFmwac9FMBplxNNKUJRkrUi1j6JCgr+vQjuyq6veebwmI?=
 =?us-ascii?Q?f3lJ5N7aCDJ9cI887CKLMKlG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90abe25-aca6-4e93-5e41-08d92bf7cf39
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:18.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFrTEtJUO4xnhoEcbSyg1VS2GnJI/j8H0FMznjS7+doFBldrSwlZ5G425AfIrQPbVkBNfTimaUQOrAiNuyN4phxJtn/36jbVZrydaz+JA8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Split out the part that we want to reuse for nbd_open().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 80 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 411435c155..8caeafc8d3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -356,11 +356,50 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
+static int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
+                                                       Error **errp)
 {
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
-    AioContext *aio_context = bdrv_get_aio_context(s->bs);
 
+    assert(!s->ioc);
+
+    s->ioc = nbd_co_establish_connection(s->conn, &s->info, errp);
+    if (!s->ioc) {
+        return -ECONNREFUSED;
+    }
+
+    ret = nbd_handle_updated_info(s->bs, NULL);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
+        NBDRequest request = { .type = NBD_CMD_DISC };
+
+        nbd_send_request(s->ioc, &request);
+
+        object_unref(OBJECT(s->ioc));
+        s->ioc = NULL;
+
+        return ret;
+    }
+
+    qio_channel_set_blocking(s->ioc, false, NULL);
+    qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
+
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
+                           bs);
+
+    /* successfully connected */
+    s->state = NBD_CLIENT_CONNECTED;
+    qemu_co_queue_restart_all(&s->free_sema);
+
+    return 0;
+}
+
+static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
+{
     if (!nbd_client_connecting(s)) {
         return;
     }
@@ -398,42 +437,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    s->ioc = nbd_co_establish_connection(s->conn, &s->info, NULL);
-    if (!s->ioc) {
-        ret = -ECONNREFUSED;
-        goto out;
-    }
-
-    qio_channel_set_blocking(QIO_CHANNEL(s->ioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), aio_context);
-
-    yank_register_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name), nbd_yank,
-                           s->bs);
-
-    ret = nbd_handle_updated_info(s->bs, NULL);
-    if (ret < 0) {
-        /*
-         * We have connected, but must fail for other reasons.
-         * Send NBD_CMD_DISC as a courtesy to the server.
-         */
-        NBDRequest request = { .type = NBD_CMD_DISC };
-
-        nbd_send_request(s->ioc, &request);
-
-        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
-                                 nbd_yank, s->bs);
-        object_unref(OBJECT(s->ioc));
-        s->ioc = NULL;
-
-        return;
-    }
-
-out:
-    if (ret >= 0) {
-        /* successfully connected */
-        s->state = NBD_CLIENT_CONNECTED;
-        qemu_co_queue_restart_all(&s->free_sema);
-    }
+    nbd_co_do_establish_connection(s->bs, NULL);
 }
 
 static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDState *s)
-- 
2.29.2


