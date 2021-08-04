Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71163E01D9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:22:48 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGr4-0002xB-Iz
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmj-00025S-U7; Wed, 04 Aug 2021 09:18:13 -0400
Received: from mail-eopbgr50129.outbound.protection.outlook.com
 ([40.107.5.129]:62785 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmh-0005RX-6a; Wed, 04 Aug 2021 09:18:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6PAGrvPDxxO03C1fFPe6kmAf04FhuYFK1wuYwf0NIRhnh5XstK3gok8Jtu1asy/VD6vqFGxbQe7aXqjZm6GQBy+Gx3b03+TDMKAYArT0gL86D45D5md6bnscYx4qacaol7bOTzoLcVa1ShYXVYLCrE8FzZ9eziMqM0nZnzhF1p46bbMfcj8Hyg8zWdkJhJoLNUd6DwyIVa0Yt/cy7d2yP019Dkdl3nWEtz66llzTo9ftMbbh4KfRTZK1S9/3cW0s/7Jau+y0UA13dzaU5SS4eTm+d4hjud34uIzF1j3BeYp+MZFJXr/LUzK2Mq83Avftw/ko9XfuNk1nYDa7+ZH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qb4IluokTc+eGVTAZvPY0PeJ5mYjYk161IE4Eso4L4=;
 b=Ax9SfRhl/s5T/w0IxPeFpjUEeMfYUKpWm7eK8PcKY1LO4Pv2vyZDqZ/69yJIWdXSDvJCvemTOEW5Cji2SBJsxV9CLFzYk3DyVlMSF7Ly7p6aeiiNY2QayO/QRQ/oXxJ17iohbt0D2WxSlrY514q5p8Cl1S4X7VCPrFDDSOdFU+ysFvBySRa988ryeapoLjrailrQKk0jmBbfjEr87lAWd9V+qWesK3H6ga7bU+W3rKdTB0uFZ5lEwHUv+8Il1zCWlJeNrUyoK5ax20X5+7bLFie03AnXLSd202koZWiIsTaq1Ubbce5lpkY3sBj5JlbyE731eAnyWqutZCsZ5forhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qb4IluokTc+eGVTAZvPY0PeJ5mYjYk161IE4Eso4L4=;
 b=pbm7B+qx+L72bAOvGXDU9i2QngGIAg103Z+Kq4t5Cz03BJNVpmE8brdp7aAxGd3ukbE4hWiRF1Dc5x4KA0Wnr2C65Q06VesSzeYwIUHNpT3LXORWHMpix4bCAcxUzDMdGuH0RadqLlI/5TSbarbIicq4Z4emsfxGEhWzHSVERgI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 13:18:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 03/11] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Wed,  4 Aug 2021 16:17:42 +0300
Message-Id: <20210804131750.127574-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ce664b-2829-46b3-cb82-08d9574a4c70
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40233BF9386F3337CC617C54C1F19@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:17;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4kDysGSme4FfBWQbNkcYnfiWP24g0drhPKshmUAU4K7rsDpXQM3R2VI+KvgwdW9lgKHelI3SJDu9Qa+VMyJ7P7eq2PJsCwUl5FmVaLzRFtg1HmEoGG8FGxMtnagoVzPf/S/NExZ2YjOgY0cVP/UwX9wlDt0rmFW/9Tf37DoR1OapcZkBFe8MSohBl1Vd6wbVmoCp3xdV6WeA0Aiplv8oxyh0GgOj/RrcbOjEPqS2sdBD48iJSGyreFFynQG5sn/J6XI1n5yqWJ7101B6AEe8WfRS21gwd4zfeNe8RBUQEEvNeS9uKKtWgZXkXFtQMvsUVS29F5yMyH0YZv7+HJXYi2x4jMiIkOk84YhjibKV7pARXTfMSx7OeteonBrzAaUZyVN25HFCc6S3Gk7T32NDBWoXVaS0RFpc56QQN2DsB6UpoPkWarc2QZj8XlHXMQLxC/nN24zuVjisKom+aVDRG8b1pn2bFDw/7gNAKyHikGpEdLnKcUu7g/3D4a5mh8Sr5DaqZpVcdgnx2AghamJl/E89kXSjOOo0Rjaokk1AYK1pdCuKLCGoBK69e7/ABtskA5DUIJGQ58y9jfjh5GcVpwDz59G4c99wfW8V6rNkv3D7ZrTfFYo64MxcMZZcebsX/XrfeO/8H9r6QCqgZ76E/6yX7Uh4gcRfcT4mHe9omcoF9w/d/ccVvuSTUObn4h1Q7naWZ4C8oPlRz+DffIFcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39830400003)(8936002)(38100700002)(6666004)(186003)(38350700002)(6506007)(478600001)(26005)(86362001)(1076003)(6916009)(83380400001)(8676002)(5660300002)(316002)(6486002)(6512007)(66556008)(66946007)(4326008)(66476007)(52116002)(956004)(2616005)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCH2R3UB3DqyBWU1aRL6xoEjcug7QHsodi0EWl/6lDD9uWNYdN4q6Vt4rOrb?=
 =?us-ascii?Q?RKYqphr57uDRG6Dekq7QhPWXN3tVrzeo5cdlBZW+LUPHzHpaIpSAqREPJYbr?=
 =?us-ascii?Q?4+9ynvLOEWV3jw6aihIietr6VD5DvWgaDzUzmd12E1E6dU/W627zxCUrzecp?=
 =?us-ascii?Q?38YeFF1BwiYy5LXlr5lOYUibiv4X2F9GRA3M5C5Shxoed8Hql0VJPZAt+ZYN?=
 =?us-ascii?Q?xnEfIZNI7kBAsW8vwBYyZ69xenGLh/IsfjsA76Sdi9ld75t6KvfBb0jQ1SBT?=
 =?us-ascii?Q?GI/odJ2OcVe01jlOD8AnUjIxzB7YfGCtXmTbsekEns9RzIZPHxxQhYvH0Hug?=
 =?us-ascii?Q?MqZ1X3+VsiQE+BbA2UAoIZEwD2KPjA0rQlQ4+gr0jdM6L/DiXL+ejmOeHyXK?=
 =?us-ascii?Q?u7khEVDkqMFyBk3TCatX3EroQu0vOLjpAyWrpzrJnJ6u9fsJjlcS1dsF/7lP?=
 =?us-ascii?Q?fc6AaoK8rCkkHjVldoSMY4+VAmnkzW4EcgUHb9Jt0xPztL9ciw4BgDEP69wy?=
 =?us-ascii?Q?4jdx4wAHbL4c9ysOtfgM/tYiYzFzd/xyT2qrjPNv38NwrMMMs4djQOxRGl1U?=
 =?us-ascii?Q?7Knv0piekrw9OU9RRkVhrN6lQR/i99/Vw+rbhAk9EmvCrmfBoVNZPwPopHbl?=
 =?us-ascii?Q?Z54kSX16ia4UU1iE8kY4IGBRsEg3eVUgjytwoHBs9Jy1gyDovZVVvd1uWdnv?=
 =?us-ascii?Q?Lg+i8rtYHql3EOgZcOB/03cgGUpQFrIARsf/Ir6kHpkX3LEijrf71REkYGce?=
 =?us-ascii?Q?FhIw28cwOpzoqzzTOEFJXlDwmETxzXICHX0G0d5G3+QtcoEc4RmRB82KGHAV?=
 =?us-ascii?Q?6/p9TebNbTXlouv1U0ZaXUdcd2ksbdZca1TJ9DYK2ZRUh6oHAzIZbuVFlmBk?=
 =?us-ascii?Q?3QbCX/pKungmg2GpyWrDter8UAgDph3ua3pwq/j/sPeAaTm2j2gBcLZl4jfg?=
 =?us-ascii?Q?3hEdmcMhIi/fMJ6cbo8vXkHpj/bbCFSnVjry5V/mmSLfQqZqkooy8U7yl817?=
 =?us-ascii?Q?S1nV3VdYk7XugxFJMoKhyyUTYOqiC+gANPctnf1DYYnaPBpu5psqaYo4NAdx?=
 =?us-ascii?Q?48PZf/39dMBtnpY49m4O9RK0N2fdh1WIdTKVw2hYcbNbYy5+z2RDIwEc49Nm?=
 =?us-ascii?Q?AcLEyc2/Bg4wpddeRZM1PRkxGCt4dtXoCv+sLbcElbO6UUbLE7gnU4pgtX01?=
 =?us-ascii?Q?Ikya6ysZhAfd0swwy4Wzq7DEgEODkhnuLIiMdNE2ToWgCh5f0ibUb4Fnon9L?=
 =?us-ascii?Q?vOmFU3b9XtWfT/1mYc0IQCelq/oqQZV08eA3Vnom70zpXna+sQkD49IxMBnx?=
 =?us-ascii?Q?pvqhi+wbAkrhx5JUeSbi9m5y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ce664b-2829-46b3-cb82-08d9574a4c70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:07.2826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4bOG6q64OGjmYLHbAWX+jY4nogk4XT/7o16ItJdwwrznz1vDVKhXsNhiu63yB8MpZ7rVCEqnU8wz0ffigiapryGJwV78JRZ9zkuKU+fIuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.5.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 +-
 block/block-copy.c         | 16 +++++++++++++---
 block/copy-before-write.c  |  3 ++-
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 9c24e8f38e..7d40bf2ac2 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -26,7 +26,7 @@ typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      bool use_copy_range, bool compress,
-                                     Error **errp);
+                                     BdrvDirtyBitmap *bitmap, Error **errp);
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
                               bool compress);
diff --git a/block/block-copy.c b/block/block-copy.c
index 307045a59f..ec6a39b2ed 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -400,9 +400,10 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     bool use_copy_range,
-                                     bool compress, Error **errp)
+                                     bool use_copy_range, bool compress,
+                                     BdrvDirtyBitmap *bitmap, Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -418,7 +419,16 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index b36ede3186..dbafee1f03 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -169,7 +169,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, NULL,
+                                  errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


