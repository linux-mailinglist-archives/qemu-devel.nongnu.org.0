Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC23E01D2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:20:25 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGop-0004ib-US
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmg-00020K-JH; Wed, 04 Aug 2021 09:18:10 -0400
Received: from mail-eopbgr50129.outbound.protection.outlook.com
 ([40.107.5.129]:62785 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGme-0005RX-IT; Wed, 04 Aug 2021 09:18:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhJkbPIxHxY3mEy2+toavEjezuGoS0cs1ASwfr6/9EPbSoEwBp4EHb0psYLX3j1fAno7OYAKVSZExWsEyXukSPJSLXzjq6Wi3Yq2niZnDnNZymZUx7NaVcLV5jhLoc4XJVaUJot2hD+zygX78az9dSYvUKm5iYE59LkRnbQRooUsVLzIuzvW7pzPUmeWXJ7+ndemWwBmGa1dn0F2niLc5M3jjKhtsRlRRu2XpIaBrszMrIFgmlEUvMB/7NgJqLzJhJhx9WSVX/SpFOEAf5KXI2R5RKfml+OP1qy80y/kjZQWyOql3ex7AwKYZ46rKuPBg6Ha7WVRMXzHziy4lH7sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6bvcerOnbPWlKDTsgN7BVN0lsArdVs+uJd34eSeSxE=;
 b=OTWQsKzl/7eg7lMaNNkpWFk53jksB/P2mPHJBQE7vFKRWoLOrnCN1LwYt9OohDXhBhHlkbPtGfsadqS/jsS54HU475/ZPDmUp3iB6xbzRaOFUH8dUoZdtAH4etbkppp5JtQbCyrT/2+pJRts9xa1Iq+tsYvsH4siA1khsrApdX4YWq4EETy4Mh26XKsZT1Iey1UW5vUeimiPKeMGYFtz3uzaBqPszaBiDNnD5Bd/nnAfyaycmirp9jA/zJl2jgRyskjYtrNaU4H8hRcO9nxT5Ks/5iqjkQQB3WStSvmCBrrvzXu0OkaEYJyORuwv+Jxf0MZyzP9a4oxovvyxVJB+9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6bvcerOnbPWlKDTsgN7BVN0lsArdVs+uJd34eSeSxE=;
 b=szaB1Gt253gbU/ZTYAyO6YBCU22GCP1aswKHF95AMVyYQaDDvL1TlzbZx/GnVdX2Sqstcuy2h5vF4D5gf0+EdeKW7t0EKuaJokvwEjv7KP0MxCe8adM0aQHxFIoWD7RwkwhmmQC2XQMlej1CyHkJhcq1MWmAIBM96fLGqs0uHLA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 13:18:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 01/11] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Wed,  4 Aug 2021 16:17:40 +0300
Message-Id: <20210804131750.127574-2-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec9d7d4-835a-420d-d950-08d9574a4b30
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4023B0C6E6F37BBC9D359605C1F19@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyK1sTf/OBY/j/qWs1w9Ai/PN0dFhKBzZx3gKthotDrI57c+Nv+LVAqEYL2sfX0GPYKEmbU4ufUEuIwTMZ4OtgVDhKc86aQQE8qCve7oFKiWJm8RG3B943sJPQ0abf+vrEQ401U6x6yfQxeLo5WHYIJ5q445AMbjpIVPh95SPXLxnPzdoafccij7IxBDXPL2tblpxUyUtcOVOHYiA4/0wwrfgmmMMIWT1GHLqCXaFygxeKdaL0sWACSwXcfoGTtoa2YilDJFZWKbop+PYAYRlpW3Bf1xCS7XbH5NuMyXwn0orf7Hv7eAvUF2dxBW6rg8De+jsbIsVbA22YOtHKbwZNJ/arsKzdG5bHpx2auwRITI8Vj+smBvensb+X2Sp/aDqORAKA7qeNGHcLBnqc2HWBWLqdT7dgCHagtZhsUuYxR6VSYDcILnlNAn/wPlaT4K4wU7rZi5IgDfj/foXbN7+25wk2/z7lyEWbffPtxjk3LXzneIeoW3HNy4W5HH5PsRum7vlzmf+xhvW2gXVKotQlJ/Zpsl5ecQjAA5bytvR0YUxJJ57oYf7YFyVC60G4/JgNtOvzUvodFDf+I7w8JnKHcFh1YkamW5wcAL0j7kPhlxMqAY/dBVFZjbpQeS48jjRPuBZ4LbakzsEFzzyFd7rKfXfSQk3cxopfr3Q6nPLhN+H+HbaReNlm9PdbF06yyK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39830400003)(8936002)(38100700002)(6666004)(186003)(38350700002)(6506007)(478600001)(26005)(86362001)(1076003)(6916009)(83380400001)(8676002)(5660300002)(316002)(6486002)(6512007)(66556008)(66946007)(4326008)(66476007)(52116002)(956004)(2616005)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gnPSRKYgxMhB8wrmOD33uk87lvEcgmbtGlWP9G9yNypTDB/vXi6drcSfaXqO?=
 =?us-ascii?Q?MjVedPUZgzQJXDiBFLgErLPvQcOulbM0D5uKUD15H1+5bg4h7V0bHQowO8C0?=
 =?us-ascii?Q?IS7qtabk1NYHeImrdxfepg0FMyiNuCUIIQTN+p1Vjt9OW29RSUcX4hCdKmvS?=
 =?us-ascii?Q?sxRN1LzVgO5I/6S/Je4sJFxR++oJsGkOiT9gstz/NowTP55f+g8huepY+XwA?=
 =?us-ascii?Q?i0vEzz+TB/so9XnaHto06lh0wYO1hGcT/S1uAVOvBVlKioK/XkvFfTthJUlz?=
 =?us-ascii?Q?docboGa33vn23j0D2q7huTvp7xPLoX7EyBovQcgbJOWHfE16DlFWe1QqrzGz?=
 =?us-ascii?Q?7z7w9/I2oF+yZlYnMmW9k5n+ploCA9xvRJyPHHhGf2zsMw8/hEK6dTeIaJwF?=
 =?us-ascii?Q?ja7RRXzCNaYkV9acvdHdx4PJIaKfRPvq3r72Tt3s64kVtpRgHDL2T9BI6yuk?=
 =?us-ascii?Q?T8/Lzd2FYW72nq4XrxRbotQZ+toPV6c2Jwb28mlrZrJql//j1OBQ48YH5bAz?=
 =?us-ascii?Q?w4mkTFXay6va6rU/yT06lW/dLiTzNJiAfSqv5nWF1fJDUaDCXBIYMrkakAF+?=
 =?us-ascii?Q?eubSnG+PtyF6zAemm+mM/6Efk7n60bhQcoe9npJApsKlaI65mP/mmgpATR98?=
 =?us-ascii?Q?HHLS4s+thsMRsVzesBFxii9gXBj7tRTetUuncKkNLeexkqHVOoc2khlxnOXr?=
 =?us-ascii?Q?GbPk0ekIntc3U/Mzvq/jUz9K2LdAiXhABR0x2evkhLXkbWChjwCLe/loX7cF?=
 =?us-ascii?Q?3NNJAtqC8x4Ju5497OaOisZa4EIcijegdB5/Woa3BCzlxSifu32T3FswVh7a?=
 =?us-ascii?Q?4XHCM7ovz0UJWj4Qy5fJKq/vqo4eHVjqXSfqKvbMaQzglkwV/41YJVc1YuJQ?=
 =?us-ascii?Q?NbM7JH4zIS9i0DfPB0HgxePBICXy2LMFGvUdyETFnRwYmnjisAvQR2qqh559?=
 =?us-ascii?Q?QgZihTpy3DxNkgXR2JZsEsNxG8/EFlKO4YoLPhqABvHjPB9oJGNGI0gQtlaU?=
 =?us-ascii?Q?dxeGw1PWJqYH26vuwYotcYjF4i4G5wJk+U16KOji5YqcvjmwvAl2E3cXfXnU?=
 =?us-ascii?Q?XC5Yw43kL/PnGroD4D2VHj7YC/by1hUqkOqHBxWws+GOcHg2wYgpNs9aHfkT?=
 =?us-ascii?Q?nDCmghWcSF/bCcAN2MFBuRPdyFaPpPKc4rkqBvZEhifvOH0lBsUEqh5nawde?=
 =?us-ascii?Q?FlCudeAbe8lIyYfWJoR1RfZuhQRgdddH09Yd/EnEhMur3GghiKOpvEbFKYFA?=
 =?us-ascii?Q?w3fHqj0XhCUeLnweRjGLGqSWVwx9SNxnWpZycAAX/aLE77FhkeZMiCRIWcRd?=
 =?us-ascii?Q?afg6tWAIwmTjLGq2FKD5NUBo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec9d7d4-835a-420d-d950-08d9574a4b30
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:05.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQZtHu6Nz4Ez8igEMteVB88uLja7TXeEPPfS6d5fIPem518rEVFa4WjCKGELboJ78W/UACfgnYZzqLNm4h5QIcX8/nBwfdVh6oSfUTp/XR0=
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

We are going to complicate bitmap initialization in the following
commit. And in future, backup job will be able to work without filter
(when source is immutable), so we'll need same bitmap initialization in
copy-before-write filter and in backup job. So, it's reasonable to do
it in block-copy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c        | 1 +
 block/copy-before-write.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 90664ee0ab..307045a59f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -418,6 +418,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     s = g_new(BlockCopyState, 1);
     *s = (BlockCopyState) {
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2cd68b480a..b36ede3186 100644
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


