Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF674BFF2B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:48:11 +0100 (CET)
Received: from localhost ([::1]:39624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYKg-0007gR-3v
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:48:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY7A-0007UN-8N; Tue, 22 Feb 2022 11:34:12 -0500
Received: from [2a01:111:f400:7e1b::71a] (port=19233
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nMY78-0008Ol-FZ; Tue, 22 Feb 2022 11:34:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbk0wZBLYKSpCbNeeGhJs/JR9Nq/u9WT5eFfGsWcQezlGASzMZWuQe/Mtw/HAUEYsFtrOJk3hpebLBnHtYxkQdJiGFaPDy73syEviwuQBwa92Ii79YxVEmbjQVYxwJnkLXvgnzXXYmXgev7XRpOVG5cAqHB1XZdD4TemnG19yL067COU2cW74RdS2sXg1swdsW9cRLPE97WhH2+WIBmZbw2E8eGng2ZtpoZyBidUwRCT4900Q20Y63IOxBYFtP/33oy0WTJIJEVv3A8ZbX4acHhTPq8bP/lnKXP40sY6Ng5mzSXgUcScvLB5Z9dzTNT5sgNOm9cd4pEgywt373Onzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTfKu3ZaEyX9ZZBwD9+ujS3rgOV4ki2CCtzEps/ZhKg=;
 b=K0Cy2ziDy6+IalCbu+kDoR2Z3ZWABzF6r9XG7NTNv+Hhilzo8VLyPEH092YUb/MhlS2LTG7bVYLPfEx48/iinep9MLeTo0XaqcOQdiU0VNsQdS5+CIa4yIonKL3mMeak7QjyMqAZD6do+Wwk3xkl5ju5yI1uPii+ZRTBjcRpgvW1J35jEG6muio95ndnAGhrPM7hXjAvd+aL0OErPzh6dGTF+ZcU87oMEq3tlM9HTTOrfacwSM/Jq855ouVZKW/zhlHvBk6eD3waM1h8CN3b+EhgrmviT57+BDlv/ELBC3E0de3mzBCWu/EK7XdESVl7DM+j/kxE3f29/7NwsmaeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTfKu3ZaEyX9ZZBwD9+ujS3rgOV4ki2CCtzEps/ZhKg=;
 b=RkuoQsbQ0MGhfPV5NC6aGzYd+vtMp4cH80f5Bjs6NApV0TbOv+fvNT+NE9oDDIAzvhmKmwwmEtw4I8jJANmZFzgDvx2tonFjDzVkSqWewYL6YD+UFMjD3VEWa128ZhOHslrnTU07Q+wSmBLpVkurwMk+fDizNxanEXF7zvNty+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB6PR0801MB1669.eurprd08.prod.outlook.com (2603:10a6:4:30::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 16:18:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 16:18:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 2/4] block: block_dirty_bitmap_merge(): fix error path
Date: Tue, 22 Feb 2022 17:18:31 +0100
Message-Id: <20220222161833.1453641-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
References: <20220222161833.1453641-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0401CA0023.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::33) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a117d63-d556-4c39-e4e0-08d9f61f0295
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1669:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0801MB16699FE299899F43E8C337AEC13B9@DB6PR0801MB1669.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHhb+U3gghGPynf1wNAqcuXRgiW1e4Pm+NPBHqLCudTocer5m5lcuPld4dnw6Y3a9GGzT3v5UjUSxByGqiZxi+ugD8TQvw3JCYoyDRiQMg62nzgwaDDDfOcdoxgOV1D/3zKFOrxVXgkO0LRGslaHcupVVV/YVOELbuKIcJGZWAyesjgL6F8YE+VMJWBbw43G6TvJZu2UDelBOawhATafWxG8bVoqEipREgPL/ae/rfxmOPRhJSE0uyZ0SBK+//UyywxV+aF/bz7S5vj633Vr5UhQnoOgDiDUCOpVAjRjkW+fJmLNnzEvvLmeCLL8YhDixBlEVyV/1UmqwtbXFw4NhFhV4fi0PobXXGcYwK8ztbLaajFQwtMniiue9OhlulhscIn0myOldqayoOTFX8HtL7ABlUJWh9ZDwG2w7016JezMqL1FBS5zuWxo87xl4U5YR7wobVeT3qkFGHYz4hje/LGSN3xxh77ldXNxEJ8ktWwEf1qhbZWUKxox8OO1/ILaidwfYoYC+uLRAf3uKNUyPyTY474/Qh85jvbq+xSQ9dtlAWXuIF5SIU1AurXExNZusMLdGDBP3vWIsjagghm2bHYvtA/xu9x52hHtRHUTdBG0D6mNAFsR5IWuGCbf/M4D1QawolbqnVYOsARRkVS30IVhvC9v/lkrk5WdbfA+cRiQOK5A1j/o8ez+lVToULPqpTMbI4bF2TsveKGSGkGim5c8WXGytUm4UcVyUUfIeBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(86362001)(6666004)(8936002)(52116002)(66946007)(6512007)(66476007)(66556008)(4744005)(8676002)(38100700002)(2906002)(4326008)(38350700002)(107886003)(36756003)(2616005)(26005)(6486002)(186003)(508600001)(83380400001)(1076003)(6916009)(5660300002)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GBz0u9KmE8XpDaa12Jog53PdJO13uXsilaC7FT2PWGqXbA9HO/BjEsJ78qCi?=
 =?us-ascii?Q?gOzspm5jET0IopW6eP7ygUGrxTk9BJJMBCynnfs2Npcc4DTtKLq5Q9GEF/SQ?=
 =?us-ascii?Q?8pnbtbCup+INFErTTgVjt4Pcl76anAefYch07WuUWksXxS8bUsTX+ALmaWfB?=
 =?us-ascii?Q?gPrlUFa6TXvHWY3uPp5L0BiVypmD0xcY32JfPF/D7X5LWM+MtgFSpYwbPW4D?=
 =?us-ascii?Q?2tBttRBY8CbrIR0vmfi/mIdPNeAZVw3ceUos/TiLiPEGbpn2pO9hxfIMk7hU?=
 =?us-ascii?Q?XYeTDTSfIO0Bbeq+90Fixi1Q9NZJ59YvljYsUugKKkIW3wt3n9GeXfPs9mNm?=
 =?us-ascii?Q?vIiK/GYi3igi7mR8VCacztCfBbBEYdSEhWFYFG9aaOUMcnBizutQtEIr6nGS?=
 =?us-ascii?Q?Jqgrtq6Blj1pbfpC5EOojtRTZjrax1vAM+oeET+DFCCP7JyqJakfc2UYiJsI?=
 =?us-ascii?Q?KmuNYcJ22LWyjLBWrpLnl/tJu+74T7xvh7G1vYr2kFUKHf+NFklC0kvn6Jeg?=
 =?us-ascii?Q?BwhOi4CbWGez9BprLbafQSK28sE5TnWnjb/tz8VrK5Z4SYiZQLrr0yNPN7EC?=
 =?us-ascii?Q?d/06Bf/9QbAmh84AyijNlsdJ71nwIoDHSVhlzfBpb5TGuUleqG5nnCyFaqKi?=
 =?us-ascii?Q?F6hdDu9GW1J4u29BSm9BT4EtrrnZ+GZdsU7UDDOBGIY/mg+//5e3L7Vk4PeY?=
 =?us-ascii?Q?/cCkNnefG3L1PYct/D9d3URFNv3IF0cdp8kEtWNVv+9+DTh3G3DOdySHS/PN?=
 =?us-ascii?Q?WndjJhooLKovCtdrhr3Q/Q+rfnZfbL7s7q7jbUDhTh/7Kj17l2t11L9Ta3o1?=
 =?us-ascii?Q?k4kTSOBL1GAhWPkQUlcRfqsCQucRsaZkmFRTVUsw02WWt5L4V33a8VJTxdAb?=
 =?us-ascii?Q?WEPPiKDDxFxCfCUjG4QHmkXBvqgKmeWbq/fgo6sHQaTZU//q920aBIqTpF8+?=
 =?us-ascii?Q?bbB+WH8Fg4uSqKL5NxfPhgq9Ljw54KoXQzecHS+t9JliXB8LpM2gyjv7lHe8?=
 =?us-ascii?Q?1I6skfVm01GxiYZivzYoN6z2fPjxXkiGo/I8YWEYr+kzTHR8sKYgbLY9tJn6?=
 =?us-ascii?Q?rGXpRnw0JQgOxSZeBaNbaYzDcFAtCxfIvKRqVnOB/fWMHcO7Mawkq3O744fx?=
 =?us-ascii?Q?LrEibyxVNblFWSKJacRDPeQjVoSRhX8tuZomEnmMb+5jMKEdFcjE3D926sKo?=
 =?us-ascii?Q?V8Zb2POdflTCm7DmGDecc5WX70v83BBJUrIbFFsIO8lOhUdHHBoSqyk0mfc9?=
 =?us-ascii?Q?qTnoQ8M1JzI+XLwwjy0Ao0HvlXAMBFwsFoGH0dQr3un2YNd4rs7oscmrahAt?=
 =?us-ascii?Q?w6uGc3dR4NuoonPfW2laqFOdrZrT0cuPetWsywH1M31s/q1oV8+oeeH2/eLh?=
 =?us-ascii?Q?ZXINXjyk08a2PdWnyGFdYAN2votbWfJWEndwKfuD1BySVD5yq1huMNn3QDjG?=
 =?us-ascii?Q?f4clDwA8dTRryr+KGO0YaPzdm4ftAgEKXCq/BcvYgJFpfOKAWuGY7b1TPW32?=
 =?us-ascii?Q?gHRjfdrbcMR13am0l3/lMXQfru2PB+ykETrUdCjPdTc262vqMc/rcNM6RrTd?=
 =?us-ascii?Q?wht2rWNCXVk2rO3zRnWTLqoYFPPhbqMX+EaNVWva8NpSI/3Sfbqs7zyfe+4k?=
 =?us-ascii?Q?4SmXBXStyAAqaJ1AhDZc6/2nQDZExfAvCRHKG97g8c2LzIV6pyVp/lEwzwJV?=
 =?us-ascii?Q?K/Tia0sjE6gxsxZuXM1VhEaSND0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a117d63-d556-4c39-e4e0-08d9f61f0295
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:18:50.1650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kl8ZFz5gHrj+LqC7OC/AYgoIPDd3+MZlLmymelyHtEsgI+yaaco7X73dp1nqHlH8+AjAIJANfy4YM+9D6nP+wsfwaNBeBC7ZfRxt8H9WLfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1669
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
success. And still set errp. That's wrong.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 block/monitor/bitmap-qmp-cmds.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 83970b22fa..a94aaa9fb3 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -303,7 +303,10 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     /* Merge into dst; dst is unchanged on failure. */
-    bdrv_merge_dirty_bitmap(dst, anon, backup, errp);
+    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
+        dst = NULL;
+        goto out;
+    }
 
  out:
     bdrv_release_dirty_bitmap(anon);
-- 
2.31.1


