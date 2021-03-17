Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE533F3C0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:57:58 +0100 (CET)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXcS-0002cW-Op
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI5-0004xe-U2; Wed, 17 Mar 2021 10:36:54 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:8481 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI3-00075m-Gd; Wed, 17 Mar 2021 10:36:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g64OWDbE88yaLiA5xp55uIIHOERjyt2KTchIL9gXtJlN74kgpJbEx4ABFCGFw5tkk5KsPDSFNscxOO1rhJtN0Wwvx5JNvIZVMD2VRrctEB3f4v4r5EA+dYpKUa2z7+b6k3uNokYAg9oeqOywEkeGb2qlAMghGu/ojrESNDxtswOL6lDii01ZQ1il4XQvR0njrFVIEyX2HCdMnRZR2+yDcrqglOCttBn+1njca9ULSwzfNW6WabP3K9KMYugYmwiO4xWH3L5+mWDZymU8EZXRfF6vq5ik8ccjaS2yVLY1EaZP7C7roG/ZIWoBd5qhANEqvU4v0lcS5LFTPtWLCEmSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=565vSySmdqhzBD/V/TDV3F+6cl3Of1SSVJGXLwDLm3o=;
 b=fEps2qroROycpxPFLGBKYPh3gXTqyRU8I8r1w0EqeJve9K9mu0rDZeTsM9CPAY1/E3648uGDRbPgXIj8Oac69JPLSY65mZ8jx9fTsTKoAspnaGZW8a4zs3FYG9GzI5smNjbRj1Yd53BlTYHa5DXONLIUioLqL/yU6c/z0vGaGnXL88gkKXX2WZfS72niwdhkhPTQb5vZ1Ok1m/DmVs6D2r1oph7zF7DxKPYhSY+UwVTYDlu0lj2gz5/x9KdAm+jKeSeB/9c7ywBkLNXPRcO3lUTbvDqGXzfikXBv7N+bGepUEygl6rxtny+1gAMj/znznaq8QwwLFlr2zvUB4kfb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=565vSySmdqhzBD/V/TDV3F+6cl3Of1SSVJGXLwDLm3o=;
 b=q2CALY3n0ImYWzKgBPY5cSCfE73QpoxeN8nrjNp3UFIUp/drriS4Pn/Rf+C+cTSPoKqJMHpxbNcipxMFOt4o6GJJBtxzzdtwINRIPD92pxQo0spc6HV18PQf+kAfXPuuS0JYhjELQlVkbcmCQTmkfiPgcfY3/YzJKnzWLqmqf2U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 23/36] block: introduce bdrv_drop_filter()
Date: Wed, 17 Mar 2021 17:35:16 +0300
Message-Id: <20210317143529.615584-24-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1a077aa-556c-4591-c866-08d8e9521188
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6038148314D41DE512259A19C16A9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncZjRBnHwFrY40sD+8YyNiZZRen8fY46WlxwKP2X2dJvZEh8O8uQB8JiceNrz8khC9O/iMr7cqat9HSet8NuGwAcW9V6pFZ2ah0411paTudDvy89PwRgm5xOqyLntE45cKZ57nGPrMvxeWcJuheJdKmcPtGKgYz7IIgvaZ4RwGpLEanNy40sAMTC8qHQQ54XaCQJ8nieEfi5d9YYS0kaG/1FMRemlisPC/S38vbFT4SIvccORSkAp4z2Y9tvV25acOwj2hE8mDiOP/0NUYW862suGJ0cjphCWrMrmcsq1C/5I6TYew6uQ/dfq0p931vZAWaNC5Kh4chktcI0/QRqwUtmSJBK6bdGrabj2pvTlmM+0hBPhXXxp2Zhb2piJA80N6wNbo6fhDjngkMOKvRi7U2sWwWtAPRURPBCztMd9E0UHt8F99BsEpYeQAuzb3oU1QVKyRe6T0D7do/bikjYox/rWgJnV3YBbw+5dwQtkyRoKEwG3UBi7Zd2nQDS1Cud3iPpx40lpjS5l36Zwp1NxZpFhBIkS4FbSljjouZS+hdlkyYRk2HHPO64an7h/eMtqG9h/UwVQ1BrPcYkAW7/bSW0zjCum5zaDHwoqB2Phws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(2616005)(4326008)(6916009)(478600001)(6506007)(36756003)(8676002)(8936002)(66476007)(83380400001)(316002)(66556008)(5660300002)(66946007)(6486002)(26005)(2906002)(186003)(1076003)(6512007)(956004)(16526019)(52116002)(69590400012)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pDSXvNampMDCQfhMZpQ42Rff7FaPJ2SO50S+HFD0R0dJ0bKznDGsGutx5iXM?=
 =?us-ascii?Q?j5Uz9tpjTD8MRNFVtWx3j3Csm5t9CBpmHg1y+awUdRQot41vfv3PNEKBzQG/?=
 =?us-ascii?Q?zD1L/09Mnw7HhY8mAkKESvVgcjM4Yl4k9Ee881087HKZ0fWrCftFTGg+8SIy?=
 =?us-ascii?Q?x5nzWbwLBMdJSeBvlm9aKNiyyYYKBpuPb0SWi+du3ab0exoLfKRscZkMrlBy?=
 =?us-ascii?Q?BdC1ADrLusPm5H4yRHmbXGz4htWEl1SspTkjg1LKTjlakLFIAGiwHpUwZJKl?=
 =?us-ascii?Q?j7IdIPuon5nJoxyM9FyF9b/1j6CRDAso37zkGCNIixKYs5QgpU+h6bkgNm6O?=
 =?us-ascii?Q?7+l3oiAo3r47i+kBTwzS1E0Ym7kAw9zWl4gaa8cFpas+mDwfhMigRBln5u4J?=
 =?us-ascii?Q?4s16Qz4anNrGMbJO6dECXAxtFShiuuqFqBGBVjymlUWETlPZDgUqdYZGr740?=
 =?us-ascii?Q?WpDAYFY34d5mslscu7o1Z36/M78qPFfXtFxoA8ZhOxIkEOKmkQN/OL5CRKjv?=
 =?us-ascii?Q?eXrmaFeomgvaRBmbQ+9YKgDaWStYnaCEAqPU52AIsZfjf1Ldi1o4mLL8lxUP?=
 =?us-ascii?Q?XJDE4zzPQ9ERxMadQImIFxClLD8m0qHwydcbtq7s8ICQmEXFJs+HkJW1Hm9b?=
 =?us-ascii?Q?YKcW7GG4FBmSbK93iRqU8HQT3QhpPzeEFUP4sBPA43nOuXUoJVEylr8cSB3z?=
 =?us-ascii?Q?vovQVh6QKzQwZl/BvuYwDwtH5zeivLFIwSVDMeslNjGQM9I3F4/6p+MZJJyf?=
 =?us-ascii?Q?+CPX9s9O8ZGpr+otf1EkeG3rLjrJa7NjepipKDNIKw0HYopMMGAXmOS1+F/A?=
 =?us-ascii?Q?IqbMZE6hE8YawlS+UDG2TDFC7bLw0eI07KiWbyjZlnxxRzH0qZsw0m/vgjjG?=
 =?us-ascii?Q?o9i/pHPalIsw3IBESwxH2oZeBqmI4bsfpuzhxViKaogcUlqTHTTVxaVEFNp2?=
 =?us-ascii?Q?V0lmPh5m1ZkZ684po6qP5mHwGC/A91nsYGsjB5eTOqWwJun35r+ihuuNTRLJ?=
 =?us-ascii?Q?BbkwcgFz+iNBdsDvedgHaeF972MN72DcYmBcTcLQJOjCQJI4hYj0e9fUgdao?=
 =?us-ascii?Q?KmK/n+RfZg8fpVLNpkYBO11Y04G66zmRHWkB4GDKzxSim6HeLX2+kN5THeFK?=
 =?us-ascii?Q?1mG9wy0gRYQyJa6rsqpxQBg+5tPISrjMMBhzJN2ie4Zx5fEekMHGeE4d+HQa?=
 =?us-ascii?Q?4V/NmI9ZQ7t57Z/j5BLB0t7vVr2zquRt9xf3Sl5BiokON6IUZTWbm9Dfdh8+?=
 =?us-ascii?Q?X0AyPSjSihU24WZp+ify2LQ9vrxn5NjHfPKDZGoyYc1lcthgyEEiI1y4n2qo?=
 =?us-ascii?Q?l2T7OU4O0IfwidhiKKTeoZjx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a077aa-556c-4591-c866-08d8e9521188
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:36.6011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VGWA2eQRC6YLkosEDQrqJjjP1xldRDeZAoF1CCCrtbBma2aA3BY9QloiXZYQD9fI+YdFHAF1uUAZzNm1gWy1iz/uOEnlKMSkJzEsG0dUyk=
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

Using bdrv_replace_node() for removing filter is not good enough: it
keeps child reference of the filter, which may conflict with original
top node during permission update.

Instead let's create new interface, which will do all graph
modifications first and then update permissions.

Let's modify bdrv_replace_node_common(), allowing it additionally drop
backing chain child link pointing to new node. This is quite
appropriate for bdrv_drop_intermediate() and makes possible to add
new bdrv_drop_filter() as a simple wrapper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  1 +
 block.c               | 43 +++++++++++++++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 16e496a5c4..85481a05c6 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -362,6 +362,7 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 2fca1f2ad5..bf60f1ea2c 100644
--- a/block.c
+++ b/block.c
@@ -5000,7 +5000,6 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
  */
-__attribute__((unused))
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
@@ -5064,16 +5063,32 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
+ *
+ * With @detach_subchain=true @to must be in a backing chain of @from. In this
+ * case backing link of the cow-parent of @to is removed.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Error **errp)
+                                    bool auto_skip, bool detach_subchain,
+                                    Error **errp)
 {
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *to_cow_parent;
     int ret;
 
+    if (detach_subchain) {
+        assert(bdrv_chain_contains(from, to));
+        assert(from != to);
+        for (to_cow_parent = from;
+             bdrv_filter_or_cow_bs(to_cow_parent) != to;
+             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
+        {
+            ;
+        }
+    }
+
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
     bdrv_ref(from);
@@ -5093,6 +5108,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         goto out;
     }
 
+    if (detach_subchain) {
+        bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
+    }
+
     found = g_hash_table_new(NULL, NULL);
 
     refresh_list = bdrv_topological_dfs(refresh_list, found, to);
@@ -5117,7 +5136,13 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
-    return bdrv_replace_node_common(from, to, true, errp);
+    return bdrv_replace_node_common(from, to, true, false, errp);
+}
+
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
+                                    errp);
 }
 
 /*
@@ -5452,7 +5477,17 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         updated_children = g_slist_prepend(updated_children, c);
     }
 
-    bdrv_replace_node_common(top, base, false, &local_err);
+    /*
+     * It seems correct to pass detach_subchain=true here, but it triggers
+     * one more yet not fixed bug, when due to nested aio_poll loop we switch to
+     * another drained section, which modify the graph (for example, removing
+     * the child, which we keep in updated_children list). So, it's a TODO.
+     *
+     * Note, bug triggered if pass detach_subchain=true here and run
+     * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
+     * That's a FIXME.
+     */
+    bdrv_replace_node_common(top, base, false, false, &local_err);
     if (local_err) {
         error_report_err(local_err);
         goto exit;
-- 
2.29.2


