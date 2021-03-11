Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CD337876
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:50:58 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNaT-0000ax-NN
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2i-0003sC-LT; Thu, 11 Mar 2021 10:16:04 -0500
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:13537 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2g-0001X4-32; Thu, 11 Mar 2021 10:16:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/D0nYOffw/sRU9S2UQ4eMuZ7wus5Zw1nF25EXnNN6PjDEVqqm+9IUpTXkJIzFSque4DzoTcASetd7nOpz8dYtOjrFxshj/EhhXcdklzaz3ty6pACFfXTrb6oRyHfiuFmbxbq/W2EfuYbKICi7Jq5asZg9MBmUGcg4VVi+cZFpWZH+7Ivo3RTGH3Ht1K2J88+NE1zlArve7Dwi02f4zACqZXkLhQaNlK3zj1/0nbT8/M44qpGk9KdMkP9PqS7hU+oU/qHzBBkQUALKZp/DViavaVaXkA9FS7QczSyQpJ9173JJRI5sMs69OG03+joU8z3JnRDQ4OeGTY2+z+MGV2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVA5XJwSAiujePkGym1f2ScH2EKp+MoilVodh37nydU=;
 b=KDVNf8SsyQsf4fRhJN6Ez2QDKedQpQf7J47dSVJYJArcux1K0l5c7BzyovG+zuCn0TM4aQXp/cV6pXtEUjOEq6NUiVmgxt3PHYcLdGvvWlnV9HjDGAdaix3rW0yAs2nuTVE2pCrBuJK3V9vlOlNL2lXaALHgo4wo19wmihWP2Pz8f4F70S+Te9EIourgKyuWLi+fdOaaU0naHX9pXFEU6PyqyYYwUSyDIUP84ZGPolVc/YyZreyRBk5Bncc4leGu+eTpHFh5onMrhnajtv7a+OX+QzLSQGzi9ajBou1Cjy/SnY+YB/C3d4j6Hjt2MT2ZP8EapC2zmpDiiyoxNC1S3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVA5XJwSAiujePkGym1f2ScH2EKp+MoilVodh37nydU=;
 b=jWSr8BfnM9rHg6hg18ncfyUhtYCCA3pUnSYH3oJliyCGIHu4lYyR2IROv6c22HzOpeJ13GfdAzy963ditt9YdQg9XZCtlIdWBEE4h10AcOAyIQWiBze4542lXXjC205t0PpnfKPFJ9PCPFYtcW3hGDu/IVU+84j6hBUOJUanolc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4407.eurprd08.prod.outlook.com (2603:10a6:20b:bd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Thu, 11 Mar
 2021 15:15:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 15:15:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH 3/3] block: drop inherits_from logic
Date: Thu, 11 Mar 2021 18:15:05 +0300
Message-Id: <20210311151505.206534-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151505.206534-1-vsementsov@virtuozzo.com>
References: <20210311151505.206534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0247.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:3:fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 15:15:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9e3298f-4a79-4b62-81f7-08d8e4a0890a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4407:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44072568BACAB8500A483125C1909@AM6PR08MB4407.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fhOYk72yumAWyunpHKcktCtt7T4lxV6wzJHciWEQL5Ea7zWeVfUEApOJXIjRsd/tZnsQaZJDKQ4GZB1tCSEW86BjkYSFA1Uyv0TQUe9yMGqhQfskfXZpgT4woPQLc94c4iYOtgEbwkzHCw7anhZHn97VgBNosXZgks1Kh0nmC4cAOHK+otkVrLbRAYMpkP1iVtn6aAO8huq4K4Q/6LbE6eorPbAzSYQ37K6Nr2lertD7v2iWxkjVZJLB0auNrBWZl81V1Wiyc2leTQ42zeROdwVP/6nUF9S5JBywrf9A2y+9KsAxe27P133ecU8Svt3b2wu0gyNvkGbBByHtg/MTy2T28uBlb47r70V1lNtTygBt2pA4fQQ33QxcGbjM/8P1Rkcm0ZR8uql2WuV9pT5qMzyahEZB7ZlYuudlhIpFNR/1tBFxyq9wfpVwpQSXj5e+3dmNk/QjvDy7mG/6+SwjSr6QZfzQZoPhzG0uCtKcBZhodbEunECCUReBKWFncypYbC9vknwlCruoyMfBXORUVFt2/93uiqgPEcmk9Sz0FHf/dp9dE62fcJnqsv58VvP5EoBtnbVwjpKbF//t+XL3PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(346002)(136003)(376002)(30864003)(6512007)(4326008)(6506007)(16526019)(36756003)(478600001)(6486002)(107886003)(2616005)(956004)(8936002)(1076003)(6666004)(83380400001)(2906002)(316002)(66946007)(66476007)(26005)(69590400012)(8676002)(66556008)(186003)(52116002)(5660300002)(6916009)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?opsCCt0t9PnvMrSXI2mF4fnuhF3PXYg/3T9jLdbIxXTtk37eXRMBX53+P41C?=
 =?us-ascii?Q?ZMp1i+s806tL1P1VeboZBoKojdyLCXBz3uP6KeqxqWXKvCPY6avj+9hoJ6k7?=
 =?us-ascii?Q?UrRDifZD8SRXHnUj3nqo3kCuYILpc+jjwMH0UgA4EWT9wRGd8VUuQO1fcrYO?=
 =?us-ascii?Q?8s7BJcjTgFNHfEQnmcGNQnC+6OXLYaTtyCs1AiN8Tf5zessE3QiYP68DQDZw?=
 =?us-ascii?Q?JF1OpQ7/I9ys6+Knw+fiIZ0vLxbP+DEVCmcG9KVdZxoLw4sSfLeEoJyqAajc?=
 =?us-ascii?Q?xRRSWiMRyHXQJ32bJS1OwhYTJxl/3G/6zIg9Ymt4v3E4IKCi/OL06Bg63Bad?=
 =?us-ascii?Q?V2jksjqpTc64lcLV7XnWWa7XhVMaV3P9asRIqEKE32048Eb4wqbOH9/QV1C1?=
 =?us-ascii?Q?aUncU/czyMeessnPDuTqRgSEtVACidswazqH/s/sumb6l0xHT4q4ukOZQz95?=
 =?us-ascii?Q?EKlBEhNbz3G2WnsroLLdg8TMV6EtJQkck2GhdykNsz/UO6x18U8x9B7QwiBm?=
 =?us-ascii?Q?yFYEAGlTrSq/YAv0QpmG1fvo5YJzqFaLOSt43EDNN9ke7i1pTnbUQ3R0oc3S?=
 =?us-ascii?Q?hN6icezWNGMq1RyqqezrRiXU2yUTXU0QaGgekmhlPHwrBQjKsrHE9n1R0BE1?=
 =?us-ascii?Q?ijCHFXS77hygvfurSZ4hLMhGg49xinuiz91bqU1LiiWz/rBUBSAa9CRqheXA?=
 =?us-ascii?Q?ZjFjCG6Mac5IbW4aJy2sh1yIq1fobq41WMCyqQj+oGxkiCFa1s6lBYYeONqg?=
 =?us-ascii?Q?DS8v+xzSV15q1e5c+Tai+Q1r1nB5Mrvt/xWdB4PekVBo9EzMZ9DBQA+0otQC?=
 =?us-ascii?Q?qrn7ZYWkshFWeVBI1dLt0FMA0gBr3jpTdpDTeXxnR9JmcW08OMbEYM3WzwSF?=
 =?us-ascii?Q?BNcz8nqnfjVOOMYNf14ylYdmJwPgVcA/U2lhQPmJG3Tqf8ot/yiknvmL/l3q?=
 =?us-ascii?Q?z0cbES18TeJU6zXTGA7DMmRGTBdGnODPTY9Sik9eF/YdeFEoorqnr7mY+t0H?=
 =?us-ascii?Q?8LYrGEwHT9uA4tDUW+dkjgS0HSMCrjhLBQCEc3VLuD2fODzc4BBdJcaOlawH?=
 =?us-ascii?Q?+MRkGjepkk8cJO7ZU2vIEek7udOGlN11WUNf2j2fohN53uBYtWMK7qhgqH1c?=
 =?us-ascii?Q?c06eqgYQJRIyIFN5DM9UQLdga96b4ThwNldZGv+ZSTiImwLocqMzxyHWv/ya?=
 =?us-ascii?Q?de+5f8Nrvf/WO+PtKfkmzYFUhAhbP+Y5EnFt50QMPqAkyPBD0TboRX5mghJl?=
 =?us-ascii?Q?yYad0LTip+hyPRAz+uHQuOn1mNvsJ2ahL7levxNAWJBuRwD6EK9G01wfU93H?=
 =?us-ascii?Q?wSbruTzv8y4CTRI9sdNlbpRK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e3298f-4a79-4b62-81f7-08d8e4a0890a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:15:42.0138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNhRIXNr8l3GSEVhncZUh2CcJpUO26sLfvL59xAA71STXMWe3u461dmT8GGF3JL3RoPj9J5D4EyP5Xc1DG22unnHuB8/N5ta7xO6owh62Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4407
Received-SPF: pass client-ip=40.107.8.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

inherits_from is used only to restrict recursively adding of block
children to reopen queue. Still, we have public block graph and we are
going to "blockdev" era, when user controls every nobe of block graph.

So, what's wrong in just reopening every child? Moreover, is it correct
to silently skip children hidden by filters from reopen process? We
have BdrvChildClass::inherit_options() to specify how child inherits
options. Why some dynamically created children should not inherit what
they want?

Dropping inherits_from simplifies things a bit, clearing the way for
updating fixing and refactoring of block graph permission update.

Also, inherits_from has some problems:

1. bdrv_unset_inherits_from() is called only from bdrv_unref_child(),
   when it probably should be called from bdrv_replace_child_noperm()
   to cover more cases.

2. bdrv_unset_inherits_from() tries to check that root has two children
   with same child->bs, but it doesn't check that there may be several
   long paths from root to bs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h  |  4 ---
 block.c                    | 72 --------------------------------------
 tests/qemu-iotests/245     | 31 ++++++++++------
 tests/qemu-iotests/245.out |  8 +++--
 4 files changed, 27 insertions(+), 88 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..ae8db04a0a 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -935,10 +935,6 @@ struct BlockDriverState {
     /* operation blockers */
     QLIST_HEAD(, BdrvOpBlocker) op_blockers[BLOCK_OP_TYPE_MAX];
 
-    /* The node that this node inherited default options from (and a reopen on
-     * which can affect this node by changing these defaults). This is always a
-     * parent node of this node. */
-    BlockDriverState *inherits_from;
     QLIST_HEAD(, BdrvChild) children;
     QLIST_HEAD(, BdrvChild) parents;
 
diff --git a/block.c b/block.c
index 815396f460..af4f6095ca 100644
--- a/block.c
+++ b/block.c
@@ -2769,34 +2769,6 @@ void bdrv_root_unref_child(BdrvChild *child)
     bdrv_unref(child_bs);
 }
 
-/**
- * Clear all inherits_from pointers from children and grandchildren of
- * @root that point to @root, where necessary.
- */
-static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
-{
-    BdrvChild *c;
-
-    if (child->bs->inherits_from == root) {
-        /*
-         * Remove inherits_from only when the last reference between root and
-         * child->bs goes away.
-         */
-        QLIST_FOREACH(c, &root->children, next) {
-            if (c != child && c->bs == child->bs) {
-                break;
-            }
-        }
-        if (c == NULL) {
-            child->bs->inherits_from = NULL;
-        }
-    }
-
-    QLIST_FOREACH(c, &child->bs->children, next) {
-        bdrv_unset_inherits_from(root, c);
-    }
-}
-
 /* Callers must ensure that child->frozen is false. */
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 {
@@ -2804,7 +2776,6 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child);
     bdrv_root_unref_child(child);
 }
 
@@ -2819,18 +2790,6 @@ static void bdrv_parent_cb_change_media(BlockDriverState *bs, bool load)
     }
 }
 
-/* Return true if you can reach parent going through child->inherits_from
- * recursively. If parent or child are NULL, return false */
-static bool bdrv_inherits_from_recursive(BlockDriverState *child,
-                                         BlockDriverState *parent)
-{
-    while (child && child != parent) {
-        child = child->inherits_from;
-    }
-
-    return child != NULL;
-}
-
 /*
  * Return the BdrvChildRole for @bs's backing child.  bs->backing is
  * mostly used for COW backing children (role = COW), but also for
@@ -2853,8 +2812,6 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp)
 {
     int ret = 0;
-    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
-        bdrv_inherits_from_recursive(backing_hd, bs);
 
     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
         return -EPERM;
@@ -2881,13 +2838,6 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    /* If backing_hd was already part of bs's backing chain, and
-     * inherits_from pointed recursively to bs then let's update it to
-     * point directly to bs (else it will become NULL). */
-    if (update_inherits_from) {
-        backing_hd->inherits_from = bs;
-    }
-
 out:
     bdrv_refresh_limits(bs, NULL);
 
@@ -3283,7 +3233,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
             parent_is_format = true;
         }
 
-        bs->inherits_from = parent;
         child_class->inherit_options(child_role, parent_is_format,
                                      &flags, options,
                                      parent->open_flags, parent->options);
@@ -3717,13 +3666,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
         QDict *new_child_options = NULL;
         bool child_keep_old = keep_old_opts;
 
-        /* reopen can only change the options of block devices that were
-         * implicitly created and inherited options. For other (referenced)
-         * block devices, a syntax like "backing.foo" results in an error. */
-        if (child->bs->inherits_from != bs) {
-            continue;
-        }
-
         /* Check if the options contain a child reference */
         if (qdict_haskey(options, child->name)) {
             const char *childref = qdict_get_try_str(options, child->name);
@@ -4933,8 +4875,6 @@ void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base)
 int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
                            const char *backing_file_str)
 {
-    BlockDriverState *explicit_top = top;
-    bool update_inherits_from;
     BdrvChild *c;
     Error *local_err = NULL;
     int ret = -EIO;
@@ -4953,14 +4893,6 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         goto exit;
     }
 
-    /* If 'base' recursively inherits from 'top' then we should set
-     * base->inherits_from to top->inherits_from after 'top' and all
-     * other intermediate nodes have been dropped.
-     * If 'top' is an implicit node (e.g. "commit_top") we should skip
-     * it because no one inherits from it. We use explicit_top for that. */
-    explicit_top = bdrv_skip_implicit_filters(explicit_top);
-    update_inherits_from = bdrv_inherits_from_recursive(base, explicit_top);
-
     /* success - we can delete the intermediate states, and link top->base */
     /* TODO Check graph modification op blockers (BLK_PERM_GRAPH_MOD) once
      * we've figured out how they should work. */
@@ -5001,10 +4933,6 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         }
     }
 
-    if (update_inherits_from) {
-        base->inherits_from = explicit_top->inherits_from;
-    }
-
     ret = 0;
 exit:
     bdrv_subtree_drained_end(top);
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index a7c70213dd..9fcb1b144e 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -307,8 +307,9 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(hd_opts(0), {'read-only': True})
         self.check_node_graph(original_graph)
 
-        # The backing file (hd0) is now a reference, we cannot change backing.* anymore
-        self.reopen(opts, {}, "Cannot change the option 'backing.driver'")
+        # The backing file (hd0) is now a reference, buf we can change
+        # backing.* anyway
+        self.reopen(opts, {})
 
         # We can't remove 'hd0' while it's a backing image of 'hd1'
         result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
@@ -899,7 +900,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can't reopen with the original options because there is a filter
         # inserted by stream job above hd1.
         self.reopen(opts, {},
-                    "Cannot change the option 'backing.backing.file.node-name'")
+                    "Option 'bottom' cannot be reset to its default value")
 
         # We can't reopen hd1 to read-only, as block-stream requires it to be
         # read-write
@@ -949,7 +950,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.wait_until_completed(drive = 'commit0')
 
     # Reopen the chain during a block-commit job (from hd1 to hd2)
-    def test_block_commit_2(self):
+    def do_test_block_commit_2(self, detach_hd1):
         # hd2 <- hd1 <- hd0
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
@@ -959,23 +960,33 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         result = self.vm.qmp('block-commit', conv_keys = True, job_id = 'commit0',
                              device = 'hd0', top_node = 'hd1',
-                             auto_finalize = False)
+                             auto_finalize = False, filter_node_name = 'fl')
         self.assert_qmp(result, 'return', {})
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {}, "Cannot change the option 'backing.driver'")
+        self.reopen(opts, {}, "Cannot change 'backing' link from 'fl' to 'hd1'")
 
-        # We can't remove hd1 while the commit job is ongoing
-        opts['backing'] = None
-        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
+        if (detach_hd1):
+            # But nothing wrong in detaching hd1 together with the commit job
+            opts['backing'] = None
+            self.reopen(opts, {})
 
         # hd2 <- hd0
         self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
 
         self.assert_qmp(self.get_node('hd0'), 'ro', False)
         self.assertEqual(self.get_node('hd1'), None)
-        self.assert_qmp(self.get_node('hd2'), 'ro', True)
+        if detach_hd1:
+            self.assertEqual(self.get_node('hd2'), None)
+        else:
+            self.assert_qmp(self.get_node('hd2'), 'ro', True)
+
+    def test_block_commit_2(self):
+        self.do_test_block_commit_2(False)
+
+    def test_block_commit_3(self):
+        self.do_test_block_commit_2(True)
 
     def run_test_iothreads(self, iothread_a, iothread_b, errmsg = None):
         opts = hd_opts(0)
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 4b33dcaf5c..c1fda88f1a 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -2,6 +2,10 @@
 {"return": {}}
 {"data": {"id": "commit0", "type": "commit"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "commit0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"execute": "job-finalize", "arguments": {"id": "commit0"}}
+{"return": {}}
+{"data": {"id": "commit0", "type": "commit"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "commit0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "commit"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"execute": "job-finalize", "arguments": {"id": "stream0"}}
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
@@ -10,8 +14,8 @@
 {"return": {}}
 {"data": {"id": "stream0", "type": "stream"}, "event": "BLOCK_JOB_PENDING", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"data": {"device": "stream0", "len": 3145728, "offset": 3145728, "speed": 0, "type": "stream"}, "event": "BLOCK_JOB_COMPLETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-.....................
+......................
 ----------------------------------------------------------------------
-Ran 21 tests
+Ran 22 tests
 
 OK
-- 
2.29.2


