Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C86C66B240
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5PD-0001lF-0l; Sun, 15 Jan 2023 10:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5PA-0001k1-OP; Sun, 15 Jan 2023 10:58:44 -0500
Received: from mail-db3eur04on2121.outbound.protection.outlook.com
 ([40.107.6.121] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P9-0001LB-5U; Sun, 15 Jan 2023 10:58:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSm1VFp5O8FkpbH0+lALPb9fPU8kI/4mBnzI/G6neV6OYqGtPAoWYEyDCZuVQshD9VHHXeCDjUIRJZzlm9wQ1Xu/1TH1nkAKJTFcT6MSzJFIp2euSSxQAUksX6wBZAm7YQlAkZQRALC7ndDcBhvAQB3PYGCx7tOqPBrCLh2ReE0rfb6CyTYpaXKOEvD2TrYqdoSUKNLqrOKCKdUkl9B0XUSsfl6uYK10bfIatSsrIapSG8Fj+4OZUAzQtLFLPxGUlwtRpAqSQxVeI+VkUAu0IqSoK18L6bNTzM3D24PnCJqbh5gHHLkXqXCrN4DPKSB2ufS5Sl68+IKWSQZm8b5obQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5ozM9nSTui3o7YQGMy7+2YfilcLFn1crGkq3eyJn/w=;
 b=j44dFiCc1fFd/HZPH1gc9DV9jITapjIoQ0QyXVGfIXjuUZT2hS95W6TSz/SAZ37dw+Iy9piWomv8VNAhc0IG6EOD0L3XjRhMQaD9m9IDOn6oWOZ02nZV++i19k/XvaUabMkndQsmexKKTc3tkoHz9s4uEVRBL+447CUnO7WRltmHz78ncKYSRdLpC9QjdL/+ZF7YBuNUeSYJuLdrRRRIEGPS5lT3g17JvY2cHmfTLkPK5/zhBeqiUxmDIvN+U1NLVQI7fFfu5KWnVq9VzUZ+nVXnrjVKVtrkhKnW9tYHwNsJTbGR/PNgXKloEFqdPbHVqCbUUocgRumgnPoOGyOOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5ozM9nSTui3o7YQGMy7+2YfilcLFn1crGkq3eyJn/w=;
 b=uibZYGDUuIHmqOPzXjou5iGIsaigk/bhnK4EW4VtBwss7/U6q18Iv6eKI/mGFq2fTARuE55oladuMgmneusAb8hZ4WXFcXcR26iZF9Hd+lO65zKGH9qt6JsoXWMZ4fHVstrAWgZf9F6SWtvfmhL/r3hl3tghewEaTTPUMW0/GITfCnQQ52pJ//1hoLVgnob2Bj26uZmE37oqWtopRBM9ZCvJxSCB4BZFAa2MGFKWA676L5WByG3+EXVauJoqKy/BhJbxIjprGiR171MaBoCxMUmbAIPHKdQc3/T0JdFiVXwGdqXYbPLgMd+CduJiTZCqnJUFBuCWk8AJ+/ezj5FZUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 09/11] parallels: Move statistic collection to a separate
 function
Date: Sun, 15 Jan 2023 16:58:19 +0100
Message-Id: <20230115155821.1534598-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: c02fa762-1b96-4a47-0fed-08daf7115af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fd3gJ8VkKVctOzCMO1soEBwyn+hAieNy0qtT3F8h9IQWuQytwCrRTu1WfDE7CX7Dy0F1Uwt2lfEJrNpCCM1t1ncTjzXls29le1HX7ETISWC0+IU+cWbB6YGOETJz4If6bZwrTELh/lA5sLwcWeYki+JPmvclSof6FUBh1gfDUOP5Pt6Ou2+t7IpSTqlenkokfIDzV6NhUFKe/1n8enF6zzf9JUKU9tGWliuryIaVJoRrQZ7F+gj9jVdeBKVI3yfEBBfeWCMIpE//TcYqqlwVQvdPHn6XLrtUP+GV1GqCfop9dYmsDgsvBC2dFwJ3O94yxLyrxqBXwhx8glsZVSgGpoH79WZxi1OewUGQnYAgtzlgYib3xxZf93J4P3LPIJlswwezOydhYMwzezYZGMYvEKWSBIaeU2PgyyWXmkzX9GkDzQZDqwXtkgXCTR0Bp5ElFPVQZN0DLqALZLLgpeYq1jptsrTAmrQryuswMihhQBy/Y902qFAKq3Gdia3TATClqlWkPvVEcLgRitDeDKFncu5Mw0+XwIg0Cdja4izPHKMnfzq17P0rAFkKPWAF/MnZQ8PNNSVAGwun3o80aeef/yKqXhfMooUY8Qw3wOO8EFKzHNy/bDhKgJNxmrYr05Ywbmgx5TKqgpWaV5tHxaQjzsBa5Ymp58N3ml8k9JASI+lxuGyHCaRRHrR+NHos+jK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrDjHyWENghIqwL+barrZVQNKecGJ/PpB/eIB1bMsuuql9edA1l8ibcDO0fY?=
 =?us-ascii?Q?0KhMCqUlqXG6sOp3vhPz9EhckLEWV4Z81xkarJibbp1KHSciNBtISKu6t3wY?=
 =?us-ascii?Q?9rVoHOjKAsJqq2Q2nWcWSo1knkBHrXNy/ZVp+s4j6Hbb75qzHYUlMpzfeTsg?=
 =?us-ascii?Q?vwbH06/4gNwjw2nUxTrtDhH8IwTVb4O/Hp1hF6B3r1flA7J+9QAgn9H0j/KH?=
 =?us-ascii?Q?WUtnQELxcIWhb93sx5wmCfwOnld37Md2iGfBLm8dNKj094xwoKG34GtkcByw?=
 =?us-ascii?Q?IGutMm8iIgI3MhLd4JMEDNQ0ABI9SFxu0orfYCTRAkMjd1euxpqWAy+2GsXc?=
 =?us-ascii?Q?pYoPGGumcSPUJTF0HitIUaq6JJ0zqn99mHVeIZEp07fcf1+Z76+sW5QyAELh?=
 =?us-ascii?Q?UnLGWVOfJCh9542/y7SJfYzCwNhbc2xhiflQpdZXVCf3Jaa+cM9qM/aZOqc1?=
 =?us-ascii?Q?wCOQbkB+mxQfpwf3UBWy0hLnqvpmNhkndSm+mO1rpCAF8li+GcZxccoYBX9e?=
 =?us-ascii?Q?bXYEIb5aS3b58KrBjfWa7PTeCxNMvFEu6T7529SeejRg/t/i7+hLnSH9TTKh?=
 =?us-ascii?Q?vccu5TBCLiZgvTObs1/yRJf60b9a7eMUR1/BTuhfojQx+WboIF3GmRQXo5on?=
 =?us-ascii?Q?9Kx9pbByrZzYHjnuhoJ3Y76/S4A5Y+krY+ljF5W9/VT9L7MB6rMjjsiKP4w0?=
 =?us-ascii?Q?vtse6cNE967xkTYjzsJFkVXoZfZEkRxO5GUN5b0FN3QA6B7p+ywRTOAMjmoy?=
 =?us-ascii?Q?z0B3igTjyUknic0WtAQzQC2UXDhoYL6VIyz9Bpjtpfcg+8PXpWT9gJ2WfBK6?=
 =?us-ascii?Q?Fbr/YTPZ0hQRfFmihC4GtKj9vcMsJ0fKUg8Urwkszkf6LqY9JfFg/jK1wwNH?=
 =?us-ascii?Q?F5bnpWUsMWbPhxGr8Gn8EWVnjOOS5NMbpBBjtVY8yKAmGc6HotBGDXkW+qld?=
 =?us-ascii?Q?6kHl2c3OzRg8DSz7O/3hbljmkjeVUCL1n8UWtP6f7hoUIAlgpcY/1UpFxFmU?=
 =?us-ascii?Q?LvmXIb/jEYQ00x7c40Zwu7AOkWGAC8GiPjHbsgA2TMBYE5KLARi9dreEnZQH?=
 =?us-ascii?Q?smWpCgZTG+wjhJxo0gK1Nv4qB6jaMQKVXm6P9Avy3LCCsPKMJO6OJ8Lbuxmh?=
 =?us-ascii?Q?LdHntBXkKadl1YnHCIY9UWS14lPUgB2Ut/p+sxqwiyKjOzuOfU2Orn8kT5QL?=
 =?us-ascii?Q?keg2sauJ/6LVlkILEZndrgYZzbsbYeJcpWJ+ixP1WsBuFl5r6Vas3dV+J0gR?=
 =?us-ascii?Q?GsrNV8cnWq8fLMOTxQ34eCpSlG7/HUTq1bs5y01N2fS0PIsjJx8vCL3QB/rM?=
 =?us-ascii?Q?YnOhWmSs4GAbvFTjc2sB3tqMNk2z9ccLKY87TELAbUyB5prGvnOmpYhUJSOR?=
 =?us-ascii?Q?epRn5AWdGP5YjF5nhFHLKrY0EGWF3Hx3C2XBVH3rvWcX114a0AAIUE85jB1M?=
 =?us-ascii?Q?1B+AOCvpoDnxtkYv9rSX4mfNTKKfilbOwcL9LoNUpmqRespsOOQUwwn17nMd?=
 =?us-ascii?Q?XRHBTzD7vc7EyLJ3KzOLcE1oqFSKqe+CBvmgDbey/k8UtwmwmoJJ8Oh1e+d0?=
 =?us-ascii?Q?ca6wJdymod5nrsds2/GZrFcxXMJceFs95HWwlkzGbBST6vf3dPsSKbQBDIc6?=
 =?us-ascii?Q?IlWCttZ0+hiaGeXU6oloP6Y=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02fa762-1b96-4a47-0fed-08daf7115af4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:33.9733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFOK2njxSHr/sEKMPhrC2W/C4Rw/rmDv2RFCML/zcxHEXDvpHvevhs56llYW+f3wHZISyO3YKRx2h+WL9oxhJi+KCgRpNchvI7eZDKiEmWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 5db099b1dd..6e7f140e06 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -526,47 +526,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


