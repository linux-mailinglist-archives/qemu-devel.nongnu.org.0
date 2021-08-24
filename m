Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2A3F5A3E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:56:38 +0200 (CEST)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISEX-0007v6-Sh
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyM-0002ro-JW; Tue, 24 Aug 2021 04:39:54 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyJ-0007eD-5t; Tue, 24 Aug 2021 04:39:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY9jN8YxJw69t03luBMBdHgBaRkuNM6fu8CVJTHWCQLaxfIvjx1Uo1HcV0Vfr2WtSVk84Pv/E3smkI+rFWW+RT7G8MB1Oe2/vGA4mvxv6LguGyC/AajKA6d2uF3pWVVUX9IqkA0OJuCL1e3hofQa0a/9UpPn/1OnF2SRL2BZEQuOasL7sb8fq8AcXVGQyOnyy7CJsj9KALaswC47ybs6JxM4JB2Hk+AIBq5fyB1Gy2jmy9cw3YzoRCn+cTfuV3IvLdw4oGh95o1vaOwseNW0utoPUdGcn+d1uuf8h1E5oPc8Mejns42xI0X4CwH+K2u3Ic7SqhgaBF5PnDHQwmnJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=kPHrkCzH7CakN7jVQ2O9urmZid/g3Nn794ktKFuBYpP0veQWz8wea8lGqcX3HzspGPrCU8z3BbSpK4FtilRM+JJNNraZimQkw536pMWX/Emg08rdhNedba+lMI/vOizbTRBJ+5O5feiNCKuLHVfsLnP75hJgow0H4dAg+SswgYLk5t4DDtwiWQPRcudqanFxjcBIewRbqG/UQ3KkQJEoYEeiPkdecPWExZ6uJZjKgiAFwVQLk9flofvmeMFCiS1lfM0D7ZYjk02snvn5iuYUD5Fe6k9mer0l/IbGEvMAuDj0+ROowtz8ZMfPk+clvKCuBeeoajPa+QdjqxO4nCb3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=udOLBVjQMwUz8hYnfU1z8p+JrWoZoOd1ku1V7dsj+v6xSe/+wcq5m93EHJcDl7V3Ied+BSuLIfvr1+D8RI526VO/H2lTZU42leNWebt6RyILEt+DqHMeBZY1cJ8lb2oww73J4EX4UnSaMhPUJvnhAmR2SsnE22Rzm8m8nFC9aqY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 21/34] block/copy-before-write: make public block driver
Date: Tue, 24 Aug 2021 11:38:43 +0300
Message-Id: <20210824083856.17408-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9753c82a-ade2-4ac0-54fa-08d966daba7f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088754126B1D1EB262F43D4C1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZkljtHLbpS3w/noKot4zwQTRJsPvevFEzY77/yctp435GeltOmwuOb2qeL5/yP6SYzyHWrmaLJRkB6FJ8ODMY8p4VD8OZaHNrBkmwzyUvocG2Exf5lIbCREw47DWtoEdiALXBggONfQcL1gwswFVLWI+Z98tZbOmxOkjsfdMr+YenHGqG/FWQObQwPP5LUSED44B9VovAYD6LoJtCuFgpCF3EBIv/hcbMx7XAJyvUy3CtstNKDV8PGAc28DHve+dyjtEsm0LmWiq5GSB/beudpa1n8Gg8DrJD4SNoIxqGsdk3rLaoGOzs2jXQl00E+wpqRIwbkTNy31lKBaQGn+ToxUsYie0csTKysBd30wslMiXDY+vLJzit5YWK9ff0z6yGsbOG/qeH2oX9N0fTl++Y8qhkPe9VOZ6Do/Tcog65ylPFz+PSy8LPdAkfMzyStLmPrfpwjNfyC3snO0wRx6v3R/xxSvSsoe0G6QeA6k/nVPTDwqqt1PJNtPHMt3EO+uGhZ7BOpmdHcW5x65TTmJnawTEmLk9wblARtx5CWyw0ICf9/T63KosVir7/4Nt3QwmpWf5Z0oIDxmRYWvWPRsmCWDB/Tz0MFz8rPz5b2Y94/8UxU7GaF0Sfh78/9clQHY/RPosIBXNL45NAtvUovYiePxF7Zg0uwkJATL0Aeqf5O0ntKdyBvCOVSJJodq5S3PbJvHfTxl6X9K+o0fsReLKxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6506007)(52116002)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m2VDpLEIlQuu6UJuGDaRR3C68AmDiLLhpGZMCVN6ltW9l2J5+VoDcTZufy22?=
 =?us-ascii?Q?2VsZjX9C+gf7rVwIJ97mp5l61mfG4AOBn/QKI5O6lZY56RK26bqOkifwVvx6?=
 =?us-ascii?Q?i3PnONr7M2jtticsJFFFOrotNOj73AKph3xwIVSiYJ61Xkf/7DkKs2h5aIfP?=
 =?us-ascii?Q?5mfblE8a3oXpC2NAD0uQQXln9sxsOUccCmU2yUXckitSFj9klTzJdtRyTD/N?=
 =?us-ascii?Q?WISEpxfIiXtZnScPT5akgqwoi71e1R+L6HgFhDZdwWcpf+zLS0a+c7jbOGac?=
 =?us-ascii?Q?ig8FBZIzd4E9HPyVOhZQBdVOiQ6HXepxiZaavv/0J2daQR5o+rxEb3kx/cpY?=
 =?us-ascii?Q?udaHioOj9RiuK8jwyjZpEvzhm+cQ5+5TGgxnJwGJjxQFZmq4IFWa01n0Xe8L?=
 =?us-ascii?Q?BVrKZi3CZXw0PgCNqY+eUfhjQbmCQj0qLRpVGRaCzfA+RZlEPnE/yMnIP0em?=
 =?us-ascii?Q?0YYpl1LE6FK34Unn/wCkDqCmRwTxnXkhJ/+zg+7uBEtnJufXoyZNQe2AS5n2?=
 =?us-ascii?Q?Uy7VgodAnaPFJlLdCNmvKrkTQB1ThVhd4z67FPwrXk6JAd3OIJqSlB8gHwjb?=
 =?us-ascii?Q?NFRcSybTdGNPI4j5BSai/6s3opDCVSRHZj5Yv43B2MKUQir53TWWt99OrTyr?=
 =?us-ascii?Q?3Eid01vWp+ItEIvu95pVxN/U2zipwucLW6qPOKqkQ8MNIwdYe5AO1aDCaKEq?=
 =?us-ascii?Q?e6Mhnt1/EpDctnYxloRt5G5nHCX4tlkU2BQHrg5GHaKV9YgPc9FgV4CDVH0p?=
 =?us-ascii?Q?tdp0FwuKUxUvDBHucXzTL2AlU6wCkv87toRFOlWux2t0o2IUNgUh/7Oi1hpW?=
 =?us-ascii?Q?12S6NiVU9VH3JgDYvi3FEGu/0mZWU3AO5M0bo76tNSjq+wjkCmPGBpk+PLR8?=
 =?us-ascii?Q?NAQcuRNRDoXVEXNu6+Vz/0Tld528KkluVny3WnEnV5CoZDIJldcL3iYfr9pG?=
 =?us-ascii?Q?KW8peNUapoWxsSK0cDNXFkQ7xLkETQGtIKPJfqtLMqnwZYqUFhSBZnax6OiF?=
 =?us-ascii?Q?mjjk3fLg8LGBv3zsQZUKICgBe/DIazur0wHScf2QSGdLXHY8w/o4VMBc8Zh4?=
 =?us-ascii?Q?vZHmPkkQHStmT545ZYfyTW2gX+MNvt0AjgtEqWGIPY29ht6YtOJkyO+5XnD+?=
 =?us-ascii?Q?1tAxry0n2IWBgKjVzvIh4zL0LhJ/AuJMCnrUGoHgFZw+YK4DY8JDY3pZnu4C?=
 =?us-ascii?Q?I6FQbZzkr7+/6OKGGwEI2EiWlizv8nBy6DfxvxyYYmH2A1a6f8kllIv7WarX?=
 =?us-ascii?Q?E8qc2BlbaTIZaWoPGqSEHz9VfsHqQM5Nk7cV7agfz+RIpTuKJANBKxd+SOZp?=
 =?us-ascii?Q?BQJVjr15Xpm3RmWX4TloP2X7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9753c82a-ade2-4ac0-54fa-08d966daba7f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:46.8760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sltB69BwfggKBsFyr46d0cZOsH3YvMCwB69EDtWP+a5GL2rp691dPiL0V4YIx9qT4inGAnV5b6zHeuX+xDds1XZDSY53CGeT196xRJ32Aq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


