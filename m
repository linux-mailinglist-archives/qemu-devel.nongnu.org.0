Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4603A2969
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:34:51 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI1S-0000qA-21
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcq-0005yo-Q7; Thu, 10 Jun 2021 06:09:24 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:62941 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcn-00058S-D8; Thu, 10 Jun 2021 06:09:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Snu0Y2qZNIAIXvn5BclRNcbbuxxKZonoAbLlXu8N9ayhpz/ljYOCXdTwvoTTG94/wMXreaPOJIOftxu7sNXqBU870tiUa2NMdB63bfXgYQBen+LBmTgeeWl1HBPGj2LVN5RpvLlkpBowmylQ5ksQwFYoJsDLJyTrDwjNflXpypgxpeD9mmsGcKqeBij28ZyKvagVdZC54XxTvUD9XLp7aXYSWtO7uxAiEgUuE/EEFLWwYrmKaFuzy+gunsgW8sW5mX+qbJHwuu1I7uMG+8gkBAtzNy4zfBVgBJIJNi1wWKZUVBWHnRhUXK79RObbXc0t5bCuAcz2294a6mR0+hL57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz6SRuCgfgNVB/05skU5ckNzthy314XN27DPCVtzVZg=;
 b=MjaSbn+XGMxIzIRaR/4OecXLifJMobNqtdCmvj9FjRvrEQGGGMiTxCcw6WrRTXBKYYCX7RtMdvB9zhpF9DfypYQZQ8D7n4hFs9djjA35PWVzKbnnIOoI4/rt+LWUg8SsnWuIB29PQyN5d6EOP96AR5alS0dZI9XEmyZwS0oUBUNa39cBcDxmdp84Uav8WB8DRuQ1Z4njTQFcCKQCIb1IE2tR02cYVJmydArnWPZdZGV3zerVq4xSrS51A4kwmteYuj+JIEO0qPdlJgWefPlPj/TC7CRDodNFpp9rV3dQebSEuHdSsUb+BZcJsVZ8tIu3oXG+ce+aBAlODLGDJ4IdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz6SRuCgfgNVB/05skU5ckNzthy314XN27DPCVtzVZg=;
 b=t5HbCimYrGJOpuYmiYtMxzMoTdRQsqfZj/ylScXsbB91/vIRw2XcU4LQeB8mkE82hNKl2adbCp1F7fm5QmjUUf1iO3XrFZxp+EfYHYQPZP/+qpxVg4QmdJmw7ctsVbLFUAd5gFgBBwoe3o4EjKDOuLpe381aP806PACH8thjutg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 22/32] block/nbd: split nbd_handle_updated_info out of
 nbd_client_handshake()
Date: Thu, 10 Jun 2021 13:07:52 +0300
Message-Id: <20210610100802.5888-23-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5f83693-5260-479f-25b3-08d92bf7cab1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB679073DE61EEF4177DC863C1C1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2JiDIsQRNESND225JVQ1mEznFNj7HimBJveL0G+z96neAersgQsi7ZyDP9wzSOzoDjB1iTWw6QWr+aaR39ZJW6j7+Mdp+VUK8ZGOA/ct607T+4j1h/Ti1klSB17z0vo63VlScYWYwF9B2ySp03VmeEyTsdXAq+Vtryeu3muVBKy46wc7W92PdRa+QowyY9EGoXi/YnCz2nimJXcZyjwHV2uAw/oBEO+W5SKLV9y+YdOB9Iy0u/2wdS6BD5fZwmDLwysOh2Hj5eGtYeoqoHsrLASbHS9um/1uAzs7RlHAO/9iAEOhSS3+9yMd03NmHP+1t3chekKIL/w3F/ruNYwrJM4NfSyWkQZGQXjtow526PGsQnf7IdJed8wvazDXHBD+QgALLPEGYduM8/h0DC7wuK5Vko0ieGs4aqQqnEzw12uSNi8BYzDILh5oGJfisvY6RDK72Yncd59vbOnSx5OsGAxxK8iaLzqrnwt5dWaFxFwBH2sZv5KWZHa+BQQINQK2XHwPi52hDCB5W40Azek3t4PivMdMDMgIDxs6QBj565AHJNhtVRtaw4RPlncBnKTZM4+SJRu2R7H1iW/a4w6lxQLhsxnU65eOSIPOrNlvD12BDIFgGhgp4mxIbENifQb8e+4vx687NirvLxP46B9TinHUeooj0bcHMtZ4bVArKd+Xl7CXNU5rti9rRNyOzg8I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P1DAdWGP3+RM1ykBZopXk4Gj2XPt8zuYiPl2EoWQ6+iYKYJbLmLtTVR7qbbS?=
 =?us-ascii?Q?XNGxTMYDIpuZ9Nvp/UNPVs5iHKbS7T8Q97b1dyV4VK+YJGKB9b9c2MZ8PHWW?=
 =?us-ascii?Q?z2XJJ5HjnSq4+eQg+TKhUr1RhFyVOcoL1FcBV0g+1CDCbh0uwoeba1B0Quj0?=
 =?us-ascii?Q?7csaTyS7xqJ8h7LGc+oT+fCZuRSxgvKsJvH7wg1PqRaInVgxxoYaUw9f1BkO?=
 =?us-ascii?Q?d8oLgvjCt+zIdbR19sKD54CY73qa7NjXHeV2ePb8wuG7WgGOHz4agpMvfRhS?=
 =?us-ascii?Q?sq7rf33vHbKaTHpXwZeN8eSuXv9YKeS4CFfp/qGFPjLnBKoPIoo78QmB+0a3?=
 =?us-ascii?Q?C42B1VV8k2tMwfq8F+q4Xw4Bx162JBAd4PIedlG1jiA1/WpTXezeQ2melie4?=
 =?us-ascii?Q?dTz7wKwKZZhp0AMAY4iRQI2VnFrJfdHzeQGDCWpbUQWlCiv2TVwdNHJZmOxT?=
 =?us-ascii?Q?dewkxFUGVY1wwAHfSSoUSH4h166j2/DrqYjf93dbupQzyB2eAF1gWD1ZfBwu?=
 =?us-ascii?Q?MkRqsCkTdRH+uA3PRMaSdjfBDbSnySeIzSxfu1qto6jssUN15w6RJ7ZTIarM?=
 =?us-ascii?Q?jpOpbbk6cNKqLP2DwL0yuDAPOxVJ0NNK6sULTooveFOAl1HfHFHWqHyl+GOg?=
 =?us-ascii?Q?H9w2Tn7Ij494uVE7qmr9geWIKpD2vQA/B0QVEhlzALSpB09CHTqCYIQjDF61?=
 =?us-ascii?Q?51K+f0LxHP8cdtavrI7i995Ag4UtX4tilBfkD/tQaBBoJINffEuAjEndb6HC?=
 =?us-ascii?Q?J5Cv3I0VmQxIoEqOkLwuVNxapXQ7ZXHlp6lKP1v2vrWgZJPbFcjcJrNfU4va?=
 =?us-ascii?Q?gAZhWKz77Yk0XvCH4SQ42e9fpQHABlLWIY2j1/FyGLMK/BZlLW68n9+9GqCh?=
 =?us-ascii?Q?wm9gWgdX6teoQzJfzSCGQPNi6HLb6cqt/FcmPrlnlhlZzbhpOEGXBroSRx7m?=
 =?us-ascii?Q?WhZyJuNNfOvA8UkaOQNU1piSZHa5ojFbFAbwmfqMld9Qxd/XpCXQMnbdx8PR?=
 =?us-ascii?Q?YdGLQ9vJ5jZE/SXl9MbfxZX+QlYltA9zU7aW0YXEEtgyRqD7uyEHOZ5cDhAx?=
 =?us-ascii?Q?xrbaNkOSRehsGGjSDff7wKyL81h9zKLygh1+qtsORPysl5mTWXikQuxkszn5?=
 =?us-ascii?Q?ql492RIF8e3MdblVysj1MB0mfgoelJM0u2jKA2tb5g/YVLZ0YbZ7JJ+H78Mi?=
 =?us-ascii?Q?CqC6lbkKzLfomuM1yaTtFvAirin6UlsdWa+fs0EfjPH5Kn/dU3jcg7D1U7hj?=
 =?us-ascii?Q?kHX4UV4ygBip+NjM6XKz8M51Yk1h4r5Cv4uRphbz1ZkDerh938Xl41pRzYW8?=
 =?us-ascii?Q?ZGKig4EEMK/vz7jD++JNKw0M?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f83693-5260-479f-25b3-08d92bf7cab1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:10.8563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3+ODel3CupivSl4Fvql5I0D/or+8wBaMzBqGJhrurq0AjlDtbg+x/lQ90oc1arWv/Lixd24nLgRk8Dh3xMfgXiLzzqeqsmKiBY6SnOyBJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

To be reused in the following patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 100 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index df9d241313..240c6e1b3d 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -314,6 +314,51 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
 }
 
+/*
+ * Update @bs with information learned during a completed negotiation process.
+ * Return failure if the server's advertised options are incompatible with the
+ * client's needs.
+ */
+static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+    int ret;
+
+    if (s->x_dirty_bitmap) {
+        if (!s->info.base_allocation) {
+            error_setg(errp, "requested x-dirty-bitmap %s not found",
+                       s->x_dirty_bitmap);
+            return -EINVAL;
+        }
+        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
+            s->alloc_depth = true;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_READ_ONLY) {
+        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_FUA) {
+        bs->supported_write_flags = BDRV_REQ_FUA;
+        bs->supported_zero_flags |= BDRV_REQ_FUA;
+    }
+
+    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
+        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
+        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
+            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
+        }
+    }
+
+    trace_nbd_client_handshake_success(s->export);
+
+    return 0;
+}
+
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
@@ -1575,49 +1620,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
         s->sioc = NULL;
         return ret;
     }
-    if (s->x_dirty_bitmap) {
-        if (!s->info.base_allocation) {
-            error_setg(errp, "requested x-dirty-bitmap %s not found",
-                       s->x_dirty_bitmap);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (strcmp(s->x_dirty_bitmap, "qemu:allocation-depth") == 0) {
-            s->alloc_depth = true;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_READ_ONLY) {
-        ret = bdrv_apply_auto_read_only(bs, "NBD export is read-only", errp);
-        if (ret < 0) {
-            goto fail;
-        }
-    }
-    if (s->info.flags & NBD_FLAG_SEND_FUA) {
-        bs->supported_write_flags = BDRV_REQ_FUA;
-        bs->supported_zero_flags |= BDRV_REQ_FUA;
-    }
-    if (s->info.flags & NBD_FLAG_SEND_WRITE_ZEROES) {
-        bs->supported_zero_flags |= BDRV_REQ_MAY_UNMAP;
-        if (s->info.flags & NBD_FLAG_SEND_FAST_ZERO) {
-            bs->supported_zero_flags |= BDRV_REQ_NO_FALLBACK;
-        }
-    }
 
-    if (!s->ioc) {
-        s->ioc = QIO_CHANNEL(s->sioc);
-        object_ref(OBJECT(s->ioc));
-    }
-
-    trace_nbd_client_handshake_success(s->export);
-
-    return 0;
-
- fail:
-    /*
-     * We have connected, but must fail for other reasons.
-     * Send NBD_CMD_DISC as a courtesy to the server.
-     */
-    {
+    ret = nbd_handle_updated_info(bs, errp);
+    if (ret < 0) {
+        /*
+         * We have connected, but must fail for other reasons.
+         * Send NBD_CMD_DISC as a courtesy to the server.
+         */
         NBDRequest request = { .type = NBD_CMD_DISC };
 
         nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);
@@ -1631,6 +1640,13 @@ static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
 
         return ret;
     }
+
+    if (!s->ioc) {
+        s->ioc = QIO_CHANNEL(s->sioc);
+        object_ref(OBJECT(s->ioc));
+    }
+
+    return 0;
 }
 
 /*
-- 
2.29.2


