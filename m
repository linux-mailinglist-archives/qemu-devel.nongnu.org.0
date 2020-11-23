Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A62C16A7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:40:56 +0100 (CET)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIdr-0003yU-BC
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDM-0004YB-GS; Mon, 23 Nov 2020 15:13:36 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:43328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDA-0007SQ-6q; Mon, 23 Nov 2020 15:13:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsMWyOTza8B2VxvHOrvGb6n4VpSgJNz0/6Q6RVbvdHCzLbUTU96KEfs+/phzLszXQtFtqUYqzXdRl5zwdcXseeWoAcSvwVvTTmpzEYuZ+jwGs7yLVkq8R4l9vqWNzh7tXNahSc5zbPxkepRaEbcAMidBtnZEPfZNj3HNlZ07X4jmnhzFkpCaW01iPlNpM5yo6i/o+ZxlpVSv+0bfh/vRG0L7kjw76WTQkZYQ58N+6wxxkQJLtDhoQlAHWkhZ+vgVFbgNGr+/VGL4tltpCYUsvEE9PVK+UaBZW4fkq3O4cilLAfaNrJikv0jwtT7GGnm7/+SUZCYCCO81mkNGOxlUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJfNW9YBp2eq73ntIIjer5Cvba3H/QdCROClbwd0D48=;
 b=Onu9Zfwgzqmwf0GxRZLLeeOW8oxHkaMxW7p35AWcHOZs/7ZNPfej97aXEBINTRYdRQJxYlA+V0cQRufSs1ySqey4hTXU1IkBDybr3sW36khsyw6NgZghXgTJWTulMdrxdfIy6TQHiHuRJcWALhw16r9CrxZRByipX5ZY4D0AWp4xy4771q/McdvFC6DXJEk2S4qdeouQqq9NSVIz+lD2PRWWZGuvd2uKFJ1km/l+4seOCyRR+3L84OTpS9Q5hpE9HAernhpTZyVnXz4VO9x1uHXV1c86MyzZQmVg5pzp1KYVwD/Izan/d6xo1GIm7hcRJMjXusqoLxl0CyouQZ9nCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJfNW9YBp2eq73ntIIjer5Cvba3H/QdCROClbwd0D48=;
 b=mmHW7R+3T/oAwtVyBVMQUD/asas7kx9ggyV+GwrOnPgiuo+p3d3x7rFPPBjk3UAu2MhLkAFzPEvGFwfA6Ezhl5izhAgNhGznN3r82x4T9hnLB/Wxw3Xc9S1kZ4kc44rPQFoaygoJPhwHpD19ESyGCAmt7z88aug6TP8VXY0rmbA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 19/21] block: add bdrv_remove_backing transaction action
Date: Mon, 23 Nov 2020 23:12:31 +0300
Message-Id: <20201123201233.9534-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f1ba53-9be4-4f40-544b-08d88fec3169
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46908F3895C09E9E8ED92E6BC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/lHvB5U0Wqc4zIM+7S00HWcPA0xeNG8j7UAXpJiW4NWC7G9wuffajc/GP/LyJhOywM6F1kl7jj9PVjgP+jG/wXSvax/TDoXQAoJHf7wAEJcjjR21H7yNEWV/9GGKBU6HxcgFycKgGQkLURqJAE4YRlC9qV3vG2XO7ckpLVmiqZmg0PSr22qjy8nwkYVegSvuMGl0gGjFSlN/VmyOvMcPHqYYVCO4GJYDO3DmE4J9VJACrcsUxcS0I4gKpEIOSJxx8vPSZbKX8u9jShbYQnDKxmyuoP/ZieLPW0IQpRdb41uUG68WpvkVVjkwRGpH6+fNqQI2mfHDm5U/sGAh2iSqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 6pPxFpQ8uug/iA8vfK6gMer+VlrBJWEU+p8FX1QmQVQvO26DPsM6Eyo2qBpYC0KMKtolDv62LInUU1vlCn0HtpRamX6cwYjcTyfRIckQ3jzZ+q8gLmLWTZDqL/kMsgY99M3+NCMLjzOQsASPTChBYX9EdSzB1Uf5cEXZY2E066Y8BKYOxfB1i1JpXxQiEsNXv8xXQuLcNORFUl33Cr2DAbMlkxVGIgVb8I406Zg2ys1lyj6mf4JQTbRMS9WkS/QTZD243eBwC/zfUDCNHoYIsbJ8m7fcACrs5dFPJkAjG3jTqqf/w0DolKub7KUIeArbocjAGfwsBTwanZv3k0qJ0e/gSM51VnHp760sQrk9D+WXbkqE+j2vH3CX2QYwW9f0oTD4q3tkQXK0BOXVwneW7m9eztkfkLXwaHivZFXZCnZVMIEtQ4O3UU1beZ9FZFB6w7Iomzxe31U9EsppLOPxpLjIVLnB+hosyopxcj7qHUzL1r7fE//zNQBSpSHaC52LQKOkC4RyZpGpU06xpL8TneMJcO25dRJACnp4ZX6AY9xXdwg4gP1W7R+bj1Kh6cZvReMv7GBjN2vmdG1Vmrbvv/HZdQ+iK4xeB2K2rtHu6koXz9D+E+pWFvY+iref7Ww+VVzsdh57y2/f4fMfru+VfOaa3iu7ADa/IkOcFX7oz6gkVU3vsC+ylIPBYzyVD0pYDGOPUz718/JdNyc3PhmD3v2F6bEvY4Ji7E6HpBq9MC/kjivnSWM+fa6bKi1C+7Pati+dObdOo5wCmKpfvxVTUoqnwlR3nc5LhqkaNT3LXOxL48kJd5j5n6mhaWXMYcBvKW+mGvVNNE53Wvc/FAwGBg3ZmAL5wGp7/bMiUK1WUdt5suQOqtXp1G+sJ1ma/N+OlDpn/HOGLmC32RMOsErWcg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f1ba53-9be4-4f40-544b-08d88fec3169
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:08.0798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R38QfC+U1LGanvzCey/qPMmuERly7w6Dkozwp4MI0eqeVzX5aBKgfQ6dnhUzmUr5vE6kk652F1q/wG+qhASDCnEqJj1QhTNeLr84/lyaeDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index cf7b859a81..6ea926e2c1 100644
--- a/block.c
+++ b/block.c
@@ -2974,12 +2974,19 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
+static void bdrv_child_free(void *opaque)
+{
+    BdrvChild *c = opaque;
+
+    g_free(c->name);
+    g_free(c);
+}
+
 static void bdrv_remove_empty_child(BdrvChild *child)
 {
     assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-    g_free(child->name);
-    g_free(child);
+    bdrv_child_free(child);
 }
 
 typedef struct BdrvAttachChildNopermState {
@@ -4852,6 +4859,37 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
+/* this doesn't restore original child bs, only the child itself */
+static void bdrv_remove_backing_abort(void *opaque)
+{
+    BdrvChild *c = opaque;
+    BlockDriverState *parent_bs = c->opaque;
+
+    QLIST_INSERT_HEAD(&parent_bs->children, c, next);
+    parent_bs->backing = c;
+}
+
+static BdrvActionDrv bdrv_remove_backing_drv = {
+    .abort = bdrv_remove_backing_abort,
+    .commit = bdrv_child_free,
+};
+
+__attribute__((unused))
+static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
+{
+    if (!bs->backing) {
+        return;
+    }
+
+    if (bs->backing->bs) {
+        bdrv_replace_child_safe(bs->backing, NULL, tran);
+    }
+
+    tran_prepend(tran, &bdrv_remove_backing_drv, bs->backing);
+    QLIST_SAFE_REMOVE(bs->backing, next);
+    bs->backing = NULL;
+}
+
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
                                     bool auto_skip, GSList **tran, Error **errp)
-- 
2.21.3


