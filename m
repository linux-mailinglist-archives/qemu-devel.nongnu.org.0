Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E286C467ED5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:31:43 +0100 (CET)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFDb-0001o9-18
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8p-0000qf-Pb; Fri, 03 Dec 2021 15:26:48 -0500
Received: from mail-db8eur05on2098.outbound.protection.outlook.com
 ([40.107.20.98]:1792 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8m-0001dZ-PA; Fri, 03 Dec 2021 15:26:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kos3GJs1LGk2FzWYupP3RwMt+DKGSiUnAUvcai7XyrvEluNeB/Po2APKLce8y4goYfmIHtRbY5MF1FaUQDprcL8+vm7uNYjDnBS1dRxNW1HS41VBVN8qCLCbWVGCzssIBTktRzvJ4hTgl3Oos8aCZ6erZlwhBTZObzrZvC5un5xgY/qOIkJbSbHzveYhBQYUJjJiz6/Npl7vAbmjDyzO0MEnca1thZjGzY74WJi7w0q+6KJx5fl6wsPySE3GbvlJrpvq50jifjiyV2HwR2WOvN5PmHE0T7uIRtQbvEe7KiptVYkmbJrc/pGy9nMn4Nm6VXCBRbYTkCA/qoPNvGrK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxZ2vevgJOjfF5pRJ8pzbUZw0NDFtRQXzFlllmoJbgY=;
 b=eJdhgFAER6Y+Hi2aZxBYpha3lem9SGrmF4jYKCcWWiolr5toM9kOUSzAtLo7owBguqmPYNuCaiPzc8cw8DcCWk8yAP0gVU07xXElVMAJq23zQG240WovM22lUCE0LqfOvJPPt1j/fmODl8XANrYZ7bO2qAG4AC8MGEsjUOxEKlHy0r7DNUIAtLs3PK1LvPW9ZXY0ki4dIT2OGx4eXv9J445FpWCDMn7Pa74qEU2ee87CVnP219piQoo4XaFRIx+TXsS4J/hdU+v2ZqXKeSD3R8rAyBBuKsOr8bA8nZSFl3Xas6hrZW/2k+OT8cDaNIbpbFZ6/TcJRG9tsoJsormvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxZ2vevgJOjfF5pRJ8pzbUZw0NDFtRQXzFlllmoJbgY=;
 b=dh8qLUc5TnrLBKg41OlhbfdbKgRkYUtDUFUbZQd5Vwh45MwHPwDBRpJmKIFinlfEtoj8hcgi69tHapR0S9VpSWL7bBX4sx0BJUc+/zQclYZFUukvmF7SvY4dzqIk1UU27JDxEYVtk3QcIw5tZ/FSZo1xWvw4ZZLBXZlVJhqhdTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 20:26:24 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 12/14] Revert "block: Pass BdrvChild ** to
 replace_child_noperm"
Date: Fri,  3 Dec 2021 21:25:51 +0100
Message-Id: <20211203202553.3231580-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e68d5a4a-52ed-4773-bb91-08d9b69b2d32
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4068D0A681AC9025AA11E440C16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:36;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LvI49ss2KDWVRsxHKQw5Td7q8wj3eaICr+/DNbugTsrLizDrxrSb/9EPeCMhXIb/z7u2f2XxdyatxUsfwsjhxtnQ5P+9nwjoMtsSN383vfQ/qeXiS04QkA/sgPO9mGgjwBHDcQrYMx9vamfq+Fo7BWY3HvfTxmVO3Sq8kJKAix9aGEXoa0NIklTrl+tVkSfCVhcpWooKqFu07oCNogDimGBGtADCOCI0rVkLihP1EafZB95eOsJ2PR/YcgH/6fYtcppKXQmhv34HJ1tuit3rMUkKJKQLPAHKzu0M/SYZk0jpwzkGWDKVdDUQ3x7rvXUDZVZFv8AQ6gtRiuZLSBotO0HNQIFRIHB8gf6DqruX4Heg2+AewRDHAXd/g9FXXoaQTCKv51Yr0VQ2K8umMNRWTzDzg4SdFyuz5CAc88hoe9OcqcsXGy7crRQazae1S7uETFjnXLqxDvTK90L6Y9OxOjnjlU8Erd40zHlrDoVxe2sI1KD6UkFExolnu1kwaPbShYrZ9XhfXhi3NCmXJXEFFtPA1XT12tDTNxt8b4yJAFBLXZ8yxkRwwi7D7vjWtm5Px3sE1LH2taacjqMN7Vqu0n6u9cW/Piup3r+8qaL654m94O0lV2+xFkJAhsIwZNBe9pdLZgmL0Y0J8UQBTqch+z0e/exTXfcZEuUoPTF8SjKBBDVFtjYzL0AkVYXfG48kQAgImEA0ll2ojfBmdj11DQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(956004)(8676002)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KXSb8JOtK7evCky7c25duAFl9gOIZ5qQJPisyp85/8dMwPLH8nAalhBSltTP?=
 =?us-ascii?Q?eDPiqiIZOXGVqdl4J4Y7YY/p453fiZFOsAEWJ8ZSbmYt47jjqUINLSvL2gFe?=
 =?us-ascii?Q?M6T08eGODwC2VPBZ0pLKEBAsMsj4ZVfiGQ1Z9+mLmyTnrd7p8dTChFDF1sVJ?=
 =?us-ascii?Q?Zpr/Lh5yk4ZueO+W6Wh+vkPlac+YMdxVPx6VaEkIUwBcSifcWLpELZEpeIri?=
 =?us-ascii?Q?mglHArgBUQqrfcpoPZvoecLw0AynXSjbQABYbmCBxE6Wz5WOg9SBmyYxoyPy?=
 =?us-ascii?Q?69RWp5pcdpZ55Vf19VMWimGXL2MoZCOlGI2su75KikqGx+RmJhvzOQfvni9r?=
 =?us-ascii?Q?K0HZ74d8k3OnMI8b9Fruj8I3t9c1DoT+e1jW8bOH3IWk9e+u+QA4ZhnzOdjU?=
 =?us-ascii?Q?r1znOYweOS3a+u0ptsK6p6OlkVUAw23qPx/v6KZpQV32pgdU53FX+IXR1M/t?=
 =?us-ascii?Q?sDy6rC0kVnwx9pw5oKgcjpcFcsKEAI3ijpQPuv2YmHfM+w++ocE8hnP+XYHI?=
 =?us-ascii?Q?/hXBcC/k8IdiVTrZu1i/HD0VyjEnt7LJrnQsO9YqMPdRMtVgJWPiTZrd2Prg?=
 =?us-ascii?Q?k6YlD4xoIHV4+f8FU8uhSLZGCR6EkavF4awN+dvuJv+J9uH5B8QoR3OUjRrW?=
 =?us-ascii?Q?R6ZGZ+1vYDEI2Sgx2AzXH48RsRfk9XPgkKlDk25NK5JRKhDfzNNQpDMUDWtf?=
 =?us-ascii?Q?K14V841Dod0LeUqleGZcK5EofVgEuW2xUT/6ZzacSPDh0mvf9HHP2Op9kkWz?=
 =?us-ascii?Q?cndN2D4hrYLPH3d7tfUr68Zqvc7oXzSi2fDIZTwFCNWUa+ZTA9u28/mTDn4V?=
 =?us-ascii?Q?y9rP+QkHvQSR22Pa8TduePJl367xGceBaJ49YpZYoiQ4zFiaNk7lM5ifx8bR?=
 =?us-ascii?Q?ka+4iaYRPCGW+zGaQxfvQlOsMF1PLo72b9Ee5l2zpxJyiaH+PGo/7QygmET9?=
 =?us-ascii?Q?JCqe7ET0FipuWsrMyE/wFm9rPnYanJgwsPD833i3UCU4AKHT46z5HA/o4KKw?=
 =?us-ascii?Q?KwEpVmMnngF2wauFvCb2HWpePwtSo7b8SI/TSf8GKKPRrzNKVd2wQ1mFDdAQ?=
 =?us-ascii?Q?f1EnOZv9bPfQJyU3OKnkuJlj5ysbDnUSvSlMfxAT/sC4fYMElj/Pi2Jypt6S?=
 =?us-ascii?Q?cWKxMB/XRGaSbhM/IRpxUdmLkdvTmIkg4RL+iNusdBOXMsXsLoj47wwZ2eU6?=
 =?us-ascii?Q?S7U01BXy/g51TwH72S05vbiPu9MKJcBzs25t2O/8GshUY6Riac3A/S6uLoYL?=
 =?us-ascii?Q?TPwCfbxchtpYhR+6CmppmuT5JYvz3/ZNGgzbkqAp0pVWEs9oS+Dsg59FlTgh?=
 =?us-ascii?Q?KZ8gMXCpDUpf7dQPzdq2jScXKnPGV21tarGa09BDt5kRmJ8k+a7UwDHCaJKJ?=
 =?us-ascii?Q?phQzJs+is1MkD3bILdkIg8H5ehV+IWlbAIx0C1i4/4eVmwevrZFTfkwfSmRR?=
 =?us-ascii?Q?ZCCG49V2YEBll/37NI04r9hhKBbX6wACVITWI4YSVbynQVAg9wGZpwcxQNNK?=
 =?us-ascii?Q?8T6QT/tI0rhMPbhMSR59gc2wHPIFQvzxWGK+bBXdg7OWaP5G0V8rMVqKuMrM?=
 =?us-ascii?Q?a5IhdIK4Dy+bAjs83NwqQWN2eYFO88oyZrzHKNChCm/gPOWGminC23LsL/9h?=
 =?us-ascii?Q?7aeScZcowYL8Y7axsYpp08qC8XWGmCmNDgMt7Disx9Tg0B+j2/4HpV8hmlPb?=
 =?us-ascii?Q?4t8x1w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68d5a4a-52ed-4773-bb91-08d9b69b2d32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:24.7566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+zz/6bqAXRZcfCn2156/yh3oOMaueyClZhz7OjdbWVi7Er0NLGHXci+77kRqexq71Bj9vqmzgBo8RxBVOOrniYc0/oohSbTH2hPJfNvVck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.20.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit be64bbb0149748f3999c49b13976aafb8330ea86.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 2ba95f71b9..d57d7a80ab 100644
--- a/block.c
+++ b/block.c
@@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild **child,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2270,7 +2270,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BlockDriverState *new_bs = s->child->bs;
 
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2300,7 +2300,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
+    bdrv_replace_child_noperm(child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2672,10 +2672,9 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild **childp,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
-    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2768,7 +2767,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2868,7 +2867,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
     *child = new_child;
 
@@ -2923,12 +2922,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild **childp)
+static void bdrv_detach_child(BdrvChild *child)
 {
-    BlockDriverState *old_bs = (*childp)->bs;
+    BlockDriverState *old_bs = child->bs;
 
-    bdrv_replace_child_noperm(childp, NULL);
-    bdrv_child_free(*childp);
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
 
     if (old_bs) {
         /*
@@ -3034,7 +3033,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     BlockDriverState *child_bs;
 
     child_bs = child->bs;
-    bdrv_detach_child(&child);
+    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.31.1


