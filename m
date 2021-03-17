Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508B33F3B9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:53:56 +0100 (CET)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXYZ-0006pX-8P
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHr-0004oR-Hh; Wed, 17 Mar 2021 10:36:39 -0400
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:41454 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHo-0006rZ-65; Wed, 17 Mar 2021 10:36:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbmO1tQky85fglB66Y4qUr2y6iJOpoEN7v45mh1ybCeae7geDy4iYB/sre0zpb0YpzMRjARdxwlJZwVf9r82KCps2ZJynBOwdF8/FkZD5PZvXMEAXyMWBPoTetZfxVF/W6ViXm7Py0oLXHK8SZh8d3D2vevfYgX8EJW+R+u5Gevh0tS9fguu5lCqirEENyqpciy/W8HIQSBIuIIQRbyyGSS/+hWorqYSUVw324h0tVrsWbWOvo0OnohPhIE8FzlHMmgnvDsEYEP0Bcq/zCw+bt5XEOsCXuvNcfyzZSuNoXPV+3/2VP4sjrDpKSGTRWaBAdPTon2T4rka9P9Uyonteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GewYM4sInAfDMBRFy9lpG6jxNuxss/XPzy7M68ezJfk=;
 b=IpN3yTbuiMpeMbwAPWwWoeKFSGx/FAejsjsR+RO3pSF0bMujAwUaXBHMIWrfGr1SUTvVO8mZ6eco+gbIMmI9WUYb7tnSjULT0u/rkdIao4wKv25U8g8E+ce7evyAaU8pL+Json53Yxv110XaGM0PRC1l4iDmsrA3ZUpU/hNSFcjU/PB9EaEehtrKF+vUyeFBOM6/wFNDKCSbqIC6s4zVvAzlcuAuYILVUToGAPuriZKyKuHKDe5qaO6iyorYNKD+brhsa+ew2+joJhLowXe26FHGIrMio9QalAG0WlCwcjTdMqFw5VkApk6DIR4dE4eFskvWl9B2SpbAWIp6BfUhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GewYM4sInAfDMBRFy9lpG6jxNuxss/XPzy7M68ezJfk=;
 b=HgaCZcPEGLKtGXSJSDIyqpRmr5j4rjcNO/rSlt+Suidb76gvrI1p1GUCH87t0GswfjCy7IWYmQhdH2O9a9CAahZHY+qX2jW4Fwa+YPoNuWRzX8KAH5hCC8nH/6wqmpcUUpAmQj6vetqW99Enxq72lKGI17+7+PTmEH0yQn4AoG4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 19/36] block: add bdrv_attach_child_noperm() transaction
 action
Date: Wed, 17 Mar 2021 17:35:12 +0300
Message-Id: <20210317143529.615584-20-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 354f7a49-b4ae-43cf-5bec-08d8e9520dfd
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35449993CB67BE4B9FE2DA31C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /E0jvTsdtwqZqQ9AVGjKQhvneoL3zGC+hFWFsAQsyspchXJCyjE002TOHkaoz59YICg4o5huPd8k4Z7TC9mKeFwv4t1nC9nITKtxG5xmZtOnVezTpef9XBTg8kD+T+YHJGAk9yp4Otnhp27bA6jrt1rRV19KPHqnRIQKDXZM7Ad+pCHH9lpKxm2guBh8Z17VuviQe4EbhLiiRzkErPLeF6C7/C2+r5JZw88fQ9Oj7azef//5tekmApE3LfsmdL1uQem3TJ3bZDpocKFT+FJcIPn0ScQjeG2yWg6sKKO0Jsnh6oWAgu1iRwpQRhIi0XHlfgTo7qJIhb1xtAHlykutzAwFJ91TAqZQL9HqzSzCfD/YBd8sQDS6qz/MBDPg9wnbTX/xZEZPtBTqxZmhnKleX9GVk0JPCeEVmfp4TX+RM1Jqh2Xm+VJKw2L9lKznorjzXgoNG60rpC0aq4GwUncr5D7JneAlkvFV65kJMetD7jeCE3zjjUpsWUzUiFwocEHd8z/Flz7iW3x0nUHb5kdgiYkiry/2rS1ggMv9ESSl0/hzsSsLF81GZ+7T/3kPRKcfevJw7uaZpobwFU97U37VCLi5CnJnQyVCz62kdGCux5vWRyD3crlLrzi99wyeu2TG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FsnDgu5fDAzBU0VLe/Kun7EYHWDt7TX/GbJy2ijE2NLMwsBN5SVwAbRN81AO?=
 =?us-ascii?Q?dYclcsAFnKRUrrLo7nhnWWvm869We0HPegC3aVGzwaYhMu64HKDgfgAVRExI?=
 =?us-ascii?Q?gIVw5F4piVJaCjlGCOsQ3RKgYrIRkfznCSjSzpHvzXQrXy8WjnW3XgLhi13L?=
 =?us-ascii?Q?TgVn26B26IOMtbB08pkyPwqKMorMj03pvtM6pfQiZIm+kzxCGyq6IEVKGzQC?=
 =?us-ascii?Q?bNUMn3Ccz+JqRx3VZjMuWvAcmNgd3mVDFo4TVugm0ojT2ePpJXBVRRsmWelI?=
 =?us-ascii?Q?8FwVaoevsRN3pzstxYE9lFdNVj7lYLZihMvFEEoVYeCgy0VokTeH3FwfrXCM?=
 =?us-ascii?Q?4a52FEb+YYEcicJ4ZLGqqlQWKxpd5w0ezAzG8Dqm4IywFUz3yhf5o4C2mgrb?=
 =?us-ascii?Q?8gNo3PEb+d4hDMAj2XZ1PFA7A/PW/UIo3XPlUz6yeIb9+PCszljCci5c6z8T?=
 =?us-ascii?Q?IspUUOL/+bAefa3kxCJku2X385ynJr4dWW+6N1V+pezdPeE5ZZbXY58M+Xgq?=
 =?us-ascii?Q?sLxBon3xnAQK3MEQ4rSKHhmq/rwX/XSjnB1F4El7olgCX1v/B/OUsRr7pfE+?=
 =?us-ascii?Q?SY387q266sjV1Ikg6X8qs3bDvp95XzEA06pGFVGBbt2IUfo/z9bXuvTqwW4Q?=
 =?us-ascii?Q?p7Bf035FX+Lw8k+FD1YKlXyEK9WIm53od2Kn0HijxN27SN1cfWT3PHmNYm2h?=
 =?us-ascii?Q?mdfGl2OC7RYfOFBqWht/UWcR9MW3fxbxiTc6zLnxlRlvcZgeQpKihQR8O4b4?=
 =?us-ascii?Q?/sHQ90TW/aRHuse4hWUMlzpJJ0Gu+y1TiVjD74PBNx7gMUTL7JU9WYpiOMib?=
 =?us-ascii?Q?yCjPtgwDcr3juya8kWHbNf9kyfcU0chGKaYBCq5gQpmGqs5azQenbTn+Jxoo?=
 =?us-ascii?Q?2r6h4cjH1Mw7DplbmLmT0MsB/q15/rmea57OPP+z/OgvgiIg76tgcpdqRhOm?=
 =?us-ascii?Q?9b/07BBm336vqZqLAS7WOod3lKjV2HxhAhC2iZwkp4lzxKdRxAOsI58kDioG?=
 =?us-ascii?Q?megnajdTJf1lTg35fnwO8xL2OZGrJtMhdeAgNNTnw6ALpeGqSq9g7cJT7UjQ?=
 =?us-ascii?Q?cxzEFnqjLz5aBQEmg8Vx5GqF2ef/llmk5AOOId4mg6KdpY1o0SjTI803q8vJ?=
 =?us-ascii?Q?ipT7pGtxiCd+ENUD3wO4p6ftYrInbyatyRTE4RfXvUJ0QCO5S4H2Hjq8XHMQ?=
 =?us-ascii?Q?cGVsstnt4bxxUiMkX0yRMzS5dGoAaVVfxVDBpr0CYxb9M5N1Q4xpPUyogrZm?=
 =?us-ascii?Q?BfKSgvITRejEld1ENDwFYgFu6nNob5840VeMl+VHL/PtzbWYKOBMAB4A/cih?=
 =?us-ascii?Q?ZlKbIoE1O4OKR1xpJle2RcB7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354f7a49-b4ae-43cf-5bec-08d8e9520dfd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:30.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD/QfRlPpGfCrSNKertN41bmdG0baNH4F44qYKmdNdYZavy0YYCdRwyelc4kErAoz9dMIKH7dEvoPtlAYwDtkmK/F1+ZWo+rA/6ntxyFXcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Split no-perm part of bdrv_attach_child as separate transaction action.
It will be used in later commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index b6bdc534d2..d810915684 100644
--- a/block.c
+++ b/block.c
@@ -85,6 +85,14 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3044,6 +3052,40 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                    BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    BdrvChild **child,
+                                    Transaction *tran,
+                                    Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    assert(parent_bs->drv);
+
+    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
+                    perm, shared_perm, &perm, &shared_perm);
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, parent_bs,
+                                   child, tran, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
+    /*
+     * child is removed in bdrv_attach_child_common_abort(), so don't care to
+     * abort this change separately.
+     */
+
+    return 0;
+}
+
 static void bdrv_detach_child(BdrvChild *child)
 {
     bdrv_replace_child(child, NULL);
@@ -3104,23 +3146,26 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BdrvChildRole child_role,
                              Error **errp)
 {
-    BdrvChild *child;
-    uint64_t perm, shared_perm;
-
-    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
 
-    assert(parent_bs->drv);
-    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
-                    perm, shared_perm, &perm, &shared_perm);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
+                                   child_role, &child, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
-    child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, perm, shared_perm, parent_bs,
-                                   errp);
-    if (child == NULL) {
-        return NULL;
+    ret = bdrv_refresh_perms(parent_bs, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, child, next);
+out:
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
+
     return child;
 }
 
-- 
2.29.2


