Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4EA59874C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:23:47 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhN4-0006q5-Fa
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEt-0005oq-0D; Thu, 18 Aug 2022 11:15:19 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:61536 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEr-00071h-1m; Thu, 18 Aug 2022 11:15:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiL5RYIP9QcmOEPvStXc6a/kFryIPA9AZHwlTIX6YbXMpOlE6KYX3WI70gSCVbS4gNYsf5bAi6x1l0bOrUGdE6xW1SZ53Ll/gQAqZXxPbwEBhIhHNI2bXm8Frpk6XkjYuGO4DCs6g4bwBdJqvOlT6s39dXx1dBYXKSSex8UnTRg0W5Ys4bAHKQ9+YD0jqanqkMtv4vuVzug2U1qm0iRG5FBvylsYXFgwYXOUhFjnTetMhQaVEhHSHN6BEWRiZW3LjQVTL3bx0B4Sx0fN94Y0eGlRCeJilKTjK8vcX1Yadw9b5eJBNQvyF0YnbGmuFITe56MMRmknRnwaiDm+Zlv6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6KwQkp0tEh7yGj4wK5mI32zLTvcnDSdwNcVTFkP4dA=;
 b=B/q/GlBU7Q/jOGKrAiJHRklyAkSIpFCZ1GHjkNQcFyCholeKxMl/yOlHLMNtv0dwhsZJuY2oOFjHKZEceN8yV6snLdY89n/ZyYR5PE/8JBan6RBW9NQMT91lMFt4A3gMOc5YAqALfWgfe+BV8Xw9masUGpEuPgsB5kamEz+xyxR8k6J7Ck78c3zppRA3qhGbFVuWp8Vzv4U0kvbCeBxWZ/dn6JtKPx7BIDQfA4JS/cvIwYdJ3wEDqR0rv0axhH7xBd91c+obwjsDvAp5FwUkYz9ldhZz3FZnLLR4vmM1V+lKmi6kztv2WcZKwzFVu/n+N/AehD3q35iWPrc2g/eVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6KwQkp0tEh7yGj4wK5mI32zLTvcnDSdwNcVTFkP4dA=;
 b=XA5ZsokkjnF1UFkGZJG1Ak4XTMSLhrzn6PY5DHMbp13hB+SWG2e5JksKwQ73Voi6eTl+ow1kRcqqiUTM5J9vvp2L6SAG5nr2hKlqU5PM825UJUbrzxQc8xfupntylToUtrrWCtcmuWZMcK+/Q7J5hqNYW4wPpvq73nDKAYHVzUlNpQ0C5sCyDxEBpTV5mvmJq4KZAw74Ix2QVIVPS+zlwHM4+x0FbJaYBf5At9OnOWFKRhQQKj/n4lYQ0sZ3tKlNtXGz0ah9BUykbi43OmQhttXyaky0IC097lHy6RPbrCmF7q5fd+z2ReqrTDvgvv7IEHaNGu3RsOIHnoAgEnUASg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:08 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:08 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 3/9] parallels: create parallels_set_bat_entry_helper() to
 assign BAT value
Date: Thu, 18 Aug 2022 17:14:50 +0200
Message-Id: <20220818151456.2118470-4-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8693413a-99c1-4ebd-2dc4-08da812c6f9b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwJf48LeCrHm9XPaB3PIT5cv/7MgvAjWM/LDnD0L88nOtV3eG5Z6W4MVeh+6Njvq+PL4g8It+TS5pQUx4k6FVz7YneqEQn6H+R+CGLaLLEJCHQAt/lcg5kkb13ndwrNmJqIURayfEjPLtg9vdTesAaUT98PXnP5043C2875HoRUYUSa0YOU50QGWfrP2u8xiNSlQJEvf7BvWNNZxx6Iqs7+NbpGaubcwoIwGolnyuc4J6KC9zkpsNp+y5laulHcSu4VnUq1gS3FejnUdU0vUS8rtzFZW/S9UXxAKOVRjy9e7yV8lwmgJibeF5ZhchVIJjH778ZWuXI9G4c0kxJ99Us6DlU/bD3WbSteO8xbds2KdvG1ulafw+Yj6mqgUNUYI6Ji4hy6xy1zKv8rpFKOTQ6kS6lJ5CuSebCrIAu24gX2ee4YxjbJhTOMU5ntFfzjLx6wo8HLruFAITSK2N5OR1DWVBqDdXwmrUax7if3V21xCdgqPbRppx67oGwhfakH3FVJgk/VvMINKg8JAKvkUQ4qjRallPVwe35lk4ztjurAru/SGS626CjzrJGh2vMeqUbv4Dot2AanUh50TYmMvz8gCYtgfrc+fuJ+LRh7aYnr5jTXrq2qfCl5/f25i2STm+N1LKYzOHljXHgwT4/gsnyBALpZgDVlhF36tYV1UinnntZ2eVdGDkoABmd2b7nUToISJyJDJ6GSC6QC7vVCBgW5lBoGTwIOq+vgN5r38iRLbnk8/0nHMBfKo19leRwITBQf3SGZoeY5d5TttjYPqgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHSR5R9ThJZQpj5eUkvt4cS3FWLlqBzt43BY4Tsi5JLczSLoq8eGwJVHu9NB?=
 =?us-ascii?Q?bO4C497iaYlTx9HYdOye1WztA7Y1aUDiDqicMCfJVmngfSDyuRizfx5dq716?=
 =?us-ascii?Q?6uSjULQ/syyp8YQvksAAkGMNXtlzSug1lLfGnfJyFPRFCcwZNZYLRN84p3Fh?=
 =?us-ascii?Q?GhB6nujp7Ipokrp/ups1aSde2Gta6E5eYOp5SicZ8InNwmniKkVe8bg+taI8?=
 =?us-ascii?Q?T08pBWm0iPSHU1cTleUtyUDUchuRGuGpq+le6imNMfymqbOSWEdEvYDSujF3?=
 =?us-ascii?Q?IcYn4p6I9m87eD9uKwy9N0Wgg+wtmECvG1459cpCBLqB9J5kbho9eOJRqeM1?=
 =?us-ascii?Q?EW8Nazvt9fwf5S9yHfxlpgdTZWyKcbGhrbCifYe3myMBxx10gVUwJQnuNfnD?=
 =?us-ascii?Q?iC3MIggAZQlOWLzcIWPkDV6SUhSiQqpeYW3JkNL0ZKRtAlHi2Iiy6cJgLdgp?=
 =?us-ascii?Q?+K1FLSjm8XHlD7sy3Na2b05wlUvYAalQB/J3hqr3m4XLVUuVwUjLDxDubO1N?=
 =?us-ascii?Q?BaQYKCE7FOl3khgzDQ2sl3oxWsAi/NXEFtp1ygsioaIO3SnxmIhp4BXENlv/?=
 =?us-ascii?Q?8MB0yiu+zEzHUNarmAzHy1ilvZKGdFwVDK8jkHU5Tz1c7jTH1bNZgf6SbXvQ?=
 =?us-ascii?Q?L1u4VPeb5HdYmTscn/nLmNyuNNsSJLzU5V3KDXi/PIuiCnZEsWEr3vc6FLjD?=
 =?us-ascii?Q?02hAmS3IqVePAe8cUNyrq+NlvahD313FMvyOcBVfOGur8X6zKxTH2OoaWEqF?=
 =?us-ascii?Q?DDgKqTqum+rj0JwQGy48upHEJ483lQc7a0mWF5QoAnG6wveCUkyZ0h3pqjFC?=
 =?us-ascii?Q?Qna6TROBKsZ6WTNHMxHjtAlzKGlhq0DE9SSoJmgrqqkoLVbromlQ7wvnD7bc?=
 =?us-ascii?Q?TZKlGnwMbkh6XxjLvNNShYFkCFIINsdz74HtC1TF405EmZfaWRxjOPS5wkZj?=
 =?us-ascii?Q?f6kuiqZ7jc9HvBG1QN+DGjDld8BLpPTa9mgAxfIFlSKXlF6KTLrNfQpbTrHD?=
 =?us-ascii?Q?GWwPUp/9pGt41Am1ru7/B5qpbDVZzofx3fX2EHZkk10MDg7m4IQrhDsJShk3?=
 =?us-ascii?Q?+p89HSo/4Qk4oZO5xHhS8ePdD2+HyJ7xECHSfmGBI8xyetdaUDFGraHlB52z?=
 =?us-ascii?Q?prEXYkiHsQrs/3nAPuBTeB3oywqotoCsPzVFedRI/jYD+RA6GD6WkIQlapXB?=
 =?us-ascii?Q?evDgWKmJHbxiLQSczmdMyOQRZaUyg1e4cCslekkSqq2jVml2phRVdAFeY3WN?=
 =?us-ascii?Q?gyW1VPUnzDXPMF4Sds7p5tfZCZ7uPxKao2pLs+iJ0/LSpmIEqw0+7j1hGKXM?=
 =?us-ascii?Q?fQwQPmpv+66boArmZtmSFpP7jul36wiiCLObVG82Om3GNdIf2IwCqMvyetXr?=
 =?us-ascii?Q?KP/b3mYVUFtW1hzzSEwULYB15HnI+nOLbcFoW4F1HuTgYGdhiav53p8Qee2g?=
 =?us-ascii?Q?dT1WN1esoSAea+soJFGkEKA14Q8LL2AzPpuGSHHkP7cu7GhlM/a5rbEEw5Le?=
 =?us-ascii?Q?/xbqO2OUy6KqpVDHAmlnXmgZxeLy/2FmupLhYMFPL6bcNwzMaXsRBMXBAK/q?=
 =?us-ascii?Q?SSO/6WoOu7drYbYPz1njSLzrCriCxqWRmoCOe/4rpgw1Ps3PHM8sBKT9oI3u?=
 =?us-ascii?Q?cLwiHQFQ5MJTHPPMWAoLNM4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8693413a-99c1-4ebd-2dc4-08da812c6f9b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:08.1715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cL1zM6N57qrEJbKB+piqlWjQMLNIHx+rVYH3gIEapjBlp+xXermuqVSVE0Ce1bP7VxVsPOLwqczRgK9vsekRoJES8ajrT4ag6/jPrHj2yp8=
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 24c05b95e8..f460b36054 100644
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


