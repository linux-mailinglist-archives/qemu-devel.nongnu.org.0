Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A45A4758
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:39:24 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oScAs-0000P0-RI
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblS-000176-UU; Mon, 29 Aug 2022 06:13:07 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:50395 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblR-0005zs-EY; Mon, 29 Aug 2022 06:13:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISZyzsuvMpO10FdwclOlfUWw1ONKmo/yqei1/NFuE6oaROsprsRBkIRW8aw0Fe/7dLIX+Gn4NOQXkBaMc9ZukFONEyzwNcpxF6UifFSONAotiuEQTTQXMACAl4VB9TY1r2e3B3FMiaCND9VJn3DX2k0ME7lCpuS9p//wFWoWt1BSjZCQ0QPFoW04ZPMcMdwF4klfatsjZgDkCVf8EDXALDWyfQYp/14yW8IxyG3A9y24aacIxbzxVvlPnMQHrwusZ81HLWO4ui+Qj6240w7zgiREgHcYNs7Xsngn0jPq3+92jQq4PEzPXOxiE1wrhiVjrvsSnXVWq+ZMmUzA02vU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=EZz5KyZpwr9+oMZxtenSr1ZUNcqtrcnPywBoz8/TDH3eR1d833xzmA2FqqmmED/rt4Hx0aK4mNt4ZcogPdZtTJjepRfLjibVadLMXFiFbiKOmAg0+bKsiCtApnI0sWjNoGqKS/Aqik+3+wEMh4X39kN9700YtSg0sNq4z/7CUc9imsNNf/GDrqi1GinXiZaa/9LjTJX9cEIqVMKXrajwNmILfXeQ9GvCM+lHKxsJWaAcS4T8EhVcWm36JUuyuUUrFoGTEAGVCF1L9gFycsZJdxvfnLJa2M1Nr5/ToAMlmrV43SkbPSJTUfXZjCMBYLjc+8afECjx3lgTUHQnljtaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=hh/fyfnAA5lFbUjKJHCAcfOH76G3ArWUEYBU/A/9vRvI8vYjyvERoX6soFC/Gkxk+iSyget2G2/h9fFkqgGVgAtYzNSGzu017zXhfc8nhtggIWw/ZT77w4cAT1vifRteRnAPJk2iBM7KGM6yj6KYhbewl4z+iAiGXc/CE+Dh8LqaDkSScFAMfeAloU3FKePFzcnRwPDJUJynjAdoZiC3bc4hr8D1IHP6lq9NUAJ++uDe0yRwY3/JpVkf+UtVj9sYCVl6oEWHD8P8XAmlew+Jf6qo5eEibaK/fqwlnf5fw8CJsy0LJeXqvxmIJwpVkdqksw7Xh1La6KMi7msfobdnsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:57 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:57 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 04/10] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Mon, 29 Aug 2022 12:12:39 +0200
Message-Id: <20220829101246.343507-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f16a52c-f684-40ff-49c4-08da89a70ab2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YlpKRkpd7Vk2K9zFAjY7EX3P96LWZvrfHVZYJORV49xp4UOxTg5fC2UjVCI47OZY7onf7ZXrGlyy5FaFOsSHZqBS/sR/3E8WjfQTk60C5PlLxDkgk5ferHHRWEUSgE2qeSMXATdo4idQwERGElvQrD6QG4fYmESkOFArW29XJj4VbJxwTe47mVqSEOC3g2ukX/wPePN9Wvlr85R3hnFpDVGr9DNZnucddbJV8EDVYzCK81wOC5VJt7V51fKS6iKlOXKkqr/OrJN7WnxwfjdQ7ekIwLVHh5kFg59zMHgNEGpEzzKdxOa02rInIscOuTB6iqKMgFxxvqfZSNw3Au7k//Ga5FWRR+duviBrxEGsJk/ov3VSqyPfTx5PUgk9DeHjZ5XllkBO+m++AA0UUhWBXjz1QSQXn2RBD12uckCtDwixi1lBvDwOKIALAO/5Ajn3jwz7Ot37FUbpT/tMpDwRHrMngBLd36EzqVHWZ9MNmV6wAn4rgGUacvXElPPV0RDffBk+4iI/Aq+GjeDmOYfXCJZBaCNXinjCLRunzPqeKD+0VxThzIJiP6UwizDSl9HzNaknV+C8Eu0QlwWxmjOCUUhoFruEuS0VvXFpVSsCOHcvnvPe6XKPnDSPu1JOff4x+ivogyCyBTtG300EmtUBkccJCBfEMwvxg1pdLbYuX5CyDGQ/RPFckyuxFLgzjuYW5ba53zGLiWlrHxzcpx9eHFQCJlY0UCYO2vPvxVqM2UH3abQb1/UCCj+jiXF6tv8WfSUwPf2CuKvFIbe+ECZUXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(83380400001)(86362001)(1076003)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(66946007)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(6666004)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmXyqDxZgDoOTLYvsa8DzTP+SU/oaCdH/ONEzQJ2wUNb+YxlO+2UJ9z8/S5c?=
 =?us-ascii?Q?BlCTYBM5zCy9w41J6aNGyitN6CowJMSriZGBBh0WObJtbk2wYBMnG5XojcH0?=
 =?us-ascii?Q?kIlJeaDndCEGU6BS14pPz/FAxsN267PQgF9W+Ge47SZ2Vwpnat9mPh6bun1p?=
 =?us-ascii?Q?rM6ZacMOJgbZnR7Nmyq/n7gRfncIEz2ve9PQ097Uws/gCw5UMCHsl7QG12JF?=
 =?us-ascii?Q?02vxETGfCFjiqZqeKqnAWSEnuG1EstVw+BNkHGKHXyyCetN4hc76KRVmi9w7?=
 =?us-ascii?Q?2iQ9bgAC2yBc5zM2PYvem2sGTbuwLzvmLsO3avpvY8TombIW82OuVTvZF9hz?=
 =?us-ascii?Q?YKkS1uN39NqLbzaMYOUJJVzZRF9pVR1ySvTbM1oWWX4s7rBBgzTk2xrxFBtJ?=
 =?us-ascii?Q?6iDrGq5Hdedd3IYE82LBrOhEdj8rNlFYx/4x1b9UBpmsO9wJ3nTES00URSei?=
 =?us-ascii?Q?l128xd8gzfkxvtpfCLiA4G0VVhN9djyCIeut6Ch8/ceOnaMvC9E6l06YCg3Y?=
 =?us-ascii?Q?uWU64Oj1X5lHJ5EfSH84Rtb0FCUVRfBdEJsr8b4O3JbPUg5aLuJH3f2PYFKM?=
 =?us-ascii?Q?d/wWzCrfNqjV9DsdxZ8MD6+yvcyisWVmdJW8G0mR5chBV/KctWZ+dJOLpVLC?=
 =?us-ascii?Q?HPJHNbg+PQtf/eKEtn3MYFkyHW2tEhvaI4DIE8Z7wnPWzGXwpOqeeyz6Fi4Z?=
 =?us-ascii?Q?ZGTdarcipMscsjpG422e0mZ020Wvtpx3XVuLgm9GA3Cnl1e2h1BETAAnIegj?=
 =?us-ascii?Q?uEJfeX9dRKueMyoAGIZHg8fDfUQgNWaeBWNCIbul1XAmkWgt+6nxMDzlI+aE?=
 =?us-ascii?Q?nu1xDVpuhWnDVTFNiIEm09umZ/gag0I+Gf436qiskHWuCdomUKllVRtaVWpI?=
 =?us-ascii?Q?35n59bsv6+LcMOBzTt7pxO2s1E0s2PMBcSKRT+T4nWMBA01O/nXuWBmr053O?=
 =?us-ascii?Q?o518nCuWC71HU/DWqNwptWrf7FizmtSBOMafWz84GJJqGfEdvbN0qbW2zcAc?=
 =?us-ascii?Q?lsvVD8dO6KqwtBjlUQLgkkiFydEbsfwdshu7ab4ayFwmYuWnwwAorlQbib0l?=
 =?us-ascii?Q?0KnK9MEBfgbKFbcrFY4QOcM8NCxibhvVQuzxyKtoCLbwikArX9GrzxwpThPo?=
 =?us-ascii?Q?oH7zdW0v3zfU2w0O/YBbX7gV19FyR6wSH0UCzaXwbi6L9/8A47Fxr0V+Dt7w?=
 =?us-ascii?Q?8kHgls1WDl2gpBe244zNG8lGPILzDE9kxNDxyEgheddtY1kbM3r09Wsnbxwx?=
 =?us-ascii?Q?nfzVDJ8V/C0P7hfLEDbPton0bX5+rUek84iYj01X7BvwSwp6MuzCaeXcTbkh?=
 =?us-ascii?Q?nenNnGdmqmmXzkSWqHt63beFKPXjPRLFSbGCVfCy1hX3UEoBU2iRhU81vwvK?=
 =?us-ascii?Q?+w5yV7+om29l05KG3pd538g6yN088/62P06NYKG/t6UZlXio/L9IkhgY31IH?=
 =?us-ascii?Q?2vxTuFBCBhPSp4vJ0pTicFVh+Jld9e8c6hYGTZs0oyEWbncnZtgDwv0N3I80?=
 =?us-ascii?Q?wdvwBOEGbvvpNe7+UwvBhaPzj0CLasPX0O2hi5Wd9wtJPb8Y+0SXqxW3jnli?=
 =?us-ascii?Q?fm9RExZLpsAllqD5OQ2AuCJDint3lIbAfTacjSLs7fICeubt2+HxtYRVs4zN?=
 =?us-ascii?Q?h1bsdbCfsPgTaFjX79AD1j4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f16a52c-f684-40ff-49c4-08da89a70ab2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:55.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEyk+Fo1IGt2x8uaVbVFNtWlkOoXrCB3fQ/nFPSD9NPgc9/ctKhJmUAcJyOmQulN29tXKbRfqK6QNA5qh4Q1mU6F1RNjw6ya2BGmr6Tz4aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c1ff8bb5f0..52a5cce46c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = cpu_to_le32(offset);
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
                                  int nb_sectors, int *pnum)
 {
@@ -250,10 +257,8 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i, s->data_end / s->off_multiplier);
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


