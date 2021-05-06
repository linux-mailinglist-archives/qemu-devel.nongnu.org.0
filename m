Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A03375BEE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:44:46 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejvR-0001Nw-E2
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lejsv-0008VY-MM; Thu, 06 May 2021 15:42:09 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:9988 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lejsq-00053p-Vm; Thu, 06 May 2021 15:42:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgVeyNt/XOocVqJAQ6OzcUB2kOFfcJcyr1aPJnyL3MrSEYkxpOfu/DDHJRbmApYXD6q9Vg9aeWu38tXxi09+IP/e+fGE1EZyoGaC6uohDO4DcHz/3rR+AKeSILV/g+5K0BhX2UDzKahj6W80vVNn1us3whUperkxXVbsINdMXFih09dB0KkFoTCaYGY1vpZ0QZZ/Z8JkgYT9HHeB71byjMO5ZIIFOH7JKMF8E+JtDMuFdN5M1fNz/w8lhAR+5J/lzwcCwW/4azUNU/zHARhnqegduoAC9bHtRHqkGksLk9gPlm12G6VbZG5Q0XRBd5epLBF/7iF9Qi+L5cQrNxN70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKMLfRG+0XwSxj/Anf8+H5ERipCMV1cx9AWoGmm/KrM=;
 b=UWaKWQ90L0bDym7rl6ky6qHS6QwuPzO7fOeRWBcTG8xaWpeLFwTuwLaejvqP06AIDscgww4oBUrnRtCmlgK/Wk9SXUl3PNvOsQz/qxLgpzIYDF6g4Hf75sG4GZGQUaDrWnpi4NYv39x7wQVGfCI3rnHD6zHGFl2gSfCdrzoFh+saT2wkfG2XarD36Ub0sSAQwBKCNnwUoIrFXpRPhDlNQ4IfDWPxSbERCDqQdaJzxwY7KA46pIZEvbVg+hRuEgOa6cYl8kfWX4hEMmn5QqkI8WNkSwhf4bX1ep4H2UixEjR8QGF9AXO53fJOmCwx3qY8ErsE42iJZZ2EjHx2tMPziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKMLfRG+0XwSxj/Anf8+H5ERipCMV1cx9AWoGmm/KrM=;
 b=Hgbfo7LJw5zQq3++nURBP9jiE7uuw9HhR5WRoWL2zQDYZ74Ja/0ufymXiPY9AWb3KlwwibN1Xjjf8C8iTbRszyL3NB3n4Kn+EnNqyXNKvJX/4ZC0en8t2LsQwduknQy7tjNMLCfVYQxUUmqAoBl91Pic+g3Z+zNDzfdS3aSy6Hg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Thu, 6 May
 2021 19:41:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 19:41:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH] block/copy-on-read: use bdrv_drop_filter() and drop s->active
Date: Thu,  6 May 2021 22:41:43 +0300
Message-Id: <20210506194143.394141-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR07CA0027.eurprd07.prod.outlook.com
 (2603:10a6:7:66::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR07CA0027.eurprd07.prod.outlook.com (2603:10a6:7:66::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.12 via Frontend Transport; Thu, 6 May 2021 19:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95f52f28-94d0-4e9f-8e29-08d910c70370
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42775AE1210C82C07714820FC1589@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jv3rJKH9ibjWeGvtn2r/8XCi2RDu55h/zlJphm0opcf1tyWBPlVGJM7BNAdJhNRvWpYUUjTROcXNrwgnmhMX/LZhVaTB+8g6Jyl0dAgzksV1BPw1cAzbGCl0cDqcPj2xmVSlTS1ZqXrUuBm8Hf75FRRkxE92Jav15Ioki/IOMoVnG+mr5cDPCCMsZk99YNkle7c+FNL17yOeb91fJFEeyaqZ2btFbJT8ir/7h92pUniQqL2tioMmnczwqGH15iQSAZVv8wkyWePz79HbjrWmzJ+o3DsLu7pqwNLlON8+i3cRnpqkI8bviGJ24RimTtBDPvWDcMYBFlhJyCBOhroe6JmSY6BKyJvh4nxM7hkBJzp/N4dmKdj4nA7D4LFESBjHTx/1mwMqlEfCdVE6ukg/lr3YKV40pJPsmflvCpZ17m4ZQVaJpVE9MqdpwxaN9+RXKfmvvWZhUN1T8Jwj6DO7xB+pNEtgLbqIfN+khkMW8LrbdQprHy8RwkkzbCweJxY6bnnjH1OpGRU48CF2tNpvPOImoRgI51hu4w19mL1d/vzbAmKNzdFUb0pNVy51oDSuNbghRaXgHSr2uKmGCdrTm/xO0+q99bT5XnvzqKnejSTeqNrqP5SSuIhLzGZCf0QL+ngRsjPs3KQBDIk2c+FI249TGWsfKGW3qhiWqK+K4+bVvGTdcXCt2OAp0IDzymW7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(38100700002)(107886003)(956004)(86362001)(66476007)(66556008)(66946007)(2616005)(52116002)(5660300002)(6506007)(38350700002)(6512007)(8676002)(4326008)(478600001)(6486002)(6916009)(16526019)(36756003)(26005)(6666004)(186003)(8936002)(316002)(2906002)(1076003)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WSdBgqyndxX2fe+UIEnBLA8lQy+RgDBNyAJCa2TCmXJ1b27Z0L6oOQS6PXCf?=
 =?us-ascii?Q?qty0CYI1RXj68e4wl6kiYjGzisbrQZxWQluXwNowKUxlE6yAr6EBujBKYj14?=
 =?us-ascii?Q?62Mw+eXTdmQey6DXNBj4pUOZLjzJZf5aPuF+cyiu4SHMrMCjn1jqFch6RPgt?=
 =?us-ascii?Q?l7kUrY61DAXHY4lpkYxUcsHsVBqjScLKNWTrnSKQ3kSQJlpjv7tBDc0bhCTD?=
 =?us-ascii?Q?/9zYCjlqiQdNp+UnSHmj+utCX0VHJETXwBsSXlP/lew90FyIplMPyU8uJdKE?=
 =?us-ascii?Q?OAS2MqYhQkaFeIuGaSR0fa6srcQSMhl4Shfkp1jbLPVq1X5iB8roPpmRPBfb?=
 =?us-ascii?Q?Clv1KRgwG3ey1+t+WzPrOr1AO3/6j20PD1Rf90NzSy9TIc5jrixwzjMNFMP7?=
 =?us-ascii?Q?q7fFwkZIQ7pZjAfX71tJhSBUlxR+BqHtAir+/097D2O0TNqRIo0SF7Lb1kk8?=
 =?us-ascii?Q?4CeRyFTWtsuDcQIX1De3dWg3HUiuxQtmxBwM51PEatVK3S0JqKhdco8Lkhnr?=
 =?us-ascii?Q?FUNABXG/0X4zrPjwY2gtHOJtDC1Dxbk9nS/dAQQWeOc4kx/phnNR6B7JNAbg?=
 =?us-ascii?Q?khMiIdlbJGq/5GaNTYlCJyyhqIpvhMUGGjBiNuNTgL0z4cqLHwdPxuiSQYTY?=
 =?us-ascii?Q?AxoIyQyM3ScumnUpPvb+laVLSgOOkmjxjFIn6iVc5XLcmbQ1fwRjJt5ZYOAA?=
 =?us-ascii?Q?TZLh3RNh1YRfN+LeF7mqxpzQElI8KQ0LHo1Nt8ADyLDIrHlWSn9rTuFTkJ6b?=
 =?us-ascii?Q?OeBiIFjlm9Pi1NqdcqKjUv3bhhBRs/SSfbeRZn00CiqAI5DnLF64Ss+xOEOY?=
 =?us-ascii?Q?cIpXf3WwhpS0YdfM7RzfXoVY0Zo7k1aqQcr6BbOEgpL7/ZS1J0DUsw8cnppV?=
 =?us-ascii?Q?u319Ed8TdZRYBdtQpR6RbDb/1omeVetPN5jrjpW6RHGy/DaDKx7qme7m4N5W?=
 =?us-ascii?Q?B6EfFxbNknGaprj7Ehv+yhOTNpf11b8WgAHZV/Dga2bnh5dHWriSuyCupObm?=
 =?us-ascii?Q?7BHD/jaYCyjtitb37ivotN2W7vCIcztofcvJz/ppImbeeYVsjhva5BHx3OaD?=
 =?us-ascii?Q?Fy685id35exRVO+SQC8uCKYQdd3xUUnl+btSSQQe/m/0RwqQCcNBgYQ91Dvy?=
 =?us-ascii?Q?rFeQKKguTnMvGSSqwu3BeplrIITPQCNsRwidsvbKwMJxN4pVPI4Xv/3S0+YI?=
 =?us-ascii?Q?bg2uvpONHLUh6FhnF69WuRnWR/Rh7JWDP1Zr6bVdrzujD4OjFeMXU4mCMnTi?=
 =?us-ascii?Q?dfmJa7KXnblIGrvUVxCinQQBrqOQcDoQeIOM34hDZAxgk5LSJ0SqhrIbIGa3?=
 =?us-ascii?Q?fyD7Td9Q4QNmJmV0HaP+nGGO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f52f28-94d0-4e9f-8e29-08d910c70370
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 19:41:59.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGmLtmQuypWpvdU8HEMAEyvzp4f95BjRRn6BFf4MHUUY5COVm+wDb39aAyvBQ/yK7kCd+3xkHl6MUrsVBHGRM7doutr0t7NuPGeAM+sdHN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Now, after huge update of block graph permission update algorithm, we
don't need this workaround with active state of the filter. Drop it and
use new smart bdrv_drop_filter() function.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 9cad9e1b8c..c428682272 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -29,7 +29,6 @@
 
 
 typedef struct BDRVStateCOR {
-    bool active;
     BlockDriverState *bottom_bs;
     bool chain_frozen;
 } BDRVStateCOR;
@@ -89,7 +88,6 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
          */
         bdrv_ref(bottom_bs);
     }
-    state->active = true;
     state->bottom_bs = bottom_bs;
 
     /*
@@ -112,17 +110,6 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVStateCOR *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * While the filter is being removed
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -280,32 +267,14 @@ static BlockDriver bdrv_copy_on_read = {
 
 void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
 {
-    BdrvChild *child;
-    BlockDriverState *bs;
     BDRVStateCOR *s = cor_filter_bs->opaque;
 
-    child = bdrv_filter_child(cor_filter_bs);
-    if (!child) {
-        return;
-    }
-    bs = child->bs;
-
-    /* Retain the BDS until we complete the graph change. */
-    bdrv_ref(bs);
-    /* Hold a guest back from writing while permissions are being reset. */
-    bdrv_drained_begin(bs);
-    /* Drop permissions before the graph change. */
-    s->active = false;
     /* unfreeze, as otherwise bdrv_replace_node() will fail */
     if (s->chain_frozen) {
         s->chain_frozen = false;
         bdrv_unfreeze_backing_chain(cor_filter_bs, s->bottom_bs);
     }
-    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
-    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
-
-    bdrv_drained_end(bs);
-    bdrv_unref(bs);
+    bdrv_drop_filter(cor_filter_bs, &error_abort);
     bdrv_unref(cor_filter_bs);
 }
 
-- 
2.29.2


