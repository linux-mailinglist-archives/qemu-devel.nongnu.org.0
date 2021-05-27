Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059333932D1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:46:46 +0200 (CEST)
Received: from localhost ([::1]:32768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIDc-0005so-W9
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8Y-000842-7i; Thu, 27 May 2021 11:41:30 -0400
Received: from mail-eopbgr70114.outbound.protection.outlook.com
 ([40.107.7.114]:51616 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmI8W-0006YN-F3; Thu, 27 May 2021 11:41:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OONGA4MxyTNmRSkP/jP4cXxulw2Sk27RrAsYeMODeQSq6EPsdP8cvChGMd8vIqxDqMSzYkllhhiGhu5jjf8qoP4oKUgj6Z/HlHTuhOlemdb6G+dEutquOMzxQlG25CQpy0Eo5AmCpjw575EByZ78P7cB8WyY2ft9qoTyfFvnWfkbdmDfBUwys5Riay8QOUERcjHsdRV4L739MAgohR+D3lCgqkptz10etHT3e5914i/XVKK7/RUNy8JSwPvcA39Zw4XJ0pvpXp2SK7KlcO7o6r+k3Dv8c3bf+ZkaSRf86B3oiYZWYUW6voNOOwn3ohw2ZOMoSaF6kDMDLAV+iJ9BAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ExAh/DKXh8TiHA2uB/rDplL+F7OyVxbCm0upA4z5UQ=;
 b=kYkEFHVTtPu7xemHJxrtzVtUfii9lk3WacUFTOzbgyWnzpeHVt0uy/7Q86PbF4S173mkVVWigYelvIs+36/A9hcG9PtgjOkzusuAR/K81P58WbzFipF3ckvdY60bdl0iuFHO1OV0nGsf53TbmhiXSb4Xm2FTEx18erH0mLbdVj/N9eCI0oKiTHEfH1D5jrFyvzqqQkvM9OLmS1wLEcpqjLOMZVoELATGJNqKyWymt07V2ZEOZDeEpM7klfWsJSGovVv1UL0wNpCevR/52HWXIwFwJ6tphRGn9/C8g9ugTdd+trMVIaOQhptQlutw1n/cX4cM/hEmSG6yKLFYj7CTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ExAh/DKXh8TiHA2uB/rDplL+F7OyVxbCm0upA4z5UQ=;
 b=L0+/Br38OdV0QRymkqWlNmBYxwUz8wwVZa/zPBtPsExxr9bbYIRMbpFTPdHvJ2xdhuv1mOFNtYr8ppBCH6U2VnSH5rNB++9ZpKq9mHy0ChImpirT7ly0GHYQiQQdve0fNgu6oC17ejw4z8TvTbYrBvtwOR7iYKNlCAcFTMnGYuo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 15:41:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Thu, 27 May 2021
 15:41:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, codyprime@gmail.com, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v2 3/3] block: drop BlockBackendRootState::read_only
Date: Thu, 27 May 2021 18:40:56 +0300
Message-Id: <20210527154056.70294-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210527154056.70294-1-vsementsov@virtuozzo.com>
References: <20210527154056.70294-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: HE1PR0901CA0043.eurprd09.prod.outlook.com
 (2603:10a6:3:45::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.226) by
 HE1PR0901CA0043.eurprd09.prod.outlook.com (2603:10a6:3:45::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:41:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20bdaf5e-2012-40cd-f08a-08d92125dfc2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB178016007211074F7998D0E2C1239@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxxiOnZ3uKTWjmD/zCCkjl8pcBScBeabXscNHqKwBEMJ0r678xu7HegjqvHg0zmvkmn9QmUO3CDCT+RFmD0pjkooeIWfPAnI2uBCIBflgFiRqr4hGgz5W3SeSVqGSneUAboc39veXR81WB2tklqnN4e156p0nX3QUZczwJFHVpeOLCOAi3lhVXN6TngPpejrakI2aR8yyotTjtW3ekbRk8BgX5tBDWtARTP6tQFzj+gDTgKtcfUE1OZDf439InH/VWKFq2Y8XRHWoezOdJTW/xOVr44/8Z44d5iQwpg05XVD/IILrC0jRl8hepn870XZpgh6oTdWFkPsU31FDiaWQPdaWZi+jDMNaCX4UPH+FRfFvfmareEvbsE7YDC2DLju6egx4hP7Vs92zr/40HQ2Wt/7xu/SPONefaetBn4zNa8QXPrbLnwQpIsHWg4E3T4U1fCGr6kYABUCRuJ26fvjgiILS3OaAGYqFZr7frnBFKuMP2tcDm20Xku3IpUIAhSrmUjcut3+pScNzgIHnlp0pQvsuOIQJLrveTnyD593Muq+w5qq57GO0uZ0deqrD9Qhqvxxvx2VNBzmcYdK5rc6gOZIuD9XL+xOmYoFafV2i5Lqc0Ap3+bCM+uY9S58wIJCK55yx+IswEbha3xXAAamF2NYPAC7LmeNU4NFJ/St18z8h6XTsyIsZrIjgnW3Af/A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(366004)(52116002)(83380400001)(186003)(38350700002)(16526019)(478600001)(4326008)(38100700002)(1076003)(6666004)(316002)(6506007)(86362001)(5660300002)(66476007)(66556008)(956004)(8936002)(2616005)(66946007)(26005)(6486002)(6512007)(2906002)(6916009)(8676002)(36756003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vTfZ0fl1ME6uBUBvsR09I6eFH9m8DTbWsoeVZpPVJ/kkGwLFao6Q2s1j6qY9?=
 =?us-ascii?Q?DPx4j7bye8LgAFUswS2MD+7/6goDvYkqc5XC/fghbV2O0zTqWCWX0tL2Txo1?=
 =?us-ascii?Q?7whrOyZ//01tWWVSP3hm/jVH8DDyoiKylJfNZZDhG98sde8gFNPxCcabuVcr?=
 =?us-ascii?Q?VPzdP+viIwVtZJIYJ4WL6ILkPDl09ObGgY2rLBgN6LPfFwHRnxrYRe+TPew+?=
 =?us-ascii?Q?gmzLAJZMhdsYMZcwSrR2KakCVP8qDszl4L5t8YbBwtWbI08P1QW74Rq6Lb3C?=
 =?us-ascii?Q?jdUsskXo3B8DYLB1PJIA48frpu0OrTS8QmDYz7QRVCMCw5jYvw+or+c8uQEm?=
 =?us-ascii?Q?ITt1k3bHFnQZ9jYA7wXkh48A5agH/WRzZC1Y4mmQ2dlswG5WOfK3+QyS5qTO?=
 =?us-ascii?Q?OBFFB8zm6nxelki/EhW3H+TUhCgN006tV9NzzFhuic6R3Oc11vEDhhMY7wcr?=
 =?us-ascii?Q?DKoGlNnQEU80VcGhYwEvZcEMqet01p3wrd1X2MaAhqcfLpC3sPVOIRLozATc?=
 =?us-ascii?Q?mLRVYA3+18PIYtIiaPvxSVXHf9BnPXGdfKKYJu0/XK7yt+WQFErZSV6ZTC0o?=
 =?us-ascii?Q?WJVkuEVLkpkwQNhOl41T0gyzBtkcOD6OtHgcanzLB8I/WMzP1LKZi3lLw+4x?=
 =?us-ascii?Q?kw+/pQSWKC96ncIV4+aCUBJFxezk5ZzbcsFMJruXis/c2Vv7A4f1T9aEsEDn?=
 =?us-ascii?Q?W6aU6TKgtQxEXgtCPrvxN6ukFEbj61Si1QAeJ54HsRsVs+fMLHpZPXvetAx6?=
 =?us-ascii?Q?XDGbuxl+0P5lqYPf4BByAn0ZsXp/hZ5qVeErlUIv2Zs8Aobol+knvhhbKsoe?=
 =?us-ascii?Q?nF+DJIv06wBijYB35gkKJZaGKbMeffMIpjtso6ihTZg47BzzE7DVJbg6K8oE?=
 =?us-ascii?Q?yuC5jzgA9Kq/+kA/RRhhRWWBjXQPTxnWM7PsqJ0WuJuiRDrBVOEupu22nH/n?=
 =?us-ascii?Q?/H4UsTEhExTWmXLhQsAzlSROm/LBCX98V0NhUFGdaWa0C29YioeuSPhzzsUg?=
 =?us-ascii?Q?uCjYvqllY252YYvwU9GMg2mAZjE/1/J67kfGUdfwvHpLAYeqRuk6qrCnGNWQ?=
 =?us-ascii?Q?zOLr1jmH4D6McPzaB0QEuYBTlO6R35NvniH6NmLZGPL9bumra6R3Y/LrAq9f?=
 =?us-ascii?Q?lS79+7ZWjg06sTTIQd3VMrx17zyjR4RSldYR0kvUeySEhcuQHys0EnsSbB89?=
 =?us-ascii?Q?ry29FpuKOskSafnlKze4PQrny81VIDScxH3ZFne9pvPKk0pkwqM/F/b84m4R?=
 =?us-ascii?Q?hlB7XPVrf37eanPyc0R/52l5g9yGy4x6Rzf57+bijRpEG3xWBiITBh3D1iTa?=
 =?us-ascii?Q?yui3vI3l36YT3TObzidyb8yO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bdaf5e-2012-40cd-f08a-08d92125dfc2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:41:20.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyRHZIyrSAawmDg+sxB1os258ZBjZMzKuEfnWf/uUCNXXDS0tkSTerhQf7SDH7nSuB1BM3Uu9VxRSq3ZaqjRai1z4K4kfPRfAWagDYR6w2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Instead of keeping additional boolean field, let's store the
information in BDRV_O_RDWR bit of BlockBackendRootState::open_flags.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  1 -
 block/block-backend.c     | 10 ++--------
 blockdev.c                |  3 +--
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 09661a134b..057d88b1fc 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1007,7 +1007,6 @@ struct BlockDriverState {
 
 struct BlockBackendRootState {
     int open_flags;
-    bool read_only;
     BlockdevDetectZeroesOptions detect_zeroes;
 };
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 21b834e9df..d1a33a2c8e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1852,7 +1852,7 @@ bool blk_supports_write_perm(BlockBackend *blk)
     if (bs) {
         return !bdrv_is_read_only(bs);
     } else {
-        return !blk->root_state.read_only;
+        return blk->root_state.open_flags & BDRV_O_RDWR;
     }
 }
 
@@ -2269,7 +2269,6 @@ void blk_update_root_state(BlockBackend *blk)
     assert(blk->root);
 
     blk->root_state.open_flags    = blk->root->bs->open_flags;
-    blk->root_state.read_only     = bdrv_is_read_only(blk->root->bs);
     blk->root_state.detect_zeroes = blk->root->bs->detect_zeroes;
 }
 
@@ -2288,12 +2287,7 @@ bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
  */
 int blk_get_open_flags_from_root_state(BlockBackend *blk)
 {
-    int bs_flags;
-
-    bs_flags = blk->root_state.read_only ? 0 : BDRV_O_RDWR;
-    bs_flags |= blk->root_state.open_flags & ~BDRV_O_RDWR;
-
-    return bs_flags;
+    return blk->root_state.open_flags;
 }
 
 BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
diff --git a/blockdev.c b/blockdev.c
index 834c2304a1..f08192deda 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -583,8 +583,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
 
         blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
         blk_rs = blk_get_root_state(blk);
-        blk_rs->open_flags    = bdrv_flags;
-        blk_rs->read_only     = read_only;
+        blk_rs->open_flags    = bdrv_flags | (read_only ? 0 : BDRV_O_RDWR);
         blk_rs->detect_zeroes = detect_zeroes;
 
         qobject_unref(bs_opts);
-- 
2.29.2


