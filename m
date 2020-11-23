Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CE2C158E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:24:33 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIO0-0005gT-Cf
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID4-0004Lm-IW; Mon, 23 Nov 2020 15:13:14 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID2-0007NS-OS; Mon, 23 Nov 2020 15:13:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyEPCMuDVaLWo7+djTxC1UtnLtA3Jma2VGOEn4rJCfYkswYWzJCftNDO6/woNwPhkxyOrCjTm2P04noZ+2ytsElm23s7bULppXBb1fTt0yHUoqKawcgxhAFzi/sxMdYfKP79uaFwbOTYTo8L8xv5TTOovybNS/WNk1UADcGsvgtQF30LoQ5tUSmlsn/4dST6ESPxHCW8p4O1K5IRNaRGI+YBpRuYhjYAKNRA8MNB78cT+7DN1pIp/iWxRSAusbSolAAbH+vqBunWXiaM+REdaVqjjP+UFdISDeWeO7YlrNLv5u7pVGG/gw2aBs8NDA+jwIi3caryRfN2psPFsmNyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNCoRhP8oEjzRjd+MYxnTX2/tsj4+lJZEDxvlWAojfA=;
 b=O0OArckP/NGuR0aZtM7zloBy2N0uGglTwsNONkbM2J5+rMavTDH+Mfm8R86O9uo2jHa5XybW0+7UHgPGT89/IeFGpMMAdKkBTn42wv7X2yJVh/ZusbjDtRGsl4YgBXgjvC5X/BOABn7utP6U0XeFac0UNQrsROZ/9yxUXQtP9ov1itSpLTPhYIXSQDcGlyAB0ntxjkUEJ3wK9KrfmOgMgsTc+9caedljtaujYmYegop1DIbJSovdYuO1mWGcKa+sGrx0fT8hbKeNWnMeahIiYiThgAlhkX1HoPSTsUMS9lIh4SNUfoE2V/LsEwKo/g5nDfyakzDBevdc/G1hevCc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNCoRhP8oEjzRjd+MYxnTX2/tsj4+lJZEDxvlWAojfA=;
 b=W8DGfarrb1cy+NfoO2zVODwGXoliNrvCKE3pC8oaX58rEaqn/O0fFebCiNN5DAOnqPxIGIaJHHY8HOozR71n97OHQUVCwBiiYTCfBQ2gQ3/ymixqgym0+tGMYF1U86wjBjkyn0WdoMH75uDsx4FfFy/y83Ap7G1EsSTZU31dmUY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 11/21] block: add bdrv_replace_child_safe() transaction action
Date: Mon, 23 Nov 2020 23:12:23 +0300
Message-Id: <20201123201233.9534-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74f7318-4cd3-4150-1f8b-08d88fec2d33
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46904EEBD4DB6FD2DE6A5AD0C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bmT4JpcOg3Uw6sycOIrO5ahnSs/QRj7EDsVwj3eAyGkeADOakVufmIiFqT3QMczrsIEWOZi4uZqeiKdWSxIlk8x2dBhzqaY3dfRAqEPHNY1hfVOn928bmb3sTHg7PZHEnXTPtTe0EqzzsrPLgJx1euKB4qoGzNc+8e6tRNw2N+d1E+U9PPyFVtlPyU5J8IrIwzUjYak4kCXRbJ2QFsnSSU9O+g3hL0n+wBfvoa7RZXAFGwwURZDFGIYOz0DlYF3FYnPSFLuKLWMlXgE8PLNMyCjrk/vzH9M4OxuhInf4nJelYD+0pThIVNiipECTqrpl5Pw3khX5Z5b90qXX0AEryw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 7OJ+Zs3iM+vmruzh+1+nfszgD6ONLpo5+IbhUTmJDCB2h642atBscNqefCNIE1nxjyC1QOs/03iPhIi5s7nnVtb/l5NgatICeJvUmmKOAwV4qEpJzBwwysb6DmzNdDGZRwPDDHH9CouQaSNVzdrYyAGkdDCeyYsmduXw4GJFmxRmG+Y0DsTNn3dQYAA3NbfOGeo5zdp3ywxFMrLIq5ZrfWPf3V+twZVSb5neDBO0Z2iaYzM7kxU6F7hVmwNNo+7N+PblacEhiD50k+ZHx60p8tFdPjndRtHGQsLgbkAhgsNZTADT6mYwkhcBRNfjl5jcB0J0tpBxdZgFlGhO+cIJt+50hREpsToT1N+mToNHfULjnjN3b6Tk4AlNPszqALzGbuEJjKStGw0B5oSzLY52Qz9/kZ8rJeFk81K9WPAoVz0pNdT8EaI4xmhbv/9S/8UI5icQ86SH5hjG5cGzyHFOYH+PN1BEt8uFjnDRTfwAD0MQ3rF7Pk31ueMvjr5LqsR4bvTebcz/2QcVY0A+fZvukJQRRW6S3d0ZLAGYMRYmmQxjQij+ylTgvjDH55IlO2XB8fxX0Oi04YmQ8p4qDnteeexP70XYJhNMZ8niBZ5/zYYB8VbVw3ha1D2204uzJGpDFhPuC9dzkFw626vD0yUZPJD95VzBDxwyy6d/nbmEP/l1iGIhvtArFRblgCem5O3gbaZXfqawohIUSvj6txfqNXIXojGNKwN+cBhs5wQWi+Rwr7Q3FFRVmY94CNtcPccRUHwzc1Fikr3uafAzAHyMNTh7ATIT2sMh8fa+JgSFvJjR/rj0uLb+Wt6IQGQriYBXTMcuxGDfHqpQcPep5QNXzB2g5HFT4/Kdmtk1Ny8/zaWjmgf+Xh98PNW+SEr2JLdwYCNCq7zmRlMU1oelh+IgLA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74f7318-4cd3-4150-1f8b-08d88fec2d33
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:00.8434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBXb7KF6uHrJ70f+fQfTKgaP3M0BDB1ZHN698Uzxr7smIPCSiR3ntrFUBpMJWQYhEbod6PetSsgxBic3SJa+eXmcIR10FRquBICxQB4Ss7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/block.c b/block.c
index d799afeedd..1b10b6fb5e 100644
--- a/block.c
+++ b/block.c
@@ -82,6 +82,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static void bdrv_replace_child_noperm(BdrvChild *child,
+                                      BlockDriverState *new_bs);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -2142,6 +2145,57 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
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
+static BdrvActionDrv bdrv_replace_child_drv = {
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
+                                    GSList **tran)
+{
+    BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+    *s = (BdrvReplaceChildState) {
+        .child = child,
+        .old_bs = child->bs,
+    };
+    tran_prepend(tran, &bdrv_replace_child_drv, s);
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
2.21.3


