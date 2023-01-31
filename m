Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C7682A85
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrq-0003OM-Mj; Tue, 31 Jan 2023 05:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrn-0003MU-Du; Tue, 31 Jan 2023 05:27:55 -0500
Received: from mail-he1eur04on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::704]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrl-0006WH-Hq; Tue, 31 Jan 2023 05:27:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5QlrIs6OpjL76sHx8aik6e+x5Dmfzlpt7QKoTwAyU3IxdStcyf7JZSP846tD7rCN/IAZGaI9nFX1rWKEpo3/aHFwH81rdbgissTQsm7j0KCSSwNlQB8yNd1paszm+ycJPr2MbWeggLNsBVBRTloYGB88ijdHqMiYn+6pLHUXmNPSxzQWcRmrecVhLRSUB7kSWzrkYKhvXHBkntcgAcvkVKC2EUraMfHR2NCcYdv2pOtZx3NxiCJijtsH1/BSZQnE+E+iFe34J0/pDHf4Z4ar6h9hqpx6Yz+d/HFfOvph8veGW3wegJw5F7nquq1boFwTa9cnYKZbTMXZRk87ooulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2ts94JiKDu2CEKEoewinTUcevlr0YazshLv5T+UNgU=;
 b=TXCoJHybR0NiZm/ZN6dfVvxXQfBSGS13evy1edUmMfUf+WGLWrKgMkk/3snK4wra+DC+fOc3/hL/0l8ewONnwQmek4n6OneAqhDyZI8Z8QohPFL1iYwdRdNCQHubpfm63R4L1tz344MoyH2+bkKs5ulZhu13wcjr6OPGkjxy7vbrf9NVG3u68oG4n+b39UqzOJZWX6GdxiDZPvIk2tS1wOkVmIdp/EESqNMWfZZuRug9IlukS/qPZENZLVVMj/9MpaFrXi09Rp4ZJZzeAekkI23GNSzzi7+w47r1w7U6UTz8QPHM4AIwrTUy6z+tZQ3A/ynsGe+8vHhdJvHfor2T6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2ts94JiKDu2CEKEoewinTUcevlr0YazshLv5T+UNgU=;
 b=GqVOWwBeRO1/P9PkXCzC4FtpcgL5qWbTm4r3I6ImCwEqICyO8tW2BjwdPhuKODXt+rdTbzZJMMKqbBZJDC+lOywodzP98zXJIC7iJTEoPqPj+UuebCNa0Kr41rIkoIHGBgZ5zsh6DLzuIJnGFjXk1ZaTt8Bd3hOA5sNcw5jYJB3duterOkgszMXdzd8g9OALpk/nnJExPQAYOd85Ybjik6y+bTaNZb8UuROBRxywMMT/pnXKt0lkZz0ifsNi5mPM8skbNHJof+sYqTN6JVcOYqgAx7Suro8+9lgVDOvOCqhZiJMHWRKkZw6uMwfgiHZF57qdJhanwmANYBp7CbgXmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:48 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:48 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 04/12] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Tue, 31 Jan 2023 11:27:28 +0100
Message-Id: <20230131102736.2127945-5-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d5ffffc-e11d-4902-42c6-08db0375ccc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Z8gQOjHL4UNst/Q06oT1r5ld8ZJqZGuG1v1E8MrJ8UYpOs9KYgyIZiJfYZnx54CxNIiH87/Swddg8TmDdITfWf0TDwYlQgXl+2GxllbDTAYyTsUKLvKZ8Y8Xo3t6o3lyX83VZQ4rnn6I6+RpYStorhkBJQ7AZcI09rrlx9Mu5dFaXXHalrIh6NModW20FSJurUxffLRs6aLuvLzy2YHu2i61Y78SiALdVfgU0JWcmV01x/6xg1+nWgEDPD/VhVcFTgewWJzUAASu4lPIZB5pYt9k4ddpertwvPPuZ0tQ8q2wefENgK9NGxsoFZIMmgL20r5DxuoO9rcoBYmP/SJznJ+JdCi5GwtZ9+LBb9NDoCwf5V9bTpjUOe9B+iFGzzY9pim+RGWU/h9pMR4McAtuWLbuGxMtN63V14B1xiyO0Isqsu/NhAT0ZuXIBIAMq0+DlDxr5KERqnPFE+SaX4QAzBHcODcccf4mr+qOm+OC95NIJF+2z79UI8oxXp3Tbc5KMtVEqoPv9fPQWizcXq6uZ5R0v8ObueVO5Ta1miW1bZ/aG5egs2Um0QB6BT8BFt03BqCSRMaZYZVLOsbLbcD1FQFa03BohhC1fuBIta+JQwtFj7EzrmTPxvw7ik2vWM6J+bADX9QucFjfrY71d34iMDqiu9231LFkSN2KHJSYc118bp08Q1U2soCGUNR8yQAIMrGYTKmXGbvLHX6QAKrvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m4teQ8zNRJLoVmfBg93MuNUN9uH+HjR9UD5niep127B5iexL2pkDlGUrvn7m?=
 =?us-ascii?Q?/IHvv8Vi2DBSyohKgqi96QF7+on7QBirM4PwIM9DSlQOugkG+CocFFQf7om6?=
 =?us-ascii?Q?r+v3pTtDKv8XBoG9oJaQBg5llQiGUi9OBnBrkZVmaddAT9abEMOzwpRQFxsK?=
 =?us-ascii?Q?V0/HgU39Mub0uWiCshxO0/gmflgv5cl7guBxHblCxFEjps12RTNIFOzHu3JU?=
 =?us-ascii?Q?zl+6K0hr9C3YlSwcKXxQIT/TqPW3k+BHT4pJjPS37cuFoH+Ny7lzezMfMf0M?=
 =?us-ascii?Q?oRzUf+TQFtOaJiA2IQtfMIau1/kdN61+K+85xPPlWxWlTmiKQuJxaN0xIXOl?=
 =?us-ascii?Q?Yw5u4CeajKUJ1lasv1ueG+pM3WPadOYGXzbhGyQsJGqX4TOlmilvHEfrz5DO?=
 =?us-ascii?Q?e6uGf4R14ShXLitRr0oxxSyE9IuNquaNv7v2AXAKeTj704O6mCMUvh0OcauU?=
 =?us-ascii?Q?JC3yNzL93Huw53IlmTsCuuHOVLTz5MnAbLagWXpRmThcof1sDicRKxJgFIQe?=
 =?us-ascii?Q?hChkKAJvBJL1mowkO72DyujE0smArLL7mL3Pg88HTFjr1FplKH3y4teL6cB4?=
 =?us-ascii?Q?GnvQva8QeLyDbJOm2q32HmfZ9XUjtriaMht7YWDEcpjAFtAAsTlC5h7eGm42?=
 =?us-ascii?Q?JQlyE2jIxPk16oVTkLa7N5PXM5hB0Yu4p/kTIXC+UGFK6VwOHhll7bYOJa2/?=
 =?us-ascii?Q?I9gcr19HKzhYU4zEZI4rJ6qHAVdK7sGBoCJpFmUC4SqZzJPqlmyrPSnS1LDN?=
 =?us-ascii?Q?+JXjtBI0GSWaJBqx2qZxRXvkdMzASZ1giijSEk7++1b/f0HkV3ipCUEfYIZZ?=
 =?us-ascii?Q?go1xZcsjkO7MQAQuvCn40LlU/xuwUpWH41Dkl6B2ePgGmhdHV5lch8FTO3sS?=
 =?us-ascii?Q?um3bDDPwLA4O2X1eIW8rctSujtAnjC/HjyFkycYZrseBXuuayBYP3aPM4r7m?=
 =?us-ascii?Q?5G/nyUsiXapZDj9MBTimD8NiT+YTpK06RGqNtQR/X2XSBs1kuyRifaRp5zHq?=
 =?us-ascii?Q?PpOoPFq1RiMwIle8kaklYNhg/KKv+9Jlf1C106U6R77aIDiFGsZNaJxOZzt/?=
 =?us-ascii?Q?jYZ6O+SenqRncZ9Hc/eebKyop+b9F0ExBDeR/UNh/urcePo5ut0qHmT3J8MA?=
 =?us-ascii?Q?M8a12ZNiLY2wqf9hcWFbBCZ3FWf2uUR1+mgimPtFGGUsrmRIvi7DSwWtr61X?=
 =?us-ascii?Q?TZ1RRxW5U6W074a/Z9yFVv/fMd1P+U1WfQt+M8AEh5bnRSQ74QWiiGWTyz8a?=
 =?us-ascii?Q?akaRnhiq1F/23mM9PbB9y53BktZrHda/4vuaUzxn6N77kSaAwEGA0Azuc1WN?=
 =?us-ascii?Q?f3Xx0J+DTmVUZixhF2I0zh9oPr62rizieKpCgbfzIht6x31+SLPO3CQwZRsA?=
 =?us-ascii?Q?hWrQilewLeM2/DtbAX3SbB8RMt9IqohKQ69ST02suPrty3EUUSGA1qJfLitm?=
 =?us-ascii?Q?daGWcFwxWzqzzaA6HbURxUEBUl9BrFDkKsAcZEvBkyvvzsxddL4Cr5qYRGJ2?=
 =?us-ascii?Q?fL0zneB8Sk5JxHhrWljDNSL0+CBIbPABgbPo01GBSp1ot55N4NvJfwol9rgE?=
 =?us-ascii?Q?LRsq9mGsP0AyAzyBYW2jc9l0Lpx6/41XnCzois4dLP94KnJjMUTvJaR76T4I?=
 =?us-ascii?Q?kHTIx6pSWnFpzHE26Z0IEEY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5ffffc-e11d-4902-42c6-08db0375ccc9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:48.5949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62eJzhhZuyMY9JcWc6ZUWkGg5k4jQdpC2IkfUTQyQywIcDPM5VahZ8H+NWQekWM6bLY2K1U8tn3hD+UiQb7QSZ90cob+xg6bi6KJsopYy3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=2a01:111:f400:fe0d::704;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 2ed7cca249..b2e3f5f98f 100644
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
 static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
                                               int64_t sector_num,
                                               int nb_sectors, int *pnum)
@@ -251,10 +258,8 @@ static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
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


