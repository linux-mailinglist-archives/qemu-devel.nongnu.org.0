Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3CE361B2D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:12:17 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJaK-00030C-NL
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXk-0000vx-6i; Fri, 16 Apr 2021 04:09:36 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:41299 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXi-0007qY-Fz; Fri, 16 Apr 2021 04:09:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7SvFsxN5gsz4dBwvEXVHK4jRpghOJ4ubC4jgVSRTULSvj0u2xH5TIesJ0B68BJXvQ/S0Q2Gt0/24pMwjpbvpCfmmo9sUO4FpxBQEy2kOySC4JXhahQLIZ64cZjz3eueKnJAtgVfKE826s6Lcg790qlC6n2HRIgjxhzO2DC1edXNSdwuGpEAsrnb4Csg+d60PwPZPOX08TlF0XnqEDX1rYSEmrsl/lC4MPZ5Uiamerps70nT6dgXI19zLFaLEvc+k2HlyfmI8e1IPQYaaKQYtWX9nGxYIqIVPLZ7PWaE24SOQ9m7Cw0DriVP/19vlapDBhtfs/BDgtZW51LSm3KUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flumK7XkgH6DsGtYEBs5mD3VZdy3SbZPm/chEAOy1HQ=;
 b=M+a9Hh1nywaKPsTNyKqMUJoNAj6igMT6LjXPqgYioSwxsrYoQ+Toory4iv8GK4nGIwPAfwSCYHmPIL/SmUoY8QG5rXUgeA94gCWJtDqc8FZqPap/Ln3FgKFTX6doat/QBbKZ7cQwxUFXBU2yfdUhP7scQdpD0tJuwq111F3RKHo2DLL9H92G2AOY6DyD9OuTk6IWX2XzL3uTznu4DF1FhwYh1bCC8dSWWHN4WK0NW75lJSBNMo6/Y8YuYvSxpPbEUviSBlG1f/tpPJPxRS8Stm9r36NPQ8VZIVGtFNHkYZDjSscsPckHY47gZaZ7tGvP0PgybYOPsxReh/6CSz+cIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flumK7XkgH6DsGtYEBs5mD3VZdy3SbZPm/chEAOy1HQ=;
 b=i68HDUlvGWns52j7ByVzcvVKs5Onv8r/1qjNWE7yANj5j6RBuLNXBHYMzObENu5CDpKSoyMR8CJpcv2qRc0I/jai7GHv1t7574O4cGyYYsfTK0zGfVRfI0LKSzKHsVcXIxEA9id2igQQwjKQHPqU9Zlwt+xgnmufmIfb9oBnTP0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 02/33] block/nbd: fix how state is cleared on nbd_open()
 failure paths
Date: Fri, 16 Apr 2021 11:08:40 +0300
Message-Id: <20210416080911.83197-3-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efbdd91d-452b-41d2-981b-08d900aef525
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50786204C83CCF592083DB2BC14C9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwMNyLzgsWJLBjGA8O/omyIbknspqGyoxyCgHec2ahvv7Bh5JCNtt/0728/7dNu3zWlsWUfK5dXQkUgTRFTcxCbWNaqnDqeU+zibAE4eOre2a2g9vmM165dVNubWZ9nozdipY7gW5ZknvhCbu2jXfN5NE8sbVlHLQh4uW3dgep7UE87EyuE54qDkp8CS5xpqXsAs18z2B9Y2eymQ5uO39WHDJwDAWsHmbPv4OAKA4is4kPMGy4/ish6Y5F8X4Juyk2WoGHgRMHwz+RxErpWbt+tdQ40iRSZ6VNGRGOs6JUcncuNAW+Wwq+12rGzLE5bDh3uU8S3MXN71Ox6wsWiWtjRFbPvBA6bmjos3FIEsaz/fBCY6QETWlHxqu7/GswWmcg7fGC7Eyc8OeHf44qc3HoedIYS2H7t4gAFJip0Kxny32cr3gIuV41EprL9EPWehHS3AKAD06+hvfS8jQKBLYz25c5CIic6TDTLb8qx3TvZaUuTj7Iwr1BpFU43jim0OQUt/UpeJDvPLsbIXbhCWa+CCILOGMO0KKxf7jlNMZcTQzwlFNslyQ2OOkUz+VSDYWnWrrqQvF7fADigZZ7pT5rqoeGytqh/hTlZHZc34Q2dYAadaEOl5OVpTV4DGDnY6EvpOZK3cDAGAdUdjmhYmaKLb/eHgi7OSwohy1zIdOQcx2upj2Yb2TssH7iEwgkhn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(2616005)(66476007)(66946007)(66556008)(26005)(16526019)(6916009)(2906002)(6666004)(5660300002)(69590400012)(107886003)(186003)(4326008)(6506007)(316002)(478600001)(8676002)(8936002)(38350700002)(1076003)(6486002)(83380400001)(956004)(52116002)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ciBOlM0rxXIRwAJy0IG44jq2Dr6I78NBkhPD9FY7XKFCzZDWrEZzHZOTEYs/?=
 =?us-ascii?Q?XS4EHhzcSmlj8VlbZ5YpO4JnSUZkp33nhvN1D6EDNL+gHABlm6IB11oDKDmY?=
 =?us-ascii?Q?7y4Gc1Lipad4R5x4YqpV554dqy1Rb71uWxbl0wT4gJS6E1COeIBBgjxiYexL?=
 =?us-ascii?Q?8A+RyejEOdGDwQ2JBdzZop2erEbSRLAvs46pJU3RenjIgz91wjDMxSXrg3fK?=
 =?us-ascii?Q?oA5LxZ670ODOpyv7ndsJ2u92EOOWxyB+k+Y34UpF5FwOeR32r8Ivi6VPwvt0?=
 =?us-ascii?Q?I5Xw65b7LhrTqs+sj/ggVVb9KiFvYQbppogM0BN8vcy5Y2Y8TNd2F1VNYK0e?=
 =?us-ascii?Q?amZDeZbqaxL2dyS69I6mhVS0g1qaa6lFP6genCCIFThxxqWXMi1iU73C1JSr?=
 =?us-ascii?Q?hlMMuc2PN7wGDxE6Ej1kXhDNRLNs7wuq4QsI76hewO5gCi7MF7/kxL+kOyH9?=
 =?us-ascii?Q?6OUoo5mGFcekSYxpmauTh42zSybdJXCaQUmJ+s+G7ajy6m87MEBzBlpOZaoa?=
 =?us-ascii?Q?Wu5NhlDu1aFxn4D/sbDgDd9ZAamSaMvpLujjnEVj6YDWQez99bSPhSL5xCHh?=
 =?us-ascii?Q?LLSJNhuX/bjT8KwBrgNzdLeIKxnQllqPro6rsS/01kWorgcjEEjWKTSyu1h4?=
 =?us-ascii?Q?aw4D0sSB/kzf511r62h1fJ7kF9rD+BKFgiJW45hyJanHgTWwLqPtNG6/Se7I?=
 =?us-ascii?Q?UFkUEyfNCWkU+GJTBDHZ2aHKqz9jJ5bkdmM6O/eH+SHTuA+cu/dDFy5vCwsz?=
 =?us-ascii?Q?4Nk+ccTQ3rVbwpQCgKxco6t5n+9Bytyi2uYUbpcbVq2bKBYqhY7rd9HncjP8?=
 =?us-ascii?Q?0V/cCvfhiDAUggsMtA1fsKejMHBDm6tqes5582nRoOWzNZGMVzuyxlso/CZD?=
 =?us-ascii?Q?re6bJBaSKT3cZv+4+3CTpvRnkFgAkplyHYn7W04tK8bxlzmczOUP6YOiOp37?=
 =?us-ascii?Q?JUBGbjQ4MMKjRTflJkhkaWktFISD/gmZcg4XY+yLLCIEzmNWIg/14PZfufNV?=
 =?us-ascii?Q?kV9pMh2TkeKtk/b1TBCk56vq4fcExvGHP3xxSYDH2tCVMlEFuhEDEUHB3vgH?=
 =?us-ascii?Q?I7Bh7uWEHQyNVTBvq51dL6wmu1I+WHB4yUeDG5nQmT+cmNSRck/yk21u6qkC?=
 =?us-ascii?Q?zKOH6oXIXU4b7LF6e1ZsDMnUVofG6weozIB11IZhZ1a7x3feAa3yigO+qBjs?=
 =?us-ascii?Q?hysr27xr8tdpbLx5SOkXcfw1NqvgINSy6I/1ipd7lUhefgl6OF/lndQUGIS0?=
 =?us-ascii?Q?GmAuVFNwgv+1XDD/0z82f+r6Dtm0qNy+xOOINjAfghriiTmzdaZI2RIMorjg?=
 =?us-ascii?Q?Aw2aJxydndpzK8zdrFZ/7+Zj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbdd91d-452b-41d2-981b-08d900aef525
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:28.8519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJhwo3r6vkD9RwVj96X/EgpaqSzhGVQazR04QzZ1tE20jgqv4VagSVVxLg9MNralntnLbkm9NSD9H0NXBOyXlvajv4N5KbUinOVpKAi7FUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 block/nbd.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 739ae2941f..a407a3814b 100644
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
@@ -2279,9 +2283,6 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
     ret = 0;
 
  error:
-    if (ret < 0) {
-        nbd_clear_bdrvstate(s);
-    }
     qemu_opts_del(opts);
     return ret;
 }
@@ -2292,11 +2293,6 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
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
@@ -2305,20 +2301,23 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
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
@@ -2330,6 +2329,10 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     aio_co_schedule(bdrv_get_aio_context(bs), s->connection_co);
 
     return 0;
+
+fail:
+    nbd_clear_bdrvstate(bs);
+    return ret;
 }
 
 static int nbd_co_flush(BlockDriverState *bs)
@@ -2373,11 +2376,8 @@ static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 
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


