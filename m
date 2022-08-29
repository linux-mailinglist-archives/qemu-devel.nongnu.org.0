Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0C5A4632
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:37:37 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbD6-0000Qv-JK
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0f-0005xY-Un; Mon, 29 Aug 2022 05:24:46 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:38848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0b-0006gk-5L; Mon, 29 Aug 2022 05:24:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCiBYR3DyWVnYQXZmgcnlbO7lcn85vHYIGv/1wK7lelfKeKuPT20dEtKWPHfKRN1sx9GJpUKefyutWVa7B+6PXHrYvk5YNnpI5drHtwJMS6xDJe6iFT8/GGFwG/nfB5i6B0SLZ1RVfpPekyfWL/jzeBqtAoaARebyXeEshtwD2CTF2aTY2JKBblKACKiITVFjPkvO0wkBaEpcAJBgz959ZNrz71srMWxJaKdtU4Ge8l5otoqUvAEeQSwr+R23EPTBB03+W+aaWe9KTCZtnYVuJWWlq4GcvFL1D+77n5377fvXyfxgCUKlO6skgn6Uge9aXP88n4LBz0bJQ6W+d9DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=KapZft456jDfoqo+eTgYA4Cksu5bH+JgEzwnmAXobe1fbRn26nllRbmSWnO4yiW3NX8iPyygTMLB2r9z4mFB2TtHvkem4i+QMScaRYNZL5hlc0Wh7nHA8qHh+C8F85q4zZjf8NQfVklK28PqqNsLTL5LAQD3MWk0q2b5ZMH68u+rqfpGiFxLW5pCISCwc14oqyLjsIPd124rI8De0fO59hKWHAT0Nfql6o2DTc88oKkJtqH7eqgjho7wW0fuPdEOpwWbj2/brFH1s6C/9YosNcfJkfIfau9t5u331CnofMPR2liZCdyrcjJG/cNo5brjZM2pW087qPkSVXS5yFWRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=a7LIqQTJL0mTeUWpvqD95wTecy3oXjr8HPwOVWj1ZOMTyzTgcFzurSlcKJ0NLhgyl1s4urBYBgncaW8PRjyDDJBMXQomGEuDK8bXFyWXB2SqTSl3ZOTsiKsaOiAtgmYPpZK8IzqkrS0kqa9jOx8gRedJ0auai6cLDQl5e1J+VG/Pl+EPrtt3AXX8lbkavwbfw/BlGBrlu+f2a0bx0czyVKFoegSBrvjhu1/gEMJXbpl9Zw5ur8xR+4xrojCeOEQBwsQRKDJ5LFXG4++ngBfp5ghk0Vj7nSySiRtF55sskz4aDzit8Cg0+RG1R65rJ/0xTEkKiuObuGKH7Uw6yWJ6/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 05/10] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Mon, 29 Aug 2022 11:24:14 +0200
Message-Id: <20220829092420.341050-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ba94e9-e0a7-4aaa-bcaf-08da89a0478a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGrZLrbwHbdUMcFnGHQhYmzYr3B9tmRuKKTDhlfoubU6AoF8Acx276ftDGvcmqqsTJDFlUtRhdYIzWFyZ6/jhO7jIfPINfMci/8nGENxnbs5XNV9OTKRYPni41YRgpx08ilF2KBuxueU79GMUyg+EJRH7jPMuyDAoNA/jj5HbKypc2XJwUyk7fgzi872DfrklRHjQG8zoLbmJVHZyvDKFWL2ezFGTnnWywtvXJKTiPoCqxkDPf1gbypTU5ta16YjwhzXYYSPUr8Hb0BhXdtK9A6DtNVIKnq0/KZWvFv0s8HwRL4nhR9WgbGltYauQxxv/W397hk2uRctbyd/xzdLYDCOdghK0t/2g5iDT4++Lmf9kl7r8ZKPJcF7/gCZ0rCik8wzPq0z2HVzBK3DhhP8N1vVmUtVuvj347vxuAwgWlUI3/ENuNPQKDimrfUNcue0jEniwbplW1+C0XgGhjaSaXJHYJSWWvlTfAm87nUQzk5IeBIO+CnvtrEXCfC5XCiucX3W5wupm3OeylYgUsNn6iS9bp3NST3YTGhL15u7Z3b3pHRsaDDV8yFT0OQEYBIA8eN7SU9SmSTEy0wKwsVoBNS3173UYD7LEzWEYTB0mA2Cbzp1e/CHoNGu/vpEO5c/qRfdUVKSV+WOA9i7+ena4CEfP/qHZFJIz2xvQkf2PHTLy98l8NGVALKEZgQz17ML4i+4/8B5diZLF1LhdgtQ3PMo30Kp94gOawiHZ3hiKsRMre40/VRaOAgKScYhOaDg6s+vhl66QnTdt0xWef4QQRlmj6shr5gxWdIEMKY1F44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3KgeedoKdYXTTaF2NF5K/0kBft+TSDOXRjbBillBdaSYVHBBFJduXNkN3Ms?=
 =?us-ascii?Q?qCorlBORgu8eWdV01NRWTEZfSWeMGeoRSsYi3Kk2inHov7iS8l2gwlASKpAA?=
 =?us-ascii?Q?p6uXXFsRZQsdDrno8j03oSpuyyL2nM+YU3HP6fzLcNp7TZtWzDkBP6rHW4uP?=
 =?us-ascii?Q?+e5h0QcSxVgl2cPQ74cO/WnaGpt/mq0bPRG2mtg1UYLTxOGoyBM2VJ7R+zcT?=
 =?us-ascii?Q?kj1LlJDo2vvTfF7hwbtVx1+YjvIH/tBZ5bZsMRadTztj6ohQctMIKxJtgimq?=
 =?us-ascii?Q?zIxXPnI9otRmbRS+mzQ/qKhyqjb8KS3ZFQ6HAB84q2kJ2FqHDEdVLoBugG2L?=
 =?us-ascii?Q?dW648e62nLrQREi6TTdlgqTGD6KE7qTh6x+mXYAEu/bk90pD1RBDd2Mg0k5m?=
 =?us-ascii?Q?GKuifO2mYS3QXs1O3yt2FQIkzgWxwSo1DHQgByz6A1sh9XFyWfca3HVR7GZ4?=
 =?us-ascii?Q?bkIl0UD16coHKGm+AyJu4PltbqG9P2l9xZNPmF3UDBMHJ0a9NimbUUgtcldv?=
 =?us-ascii?Q?PO2HEvdo/w320EqtjvID75VCYy5SwZJj/qZ66+oLn2M8vC1UYfsKl9gCMOR4?=
 =?us-ascii?Q?FzoxXJqDfwhVMatVilOrLuHLcSrcIrMF6Sfhg8Mi9ef+eFC8IO8/R0mXq1Xl?=
 =?us-ascii?Q?t0RRmWEJie6YBM2z0NWzZFLZMbjVs47K3wI1gW680rj38CwXLT0rieviFyJF?=
 =?us-ascii?Q?q+DXbSAOkw2argC0nVCYzpHcemFh5GCHQpe1O/6UsLVyQKszro8CMOnVzzp4?=
 =?us-ascii?Q?+ocFMt2SDB8dQ9NgYmSuk7H3Bu7bWadkLSVU1sxbVhWxm2w9+0HKBE5NGOrb?=
 =?us-ascii?Q?0KNaaq0lwn8tR4soHs6jhzZZPL3aWzeCV9jFVg0eSUJ0UrOnhZm0XCi+t1+G?=
 =?us-ascii?Q?kd9Sk3vSenSUKDYKW4Pq6eetzb0cgI78mzdQS99GEiNvQxRbTDF37AG6C4A7?=
 =?us-ascii?Q?30Qs+R5LQE/OjwXrQixw9cbACpSuIfNl1l+g4bVhmwvCCu17vjlqpz1wvoBp?=
 =?us-ascii?Q?SDM6zyvgqMguZK5LGkBZ2xmC9mfuL42+1TKbengHOhJjyI6V9D9ZL6GMC6kX?=
 =?us-ascii?Q?8d9FzucWK/oZYDp7StAZGAMGmpV9IVtqsK/nrv0Syh359aYFU+EfUajO6LOX?=
 =?us-ascii?Q?IqGdabLmSYnkVWBjTBlIi+2mWXDOwAFRrd5sO5tIvCWZoyxpS4D3uSSysmhp?=
 =?us-ascii?Q?YhQjZdx5zc1ZrGOlcJ1GYnzm9Lj6p+NbHilNg+DHmlMr9wQtYHJnS1Kp2PJy?=
 =?us-ascii?Q?IBdR+jn6v3BV54QBraaA5MWWF0qVkyAgkvO3tNcvFR2cOP0TJ3h0AOZ/Bk8A?=
 =?us-ascii?Q?agRR73Ig34gMWVjPMqM9k138fmwW5XjCtFTY57tg9xUL8F2c4jFHNaAmbv9N?=
 =?us-ascii?Q?sJUJH4EYpv1gnQ424ArlYpMex2ci736T3xaYoH+pnyzUS1dt0IcuPhh6/efs?=
 =?us-ascii?Q?Z3E/nMYKHGoXxq45yErgMdx1jiYuM9dupLvTQ0cvGaFdd+7oFYoS4nNgOG76?=
 =?us-ascii?Q?NyBCxAvt/BryA6cIv7Kjmct8KrCKLz2VM9BK3VOWiSYxZAQqtHfSYC1gJVq/?=
 =?us-ascii?Q?LZJH3N+8FXy/nbBYvKLS5AJv9QvB+CYiQ2oRFziTLCkAGaNKZmdvCDK50MHZ?=
 =?us-ascii?Q?Rl3y8cgIY9mYOClcmwn7hss=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ba94e9-e0a7-4aaa-bcaf-08da89a0478a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:31.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcMIfzJHgr6a32TbJHNpwlOp59GbbHpJDoqxdOBcktsfaAV4NGIDP3xt8LKTS+/x4y76gT+y4xzCAlsQGoCgdooYy9UstiiTsK6gLRwwn64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 52a5cce46c..b4a85b8aa7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -465,9 +464,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -523,6 +512,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
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


