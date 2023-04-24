Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E524E6EC889
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:17:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJd-0006JT-EJ; Mon, 24 Apr 2023 05:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJa-0006JC-9o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:54 -0400
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71c]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJY-0002zR-Gb
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lp0SDyrxDcMe6EX/QsF5y47eO41HWOOxF3XG912+phB2gCTR4Ek9nQPK2w0FVeUfP4x1nOg3oHCsAbLI3a7mboI8kVp0QjXDdNLwa8d4JyQa9f32i9VVMiH3X1v1j5uAnSxKdH6ztbXFbvphRFvBHzRR7WURPHDB0fj/G0JwAbxSf5c4BuXu18rH55WibYr9f1j8qdFEQtLPwFs+svNyFZquaHXeJYRT73q5ZLMndNUvpDVh5TDmHNUa4Y6x0XC+Oa/g3+rtBQjjw9458lAITBNWYS1IUxSuGPMcLlujFs+Q3+847bY+oKAQ94w35Z/R0g0vGkLnlDxCQPlhqT1pPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzdUYM1t83GtJ+XUwNuVoTU1WC9dIlfan1AXZqmH9W0=;
 b=EV17KYwsQgu5BAR0b6aoryyYQvvfMgKRIvqRJ0XnfI+Frvn7v6wJtkaJo6ihc7mFzzhT6jjJCeWzIlRDJOaQ7hJjGOp2bjPE2P6PcvS7NEcSjIZp9E8/HHp9i4ioJSpGwupyrmw709y/s6g9QLzNU9et31AJwiznDHyeL5Oi7gbrmFrtNXiqlBrvF6bo/0lgwpXOVqv3dsG1RXRd0IVXXUxRDJE7qKiH3aO8WZ+66sQ8/n/gKh+sQ3nkFAwvfrpuxKeI5B1pPwqUcbH30WhKTWfZ3OPoBK/tP9SxuYB61m/7ZbKPvbBAGBmxWyOY9kKplXW5A5odyCUj8GfAkmIAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzdUYM1t83GtJ+XUwNuVoTU1WC9dIlfan1AXZqmH9W0=;
 b=oqGRWFL/norjVWX2Y3QULX4mTHysqlHnmaQ+JzTUWnOOp/M6cAio0ARBACTxjgL03mipE0T08cHNxbgbJc9rbwMFEA+eo8UYAezRwzzL4XNJlOeSbBy558anxW2hxlEoz38xvzdFjm8lkdLI88CM1NYZ2jwXkA4srKH3nUYFXKO/E/VupkMjD81Q+0depeBVn3chDNUBQ42vsgv6tFgxBWLXNVyFV5xdB23Bje1wu3n1C4oMz6IeH9hRs8u85FA94TMqrvLRqGpg9hPS2qLEkbtZpLDj3HeOHnz94E/3Zra+xx9g9ohrTBuZkXBUbq/DAqeGQ0KsvjbF62R2d7UrnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 08/12] parallels: Fix statistics calculation
Date: Mon, 24 Apr 2023 11:16:22 +0200
Message-Id: <20230424091626.195590-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b95990-120b-4219-27d6-08db44a4a0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wgyfYcesylhnmLNOy/HjJOIp3XhjkHHbmDyVaz2RBG9yt1/MZByrBJBf05iiH/Ve0Fc0FNelX7i1++6FBuSNqz+TG3t/jYH/3fopswHSsYdYZGPVRqR0OEhmGwBrlGIMZW3XonUBWwQP0kh3spdGVeONQC5YvGQ1m8NKdb6bfAUUnxXHg/Pu+2vGIlFtTe4EsCNJgXh+XIRAA0VhmUgGOeqc3dkOQY46N9C8xyJpvY/mtj7nkmZLwiStIUfdpPPXHA/lQtW1VEHCNse7ypy4U2zDpeteaTe+bYxnrwfc6RbP3/6X1vcubV+Iy8ob/sRLAzu7cb3/JruklyyHEp1984M2RnovvhV59RzQGZGbmwqwUt0WXQaVWFHZnfoukEdgoubLDjsktNdFWoHZ5tgOsblKKrXdaGs+4isfiqp2NE6FNBfFY6PLF7v4fdV0tODPorkFjngnoUAPR7Gxu+RLkf4IFAUeWYlks1F5tShLnPfbEmUvXURhjfwCNHEVh+wQrDjFoaZm3STcJpSsjBFRo9vCJVm6Bd96mIP4QLlUOUdSIuW5295BF84i+crCumMmXwbgo6ZMrR4FSA3dORyvvlm6aH62Bf7lkRfjNGlPPDnyecIWoxCvcOUuuiplqZ5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(4744005)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wcqq+6GSwpBUXudJEQ+oECwKVOOdLE8/SQ9UC92MC77H45/4hQMqcLWYE9hb?=
 =?us-ascii?Q?/DR1/asst70smgCe+IfZx0i1TpWahGVL4KpoaD6qmHb+KSlhSI16zgbzba48?=
 =?us-ascii?Q?SSfgb5/V3KtKHgHFRvyCW5ckPslAVRdwE3Llcju6IOo+J7SwPIdC7g1Fd0Zo?=
 =?us-ascii?Q?rNEb6ga8VbxfSMz5R6//Zy6viJkggQrBeCW32JJsb5kC/qTQ/pTYEXnVENNm?=
 =?us-ascii?Q?xrspApwtVF2i69LXKNWC/XYGX1B2qBw5ka0MibIs5vlRUx0x1J4zCaNPRGVZ?=
 =?us-ascii?Q?pCMc7n5H6idh3nlFdYR7kY+Oz9eiaR9ZAcCjKe/V5Tj9mLtP3dkBZWINLP6e?=
 =?us-ascii?Q?pWUGtkT+hCNkm0xq9bgGECXt+NzEmLedt6fxw4VTH50KMHQbd1HndeUq7h1P?=
 =?us-ascii?Q?XMt/bsWVrS4ny7ZyMvaHjths1jBBf+PtaV2Y7yLTsNs4CULIaut1Q0OVnvjW?=
 =?us-ascii?Q?wOCLCnBjgwpTyOac0luryoXUvRsNwPCLVwIz6hW14eaz8/vrCOLXBf8mIiHv?=
 =?us-ascii?Q?hiW3VIkXoO7icFwhApdjqnfh+Sgyn+5GLG44lENB3IguNHkeV5Ij8eO3J+L5?=
 =?us-ascii?Q?3K+dWa8hQDaGNI+o3AnZfNqVZmVEsFYzLE6puziD/B1w4ub/huACSIvHrZzg?=
 =?us-ascii?Q?E1zWHx3H9gRJNnI9W/KAeWaNkGiUm043XW1tmRZUtCDsKTpj9IojvINEVYID?=
 =?us-ascii?Q?FzKkgcTpHouFcZghQvb6aLnlVl0MhKRiMPUDFqx/ohW6aVhDt29NLEvKd7QV?=
 =?us-ascii?Q?9s0Bry4KWYpM7D8bWUizhe+/Esh6Ap5KryOk3Qx/X6bz2IzISy97cfRg34U+?=
 =?us-ascii?Q?rAw0lYvxCarS6jTo7ycca7pwK7+4YcKRXRg+v4DFCCB/KHhh/Jql0qt3Axbg?=
 =?us-ascii?Q?mpVsKsEp6DkdGtohLSuYRDrxrAm/leestu09Ug2ts7i99QoyKanwLP8EIGfF?=
 =?us-ascii?Q?8gTMAKh//HwhqCXkTQ2cSQAwYEW3K4jOzVbUc0vXBYV+hPF32bQca70g5SII?=
 =?us-ascii?Q?emP4LBGbf4zBnSt6aju4iT81zoaOjLNGlbcPK1PqLNQwHB3vYbcGiBxDpsQh?=
 =?us-ascii?Q?65UbJnLyY9kh0RQfciqgaE413g7ARTwsCWf6s/JaGcRHZ30AYUTqwwj7eP2b?=
 =?us-ascii?Q?/6/P5zcADTY9fllgHLvmjhVK6JlssZTylHS6zaAqQLLdkW9XiDvYs4S8VQXt?=
 =?us-ascii?Q?0lSIn0zq/ExpX9ZYG8Qa2+vuk6NYqkUi6xjh7qL0WQ67J5PFiFd84uF4zpXD?=
 =?us-ascii?Q?DR4fk/ltHfGxV3CK1abvI3Gqnqb/QfvU3dr/Q3vpTdJ3bDiY/Z+VQzahy4Te?=
 =?us-ascii?Q?dk2S95aA/tTPXBCwv152occTAmke0OJ1aiLDtHQIWbQ0sTn/6e48LgunJB+M?=
 =?us-ascii?Q?ea1r8Xp7ZPWw3/TuRUELZDoKmsICJanjGCCJfEqA41hXboFlxEGnZN2lxsPi?=
 =?us-ascii?Q?K1YRgBR4exMHk5Tti+LY1I73AXXxnsOBmtBiTVx91gcYtbiFZRQATNG5ipqE?=
 =?us-ascii?Q?kltofeLD1bkx2b7uWooq85Aez/Jf3imTNPuBInjX3QMXKvhUrVCmnnTYtgM/?=
 =?us-ascii?Q?5HxHmsgAzwGRGIEGTieRXWuUhHoneQxaWS/QwgtFtJTzg0qpL4pmpcFuIflY?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b95990-120b-4219-27d6-08db44a4a0f1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:47.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouguxOdE2PQIU5nC2JUozC3w0l6vwBHZlztA+gxpo3qU2VOqX5lVUXTZ6zWWBmauY5j4RwBnBPsh7w7MHwZINdIMwl+QxT8a9gYcewr7mDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::71c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Exclude out-of-image clusters from allocated and fragmented clusters
calculation.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8588c3d775..f389a74466 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -512,7 +512,11 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
+        /*
+         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
+         * fixed. Skip not allocated and out-of-image BAT entries.
+         */
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
             prev_off = 0;
             continue;
         }
-- 
2.34.1


