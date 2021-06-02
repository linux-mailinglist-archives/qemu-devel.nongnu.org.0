Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97774398A6F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:28:48 +0200 (CEST)
Received: from localhost ([::1]:40104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQvP-0004Mx-MP
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfW-0001Qi-4Z; Wed, 02 Jun 2021 09:12:22 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfT-0003Gh-Vs; Wed, 02 Jun 2021 09:12:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkYSrBEjPRHctw1Nt1MXSutCYN4j5VuCIT6GgbKEDghT2qgDgv5YxRjH92BN31L/wa/SzvAQ0H+FwZt2EOD9xh8w+idvUxXDRiWOXt16lNXCxR777J7WYNJ8cT7UhIJbiKgSXeaRafTVJYRpFBu+hTStUGCa7iRDQ64SMKYjRvGdRuEEd0CXKpOZOJ1qMMbqeb5evwsaO1AJb1z6J947T/mfc/yV8c2jBvEOiqQhVitv+z4KWw+THc4+0dhxz3h+D9Ycel60mxmhnCNXihdyawnB6Sazvhc4tOacLfjqGMTgUwMTO3La3YDZ3f+JBNb4k/ItuuCOxGgplFrU2HiblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=etRFGLGa+9W+X+9RQ9R4p95MI1QFNS9VGn2X0YjhFSugHAu4Su3LMTQLIIFa6s+dY3+zwM+SvPsbNOOG/U+t5qqQrr03osstLRcTioXY4d5itHC6EIeOkNc7fR1zaP0gFUlv4X4q71ey41pWHFMlSdK3Gn5y4Eujp+vtEAIYFO2PV3HN1LuaeOFHx/g6faTuYLHrk+cllNkfcYRdB6xBeeZZ/2OSHnq6KlaMmTSPLYRWIIUs3RVQG+5Yye8PjBMgFT/uoF0RlT6VM+obeu1AkBZfwa02xYA+aSPbGMuxFHJjC711SuS9L1RbYdBmt2qzse9uPoEyoJHUky9t4r2gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=cf8mH9FSJyStIPpxtt1WlL1ykiH9vkV7tFnQt7HRhGy463O6GMSiTam1WYrRRHX85AqsFQWOKLyAjNnnqgwEPOHs/Av2EzbAO+bVKYDwJnjXDxVd5lIhl8IaWIXevVTLVO9KKewZeDMk6jtw4OTmaEOTvWvtj/lPn+Hv9sg8nVA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 23/35] block/copy-before-write: make public block driver
Date: Wed,  2 Jun 2021 16:10:56 +0300
Message-Id: <20210602131108.74979-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aedbe3f8-8ba2-46c0-921b-08d925c80071
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693DB26102AEB3D0306B4A3C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Muk1xYINfzBR4QGjUxBq19CjhMjvjbG15wE7P99IWDh4Dd7fvb4KJs90claK9fiyAWGBxeMpg/j4Z1a3nm2smZjuYFDpQyjiqUXn+svI1UpTacBt3spYzvVh/8Nq6L/O3DdqbFUrxOSJpyartad8zWQc061T1u9s5TrXddq13NkvTRnTMCaxEIIJ+lBbK6IbfjiP4mSWnG3zog4YI8mJNWWwe87MFiROYQILuhWTaj0C+h8hxa0cIFYe4KGp3zyTChGWKkyBvVbEa7enkvexOiHIMt8uAi9KWsfsGTc/uQjLwYGUBKWwUZXQ3Td6fds7G2cR9yfpPrcJy9EoUw+szNKf+UWzt9UR42fKx0pxqJWEUmaJ4+4EUvl4KB8TjifWnVyU9g2PUzm3PvSlpGibdyXEGaoNgMhNmpNDJhbRATjSkyCXy+NM/auC8kgnvG7kAVXvdr97PFBl4naA5MEzRMO5GdYP7iWZ/qZ4hnOtS9r82CyDH7/rz84HXe1WWZc4BKkkZgcup+GVlvfLC7uIuX2wexkU6StnEpI28MqSOgQfj6K/41vKc8F0DTSnNAAslaw7asrOhKx74evE8gmTGrSK52r0PltlKCj5zK5P5JVgMEGgdtYw+74hzeXx9gEFarpe1UBfvDAXPD9X3xwBbaTpTrt10pMg7MmWizKtkFlC3JoGo1LEr/8Wx5fmft25
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AtkUWBrlJYK+VXxjweTsmppsSy3NHds+C8eBCESaU2Vcp2MC0oyCWmAajfPR?=
 =?us-ascii?Q?glGXR2VNF4Mfov8I+tvWWqNghDwZO2VSP5YSSfiXTtZqTugsewAjPxur17W5?=
 =?us-ascii?Q?D/ppPzkEmvyqKbcf9hXayWEzgSxdzndh1UAne/8Z1e7tzUX0kQwVPWhHBZp2?=
 =?us-ascii?Q?/lsBtyU5ciwZ8LagYAE3TZ5qH7ReqfC4KlKDs4ujQYiqJeXr7fIhUNH1/dZt?=
 =?us-ascii?Q?MacvNhh+HXMPQmCHpNK29Ci6VSHb0E19oEHo9jTGCYIMLLUAvFuC6etlnVKs?=
 =?us-ascii?Q?FIpEHdjhDPhLKdu705pg+vnmmSz1WidAp6hWYBTAIB2COeo8aU3QQmFuX1bT?=
 =?us-ascii?Q?tGKv/YlfqpxrdgOcT4muUhr/CWLKLsI7qpuDeqdvCuyyfPYnIA3Z2hwnYKJw?=
 =?us-ascii?Q?1LaqDUy79cRWwNR2A+klCCZwMTkzlc1eE3vWCveLaU6QTkAVLIugL1NvB/Mr?=
 =?us-ascii?Q?bfLJvCXUQBrV9ATrcYod/DiEefbi8FkKpVeGo5LH7FaGD30J8nsfSXtoDWCE?=
 =?us-ascii?Q?HtKxc8yOWCiIo1AhXJRZjpd24Mhq24J9/vKsmDpxkFqVnkJ8v/dfpxVl1828?=
 =?us-ascii?Q?uMY3yOIZQ3ZjNNBkvUTt7Icr+du8r+se6jSC1NJUVf1tqoJ0pWIc34KB9je+?=
 =?us-ascii?Q?eNdOl51s48TETzPcZmlMtPos33MAad/GB94dA+4i7vWtMV+ssqDgJlKEYlos?=
 =?us-ascii?Q?+tX1h/RqTS5qdlFvghOAvsUHjmJWI+g0jhrQBnJ/4SwDpJczNSiQ+HjO9SDR?=
 =?us-ascii?Q?DrZVHtfW89AJ1wETonvK8Kj8ssNwv4FNl58NUue3TpG+kgPEbdzWYem2ftKI?=
 =?us-ascii?Q?1tKMOu7rSBZ8uZ2am1I30GFGybf+K/iUm1l/ngTeuLIfEwwdP74yCchzdGkX?=
 =?us-ascii?Q?WItgtvsi0P9+LPYpWymGlVVQqOsVaSCFVi8C7gIwcmJO8GGuQYAjapPy/RVE?=
 =?us-ascii?Q?nxmxZlBOnr8QZ72XWdIJJMpeHnjDDfClBt7Qn1yddepe6kVjcG4sNWgIUldE?=
 =?us-ascii?Q?ZGqanr2kGUd/TKvG6vY00uiuJ0rwlaIojZnyG6m0UxHqYIrRid/zneqy6oDb?=
 =?us-ascii?Q?dmlhEgIE9zuVTpi3IuHmRXSVDM3h28vRs5uYB4iYOD5VyqCcyeUl3B+X7ef2?=
 =?us-ascii?Q?eIBvUkcZ6sIEtLuLV6MBcWE0+hnsrHaMA2z2tGnonSq1NzWjEfHFR+Y8JtAy?=
 =?us-ascii?Q?6UbgVcs2j7VIVT5l6QnLrOmuxNRlkIcQ716DEGJfFvOwqTaWAff7/7b/BfM8?=
 =?us-ascii?Q?xZ57CpEaSWUBuTE36MePAESRsbtDqtrr5uWBGEoBLHluYvXCpyphJNSRQtAr?=
 =?us-ascii?Q?RgXmyzQhPrdw+BcKPhYzyfAw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedbe3f8-8ba2-46c0-921b-08d925c80071
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:58.1980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ms/sh6NFnpmgK4DBiw9/VTv6hY7yNybeMwXJYkO/Kp3NKponIR1UYM3TDXSBP1bYuw4tCAqcarP413YDF4geSvcdM3RiyQy1dE9q3FGvjbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 2efe098aae..2cd68b480a 100644
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
@@ -181,10 +182,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
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
@@ -205,56 +217,40 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
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


