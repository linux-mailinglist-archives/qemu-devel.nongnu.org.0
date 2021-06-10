Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C63A2AA2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:47:38 +0200 (CEST)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ9t-0001gk-Ed
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqQ-00044S-5q; Thu, 10 Jun 2021 07:27:30 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqG-0004Ve-Ia; Thu, 10 Jun 2021 07:27:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGzN/kV7KLepQe6g/jANtKNlOakbVm+3P7M09X9ti9WYtjQghNJIC3h6pAAnYd0ddn1Gg8G5v1mydPRs8eENWoa9a6SnWQ/m9inZi2OmmjOAWR6QsjE3m+wTFJHf+ZfH6EQHhcIgb3tx8MleEQdJh/rJr9OrU0+rSmfTOXae6ZLOuB8kXk3x8QZ9gfgXiARHD6l/n+3pcIYT3nE4tQNgXJO495Vlh7W+lPbMX6Xpd84RAjGXNLJtWw78xVqhqPOR66GwqtX+pCdUYnXAbnksz1RCJVzrV6TaEiQLPg4LQdVgW5YSCt+owWNlhWik4+vavdIwp3k42sA/9Vx/KtdNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=Is/BdKVANxRvhcWY21AHYWr/TOXwD6ssaUnXUMvBWXQMDTnYzBzlAQFLFxplgBqh4IDoj6O7C+xjwEirfArgU3DoZQYKqoq4SsY0yXndQkqlaCtpZ3qQftNq+zmm+HOiu1nA2WVmQOdR0wN9YKqHbQsBM71EyBXA81LBMpZhEk2k5rEL+vs94rpSdh8FOsfrw9ZfWuJQgzpceGXoIXc1WNlc2wy9iTG82pfW/k0/kld6c3onYhSxE5m8h+xlFx/1eU+2be0TtzmLRhkSw67GdpX/BvCWmhRuFimSwGzNnXFPg4+E9umE6xR6EDOPTdqMM5Tl7qrgLqMrehAhYixX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=er8WZ1HjvhIqeqxwAN5Ku2fhpwoN8N8gBIHTJAlWCtoN20KPGvW614qWnp4c1IclhyKmb1wFtQM8oHVzrGOKy78/Ris4jfzDns17uL7XGCUQOA5kwxCOKCjww4JWONCzOH8t0AFNBBRVLaQmFDfjJtSlauLiWCR6T4yh6yfrmXU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 23/35] block/copy-before-write: make public block driver
Date: Thu, 10 Jun 2021 14:26:06 +0300
Message-Id: <20210610112618.127378-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f240ccb-6ca4-4af8-fe2d-08d92c02a890
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338196A1649DF60F3AB44B29C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SeOM3skAyR8rnQsSK7xomXDw/NrXn72onLXNh1gLSiMRwl7PXro54k/edd641kKByXNaRfM1LLFSeZbUeH6vwCHb5B4s1NITVuPEHnlNuOHBp7thvIRMVQK/ea2viz1nRgunYgCt4wT5husKmDMoQgioMVxJYPtl64gD8KYikgUo8UgcfkeOVOySVi8Go6JwHJz2Eyu2Xg9n7/4ZZk4hyeojNiqHw0tX1/SI4rXEMlDXpcVztjH7wIPhHo8c1VaoVl0vy4DBv4pNaXc7Y0TzJRweKqSUFnPlRrFNvK/gz76CrsWoPjX6xxPhmLexhDAjA6xN283jUzORLr3iELZLrj1kTeTCe+1pJvg1cTexAT3BNzGRAGzo8ruP5bPdbldfiywCxDIwxQ6Ssvjv0/B3TeCh6DQB2vZM3vlhVlGWn0+gluSZZ0KnepVd4oF3VvoZoHNe4CJse4KbpixNQthPUR6rGKarsiu9L9Ucp4o6gwyzXNv51cys/AhQoNm8e4exRJtmYITWsfvVhTT2YIoVPywQMG+soj/7FFr9MRw7uwMpKZqNGEZCKL403sZGI8jBajbi7L7MmyjFTnPISfNnp5c0ufYE+C7zkWmlbpaDa7o5nbGXZgUwWK4wRI2VIrrcZt3ooitQABPFddQnoJzkmCG4tZy/JWFEMaSl6edHQ8mQH0A+hx71fz4ZnkvbW0Nt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TP/WwYoPewHEZirF9xu2EXLHFVogLqao7yOCgU0DHotXubmi2tL0uvwzbiiR?=
 =?us-ascii?Q?VWAWbm/iyoVQXDk+/zT/Igntyw6+00nZ/jqoqVKRxXSpK+avcCP5CBnhdXSS?=
 =?us-ascii?Q?zOaOAoORoOv49NNUcb987vAZZ3tvRBP9HD0ppPtZ18/8tFR6F9zivYrdBv8q?=
 =?us-ascii?Q?kfSqII/Xx5BHjezBO/QyAc5+S8+dxH5kuPuB0fehH5FD7p1qoc87AIA27WGr?=
 =?us-ascii?Q?3IEE2DrK46sc44lRcFMpcnO984p9WcvWvzqVP4wPP4MReYpglynlNMiN+nu/?=
 =?us-ascii?Q?dToarH5cSV11o4UxMVYucrWkxwN5PmJ/9gxNP/5PxPgMCaBNK7nVKSu7fuGO?=
 =?us-ascii?Q?Eej4DbeQ+2lOCFUDT+KhvpIEqs57aCrp33A7bjMYMaNJxC8aoFuUh1PcZRD4?=
 =?us-ascii?Q?ACaIh6DFkT7iKNZsZFx+FilpzcWIuD44lYIhITg0jI8wYbsPuMr5TZ02gZKr?=
 =?us-ascii?Q?eiP8QnyU/eegsVFdx/lp4sJmEQTE2OP7AMbGhxT8Nt/9xlgm7n7Giadn6THk?=
 =?us-ascii?Q?z068iPxAixtI6xIybTEovq3L6Io2s24CtH9Gm08C3qBTmR2qNoQu45eq+ZfU?=
 =?us-ascii?Q?zzfqE4h/Wz0YahzdnI4wyGrZwAq/JduUitr3FqLLC6Gdk91pqCqLdI4OYrtc?=
 =?us-ascii?Q?PT3TbIcZ8yxUvkwcWilm/AV1X1e4e005vkaVmSqbXv+tQvkJMjkvs5Y6XlAQ?=
 =?us-ascii?Q?HVEorwIPjgJ3QCeHLUXLmZCpK4GaMiyotsTFj6NWvp8Af3ehRB0RmN9E5rKk?=
 =?us-ascii?Q?imKL8mBq824r/1vEUWHwqbZl5Dthr+j/EUbJzC2a66K/6b3W93cWIm6y/zjq?=
 =?us-ascii?Q?jTfGeyZ8NhvIT5erkScfP8GKI4TLnEHptRSB4BdWNM2Fc1RYYVrWs3sNQgUL?=
 =?us-ascii?Q?LS39yhPdtiEOJk/MMtkSLvaazSR5x4NanuWuCWotuuiyUae2u5Poh6fPv8X7?=
 =?us-ascii?Q?QgGWzS6IHkQrYmqM6IacrTLEYNSwgsZSm5YQ/9BZxawlhdwkXDLaWcb3puK8?=
 =?us-ascii?Q?Ud+iCa8UYJ1RO83Yprs1+UBcE7VcCWrkn9b25NJQeoLuUZmScYaFI9s1wthP?=
 =?us-ascii?Q?mcxDCXmsc3P1zwDQJbS23ktCo3kAUbobg7ktY4ujo9wLiOEUVqleQh2Tj1y5?=
 =?us-ascii?Q?SZboXrITXXJ+2zOrhl4YNyktiL7vLbkP725sY+ECMLKULLJkKWDQT3x0Jg31?=
 =?us-ascii?Q?v9KgdZh2024FrNK9b2ZTCKMSd11yI9HWKuIGZzJGn8ecrDooNvrJOOjVfZDe?=
 =?us-ascii?Q?H5VKFQG7ChLeLoO1CwN5vFEj2Km9MJTQk6KUpTP6k9+g/lPabzpwPNv/z//r?=
 =?us-ascii?Q?x8zJQ3C5/h53il0bUGbnWuWL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f240ccb-6ca4-4af8-fe2d-08d92c02a890
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:58.0889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiekptriV1Ni4EkgAIXHJXi6Yn5qQbiWaCvVd6QkJ3tM50dkWDlpoYL+dxKqqz2v3QkpASONKFXP/IEroXyF10aUAdPf0o/5t2jzhF4RFEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


