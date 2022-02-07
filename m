Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1F4AC7ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:50:50 +0100 (CET)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8A5-0005JE-4l
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71X-0001vj-PB; Mon, 07 Feb 2022 11:37:58 -0500
Received: from [2a01:111:f400:7e1b::708] (port=37729
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71T-0005HI-PS; Mon, 07 Feb 2022 11:37:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duumjSqhp1sHb2kGrm8wDbknwnrOqn8n37m4SZeq3fHgrdMMnC7yF3rgSExH+5xs3XvL7Kc5ajgt+yKBu/QB0i3G3VOIDt8XGiON77xC1IOgBB2XDp7GhMpaO/uMvF0WqJA6L9ub89xTULyvxFinmwJzk+n3hZ3bCd6v7RSoJamQspDrm5eRFTBw5aAwijZxHDdpy79CYJgfyJVWPweAwrz+sOODCkpLE0PhRACcG1IMsgnH0vvizUzBTp+2lG4kpcLTYaOV2mizSuXJgvPzVa2UcE/K6X1umqePnzbxs5JbQH0ho3IBIvwTii+4RbL5DF5NUvbZFqbRX36Gnf/ovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBf9Wv2yMBcKq8er3VGGXeluEAn9O2+bmsEL+pVKm+4=;
 b=ftdX8nqwBqGAU95rrCOX5p5nvVqso1c2jB6tWYc47cdXTf+sLLp2ln+IWUyNALjSkjqtTU1ylrU3zkRRvkxD79CB+oxf1/aeflev/wWe/7HZKr2ztWV5vd6ZJp0wIgd08i9i/uTHKL89LRhERlfNIBT9sbkV8PopGc84Yh1IaeqmGPJkS3S0fU6Wn+N9xapHCN8vJ2NiKkmM1+DfRvyaimut0NA0uCrLOF6lk73oUVt3XfmoeJx0nJO7II21BPSgRgcyakLS+0jLjaD+LacQGWkAUH4vt1a60j2S0vB/MtNGp7Dbg4G3yeI4wWh8vLlH+z6PKaH0pQgfYzUCfvaBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBf9Wv2yMBcKq8er3VGGXeluEAn9O2+bmsEL+pVKm+4=;
 b=tGdGtjz3cj/TBcLQGDkWauGcoNA4F3rcMukhn/ERPM2IU/P7U//wH0VMtLcrGRT/g43V+UX5AkhV778acpB+s1bsGgmXCeHaNcQdFkbdhpzBU8hwVu5hTwpBz254y1drRlaBTrFseKnOrjmXafi1i0ca6ZnIaK9+5GbPa0p3wDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 05/14] block: merge bdrv_delete and bdrv_close
Date: Mon,  7 Feb 2022 17:37:19 +0100
Message-Id: <20220207163728.30362-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfa54af-e0f1-48ce-00a3-08d9ea58282c
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288126C0118CAB031FBB6E6C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:245;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jgpaCF7naCPGMogWEEXsdkeh5mIeY6weWSPQPFcymVQ+4AgwDytKjVzmXyH2XfYSncgU2K/CJnluDUsUvLA435Xt8IzHvi7Z/1og8J+rsZNG3/RQ7lKBzyKOrFYFve5X5k3e7mPrrEj/Wnss9KSLmnQuEb1JN3eUfqEYHYuoUvYNy0HFbm5zN/gOQ63Z/5UlkvwWfeGsMCblGNVzXDimK/tEhewzntXnNaj/U/cIqkwevW6ch1eMd4NIoHQ8dOPtroBUbJFjKNJiYYqlDvFTAx+Y2Oz3AEvfNx9ZLN/yM5q9oSHi1ig6OB0RkmVv9Dlrpwqh2vPCx7Q6ZZAKwoj/cQqQIbLNW468aX5KzFwCqB93nExwcD/M+QHpVBV8rWMjUtV79YTr/JTI3hsoq4HcPsLWaLGz569E9u3OEKH/yBhUNxPg2oZq/OVlelr2l9O7CslLQtJhGiFk9YlNiJdTOD+kFKLDfMTFoZLVjFk1fBxQBmkOPQC/AeSy3RoFQud0bLUmkjRgu8XvsUDTEJdRzzmEoj8XqYm2/a8B9DJgG1QLuLJEgf2tnVFoaaYebuSc5BJPVtZd5RuLd7MzQCy7liIc35FHzgek8yJluXA3CHMU4Y1APnPzTdeR7lrDrAEkO2IGv7hr00bhdNrsJ9BOPk8hrA8pV3q/06GSUmnBfpveKNSzbsbK/tvp/OXhalKk6gXgd2Gq5LCyuZS5iA1fZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2BbtW4OqRu8MURJx0oQBWq8CcawPbtdgzK2FMI0wAbIAbOO4rcuxI/yhMDN?=
 =?us-ascii?Q?KzVgHrv8ddF/EcXPY7G34FoTCbUV5sd+NBUbo14ctNOGQfydWJxrSY+SqRLI?=
 =?us-ascii?Q?C7cZzFkT9Y2zl2Sh3Sk+vWB4v97UNrw7+YXkbIM2Vk+Al3XmSU/17Kr9sNP/?=
 =?us-ascii?Q?lIkq2v8RDVdh+iS2IRtdcVViwJiiisI43rhkAZzUyJV3+Hi+wklh6F8cQ7AL?=
 =?us-ascii?Q?0R5rCQTGcV9ef7r1YOzhju7P88pt6xOBlNM7jaFi+Xh88LihpUBmZjnDXTV9?=
 =?us-ascii?Q?P7DkWLwECC0VBbGuCnEx4anjqZLdDLD2ZnuSQ4ONqKySgj/U+Z8Zn2f2qaYe?=
 =?us-ascii?Q?STBOioMkNKshmEVk+8nYUDNqOTMgsnafLszC/knxYCjUkTHfmhthG9pv7iDk?=
 =?us-ascii?Q?bCPNboDJ0n4O3uaY3CAjWT6RrDipyeaqLOcrKi3WwswRISzhc7XDzRU6UgQL?=
 =?us-ascii?Q?4bRg5oeqyQRnzZ/77ua0e6530pkP3ZOD0pkZ0qRBLL+DhmUBzwZh97pAxHlP?=
 =?us-ascii?Q?mGXmUs9yt8IJYxN7Z73HXgIuSXkZqIOYkKyqAXP1S6PFT5JdMfP0AdAbQChL?=
 =?us-ascii?Q?aPPTLkTUAskbSTvpt81RNSQlNIF6ysAo3itmYXr8Bh2Bl+nRyPi1HZ9z4i+W?=
 =?us-ascii?Q?DsMDtzn/j4VZHNDHz8GgGoKcbstLzJ9nWLEr1GL1137T9UFrxn3BuEIbllai?=
 =?us-ascii?Q?CLvP8iL0lYo2YeJUGGihyvJAvDjBzkWqCvUJunbir7u+xwlZlqulxNrqpXVh?=
 =?us-ascii?Q?SAbutCLwYgS0t82jZKrCCSW4NKH5uICQwlGLo0jDigsPrpGRSdWsTFzmz1DE?=
 =?us-ascii?Q?T4pU2lIhIYsHOrIE4oVolgj5yU7HXQX7OF2tehe8MDDamVxG/xBB/eTDFOr9?=
 =?us-ascii?Q?hY6uY8c1qWDAvIh4bocV1PuGwri7aadl5lkxJBGhTKIgLb8mvk8amguZlXbH?=
 =?us-ascii?Q?690FsmyLTDE8RemYuUFQwZBz7kLx3ytho5PPUHklPFbn2pAuCsSeWKJ6OliZ?=
 =?us-ascii?Q?vg9FF3RxS8npBa4c43z923aUa8mS1KR/9Kp45Ufcl1/kF2hN94FCIRFL0x/J?=
 =?us-ascii?Q?W24x6dbPljqkjC2qnMr1ZXCTbpmdEyi7WFTLL6F0g8LAvqUAtQ3Div6hjuNp?=
 =?us-ascii?Q?/tVIZlh8TxlQaeCz/x4GCvCXcrl8EOhDecHb8kCNb7a9eJdLbD4CmC50Q9sx?=
 =?us-ascii?Q?dSIo7evdqUrD28cot4J7d43GllYziUqvyJyRdyCGP4w2pfmSPLveUHW1XLlI?=
 =?us-ascii?Q?ifXPdI/BWSKJy89m3HuGHqG6sRIp/EVrAp6CMJOqvksfP7R6bpxAJXXX38PY?=
 =?us-ascii?Q?WQuGlOp8GlOlb+FvfFwYb3uljJFbAvdX3jEsRYic6T7X6ymEjJmQjLfg1S+S?=
 =?us-ascii?Q?XrbZPWKUzhrgkIK6R31ZVYzZHyGZCR+FgOkztMTgLgYM9QQKA4hg5dgfPNLx?=
 =?us-ascii?Q?A5Mbo5v8nhIZV2dXlVApypoYYFnz6CHUrzpObDgx24wABdqOanG3S3xOmwSf?=
 =?us-ascii?Q?a7CAaBOGa3FwH/Mg+bpKr8zEwSfahi/eqG7PJtZTlsVQCaYz7imdDXaGVDD3?=
 =?us-ascii?Q?TIjsAsVlHMVmYtvakrwSHhtJPwSUTzi57MlOD2E8cI81jeVhotVB74jUW/Q6?=
 =?us-ascii?Q?wrPuJRl5b7mZDwYRWroXLZcJ3SwrKr3GKLgFBwA9ms+2ReOi7MZBta8r4NC9?=
 =?us-ascii?Q?1FHatw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfa54af-e0f1-48ce-00a3-08d9ea58282c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:40.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jjTs2BeCSZ/0/3+VK9xzZsGxlc2HEKftuhWGyOMAysZ4UIGXlrUHtiWtzSEyWrvgkf/LCQEkWktPN6UbkbhIgI7GZ78SG73dfPh+14cTAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

bdrv_delete() is the only caller of bdrv_close(). Let's merge them to
simplify further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 82fbf81a3c..71a5aec24c 100644
--- a/block.c
+++ b/block.c
@@ -4785,12 +4785,19 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
 }
 
 
-static void bdrv_close(BlockDriverState *bs)
+static void bdrv_delete(BlockDriverState *bs)
 {
     BdrvAioNotifier *ban, *ban_next;
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    assert(bdrv_op_blocker_is_empty(bs));
+
+    /* remove from list, if necessary */
+    if (bs->node_name[0] != '\0') {
+        QTAILQ_REMOVE(&graph_bdrv_states, bs, node_list);
+    }
+    QTAILQ_REMOVE(&all_bdrv_states, bs, bs_list);
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -4844,6 +4851,8 @@ static void bdrv_close(BlockDriverState *bs)
     if (bs->quiesce_counter) {
         bdrv_drain_all_end_quiesce(bs);
     }
+
+    g_free(bs);
 }
 
 void bdrv_close_all(void)
@@ -5164,22 +5173,6 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     return ret;
 }
 
-static void bdrv_delete(BlockDriverState *bs)
-{
-    assert(bdrv_op_blocker_is_empty(bs));
-    assert(!bs->refcnt);
-
-    /* remove from list, if necessary */
-    if (bs->node_name[0] != '\0') {
-        QTAILQ_REMOVE(&graph_bdrv_states, bs, node_list);
-    }
-    QTAILQ_REMOVE(&all_bdrv_states, bs, bs_list);
-
-    bdrv_close(bs);
-
-    g_free(bs);
-}
-
 
 /*
  * Replace @bs by newly created block node.
-- 
2.31.1


