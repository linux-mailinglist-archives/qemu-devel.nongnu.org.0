Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73D3F9EA6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:21:19 +0200 (CEST)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgTe-0003io-Ad
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR0-0000qT-D9; Fri, 27 Aug 2021 14:18:34 -0400
Received: from mail-eopbgr150114.outbound.protection.outlook.com
 ([40.107.15.114]:15647 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgQy-0006Rv-S2; Fri, 27 Aug 2021 14:18:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfeUfGyTPF0MCHlxtSLXvPg/HW247qx24BQtAn6EqK3aVy+3xLHkPAQm2c21E3EVyyLHZqjktx9+hCneHn9RPrbwYdBKfzL3HDroJ+3DcYQ91VZMLxkmHCQquyszFj9Y7yNFB3/AI+E56a+FeWFODQVlOhO76KH7u6OGRyYRnbtSIEhtGPla+UF0tFkeeYiT3+XQs6vL6ZNy83vwteiDs7q1zG2gei71Hsx/Pte7pnZDbfCM2lsSPzaHCZHJxZxeaj3CJIz+lt8bFTRFBFr7ErJoG+N8hxqJAxN8PYboeCmwFtleivZ3wE5qs1AkZtRiziyp7LjkKt6skKZMyawLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pkt37Sa/W0n39PLCj4OE+z9q2/HGzFYHIU9wxfe1So=;
 b=Cb0ElP81WLeBA8SITPz4WiayVi8KayQSn+CnZoUDScvhFdd1CzJkX7RHAMnp9rL0Hm9LshzAeUIA39haYt6r74cdHMw3TSAWcsAGW5yocQFUYmLtTKYyHzL8zXg/Rr7tO4fFslzv8j0PVroVbSPiEaeawB/DSk7DViIIx9rf4B/tIc9F2d9F9p0G1VukFijt6CUdKni2lgOkNjfwYnsWdsKi6rdKvrgX7PQf9LJvDvVue/XyymHjG4mpc5QcfEUbzjToWjxg2U7NaDFOBgayQqn6iWD2wONF3iG0IjkccxxNLfI3FXGvfvyucOEk+DWvcIRJRMM16T8a+vP17T9Vlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Pkt37Sa/W0n39PLCj4OE+z9q2/HGzFYHIU9wxfe1So=;
 b=qJHN55cHY0y831OJZpR690rw+DNZ+dl07rrph+RYi/DmWg9BAilYGs4OnNwyQip7UCIh5/RrMzV1mNIqtf/7fRqFDUxdtBRWY9sw5risXPO4Wm30+CxMFGmoHHVUUvm9g60zYmTKDAw/hfgErfayLIHEfd/i7/TL6WamOZxEF5Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 18:18:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 01/19] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Fri, 27 Aug 2021 21:17:50 +0300
Message-Id: <20210827181808.311670-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e5dd417-fea6-4c15-7c88-08d969870fb1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870EA7BABDCC66F3E078C31C1C89@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:48;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGuEG0G3rFhupO1J6mtTj+2B+lTQjW/+UJNmzNl89/y1Q7HF+CSH8/hMy/8T/MJE15/shJpP383Q1eZ7npzmCTz9YgEfdcsXyOBOs4PCPExIJKsWI3M/AmIBgx9JjrwOm8NPywE+vz3i3YnN8cSHLEoeN3SUjL5ahCFSx2bOZd6c9krAFaQJX6HtREqTdAvk5EE8JgItBn4DrUjWbbLVsiPl/Sm9dpJKhqJhbWeewvQyzdmnykSoO2Ier13OVfyeXOEVnpv0QgY45tOR9LRmWRC4H+R7bpu/lEzeOM/RD853cx84os9AtSQAsf9PLI/UoJ36mUpixHfbC8SvsjL2KBt89Cg5Z6Wppir0Kc0VnzN/helmTjdaKw+EAWPbP5iqB3RASPpWOoaXSezZSPcbDPlO7WH/Ld2XIYxcd9u/Xgu7L6QV4WQZzKsTvMGWUvcwTkAtrXvDzOpjV18RZCTPigTmT8IO+VwXRRyokOyfUYn3jTJRQ2wSzFuWWsa1I6F0H5q/8OJsaRVb188uPmlZWFFndIy8iZ8srkkSz4c6D9pdEcVDTMw/2YEbzV/H1fKjbpJhdBV+1l5291AoVC2B3xEvyMzhOSTo4Of7nsUoYrfpCPOQkCm8IIwSZndyeumwtytSRgcClf/6TLayoG5JIAXyESeR7W681uOSe8DRlxfogdHGhS7axJX/OfNZ//i8pLuDTPRZeghSXfRT8GD7jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(956004)(5660300002)(36756003)(8936002)(38350700002)(4326008)(6666004)(52116002)(8676002)(83380400001)(6916009)(66946007)(6512007)(6486002)(26005)(86362001)(66556008)(66476007)(186003)(2616005)(2906002)(316002)(1076003)(6506007)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m0K+G2O3QcqyamAKrvE1zd+sJlOie5nK2WNij/OXjQVAVzcT5Bw3lnmjNNJ4?=
 =?us-ascii?Q?5ghAh8AwMwRLilu0btSy+wi4lG/v5cNWf/YiA1owJjYYO6Q9iVfuapXSkgZ2?=
 =?us-ascii?Q?SQ0wFzdf0mTJVMBxjNZaoiYHK1Ovm8zE03eHSvZzg/DgGZ08UojhkWZCde1J?=
 =?us-ascii?Q?zeYqjwhZrdGXtknkUWKPVatRROLVXjDPKpSV/VtHhoT2/J0OLV119aKq6AO8?=
 =?us-ascii?Q?18sJU76W9Ebm/UEZxtboFVyqyLZQML+4CWWlyoH/Mat+r9OuUZM73lvug5xl?=
 =?us-ascii?Q?7k7bGK4TOFxvF58benWjd2TPCIJvbWs71/l9pmIgFEFVcyl7HVumXoxxCnRk?=
 =?us-ascii?Q?CbFu0ENhCSrOLw8q96zQbtvEPDugy0qgL5Sx45A45Wzg779OdXqridE3HMDx?=
 =?us-ascii?Q?9UXBNxBKw821GrudQB8W32/aCiUyVNLUYaNsX/Qnaj/4ymyDCjR8hKCig0F4?=
 =?us-ascii?Q?DY0+fBeMXeFAobUhaZi+Hslmcj287L0KRZv6Tke10JniB05PHMqSmpc4Qivb?=
 =?us-ascii?Q?OtekAau1uJiWixzJtMw9fw1NkEjMJBh+oF+/QaiyvHuocAjXRc2+i3Bjt+ah?=
 =?us-ascii?Q?/cKH/h/WDfKtWum3Q3Ro47CXF1yJ8jB3mryMfWWqh0AitbrysyUc+zpwuOk2?=
 =?us-ascii?Q?aM5FcchqCqFh/uTYKX41SQYyRxrQTrJGwamzbKPwH4tET3MFEblUXaq8Yxdq?=
 =?us-ascii?Q?uBLU8rCdBcCIphb9I8LYs28J0zpL7qrmi26b6jo2P4XN+4kCJwHjWObMhu6N?=
 =?us-ascii?Q?2TtFTJirdA+11MBIh+cpbDBmlm8EAKZoxGpnHfuS4HZABy3UewiZ7n/IiTer?=
 =?us-ascii?Q?6zWn+E1v62sQ5WL4Zg3zp3P9fJp9zQvqFh6JiDSRZf7sRGAyxB5Beo01q7Fi?=
 =?us-ascii?Q?DBoVYWxkxBh3TTVWNPfkoHzx28sVLuPAQRWi9A9rS8BtZ904pqJMdUeAOTM1?=
 =?us-ascii?Q?/T6Zt4/oceXVIjGQkIBb4/OaMtkgUN/fC34SHFmOmIm6TNVSq5IEIVeDx/+l?=
 =?us-ascii?Q?3jniiEirm5DlaHPzYomZknZqUZ2jldoqUIeUZqR5Nk1oVolRJ3Fkwqiej+jx?=
 =?us-ascii?Q?nCilWMdzaY1iJXoe7qF4d4402iblrPSwxy8OoB2Ug5gwt0x9yTy7yvutuSqx?=
 =?us-ascii?Q?tCt13z3n7fn7Wg1T3SxzGpG6TwaR6tHKCOXJLkHdZwcCLrRfswCtoi/3IQ2N?=
 =?us-ascii?Q?HY9v67MrOQK9RaZiXH9qUDaEbn8cebCmqp3cfIuO6RB/+TvErJsgnYaDeG7L?=
 =?us-ascii?Q?80FcL2OiKm8jODqsKgnKKyOWDRXJ+MMJnQ2YoyIyryZZmVsN2FmW6GhcUBAM?=
 =?us-ascii?Q?xigHY1N4VXA/+Eaeac+8vBH/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5dd417-fea6-4c15-7c88-08d969870fb1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:25.6050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XhFxAFm+TB1zIrguTWXBn87ROehG898e0Afy9Yc0NlfN8p2gfVDa/0hhmP0E11IN7YRDQkrjC16ZvuJ0V/UDVuRyE9W0CKcAn8noo9wIiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.15.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We are going to complicate bitmap initialization in the further
commit. And in future, backup job will be able to work without filter
(when source is immutable), so we'll need same bitmap initialization in
copy-before-write filter and in backup job. So, it's reasonable to do
it in block-copy.

Note that for now cbw_open() is the only caller of
block_copy_state_new().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c        | 1 +
 block/copy-before-write.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 37d804ec42..c39cb5fda7 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -401,6 +401,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2a5e57deca..f5551cd15b 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -148,7 +148,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
-    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -176,9 +175,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
-
     return 0;
 }
 
-- 
2.29.2


