Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175D26EC896
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:18:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsKw-000755-Fa; Mon, 24 Apr 2023 05:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK7-0006QX-H9
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:28 -0400
Received: from mail-dbaeur03on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71b]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK4-00035C-Vn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBZoIZohxl2XxACPo9JqHJy2EHxflicnoBLEcE4huhdNeAZsY6QMX6AIR4unnFv4zHPVuy7bgYTQamFDAhlT5cusD2zDB93ftZc3iHELesSFtDKUNrFv+WU9CAG7u8hRrbAaOxPzO6S4T/2wtHTRgah74y40RCUt5zP2jUmqtOoftKhuh2RqREe8EGXP/rWbegiQcVtVRJyU4MfmzJi9/8sjnF3CBS0f3ZlH6HvYfRcBeIZAZnkUeg6Lu35Lm+ofjnDP2t+G3x+AnkuiEt3GifeHsfDjN9qKWvTnSHSUs3nl48rFOXEAcCrsG8EuCCTm077ujBLB9bTGrDOW81GotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K+8ywx4jiP8ZR36s3ypqHuxr230ENxlQ6+8WzsL5nA=;
 b=Q1fnao3eGOYFSBjrNxRejiFIiK/wfhGzIY9RLE8qPUgvJVlsr9xoP9z7rZy+IhUrzUdRJdsPXN6krqWs58sbpjuz4oMz9+B9W6R9irDSMI6nAwu40t4LnxRwJo2qhnyShvV+jivSCfV2O7JW4d145a+RYnPF4vCHaFsinrqGExIjyP7WkMMcXgwWtdqtl+pgFxEEDUDM+q6euSWJczbGDYkrEwbmgIZn3jDNqwJgXTh7P9ChEC+yTIcK17WIAUDSkWZQhSjPArKMeCd7petlcr6gyuPuw/qJZOWC29PAC/wWAkTkZ9CdRAkNYkmzC/z+/zRvsrJKcozMd0VZivotQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K+8ywx4jiP8ZR36s3ypqHuxr230ENxlQ6+8WzsL5nA=;
 b=KwjSJNcjjoKp7PeqCeiErPjJWOwj1dzuJpXYevRIihWTIFEa8st8UIl+80Jnv2wcmznLB4rIEoGYTD1Dq+YZ/RixKsDsF7DHr7udJwZAcZ1QRskkvI7HWnfwfLtF+PyaZai3jxz7O+c3Nm/+9ZgYX21TgP7tiS6bKWszk1lPygA1t43q9wG8ziH1IXbhnymAMuV039XKiC0UwFkggKPIFCoRC3UvN3h7BG82Jueo/9gN5vWogooXq53J8uMh8T7VGnp4bpSHWsCohPPCVtdruDJe+GR3Skn6TFvH6dWNKskHnHSGydK7irdRl3Zbxm+XKIXCmLk8tbUbNAI8ZUhcjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:44 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 04/12] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Mon, 24 Apr 2023 11:16:18 +0200
Message-Id: <20230424091626.195590-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: d343ef31-e832-4505-51ac-08db44a49f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahLxfGI2za2YGtHt61LyAUwieWGIEH2KzBV/YpUQj1xAaHdTBU5NKU1ccF170mgPyk/Jgtr94tBKE5dBncIwJ+YaCpQplBXedLxZlITHsyzJ4qEwmOIvyVFdE494+FK9h9UoEF13FJZw4tyhI74USpH+vaFGHa7oyQK8GOtm/no/yCY3MIl8u4oc9DD4YDEEZt4/1NqaGbJ16N6I/kY42emvoVrziCpwdY9a6VRIjSWmq9V5mTCXCuwqrG8yJQlD4GXiDmrGn5gQUmOWGe2QN39tJdeFNiC7odMbNL/vb2/2myaN74uJYiBU7UnwipJB79CmPNDfNF/d70jnndwIlW1Xa+nfgbR/kCbdRnQtm9fTSx1mma9+5esEBC9ax1945tax7YyTGXWWd4fTbA38pM56yLVY/i6jSJcXi3WKpIlix+JMJhaFqNzC4nsPnKMyR3e3JbI0bp1RGf6k7PY9tmlGC5U12y89FrAbVa8o0+bXr9oCLeo9VYW2gav4ofQY2e94qagqZ9HQY7BMzwelAvmOwuAxNS7UmXMZZhMtdeU6PRimUxtvN9MLoJmXP/re+bYO26B/8yNH8azKi0gbknLi6n7bZOUs5Zd8G1Iv8f5GmUKLwAMcFzbQNiYBzRNj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(451199021)(5660300002)(44832011)(2616005)(86362001)(83380400001)(186003)(6512007)(6506007)(26005)(1076003)(38100700002)(38350700002)(8936002)(8676002)(478600001)(316002)(6666004)(6486002)(52116002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jPzxuk9fP2e2PdygzyLW6DLl/SbisEQ0bIshLKdcVWVCfPazmOlcBZJD7fy/?=
 =?us-ascii?Q?wkNqXB/z3gdePlREL3AgHwtzq9dYos8WNxn/Fyko187HDL3gqNkNtx2PC9ex?=
 =?us-ascii?Q?TbV1+/VSuWpUsul9NqEPuhXi6K2gXTTzWVDSy22hyDAind3zxaS7JgxCXBul?=
 =?us-ascii?Q?663phf6jDkbuem9RdNQ8mRXU0Yrnzg9HBM7zHdCjbNejtacSXFXjfZqVW7YN?=
 =?us-ascii?Q?jyHNh+toDJhDFOEVonUoq7+wq/YhNFyn2ceT3ZbvRz8YHckVvhFQemP1cuvk?=
 =?us-ascii?Q?Yj7lQBvxRofayR3QYgzIILnxU3X/mDQvgADGD0cJF2OQnSBdq8mBEKfep3Th?=
 =?us-ascii?Q?p2oAZc04nmZhGnbRXygirxl3E77NDIcpCRpYZa0eK7uo+1wdHCCDGF2LT6wq?=
 =?us-ascii?Q?lkeDe19pt4DtssE7SeZilI3iso7kg1R9sy6vgeYh5PZbKM7LIq8yIUl8MeEx?=
 =?us-ascii?Q?MHdOIwcaJKhIP7CLIAsQ2WiJ1nWi0nWYOugCXqxfGSdrgUrm1PxDI5SHJJgx?=
 =?us-ascii?Q?5lvowrUrpE7yQZdrnjCFb9MSJcJpPa1mMqPLoPWhkHzYSS1leJTimTZHNEiI?=
 =?us-ascii?Q?58t0etiHgHPvtVns/mac1rrzZ+9cl5XT7YjhUv2gJfzmMWzRGqs5m/rCD+TI?=
 =?us-ascii?Q?fOWyC2A3ozyItixoeRKDxTRDvSzIjWETR2fnoiSCgWufaZL3XazUSQERcdoj?=
 =?us-ascii?Q?4DhonPGEQGvbmhCpAcCGB3M2wnyFnJG0S1kYFZwUu/XHdqo8q4VKxd1lI+Fq?=
 =?us-ascii?Q?BXcKUSYIF4lmDUuM2ZhG4bLiFMHbdiqAPsZny0tCb7Ksaht3XaMgbbjIVzFI?=
 =?us-ascii?Q?GtELcwdC8ZEPXGIqqG/WtYBsHuU7PLRv6s2TH9HQcWeRWrf44lLjXm+o22YL?=
 =?us-ascii?Q?iwvm56qoz+EgfaZ/tKMq93YPep+emH4ExI+9pNfnugXULboFjWcMVV7PExXT?=
 =?us-ascii?Q?DPNOj/Qo4epwuv74lSVB4ibPfXPJlaCRrwueNM6s70UFokTYWyGoIY4t2j1p?=
 =?us-ascii?Q?r53UrC0Di4WRQiszd1CTeUK+1vEQzgG3h02dcCmSivcMFmBA21a1EcaicaaH?=
 =?us-ascii?Q?0h5tXIatK6GbwUilrIY9b/Jm1xd5GDufjQaVXfkOX4jTGj9ICHnQ1n13i7Xz?=
 =?us-ascii?Q?skhVfmD6uwkvDqFnJutFyh4zOIMXHwDfs94zx/C7VpOnwwhczOelS6Qg4vcS?=
 =?us-ascii?Q?MJ5UyvTh0F7xfd3BvvaRHePVeZYDkD9oHAFbIXenqf6gyuntJd1BksO7eOYq?=
 =?us-ascii?Q?4eY++6hnS8UsNJAxXckYmp6+/M+Hfo40a8IeLuUPrQ3qbriHDe04+aC3CAxA?=
 =?us-ascii?Q?y51Sx1uC0X4ZVhS1IT7dw8Chn+mnKgBg1gd9mKBhfuXVnIXh11I2fjYVFg+2?=
 =?us-ascii?Q?J4Iem7bro4ti7etNREE7Ugx2BON2AtUURG2n5kVxbcDmnsbTu4DtiZa6uOKn?=
 =?us-ascii?Q?yXVhvqH/9h8XUKcHZ/Xzx1UR6aP53Ui9FcuzLGAy0aKRrR4DeyaVMgNMHeww?=
 =?us-ascii?Q?gyc8yJQUXon5mlAnH+DbeUtrZ6KkXYZZMO3OKvlsGN3qcg7rKmYBONtVDXAV?=
 =?us-ascii?Q?d/XWZEpANGXb0Qn8U0zA9qQXBXMTBpqNID2qGeUymzjMwlk1aLukTYLqZFKf?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d343ef31-e832-4505-51ac-08db44a49f20
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:44.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4fHFcKeoVv7XyuIJKSRxQv7COWH/x19/ESuQa2dsV1h2x45k4skaarFASq2afoaANG4Wp6v/lGU9WSWZhlZl9X7j5YugBWcqfu5G/ZhawQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71b;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This helper will be reused in next patches during parallels_co_check
rework to simplify its code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index dec4fe1f06..14fae04c99 100644
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
 static int64_t coroutine_fn GRAPH_RDLOCK
 allocate_clusters(BlockDriverState *bs, int64_t sector_num,
                   int nb_sectors, int *pnum)
@@ -251,10 +258,8 @@ allocate_clusters(BlockDriverState *bs, int64_t sector_num,
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


