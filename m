Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F733F3D7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:09:42 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXnp-0006XA-Gs
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXII-0005Kr-5a; Wed, 17 Mar 2021 10:37:06 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIG-0006nM-9d; Wed, 17 Mar 2021 10:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0r2I5l6r8YmZZ2XjhqSz+qldZAdLi91qAbPBklwhAWNxso7Yw1nFqBFg9du1G2W2V1F7Eenv82RzyAoh/TfO6UTJVBr+QaE0jvg9D2TwFMsI8JPplyN97zNhv2DwBq2W5z26Sa4Eu1lHEBLr8YOJMn1W8ywUXYeQ2lHtgH9f/qhsodYQ3otKkSbZO+mENdCOIj2FRcLEpL87Y0cUxzFzzgSy6MaieHUM9DHBHCG5a+DHDotDvdxDpeCpGx7kfaSkvwcDOuz13BVwoCIlC5IOnoTrySvVAkGAPCJENrFoZCrY90l8GxQ8cKohFdhlU2RkGhsbSluhmOc7nJooL1zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfBN9zlcEJiO23kCGmefPkHek9TaUiKpEyCluBpdysk=;
 b=fKHEQBpgTh/6cKY9MeRt55dyD16nxW9TP4YL3gHX5AAy7bFLHN7jCtinoz1Ed3RxZtIcBeyKUG39G/bvGumpK8NCTUL0pmw4AlNu1XVcWONebQsFEOzbuVC4pCBZQPQ+Gn7XDC3lue0Pk1+K4xiLLrDcOYnF3XB1ia4lLRdOcfe6CZdWJzq1rJWgXHWrPzxxm+WMQEFQ/4gbDbSEL+HACcnn7I07AH8KF67NvMl/m1yD2mXGGY2ptAOPFBvBEAkTydDl+oUl3fUIj6NBILKOAHNNXavZPE1KhZr5//SJyJ8WpLFVXDNOCL2wDMuDFif0+uwyGojPMff1AGZQuGbjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfBN9zlcEJiO23kCGmefPkHek9TaUiKpEyCluBpdysk=;
 b=m5FOG0LL/lRCiNZgdLVN5iMCH5NiNVqbhN5TJgLc7lgfTBBUaXmuTYdPwUifHPH2oV08CU7D4KrTLsMdAMJjzUTXotNubouli6jOiyZMGIlvh2mxU3SLi0wukJR8/MVsX5BBDYPbcbkbXHaYIBrPlywJyxZgbCyuwDiatMWPUkM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 16/36] block: add bdrv_replace_child_safe() transaction
 action
Date: Wed, 17 Mar 2021 17:35:09 +0300
Message-Id: <20210317143529.615584-17-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaa3d4c9-d3e8-41b2-cc01-08d8e9520b7b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650511F61A14960F9518F73C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wk1c3GYnkJFrj2fHypDG5nHaBl/zNEs5U/jRyp83GeDjdvzR2gKohR3rbn4QWariCfz+Uq0pelXQUPqRJcEmrJhkwi474SfX4q7XZUEETaYPOeX517Mn70Gt52X9TQpUy2ZCYp2p09+RV7bjaWX98htqKuyuZhcw3eTjjMgw2X4z+75Kq/rjqfG5FTBHel86Sgg/jYEaqZ27LixaWyMx0/iFroheJ6F4r58TAZy6drrkx0mMH8YhiejdhENWwiqjpUyf26lCWvqOpvcMcEImJMRlRtnw3ZFLMwhi7bqZ0sv5dKfCBOsbIz7XyfcpZTJ+iGBM2bKWX0WaU/N75bblPBxtrFm/TR2k4HRQf13sCOVOCEwyxxwcVRgA+vCSZJo6vUZrV07hKpkVpc1Pk7l4n2o9f4qsCuVMYBcP0oVpoe5EOGKzMu4kxGLsY4NFxfBCkTkU6q23S0UwqGz7EwRcnK4mp8HGiXdLo8koeoQidL5N5dB5Qkuxoan+Z2bmRRvCZzJskCCJaFpXlx8FPbVpXm+7ilBGCOZWY18rOkWqDt5dAx6WprvkAXTRr3fCFqLNmtA/2N4Ke6MC5K366L1QdgMF34k0oIm009ohE4ZQyN4qzOtcVcYpTXFosz0ne9AT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(69590400012)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?63pYaRU18+aZLI4ZNSlr1GdM0de0dUv/wuKzMSKOLD+Sjw23SlxymTZ7Bvc+?=
 =?us-ascii?Q?bNlkyrTzRTRUe9TnYMw4jWhM+uUg4ywchUNa/S7MNmlx4P+/LWfejG9k2xY/?=
 =?us-ascii?Q?UGZ4hhqUtye31KncoHPlMitwrIm4E3A5wtg+rVZQfX7waoXFFbQh2ckHLBE8?=
 =?us-ascii?Q?lCDi3KlTeuvuExGpTfgrizpElAJm9vuat7NixFybInOw9xBVwDNqIHgbxVQk?=
 =?us-ascii?Q?KtBUMoyW6YUtj2hn+n+l100NiEjKLY/JPNxAb2wKEqI3fgzZfbXUQ9p6Mhxh?=
 =?us-ascii?Q?r2SaM87ULj0ViTrSeanIJfaXBPG3AChGWE9/Ww3zi0q8abUB4+cEPu3fX6w5?=
 =?us-ascii?Q?HbnSV6fKCyDIO3OoacxSLFcZQWpvpXmhIoQk0MaRexo4mJgZDMzR3uMAjWYl?=
 =?us-ascii?Q?nPakzJat6nCT5lawhkbyzEz+MQvkDy4SYrsLqHmRf3g4xAcTYkIsDe9ZOAX1?=
 =?us-ascii?Q?hPrA9HsbobECQDYWOecbryWb60NTiactiEs19SVeaNDTiTNhKmudpyxnODB/?=
 =?us-ascii?Q?QHjGD+4G8WX+MVuBMjuBHYoMkrjaqWpBJ5SgHlvlPvR4pXPu3jtFQadbGLYD?=
 =?us-ascii?Q?1HyrM4ivnZsB1SU98byWzDTxS98M91zOZwKos/dA9VR2l6EdAs3TvOzNj29l?=
 =?us-ascii?Q?tSoZjoEgumespHfXSEpA80HK11DVLUJKRQ5jhy4DQu3BnJboRTbiR//Yd2dp?=
 =?us-ascii?Q?/4eImVVQRNkOE1Jluhd+a6IQm0ypWIxI5Xo9wJb9328ydodiIqRZFZisdXEW?=
 =?us-ascii?Q?2v18AMvlpfz7EnjNkmJKSisKExo3wewZBgtcDyjuLSmp64LkwZC53nlrROdX?=
 =?us-ascii?Q?G6wUPJhSYQptx5ZcKrB3mluYl2UiEUP7uBDucnh6gCj0wzkVxigW8wYWie8x?=
 =?us-ascii?Q?B39zaThbE2J5Lr0FAJJOb3DggWQlHp0drND7AI+XVJoZI/OqHEnygUZJ4vzt?=
 =?us-ascii?Q?QakEzhZ/xKjDJnXqWXuIdp3jq94DcyFDcFwX6oXUVDoSUWXK72J3PEmtOBWo?=
 =?us-ascii?Q?QZQoPpDVuDZ/ji8F6M/NYZsDp1VoNSSCrVAvtvhbubhyFtDx04jN8GbBsHyj?=
 =?us-ascii?Q?Xo7WCzfoUKfjC5eyJICg6760rrLqxTW7YoaJO6ldcMkXUqwuLk0LK4teRTNm?=
 =?us-ascii?Q?HaOyt7DDP5VuWckYLOtI0dvgdBf6akuZotrrye+cvDCDrlsgcIg1jgJjFSmS?=
 =?us-ascii?Q?MLIYHjksqXVc3Pd9NPCo8QkIGfw8pgzBkCHY/b9uyFSNJbzHSYJAoQNb9hnw?=
 =?us-ascii?Q?Bxdf/xtL7N3qbs7WuuCId2G0VtsHfCReGIb3atzE0NRqO0hhh71bH1IgdkeO?=
 =?us-ascii?Q?VGZv3wxZGUzCXNiYMF/XvfeA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa3d4c9-d3e8-41b2-cc01-08d8e9520b7b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:26.4567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0Ltekhu8rcdXTf2q6OzIlmyDufC2O8G27g2sUb+LHkEmSqf18jovYy9K44WFSIf54dvX2eTQA42tPSv0h/jk7rAgvTqy5CSI+CwgvCQuwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/block.c b/block.c
index 31a4e4fa5c..4f9d67a6a2 100644
--- a/block.c
+++ b/block.c
@@ -83,6 +83,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static void bdrv_replace_child_noperm(BdrvChild *child,
+                                      BlockDriverState *new_bs);
+
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
@@ -2203,6 +2206,57 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
     return 0;
 }
 
+typedef struct BdrvReplaceChildState {
+    BdrvChild *child;
+    BlockDriverState *old_bs;
+} BdrvReplaceChildState;
+
+static void bdrv_replace_child_commit(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+
+    bdrv_unref(s->old_bs);
+}
+
+static void bdrv_replace_child_abort(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+    BlockDriverState *new_bs = s->child->bs;
+
+    /* old_bs reference is transparently moved from @s to @s->child */
+    bdrv_replace_child_noperm(s->child, s->old_bs);
+    bdrv_unref(new_bs);
+}
+
+static TransactionActionDrv bdrv_replace_child_drv = {
+    .commit = bdrv_replace_child_commit,
+    .abort = bdrv_replace_child_abort,
+    .clean = g_free,
+};
+
+/*
+ * bdrv_replace_child_safe
+ *
+ * Note: real unref of old_bs is done only on commit.
+ */
+__attribute__((unused))
+static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
+{
+    BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+    *s = (BdrvReplaceChildState) {
+        .child = child,
+        .old_bs = child->bs,
+    };
+    tran_add(tran, &bdrv_replace_child_drv, s);
+
+    if (new_bs) {
+        bdrv_ref(new_bs);
+    }
+    bdrv_replace_child_noperm(child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
-- 
2.29.2


