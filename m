Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC8682A83
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrt-0003R2-N1; Tue, 31 Jan 2023 05:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrr-0003P8-4a; Tue, 31 Jan 2023 05:27:59 -0500
Received: from mail-he1eur04on2122.outbound.protection.outlook.com
 ([40.107.7.122] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrp-0006XE-D8; Tue, 31 Jan 2023 05:27:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ+mulaqi+mtqFEahSsTOgu7QtBlN7baW4lMDA6OYXtkuPB/ZL8bVX9rf7M+JhiWsKewsTHhgP9F4l7+aMWMw2B08IPwrdUpJdMny3NM76R/RXmW9fWu/YSc54njznUpD0YN0njrrLCXlLjlGbrkVGvUl/wUzpHiyWC9PmIQdIrKl9TvCb34OgEoSlk9GvCdUDMZ3+Qy1gnN6cSjTfn93sVreIG8hK9qYKDIj94sbGoQ1wa/ybT5zOPHoFPJjvNoWfLvtrlHKKpkg6s+1HzBjp1oQ9hBgI2mB0GA3nTFQdDqG/ejRpOxJgJVhQfiz7OQrd2zL7z0qih5XO39Ms2m+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWHA8EJjOhuvT0aJtGXbHtecNQioXt+iEQlas045jas=;
 b=k8E175ZIUGwo6HVwLtT90zQB2WkToz6p3+YSsYQZGEHJvTAhpR9pzVw7xr/n81qJdgAP5Tn9OLQsuqTKobVx8BjOJDCjMlZz/KNH7/xuEe7ON1kcAi0L/HYDM48anEQb7wbPFEOVkfK7K517KDbiqHKwkzA07SC3nMyUquLwM8nqfaj1UwvrH99OxpbRBcJSpI4e5ZoL4SfxyAbuKwofwdngLIOdDVPtcCZSGaHjfwQMMqRYxYNKdO7ZsaZCBqOMIh0icEjLCUWKWqbKCYCCrVfxybSDD64kp0LvbsNTiSk21JVOeCneFFwWLcI1ecmOCVl9mTjAfCZ+Yz4WQ2PiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWHA8EJjOhuvT0aJtGXbHtecNQioXt+iEQlas045jas=;
 b=BHtwG2CYfAYMT2bcu9+DYS6iJd+cYoE7jqFKVilZYmHg88eHr9oyjNaIpUKnhwOz5vxWSs/2kXnEBUTmh2sy+ICWNGjTNJ6M9+9Po/S2XEYYtZicbjFqukIo8uoVcWkB6BFE0saTvBjUgXdhi2wqMuej2jMBaJlX1SwJhzWziGfpfgArBE+XgD1L4XSEN8ZKjzOvZbM2wbUpTZF6frXeZRg07PPXTSUsEMWXMSbWHMc61qTGVW5bwbhgJB4JCdrmU+au90TVj5/HGyrCWReLabh8hjdS0l0oj3ABp0ppdGN7HGQeFtZtBlCV93NoXIHb538a7NePoBADmFsAXaQD5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:49 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:49 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 05/12] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Tue, 31 Jan 2023 11:27:29 +0100
Message-Id: <20230131102736.2127945-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: de64bcb0-0f93-4603-ca35-08db0375cd28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7x7YCJ3IbCXyE+7KctiPbcjuvxaxOuEXvIRCfycuwdfW4zbjJZQqEteOlltHIYE19CMr14K7LcE97vlDjLDbnVmTWX6mHyptwh9s/SSmCL1BEn/d0NNllV194unVQOJu/RfYAy7CUo/0i0DUu/bmkqouxaP9SOFz53GiOd0M7RmE72eURCzUM82PcBXwACRkRxp8ALWvESljRdi0JH46FCA9CaihTxDLBIbAITurVUhzP6SjXzq5F5BzxcheKUn+A51WvdyOLqg876nsO5FTl2SztIITs66zb2hI32TWp/e31ak/jbWen6Yly5ZQCVeSVy5N6lnU+JEic36vQbzFL7hpHBX6DifmHrLO3F/9v/B1MW2OSH38i5crqVPg6K2DLi06Qxjfcg9AT4WkAhqTiLEptoT3djcbtj1I5f30nT0TWUwAKT/hAHz0API1xhnCthoh0nqY3u/6lekJ21+UQaLElClg05F5xY31vmJztXH87R/7ubRc7LvZJkE/5MtajBzQyE5urO20i21+2vUnVRQZPK3gI02iuuymjbhO5YFFGh6BHRGeFa6OXJ++TvFbavgfJsYt+VbCUdHAf2DPrtIh4CR9qhY8ZXTmBbULnN8wCCcBDwKFNvCBjLvY/BEaJuELOgUyPKA8Xn+TA/Qi3HAnytPy0zUpGhF2jjcthkwr5USeLg77RzqljaM3y+PgP200kN8VXLy51hC0kpeMd0+PJQ0E73yniUb5OoQg+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2V2PzWAo6Y5VkgXw/5MP1PrXhYE9all6Z8qN/YB+JwtvfT3+S2F2ocztzZs?=
 =?us-ascii?Q?qbBvLkNB3PrvqM/UueJEz4U7CbvnynP1dK5Sbbp8D/kMHDJmFFs7rSxIAeBt?=
 =?us-ascii?Q?aokUJu6NgOGBbj6A9iyfkm+eT4JuO8gKbietoARFjnQeVM0NMhAITknP97kw?=
 =?us-ascii?Q?m43Gx5q5YCUkSpbgLeOFlcw3VLLvOwPgjjMFECLsLyrEUMlhIXdHKkkwH4Ec?=
 =?us-ascii?Q?EFnWBZGjHZEgNHBKYQ2xJQx1V0/Go+IvXv0Y++e1/K8qg+Qn3JgKVBOaa+mW?=
 =?us-ascii?Q?VFXwJ6r3xYqp5XFre7OK/iKsGrKAuuCpMALPbTZ7CVICf4AGjyNTWOopnACu?=
 =?us-ascii?Q?/5c2i6YyutX6D94LcNaQKPdpcWJfCHqowQGgszi+lKOghrLbHQoqG4Lvkv/w?=
 =?us-ascii?Q?DwfDXPrzQuU2kIIIVpXcuYDXLChvgmvshQDKZQlCxor43UPAsp6VOMVgsjXk?=
 =?us-ascii?Q?l4TUKQcU8ZuG4pN8CZh39nO7tVSChCm2FtSH4HzfTSdF/mDZ0N1ZeZgIkkFu?=
 =?us-ascii?Q?0Ih4wKqS8ixuLst0TSTiY+xwwC0XaMq7VIWhf+GRhDf+dtMnS2GMifytdLgF?=
 =?us-ascii?Q?CwK2wMoBsX99RYA+5Z6LthktfVb3QZFTVKCjgZ/ftuaaDMJdIpOksCLCKIP7?=
 =?us-ascii?Q?IwgKbWay1PoDAKkPX374D88VdyahlLDLYcoo71F+OzYZyYM0jW7Er9mvplYe?=
 =?us-ascii?Q?pPBomfKqxYKJc48NvzL/hP2ycU49tvc8yGN3pOBMtvwvTCQPVWhMhRCAXHW+?=
 =?us-ascii?Q?5OEmR8/70e4TvCUbDCYoEFLH4F6FSZaUXDrYpk0wmsQ03uoJociz7aX3fL/b?=
 =?us-ascii?Q?5G/SefCfjx0FjfoZTU01xVdC2ZXK9fInL4ziZxlF92gCsyC7Q/0m5IbP8D/f?=
 =?us-ascii?Q?UU9KAuLO68qQybZ9LtwNF5RcH8mWvTcrLhbPZMuDz+EZsu3PSJNhgP18Sz4i?=
 =?us-ascii?Q?hVrjsBT2zXP6QyYtJLuzni1xgfuQOvFkO7Jl4E+ICu7E283qkkA5B8H5HSx5?=
 =?us-ascii?Q?qstL8y6TbF9kcc3Bv04C5Px7G8/yEa6RlMZhws0tjekDSy8U+l9Ha1KikyaT?=
 =?us-ascii?Q?DsE+SSY+WGPkwjfWBTVxEMJwKVKshSwSlVFmm5akzHGAjH9H8SAsqH4b0Z4M?=
 =?us-ascii?Q?hcPcwG8hNnq/QbgPRA/hFzvefNOzLaoUlyTqyYzhsnFc68y49ixzbfx1D7NA?=
 =?us-ascii?Q?YZz8PR1kWKTdnI2XdhxibjFmzFHbaLlY8BNzILebuj7wUMZm1j7Lae68P0xQ?=
 =?us-ascii?Q?hufXMc7vVkQZLz4QYXxBjwzQgD3RpMwqcrE3HjntZLB5SFfMle9BzKmI81iW?=
 =?us-ascii?Q?2msQDOXSlCOz4sx6YYG26z78KDGDZdz15hZMg+ske/z1dvFjScJugAitJ0hr?=
 =?us-ascii?Q?myIeX0rI5ZkmUKXQPi4Bj/pMleV/zvNS8eEu03KkkvcZbaS7Er8nBIpIJf9U?=
 =?us-ascii?Q?Y9ojXOVbKethNwEMiuDr9AeHqv0xb+uibWLKtY42QyYB5+CJA6GovQmdA5JO?=
 =?us-ascii?Q?L09F7UiuswTcHaqk74NXF9UKsyKKaeEdZBw6s3v+yOknOO9nnJfC8hDCooEl?=
 =?us-ascii?Q?RVUEtJ7bd+m5heQuSrHEGQTaGplF8CseClBI5lQ70FviPwc7TN6EWqmy79Nh?=
 =?us-ascii?Q?4GY1pLCUNPUMrHMWlHC5lzo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de64bcb0-0f93-4603-ca35-08db0375cd28
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:49.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUt5w6tXMLlWhZIowVMWRx3DRMaPxtKLv1XI6W8gQwL76hL03iQ7HbSBd0lU3ny+nCRPS5nKlnHTaAeURCE5h4BBneffc5SPF8u1qDTq94g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index b2e3f5f98f..63bfd7074c 100644
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
     if (high_off == 0) {
         res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
     } else {
@@ -527,6 +516,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
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


