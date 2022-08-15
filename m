Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C9592B21
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:12:43 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNW9K-0006M2-37
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVza-0000QQ-DC; Mon, 15 Aug 2022 05:02:39 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzW-0000MA-1S; Mon, 15 Aug 2022 05:02:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP15FnWdfKxD7I2lZcWxgDJKcYslkhWApnHz1+MGSgM79TN6MpC0kkli5Uva1YMm8I4p6tVeU+bassHa+c5S256B6EHPcNzyCyTkO4ITkr0nDFhrg/hkSOXkmbEzx56bCMkOOj8SZee+4ihyTw1zSjCRi+J/79I4uYYt6sKqyY+F6TO0Ui30/wMCG/txWp+dKDziI2eaW+psPrDcvUnXso/3eCafygXYOQTqcoUGumJFTJ0tyv776lwFZVzgLlo0iC/HzLhoxQVrS2W9g0rwn2AVEN3Dz1ALMg2VPTlhXBtmPweHRJK8tdpA93e6C1IdgwRcsadiMTCGa9zA+gZ3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifWQhL0I51wkH60Z9MI61nRIr0HO3hO6Esfz20/8DDc=;
 b=mPnh4COIdYpoUTgNiCSODoMOmmdugaLlfY9QgKgVM2Kqmpz/+qxp07nZdKcvFlKO4s+d4o54uG7XWHSmiXnlXW5wPnvCO00/nLdCGBNdPnej709f4S33mdeGuBYaCwkqSvEZ5bsoLhi1ImSgMCKSrQwkmDhPMFsQ9pM8C1zKfT7TUQqVt2whxXWt5DPzMK26UKRRw/r6IPctc3+UdPQzDK7t9HVrUtyuqBNwelSXltVUlQzSQo3y4TPEjCQiN8wl7fryqrJSBosQHlJ3clhNjKGrUfDRZRH29RW19PlkN/xn+yVgokDkgB329hyW4gFRiRZQfBJQj2hgOPiId5CLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifWQhL0I51wkH60Z9MI61nRIr0HO3hO6Esfz20/8DDc=;
 b=lNIZ3VlrGX+k2R8SqCei4JK2H5Kxc9/N26+LfMZRKgvHpiiHF3EHtY+/kCCAO72fihdvdxSeHPqDgHjaYYmZcvixnz7d8chA78HoV5isKIC7NoRQ6LZ8sbpfuStCGoc3uCokENN29yvgPsZ4Y2poo6dehlN6Hp+nRrke+23/6nWEciKulQCVgOCtR+42Z7MQG4XzUCQ8QStNNUi8CBk6L29t+A5M+MllEsV65OexjsT+tIV9OhpLMufaH37aukA3GvDe+mzB+XyNCL3HsPHwa8yy8lmG3IVKsHcvz80AmPAmdF0Y66HeVmloCm0G0+H7fx2O//B9kRTyxr6bE5u4ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:26 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:26 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 2/8] parallels: create parallels_set_bat_entry_helper() to
 assign BAT value
Date: Mon, 15 Aug 2022 11:02:10 +0200
Message-Id: <20220815090216.1818622-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b38640-fc2a-41df-e821-08da7e9ce006
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ue4PcNml4s5Oo2NnEVkssBBUMSsoEj0kgvDOIVG2SjgbwsFiaWBT5L6IdLZmC0tp4HvXP+z8565/CgxsdugZdpR4YVHtpOJHHQdpsgbweR0BEm5M6H4c5DqFDhFtZArWUjfIUXgcvuUX6bqVEOFxSxIfZ3MqiTuX+VZCWFE44kRdIl13Rd9ldBu0krT4AQnnwVIc6PlnyViCSoo8fHv0MhmSlLLvFjRSnyqKT/US8S9BpUZEXrxGX3lY7JEUgA7ZJXzHJtY6W/XlxHRqyNRECTOhrucymBLK1oBNVYPbCrF2RmuDpfmL8EYp76f9owdruYQ1HcmrDPddUk5jiTaVctmysoeTjllNZD02GseUD7b2dDjG5raWuQ5qT7vWRr5IKYlnn1F23s+mggd7BhHPxTgC35ViT4JXIgRMAAOY/mv6YYUEcUOorMTwb6C5zOqLcqiqC2a54Kyep5okRuJqbJvQ64uYXOt4N6WxoZw/BCi7r3aYc3q0TzlyRqjk6TDlzw6Z5CYZlLQrNjFABulmJRP6DdncHYpsvxUSP8r9Y2/STLOuOM45zU4kto7eAUIcZJDydQh+6E+m5z062RnBLNkyUFq2/5VXG+1CQo4LMvrFsniBjqAj8p1zkaURWWB25ERpzS7FkmghdotLVVXUCrPL31wEDc+M0LzRVjtxveC4/mRX5z5p66jgYW6dMx4O0kxlHp81YaKnjRLJw4SkrKN7ztJA8GZuqDSbUYjaYtQ1EZso9Ti0zXqJ1L9KlPzIa7JFBmQypUs0uTC1sq/L2oNa2DcB8fx5eNK2VPYuemI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXicYe7VW6nhhA2GUy4CP3xSlWqO1VbcbU3GqpoWilLBVDEGcD5mCaTlhKL9?=
 =?us-ascii?Q?PUy0efjWOCbPI4tceTaIyS74wSzqpoLIR9Fkx5PsYR1bGFAOR/EHC1o2+f7L?=
 =?us-ascii?Q?1Yy19PoOYdkRZYwgxs6wwTKGEZGG2Zzo+jPjA/7i59YuW81XFEMa8h15c/oj?=
 =?us-ascii?Q?3rluf+CbP5rAijKQxKH1eA7YEZi4bR5gdEwLMiOyMWqswNtGbLGDRrJFUgfx?=
 =?us-ascii?Q?L5GG9g5hmcp8V7hanWGKZxkuatZ5TRVybIf3OmTJ85AHKpQqA3O8QMrwFrbF?=
 =?us-ascii?Q?V2uT2t9GpZ+BkTrxci4Ai6/pR661zmitDoOrvqxjYbziOFeITi6qvYHhkWrc?=
 =?us-ascii?Q?Dr2KEW5U0cDyj6txhZH0iMtLQdkdXy7EijqoQiVYtvVI+8iog5nD7k54iESB?=
 =?us-ascii?Q?fKVr6NPdyKs2jhLI5fDQWze9U7Gl2BmelWBseIcgjJNgJ3pQpw7Il3CXSnCV?=
 =?us-ascii?Q?2u5VyynnYvT8xoD3N4WLYGr2WFtjcqFdS10bZKGIg0ThB7G9wrf3ajKBeqKI?=
 =?us-ascii?Q?CTinz6BbDx78acqtMIxXuj1UfoLJMVq9APSBqzRAy1wEoHmGnCqcZKXOEGSq?=
 =?us-ascii?Q?qcz15bBN9B2N4iRAu3OfOc3NdQZ+290RmsvugrIpOFiGnf+eO3nkkPEYLHVX?=
 =?us-ascii?Q?ZwQQlb1YUdkr6jwnEXAeGZFaxZY/rziNK1YHtKPA339v7L6amhtBDQ5PUmAW?=
 =?us-ascii?Q?Wdz1MM0jD0lYbChwcRzm27pM1IFnz6t1UEmF11RJgL9SvV53YJBsvzqZXq1t?=
 =?us-ascii?Q?aym2kg0KCZK7c9tWsNFPTceyB0mqxiIZ7PiVB1zbznHEILOorFQfHVSH2GwB?=
 =?us-ascii?Q?GNmgfzxTNTQrkiC7U3ZUBXdXSi+sszHz4Qtbnopls0IxrJpYqGZ6jkzW9/k6?=
 =?us-ascii?Q?vQh7tUcTI4kBbqyOTjBh/y1S3G9sosp8dUe6k2itKa2u/9OTKcnXGlsymBjz?=
 =?us-ascii?Q?jRVVVjLKogXHTC8GX0YhHzY+PDB5Y+ZjO5HkPEG8skgFKj9yvPn1lUBn0d+i?=
 =?us-ascii?Q?uGUm7ef9entPY5uGKPbmJATPZca+Q4YWqbuypgKaW/BDMCtT0IVQaPyhhPS3?=
 =?us-ascii?Q?v8j/3zjfSoXDOC12kv9ZEftpNZVYx0iu/Fp7wMhSTBej1odCcZvdh+mj1Qmu?=
 =?us-ascii?Q?60LKRBosvzZ7p1LxZUlCUO1wAGisBSjKTP2X8tbPQ/vHXbeVuJxaRU4FGKRX?=
 =?us-ascii?Q?gD37/aNY2W+IeNL/gPxsreD6Ti/BGj9/PlCW/7EFXqgejeBs74aWIuXQkcnB?=
 =?us-ascii?Q?tmOLX/KOzkWdEIB4zM4i9cyexMwxM03DY7GxZyEpOvUtIP99Rmgco5MwJPQN?=
 =?us-ascii?Q?eeVeqZQ86LhWe8D4RfXBsGplBTFpzktChh3kEWdmue+FDn60H8x5W8tSPO3V?=
 =?us-ascii?Q?+klTFLJ4xe0pEd306ZCE63igeKiK6G5LwWvrJLgMcA7elR25mak0/BGuKzRq?=
 =?us-ascii?Q?4GYkC1E3Thhsz8/hOUZ+vwry2U3ATf0Tkg8+WSkvQCtxkX+4TanIMiO3kk+v?=
 =?us-ascii?Q?OvolY75FVkdO2DlPMTy6vCI7PXxVP/SZgIheG98Byd6GRJAy+pdcBaAAOkuA?=
 =?us-ascii?Q?zpaZ7KItLuv4ufDQxBEE79wEmVKwDQ5fibirPSi9N3/QOEfFzJW5mRbPth+H?=
 =?us-ascii?Q?34xShdnwBj8qx5OCLxFeoA4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b38640-fc2a-41df-e821-08da7e9ce006
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:26.6143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEruLovZ8zs7v1yv8sA21D1os6ZQvNcain2pva5Dzh0CDGtIiEgHp8qhSQwofYaW9Y/GTTcY06+mT3dTSW15wdcglS4sLH1MzK+5Z/BwiqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
---
v2: A new patch - a part of a splitted patch.
v3: Fix commit message.

 block/parallels.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index a76cf9d993..7f68f3cbc9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -165,6 +165,13 @@ static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
     return start_off;
 }
 
+static void parallels_set_bat_entry(BDRVParallelsState *s,
+                                    uint32_t index, uint32_t offset)
+{
+    s->bat_bitmap[index] = offset;
+    bitmap_set(s->bat_dirty_bmap, bat_entry_off(index) / s->bat_dirty_block, 1);
+}
+
 static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
                                  int nb_sectors, int *pnum)
 {
@@ -250,10 +257,9 @@ static int64_t allocate_clusters(BlockDriverState *bs, int64_t sector_num,
     }
 
     for (i = 0; i < to_allocate; i++) {
-        s->bat_bitmap[idx + i] = cpu_to_le32(s->data_end / s->off_multiplier);
+        parallels_set_bat_entry(s, idx + i,
+                                cpu_to_le32(s->data_end / s->off_multiplier));
         s->data_end += s->tracks;
-        bitmap_set(s->bat_dirty_bmap,
-                   bat_entry_off(idx + i) / s->bat_dirty_block, 1);
     }
 
     return bat2sect(s, idx) + sector_num % s->tracks;
-- 
2.34.1


