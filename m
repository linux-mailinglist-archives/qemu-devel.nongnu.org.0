Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D56EC908
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:33:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYV-0007eP-2Z; Mon, 24 Apr 2023 05:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYR-0007aA-SE; Mon, 24 Apr 2023 05:32:15 -0400
Received: from mail-am0eur02on20719.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::719]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYO-0007Ri-5Y; Mon, 24 Apr 2023 05:32:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD+/n9OZqQ+knAk6ZgXRppEqevsTuZ7udNV0MlxTlvaHU0Y8gcLX9mc7taa2X3lWbkO/y8YzWWTBR+Se+jeabFN7gPKNDmedukcw6BrtVXtJ9lGAzkJw5u+/szTotBnxgLQ13d5HSabrWBazLfdW2pKDAwAqa+vuHjXouPBw8fUmfBEAcxuDY4KXG6G6lzKBgwhDl2IxZWZvuh8M2UEjd6MDYY1nDCoVYTAH21tmAqduaWbpt0+7u9jzbpjKbLU3IgOejOGufPNpl5/v5BFgwPv1iwJDC8ixVwi21002trt9BnVgEI4Fib9xdjh9k+9viVR55Z9Z9Z80TVknOP9r+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEN6uvzL47tJIlWemMWFzC2Yw8mGEH1Iu55bJZSXHf4=;
 b=jQrxj8IVFVxmZUd6flHid3IABqRgA23OSuj0PNJHmjZ31Iqr4mUnQMcVgyCSU0jML+YIMdtxDX1mvXXAp/EAnZtbk3sgEhkvaBiZBgfImFCWnEz74qVy/9fWejqLTbdAGhF5ILkhsKd5VQL1Jiw4+KdoiZOEk0y3XxPhZx8IiPhEULfXvWfo4mg8RHgC8ezBgwT09dD1xMOFvbU1ON3wIWZUMPWeQ8G12qwHTrre+JF+JQ/fx/5aV+0QCmBh8VhoQUQvZqlLLpMyM4ezrfQBwIqh9vjZgmFQIdcM1JM77WEHTfw33cu9So1UABeRfWR3Z8Ji2imTGvhZt6KMsOdItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEN6uvzL47tJIlWemMWFzC2Yw8mGEH1Iu55bJZSXHf4=;
 b=AoLvUI+tFjY7ymjf9A2pIdYNwpL5JQnfMZLBMyOsg2538MImBzV7v8P8Tf0mU6v2NeuNThiaoYecnqlZibxckm9JQr0zQceEt3yHWHYKlOX5ckfli2XbAgb7chHguSb6QUwlDlkOeE7+KMyAoDImq6tjhgXO8XPj0YTUoON+cmKYdvJzsDfx+uJmrmMQgRjUuPzF+YWps4tLH5b81MMLzHBR0G13se1UgfWBK/WbCKpQ6yM4YhDEaV204DxFyqVJXsprz2BAIyjt8u08MBv4/iUtIjcLaW9mCVtupn4sZs7qzABRtX1HVwr8RfTivkYAUU8MbAHbDFWf0JldMQBF5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:02 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:01 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 05/12] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Mon, 24 Apr 2023 11:31:40 +0200
Message-Id: <20230424093147.197643-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5b7a60-bccd-4455-b5ae-08db44a6c243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhZ3oGyssc2zDoqCko3GQlopv9Iw6Oi7McVoVtInTVNuc0+iENg7Nb7YPgW2cfM5PVRCmJWflv1I2C/kMxqIKClflcsAltGoD7zUSHrfyyEPoQbH6Ftu7Bi4WJ7Uf2zItkhEewCyt5ZykhnPv7BruwwQlw4D2dSRNg0dlGXqsypSdW0YjcDdRJctHS8Qy3eLftCgBcKWvLTV+1SkGBxGIwDczEKhKb1hp73Asp+N2zLdPJDlTs4fSh/mQzNNln22UlR3720UoXn+t1AfXRcTg7ZkBQpqzLU3AzEh+CVH5z+12kQQ2fYOVg3/qdLGYw27i8XFOQ81HNCiUwQ3FuuXcMQer/bbhRBCO6WOFv/iIujiOgKDtPNbgFd47iTLQg6ux7KHKUEvq7yM0lrN7bMQzRq5xBcoWjd0nJhi8k2pd5hz8GpZ875nZXQRE5Llq64ZYW7jbXdqyyTXyfJYxh6XFGt0XqlrSwFUsLXKggOKCHte3YPNnA0GQNl1v7aGyMY7d/+7IgCwAvP99rW0vowj8+du7GfYy6V+NppqYaW+PhicmzM16VQe1587n0q92Cg8xZjtOwGZ7yAnM7maqdntdOJsLhvcN1FPNI2ng1Mf3883P06rre2hBPuvADoW07HV1M8iLMIEFvaDhdS4BzR7Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4d0du0Z5sER7qaWyZ95gSKpNAlFF4tAc4dMRjVs1arVq7dO7t6fRaDW47Bga?=
 =?us-ascii?Q?/dBMLsyvdDauLkAZy2cdmxnHWuQKMj4ioSibokUc9JZ1NptSmHS7jNnEziSy?=
 =?us-ascii?Q?2QU5Mg5HzvSc0ykZYNtGtJFcWtcKI9p78Rn1Z5N6nZX1by+zxZODBMQUZEQW?=
 =?us-ascii?Q?b2zGswaRFXVazuJsK6VkST4JLdydLtmPBJBnQ/jY5Q6Geb5Nh2aXCXMyw8rb?=
 =?us-ascii?Q?As8VFzYFxjy4mA3GHzDX83K7v3L0PxnnpIaxOhmjFzb2miCEd/H/fTmoiNwr?=
 =?us-ascii?Q?IZIrEeMK7fbjSJOTmapUZPmmmLaHhMneCVQjGk2ueU/7CIYg5oBKxk9sgKuA?=
 =?us-ascii?Q?RD7QnEBvl49wTqhKhKtzDzJo2GhbZT1afRGmMUGdV0VIg7K3FY4FDVIkmoLq?=
 =?us-ascii?Q?OwnuVHEXcErBGj0Epi9k0gvLJdM3y2j2uYFgLzJouhrzaYceYZalHvZ9sHvm?=
 =?us-ascii?Q?UuH0h1H+8qwhBLWzH5/H50jy/Qa1/+ZZT5/nJpctPgNmB6tJoYRcNESMxRmI?=
 =?us-ascii?Q?J7OaOwxPbinSblBpjxDAhDhLD1eo/f2qpl5vx6OSQQKCAIoXea8nTnWE+Uh7?=
 =?us-ascii?Q?TsaCDIskoikvCvrF0q+RCDRNKQKsTUq8yfNJmeMAuW6OIq1/z8icoiiZGr9N?=
 =?us-ascii?Q?jMWovmIwZON9d6GaCKqUtDSX9b/eQZyj31ULI5ci32K61tPOd/X9NSagIZTH?=
 =?us-ascii?Q?6Mpi7V0TsUHeL5NRMmfwhaKaYQH/xQ9p6CvrFjsfGky/u16yZs667JvzZujd?=
 =?us-ascii?Q?qy9yy0gTFsgjf+OmYpc+nzh9pHSS/gVzbcKHkoLPSZv8jBNpj+8FyDIqweYi?=
 =?us-ascii?Q?HT0P/YD3xXVRsM/nzMRwXXk1yCmur8mA2TTXVbvExo/o0EWfdMk8E09vc7j9?=
 =?us-ascii?Q?KZ6cN+boZ/jgSzUspy1XpcvFud+AuOBNYBmlXuEKRipy4F+mdpRVwgoS4++c?=
 =?us-ascii?Q?qx3kVcqGsSithna2LaSVKWi9QnABfxwIyP8q+5nQ8YQfk5L8ubnrlS/w0CkW?=
 =?us-ascii?Q?hqnhH0cyzxBHkgOd5w6t7l3eVkpe9L8YczQf845RN1C5EvJbD9smmlIZVSxE?=
 =?us-ascii?Q?kJ1SCvLI19jp+XgEiU+YS0BApr+MW9DBcr+B0L0KcSc3k7XYf0iW4JXjEGsy?=
 =?us-ascii?Q?1CHNFLCt6HjyXlhL6EWCvXd6a+YzcM6nKXKIOcoMGrbF2oUt4hO1UTu3k7p2?=
 =?us-ascii?Q?s3wgorZnmiveHAbcdOAqx4zRV4qwgIqDpHwerALHn0D4i80aMTYsIU/bVWmW?=
 =?us-ascii?Q?ImaHqSCt98ASXY29OQlhgcAoBj2YhRmYqJ04HK194YFzwBtd33N+t4qVpZOQ?=
 =?us-ascii?Q?63jUlgTNpy2tybqwEN5yQJOcKBgBF5K97PKZUOtx8TSoXlQHc16Ch2Egg23a?=
 =?us-ascii?Q?GKqq+pqPwl9xzTNT7kTlJXTFgrTJmunCRrRBdDaECFWGgWwi1tKfxZJ7d7GN?=
 =?us-ascii?Q?FvDghLtd8Cv3KyrUDP4zGrkX/B8kJIOwhylnE+987kRa2UWYmzwe7czTDfX5?=
 =?us-ascii?Q?Ryc5/NQ5c2VCtVLriFzBEPSp1Uds9oUpKoANONHGNuEG4rFYGcflUEWPoSdv?=
 =?us-ascii?Q?t3y5CiEfjj1lgxTVZTNHM+TqrjXGVxHJITsCC9bzbeAip2xODt6TolSwhNt2?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5b7a60-bccd-4455-b5ae-08db44a6c243
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:01.9174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IO/XUpTRlvGZ5l+tvxUW+PcyaDmCoR8ucL0+PWHcGhHG+zwpvnorNE3gJHGqDyTJLyWqG6UKjY57rZka+MdRhYNYK720D8YGwWD9uZ/AP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::719;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
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


