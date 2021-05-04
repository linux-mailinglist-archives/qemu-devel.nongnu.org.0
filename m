Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D889E372842
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:48:23 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrfC-0000gK-VJ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrd0-0007QK-41; Tue, 04 May 2021 05:46:06 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:63329 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcv-0001jr-JM; Tue, 04 May 2021 05:46:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpiAor4gne1R3Oz1QPGnTsEOTYO9ka3i0Jm0X3Zz43aTE5HAoUmxuB6beNllWgwotEasEYu5NhCHIQPFEVFdGB0tpjSGl4LnB1KuFL+Q79/yz9i9sAThJOuaXSSTInBu9x+MyilnsqRBksq+M+f9IfFzxJPyJOIwxnBrbRZf3x2F3HEk+mxr9NM9DjnTRVDgAmM+HNv+Zj8uPlMLtq22yJbYKcBFmnKaRYRhPIaqjtbeZo7PM26LyXVlJo0o2hmxJ+2+uIJuFLIkArjZwHSYlXefe0O7CQI56mikjMHLb9LSQUwBXrSxR7PZbTHSgoKnJqJp2v/TAT5aA0kFZKdg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IrSJAcH+pqt2aZWAHJQINU4Rl6ephvHojeX+7yt+vo=;
 b=P5A9fHKsmptUTdisHHM+ofIKJFKvIRdvuRG6UTCRenEXjKRtiUjOM0Hayu7u56zksSPsWaDi/SyDgRnIlvTJm/83Vx6Wwy79+VB0KHNF27HuwVOzkP91gPJoGuFCwIFkyYr3q8yT+O5lWXdFEQMGD+JP/e+GZKyRamtNS5I+gV6NhiRlwozpateWhqVwA+WEDpjdJz1722BoPrWs5qyHjJvWWM0K7yP8S2d2kNCVlTKBo1db7a+smfdKMdlyM/xHhCMNxsukUEWwgxeI8T+hnO8poTbafOPciBGfzvIMHS0U5QSANvE7830MsFO311czR8St6EvpgLT8HkIVnn+6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IrSJAcH+pqt2aZWAHJQINU4Rl6ephvHojeX+7yt+vo=;
 b=FifmVNFnpONGAssZaFP7bIVtH4mJbtgPpwP5oP74excT4TQIRvZoyYAQ9eivke5zmgJRQnSNXwwl+Inr1BGL6jZooqwYwgDzW3FcPfwE/IU00aKhevUrLlBF13z6P5SEmqikj2sI/J07zErztUIQqt6rQIx9ot6y0t7svgkCOzU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 09:45:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 1/5] block: document child argument of
 bdrv_attach_child_common()
Date: Tue,  4 May 2021 12:45:06 +0300
Message-Id: <20210504094510.25032-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f333c3a-c78d-4375-ee0f-08d90ee157ed
X-MS-TrafficTypeDiagnostic: AS8PR08MB6152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6152CED875B7623D78027C30C15A9@AS8PR08MB6152.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFcv6oDK0zOHwvdCrYcIuTbrVOfKg0nHARyP/kegy0yVtGOeOE++6Iu1VUA35qF5aEr4SOIUrnMYERyZ7h07LVR50tv8/PAP+ZBn+zv24lWWP9nrjC0P2E4sIuFKtphKhyW3FLh1QMC/9Mt9r4DN9Zx8LbhCmQPUlcLyt8jHYRols5NU5kLbkPNDtr29uRzp9A0LrbpLcrHKVC7qdIZWzHiiXEsaOSRyfUaIDQTra2MmqbuGmYtkPBXjH4WwTj5Lo/W9Z1rDOLg7WvzwpdlrqVm3pJc8RxsjNaKRnc7klw9XIL5wRnoGoZygstNlZ8aHwsUjOk0oCQfjT9Hch3Qo0idekthj9/P7bSCaTljM026tu2khpjrH1cVsYn1U6695NYNuxQvysASG02KlAtMfszOGuCLGEM0gCSDoDoVBQASLFNiLRoVESKnT0K2uk8+QSL3BG40ltFZYuSBfiJb13EO0rkEYC3qTTwRFgm+FcNC9RUvpnnRUcKc3HNsKXK61SzkfzArEMnIZ8Gddm0QVSYKtIsmiqHzE1RsSWmFzvHx09pKmMsSSyeQ2GZFwkAUfFkSMxZJAXzNvlPpL3W+tjzR8XbnGnhocwZkOcCn82eI9V7A7aBoh4er4sy+e3I+EW6NcFAbblLFFdT6cwO2MB88SOu97o9yGDHBhzT1L7/TFVWXiIvxkCO2JUY80Mqoy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(396003)(366004)(136003)(6512007)(52116002)(2616005)(4326008)(8936002)(2906002)(86362001)(6506007)(5660300002)(6486002)(38100700002)(38350700002)(316002)(956004)(478600001)(16526019)(186003)(6916009)(8676002)(1076003)(66556008)(6666004)(66476007)(66946007)(83380400001)(36756003)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HoplVySTGy7JOKvz82ZMa06c0/Ak2Fu5tXRX6n5BXoEk4W+rLaWkCa3qcDtE?=
 =?us-ascii?Q?TjTNAcVKn7Ul0cbTWiw4GHjzhtUdJGqOLms6urAT2aNRQsyLwiv3sWiVkoxv?=
 =?us-ascii?Q?1kGtVs7/NqG52+39nxOjuWmAV51mO3Q62LnafeRDbQWmIMj3J+7HQNo97e8N?=
 =?us-ascii?Q?g0vWgiac5HkUSAuKymtsa6QQJRV2FPs+9rGKu2OzIJ6BCgR/UeUfdhGXUn0F?=
 =?us-ascii?Q?1gMMK17UewbEn0yT2+mdNk4f2tF5eiryTGZ4HmsqSrHL5NaeFMXtu/neHMe3?=
 =?us-ascii?Q?vkkCyqYuitM8FzqEd1IT9kbrhoZrLxahq/ugqKgB7TPKu8EH3hM9Y1cAn4dP?=
 =?us-ascii?Q?c0ji2ebCTtr00nZF6PipafLWKkW68Tar9UBsEZSPlF1JJlZNYRv85fYEVVd8?=
 =?us-ascii?Q?peATN1NOMS4A04gW+N7Ju/xP9jpKfJ6DdfjuvZ+0gRVjPBtnQGwgiSrL7gLU?=
 =?us-ascii?Q?0Zr5OkWhheOuvvSE46v4SqjT0EmSlnH7M1IPKCzCgT8TirNSrUVPSqmd6Ftg?=
 =?us-ascii?Q?/r4+c5GG0KPoAHIInPF/6BKwLrf4mlTU7oS6RYGAtQtDeHolYEXNiKWlI+yn?=
 =?us-ascii?Q?VAKchh0qEDcv+neVA/GGkKH8Nl484wHeDQlgEG2p9F+pqJ69h7ogxCm2Fvju?=
 =?us-ascii?Q?qqaML6pzHu4WecLbXHqSlD9fAUW3S9K7hP0UNhBm82afPW3jIOilSxeFnQnB?=
 =?us-ascii?Q?qbSJWB5Pj4Wv6VowBIjXGQRYZB2XZ2C7KsbnpCeSr1iBgVDxWhc7V13szV45?=
 =?us-ascii?Q?Yi82nwLPifW2gmPSIz1GtkGc1G7e4ToLK9phwyf+byRPhQTT6zSsbFNLe99E?=
 =?us-ascii?Q?Z0oEv6H8rms23DOD+tL4mComiNmAXv69hEIvc0faOrbo5rLVmYE+VdspLrIk?=
 =?us-ascii?Q?M8p/2s0He4ZOntVBGHE5bVRcPzk9ozqtre81PMPR5mus05MO25jpTSHWEcug?=
 =?us-ascii?Q?WoPXZXVZ4jDupTYKDWgfXg6R05fQVfOHdvk17fW4ZoxJ9W4h70meleQJHvjQ?=
 =?us-ascii?Q?9n24r95UuYLSVTuOn+ikwoHC0m4umgwzfa+nVB+TkxL0Kog5Cc2GOvctSQkd?=
 =?us-ascii?Q?IJ74bf/vt/+qnx4pHZaN7BSKji0wXx6KkwmC73PIgaL25vwuorSm5ViVVdHa?=
 =?us-ascii?Q?wYcosByqOXoBDN3cV0S7DMIie2MpGEMCS2JCnJgEysj80OZ3q4/wzDP4qt7R?=
 =?us-ascii?Q?o183rsis5e4mXmAEt5ONaDyeRNTeQXrFFTtnD1PS9AqUP8b7gNajrkphEcal?=
 =?us-ascii?Q?8IyCrDYF+MQPefc4R7jG1Xpel75fG3kv5eKePCtMkPeBtrr5k9KtKCaV2pT6?=
 =?us-ascii?Q?k3OZRdlK5wnKoJJY4QpOX7MD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f333c3a-c78d-4375-ee0f-08d90ee157ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:25.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACgWiE2NyiCQ6XQAlJVIB+ylmboIHBl0MiJhePVQKSUdCZUMiiFiV1o+6jQipGXieL+8xaP6AVaRxCMOoQIt2AQ7Rw6paeF/THFIQRhKpYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The logic around **child is not obvious: this reference is used not
only to return resulting child, but also to rollback NULL value on
transaction abort.

So, let's add documentation and some assertions.

While being here, drop extra declaration of bdrv_attach_child_noperm().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 69615fabd1..b9df90d61d 100644
--- a/block.c
+++ b/block.c
@@ -85,14 +85,6 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
-                                    BlockDriverState *child_bs,
-                                    const char *child_name,
-                                    const BdrvChildClass *child_class,
-                                    BdrvChildRole child_role,
-                                    BdrvChild **child,
-                                    Transaction *tran,
-                                    Error **errp);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -2762,6 +2754,12 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Resulting new child is returned through @child.
+ * At start *@child must be NULL.
+ * @child is saved to a new entry of @tran, so that *@child could be reverted to
+ * NULL on abort(). So referenced variable must live at least until transaction
+ * end.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2836,6 +2834,10 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/*
+ * Variable referenced by @child must live at least until transaction end.
+ * (see bdrv_attach_child_common() doc for details)
+ */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2918,7 +2920,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
     if (ret < 0) {
-        assert(child == NULL);
         goto out;
     }
 
@@ -2926,6 +2927,9 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
+
     bdrv_unref(child_bs);
     return child;
 }
@@ -2965,6 +2969,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
+    /* child is unset on failure by bdrv_attach_child_common_abort() */
+    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-- 
2.29.2


