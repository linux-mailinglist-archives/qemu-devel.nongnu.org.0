Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7783D0C75
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:33:21 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69XU-0002Mb-HB
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697r-00089h-2X; Wed, 21 Jul 2021 06:06:51 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:11108 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697p-0002Gy-0a; Wed, 21 Jul 2021 06:06:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwxdZv6cZCTMg+5dWKP7YZCUMeE+dxVju+4jVx/2jjAyVL1VmQ/8a/5UyDMt+rw7k5/G558dQBUvZUSSMRFgZbLZqrFh2GFPxrhzA6zWPNUjO5SueLif7nu+3Mo/W6sERh2mdAI4JpxiiN+cVIfZ/zAGXSYPxjmLxNIiHMwZ/MDMiSncj7bMWqZ2o7iqd2+ZAfx7XWviMX3otBYTy4FfNQklxdQryARZ6xCfPWBc5YtNxVR3K8/FBskkAy/TUj8GfMRFPEkEt68krDo7n/bzrxXQSB5cWp5SwZSG4dwt4p3NAxzgoPjtyAkXQ05JmzcKlutpRuV6tQ95RaQExUS5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=N+xclIIY3+8Np5c8MhTUXi6hdmIvF/DquISSc5+Wpk/R3Scn4cxZpRgfjyoy6uEUUZk5BMwJmcAkoHfj1zRuudmZuzd1G/BQh+CER1WI11hcN/e/GAX2EYArm14RuGJHU7VRMSz7EA5RAL3gSDjSt2tf03oQwaQYq1/YOE6hlSYVc0cBPGfDUvnoM4WNyemfJpcDiokFepu2m2gO3Zq/y1RNtk6pEZZVSZ5DnpCyXq0GzDYSHgr6f5MvEyI6KP+PX55LJGr85zgWA8mc6A+IVhTi/o6+JhBmUx6NFTRlcfid7Jw0tVMTfzOeZYbwTKpYokm72GZ0M2Oy1IrOaXHhrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=fgn3DIU70/YJnYj13Bpkc5cfO29sjJe9BAO5iLTIjtULbjGQSZfStjUBOERmWej9LFKXw8qYVq5vylcyOLCLb9QpopiJlNVRe4A0DUNcSac7tnjEAOreuTyWM4NZq3HX1/50pNl6ffQQiZepiPaPMddGcnVMAcZQKgp0dTWvV0I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 21/33] block/copy-before-write: make public block driver
Date: Wed, 21 Jul 2021 13:05:43 +0300
Message-Id: <20210721100555.45594-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbae4bd0-628d-4641-ddef-08d94c2f3b7c
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494D565EE61C3F7954D4DC8C1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKgME9hZHvfz46ynxzKwBTTDYCzUFBkFbEb6PSMKs9aV5njYPR/hS9VVq0L1SMwCzr/et/W07aO8phloPr762A2Ba8lrTWyixfHVJGAdOdXkj/XQ6P2oxiIWokn2UddvF8sMKWXmHkkpk0jo+UVuVI9/C1cTwTYt0yNThlxT7AsKao/3xLEcynu4HHcALD7q4SmaD6KH1u8afuUauJ+6k/jzuFqhm2QopYYw1m7C7H3j6lcu9VJvgYOZltVdlmMgeDo99pVtjpyxKbup9g9F1SdAMFbtMkAHgaXn0TrWggFpuipdYKBdOpbkT3bV+0VNyThizltZ8MryzT/+MGO+QrX/x0X+gK/2bcVo84NZ/YJ+8ZzgbO3DzQSzmtwOqAhvEYhShu3afH6Hv2qPGQxvKnSdVdw0FZgx1SGBxRhjZy9uoBZdhgA7X0JOKUlWj23g7g+6GTrvhPESCqdfPXtYqT8Esnjh2kXAKZHPfGPNb+vMaBTtnzRNFe9uliQCusxPf5eRz650LazRCUn3geV/HYsnOx9B9Quwr/n7ej2xWcZdtkoPPcJuxpqa8YAXYyKU97W63Vol0hA7GH67ZYlnb1RTHN22QmIW0Fi9/Q9RT9MgooJ3iJ7o5PUQe2Tm56pfgChRwKCwIDsJTgvdbjHZsXN/LARC2oyCACvwpJjZU0e439h72UpbI9fOo5HqHeU/ybcZnNhXEFn/iKcyyUPt6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?642CDEjYGStrM9cWMok4ZLSAl6LDVRxOx42o2R6fwTgpckGrsoFVxCJ3VWZv?=
 =?us-ascii?Q?F0eKZFU3jPxnPjTU+wYl62gQ9Y2JVexABMjggOvf62+vV359fi+tYVVRa9bC?=
 =?us-ascii?Q?VqakriMAg08PXm06uR420Ya8x9rE2U6jK54grOeLh0oUWtXbDRMaOGZ4gdjE?=
 =?us-ascii?Q?DEXPfYFIjrBfXrvrKKcVtDNgiBYeLgm82N1SAoDk2c3+1qaVIcvuXgOzIn12?=
 =?us-ascii?Q?27j3MaRey1hWdxsl1YRhE0IY1QsDCSHIemMDNut3m706DGs8CpYzRircWDcf?=
 =?us-ascii?Q?gEEGiIAWdbFDNa0hgl7fyYYGyQaEaW23Qy1M4skATK2VgvCBp7xPCMVuvkSR?=
 =?us-ascii?Q?ZTnF4FOyxow/bvSGMZWMXEN5Rp+pWtjaoNWeStiLwCvR3PRLWEycXJpt64cu?=
 =?us-ascii?Q?kM6QEs3MhR498TmlB60rNuI8bYQdAlKmV+jzmXzMpuGLjjfYRUtFEJvwZHog?=
 =?us-ascii?Q?7Bm2C4Uiz5ZwSnaaVLspJ0tWI9zJEP1FN1wUmth0DbWrohlR/lPWoXU/+Lkl?=
 =?us-ascii?Q?TsGylK9TxiCzJYiDX0IsSZukPamO+FA6+vyNb6YsQT+qLfv4vNCCVUwyjPrW?=
 =?us-ascii?Q?1z5Ovqw6TX+06PILoAgbtCXhJOgP3A3pIPBKlzVcWxWVFX9DPGx+EugnNrco?=
 =?us-ascii?Q?S6JaKYQiXeZH6bD8tlgRC0eqotjhesayjOnUbNWc/nmGxKxekWJbSbCqSFn6?=
 =?us-ascii?Q?mJd9WdyhnKXwyNIlDebaKHPPS3kBxtzP/UESy9JMARMofHhhi7LnTN/557Kb?=
 =?us-ascii?Q?N2hNTe6FIM3lJLP8QofJ5CFEIdtdwbaEVvdUZgnXZtEMYSyhzL2cWWurfV/H?=
 =?us-ascii?Q?NDbXi4BASkE1rzPEx8X8zQqXLEHy2chISoLZ4Nwat81tvP1OLYMRMn4/4LY2?=
 =?us-ascii?Q?k9TilIeJjeTrk6ItAj3mZE7tLiORtnzh62RhbBdOrVXS7woPYfqz/axPW00O?=
 =?us-ascii?Q?R5uNT6Dvy3bjEjmblLfkoYqYI6OmRlO05kUWPmLQzBg0VM0ij0k2pkXt+eon?=
 =?us-ascii?Q?Fmk0gqv5ZjboC51ePxQnnuC0GF2kZ058tfnkBXK7v5ORRNsEluxOfKcKi9Ta?=
 =?us-ascii?Q?So4JsWDtVhR1EREVBwpc8opk1wJ49SuKk6toUDzfi5eF/zx9ezs9IvPi9U8U?=
 =?us-ascii?Q?AR/Vg7XyCrsJwVIKwu4mw/lc8YtwrYmlaakyo0UycPXYvOcJWgae/rs1AgBD?=
 =?us-ascii?Q?a6pa2EL7cWWm2js2Wt0/dSyTjt2cbTNe1E59o9XJ59rZyD8rC1pFgEXtIo5s?=
 =?us-ascii?Q?z1L9hDtpJGrNinCf3QsUyZzaPhMrgVTbwYFQg6XgAuCa/W8ZjZRYlKGUuRDa?=
 =?us-ascii?Q?xp+Al55ivn+8lnUdtz4jgU4b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbae4bd0-628d-4641-ddef-08d94c2f3b7c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:39.6262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP1O7LWYARp17zgoWzNlM5QD0v0cem4APfEoT1BwBW2wNAt0IAR96tLm/cQmthPxs0/ljbDrtuPzm6GVBC3Wf7A17HRtw6UMQbJtnVE+VR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.115;
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


