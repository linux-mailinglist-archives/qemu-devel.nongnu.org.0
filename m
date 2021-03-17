Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A833F3B8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:53:24 +0100 (CET)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXY3-0005nq-OU
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHw-0004qJ-0H; Wed, 17 Mar 2021 10:36:47 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:8481 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHo-00075m-Nc; Wed, 17 Mar 2021 10:36:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En4KmiYLhSyToeFi8BXqlT2bmEGp7YxO5yiQ3P55TIj2pZeQc2CP5w7baYVOsNmtfnaosqGvvSeQh+t301sWEcdJknS+VrO2/Z76FQOHSEfk+J3XJ5Be30lAhaofvr3zpquZoQZwQgzmeJQouGvjOhU14Eb+p55qsEXLs/Smq8Xlz8n0yUvAS7nG9FkQ2rXtBgo+R3bgXnF+XS5lKW+lvPP5PeMvjaSX5y3/4tAGBecoCVoocufhgJgiVnk4+lmiTi1DXFtChwvEnvn3viKG0noim0Jo5wGdhuKeOd8BvVwUZNp2ftGD2BkPdkOAdFxH8Jp3/eJDk6j7vA6JmZiZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQj38eq72Rl4/prL4WT3enALcp0Vq8uBTX2fXo+O54Y=;
 b=C3QiK/rfTxcFQqd6JDKd0P+GADfjn1njAxoLcToCEktq07q+6kkAQD8M3EKkf0USs9tGeAxBh+tTUU3Sk4nDYdqF3o/eeO5cGs++iUthUUPMLIkKcDnboYfXMxRnjYcMcdX3WUjkMkXCN60iWDLS0jalhxdTQJ8HbjWbDZXSqqnzx4vrnk8tYgfKD0nYhpExdfLYOlZJgqJlD7xu5CWa7gRhblcuodXnD5CQwaPi2M5mnBIxgLDj4SGYEYG58qR+Fnz/YI8t2XmRYylCisu6GdFBBpgFnu8deQqJiy6xOC/F1SZpM6eguNefmyUsSeQtKGs0lLw1h+yNee9c8JbUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQj38eq72Rl4/prL4WT3enALcp0Vq8uBTX2fXo+O54Y=;
 b=Y9GfXZO99j7upndAScbbUaFgt7BZ607vn6Mea/6y+eJ51MdQuJ8R1IEkxPEK9M32C8/G5nQ6vo88rgtoUXOWp0g8RGONEBCZj2zQg0NrbcYItY20bVuJh7x3eHkA+WP1O0xbZO30lyC0LvMAtENxY+JcK8VdFjiEbmvuOoDZsL8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 21/36] block: adapt bdrv_append() for inserting filters
Date: Wed, 17 Mar 2021 17:35:14 +0300
Message-Id: <20210317143529.615584-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9a1b2bb-1a59-4582-b601-08d8e9520f9c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB603886EEB391276888EC2977C16A9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmO3nnm7MCeV7rf/spIIJU6H9XZv2yQaIqWmqcTh9VWRR7YqIgaJ5+4hoKIkBY+x+FdHGHBMudN+579GdYkI4DOKNq/kaBOnATi8PDknRClFsad17yge1va9DJIqjdlfCzUNzis0xInqKkwlpl/8wtQvRVex7Wsrp8/TTu6cd+9PfzkeMGJSjkrnOeAiBo2HmoRha2taPmwyJV/YB/u1YstEuWQa5REvC4Z9TGFFI/dkJBqDfKdDVUXVQ/eLK9/7TXSu8JtN4Gfk0bv6YE7OgeBIpQc5cXBsC1pBxXfG/CWxRItAIe6MTJhIrXZpJtAy1g9wWFgR03ALlpZehZcYGeFdcwFe/cQxtVXKUGUjCXhFYMMCnWgrsoVJfqoDorn9X9aS53LoSeXhoVLN22lMqCcGyeW9QFtFnRfZ4NkHJTcxiBsVDEG6oNNsrXSHuNorX6rDHexB2+oyYn8MLSYChepzMMJ/7xtjUHBbtgOddqLrQYRp1/ufvENRfZbETbyqlMCwTxVjV6LRLKv3xjk2JNNEH2oN0pSvZa892xC7KzePp4Pkz6wno1Gpw4VeDo3iN+Ryc5JNC8OHaVsgoIV6yLtvjdnR6Db/r46qlo+4t8ioHcli9gDE72J9qCyHX+md
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(2616005)(4326008)(6916009)(478600001)(6506007)(36756003)(8676002)(8936002)(66476007)(83380400001)(316002)(66556008)(5660300002)(66946007)(6486002)(26005)(2906002)(186003)(1076003)(6512007)(956004)(16526019)(52116002)(69590400012)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VJ4aAyX761DbsJSbkagt6KBqlNIpFGTqQrQaxCL3A40afXuOTqeIDH1ii4gE?=
 =?us-ascii?Q?uZHyXzhD67x5wagSmto93rYr3YRT7ET+OaPJFHwvz1fx/mkZeMgPu9VNCL2M?=
 =?us-ascii?Q?7Zy7qgItg5cOM+UhJqGsV04sK2tZKNAKc3n1Q51ukmZYHbn/ZrTkGhIb2VC3?=
 =?us-ascii?Q?ynxH2Y13CS9KOG8NQ4pF0iOs0+Kxa0VnaL9/NLNIjmtRzLhPInnDKehV9Mzj?=
 =?us-ascii?Q?Zp1QssoS8kXIg0sejaS+siFT8bnaCVyXulXMHRTaK4PHcfeeaOh0g3eiU1We?=
 =?us-ascii?Q?0yd3ODJ45O6uCLfDB4PJVQHknQ9lLM4THzhWgej4vU63OzlRvNhqo40H4lhQ?=
 =?us-ascii?Q?fogQhsAAGpkhILtDgIUNkftqqk+y3cK6v0DkY/3QE394z5pHFfkeSbCjLWx+?=
 =?us-ascii?Q?6YzAgPSNEaOJfJxMgA//HGKUQYtXXUFa5dOMeaueOmbvjfZnpPtjkbUeHyOH?=
 =?us-ascii?Q?ZVUrvcaTuZq+qJQHOR5I/VuH9x6Pw9cD3KFKOKuSUIeSNo4YLfFIAAIVYCSC?=
 =?us-ascii?Q?UkweJes+BENKtbjgEGmtEYWu43HFw4ck9bTJHYF6wZBbptoyRnd66VYV3qX8?=
 =?us-ascii?Q?TBEN1ZDEcmmgumbsjrP/sEuafgGyQCngfpoquet7Aiuo97xgfGIks+z4noms?=
 =?us-ascii?Q?rFU7YUcHegw2NlIugoq38zXR5oSsngNIw0R+m3qcg5Yr7Cb+TV3neMACWUrD?=
 =?us-ascii?Q?wKP/8glOy/X1zX23ieVVBF03iU4LnOhh+xv0r3Tb7WBV6HPELG0BCnKkFLiH?=
 =?us-ascii?Q?REpYeFQv0ETdsoQN8xm/SCPO0DxWpeOyD/k/VCix9HlNER2c30Wg+7hi1Kbw?=
 =?us-ascii?Q?KmqIcEuKqxNsZU9Fmv37Sed7KFff5Wtc9J81pSz2y5Wl2UQm9OXDHpEFO6tE?=
 =?us-ascii?Q?35bUs33i4dQHD7l1LZfWyDoo6t5VuVYdocRlQNLSv6s+p9n19QATxckRMPA5?=
 =?us-ascii?Q?AdDKts3DeEua4hiaCOCJs8IYje2vYpkH3pxBOMZ6o0miq7LolRKMWcV5VLMw?=
 =?us-ascii?Q?L9oqNfGS0pI0vaac1vYOjEmKSuVb4VLAy9b2X5iLl4XENzt7DcvGMd50Rueg?=
 =?us-ascii?Q?cU3jr6cFcdf6H/iSYjyR8uTH6Guj1Qqb0Hl8mV5cLYdVgkU2sZgdvyXlfN04?=
 =?us-ascii?Q?lJWRPdcXmWFIBqx6jnnCkelfMPhiBHaQpA5+Pbvbz5JYyZS30eSUyVD9xBXJ?=
 =?us-ascii?Q?SEFSFf9Wy+7mQJnAsq4ccSoEQD8NRkC/geIqImrxatgq3H0da4kmkEAgMBjo?=
 =?us-ascii?Q?SssxUTZGGfsCyW/yHviamOwHbV7gTT8ARgseljndWMbiJnjQS0/umBIRy5Ua?=
 =?us-ascii?Q?+oyNjdhLT2c5qU0YryOxdezK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a1b2bb-1a59-4582-b601-08d8e9520f9c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:33.3036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2OZjWYXi3jw59FjwolOVKW4Ss4guwaD/VUMzOjLIFfFxA4qOWM1eiN8KoE/yEpvkqorrEwb+xUnxt/LEe36dzhe7G/M4j5mL7E6AozH/xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.21.119;
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

bdrv_append is not very good for inserting filters: it does extra
permission update as part of bdrv_set_backing_hd(). During this update
filter may conflict with other parents of top_bs.

Instead, let's first do all graph modifications and after it update
permissions.

append-greedy-filter test-case in test-bdrv-graph-mod is now works, so
move it out of debug option.

Note: bdrv_append() is still only works for backing-child based
filters. It's something to improve later.

Note2: we use the fact that bdrv_append() is used to append new nodes,
without backing child, so we don't need frozen check and inherits_from
logic from bdrv_set_backing_hd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 27 ++++++++++++++++++++-------
 tests/unit/test-bdrv-graph-mod.c | 17 ++---------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/block.c b/block.c
index 433cae1181..11f7ad0818 100644
--- a/block.c
+++ b/block.c
@@ -5053,25 +5053,38 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * This will modify the BlockDriverState fields, and swap contents
  * between bs_new and bs_top. Both bs_new and bs_top are modified.
  *
- * bs_new must not be attached to a BlockBackend.
+ * bs_new must not be attached to a BlockBackend and must not have backing
+ * child.
  *
  * This function does not create any image files.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
-    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    int ret;
+    Transaction *tran = tran_new();
+
+    assert(!bs_new->backing);
+
+    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs_new),
+                                   &bs_new->backing, tran, errp);
     if (ret < 0) {
-        return ret;
+        goto out;
     }
 
-    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        return ret;
+        goto out;
     }
 
-    return 0;
+    ret = bdrv_refresh_perms(bs_new, errp);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_refresh_limits(bs_top, NULL);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index b81787487a..f6077a6525 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -387,16 +387,6 @@ static void test_append_greedy_filter(void)
 
 int main(int argc, char *argv[])
 {
-    int i;
-    bool debug = false;
-
-    for (i = 1; i < argc; i++) {
-        if (!strcmp(argv[i], "-d")) {
-            debug = true;
-            break;
-        }
-    }
-
     bdrv_init();
     qemu_init_main_loop(&error_abort);
 
@@ -409,11 +399,8 @@ int main(int argc, char *argv[])
                     test_parallel_perm_update);
     g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                     test_parallel_exclusive_write);
-
-    if (debug) {
-        g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
-                        test_append_greedy_filter);
-    }
+    g_test_add_func("/bdrv-graph-mod/append-greedy-filter",
+                    test_append_greedy_filter);
 
     return g_test_run();
 }
-- 
2.29.2


