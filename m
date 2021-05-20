Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807A38B22E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:48:10 +0200 (CEST)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjy5-00012e-G1
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja1-0006ax-Jk; Thu, 20 May 2021 10:23:17 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZz-0005ik-Ni; Thu, 20 May 2021 10:23:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItoN0jSqZ8Jx6R8GhfWgzTCVeylrFozJ+uHxfAkDdp5dPu0AO2+SIDznlihgBmgz/8jN/U+8dVNAGRxUz6ro3iBsvv1Sug4gmTnak0UhtZuh69EmaAdeAcu1w4PCrt0uuYB0+tDpxswdFrYYctEq3GNuu4VQEYjp6YHcxeJVcJjlxBa0NVBvfSpttLTSgk/17kVt5m9bzRZK7AHOK4HnyTObdl4e8qBQhbKgJDVR4PmaPUFJqRV9ebNsxIL3olU9qr6nXZIqUksTnz96nl8CD1+N1NFBJmA5gp4Z2O7EN3IMc9n3xmr/JFsO37fCTmCwuPTaWu3bgIG+G9kgJp6VGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkFCv2BCsciZ8LesdEvJc/HZpXcfswqsyp0HOC6iXDE=;
 b=Hz0DYEUpuYGskdF6X9XZJaFV+9FJPE7n/KhpHain4Ca7grQnqi1Dtj3SC9a6Ug97zFdSWY5VwaABR0Yks+PvABixOZmsa95I4rCIeI6z0Iis6a/pbzZ4D+ym/UDEf4YLcnf6PxostLO7Gaje3xYfbx+IcICD5rH9nOvZH/boCYB4VB2Ao+ErzB4bmecdUBCdOwY7pHBT8vlOmx7l/5QG/kVqvYhIP9KtDGH1H2UYTIcndGCWvCzq5W5a7lkKKRUKNUjuteB1R80wmIqgmoSRBfCUbWeyy/MkjYbRaTi+wzsgBTloc7RDr/XGvRhnnovRQpPwM7/IseyTPS9EANlpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkFCv2BCsciZ8LesdEvJc/HZpXcfswqsyp0HOC6iXDE=;
 b=nhPiqRdTnxuQFzrYv+eToEkQJwTc9KnqtzsIjFBip9xLEBF/Q1eMD6d7dn8QYxcIeViB0+RHSLauGaUS9kXHKnzuIsebd62QjL5fRXT7u32K/GkAlSfGQj2UVePwLr0uD7dgDDLjF3SbzNcEnRZ6ZL9QcPu/qzyR9+88e2Oih9E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 21/33] block/copy-before-write: make public block driver
Date: Thu, 20 May 2021 17:21:53 +0300
Message-Id: <20210520142205.607501-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac277c4a-2237-4c32-43c4-08d91b9ac0e8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35443DBFE367E1571E6B901AC12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tQE0Tciyhwhk1qRWnShmF47YCMJfvUsY8YOUemz0g33O1gFABuTLzQZv73g9LP9H2EAJRImaBNdzDTsRI8RTM+cG++aaHVw5DIGVH843QBwA5Lq6RYL9wOMy4Uh1uOqJbwAnYI9x/BJ0d+0tgzwpuaZhppqzM5Zpcxrifja5X5pZoVAOynEUGQGqjAxa60OZYWd2k5vEMemTQ6QTJuNyZkHPkpSLv1aMSJ6pYEG5HIxk6aGeIU+HtZaQPklQlOEsLUBn09BBuAK44R7GUCkT9L0jI2tZ+O9NcXVNQ40q5MBFAV652Iu1z8O9cc6nwT86QGonyTZzChd62CatUMNGhndwSFF+ln3AaHStSAASE4nDdLEx1TuufY7bgsI3Om0PiO/kmsgP+TtGCNh2SmZq7+meDxYWYKzyNipMcSWx8/nqQ8BZ6DS8Xx93a6uI7b1d7WrZY3DzNvHnH8atfaX+HkYFf/FvQtHtAXZR5QAY9GaYoLUc25pz8ObefGNrMwtKyprz5dUQRlgWPDaG/zistiGQwyRPJX3IIcpx0des5rEi0NecxmLffsxr05gMJOxeWBarIwR6Nj+ilMACdG1VgwCuxTu/a7feW9J2Z6nPSPJfvFCtPpGhiJzbFvd/DyGCOJH7VnqdVbcM1pzgDKIGDBKsc8U9BvF6VLwjiHyLz9LLozJc2t5UigLLbETz7EB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xD2b8qvjH+cA5FZYyDHzQ2JXkIaq1ai5eVVbdSty2aPUQIGzwCTxheR6P7AJ?=
 =?us-ascii?Q?eZlmpM59g3iKH3Bxl5LiHBFjzGogciJaOwIgWTbAnSXVQ/l8bMG2BheEB+JP?=
 =?us-ascii?Q?dgBsHgRDX8fnk4au2mMn2vHLt6Pz28QJWW3HXem/lZlN8amiM23Yvj2irXcK?=
 =?us-ascii?Q?ndD6SkPAwxfltTVGJKg1b7CM3VGclDbBHdpzTIpWRlvr7QuS/oq962lWdnuQ?=
 =?us-ascii?Q?LRjtzJ8mYC+D8ykkgTpozQj/89mJCJmx300YxXxm+mbShsHKW+Cdyn3E2IfS?=
 =?us-ascii?Q?/4ot4cVEYS5F/awAHx9+PtWHr9GWAQuEK0kUaDwTBiazdUfBOXh1XgUsMIya?=
 =?us-ascii?Q?rrgl/4EINIE0ptczFin2ILRpUUupBplhvdmqwGKPN4sLXPLfp4d0NcLNSOZ9?=
 =?us-ascii?Q?3+sX4rMlp4MWaRIqFtIs2dX33kscc+zIct7aEY166glSqqEKlez/UydOsoC3?=
 =?us-ascii?Q?SvL5JIRn0rKa4s81ZBg+e3i9NMTxJyXv7OruL1O8PCET6GTzUpJ+5nEXXVx9?=
 =?us-ascii?Q?YvjEPbcLDg6KQzkjk1wrN8rUAX/dwwz+1nO7Pq2lvvvzgUCxkdApi03iodvC?=
 =?us-ascii?Q?O3iGHKODDztVaae2Nol4tRZ+gyAYHP5ST9SGxlOPzsscMbU0iqki1LeXzLWq?=
 =?us-ascii?Q?+K7KtVXqZpjvuU4+BGn2el88KpbWcN8zuevcVyHUL2J2mK+ewwl67PclaT49?=
 =?us-ascii?Q?po4q+NltGpsyQ9yzItetN+WOCQ/JRP3DI3rU6LRC4GWomP0f55Njh9jBSIfO?=
 =?us-ascii?Q?bzhqYZE5ro+Lbw1XqFRKduCpI32VseTcv2XyvWzCDgrwOPdP05lON797TRRZ?=
 =?us-ascii?Q?CLuMspqcAiP/GlNEd1h4rzWfVTT+7/n/WDdiVWbHwMDDcno/UbQOPOpJbIK6?=
 =?us-ascii?Q?A1+XRrz9D5tYhVLOu5nibeKAFoiSA54+ggx9WMnkzAel470lmVBfuWDOpAsj?=
 =?us-ascii?Q?e8d8imcOljDAkBjD75bAsGiHhtkXA9Yw/zsz0eWxLL75L22W7zxv4f83sLmj?=
 =?us-ascii?Q?biD0U5w0W4bmAZSTxZXFWwQv+2lVIu9W9ciPMGJNnBqNz1vHDzUyiMeV8q7r?=
 =?us-ascii?Q?+qElp06/AwLDd6xfcabtAlsvF52cOxHYFZ/gGXCT59v8eLVZt4PnqKtBbTyp?=
 =?us-ascii?Q?gHYQgfTPUnDiBq2DcsWCYXqB2grZAkqj5XAtvLa3lECE0kHVIPINvglZbPM/?=
 =?us-ascii?Q?WNAxv9fz0J9EmEN2/8PZE/Y8DMaIgMwRUoy1MNnsMkqyHbL0UttpDEAAyv/r?=
 =?us-ascii?Q?PKVwLV6Xz/Pxkk6BYX9HT5xkW4/m89TTEQWmAuJ9O5HpvkZb01TXI1+Xziei?=
 =?us-ascii?Q?AW9FIBmfpQxipbDxRWYt91C7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac277c4a-2237-4c32-43c4-08d91b9ac0e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:52.6380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGYSCe5WlMrwoj8ctocdK5KNBE5i5sbdxAx88iY/oUXZcJCqVV7zCimdYN3rxYKf6BZ6Tta7MlMTqYcPcfXdmo8o2Tfta1hnMJ3gc1wzkzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Finally, copy-before-write gets own .bdrv_open and .bdrv_close
handlers, block_init() call and becomes available through bdrv_open().

To achieve this:

 - cbw_init gets unused flags argument and becomes cbw_open
 - block_copy_state_free() call moved to new cbw_close()
 - in bdrv_cbw_append:
   - options are completed with driver and node-name, and we can simply
     use bdrv_insert_node() to do both open and drained replacing
 - in bdrv_cbw_drop:
   - cbw_close() is now responsible for freeing s->bcs, so don't do it
     here

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 60 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index ba2466a328..6ed5bce1f1 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,7 +144,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
+static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
+                    Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *copy_bitmap;
@@ -191,10 +192,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
     return 0;
 }
 
+static void cbw_close(BlockDriverState *bs)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    block_copy_state_free(s->bcs);
+    s->bcs = NULL;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
+    .bdrv_open                  = cbw_open,
+    .bdrv_close                 = cbw_close,
+
     .bdrv_co_preadv             = cbw_co_preadv,
     .bdrv_co_pwritev            = cbw_co_pwritev,
     .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
@@ -216,57 +228,41 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   Error **errp)
 {
     ERRP_GUARD();
-    int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
-                               BDRV_O_RDWR, errp);
-    if (!top) {
-        error_prepend(errp, "Cannot open driver: ");
-        return NULL;
-    }
-    state = top->opaque;
-
     opts = qdict_new();
+    qdict_put_str(opts, "driver", "copy-before-write");
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
     qdict_put_str(opts, "file", bdrv_get_node_name(source));
     qdict_put_str(opts, "target", bdrv_get_node_name(target));
     qdict_put_bool(opts, "x-deprecated-compress", compress);
 
-    ret = cbw_init(top, opts, errp);
-    qobject_unref(opts);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    bdrv_drained_begin(source);
-    ret = bdrv_replace_node(source, top, errp);
-    bdrv_drained_end(source);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
-        goto fail;
+    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);
+    if (!top) {
+        return NULL;
     }
 
+    state = top->opaque;
     *bcs = state->bcs;
 
     return top;
-
-fail:
-    block_copy_state_free(state->bcs);
-    bdrv_unref(top);
-    return NULL;
 }
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVCopyBeforeWriteState *s = bs->opaque;
-
     bdrv_drop_filter(bs, &error_abort);
-
-    block_copy_state_free(s->bcs);
-
     bdrv_unref(bs);
 }
+
+static void cbw_init(void)
+{
+    bdrv_register(&bdrv_cbw_filter);
+}
+
+block_init(cbw_init);
-- 
2.29.2


