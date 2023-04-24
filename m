Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49AB6EC898
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJj-0006M1-4r; Mon, 24 Apr 2023 05:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJe-0006KO-S9
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:58 -0400
Received: from mail-db5eur02on20710.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::710]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJc-0002zf-Nx
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mceaxe/WGSLyhDzb0PoeqBc42X6pqXRxzTpwa9vAnP/aGHN8oWblcClOg4avUNwy3Sw64fcDFWVjzesmRlbp0+0oyGNaI9RBXQK/lz/9Tz/cqTooeaDYr5qGRjEzksoBFjDbd4+9QpQ5x8siRf4RiMEeBDsiAKr8hmVKbVAjHYZmmr5Pmni+aH0p+uPOgBHqqwrceMLi+2Lw2httSNxJ/Rhaaz+uvvqMWarX9bEctuLlHdb3f7J8/XYc9ebhD4EmvuRAwjyUe74du+5RlzXHZ8biSZhpphbfz9596nVVLrXAhSJ5CUarp8zqHss1+u0sTTd9EUpa6/LT+Fz7HAwwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEN6uvzL47tJIlWemMWFzC2Yw8mGEH1Iu55bJZSXHf4=;
 b=SnMRaDZhfY4FYXx/nByN+loFoib9LjYz8HYBF5fgsR5eRtMXIZUIAG2eyACIzUJuDirMkCoyWyIfVlgKoke8OQoiZ+5cC5l47Fr38t6m4v2rAOsbCgbf1F3O6IYTq/SW7ha53N/09PFynTEpUd8mOxVwPC9g1cxrBgG4q+PczcQSReY2fRPUksz7tsspAeCdEwU8kCAUNqz4AZMsqsqabBkR1mfDs6zbmmwIpwhtT7GZpMEk3F+mKS61gkB8cs/nQoo5/RK6Jb/6ALh1saumybZX7iYZ80YlmDyQa4+h2D9bXM1oUEcNnp/Fu3iBjgZMmIBX7DbCPa74Xm2JFH/oqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEN6uvzL47tJIlWemMWFzC2Yw8mGEH1Iu55bJZSXHf4=;
 b=QQVyPHgY7tkpedYmREzSAV71rL/JO/K2BWwAaW+Yrih+KDcg9pMUXzQ3ZIRHrHSGY/SmwpQxzFLl3/Gc1F+ygi0Gz0kIeT1AHBmp2oGcRziYJR9ED7oTuJeWEhuoMgk9Ie2tEtNy4EPBstfQWqTOtnU39LbqGDhFgx5v2gr535wanzW2XpYymty/EKxwnalFFF4WxQqOjtvDxIhh74ncDaQu6RjW196a5tT0toybwziWiVFj/zXRhBEb1rG6P4rxtRLrGnbfMm86iWwseNIZGoWnzenJsv4JZvmePHj5s+76mBSpT96trJg1LrK4c8FF+xU3m3khOtYYz1/TBfoNug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:45 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:45 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 05/12] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Mon, 24 Apr 2023 11:16:19 +0200
Message-Id: <20230424091626.195590-6-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b3db6f63-dec0-4382-5c3a-08db44a49faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhW8kKQOUChP82k28L0qSK2URdt8bFkhsk3mLNfCBVYf9stySYpRFtCttvKfig10FfOml8HnDvHuhISlQCZ5i9pdZtrxVWComcJarpJu20Asgk1tgV33x1tOQe88c69BdCU29zTATB5QcVNz6IgfgGQAJ2uNJ6SZHBABngTG2Av05gH3xQGnWS6PbXXpX+fwybOwqW+TarNeRpEPvneIP8BHokBkwy9aPVjwS5nXZwJCojqejNVJbeDgFiQXmbDwBoOm6h5xCoFstd8XpFvYJA0gLQtX2ddqszCkbQQxMbt+LelB/7HHNTEqc5Zmu2te+MnQuQFNdr00NOQxacYlGPJr3CLSowmoaSgZMPB/9q2FXzCQfhgF9zf3a++L5umsxQ1DCLPJT7cTdfL4kB8o/VOfiuzdydf6kTDAoKQZREgtAXHf0lQtHJwDEWsIjh5/R7LUdVeF96SVP6UjtP4jVSZyU2FDD+AvEilh/H6P+uAkAgvKqsLKUWrTvfz42+ttqAtd/YwtFB3dfNPekSNFiXJEQlkTl+kiwg5oKmYjMsRxRskb2CJg1hxuas0UeUHBJwPH948oE6fAW8NzmFAkHgDU4KO2A+pvG57oodguFb9scy3l8ANxuzRN3LVZzXspsn+eVbdfZ7Y7skAd/UbIug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SFu4N3MtGsD5cYIGLbcdv1TC/dghNV71vCjCM/+Ej9tkIBQP+UGVmLEqQ53b?=
 =?us-ascii?Q?TU9rsXqEeZQtVmqKhVnVPW6wVynmDO95DNokxKiz4bwbnOoVoWseFgi4DKba?=
 =?us-ascii?Q?H+hvqRZo4q9psyZ+jouwg3ODehENogWauFz0RJskTp6s10nAWJgJYB/jxGeI?=
 =?us-ascii?Q?IkFTsATDKVBcko+Sqcejsrga3UQvk3rpbzvBDLCdyFUy+xbKu9VyuuQ0GGsB?=
 =?us-ascii?Q?nwn1tZ75vVwn9Sf45l4/DG+CLMeRkLwQZnzp4a4tPPHBfldUmYOREFIb9WUJ?=
 =?us-ascii?Q?hiXIOEUOOury65mZAqbDhUbBdn0WIZJ0eWxto8cu7Sh+bfmzigSUPcY4ZwoJ?=
 =?us-ascii?Q?qMSC+huW74nR3S04qtpryk4UKyb1V0KQW+yMHkYFXwf144MlmAL4xr4zrmEK?=
 =?us-ascii?Q?v60pT/2hd0vmIs8dPWzmSNqIGITXwiRiktFEh8BxbwZ55C42kuMoZAQ9yxdJ?=
 =?us-ascii?Q?VWGdQJqf/Zzm+wbJL2JNCCbhhy8rbZlTNfv6HshmeTlkK8wb79B3a1BA/nLP?=
 =?us-ascii?Q?jpePH4AvNSWZaE5SAGl3YpgZPVk4+HjQpO/iOZRu3Wml5DkDHJMWF3EPje6I?=
 =?us-ascii?Q?blhLoowggraQFsGFopoWcghVnhLuAsmBH/n5mYrFdX3H4q1WRw5PkBmj9DGW?=
 =?us-ascii?Q?3YYCuu71MAU6Bf25EhDHtGQdTs4wIInfkrtcl3O7wfqaYcjqasFhSBT6Oy+5?=
 =?us-ascii?Q?Orv0Imv0e8d9nzKBtdoH6NMGZ5O3qKORVgzucbU9+DpWQc7qDjXfVjsJzRla?=
 =?us-ascii?Q?U5g75mhuRcYWLGZ/Y2RV4gFuumY1dl4/bUKdtMBQU4/OUEE1D1CGwYsLxGV0?=
 =?us-ascii?Q?7uV54IWgX8TcFe9YaZrBYfG58YrWgta1TGGdBbd1ohyX9TX3RgrP1wpgwr0j?=
 =?us-ascii?Q?UFGa1ROCd1S7NtqJP3ZO0poKkvPBZc+6Se1v8efk4Uv0+U1TEjK0JuBJrUSx?=
 =?us-ascii?Q?kQfCiXvQis/TR/jVnDSC9DR5sz6LqUxSJwZW59Ttb7CszXA38WbopxYTJF2M?=
 =?us-ascii?Q?qDrh5enjbcwNyYUh7Fq7llVPYLmfaMMlj3wvYAhJqzx0Qs4syojO/gB/8n55?=
 =?us-ascii?Q?HQEYqGST04xzU8Zd7pJqzW4i4Qu9fjjEQWfSVrHks9vMc8pA5JS02S17FaKs?=
 =?us-ascii?Q?BPgzFYTQgQi8xB0CWUlQEBPlMYCgf6gLl7qkpTY+RKg6uxOCInzNkFO62XJr?=
 =?us-ascii?Q?tpI35lKx8yVqKr4tP4SEgaWZATQa0wrkvpWXf3UMq7i0BQP94v0Lz0a+5V8Y?=
 =?us-ascii?Q?uKKx5R8uMyhRSilTZiy5V4HeXjp3dMu5FjzuR/rZ8Ttf2wb0LUc9l9CB6Qyp?=
 =?us-ascii?Q?fm7zGt8pOk31kMTzdCdq5CmjsNUsgfPNl3+Vh5rNwcIolZfGvHY56apOkhCC?=
 =?us-ascii?Q?Ihs0B1o9pesR8oH8zknoSB8h/ni96duebDQ+HAi6nMlYrtrOQ3J6eACeJ/1i?=
 =?us-ascii?Q?rPskciOmbE4k7vSz3n//sZKIZhlcQ6UkPdklbRRxxRO1lQAqn/qqsH4Ych6J?=
 =?us-ascii?Q?DuDcKg29lo0+Dm0pGB9k38nbzjul7IU6CyZAogmeprRhNTU3UnkF45O7+sAK?=
 =?us-ascii?Q?wHbGUGmfuTs445ORTkdUtajWohYO0fKt2KnNMsjq+Ekc5fiPWIblCIDaLYkr?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3db6f63-dec0-4382-5c3a-08db44a49faf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:44.9196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s6IIBQZUN4zuIaGLZQze3EYnbkYn8bZbBArrcuCcuofKisYos7yy026Ml0gIsJK3vQ0w7A5cVyS6dcDuAkwiMGgDi8K1YcSrnSwJuvislI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::710;
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

BAT is written in the context of conventional operations over the image
inside bdrv_co_flush() when it calls parallels_co_flush_to_os() callback.
Thus we should not modify BAT array directly, but call
parallels_set_bat_entry() helper and bdrv_co_flush() further on. After
that there is no need to manually write BAT and track its modification.

This makes code more generic and allows to split parallels_set_bat_entry()
for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 14fae04c99..7f076db001 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -427,9 +427,8 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -467,9 +466,8 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
             }
             prev_off = 0;
             continue;
@@ -486,15 +484,6 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     if (high_off == 0) {
         res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
     } else {
@@ -529,6 +518,14 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


