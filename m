Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582574C6B08
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:43:57 +0100 (CET)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeRY-0005qR-AM
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNg-0001zK-9B; Mon, 28 Feb 2022 06:39:56 -0500
Received: from [2a01:111:f400:7e1a::731] (port=24768
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNe-0002Kz-7v; Mon, 28 Feb 2022 06:39:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V13E2gwaQSPX7pFOQqbJupsDx6/oGg0WKcb0DxL7EaRR0ROwas/ALDVKXt0m2xZTd+vTA4tZMfYTPQobFNPGojNSHqdmv9KVAPXdxfhd+0MC2usiYDEPbPopQw7/AD3VuueqwsFoEFiYbo4Fx5zUxeQ2hRM0fvx9BzNWmZnNIejOQgyeK9s9C2r5pzXFBvooLPB7KI1/QUUr7QG6gw2qoE5hukTwmLWMmOuwVHSV6p+Td6zx8Ka6XXjyGWMlqlGC+myp4nZHxyIm3yrGFdCHjqFOv23LRHIuHrTJW16hXbFejbO0iHOHiTsw9vSqf62ZWOCDcaomjTBxi60wYgQzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=JziEfglTRXPXQa50c9JtKdVdNcaQRuVC3mIiLk+gwveSrpxyy02XmgrprhJzs1ZmfD4jyuHmb4h/bslOZboixI0iNy8xxwt3Saj1BwwwWZjHz4j+c4KD22E6AHyZ6LTxTVRMoM+3wlmDGHRC2XkvJq6btWVJCM9ReTX3hh3vXsPydYFInAt7idNTTHeAQEZTgm4dWEoTS00hqOQEaSlP/b9EruH1TOLmlHbh7PytmuYH62GQ5mP54NxUWqgC26QjgHmHYZcFEC6iw7W5swDM5W0HoRy0SDkeCQQcbi8i73JHDroqdPirlu3amdPqplAGsETscyhGVycPVfDSC638FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROBLmUnjTfEeaaULPZCviV08zafu2jajs93fHjc5LNg=;
 b=m2q/hMHYi03dmLLsZf6ww5t6HXDc1OURdGII0j92D3Suq6lJnOivbCJuA0F6CRsYpmPv52rdnoMks4KA4XyXiQHiRd8zD8UmKtf5ilm2Rw15pEYAMKrhaQHtUSqNzIQ+/bY2BwzP4SC3NAXJ1YZagC7unxndh5qy9FA9uT8Cpuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 01/16] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Mon, 28 Feb 2022 12:39:12 +0100
Message-Id: <20220228113927.1852146-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9cbe69-de18-492e-b7e0-08d9faaf0470
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB417288643121A3992359E4B9C1019@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MH96K4esr+sRC33BkAVxfw7OCe3076ieDyp6aJBElrKYaTf+FFX/FIRCdbIm7DJU2j56Akgdy+iW5H41zAGU08fpZptjlLWNF0mJY7I/Ox3kYDaYoOu8Hfm2z1Z2XQaLfNfOVRGVpmwzdhyU5R+hnC0SuFArouug9WhKdDL2DLKNPFov8/JG91ik6Dq9ix4dRl/5K0fpOHxC3halmtBztG7DbyFq951KEu0tblfKdoufDZFpVttj4Wb947+aeNvK7w8TV0A2e4Ni/mhLHMonuXjhKcM7YiuX2p3ZWZwlqrpegk9T8ZrPNF3f6k9htqLaSRD0qCWLmOJXm50mNvZZw/w6h8+Ob4+WamoCgu7SaL4z4gv0eRTfeh0XlGlhidQKJhD+X4pUzQJ1vkpmEwk3LngSBU7+vnn8fqz4Yj+NeKNZ+I9KobodSnILwKxn10O5DnXD1Ktbsm4HcDDmTvJ+Mtd/Omxt85fZPFTNGR0elAhethiRcqqYxmA5rR7wAZTKARddFIvYgDCEmrq6K1grYc4WEEeCczFdfCuwpAne3HJp549S2qNcQ5Xu1dq7oZxs/aalPC/+6BjYuLzZCLEu1dnr4jcFwdzRvt7dAWK0fiN2O9Mxko9Cn3kEB9IJ/pMjUCJ7q7Wxe+xQldV7Z/mA7EKHG0CxKuVyMqvVJyJKz0ujcfrQHEkPV4Nmil3BdmR9AOXX7NyE19Qhc8zWAelbDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(38100700002)(26005)(107886003)(38350700002)(36756003)(2906002)(316002)(8676002)(66556008)(2616005)(186003)(86362001)(66946007)(66476007)(52116002)(6666004)(83380400001)(6916009)(5660300002)(6506007)(508600001)(6486002)(6512007)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZML1ReX1AhZGCus9OrFz+eC/BiCQKDAeiGjqrEeRRM9Fu3cEx7c7NyaqRfok?=
 =?us-ascii?Q?yPp45+wokyiLyOuOG3slpgkW/37exjG79xNJgX7db9LE0zk4PnsuW2Tt6QGb?=
 =?us-ascii?Q?QtAPG6VWPW/W0AUz5X7f44jsiGTYJ0msV4p2blc5YEdv0LlyvfoqjseU5VKm?=
 =?us-ascii?Q?J/I8pFbFAQppA5HgqnTa3XMWeIUzQ1wgb4vtWz1Jskw+AfAbPjBCrHMPsgjZ?=
 =?us-ascii?Q?EiADW/Ls1oYMOuNbv6UKJ9B1nigrf46OaWZf/PUNoD4P1Apz2ZGh1tYXiXmS?=
 =?us-ascii?Q?YGXk9BU4uxpj5b7A4Lz7djxOMlGyl1lLnZSrV4dRBnt5F1x3sD3iD161Iceo?=
 =?us-ascii?Q?ftO4SRULVZLB4zNpPO9YeT4z5MjPKKVCVIoPdg9sC8EGvXI4ceXWBty6Mui2?=
 =?us-ascii?Q?3cDJu3NxOjzDHQM0/ACB4CLRMn0mZPEHWJsR0IWkkdZXD3Uf7cs3zmyvRRMm?=
 =?us-ascii?Q?EZrpivJ6QfcK4ktJtGNyMr6Q4SvDqK8NO4wQULujssk/UrHB9f66Bf0X4gzg?=
 =?us-ascii?Q?/fJ/8g7mYf1m2FK4hFp57SBLdnHM6XcCRx3MXQgeD8CDHVI6A/5K9KVk8QjR?=
 =?us-ascii?Q?mE69W4cD2yuul/nwI6IyjUPMQeOF91EH7QgNk8tC2F6Ty4QJf1JFiV/Uvx8w?=
 =?us-ascii?Q?oaqC8raC5SrHi1U/5l0DbQcOjgLMwrCUo6v5VLnWzRmZNO2+WN1hBxWq/YB8?=
 =?us-ascii?Q?ai0BFpBtm6jrG/CXWhk1tFRrUA5m5jRoA/hsJx9r3A7PxRcAElw2ZITCp9h0?=
 =?us-ascii?Q?LQxAZLFZ8+DVgpmOMwPUCo2e7RoqqMpDfvcwXWytXUgQSdkkDtapcIx9WZjF?=
 =?us-ascii?Q?6VBNrVtxOABcVtER0bzSlE/jy1UkteDVNwESHRCsyt60JL0OzmnmPXOZzfuh?=
 =?us-ascii?Q?Wev+M3c3QXxHgSy+9x0qThNlLajrryq5PzyHp4aQGUMEdKvdidux8b7gGylu?=
 =?us-ascii?Q?laLou9Kbt+F57pJW3THRQVh7LbU+euSuV0iZIJQq+cRslw0h93BG0Oc/tnRq?=
 =?us-ascii?Q?zYaPstm8aiSFD01vaOAVdDU5qNeBx1MUIbJ0Wd2A7wV9c8aVFZ43+QKvH/ga?=
 =?us-ascii?Q?LbVjhYrbuO73asrecXJX9fmJI90lzYerewJjwdnCti++FcYkk5xrc/qbMPWb?=
 =?us-ascii?Q?pL0Zxk0d0fUKMLqnUHFoBT6xf0ENT49VrCBwBi9bM/dDxs0//bj/CregCA+5?=
 =?us-ascii?Q?iV8TRooGA6eEvCQc4OtoNJmLkaJGFWUmHeMkYX50g/KUzYtFvCd8Bs7ML3KX?=
 =?us-ascii?Q?UsL4fzCYDhJlNt2e5MN94k+3lLQPLkliI/WHQ9GcwHla5M2bejUbNsCYxZIs?=
 =?us-ascii?Q?frq5A/oLFLnZD7LxfSjubXCv5jJMHhDtSiY5oTHsphPct8G/y33tZfZPhnLa?=
 =?us-ascii?Q?FsQFCO1Fb6tjKLIWfy9HYudItHB1S6paI+MrLIKquGdgfEMaRrv7eWno0gsF?=
 =?us-ascii?Q?H4p9WEB7HS9FbHQryrHc+2SWWGm3A9bigL8+hpv5EWKpKTHLFyVo2QO1BqlC?=
 =?us-ascii?Q?fw57WsPW8qoa0T/a4N7E3ZL3FsdDWz5j9t9IxICnMu2+yoGGoUcFQD2rSvCd?=
 =?us-ascii?Q?wJBckovReT17P3OzmjPmCprYUQDL/8hLD7Cac4axFm+n3rWJoBjP9cJb/M1n?=
 =?us-ascii?Q?yB5arx/Xdcj1Kj0B/VWYQBTKXa+aA09YycFd5b3P1PXHSgrhTUV4Ey6D4+n/?=
 =?us-ascii?Q?q1Fxbx3TF+LPxENC35RogxPCJsU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9cbe69-de18-492e-b7e0-08d9faaf0470
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:45.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj+ARGdESBhpFdH/Y5y5DNy04dK2WZ7aFEWZCk1szFCr5PlNeGcUy3A3/c23yCb2oe00TNQB56RPDxJfjCsomyeFRL+MTowuKS7XRTYn6PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We are going to complicate bitmap initialization in the further
commit. And in future, backup job will be able to work without filter
(when source is immutable), so we'll need same bitmap initialization in
copy-before-write filter and in backup job. So, it's reasonable to do
it in block-copy.

Note that for now cbw_open() is the only caller of
block_copy_state_new().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-copy.c        | 1 +
 block/copy-before-write.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ce116318b5..abda7a80bd 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -402,6 +402,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..5bdaf0a9d9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,7 +149,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
-    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -177,9 +176,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
-
     return 0;
 }
 
-- 
2.31.1


