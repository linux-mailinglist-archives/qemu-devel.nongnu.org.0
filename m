Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4459BCBB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:23:56 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3ey-00040S-IN
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NS-0005lO-EV; Mon, 22 Aug 2022 05:05:46 -0400
Received: from mail-eopbgr60129.outbound.protection.outlook.com
 ([40.107.6.129]:44014 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NO-0006yB-HO; Mon, 22 Aug 2022 05:05:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8q6aq/SjjKdCkMU87GTfTQwZfOWerrSRX+kyOx5+j71e33/NyUeV1UpYmvGHBYjSLS/pHOaNKfAaIXaHFPfC9GxmQK5Q15v1SBQ6n/8jvJgLMi5p02cm/3WYMIu2eunAkV5A4Uy6vIPmMwS9S7lUSSgck+mLjc0RZobnCzFUr9fgivyTojR1+YbVPyjeYOey3wOe68AmOxUa8U/YKEZj+1zu0yyYRJogu9Qa/EEesSQibdAqrkaQbZA64mlvtHPibwVSMnJdTyoEJItrID1UtYkfJfHBVOqmZz486D0ZDVR1Y0McUiEz7C8rI4SLtvvQEY7tjHfe1ohcDCfhg3Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cqto7lvGtXhX9CUe/ICCmwu+VfWEpn8KP+AocZrou5k=;
 b=UGzBrNylwjvkVfbxCgBkX5nS67JcAlB5qHW2KQmWWT1lF2pfmzMHldCdDL6Nz1+Ws56RdNxJ22S9j4Vt6DpZrfOzeprw8Ab1YE9Zt5rgRwRbTEOdumcO99HeXYNq81J4oNteA06CdlkYY9gPAK2Qp1tClQJBOTgS8/slCS3Jdddf3j2fPQTMc4HzJUhOHPdp+fzfAY/Nh/b4wKC3UbsMlJztFIj5hPOzkt4XiaDMWe/Uw976adIeSoCGbNtC1n82wIPOGmA9ov4hewRhujjZNJ6z8a3KeYdZ1S7D30dzDceD4VH01rCPYPI1K5TEYv1eFYhPTMHvP5BOrDC3iBE6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqto7lvGtXhX9CUe/ICCmwu+VfWEpn8KP+AocZrou5k=;
 b=V2m9mTgaXk4FLOLOt1GnTtskSIUc73Ij55+kR+LAq2gDvNn1GFMh+jOznYTZu+GeO5ZLwsCmScgNUyBEagpKdGQRm5pKg3EOgiGz9BBk6K3mL9ZnE0DeUn4fDd0wJhhkI0D3sgOtFFhd40OuC3pQaHO5ZsPBTNJwa4bmu6KzZV3LyddMMAkdDM2ZGmPsrnAXGM0gJ+JgpqbC41zaTsPUnOB0Lr6vUnayhwlFF3Uj++9vGWOw37urTM2Lm5ZCBPvgjqO2vqxoUO2e0YNOjWVBXAJgvmvUWNpoAK3JURGKWzqJ3WOambBwj5rbD1mzyrRyh6aYjs515t+DNc9aQRjgtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:31 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 3/9] parallels: create parallels_set_bat_entry_helper() to
 assign BAT value
Date: Mon, 22 Aug 2022 11:05:11 +0200
Message-Id: <20220822090517.2289697-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8dd6471-9e85-4246-8cc2-08da841d76ba
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCkBm/99geyEGDmRf6aGDBiQCjHoavMFf1TH4hnPRXBYeIwo5nV84edZuXxtFwwq1b5+6MM8ZwH2cAScT6aXm0gKGo6FD4TwdgozHKg9ndaMa7HD/sX1P4ERCm0hlgUco1J6RhuT7YJgaZKnfi3f79aqkltnclB+btkyThA8Pi44JBIRxJ/1499ptreDgj6fg2gSm9ldSJt3UziRWxEybqV54SQWaclZtmZyuARCyg5pGEO0+NFJhQtGxco6qaun4kQ9CTFqjSuj5oKPW0Ht+tDjVB6zGIaas6OTCT0AEtVZ0B87jOuJl2Fy9hoMeywNOtV0PTtdCNmZrUleaHzYf6LtIMBt96Qsy1CdNm/6KmI+veb3oeBu3xvlZi3Sny/1LhOlkwHWUGodFdawkBURRAL1UVAO/tturljPK05d3b3zwId1AkyaKxAuFhCWWNwzhyT/qQG41+Ma+JuFJsm3NQq0NHxWiYC83VYr8kj6m/gwHNVgRXKviTtXVbbBYDJb+MBXHv3osKBd0OP8S0uRaO5CQYlXUmoIgpOTH10Ti4V0Vvf0CHoeygezrt1mPB22475hr/D4KQPN8RLIv45TPIRWExdYTROXmdKYuAv9doWYQPZfjBOX0AO2l8cvI4FGIxFcECQ1pT428xO5TZvy3EwX9I49Cu+2exPC866n0m9pjbYGtoNUh4YzGwV95G3xYL42xo2gT5bTDjNtHWGWKNyqx6f9AjRvaFDEU2UIsOF/v6nkvJAqSEFdq8+IMFiGN1b0hfTdPSq+2BJiwiiFPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tTawIhWO47FNHHxaNYpT3xwVN8z4XmwUxC8qqSLMuoJjDx7hCuk7tcs7sKMj?=
 =?us-ascii?Q?icnqVmcOWItYA0AyL2m86CHgUGEDvQk/0EYFDKBHqQjKOBmRboirYDFzYP24?=
 =?us-ascii?Q?9a1EWec8HR3EKh52wsriqgJQBj/UgsVf/CtgJr3vHW0ILeyCvyGm+b7NgK9r?=
 =?us-ascii?Q?Gd3uKsP1yeWFHtJIN+4FsNevcqV0UHZ7va0YX9MRe3a63DEiat3Jl7UKTRyv?=
 =?us-ascii?Q?GH3P9/DC078KFTiQ/Y0+emedA0atVyANj6xLZjf6X9OsCcswblTr/qG6I9WK?=
 =?us-ascii?Q?NSVg+MHfOB7VMt0KdMHNmiKoM5YWiRMtbhNUctksoDv+H+muU9yYeQC0xbEP?=
 =?us-ascii?Q?b88Te3RSHqv+LTpqIVpP4KK26mjUzWW4Ya5tHPBPpqAcJkJjaMYQMQm5p7j6?=
 =?us-ascii?Q?3G9Nky4rloWvB6cZfHRf9xNiCMJy8ClC2349ODd50Ko7Hyuc9PTfBpgsIZZZ?=
 =?us-ascii?Q?mgHfJCZb4mZJG07mZ4QehzHTu3k+1dF6LN6ccqzNRTTn9G4nPcpG68H1sxen?=
 =?us-ascii?Q?Xf5qpA3NNxz+wsslbRvZqEt5La9KeGRXt7KUVhQ2k9pOBZyl3H5hAccJ1QyJ?=
 =?us-ascii?Q?JasikVPI/roSfJK3mHleoWBDIv8wL4N3LzMgQReNCkhC7lv9IRebzex+zIr7?=
 =?us-ascii?Q?Bspof6VOxOAUVUWB3DLED0X6JI9h9qeFU8QYba7s4HoT0vmy+3KdgOOaEQoZ?=
 =?us-ascii?Q?htkrazFoZHObLLtLwSuve4EDcgRszEkeW3D3TmKtGUALQEup42bpqAtc7zna?=
 =?us-ascii?Q?uDiv0VvOr15k4mbMbZj//tuzqhceb3b0RHmdIFGFXtJIz99iICZVhWLsY8K8?=
 =?us-ascii?Q?u/QMIbwiKIkPIGmy8DXMFK+qsqDvFM6DaK5DUdsD93+apfbG76+TKlhSOySo?=
 =?us-ascii?Q?/PK93uPNnzohkmJQEGx0oNdez5hOUiD80tBf4H6tUYsJgFuFDoM71GpA/CX5?=
 =?us-ascii?Q?CUOmqzTc+KNo5lqTeY0JYo/C+chk3kj3XMGAW6aMsSbzCMACURfOOXY4xO4h?=
 =?us-ascii?Q?HKxTSoj/UDq+RDh866OvVdjsYCwwEI8urWDJsLIOZ61KI1Qr5LTj8sr44ROU?=
 =?us-ascii?Q?D/3vysdcozOMZkg2HOO1VI7ju5PMtugufJABAC+5WTcWzn3xwCRwgj3c/fnu?=
 =?us-ascii?Q?zzKSbGFOtjuxrA0BjRQpqp1vf6OCPtoqT3ftMvrkN1OLknl5BMiBTTn+cGC8?=
 =?us-ascii?Q?NoptqzPlzN8raZEXowYq+m4fyfKEOhaO7sngowuhbcrwgZCEZsnMAr4FADQh?=
 =?us-ascii?Q?yWroVvEPAXcUcdz6vWB76edOVaU9uQW2dxLoounAeldxZsocflciAs52uyaa?=
 =?us-ascii?Q?8V21O3+152DlWhpTmGlRUh1WPb0Qsmp6gB0yr0MBwZcdv5OSM4zN6kP+bRQQ?=
 =?us-ascii?Q?Qini5fc+Gh9+vsrgUa51MZmjLB9mHXbu2+HT1YfXSMBwIyl4as2B2upvuG5X?=
 =?us-ascii?Q?1Ld8n5PBEhu0uyZRtcQHuxWRDldp8U51mLOZFSRrZocpA409o1tiKi6ZhDTu?=
 =?us-ascii?Q?JHcxDPRfvPrDFzpDZwxHbsyd6j1sfps+WPFn9aL0ImJm/orus+zB8uk7AmQE?=
 =?us-ascii?Q?7Z1V4Jo19dOr735GesVmWj4u39xN6cJp0fOgR+Gosrhdx0NmjIbubNdUotf7?=
 =?us-ascii?Q?0uRP5SlqH0jIkPKzESiqY1k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dd6471-9e85-4246-8cc2-08da841d76ba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:30.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UTg0DxNxOFVTpQV+DFDHP/BfXa07hIJ5CcjIi30pqsKr2v/Exr2QcUjjME8crVxLEvAPGf4wgl8Kgi1IGW6BldDzOxOtGbnGlfvJ1WDjTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.129;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
index 2be56871bc..8733ef8a70 100644
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


