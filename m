Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69E5A4634
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:37:37 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbD6-0000Qx-K0
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0a-0005w0-I1; Mon, 29 Aug 2022 05:24:40 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:38848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0Y-0006gk-Sf; Mon, 29 Aug 2022 05:24:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHtwVn7xH0AZLDjJ1px+DTxm5wvcUimLOa/sYc0/uFWCiEwdSTMR0yBuIetA7x8wm7VV+/yoYxvpcvRAt/gdO1MLCy8x9LLpgkro+X2UB8SivCJDBGZQhIH/V7gxJO1OhiyktAFDNB99Tu4ET7hihYqZXO+YDdKa3FpmfyqeLlXmqTlnS9kRFN3JrgKraOfrz57DwEj9diqM/ZEqIqHAvuWjS/WUotw/Fq85O/tRQ7Dvi5laRfeqLgVlpVtsAbSdwEeiDFQxbxeO7MLtaK/qSAOmYi7oiddQmlT4Ja2kqhhUjORQoXB3y7Oo9Vi5PfuyAv13QmbWTa589NAdrLKQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=UfF2J7Y+DwXIRUXrxHB7AcsndIFQ4Ddx7T9+LkAAfU7fG6DKalPpmPG+UM7/mncpr3IYUugXhQMFA72eJIWrE0MGBvvVjEaVCVonG+leKwLWg2N14jofi9c9V5B56yp9GES8DE5f0xifR9uP9d8ebMTSMAGQIfXxj/LMIz4eTnTLXvFKZjW0UlAVeFs8PgTc9Oytya+NZM5Dwi0I2H7Y1dQqqlIAmkEwIZNqHFREGyL9GoS3ioFi2nBeoXtgiuTwGmUNfUaudBBjhRQMcSa97MgH1ii0peM34lkzcBYGrEFpo5Y69anxMME03LMgzTk+8Ebm2v2+/rNr28XTA2q/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=BhYlXAJE1usK9voH6R6pHxwFQjxab7/inE/PoJk9ZmgWb+uqLOnFGr+0qKiMo9cQma+b+rvh58RDw5yO/qK1Z6SMptOpMBU+LWjNwZG+fzTsp6a7w3pQkJ9tDKHzyDMEcYUhIdX8uBA+b+V7F1FLVt6puEyjG1QIqahHmwPR0irBuBs6KweLaDMgs9ou3+AMi9VUCrxaHlxBKLYYEVb6U58wKagZJeCmyLPO2shTt8iT8v2/8CqHhsPj3BA+5s198EUCUmB0EKXzD+lKtIJRh9CCKQXfA4EyN1HkxfbBGEyEpTIVqVZgNey3QyJhaYaCp7z2bQH5/qNeW2ch7SXX3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:30 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 04/10] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Mon, 29 Aug 2022 11:24:13 +0200
Message-Id: <20220829092420.341050-3-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8141e48d-5c08-4cc1-f5d3-08da89a04710
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kG/c5wymG+E4zRLJjTVCnA6I8zX2IL8kHIzoOxDsbndaaQW4YthIhdbxrpejpGGJR5lTLyKtGSyZ06WIlQzLyPKeCiZMfeowH9iFoIz7tq2v17EHoCGFK9M/ePAfAXb2C5VuH1TFt6zgh7QyIAwy+FrZfLaG+5z3mb4nngo1+jDFkvDdSt4OZkXANUcSXLGvQb3octxCeBuDO4fVE5Ue4Ime3rDRAE3akz0K1vA0qiILse98/ahph5KMR7/TlB57wKpH/sbTRxVm32mc5P23ZfuwkiCYdeAMWMOseVWnf7YQ3hMxHd2amT0oOdzHY+XUiBFK+ZGNZyM36gBXrugQ52gIiRJEMHFi8Tm5GdufzqqcEIU4oabb7QuW6PVpjBtBcCod3vMCXJXcDReY4FgmisN/IzVwRiRMnCVQrErq7YCwz66Eoa0Eup2OakCwwmnYoxkpKzKQ8FzVK86Hweg0L75fBy/U2k7Hiv8QJLd71UVIkK71XWtq7u/slRiPfuWWaF8n6tUSOrEGBBbZapx7rrAHOO2XwsJbFMkd6wlgE/evTTY9R/Wl35Ym8YQsIzGddCnylxP5jthNE1BJvYXS6vO0RcUcYiOcrDNruW02Fgxy1RubEX+H+BrlQGclNcwliVih1u7SJM5cAZbleFyuU2hafa5YoqCIjoSBvqtnbW6+BjH7nbL5tM+GvZMq2Q8ag6gw2KvWf0vC/WDg9aYDKRNOoMs6ZotVewgidmGfFfCZloCzjq/ZrWSeo3FisR+UywkM11h+0hEEiNrk/Hg13Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a95WnifaeorD94ahv3+SWtv1w6XVm8qpdbFZTklsFON4wqB4rIqZAYQ1Zl6y?=
 =?us-ascii?Q?KlFUxdh2Z3l0WGgN5gOytSFqWl0TlLi1O6GsD+xvjim4uzrgPH0EeUoYlBVL?=
 =?us-ascii?Q?SQrsfVKs0PD1DxHjf8ux5pp5Uowri74eiecbpLpIIwrfMxsTyUl1uKsUmo9q?=
 =?us-ascii?Q?J5Vs1CVntsWmn04/8ewT2BI2nvBRMzkvmiqvFqIIjC18jJXD/31XYomfiSwH?=
 =?us-ascii?Q?x34eEWWmvbTu8yn1HV1eQiokNodPI7sEg0PMUxhT5P6cpEKb3ZBfGpqjlOHs?=
 =?us-ascii?Q?LenLSZFGJrwJ8n04bg9B9GIloZYfCjEwyPcPfe0iKOUY3erfnsBppRxQVKbA?=
 =?us-ascii?Q?dvV/gSliPuU4qDQ8Mw59h+EI16SJn9fxhyukK0iq3qG2H2ip3DfykJ/0WZ1E?=
 =?us-ascii?Q?zr0KUV2bHhjUi7MnFjXCrP6uGlThgFZvH9xQWpniNSIByjgy5Lmb4i7skxJP?=
 =?us-ascii?Q?k/LmkNvYZI0MslsSJqHDFe1YahZVO1lmc4E2r6c7gYX6Mn0Q84/BKus7nkAi?=
 =?us-ascii?Q?DGD/FfZmp2lbqgYZ30WY1xCZUxqhwnPk12xnMYCe0FrKPQQTuAXAvt63a1K1?=
 =?us-ascii?Q?stZPE7pNId1v8YDIoH+qOoUZcctJSuPHd++P5sJZHXlncHqumlF9vsOx9/De?=
 =?us-ascii?Q?JvbjZhw7dBlgk1q8EXjlerj313eMPrg1gtFnFIMnB5brwGfselPgqJKssmuW?=
 =?us-ascii?Q?iJSRfEy3oEJ5L5DV1dzdpcID7pkgL9FLGIVptSB5djRGDRA7Odw1vJGhSZI+?=
 =?us-ascii?Q?fFYv/WisBkJn64grbYRsRpmTJZFkqt/A1yBNYupDn58IY8c+iUmPD5Hgjefh?=
 =?us-ascii?Q?w81ogyQ6pnQtnxo0WeIN1r/yCmwclXFSZAtCz38V90z6AwurRQQAaJcY/85G?=
 =?us-ascii?Q?OCnTbQEEL0U6D5FmgN9zAT43OomeUEseZYnnBzAcOtFn+XPaevitHgyE9fQZ?=
 =?us-ascii?Q?7m5sa7HnwT0bR+txxcWHqzQQQ5tdEXPaiKKwDYxZC7F0dUUFgX9xbAMn2+ht?=
 =?us-ascii?Q?LlCYrAmtER6eQ+eLJC2A8o78RAjZtxRnosdcduDaIwhFrZIn2Q4Se+8gkQHx?=
 =?us-ascii?Q?uPqadL0Mnd8hcVxAn2dbO2T8vrGj+uPhkBv0xYJbh3uJkZ2t0W5pDwT+BrYY?=
 =?us-ascii?Q?VsqPyMirWPtgDcHYj+b5QXTExRGgH0+WXBPajzIGSNQQcSBCFXuLUisyS4xs?=
 =?us-ascii?Q?Mvp2snWkNuaELcowvAvaI2Wd1o9g9SdVxTjScHQX0SoIDzzwyodxPfpetgvD?=
 =?us-ascii?Q?IluJE5qPWbrnYwdGM6VVTBUV/9CUiSvwwb3WpaSKXlcWOe8dY52a2Bn21ClD?=
 =?us-ascii?Q?ns/TghtgIzbE01Zms7bL7QQcAAT0roPuqoZMw6HcDWBg1mTbF+n3eW96T014?=
 =?us-ascii?Q?iR7rWn8Do4n9DO2g7r2Xapl9df1ilEUvD8EK9NcsBa6shYwpeGPGbBs6OYXt?=
 =?us-ascii?Q?pvGBiUmzGlXi6j2l/C0fXCt0NP9YC93xOR5rMhk3CRT4LZAt2/1dr43JUMnN?=
 =?us-ascii?Q?/23Xam6lzKXCiAWl0e4Z5DuP3eF53cGz22qvjj861gALJFHYUTQH1Imu9mCe?=
 =?us-ascii?Q?zlA14KUaKtbpYECC0/Mx2QdOuiPe1ayFL5p55cICciP2DxDfZkTbpF6WNhGa?=
 =?us-ascii?Q?+8uBLx3BhmXd5asbO+XxGuc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8141e48d-5c08-4cc1-f5d3-08da89a04710
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:30.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNVA0EAtXGDX9opwDipxgK0Yu5Dsdx1+j+PrPpgBJqY+gty0oal3jGb+bzaYXYcyYT27Rcwxq9BVs4UwpaYWy7SlbkD7/4yMsQMnlf93hJ4=
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


