Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E633378EA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:13:34 +0100 (CET)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNwL-0007ZH-UE
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2S-0003Z6-AA; Thu, 11 Mar 2021 10:15:50 -0500
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:43129 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKN2N-0001YX-Kl; Thu, 11 Mar 2021 10:15:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR8Zg0yxwQPlaEA72HomLqMFgS90bfyDz/AERLdRoyZHii5Mk6dX6bQ5qAP3v5DcpfDtBLN7eVKHZgVZSavZDG1hRJvYPBI6swPMXAIh32yZQjAA9rQ9llEg+x6MNwbjaJn/W3KSSn8xFrlEOMrovCK8zhTiYCoufgkMJpf0+nXfYMl17D4ozAnW9hBm+2Uh0rdcftlppIkzbCO5QxGZBa09J0A336JWTUT+GG7NK0S0dzHalVgxoK4oPLClGVHn4X8fEZ0sIo6Z1xkhuNyjWO7OdE28CsB2sgUjeWCJju+lOtFkRvMMW2mMOf3Y8m7zQVCu3Nzvj+N3HmQPsJh0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9eV5j8EuIiLtfYerDdH+/iTZ5FMevFgEabQSfzV0q8=;
 b=P/jmVO8daXjXpoq9mgei5sve7uviGmO3sgRHBC3PzCuga1PeLv7vxCFm3xu2jx+agV2kQbmKj5q/YYoZ5GqPdgnKIisjwHTZQH8ut8imW8GP9jKgrt3kHkDsQXW7ihtie94Lir5EIWurocwEKOngElsT8lntWa7IFDFYX6VHLlGpJMcz66cjtc5fym3a9Zxkz9ZmnAjgC6BVyEHny5N+921zXtfmCXnK6tXaJqw/cOdwC4OERrmfjQxT0bBWWF0VigCh7JJLGueAW5O0SjZFZqu+fMeqR1haKv7xjtq5xf4YEQhkGh+gI+aTYv/gl1LGdcLyg74Hct0DuXo1Wiuy7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9eV5j8EuIiLtfYerDdH+/iTZ5FMevFgEabQSfzV0q8=;
 b=Yo89fD8gX7OPqLCakUvOYPQtZw3MMOfGk92G1JKFTrTq1H+NoErVXfCXnx+I6LglXgMKcRmwknkb/kZHcXex1qNrJKQ9V+uN/TmwoE8Ghd0KikgWUfQMgjeS7Rv4RMOpOgHENkI+WMBI6dX+YNn20VsnN8UvNcPbEIA/1InatXw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 15:15:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 15:15:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH 1/3] block/commit: keep reference on commit_top_bs
Date: Thu, 11 Mar 2021 18:15:03 +0300
Message-Id: <20210311151505.206534-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311151505.206534-1-vsementsov@virtuozzo.com>
References: <20210311151505.206534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0247.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0247.eurprd05.prod.outlook.com (2603:10a6:3:fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 15:15:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b2e3e4-3927-4a1b-f6e9-08d8e4a08761
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65514A64E13C92A7677D2353C1909@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5o5BPAdD2DTHYe8gFHWNfLhlWROVYU1H+9yd6oCnHZSR7WG6H9W+oxikGyFNVxnIU9pIc/io0IMedFXVBUTqTtN4DTYq7e+bivwMuPfDTHCuAPRAhK2JTrQcOkoET+CXzIthgKV0yrPXDUGOlmp9tCE3GXyBLgF6gysyh/95q8r+nh2RZodTluUuZemRcbB54snYJgH38cwXqwXzBfvp2TUL3xmQGMdPiKEkuHG9OafQxGzv62Z3xtqo1QT11utdnrisH7Dm52F5NXm/ppBGwAlsXoe6xwtzVGZ2J+ileli6EJFBY84jSIoptexDFCJNQ2fQZFcnWlWy22sw6RqvRSswlebIcrUPcdP840j3dhGz/Qd6ntipCw//pQ0GPbtzg8chhJBckJHa+LiofJNugq3Dd/heOSEqTcAO9Y8yPAcpqY1kEt0CoTJqDUSXQRRU7KLf4RFv1JuizQulVXxfVfekvJEOT66gjwxv/ujYhX1G42GgKeFYRGkY+FPsxnhLmaU/RTwONvYOId5DblWlq6uX81M24c/gEvcrQi9lS1bmBvDSPNiwT+5CuZXeFPcn6zhBpR6ObatVL6xYLZt1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(346002)(396003)(136003)(86362001)(6512007)(956004)(8936002)(2616005)(5660300002)(316002)(6506007)(1076003)(52116002)(83380400001)(69590400012)(6666004)(107886003)(478600001)(6916009)(2906002)(4326008)(26005)(16526019)(186003)(66476007)(66946007)(66556008)(6486002)(36756003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wmslUgHd0vWXQ2/0Q8b1ScLxf7L+53H8piPLvvjNZYOtJ8i/IoxsfWU21CsJ?=
 =?us-ascii?Q?x4gT1NdSUCUotsOCzG9kgFnmwGuInVA/apDu4l0Ubecq0ev6P8Sepic/RoY3?=
 =?us-ascii?Q?nc9jSozp1hBkfu6J2M73qMg44WsKdmn6wBbpIFnDPxFYIbauw1ruwFlVPYj5?=
 =?us-ascii?Q?MOZYMLKTXJWL4a+PSBOFq1uw+rkMHErfudIyN7eGDSpch3dAsMmVn0qeR3J+?=
 =?us-ascii?Q?tji4CNjrvTfE6lV+Eb147C+lfKX+34TuaMhar0qeG88mF87ADcOAC6pgARVQ?=
 =?us-ascii?Q?Jyee2R1FdO8qKxSVl9Vfy0NqnngrKC704sx8IMZs/u7GwUPEiXblXeFwy2SP?=
 =?us-ascii?Q?HAgDLVyk3lP475YCMSQ8TdF1ANV/QhWPBB2y/nvxp5rSNrr7pd7oZsWx4dnl?=
 =?us-ascii?Q?P+9AJJwQQA8iYbHTTRlIIuoNRq0IrvQJwjA3VpB+KKa316f1FkEHiHoyVEOn?=
 =?us-ascii?Q?asjZAqPvg/GhPGTdWd1GFdFPrpQGHtCzeP+wo4MFHzTk8nrVsmC9QniegC2i?=
 =?us-ascii?Q?H4MOiT4YTSFduYuZ0+o5GuWv6Th+jH3HlPstgm3FpRmyNsxW/dmn0f3mc0hR?=
 =?us-ascii?Q?YB6syoj6CPdyaDctLWEc0m1/U6eqhdJDJeyyi/R8QahrSZ7rEVTvk0aMwobL?=
 =?us-ascii?Q?Nom6XwfAK7/o/6unXbO7ab6UWZf8xG3RkcW7xBz3NNHBGQPp7Zj3dh7l7/6R?=
 =?us-ascii?Q?LIhw4ExtAgDMt24CGcGmSoUO/zstZbyF6fOpA0/uGKkeTyXo7fjhhiaCvGbp?=
 =?us-ascii?Q?RhqERDvMV7FH0DiRlv8jVOGHensPOhey6cBGBZSg2sAD1spT7339gaEpUdSX?=
 =?us-ascii?Q?Z368lExTgAZ4qbJBeKahfhK8DFuGGHX8w9uDLNwCzLoAHbR6qKGCP/wT9fwa?=
 =?us-ascii?Q?a3n81NpwdhEgKy+gzaAkS1UIYqEWqCgkeFBki0OhjC9QsaVxmJPNFk78mC2/?=
 =?us-ascii?Q?j9E0k1EscIQWBK3cZc2CR0PV7d0+HrDDGcrDN5wgh39Jis/QuPPP6dmFXAdk?=
 =?us-ascii?Q?WqPZb6odigzcxowl/Gszg+GqoPaCR6gqoFjhWfHV+OtNbba8KranBUHTuFbg?=
 =?us-ascii?Q?QIke2wOpRjSDpZKFS7KJZnSrAFIZEXQGo1lYsZ7BJqhznObIGcQ5+7PmPfvk?=
 =?us-ascii?Q?f6yzyQvvYTlVUOR0teZiGZgHSTr5+sZ12p+GCvtfeeyglTWtHdfzJaMXxruP?=
 =?us-ascii?Q?lojydCTAIwJzgZh8cuB97iUe3Oj/14/364GX2xmQqx//92n7qtl8PjzDsEny?=
 =?us-ascii?Q?BJUxpMergk4BUu5QcqzDUGVOYBjmLtaU22/RDmLwatQRbNY7DGC5+eI5Mu+z?=
 =?us-ascii?Q?Q6wnLe1T6duHxMMYDf0G2g7v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b2e3e4-3927-4a1b-f6e9-08d8e4a08761
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:15:39.2056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+LxFc+aliG3fNdeVpCQKOSn1kO/phi7Qu9/potUHeVxILQePPUjxA4RhNjkAQW2oLQbgVHEoUvaSkBySYkTBsYq1nLqiL384hE6ZMf9k4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Nothing prevent removing of this node during the job. Job needs this
node to be present, so it must keep the reference.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/commit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index dd9ba87349..57f054ad5d 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -71,9 +71,8 @@ static void commit_abort(Job *job)
         bdrv_unfreeze_backing_chain(s->commit_top_bs, s->base_bs);
     }
 
-    /* Make sure commit_top_bs and top stay around until bdrv_replace_node() */
+    /* Make sure top stay around until bdrv_replace_node() */
     bdrv_ref(top_bs);
-    bdrv_ref(s->commit_top_bs);
 
     if (s->base) {
         blk_unref(s->base);
@@ -93,7 +92,6 @@ static void commit_abort(Job *job)
     bdrv_replace_node(s->commit_top_bs, s->commit_top_bs->backing->bs,
                       &error_abort);
 
-    bdrv_unref(s->commit_top_bs);
     bdrv_unref(top_bs);
 }
 
@@ -109,6 +107,7 @@ static void commit_clean(Job *job)
     }
 
     g_free(s->backing_file_str);
+    bdrv_unref(s->commit_top_bs);
     blk_unref(s->top);
 }
 
@@ -317,6 +316,8 @@ void commit_start(const char *job_id, BlockDriverState *bs,
         goto fail;
     }
 
+    bdrv_ref(commit_top_bs);
+
     s->commit_top_bs = commit_top_bs;
 
     /*
@@ -416,6 +417,7 @@ fail:
      * otherwise this would fail because of lack of permissions. */
     if (commit_top_bs) {
         bdrv_replace_node(commit_top_bs, top, &error_abort);
+        bdrv_unref(commit_top_bs);
     }
 }
 
-- 
2.29.2


