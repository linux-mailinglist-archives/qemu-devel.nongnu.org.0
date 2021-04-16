Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E942A361B3D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:21:12 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJiy-0007o4-0W
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYK-0001fo-7I; Fri, 16 Apr 2021 04:10:12 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:19400 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJYG-0008DX-Hh; Fri, 16 Apr 2021 04:10:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMkCbj3abd+9jczAwb1833t1arxYPIiESMMBYygqnQcjSectwrLHGkiDq9JueUTtWB7kzcDm5hmQEYBn/2apxLa1yyOSiEKkUVOjNA0Uuqv5DrOVBwHrVmqXjIH+e17gQt3Ay6bLvFJGN3WIFE4zj76iXSOmC7+ks0L8qoYkNFgtJP+zVGWAtXTN9sk/1SJE79yO7I2I8iXUdXFkCNEmKJBPiqEoUINCjPJuKjq0WBAscuq6nfV2FQFKVIplxUs223gC0N6R245k9vS34kuo4Apt5HTjFDPM0oPWLQtHtCacKYVQO6qJdhthtogv4aI8bx5NLh/0OYgslqMpgl92QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMOupwfGk4Hh2NofkATvRy+YcV4ZG/hMjOt04CG69og=;
 b=lAep4TBUzmZhwjarGurnHOtjldHxjjtRm6eiKO8gp78glBuSXQOONBExKNlyQShYsZYn4gfUHfH4Q0EYgrTyq1X8+TZHXW+Adwfw+CNK8Lw29gyBY/m6EOWCRbWDnZiuoSu2ios+7yAMAJE0LkYJpN36fz6/J7YAAgN2dWJkoLi17AwfU/hvbC81patnfEo/Ite+w8fQ9DAzTiDdz0khHu473h4xJoGwSG54kSJOTCFfpisxx+u8DIMf2OgaqL9zkgiYL5EYYKbgIlo7Jd3hOJ4mJ/uSQBrxTSDQdUtlei7R4PL2RpeAEeTtFXGT0y8gcbQKpshWA1nfH/lyHtORDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMOupwfGk4Hh2NofkATvRy+YcV4ZG/hMjOt04CG69og=;
 b=LlEgYMJxVr3Qg2ZUBhgQ1/dJLed1gfOozBg27THatW+ekMivc/4RxU8v2gKjv3M5jKJ9/cyVCDLaTLlJ6VrtbCdv1wwTLpjskB03uVvFcm+qFP/9ZfDbfOieBmcCFKjgkisNkBM7IoR+ZoRH1FO1qeslBAAEiL+65G2CnF2G1NM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 08:10:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:10:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 27/33] block/nbd: split nbd_co_do_establish_connection out
 of nbd_reconnect_attempt
Date: Fri, 16 Apr 2021 11:09:05 +0300
Message-Id: <20210416080911.83197-28-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 843aed56-6748-418e-8ba0-08d900af0a07
X-MS-TrafficTypeDiagnostic: AM6PR08MB4599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB459990CAD2850C13A5D81D91C14C9@AM6PR08MB4599.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KA+ZoLj9LQQvB1hZY9ErIa0utcoui474VtewJzLhnJr1BsDsHu4qaqUBYP0q/vWkuUkZEFpMnuH7ktzBCLEpE4qkvupr0Q2bRsbbnXgvlY16ZdJjO79dw9plib3chkwdiy5pRLyPSNIftuBiN0zFEsIWH5IgEG0VcpQgRMyW7f6cSQb9N8WWDYf0lKksYiRbjmWMyDb0FI3dppVx72A19NKMlnlZIwmL8P9yXnEnGySuxEYA6nY7f8TBJ96ZAtdW2dtuZsEl4g9YxVL6ScHtq3ibdNxkX1aejbVOvia18vXpllcbwuj8gItZH3xF9KwX3qQrZ3iIE/xFmp4HpafOSdMXAX66OVFPHVO9iYEdbVg5mCbZd/24H2IiP3LMe2Mo52Ot/mQMzm4Ggb5Da6EXgtR04RY4GRMPcl1fpcjRmnnueh/uY8pGleKFfuAkRXwMPAkomytV31Nud2mqtpzJJhezeaB2SEPT8gbaPjCzP/05kh2F7EZYLX6w3x9v4x7Tr3kLZzcAJqsgU1VVI1zdeXJVQA2Y85P6skATBhneubPF2mMOUYP+AR32Bv7dJ11aii3nmpvhDUE8MR/WQJP62EgX7NScA+bI9+BtQ2pbXznl9BPWyJFBuse4DQXvTYlawaK1Oh2PnRJslPrKDV79+TYddrEOfNzX3dASPajme2bbi8PTpg9zFomwAipUzI79
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(6506007)(6512007)(478600001)(66946007)(6486002)(6916009)(4326008)(8676002)(8936002)(66556008)(186003)(38350700002)(16526019)(38100700002)(5660300002)(107886003)(1076003)(2906002)(956004)(86362001)(83380400001)(2616005)(36756003)(66476007)(316002)(52116002)(69590400012)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hRMISeRwLNt3ODm3IPncritf+H6Ve0SnQ1lHIQ+J5pAEieGDH+5e8IttfQhA?=
 =?us-ascii?Q?EtdW4u1FvUH3OgZyMge/aiusv5ehd0Af+5Bi9sIGlqgwOitz7IHvUL1ur9F7?=
 =?us-ascii?Q?34ueGZ7qibEXOfaTrPqdSriLKZphvGG6VgAFyIf1GAxo/KZZnB21Q/4M15rD?=
 =?us-ascii?Q?RuaWTqsIMvJxeaMV6spRSRzwWi8XrfaRgLGgr5PK/ynGaL9IBpKzAA9047XG?=
 =?us-ascii?Q?blY3lqw1JUByrsoPL99Q6ts48fz3ICkEGIaPGG5HQvnEXWlMKet2HLNE5yR2?=
 =?us-ascii?Q?gVO7jLNLWE1vJwrS3HlMhyvWBx2juX8K/Z6GETslTAlQfcmzWfHRPS2YZgjz?=
 =?us-ascii?Q?gesx5uqaJ2cs27aS56+rlO0Y9aAYnqvc3bfZU2masaWnMA5Xc+KXHsvHIlh1?=
 =?us-ascii?Q?H8yQ5a31O9pVoSQmMvsMAFrjcV1Hv3frM1F67W/OCTmzk3GRFJZbx2AhUjuu?=
 =?us-ascii?Q?znoFFZKLBI1V+VB7g4Uzp9NwfIXW+enZR/YSgFIGOI8LeQokkdkZgK+7ESG2?=
 =?us-ascii?Q?z2qlcVKASJ69C7sUyhzMhtSaTWwXaouwDmulVFE9F/SFuAf+eq7D8Lzl3fpZ?=
 =?us-ascii?Q?zhOU07wbmi4yLgdMbq7wLi8fmaxyOGrvU9x4r5ydiLh0ZyQxE84+qu8E+Kdv?=
 =?us-ascii?Q?QCVLiCtanXfZ9deY5VVZqFPsUZpFSHmcU429kcVrWuS6qPZ8/+GK9zqiJQAJ?=
 =?us-ascii?Q?XaO34pOK7+pkFGkDHL6QuGz9YSJSbDHxi3nKYkE7ugQT41cCso0ipAbT9la1?=
 =?us-ascii?Q?RE9HznZVkuEbnjiUwZIoMbBZcB6j6R63F/oyJBBIERjc45oKx0hMuGD2ZtgJ?=
 =?us-ascii?Q?ka0h5KNZhQHlxA5jkmZMK6wfscFBGRJ8xchIcg6VaRZ1ZvEem9eO2dlcK92W?=
 =?us-ascii?Q?vNcJDYpavJ76CuG3m1t/IqzwjPWyU15S3dTFKCQR2FHCgoeFgnmKWCBkz83e?=
 =?us-ascii?Q?8aghU5jbtefp5XK/crO9RmALX6CUCVxGBb54AK7lteDQ12pEkcRH7QqatMJ3?=
 =?us-ascii?Q?krsyeY7QVRl4lzmYb1fe8OgkUABgZgFXisNYiGH4ICd3St9fM4U93EEh7DNI?=
 =?us-ascii?Q?g/s4Hm88cRhI9S+33o65+P9YVRXfgMCTHnn015Rqdf+EfZaPW9suF6VpE6Vb?=
 =?us-ascii?Q?IZSDkjxd0uZzq1fJnQkxHMqJHLWcR75kim/h/zZ6KaMYx2WEZRrJmQUlbtc/?=
 =?us-ascii?Q?GQ3DrmVEM8LBT/W1WKctAKjJfPMW5ujVm6UM39QwACyjUDXlUjrmRIOWnwTx?=
 =?us-ascii?Q?iJjNDaijA2BzDuLTAcVhHiB1IzpCc0kW2Acet6oWaMMSFQDHHK4mEK4w/d2u?=
 =?us-ascii?Q?luwslz/eefyqTQPLfRvBCQX3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843aed56-6748-418e-8ba0-08d900af0a07
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:10:03.9479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7/p8uCWB9Xdj3Pg7WYwTELnU2Ud2yc6gG/fDr6wZEnZAROQYVGTFdxepXPfzpvDvj8mjifCa6hL/tzv2DocnlTPH/y+v7LWO11gSyadElM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599
Received-SPF: pass client-ip=40.107.20.139;
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

Split out part, that we want to reuse for nbd_open().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 79 +++++++++++++++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 15b5921725..59971bfba8 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -361,11 +361,49 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
+static int nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp)
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
@@ -403,42 +441,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
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


