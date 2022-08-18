Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D159876B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:26:21 +0200 (CEST)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhPZ-0003Wa-2M
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEx-0005qW-Nc; Thu, 18 Aug 2022 11:15:28 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:49772 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEw-00071E-1g; Thu, 18 Aug 2022 11:15:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVVFGcXCKntWg2ECPJVM/XGAZ5IY7k4DHuQZILoWgoKzWZzrcK5bsSQg6WfDeFIzJqvpB014rhBZ1TXnhJAAdh9PjLi2WSoDIwbkZ+2jfi1j+YEEUfixEwrPvvn0n4oSVzZ6/K9M1USgreQjz3F70m4VMubSCM454m2SK/106OGXbtyN9dc48A2llthQB6CmlcaFmnUdus7EBf23pSGwGVlL1W1XElntT1G+bdrRHsoNkKGXpD5p20esdI8x3RODBcSG0HPeIBLaLLfGy0ZdqYyJt/+hIoX7qjfe+nZ504TLXjFBXftcoatS8B8YRz8hdidRICKCPn8TMqa9dVkSNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7VoJmaMl+FYUR/h6vJALIjCqlW6nLCERRsskjqFa8w=;
 b=SzXAoJ13VgZ5lBmZK+g8MoTqRF6EL2eEPtf2LOXLUJ2Wtb8JBhgqqWgtPtRtwvj7E9Eix3jqlQR5MThPIAFPI+ezrEJqbZwRgE0lYYmN/LbrRcO84xfqOffW1MoKvW585aff4NJ4UJgy8WYltTNc8Fez/7fE68dDY9gauz5/4qgb+EuTBcORU4SS3mIRNZDdr7xFS/N22j2Ndc+iwzX9uY9wR2RdvKwVHhGWugWusTkr3+pDpFBHNnLu4GfhGnUR4JgL4C20PVZUmekDTGt0ocg5M+dtkdzXGgILnocvnNDkJEZIg6fwGsC2rA5fCczhTPZDeEv3GmKnDv8XJQ+vVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7VoJmaMl+FYUR/h6vJALIjCqlW6nLCERRsskjqFa8w=;
 b=SHm3jpeFWrEeY+wFSFUEX2rwGdiVPRNRZ06mDzaePpo0WnZXkSEluVovoOBSdsH1U6fYjDn9bTuUeLRNYcKskj0aeD68fSMDE5w9R+Xz6lHXLNwWYmpHB76tVioUfocCEsyaK/Z1OWr14tPYYe1U17qvW5IACcb1KFgO9CQjAMjEGyDDFXPaGgU7WBJZa8eDy9oV/8BBuKrBK44r9ae+Uo4PIkdRparneT4KulOr7cAWaZzOX4sv9IywFDf2f+4rqE1n1yVDxpryio6wohY4ni9OnOzklE1DvsDDo5ha9c7M/uGYQVkChDEQKqjwhsHfOcJlxI7EPfKPl5/5Fb2kqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:11 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:11 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 7/9] parallels: Move check of leaks to a separate function
Date: Thu, 18 Aug 2022 17:14:54 +0200
Message-Id: <20220818151456.2118470-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b127cf97-f759-4ddd-b6e5-08da812c7175
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFBBKezJYsAhKlsw66/nVQD8EEb/4pjnC9F2PcHNBUDXTaKOHOpgDhtuInny5rf/6Nup5n4ZHCaLts6TkFZG4PLRU8yQbt2SSqcxKIuZqazPgSnGVaOZsAZA+xnrTriMyUJ4Z9aPJTiM8K52H1dZyx0asd/pwhuTBLRH5KrOwll9n98Oj/gZBuF5rHknLVY/l8QaUtgCs6HtQV+ZWGHyeBaJkNeWbAenLuBTe79A0VDjdwuYrrmfYXowX60PSo/5gggmcd5e0ztA5urIDPIMhSgbQQ2oHeymNq+TO9APbz4Rpheth/Bbqz3BF2gr69yX6K7tTzJTSFHTUIWG752Yk53bpBm+f2wIX4/ooEb+B/6iQxR33eESQcJGjXYhZ8zzmjqKC3BH71CTlD6Fjskkg8oHMlFwBQ79+vaucAD+kabA4mUTG906HUg16jTQ2s2RqnMIGjiWloMZ4qfxFpQXeFKLkqvlQ6BeW2VQnof0/iWx7oH+OIJ8L99pJGZYPdvE/NutF3QTTTa0PdJkFdtaKQ15v2OI4BV2YUWMCUO/V2Daj6RRqPLrx0mz01CWyIRrTZKKElXxh+5W5LgXhfFb9SqX7o1Z9iWLvxNZbW8jPE8iUhX6WEYIj3ZRYCnv1+ELuHNwRZfZPcQTPio/il5nSeeXWZ+HBCJR9wAyue1n5RpESgSJGAxT9ufpLdHD99sC8eHBWl4kh8UsraMbcRuF3U4pvL7RukJ6YRkw1IHcfN5fG67lkIzQ6dfKvLNKb4l3kqqpsLWPKwmqw4G0spNhMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9QY9gIEMLDIx13FKCSY1ZhwCItGJ/68o4DOG8VrEy/rSNjQ1RGYITkmWAL9X?=
 =?us-ascii?Q?MsElZMDmtJfddkzTWkt8ToM1PNGKZrnWCEQt/qfNmSvsVILegUiPYXOa6w5I?=
 =?us-ascii?Q?SDXin6DHVg1K6UIlxuvizb4Z2D0Cw+bUIdU6yUpwUt9zHt7bfFij4VpGmX+1?=
 =?us-ascii?Q?Ft5TFefNowGE0meAg9+m8S8n/1Q6X5ddwWRCIeXwj95wOurgtSUzBKEM0b8X?=
 =?us-ascii?Q?RQk4t/qZPk4SzN5ECnI45mfTa2P8ZubeYsfT5aDWC24J4LXEXOUYAr18aBzk?=
 =?us-ascii?Q?RlJlgTZMCdE0WLZGs3yWQ9IFXUpf4cOPo0s7QiVNc8JrSw+gn9NLL7w/8xTc?=
 =?us-ascii?Q?hcc97klv1VezugoJJrY04T49CiZvHD6X+oQEwDDG6J83jft+a1gbck/QpIhi?=
 =?us-ascii?Q?VfzzSEwvIpPtPYbDh+vakeo4fcQqaR8oUeV2HVZJqBPe+lusq7nCF59lVaXP?=
 =?us-ascii?Q?UhUBVr/q6IjicjC64wsEY55p5tFA47r/Rl6Ueu6I+Ckq7H8fMZm3swiCLJNy?=
 =?us-ascii?Q?3/OUYPTGC1x20hv3dwMMDGA0EzGDDGZSAumocSilB3maZsSNV16MFF32f3Jf?=
 =?us-ascii?Q?zGben7HkvrmtnaExbCDJC6cJmkWVlL8oHZcV7ZHocuvUftigkc8UxYF7yueo?=
 =?us-ascii?Q?hIMFQ2nHWd9IImRpvHZqi7sOuL6uLVkIoGV3P80iZY1AcVw/rMAnvaoMClpF?=
 =?us-ascii?Q?3Yww0zo22lC2qVHcfAFhHl9MRZyOSkJJTj0ybH3dxIMIOnMS91ZyIHjsWU2a?=
 =?us-ascii?Q?3fEPJ2LDX3MwqtRCFiR/Qi1e1Dl8z90RQ8Ce16juDnYmoeF4QjZ72+37InwT?=
 =?us-ascii?Q?O8FUfWCntDrBK/Z8nOJ33QiFbpC40BcH5yEV8xRNsE/3DW/oeWp6kXnaqBhK?=
 =?us-ascii?Q?NMtUCMUfSe06R9FQ4TllvlWCL9qGWxIz4+ARHIJixH/Apt00yg4u+LT4F9pj?=
 =?us-ascii?Q?vf7tjl/9MGDTKAXCEseMzEmz/6WtR7SSCJNo1wgrUeqYv5b9MH/AijcuR9JS?=
 =?us-ascii?Q?4TUZ7QuPN2ywfDkRjFURWf6BN61DIvYxHfDUZoRTM1yqsXvsELdvfzAXJtSX?=
 =?us-ascii?Q?n76dZlb2xCFCS5w3usDnuUoIa8rB8NeTFrT1f9/hd6U+1V1/jHLnr4m5wrMK?=
 =?us-ascii?Q?jvOnanZ5T74HdlHQkJ0f+ifF0XkmWRdFYB6Z/YUPXv5fsSDGVFke62kPlz8q?=
 =?us-ascii?Q?fzgE7FGG1TCA1RNQTmslNigskTx6pwxuaYlD5WOhxCpBdS9NNPUANSpG+pIN?=
 =?us-ascii?Q?nzwjuvVrSJdaxOtF9dpbjx8J5/v1d+lGdKssLyrtrvkiUCmAL+jkUw6Njhxz?=
 =?us-ascii?Q?hPbDRdG2OKkoZbyclEAE4GnM3jTUQrMwhwwzDM2MhbZdE73vqCiHlTyNbn63?=
 =?us-ascii?Q?/VXrSijUMSFgypjY7p0Kh71YD45hPtk3suy5wj0c5FtS4s0aBpuX6D4g85l6?=
 =?us-ascii?Q?gg/f/q+A6W44GLA//ukYIRmrIdf9UWi2NQlqSAKP1S/u8LI8+5Ar0kFiCeEg?=
 =?us-ascii?Q?WUQBH6zZJzwKChH328cRLo0XOesL1yVJoVzYRrxX56+2nTRjH7XaT39v4cJh?=
 =?us-ascii?Q?9nHVjs2qdLXxjuvY9OjkNVuq04JoV0zB8bP5LJx6bGfBIHxHKXHTeR3oUnjV?=
 =?us-ascii?Q?c6GeMmWDw4arXFpTuAj+YNk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b127cf97-f759-4ddd-b6e5-08da812c7175
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:10.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /D4XgpIE+LfxlYpdZz/ggzYdZwflYu4Dlpll+Dz2hr0wL2t1A+NR2bqe9oAzwqFUP6zF8N3xnHvkeBKnbW7pDfR8OSwsFMqv1ZykOw9XHEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 84 +++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 32 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 1c7626c867..6a5fe8e5b2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -478,14 +478,14 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret = 0;
+    int64_t size, off, high_off, count;
     uint32_t i;
+    int ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -493,41 +493,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > high_off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -545,11 +520,56 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t prev_off;
+    int ret = 0;
+    uint32_t i;
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
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
+        }
+
+        res->bfi.allocated_clusters++;
+
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
+
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


