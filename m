Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136B3A291C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:15:43 +0200 (CEST)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHiw-0003Mf-Bv
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcS-00058w-L2; Thu, 10 Jun 2021 06:09:00 -0400
Received: from mail-vi1eur05on2090.outbound.protection.outlook.com
 ([40.107.21.90]:8008 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcP-0004uY-U1; Thu, 10 Jun 2021 06:09:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0/7zhH4uLmh2EL7vuzQuR7pbUDawejwXZZqEEzb38jIhLnDJvf9pveygZ5QHxNfjtFUvl5sz2n2I7kITcXuvrH8+N8TW678xfU8QkMn9SXsXCKksmNsm58cHVqwwUssb7G8mVdC/BWcN8yfBsWPob10dtwg5yYIVSjp1N0up3WJApvWDKvmOwHKUWA/6YwUyzdC7QV/spp1w1J8jp5D4SvYK4WgvBL9oiwJ0Blw5kn2I4dSbLU8xV/u+/VOPuZfX7tVrtR6ABbrBLCZeFdazFx08KRtIfb7nZollLFbyWTo/L9wsNFNO3tTuWzPbmd+4ur5THNtjb+JVleCdLEUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7alOul0VsEQFWlqhK0iPsyZB8XkKhH0BnmrCCACDh8=;
 b=BklHzNngbIdyniMSLx12zu1qxOPYiLxWxOoMLcl7sVakK8ygIbj+pQVm3CoYFj1l7WKejlktvfLgwezxEVrUM+qYbLi2lYooSOOMHeEr/jdCcH6TzMqFdQSl+UwAYqZpfKeHyFMYdHoIr+zSjInSFmd4qtNiY08y3tWPVDslF/XxR0s7igRABMlwQN/bd//UKB1cgGOYYwuakz/AHtBPacjCsXqZlJwdjRNDjtwesj0+fg2p8dlsjnRbLntfG+JsjZebP5Zb5ItWqhF2F7mSP4p8pLX0Y2U2JfcDguIEOyoWbvOPMK+pdGfmnpkaLWYk5xxTxyp7CsiV87HSlLMFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7alOul0VsEQFWlqhK0iPsyZB8XkKhH0BnmrCCACDh8=;
 b=kz8gDuD6PAn0Xb29Gel09vXCtsT9NDlsyQyOl89RjjxObcOV8XLPE6LJwJn/CVY7AsIztTVASCQpYb2mGD7YP4+F7SOcLlQEyGb2xjpsGuUkJQFXeLRslq8682bapLaj5bSE44TNyjWOf2g434v/aD67JsH1qYaUF9fSYpk6mM0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2035.eurprd08.prod.outlook.com (2603:10a6:203:4a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 10:08:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:08:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 Roman Kagan <rvkagan@yandex-team.ru>
Subject: [PATCH v4 03/32] block/nbd: fix how state is cleared on nbd_open()
 failure paths
Date: Thu, 10 Jun 2021 13:07:33 +0300
Message-Id: <20210610100802.5888-4-vsementsov@virtuozzo.com>
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
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:08:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfcf6364-071c-4fdf-8d54-08d92bf7bd8c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2035:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2035E62A89211129BC80B3A1C1359@AM5PR0801MB2035.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rg5qESzcszJ+shMX7tvm1p4jANf6i/DRtEBhdJP+KsILV5w9HkLceTBJe+EVcUfl1sNrG8t5CcoZ//VR86JBnbvsLX7e/O/WHLuGUp8xyswHpXwzQDuRUN81kaAtTdeAtuQjrl89XO3cxJBNjoCjm68evEZLJXVtRElvO1eSqqxtjxrVr0DznX5wIrr3VgVdJf4XQguCS3KSm2cmB4cp29M2A7uzDTBAd07QbnjBmO7lTZTi9BwPPew/UplNMhrKxhy1ww/OujgDFcvMC+7alhRRgiMLTpa/GHRCoFDnNqmxMSatIIotrdNffkyDCEZ/xER55jppF2g/upDmoc1U5Q6tCVkeTQD7lREISf03qtm9mX3k8U/iQhYuLOXJS1sxD7cCt4LcWoYYHKiYO9f0PtjcWUNSJPqWmYLqbUKzxDoUFqUzUK2JezlOOdlfTQ5tHC8noMOnVZLobleUn4amXEYTRa1K9U3cnJptj/qUCzShT1hcxfWjE/vMIGiPGakvQo9+EuIlWv9kPG8b8RbWtswxqqFVgljcgQ2gBCStRAGEZlu3MwmoZXsxOH46Rw9Hy4MduMj1bnmwEax8BSOb7aVFXp8SUARxrppsYKlwgfLZUrslvjO33vYXsefNMGJozobiYIC4sw3dgNx7zRB0DIWUtKr8Ekwgi2CQtC1Oo5qrDAe12QbHgYgJfPTWl24
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(26005)(5660300002)(86362001)(8936002)(6506007)(2616005)(38350700002)(1076003)(38100700002)(956004)(316002)(83380400001)(66476007)(8676002)(66556008)(36756003)(66946007)(4326008)(478600001)(6916009)(6666004)(2906002)(52116002)(16526019)(6512007)(6486002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?upTHDQ9V7ihQLn35VN7acqF3zCu+RBcP3zRgJm9iVNWZ7TPyMLW/8UJyr33h?=
 =?us-ascii?Q?aMFgIS2d9RhqQ9xTh2CP6rRVoXDrvIhdyVxH+R53sx0nNzvvSXHk+zuwMemy?=
 =?us-ascii?Q?FKkFfFhUqyQ+6QWGlA/Hmq5g0INXsuoyNIASoDQ3TgCGudGLP1r2ayeAJwYN?=
 =?us-ascii?Q?Co5tmu051FYUcPmx/W6OC5/7Op4Fc2Wfe9pjFAYoOvGfrde4lTB8hA/hVnzh?=
 =?us-ascii?Q?YYh6KMcXwfQMc0wlswG0KJG9boqgMmsm/EPFc1mB3Y/nV81bByFGmjPTC+ba?=
 =?us-ascii?Q?g2NAdDItN9jTJGVlj67wQruzgihGeZJcD5u/BFNjWqs08Bs3anmf1TDSCEyE?=
 =?us-ascii?Q?HA0gHlbEA0I1SwSTkadQzQNTJ3QaOm8MKyHOrhtvJOM0GXMZjE+kZN/u/oD9?=
 =?us-ascii?Q?Dae+lNxMkuoc3/QrQKVhv+quzsDLhfRdeuRe0xskIf9UxeroumGuKVBA1Mmh?=
 =?us-ascii?Q?U9fIG55RzZxRbE+r+FiGi1OGJRfco4npLT/0BVmDggtAzaGBFZoMJy4XO5Br?=
 =?us-ascii?Q?urJtdEqXNIlAFOhPXYCTsrLzWDbyEnUCCH0nTim3S9w7r5uNdS8Zb5BoOaY/?=
 =?us-ascii?Q?jZP7j3dx5GzD6Y6qGyxy+s7lzoG2lmnOvhQx2vSm0b9BjMVVeZKeQa4T6vOA?=
 =?us-ascii?Q?yCuOpUPfltLwQ/ZDPxIw4jvEmXt3k+1uIrP89q7I0TeTUWLJEcdOdTMpuCMx?=
 =?us-ascii?Q?R2j+no1ZxohAIZXgWDbKcFaiMJ+Lt4mpqLLhT5FEvcjkZYpAvbaUPGA+8KYc?=
 =?us-ascii?Q?jq/o5w83vJHixqVbCKPB2aFqYdkQi7GKufJ2E1u+mofDSby59pu9RULxiR6d?=
 =?us-ascii?Q?PIibl89DMt0iDz4miR39ZqNFDhwkrMuUem+0CVapnaZ+vj+MhkrIknRIyzSh?=
 =?us-ascii?Q?gE11ROKNk1mTmZsJmCOeyFN4ar7GfWP1ZsmxNiqzoaPb2oxfd9xYFdUENi1l?=
 =?us-ascii?Q?4DBYxLITj2yMQ3pkjeUGDwW7MgQJAinGWfJn2LfvKqJG2FOUUJjDsPi5kXG/?=
 =?us-ascii?Q?7pLFjS0mW7tuLdf63CqYmVtMujxVzM707xw02r+xGS9+ydPmKfiK3LP5vtTV?=
 =?us-ascii?Q?XRkCcw71fWpnlwdyx9mv1ug4gXkECkFfCNtRVrhBlYd7t3xppzANDo6h/CBW?=
 =?us-ascii?Q?qnX3EZ+sO8Pjhx2HjXU2xt5D/tNGcR4brwdNquunueEp/oochRHVGYv7kn4h?=
 =?us-ascii?Q?1CoIULrbBTyVIWS6767S/ItfDfR+LrgjLc961rtzR9qPqWqHlGVp2gMO+bOC?=
 =?us-ascii?Q?HLeeb8ypZL5viYUW4+XDm6Am530bdPfgcW+lB6+HyZstdNpuaXJ7EJYQ2694?=
 =?us-ascii?Q?9YKOfhkEGonYxWMsbkqjkbCj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcf6364-071c-4fdf-8d54-08d92bf7bd8c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:08:48.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCTaUkl0JPC53tZPPR2AmwSX1WOOW8SPT/gdAEt4tfqjKnf6gmJP19HeZpwSlQKsEM2nn6/KSkyxVuJ7fROAGSXNBxoW3A1vE1VMBUKB/Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2035
Received-SPF: pass client-ip=40.107.21.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We have two "return error" paths in nbd_open() after
nbd_process_options(). Actually we should call nbd_clear_bdrvstate()
on these paths. Interesting that nbd_process_options() calls
nbd_clear_bdrvstate() by itself.

Let's fix leaks and refactor things to be more obvious:

- intialize yank at top of nbd_open()
- move yank cleanup to nbd_clear_bdrvstate()
- refactor nbd_open() so that all failure paths except for
  yank-register goes through nbd_clear_bdrvstate()

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f4b3407587..01d2c2efad 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -152,8 +152,12 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);
 
-static void nbd_clear_bdrvstate(BDRVNBDState *s)
+static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
+
     object_unref(OBJECT(s->tlscreds));
     qapi_free_SocketAddress(s->saddr);
     s->saddr = NULL;
@@ -2275,9 +2279,6 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     ret = 0;
 
  error:
-    if (ret < 0) {
-        nbd_clear_bdrvstate(s);
-    }
     qemu_opts_del(opts);
     return ret;
 }
@@ -2288,11 +2289,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    ret = nbd_process_options(bs, options, errp);
-    if (ret < 0) {
-        return ret;
-    }
-
     s->bs = bs;
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);
@@ -2301,20 +2297,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         return -EEXIST;
     }
 
+    ret = nbd_process_options(bs, options, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
     if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        return -ECONNREFUSED;
+        ret = -ECONNREFUSED;
+        goto fail;
     }
 
     ret = nbd_client_handshake(bs, errp);
     if (ret < 0) {
-        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-        nbd_clear_bdrvstate(s);
-        return ret;
+        goto fail;
     }
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
@@ -2326,6 +2325,10 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
     return 0;
+
+fail:
+    nbd_clear_bdrvstate(bs);
+    return ret;
 }
 
 static int nbd_co_flush(BlockDriverState *bs)
@@ -2369,11 +2372,8 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 
 static void nbd_close(BlockDriverState *bs)
 {
-    BDRVNBDState *s = bs->opaque;
-
     nbd_client_close(bs);
-    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
-    nbd_clear_bdrvstate(s);
+    nbd_clear_bdrvstate(bs);
 }
 
 /*
-- 
2.29.2


