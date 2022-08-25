Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A855A14D5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:49:52 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREB5-0000JJ-Hy
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtd-0000p4-I4; Thu, 25 Aug 2022 10:31:49 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:43230 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtb-0004oG-TZ; Thu, 25 Aug 2022 10:31:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/duL0OMHcspmVXK0lKQbmtdeYg7nDQIYNt+k+S3/bvc+47JvwG3cX6h6xIIgZ1gXpE8fzpvZGzwlnnwZCJNAGFm+tamlBml0nGXCGX3q4FVyCXOeoXkjU4XByhVtl+A1YWVEXVFCYdh/2x84uQCZMeVFla0wXoZjl9lXPFYajfJMqsa+OS5VUcOEMITu4BQ/GpLyz+aLXqQGHomRkCneMqYjOyUUHuMz/7JSvcu36uMLXkPzh6vuYxi8O8cRjviIVMJs19ln5rods/kNDyAPhwnwgZp/R5s7EHPqoYqb2gT9jE1ORLvqBXmwBFxJh08OcmW8K+7NyfVJhIOgKitsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=UdK/mgc8TEyS0AoivR13k0s5P2HwcUPz1olfeXAtCc5U2viV9nYit/a0A6V5en6bW6O4cM22y4bfTZq9+tj+HS+Dy8AhN1SrgpBZvzaJJrV7AQOTmjXOGK+L+5QN0Iro5WGBwrdmjmf4UyxTEIjLdYBkUCwL47KTQPNRr5CM80Ms5BEnCSmJWyymPX7g1tGQanNOU2BbY+TlbZkPzX8vJRST3+EbhRlmaNg8d7cEwW5Q0tK/KQW0wx+SHDBTiVps+dMQ+aLBdvgGv3Xz1165tb+ahPuiGDHxwM0Jd3HQZAB05K6sf89q+KCJspHbYQWf01hvdbY0Fe6t69xL8LZ20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/w8TkRCrIOArPPvjz5ambAyfqUEJor64AjcnOtRf7E=;
 b=AYoDSD3n4x9ZBwSQ0Z+OapFAGuDQ/x1Zp8OW4ff3aKLDCLLF4S4Tej5HDICUhLoab8nxaH8BVVrqPI1pcAE+1zo6RNhsfmFVwQ9XCObp2TUuKzkUTxqu2l2YtK75H865kEgfCXH2J3vAvVZiJU9qVDK7yRPz8nPIRnNQbagrEVlBcJvM0mDnS2AnDFf3OkWScv9UZNzFdbMp2WHKRYRkk5rHNRZUXodQOcx2E2BELKcQAUTbBOWOxT3weAkxtZlYbPrTn3MplhwWD6XCKjH35UJ+gJp0Og5Xrhh26s0ulsHWUk9PZyR8jI2LuYp28SqQ40TZdg/yRo799gqElBRiUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:31:20 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:20 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 04/10] parallels: create parallels_set_bat_entry_helper()
 to assign BAT value
Date: Thu, 25 Aug 2022 16:31:03 +0200
Message-Id: <20220825143109.176582-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc14f99-acaf-4165-1038-08da86a67a31
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dfR5QmK7LZCtjkiAp02ST+TZpBWSNdhPkYsRSs5NXkTxyKVHevl5NcrirMUt2ySecL3n8+joLbUBwHY9OysTtrG31Vh9HOFyMQHS2jwNPbrGPqad8ie/p9JyROqMc5xomaEFn7TxE/mmtgmFDZDCfs65Dd5rfON2j7SqIZlUXPUtoa0PJYqs8B/9z4JNoIu2c62z/bufeBcWZI+5FetRReHZqXjRIkkSGxzsE3J83kCbMkUZSQ5eNK13B3rJkzf3IZsm5AeZRbwMsPd3LtzVPdJzfz5hlIBf4nqydk2zVxB47cDGYzDQWwxkEeuPmpB/+3lUinM6+8d1wtIoV3NaAL6BjqpH04jdDclDKpJ89Itti0uXn2XesGzydN9n5LhIXNYX4LTXrf1BvP4h3q1/3AjnsT2rzoXPa7n9enfMN+v/De08vvSn0hjhGumyF/l9Hfpw1T1IJO9Aci6udGYU58sMA3XNIdvecS+Is3WUMFA7h0fM6MMkhoVPuIaLxVqcDqvhsEW6qPshn9Opep+ZrkZnmdnRyD28p29M0ZmGWErCC60OeX/RofbW7TZU43C+31SOmIsiahbK0ImY3Wrw95JX41YVk266xolLK6fMJ5QL6YOjLPnhV8AZwrJDhLw8Woko50xP4o7//sQl+aszcaSl0dUjQ/KE7Ds1mFetJgHfB+3i8xfW/Yb6sTOjrGd8ekzOWlkGVMbRvb5w8KPzddqpal5MteLQOce+zBD7VXwVbpSr53aR0/8cBVkXjgEJ8FKp+rn8KIOq65ZQy/tvCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(36756003)(83380400001)(186003)(1076003)(2616005)(6506007)(6512007)(5660300002)(52116002)(2906002)(26005)(44832011)(478600001)(38100700002)(38350700002)(8676002)(6916009)(316002)(66946007)(4326008)(86362001)(66556008)(6666004)(66476007)(8936002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aU4D1MZwRmKV+LCVCddk4UTXIoG+dy/XxbGaCccacAv5cGjMvO6AaWphfb4f?=
 =?us-ascii?Q?TIt6WqrnbzmvDHWowZ8vLIbRtajzvJY2vdnuI4MI7uYTscf2E57HZrJBrjq2?=
 =?us-ascii?Q?wsLJkYHqi/H06WrTfZAZQD1QSqyfMKeSlcqPRP7A4fHFSZvMRkLs3sY97tIM?=
 =?us-ascii?Q?7D7ACv1ITktdI2ItkwVV0CeQBOHcORNmOiaI4H/JtGo6P21gsbqisnDSZTa4?=
 =?us-ascii?Q?GDrU+HwiE6AqdaPFz4W0HgvjmSuoFLr02ev15WaCzR0urN/GIceiDiFoeLXt?=
 =?us-ascii?Q?M6fqcD+mGwjsba1wVF9VDJwHuQD0f+12Hd6d81GHIMt8bGOL5dp5mQn9VRed?=
 =?us-ascii?Q?YFdMG34/luYwj80/cWlS3lu0dkPElWX4tabqMl4AdQjWlRfWnrx+R+QqRXyX?=
 =?us-ascii?Q?+vZSfqZk2okGHj6XHn+nyxol+DJnBkoAPlB8wWK/yZ7vMCGhYUlcE67mepCP?=
 =?us-ascii?Q?BUWuGNS19SgpPiV3TS91IY8fyyUQxNTb7gReesHkvE94QmzaNaXjzv4Gjipz?=
 =?us-ascii?Q?hdtlvRKcjcvJixTVgGZC61l2Hw7Bp4xBrxUbgd8PtIH3b6HGvqaIpKCBAguj?=
 =?us-ascii?Q?lQWFH37AwjDJsKTmA5AowjCa3rUHQGzaXboT7wwU5RdWnNRTVx1aillF5wwS?=
 =?us-ascii?Q?yQ/xog6XqLAoj9DbkIUr6o6lpkSBWPezhEAEhtRzEqXnordeqg39IBHvAAAs?=
 =?us-ascii?Q?8kSnPYdxrd2Vx9eGakPpbI9fQIrohVybmlfeUl3gABL59g06jvWHjExu0Ckl?=
 =?us-ascii?Q?Y2JOJEPKMhcjqDCeRxX9KICdNZh8oAD+o85B3D43EnwgbZvpVJT/MRqji0KQ?=
 =?us-ascii?Q?aqFaGSDkCgds72yTwzitUawtp29BbkcUSdob8WN1MsbBsClaGZ6OPB47ORPi?=
 =?us-ascii?Q?x85AmizOrGn9d9QbW3j4cTcdevsvftIU01FhDV3D/gYTSJ3neX3pcJVeo0Cn?=
 =?us-ascii?Q?EGNxpyVzw3YyXhc1sXHElOD2p1g4LsrPHzt55+MGL4iY6WLEmO11EYAk3WqV?=
 =?us-ascii?Q?Oaa55nOUG50u8v3c57STeRV6rSEFFaw3UIkyac2RPg6hN+48Y13WfqU9x9LR?=
 =?us-ascii?Q?RY9+PxQbqcQi0iCMMQFHtdKZ43KhyGUnjLL0i63FbY9XA3ugD3y7mesKlu0W?=
 =?us-ascii?Q?AeCDwM/fFAy7VPR7HhLhAXKUYxnK/DLDcJKp1lhp5mVV305rXo8rgKySWkdl?=
 =?us-ascii?Q?UYtb5NgCMaHU9T8jMLXOe2t2PoXWaRx+bJuMBrM6X66w1I8sgmGhy95FK5Me?=
 =?us-ascii?Q?9T9o1RMsDOcoM6sIwlj5j7UvFD1wMmR/n6XsuLxga49DMKyAsbrfLZXpF5wr?=
 =?us-ascii?Q?ptSiRRQc0F9Ht190oFp43/ZxSp4qdHz48logNmmJQWkkmzYogpTyjXOjPZtK?=
 =?us-ascii?Q?jbMle51diYm8ekXMZX1UWeVagxAoPA1d3hR80TVX9RmYvTyCLiUfAXLMU8Sr?=
 =?us-ascii?Q?WPkP+yQ3gvVCHmQIfOnCbjbMRRFvNsH1+p6WDXSbyDxQcxw1KCZ4LsPGGDCy?=
 =?us-ascii?Q?DcuVz7cLbQsrfNnwtw+eltljoiWE4ytx2WB2ZvR7iJZCM+AV7dT+pfHbpsfQ?=
 =?us-ascii?Q?7L3CfP60wFgKolBHUBx12upSGPPQosS0STveCZFfwVtaqWjDrs6cEwCEL7gG?=
 =?us-ascii?Q?2ctggfz9Y25EL9OOzt0ComQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc14f99-acaf-4165-1038-08da86a67a31
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:20.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFSjQsH54WWsfvNfs3hJoxV6Q/EBS8HDsJEUiQYsQbWM3KPLe6ZP2bOl5WF5hozp3nIZCmXA+YVK/PhImUUlFLsYB9WWNm571ZNADFEKThg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Received-SPF: pass client-ip=40.107.21.96;
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


